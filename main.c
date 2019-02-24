
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
    int* i = (int*) record;
    unsigned char c = (unsigned char) (*i >> radix * 8);
    keycalls++;
    return c;
}

void printInts(int *arr, size_t size) {
    printf("[ ");
    while (size--) {
        printf("%04x ", *arr);
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
    

unsigned totloops = 0, loop0 = 0, loop1 = 0;
unsigned long loop256 = 0;

int isSorted(int* list, int size) {
    int i;
    for (i = 1; i < size; i++) {
        if (list[i] < list[i - 1]) {
            return 0;
        }
    }
    return 1; //sorted
}

static void memaccesstest(char sort, size_t length) {
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
            printf("keycalls: %'lu loops: %u\n", keycalls, totloops);
            printf("loop0: %u loop1: %u 0+1: %u loop256: %u\n", loop0, loop1, loop0 + loop1, loop256);
            break;
        case 'x':
            timeit("SID", unsigned count16[16] = {0}; rsort_msb16(larger, length, sizeof (int), intkey, 7, count16))
            printf("keycalls: %'lu loops: %u\n", keycalls, totloops);
            printf("loop0: %u loop1: %u 0+1: %u loop256: %u\n", loop0, loop1, loop0 + loop1, loop256);
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
            printf("keycalls: %'lu loops: %u\n", keycalls, totloops);

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
    printf("intkey[0] : %x\n", intkey(&buf, 1));
    printf("intkey[0] : %x\n", intkey(&buf, 2));
    printf("intkey[0] : %x\n", intkey(&buf, 3));
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

static void ps256test() {
    ps256 ps = {0};
    int i;
    printf("num set | set bits\n");
    for (i = 0; i < 256; i++) {
        setbit(&ps, i);
        printf("%3d %3d | ", i, numset(&ps));
        print256(&ps);
    }
    printf("--- --- | \n");
    memset(&ps, 0, sizeof(ps));
    for (i = 255; i >= 0 ; i--) {
        setbit(&ps, i);
        printf("%3d %3d | ", i, getnextset(&ps, 0));
        print256(&ps);
    }
}

int main(int argc, char** argv) {
    //    littleendiannesstest();
    ps256test(); fflush(stdout); return 0;
    setlocale(LC_ALL, "");
    char sorttype = 'r';
    size_t length = 128.;
    if (argc > 1) {
        sorttype = argv[1][0];
    }
    if (argc > 2) {
        length = atol(argv[2]);
    }

    memaccesstest(sorttype, length);
    //    rsort_lsb_copy(sorted, arr, sizeof (arr) / sizeof (arr[0]), sizeof (arr[0]), intkey);
    //    printInts(sorted, sizeof (arr) / sizeof (arr[0]));
    return (EXIT_SUCCESS);
}

