
#include <stdio.h>
#include <unistd.h>
#include <stddef.h>
#include <string.h>
#include <time.h>
#define KEY_SIZE 32
extern unsigned totloops, loop0, loop1;
extern unsigned long loop256;
/*
 * GLOBALS.
 */

/*The record separating character. Generally newline*/
char delimiter = '\n';
/*The set of input files*/
FILE* input;
/*The pipe to the program that extracts keys from records*/
int keyextractorpipe[2];
/*Output file where records will be written*/
int outputfd;

typedef struct Key {
    const char key[KEY_SIZE];
} Key;

/*
 * FILE BACKEND
 */
typedef struct FileKey {
    long startOffset;
    int recordSize;
    char keybuf[KEY_SIZE];
} FileKey;

/**
 * Read records from input file and write them in sorted order in the output file.
 * @param inputfd the input file
 * @param delimiter the char that acts as the delimiter string between records
 * @param outputfd the output file 
 */
void sortFile() {
    //Generate key table
    FILE* ktab = fopen("keytable", "w+");

    FileKey k = {0};
    int buf;


}

int sort_main(int argc, char **argv) {
    input = fopen(argv[1], "r");

}

/*
 * Given records
 * Extract keys
 * count buckets and positions
 * tell which buckets are sorted fully
 * which buckets are sorted till what radix
 * 
 * sort phases : 
 * 1)count&index 
 *   requires: iterator over keys, keys of some fixed length and the radix within the key.
 *   optional: actual length of the key? key type like numerical or alnum for short-circuiting options?(maybe not)
 *   output: return an array with bucket counts. 
 *  optional: Also report on which buckets are fully sorted, though you might not know it because you dont have full view of the keys,
 *  Report for each bucket upto what radix the keys are sorted. Normally the caller would specify a radix and know that the 
 *   input is sorted atleast upto the input radix, but the count sort can note that radix beyond the one specified are also sorted. 
 *   This way the next invocation can skip the radix+1 and directly jump to the radix that needs sorting
 * 
 * 2)rearrange : rearranging the keys in memory so they go into correct buckets
 *   requires: the bucket counts for the supplied input range.
 *   rearrange the keys according to the bucket count, buffer the keys when the radix gets used up.
 *   
 *   
 */

#define CLOCK_MONOTONIC 1
#define nanodiff(after,before) ( (before)< (after) ? (after)-(before) : 1000000000L - ((before)-(after)) )

int rsort_lsb(void* base, size_t arraylength, size_t size, char (*getkey)(const void* record, unsigned radix), unsigned radix) {
    unsigned count[256] = {0};
    //First Pass : Count Bucket Sizes; we go backwards
    void *b = base + (arraylength - 1) * size;
    unsigned char key;
    size_t length = arraylength;
    while (length--) {
        key = getkey(b, radix);
        count[key]++;
        b -= size;
    }
    b = base;
    //calculate bucket positions
    unsigned pos[256];
    pos[0] = 0;
    int i;
    for (i = 0; i < 255; i++) {
        pos[i + 1] = pos[i] + count[i];
    }

    //Second Pass : Swap elements in-place into correct buckets
    char tmp[size];
    unsigned numswaps = 0, swapdistance = 0;
    while (b < base + arraylength * size) { //if the first 255 buckets are sorted, then the last one is necessarily sorted
        unsigned char key = getkey(b, radix);
        void *newpos = base + pos[key] * size;
        if (count[key] == 0) {
            //entire bucket is sorted. directly jump to next bucket
            if (key == 255) {
                break;
            }
            b = base + pos[key + 1] * size;
            totloops++;
            continue;
        }
        if (newpos == b) {
            //unbeknownst to us, the record we have encountered is actually where it should be
            b += size;
        } else {
            //key is not in correct position. Swap
            memcpy(tmp, b, size);
            memcpy(b, newpos, size);
            memcpy(newpos, tmp, size);
        }
        count[key]--;
        pos[key]++;
        numswaps++;
        totloops++;
    }
}

int rsort_lsb_copy(void* dest, void* base, size_t arraylength, size_t size, char (*getkey)(const void* record, unsigned radix), unsigned radix) {
    unsigned count[256] = {0};
    //First Pass : Count Bucket Sizes
    void *b = base;
    size_t length = arraylength;
    unsigned char key;
    //    struct timespec before, after;
    //    clock_gettime(CLOCK_MONOTONIC, &before);
    while (length--) {
        key = getkey(b, radix);
        count[key]++;
        b += size;
    }
    //    clock_gettime(CLOCK_MONOTONIC, &after);
    //    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);
    //    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);
    //    printf("Count took   %2lus %11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));

    //calculate bucket positions
    unsigned pos[256];
    pos[0] = 0;
    int i;
    for (i = 0; i < 255; i++) {
        pos[i + 1] = pos[i] + count[i];
    }

    //Second Pass : Copy elements into correct buckets in dest
    //we go from in-order to maintain stability
    b = base;
    //    clock_gettime(CLOCK_MONOTONIC, &before);
    while (arraylength--) {
        key = getkey(b, radix);
        void *newpos = dest + pos[key] * size;
        memcpy(newpos, b, size);
        count[key]--;
        pos[key]++;
        b += size;

    }
    //    clock_gettime(CLOCK_MONOTONIC, &after);
    //    printf("shuffle took %2lus %11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));
    //    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);
    //    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);

}

