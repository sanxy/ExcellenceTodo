package com.sanxynet.apparuletest;


/* Find the maximum consecutive 1's in an array of 0's and 1's.
Example:
a) 00110001001110 - Output :3 [Max num of consecutive 1's is 3]
b) 1000010001 - Output :1 [Max num of consecutive 1's is 1]
 */

public class QuestionTwo {


    public static void main(String[] args)
    {
//        int[] arr = {1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1};
        int[] arr = {1, 1, 0, 0, 1, 0, 1, 0, 1};

        System.out.println(findMaxConsecutiveOnes(arr));
    }


    static int findMaxConsecutiveOnes(int[] nums) {
        int ans = 0, count = 0;
        for (int num : nums) {
            if (num == 1) {
                ans = Math.max(ans, ++count);
            } else {
                count = 0;
            }
        }
        return ans;
    }

}
