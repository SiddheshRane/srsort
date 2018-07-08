
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
#include "timsort/timsort.h"

/*
 * 
 */
unsigned char intkey(void *record, unsigned radix) {
    int* i = (int*) record;
    unsigned char c = (unsigned char) (*i >> radix * 8);
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
    srandom(1);
    int* ints = malloc(sizeof (int) * length);
    int *i = ints;
    while (length--) {
        *i = random() & 0xffffffff;
        i++;
    }
    return ints;
}

#define TYPE int

static int compare(const void *a, const void *b) {
    const TYPE da = *((const TYPE *) a);
    const TYPE db = *((const TYPE *) b);
    return (da < db) ? -1 : (da == db) ? 0 : 1;
}

#define timeit(sortname, sortcall) \
    clock_gettime(CLOCK_MONOTONIC, &before);\
    sortcall;\
    clock_gettime(CLOCK_MONOTONIC, &after);\
    printf(sortname "   took %2lus %'11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));\
    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);\
    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);\
    

static void memaccesstest(char sort, size_t length) {
    int *larger = randomInts(length);
    //    int *dest = malloc(sizeof (int)*length);
    //        printInts(larger, (length < 20 ? length : 20));

    #define CLOCK_MONOTONIC 1
    #define nanodiff(after,before) ( (before)< (after) ? (after)-(before) : 1000000000L - ((before)-(after)) )
    struct timespec before, after;

    switch (sort) {
        case 't':
            timeit("TIM", timsort(larger, length, sizeof (int), compare))
            printf("compares: %'lu\n");
            break;
        case 'r':
            timeit("SID", unsigned count[256] = {0}; rsort_msb(larger, length, sizeof (int), intkey, 3, count))
            printf("keycalls: %'lu\n");
            break;
        case 'q':
            timeit("QCK", qsort(larger, length, sizeof (int), compare))
            printf("compares: %'lu\n");

            break;
            //    printf("\nRSORT COPY\n");
            //    clock_gettime(CLOCK_MONOTONIC, &before);
            //    rsort_lsb_copy(dest, larger, length, sizeof (int), intkey, 0);
            //    rsort_lsb_copy(larger, dest, length, sizeof (int), intkey, 1);
            //    rsort_lsb_copy(dest, larger, length, sizeof (int), intkey, 2);
            //    rsort_lsb_copy(larger, dest, length, sizeof (int), intkey, 3);
            //    clock_gettime(CLOCK_MONOTONIC, &after);
            //    printf("rsort   took %2lus %11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));
            //    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);
            //    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);
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

int main(int argc, char** argv) {
    //    littleendiannesstest();
    setlocale(LC_ALL, "");
    char sorttype = 'r';
    size_t length = 100;
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

