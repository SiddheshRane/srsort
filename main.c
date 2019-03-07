
/* 
 * File:   main.c
 * Author: Siddhesh Rane 
 *
 * Created on 10 June, 2018, 5:26 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <locale.h>
#include <time.h>
#include <string.h>
#include "timsort/timsort.h"

/*
 * 
 */
unsigned long keycalls = 0;

unsigned char intkey(void *record, unsigned radix) {
    unsigned long i = (unsigned long) (*(unsigned int*) record);
    unsigned char c = (unsigned char) (i >> (radix * 8u));
    keycalls++;
    return c;
}

/**
 * Returns 2 bytes of the given integer starting from byte number byteindex in 
 * the source integer.
 * @param record a pointer to an integer
 * @param byteindex most significant bit is 3, least is 0
 * @return 
 */
unsigned short wordkey(void *record, unsigned byteindex) {
    unsigned int i = *(int*) record;
    return i << (byteindex * 8);
}

void printInts(int *arr, size_t size) {
    printf("[ ");
    while (size--) {
        printf("%d ", *arr);
        arr++;
    }
    printf("]\n");
}

int* randomInts(size_t length) {
    srandom(1789);
    int* ints = malloc(sizeof (int) * length);
    int *i = ints;
    while (length--) {
        *i = random() & 0xffffffff;
        i++;
    }
    return ints;
}

#define TYPE int
unsigned long compares = 0;

static int compare(const void *a, const void *b) {
    const TYPE da = *((const TYPE *) a);
    const TYPE db = *((const TYPE *) b);
    compares++;
    return (da < db) ? -1 : (da == db) ? 0 : 1;
}

