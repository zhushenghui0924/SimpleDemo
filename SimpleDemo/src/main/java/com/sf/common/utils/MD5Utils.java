package com.sf.common.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import java.security.SecureRandom;
import java.util.Arrays;

import static org.apache.tomcat.util.codec.binary.Base64.encodeBase64String;

public class MD5Utils {
	private static final String SALT = "1qazxsw2";

	private static final String ALGORITH_NAME = "md5";

	private static final int HASH_ITERATIONS = 2;

	public static String encrypt(String pswd) {
		String newPassword = new SimpleHash(ALGORITH_NAME, pswd, ByteSource.Util.bytes(SALT), HASH_ITERATIONS).toHex();
		return newPassword;
	}

	public static String encrypt(String salt, String pswd) {
		String newPassword = new SimpleHash(ALGORITH_NAME, pswd, salt,
				HASH_ITERATIONS).toHex();
		return newPassword;
	}
	public static void main(String[] args) {
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[15];
		random.nextBytes(bytes);
		String salt = encodeBase64String(bytes);
		System.out.println("salt:" + salt);
		System.out.println("bytes:" + Arrays.toString(bytes));
		System.out.println(MD5Utils.encrypt("nixseVGAnm/6Sj63CP4X", "admin"));
	}

}
