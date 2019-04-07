
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

typedef struct ps256 {
    //powerset 256: contains 256 bits to indicate presence
    unsigned long b[4];
} ps256;
extern int getnextset(ps256* ps, unsigned from);
unsigned long keycalls = 0;

unsigned char intkey(void *record, unsigned radix) {
    unsigned int i = (*(unsigned int*) record);
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

#define TYPE int
unsigned long compares = 0;

static int compare(const void *a, const void *b) {
    const TYPE da = *((const TYPE *) a);
    const TYPE db = *((const TYPE *) b);
    compares++;
    return (da < db) ? -1 : (da == db) ? 0 : 1;
}

void printInts(int *arr, size_t size) {
    printf("[ ");
    while (size--) {
        printf("%d ", *arr);
        arr++;
    }
    printf("]\n");
}

unsigned int seed = 1;

int* randomInts(size_t length) {
    srandom(seed);
    int* ints = malloc(sizeof (int) * length);
    int *i = ints;
    while (length--) {
        *i = random() & 0x7fffffff;
        i++;
    }
    return ints;
}

int* consecutiveAscendingInts(size_t length) {
    int s = seed;
    int* ints = malloc(sizeof (int) * length);
    int *i = ints;
    while (length--) {
        *i = s++;
        i++;
    }
    return ints;
}

int* consecutiveAscendingIntsBottom3(size_t length) {
    int s = seed;
    int* ints = malloc(sizeof (int) * length);
    int *i = ints;
    while (length--) {
        *i = s++;
        i++;
    }
    i--;
    *i = random() & 0xffffff;
    i--;
    *i = random() & 0xfff;
    i--;
    *i = random() & 0xf;

    return ints;
}


int* randomAscendingInts(size_t length) {
    int* ints = randomInts(length);
    timsort(ints, length, sizeof (int), compare);
    compares = 0;
    return ints;
}

int* allSameInts(size_t length) {
    int* ints = malloc(sizeof (int) * length);
    int *i = ints;
    while (length--) {
        *i = seed;
        i++;
    }
    return ints;
}




#define timeit(sortname, sortcall) \
    clock_gettime(CLOCK_MONOTONIC, &before);\
    sortcall;\
    clock_gettime(CLOCK_MONOTONIC, &after);\
    printf(sortname "   took %2lus %'11luns\n", after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));\
    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);\
    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);\
//    printf("Sorted: %s\n", isSorted(larger, length) ? "YES" : "NO");

unsigned selfcalls = 0, counts = 0, poscalc = 0, loops = 0, numswaps = 0;
unsigned shuffles = 0;

int isSorted(int* list, int size) {
    int i;
    for (i = 1; i < size; i++) {
        if (list[i] < list[i - 1]) {
            printf("%x > %x at index %d\n", list[i - 1], list[i], i);
            return 0;
        }
    }
    return 1; //sorted
}

typedef struct TestParams {
    int numtests;
    int samplelength;
    int *testdata;
} TestParams;

static TestParams getConstantVolumeSortTestParams(int samplelength, char testtype) {
    TestParams tp;
    int volume = 1000;
    tp.samplelength = samplelength <= 0 ? 4 : samplelength;
    if (samplelength > volume) volume = samplelength;
    tp.numtests = volume / tp.samplelength;
    switch (testtype) {
        case '/':
            printf("consecutiveAscendingInts\n");
            tp.testdata = consecutiveAscendingInts(volume);
            break;
        case '%':
            printf("randomAscendingInts\n");
            tp.testdata = randomAscendingInts(volume);
            break;
        case '=':
            printf("allSameInts = %u\n", seed);
            tp.testdata = allSameInts(volume);
            break;
        case '+':
            printf("consecutiveAscendingIntsBottom3\n");
            tp.testdata = consecutiveAscendingIntsBottom3(volume);
            break;
        case 'r':
        default:
            printf("randomInts\n");
            tp.testdata = randomInts(volume);
    }
    return tp;
}

#define CLOCK_MONOTONIC 1
#define INITCLOCK     struct timespec before, after;
#define BEGINBENCH      clock_gettime(CLOCK_MONOTONIC, &before);
#define nanodiff(after,before) ( (before)< (after) ? (after)-(before) : 1000000000L - ((before)-(after)) )
#define ENDBENCH clock_gettime(CLOCK_MONOTONIC, &after);\
    printf("%s took %2lus %'11luns\n", __FUNCTION__, after.tv_sec - before.tv_sec, nanodiff(after.tv_nsec, before.tv_nsec));\
    printf("start %lus %luns\n", before.tv_sec, before.tv_nsec);\
    printf("end   %lus %luns\n", after.tv_sec, after.tv_nsec);\


