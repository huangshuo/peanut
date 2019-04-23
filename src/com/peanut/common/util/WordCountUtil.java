package com.peanut.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * description: 文章字数统计工具类.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.common.util
 * @since 1.0
 */
public class WordCountUtil {

	/**
	 * 定义匹配模式:1个汉字
	 */
	static private Pattern patternChineseCharacter = Pattern.compile("([\u4e00-\u9fa5])");

	/**
	 * 定义匹配模式：汉字或标点符号
	 */
	static private Pattern patternChinesePunctuation = Pattern.compile("([\u4e00-\u9fa5,，.。、/<>?？;；'‘’:\"【】{}])");

	/**
	 * 定义匹配模式：匹配任何空白字符，包括空格、制表符、换页符等等
	 */
	static private Pattern patternBlankCharacter = Pattern.compile("[\\s]");

	static void countWord(String tempStr) {

		//总汉字数
		int numOfWords = 0;

		//汉字+标点数
		int numOfWordsAndPunctuation = 0;

		//空格字符数
		int numBlank = 0;

			//汉字匹配，统计字数
			Matcher matcher = patternChineseCharacter.matcher(tempStr);
			while (matcher.find()) {
				numOfWords++;
			}

			//汉字标点匹配，统计字数
			Matcher matcher2 = patternChinesePunctuation.matcher(tempStr);
			while (matcher2.find()) {
				numOfWordsAndPunctuation++;
			}

			//空格匹配，统计字数
			Matcher matcher3 = patternBlankCharacter.matcher(tempStr);
			while (matcher3.find()) {
				numBlank++;
			}

	}
}