#define timeit(sortname, sortcall) \
    clock_gettime(CLOCK_MONOTONIC, &before);\
    sortcall;\
    clock_gettime(CLOCK_MONOTONIC, &after);\
    printf(sortname "   took %2lus %'11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));\
    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);\
    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);\
    printf("Sorted: %s\n", isSorted(larger, length) ? "YES" : "NO"); \
    
//#define timeit(sortname, sortcall) {sortcall;}


unsigned selfcalls = 0, counts = 0, poscalc = 0;
unsigned long shuffles = 0;

int isSorted(int* list, int size) {
    int i;
    for (i = 1; i < size; i++) {
        if (list[i] < list[i - 1]) {
            printf("%x > %x\n", list[i - 1], list[i]);
            return 0;
        }
    }
    return 1; //sorted
}

static void sortFunctionTest(char sort, size_t length) {
    int *larger = randomInts(length);
    //    int *dest = malloc(sizeof (int)*length);
    //            printInts(larger, (length < 20 ? length : 20));

    #define CLOCK_MONOTONIC 1
    #define nanodiff(after,before) ( (before)< (after) ? (after)-(before) : 1000000000L - ((before)-(after)) )
    struct timespec before, after;

    switch (sort) {
        case 't':
            timeit("TIM", timsort(larger, length, sizeof (int), compare))
            printf("compares: %'lu\n", compares);
            break;
        case 'r':
            timeit("SID", unsigned count[256] = {0}; rsort_msb(larger, length, sizeof (int), intkey, 3, count))
            printf("keycalls: %'lu loops: %u\n", keycalls, selfcalls);
            printf("counts: %u poscalcs: %u 0+1: %u shuffles: %u\n", counts, poscalc, counts + poscalc, shuffles);

            break;
        case 's':
            timeit("siD", rsort(larger, sizeof (int), length, intkey, 4))
            printf("keycalls: %'lu loops: %u\n", keycalls, selfcalls);
            printf("counts: %u poscalcs: %u 0+1: %u shuffles: %u\n", counts, poscalc, counts + poscalc, shuffles);
            break;
        case 'x':
            timeit("SID", unsigned count16[16] = {0}; rsort_msb16(larger, length, sizeof (int), intkey, 7, count16))
            printf("keycalls: %'lu loops: %u\n", keycalls, selfcalls);
            printf("counts: %u poscalcs: %u 0+1: %u shufflesx   : %u\n", counts, poscalc, counts + poscalc, shuffles);
            break;
        case 'q':
            timeit("QCK", qsort(larger, length, sizeof (int), compare))
            printf("compares: %'lu\n", compares);
            break;
        case 'l':
            timeit("LSB",{
                rsort_lsb(larger, length, sizeof (int), intkey, 0);
                rsort_lsb(larger, length, sizeof (int), intkey, 1);
                rsort_lsb(larger, length, sizeof (int), intkey, 2);
                rsort_lsb(larger, length, sizeof (int), intkey, 3);
            });
            printf("keycalls: %'lu loops: %u\n", keycalls, selfcalls);

    }
    free(larger);
}

static void littleendiannesstest() {
    char pattern[] = "%sC";
    int buf = 0xaabbccdd;
    printf("buf in hex: %x\n", buf);
    char *c2buf = (char*) &buf;
    printf("char[0] : %x\n", c2buf[0]);
    printf("char[1] : %x\n", c2buf[1]);
    printf("char[2] : %x\n", c2buf[2]);
    printf("char[3] : %x\n", c2buf[3]);
    printf("intkey[0] : %x\n", intkey(&buf, 0));
    printf("intkey[1] : %x\n", intkey(&buf, 1));
    printf("intkey[2] : %x\n", intkey(&buf, 2));
    printf("intkey[3] : %x\n", intkey(&buf, 3));
    printf("intkey[4] : %x\n", intkey(&buf, 4));
    //    sort_main(argc, argv);

    unsigned char limit = 129;
    char d = 'D';
    char charr[4] = {'o', 'n', 'k', 0};
    printf("char limit:%d, hex:%x, charr[limit]=%c\n", limit, limit, charr[limit]);
}

typedef struct ps256 {
    //powerset 256: contains 256 bits to indicate presence
    unsigned long b[4];
} ps256;

static void ps256CorrectnessTest() {
    ps256 ps = {0};
    int i;
    //        printf("num set | set bits\n");
    //        for (i = 0; i < 256; i++) {
    //            setbit(&ps, i);
    //            printf("%3d %3d | ", i, getnextset(&ps, i));
    //            print256(&ps);
    //        }
    //        printf("--- --- | \n");
    //        memset(&ps, 0, sizeof(ps));
    //        for (i = 255; i >= 0 ; i--) {
    //            setbit(&ps, i);
    //            printf("%3d %3d | ", i, getnextset(&ps, i));
    //            print256(&ps);
    //        }
    ps256 psrand = {0x1, 0x2, 0x3, 0x4};
    int nex = 0;

    print256(&psrand);
    while ((nex = getnextset(&psrand, nex)) != -1) {
        printf("%d ", nex);
        print256(&psrand);

    }

}

static ps256 p = {0};

static void ps256PerformanceTest(size_t length, int*base) {
    ps256 *ps = &p;
    unsigned pos[256];
    unsigned count[256] = {0};
    int *b = base;
    size_t size = 4;
    while (b < base + length * size) {
        unsigned char key = *b & 0xFF;
        ;
        count[key]++;
        setbit(ps, key);
        b += size;
    }
    int nextset = getnextset(ps, 0);
    int lastpos = 0;
    int lastcount = 0;
    while (nextset != -1) {
        poscalc++;
        pos[nextset] = lastpos + lastcount;
        lastcount = count[nextset];
        lastpos = pos[nextset];
        nextset = getnextset(ps, nextset);
    }
    printf("%d", lastpos);
}

//This is meant as a reference to calculate overhead of ps256

static void loop256PerformanceTest(size_t length, int* base) {
    int *b = base;
    int size = 4;
    unsigned count[256] = {0};
    while (length--) {
        unsigned char key = *b & 0xFF;
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
    printf("%d", pos[i - 1]);
}

int main(int argc, char** argv) {
    //    littleendiannesstest();return 0;
    //        ps256CorrectnessTest();
    setlocale(LC_ALL, "");
    char sorttype = 's';
    size_t length = 328;
    if (argc > 1) {
        sorttype = argv[1][0];
    }
    if (argc > 2) {
        length = atol(argv[2]);
    }
    int *base = randomInts(length);
    int i;
    switch (sorttype) {
        case 'p':
            for (i = 0; i < 100; i++) {
                ps256PerformanceTest(length, base);
            }
            return 0;
        case '6':
            for (i = 0; i < 100; i++) {
                loop256PerformanceTest(length, base);
            }

            return 0;
    }
    sortFunctionTest(sorttype, length);
    //    rsort_lsb_copy(sorted, arr, sizeof (arr) / sizeof (arr[0]), sizeof (arr[0]), intkey);
    //    printInts(sorted, sizeof (arr) / sizeof (arr[0]));
    return (EXIT_SUCCESS);
}

