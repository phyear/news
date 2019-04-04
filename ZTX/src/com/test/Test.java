package com.test;



public class Test<T> {

	 public static void main(String[] args) {
		int a=1;
		int b=1;
		for(a=0;a<5;a+=3) {	
			a=a+b;
			System.out.println(a);
		}
		System.out.println(a);
	}
	 
	
}