/*
 * Count should be zero initialized and have length 256
 */
int rsort_msb(void* base, size_t arraylength, size_t size, char (*getkey)(const void*record, unsigned radix), unsigned msdbytes, unsigned count[]) {
    //First Pass : Count Bucket Sizes
    void *b = base;
    size_t length = arraylength;
    while (length--) {
        unsigned char key = getkey(b, msdbytes);
        count[key]++;
        b += size;
    }
    //calculate bucket positions
    unsigned pos[256];
    pos[0] = 0;
    int i;
    for (i = 0; i < 255; i++) {
        pos[i + 1] = pos[i] + count[i];
    }
    //Second Pass : Swap elements in-place into correct buckets
    char tmp[size]; //for swapping

    unsigned numswaps = 0, loops = 0;
    /* We proceed sequentially through the array. A record encountered is swapped
     * into its correct location, bringing the previous occupant record now into
     * our consideration. Same is repeated for this record too until we encounter
     * record which is in its correct position. In this case we advance forward in
     * the array.
     * Previously we would check the element key to know whether it is in its correct
     * position. But in the worst case, the whole array could be sorted on the first 
     * location and we would traverse the remaining sorted array to check whether it
     * is sorted. But we already have that information using the counts array.
     * We thus advance through the array skipping sorted sections using counts and pos.
     * UPDATE: jumping on counts has actually made the code slower, tested on random numbers
     * from size 100 to 2M. The instruction count has increased despite the reduced key calls.
     * Branch prediction misses have also increased.
     * Contrary to our assumption, what has happened is that our loop over N records is
     * replaced with <N but >= 255 loop. So as we recurse deeper the value of N drastically reduces
     * so N<<256. 
     */
    b = base;
    //    void* lastBucketStart = base + pos[lastNonZeroBucket] * size;
    //    printf("pos[%d]=%u \n", lastNonZeroBucket,pos[lastNonZeroBucket]);
    while (b < base + arraylength * size) {
        unsigned char key = getkey(b, msdbytes);
        void *newpos = base + pos[key] * size;
        if (count[key] == 0) {
            //entire bucket is sorted. directly jump to next bucket
            if (key == 255) {
                break;
            }
            b = base + pos[key + 1] * size;
            loops++;
            continue;
        }
        if (newpos == b) {
            //unbeknownst to us, the record we have encountered is actually where it should be
            b += size;
        } else {
            //key is not in correct position. Swap
            memcpy(tmp, b, size);
            memcpy(b, newpos, size);
            memcpy(newpos, tmp, size);
        }
        count[key]--;
        pos[key]++;
        numswaps++;
        //            numswaps++;
        //            swapdistance += (newpos > b ? newpos - b : b - newpos);

        //        printInts(base, arraylength);
        loops++;
    }
    totloops += loops;
    //    printf("%u count--, %u loops for %lu numbers\n", numswaps, loops,arraylength);
    //    clock_gettime(CLOCK_MONOTONIC, &after);
    //    printf("%u swaps, %lu distance, %lu ns\n", numswaps, swapdistance / size, nanodiff(after.tv_nsec, before.tv_nsec));
    //    printInts(base,length);
    if (msdbytes == 0) {
        return 0; //we have finished all radixes
    }
    msdbytes--;
    unsigned counti = arraylength;
    loops = 0;
    for (i = 255; i >= 0; i--) {
        counti = counti - pos[i];
        if (counti == 0) {
            loop0++;
        } else if (counti == 1) {
            loop1++;
        } else if (counti == 2) { //compare and swap
            unsigned radix = msdbytes;
            void *a = base + pos[i] * size;
            do {
                unsigned char akey = getkey(a, radix);
                unsigned char bkey = getkey(a + size, radix);
                if (akey > bkey) {
                    //swap and return
                    memcpy(tmp, a, size);
                    memcpy(a, a + size, size);
                    memcpy(a + size, tmp, size);
                    break;
                }
            } while (radix--);
        } else {
//            printf("RADIX %u : BUCKET %3u : COUNT %4u\n", msdbytes - 1, i, counti);
            loop256++;
            rsort_msb(base + pos[i] * size, counti, size, getkey, msdbytes, count);
        }
        counti = pos[i];
    }

}

