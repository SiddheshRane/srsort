
#include <stdio.h>
#include <unistd.h>
#include <stddef.h>
#include <string.h>
#include <time.h>
#define KEY_SIZE 32

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
    //First Pass : Count Bucket Sizes
    void *b = base;
    unsigned char key;
    struct timespec before, after;
    clock_gettime(CLOCK_MONOTONIC, &before);
    while (arraylength--) {
        key = getkey(b, radix);
        count[key]++;
        b += size;
    }
    clock_gettime(CLOCK_MONOTONIC, &after);
    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);
    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);
    printf("Count took   %2lus %11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));

    b -= size;
    //calculate bucket positions
    unsigned pos[256];
    pos[0] = 0;
    int i;
    for (i = 0; i < 255; i++) {
        pos[i + 1] = pos[i] + count[i];
    }

    //Second Pass : Swap elements in-place into correct buckets
    char tmp[size];
    clock_gettime(CLOCK_MONOTONIC, &before);

    unsigned numswaps = 0, swapdistance = 0;
    //we go backwards because the last element was most recently accessed so it might be in cache.
    while (b > base) {
        key = getkey(b, radix);
        if (count[key]) {
            //key is not in correct position. Swap
            void *newpos = base + pos[key] * size;
            memcpy(tmp, b, size);
            memcpy(b, newpos, size);
            memcpy(newpos, tmp, size);
            count[key]--;
            pos[key]++;
            numswaps++;
            swapdistance += (newpos > b ? newpos - b : b - newpos);
        } else {
            //seems this bucket is sorted. Move up
            b -= size;
        }
    }
    clock_gettime(CLOCK_MONOTONIC, &after);
    printf("shuffle took %2lus %11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));
    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);
    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);
    printf("%u swaps, %u distance\n", numswaps, swapdistance / size);
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

int rsort_msb(void* base, size_t arraylength, size_t size, char (*getkey)(const void*record, unsigned radix), unsigned msdbytes) {
    unsigned count[256] = {0};
    //First Pass : Count Bucket Sizes
    void *b = base;
    size_t length = arraylength;
    unsigned char key;
    struct timespec before, after;
    //    clock_gettime(CLOCK_MONOTONIC, &before);
    while (arraylength--) {
        key = getkey(b, msdbytes);
        count[key]++;
        b += size;
    }
    b -= size;
    //calculate bucket positions
    unsigned pos[256];
    unsigned constCount[256];
    pos[0] = 0;
    constCount[0] = count[0];
    int i;
    for (i = 0; i < 255; i++) {
        pos[i + 1] = pos[i] + count[i];
        constCount[i + 1] = count[i + 1];
    }
    //Second Pass : Swap elements in-place into correct buckets
    char tmp[size];

    unsigned numswaps = 0, swapdistance = 0;
    //we go backwards because the last element was most recently accessed so it might be in cache.
    //    while (b > base) {
    //        key = getkey(b, msdbytes);
    //        void *newpos = base + pos[key] * size;
    //        if (count[key]) {
    //            //key is not in correct position. Swap
    //            memcpy(tmp, b, size);
    //            memcpy(b, newpos, size);
    //            memcpy(newpos, tmp, size);
    //            count[key]--;
    //            pos[key]++;
    //            numswaps++;
    //            swapdistance += (newpos > b ? newpos - b : b - newpos);
    //        } else {
    //            //seems this bucket is sorted. Move up
    //            b -= size;
    //        }
    //    }
    b = base;
    while (b < base + length) {
        key = getkey(b, msdbytes);
        void *newpos = base + pos[key] * size;

        if (count[key] == 0) {
            //seems this bucket is sorted. Move up
            b += size;
        } else if (newpos == b) {
            count[key]--;
            b += size;
        } else {
            //key is not in correct position. Swap
            memcpy(tmp, b, size);
            memcpy(b, newpos, size);
            memcpy(newpos, tmp, size);
            count[key]--;
            pos[key]++;
            numswaps++;
            swapdistance += (newpos > b ? newpos - b : b - newpos);
        }
    }
    //    clock_gettime(CLOCK_MONOTONIC, &after);
    //    printf("%u swaps, %lu distance, %lu ns\n", numswaps, swapdistance / size, nanodiff(after.tv_nsec, before.tv_nsec));
    //    printInts(base,length);
    if (msdbytes == 0) {
        return;
    }
    unsigned position = 0;
    for (i = 0; i < 256; i++) {
        if (constCount[i] > 1) {
//            printf("RADIX %u : BUCKET %3d : COUNT %4d\n", msdbytes - 1, i, constCount[i]);
            rsort_msb(base + position*size, constCount[i], size, getkey, msdbytes - 1);
        }
        position += constCount[i];
    }


}
