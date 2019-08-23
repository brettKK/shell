#include<stdio.h>
#include<iostream>
using namespace std;

template <class SomeType>

SomeType sum (SomeType a, SomeType b) {
	return a+b;
}


int main(void) {
	cout<<sum(1,7)<<endl;
	cout<<sum(1.2, 2.4)<<endl;
}