int rsort_msb16(void* base, size_t arraylength, size_t size, char (*getkey)(const void*record, unsigned radix), unsigned msdbytes, unsigned count[]) {
    //First Pass : Count Bucket Sizes
    void *b = base;
    size_t length = arraylength;
    while (length--) {
        unsigned char key = getkey(b, msdbytes / 2);
        if (msdbytes & 1) key = key >> 4; //take upper 4 bits for odd msdbytes
        key = key & 0xF;
        count[key]++;
        b += size;
    }
    //calculate bucket positions
    unsigned pos[16];
    pos[0] = 0;
    int i;
    for (i = 0; i < 15; i++) {
        pos[i + 1] = pos[i] + count[i];
    }
    //Second Pass : Swap elements in-place into correct buckets
    char tmp[size];

    unsigned numswaps = 0, loops = 0;
    /* We proceed sequentially through the array. A record encountered is swapped
     * into its correct location, bringing the previous occupant record now into
     * our consideration. Same is repeated for this record too until we encounter
     * record which is in its correct position. In this case we advance forward in
     * the array.
     * Previously we would check the element key to know whether it is in its correct
     * position. But in the worst case, the whole array could be sorted on the first 
     * location and we would traverse the remaining sorted array to check whether it
     * is sorted. But we already have that information using the counts array.
     * We thus advance through the array skipping sorted sections using counts and pos.
     * UPDATE: jumping on counts has actually made the code slower, tested on random numbers
     * from size 100 to 2M. The instruction count has increased despite the reduced key calls.
     * Branch prediction misses have also increased.
     * Contrary to our assumption, what has happened is that our loop over N records is
     * replaced with <N but >= 255 loop. So as we recurse deeper the value of N drastically reduces
     * so N<<256. 
     */
    b = base;
    //    void* lastBucketStart = base + pos[lastNonZeroBucket] * size;
    //    printf("pos[%d]=%u \n", lastNonZeroBucket,pos[lastNonZeroBucket]);
    while (b < base + arraylength * size) {
        unsigned char key = getkey(b, msdbytes);
        if (key & 1) {
            key >>= 4;
        }
        key &= 0xF;
        void *newpos = base + pos[key] * size;
        if (count[key] == 0) {
            //entire bucket is sorted. directly jump to next bucket
            if (key == 15) {
                break;
            }
            b = base + pos[key + 1] * size;
            loops++;
            continue;
        }
        if (newpos == b) {
            //unbeknownst to us, the record we have encountered is actually where it should be
            b += size;
        } else {
            //key is not in correct position. Swap
            memcpy(tmp, b, size);
            memcpy(b, newpos, size);
            memcpy(newpos, tmp, size);
        }
        count[key]--;
        pos[key]++;
        numswaps++;
        //            numswaps++;
        //            swapdistance += (newpos > b ? newpos - b : b - newpos);

        //        printInts(base, arraylength);
        loops++;
    }
    totloops += loops;
    //    printf("%u count--, %u loops for %lu numbers\n", numswaps, loops,arraylength);
    //    clock_gettime(CLOCK_MONOTONIC, &after);
    //    printf("%u swaps, %lu distance, %lu ns\n", numswaps, swapdistance / size, nanodiff(after.tv_nsec, before.tv_nsec));
    //    printInts(base,length);
    if (msdbytes == 0) {
        return;
    }
    msdbytes--;
    unsigned counti = arraylength;
    loops = 0;
    for (i = 15; i >= 0; i--) {
        counti = counti - pos[i];
        if (counti == 0) {
            loop0++;
        } else if (counti == 1) {
            loop1++;
        } else
            if (1) {
            if (counti == 2) {
                unsigned radix = msdbytes;
                void *a = base + pos[i] * size;
                do {
                    unsigned char akey = getkey(a, radix);
                    unsigned char bkey = getkey(a + size, radix);
                    if (msdbytes & 1) {
                        akey >>= 4;
                        bkey >>= 4;
                    }
                    akey &= 0xF;
                    bkey &= 0xF;
                    if (akey > bkey) {
                        //swap and return
                        memcpy(tmp, a, size);
                        memcpy(a, a + size, size);
                        memcpy(a + size, tmp, size);
                        break;
                    }
                } while (radix--);
            } else {
                //                printf("RADIX %u : BUCKET %3u : COUNT %4u\n", msdbytes - 1, i, counti);
                rsort_msb16(base + pos[i] * size, counti, size, getkey, msdbytes, count);
            }
            loop256++;
        }
        counti = pos[i];
    }

}
