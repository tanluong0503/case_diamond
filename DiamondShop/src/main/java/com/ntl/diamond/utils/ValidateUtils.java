package com.ntl.diamond.utils;

import java.text.DecimalFormat;
import java.util.regex.Pattern;

public class ValidateUtils {
    public static final String EMAIL_REGEX = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}$";
    public static final String PHONE_REGEX = "^[0][1-9][0-9]{8}$";
    public static final String PRICE_REGEX = "^[1-9][0-9]{0,10}";
    public static final String PASSWORD_REGEX = "^([\\d\\w]{6,30})$";
    public static final String USER_NAME_REGEX = "^([a-z])([a-z0-9]){7,19}$";


    public static boolean isPriceValid(String price) {

        return Pattern.compile(PRICE_REGEX).matcher((CharSequence) price).matches();
    }


    public static boolean isPhoneValid(String phone) {
        return Pattern.compile(PHONE_REGEX).matcher(phone).matches();
    }


    public static boolean isEmailValid(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }

    public static boolean isPasswordValid(String password) {
        return Pattern.compile(PASSWORD_REGEX).matcher(password).matches();
    }

    public static boolean isUserNameValid(String username) {
        return Pattern.compile(USER_NAME_REGEX).matcher(username).matches();
    }
}

