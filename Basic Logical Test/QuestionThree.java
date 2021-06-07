package com.sanxynet.apparuletest;

/* Suppose you have an array of 101 integers.
This array is already sorted and all numbers in this array are consecutive.
Each number only occurs once in the array except one number which occurs twice.
Write a js code to find the repeated number.
e.g $arr = array(0,1,2,3,4,5,6,7,7,8,9,10...................);
 */


public class QuestionThree {

    static int findRepeating(int[] arr, int n)
    {
        // Find array sum and subtract sum
        // first n-1 natural numbers from it
        // to find the result.

        int sum = 0;
        for (int i = 0; i < n; i++)
            sum += arr[i];
        return sum - (((n - 1) * n) / 2);
    }

    // Driver code
    public static void main(String[] args)
    {
        int[] arr = { 9, 8, 2, 6, 1, 8, 5, 3, 4, 7 };
        int n = arr.length;
        System.out.println(findRepeating(arr, n));
    }
}