static void quicktest(TestParams tp) {
    INITCLOCK;
    BEGINBENCH;
    int i;
    for (i = 0; i < tp.numtests; i++) {
        qsort(tp.testdata + tp.samplelength*i, tp.samplelength, sizeof (int), compare);
    }
    ENDBENCH;
    printf("compares: %'lu\n", compares);
}

static void timtest(TestParams tp) {
    INITCLOCK;
    BEGINBENCH;
    int i;
    for (i = 0; i < tp.numtests; i++) {
        timsort(tp.testdata + tp.samplelength*i, tp.samplelength, sizeof (int), compare);
    }
    ENDBENCH;
    printf("compares: %'lu\n", compares);
}

static void radixsorttest(TestParams tp) {
    INITCLOCK;
    BEGINBENCH;
    int i;
    unsigned count[256] = {0};
    for (i = 0; i < tp.numtests; i++) {
        rsort_msb(tp.testdata + tp.samplelength*i, tp.samplelength, sizeof (int), intkey, 3, count);
    }
    ENDBENCH;
    printf("keycalls: %'lu selfcalls: %u\n", keycalls, selfcalls);
    printf("counts: %u poscalcs: %u 0+1: %u %u swaps in %u shuffles\n", counts, poscalc, counts + poscalc, numswaps, shuffles);
}

static void srsorttest(TestParams tp) {
    INITCLOCK;
    BEGINBENCH;
    int i;
    unsigned count[256] = {0};
    for (i = 0; i < tp.numtests; i++) {
        srsort(tp.testdata + tp.samplelength*i, tp.samplelength, sizeof (int), intkey, 3, count);
    }
    ENDBENCH;
    printf("keycalls: %'lu selfcalls: %u\n", keycalls, selfcalls);
    printf("counts: %u poscalcs: %u 0+1: %u %u swaps in %u shuffles\n", counts, poscalc, counts + poscalc, numswaps, shuffles);

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
    int shift;
    scanf("%d", &shift);
    printf("~0 >> %d == %016lx\n", shift, (0xfffffffffffffffful << shift));
    printf(" 1 << %d == %016lx\n", shift, (1ul >> shift));
    //    sort_main(argc, argv);

    unsigned char limit = 129;
    char d = 'D';
    char charr[4] = {'o', 'n', 'k', 0};
    printf("char limit:%d, hex:%x, charr[limit]=%c\n", limit, limit, charr[limit]);
}

static void ps256CorrectnessTest() {
    ps256 ps = {0};
    int i;
    printf("num set | set bits\n");
    for (i = 0; i < 256; i++) {
        setbit(&ps, i);
        printf("%3d %3d | ", i, getnextset(&ps, i));
        print256(&ps);
    }
    printf("--- --- | \n");
    memset(&ps, 0, sizeof (ps));
    for (i = 255; i >= 0; i--) {
        setbit(&ps, i);
        printf("%3d %3d | ", i, getnextset(&ps, i));
        print256(&ps);
    }
    ps256 psrand = {0x1, 0x2, 0x3, 0x4};
    int nex = 0;

    print256(&psrand);
    while ((nex = getnextset(&psrand, nex)) != -1) {
        printf("%d ", nex);
        print256(&psrand);
        nex++;
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
    setlocale(LC_ALL, "");
    char sorttype = 's';
    char testtype = 'r';
    size_t length = 27;

    if (argc > 1) {
        sorttype = argv[1][0];
    }
    if (argc > 2) {
        //sort sample length
        length = atol(argv[2]);
    }
    if (argc > 3) {
        testtype = argv[3][0];
    }
    if (argc > 4) {
        //seed for random number
        seed = atoi(argv[4]);
    }

    int *base;
    int i;
    switch (sorttype) {
        case 'p':
            base = randomInts(length);
            for (i = 0; i < 100; i++) {
                ps256PerformanceTest(length, base);
            }
            return 0;
        case '6':
            base = randomInts(length);
            for (i = 0; i < 100; i++) {
                loop256PerformanceTest(length, base);
            }
    }

    TestParams tp = getConstantVolumeSortTestParams(length, testtype);

    switch (sorttype) {
        case 'r': radixsorttest(tp);
            break;
        case 's': srsorttest(tp);
            break;
        case 't': timtest(tp);
            break;
        case 'q': quicktest(tp);
            break;
    }
    return (EXIT_SUCCESS);
}

