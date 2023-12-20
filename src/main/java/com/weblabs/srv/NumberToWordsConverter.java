package com.weblabs.srv;
public class NumberToWordsConverter {

    private static final String[] oneDigit = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
    private static final String[] twoDigitSpecialCase = {"",  "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
    private static final String[] tensMultiple = {"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};

    public static String convertToWords(int number) {
        if (number == 0) {
            return "zero";
        }

        StringBuilder result = new StringBuilder();

		
        int thousands = number / 1000;
        int hundreds = (number % 1000) / 100;
        int tens = (number % 100) / 10;
        int ones = number % 10;

        if (thousands > 0) {
            result.append(oneDigit[thousands]).append(" thousand ");
        }

        if (hundreds > 0) {
            result.append(oneDigit[hundreds]).append(" hundred ");
        }

        if (tens == 1) {
            // Handle special case for numbers 11 to 19
            result.append(twoDigitSpecialCase[ones]);
        } else {
            // Handle tens
            if (tens > 1) {
                result.append(tensMultiple[tens]);

                // Handle ones
                if (ones > 0) {
                    result.append(" ").append(oneDigit[ones]);
                }
            } else if (ones > 0) {
                // Handle ones for cases where tens == 0
                result.append(oneDigit[ones]);
            }
        }

        return result.toString().trim();
    }
        
        
   
    public static void main(String[] args) {
        int number = 1806;
        String numberInWords = convertToWords(number);
        System.out.println(numberInWords);
    }
}