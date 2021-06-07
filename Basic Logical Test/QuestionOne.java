package com.sanxynet.apparuletest;

/* Define an array of numbers (use any random numbers).
Write a program to print only the even numbers of the array.
Do not use any library functions, need to do via for loops only */


public class QuestionOne {

    // Print array method
    public static void printArray(int[] array)
    {
        for (int value : array)
            System.out.print(value + " ");
        System.out.println();
    }
    public static void main(String[] args)
    {
        int n = 8;
        // array with N size
        int[] array = { 11, 17, 12, 9, 76, 66, 2, 91 };

        int evenSize = 0;

        for (int i = 0; i < n; i++) {
            if (array[i] % 2 == 0)
                evenSize++;
        }
        // Even arrays with size
        int[] even = new int[evenSize];

        // even array iterator
        int j = 0, k = 0;
        for (int i = 0; i < n; i++) {
            if (array[i] % 2 == 0)
                even[j++] = array[i];
        }

        // print array method
        System.out.print("Even Array contains: ");
        printArray(even);
    }



}

