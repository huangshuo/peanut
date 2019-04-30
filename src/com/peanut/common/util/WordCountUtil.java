package com.peanut.common.util;

import com.peanut.common.Constant;

import java.util.HashMap;
import java.util.Map;
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
public final class WordCountUtil {

	private WordCountUtil() {
	}

	/**
	 * 匹配模式1个汉字
	 */
	private static Pattern patternChineseCharacter = Pattern.compile(Constant.WORD_COUNT_PATTERN_CHINESE_CHARACTER);

	public static Map<String, Integer> countWord(String tempStr) {
		//总汉字数
		int numOfWords = 0;

		Map<String, Integer> tempMap = new HashMap<>(3);
		//汉字匹配，统计字数
		Matcher matcher = patternChineseCharacter.matcher(tempStr);
		while (matcher.find()) {
			numOfWords++;
		}

		tempMap.put(Constant.WORD_COUNT_MAP_CHARACTER_KEY, numOfWords);
		return tempMap;
	}
}
