/*package com.yrf.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
import org.springframework.expression.ParseException;


public class CustomDateConverter implements Converter<String,Date>{
	public Date convert(String source) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
		try {
			return simpleDateFormat.parse(source);
		} catch (ParseException | java.text.ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}


*/