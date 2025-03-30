#include <stdio.h>


int main(int argc, char const *argv[])
{
    const int IN_BITS_LEN = 11;
    const int EXP_VALUE_IN_BASE_TWO = 3;
    const int OUT_BITS_LEN = EXP_VALUE_IN_BASE_TWO + IN_BITS_LEN + 1;
    int i, j, k, l;

    j = 1;
    k = IN_BITS_LEN-1;
    l = k;

    for(i = 0; i < OUT_BITS_LEN; i = i+1)
    {
        if( i+1 == j )
        {
            printf("i = %d, val = %d\n", i, (1<<i));
            j = (j<<1);
        }
    }

    printf("Final do Programa!\n\n");

    return 0;
}
