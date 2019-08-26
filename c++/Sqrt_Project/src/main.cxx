
#include "../include/a.h"
#include <stdio.h>

int main(int argc, char** argv)
{
    double a = 49.0; 
    double b = 0.0;
 
    printf("input a:%f\n",a);
    b = cal_sqrt(a);
    printf("sqrt result:%f\n",b);
    return 0;
}