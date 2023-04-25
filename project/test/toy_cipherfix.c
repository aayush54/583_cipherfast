#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// Marks data at the given address and with the given length as secret.
void __attribute__((noinline, optimize("O0"))) classify(void *ptr, int length) { asm (""); }

// Marks data at the given address and with the given length as public.
void __attribute__((noinline, optimize("O0"))) declassify(void *ptr, int length) { asm (""); }

void secret_comp(char* p1, char* m, char* r1, char* r2, char* r3, char* r4) {
    for(int i=0; i<4; i++) {
        r1[i] = p1[i] + m[i];
        r2[i] = p1[i] * m[i];
        r3[i] = p1[i] - m[i];
        r4[i] = p1[i] % m[i];
    }
}

// mix public and secret variables
void mix_comp(char* result, char* public, char* private, int size){
    for(int i = 0; i<size ; i++){
        result[i] = public[i] * private[i];
    }
}
// only comp public data
void public_comp(char* result, char* input1, char* input2, int size){
    char r[4] = {'A', 'b', 'C', 'e'}; 
    for(int i=0; i<size; i++) result[i] = input1[i] * input2[i];
    for(int i = 0; i < size; ++i) result[i] += r[i];
}

void print_char(char* input){
    for(int i=0; i<sizeof(input) ; i++)
    {
        printf("%i", i);
        printf("%c",input[i]);
    }
}

int main()
{
    unsigned char key[16] = { 0 };
    //unsigned char iv[16] = { 0 };

    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; // character set to choose from
    
    for (int i = 0; i < 16; i++) {
        // int index = rand() % (sizeof(charset) - 1); // generate a random index to choose from the character set
        key[i] = charset[3 * i]; // set the character at the current index of the string
    }

    unsigned char m[16] = { 0x0c, 0xb8, 0x64, 0x56, 0xa7, 0x3a, 0x55, 0xd1, 0x90, 0x1b, 0xbd, 0x0b, 0x4c, 0xff, 0x13, 0x6d  };

    classify(key, sizeof(key));
    classify(m, sizeof(m));

    // partitioning the secret
    // first batch
    char *p1 = malloc(4*sizeof(char));
    char *p2 = malloc(4*sizeof(char));
    char *p3 = malloc(4*sizeof(char));
    char *p4 = malloc(4*sizeof(char));
    // char *p3 = malloc(4, sizeof(char));
    // char *p4 = malloc(4, sizeof(char));

    memcpy(p1,key,4*sizeof(char));
    memcpy(p2,key+4*sizeof(char),4*sizeof(char));
    memcpy(p3,key+8*sizeof(char),4*sizeof(char));
    memcpy(p4,key+12*sizeof(char),4*sizeof(char));

    char result1[4];
    char result2[4];
    char result3[4];
    char result4[4];    
    secret_comp(p1, m, result1, result2, result3, result4);
    secret_comp(p2, m, result1, result2, result3, result4);
    
    // public variable
    char pub1[4] = {0x0a, 0x0b, 0x0c, 0x0d };
    char pub2[4] = {0x11, 0x22, 0x33, 0x44 };
    char pub3[4];

    // public variable computation
    public_comp(pub3, pub1, pub2, 4);

    // mix of public and private variable
    char mix[4];
    mix_comp(mix, pub3, result1, 4);

    printf("public-comp:");
    for (int i = 0; i < 4; ++i) printf(" %d", pub3[i]);
    printf("\n");
    printf("secret-comp:");
    for (int i = 0; i < 4; ++i) printf(" %d", p2[i]);
    printf("\n");
    printf("mix-comp:");
    for (int i = 0; i < 4; ++i) printf(" %d", mix[i]);
    printf("\n");

    return 0;
}
