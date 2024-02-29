package com.springboot.demo.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

public final class cmUtil {
	
	public static HashMap<String, Object> cvtFormData(List<Map<String, Object>> mapList) {
		
		Map<String, Object> item = null;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		for(int i = 0; i < mapList.size(); i++) {
			item = mapList.get(i);
			result.put(item.get("name").toString(), item.get("value"));
		}
		
		return result;
	}

	public static Integer parseInt(Object obj) {
		
		Integer result = null;
		
		try {
			String strTmp = obj.toString();
			int intTmp = Integer.parseInt(strTmp);
			result = intTmp;
		} catch(Exception exptn) {
			exptn.printStackTrace();
			return null;
		}
		
		return result;
	}

	public static Integer getIntParam(HashMap<String, Object> param, String key) {
		
		Integer result = null;
		
		try {
		
			if(param.containsKey(key) == false) {
				result = null;
			} else {
				
				Object obj = param.get(key);
				
				String value = ObjectUtils.nullSafeConciseToString(obj).trim();
				
				if(!StringUtils.hasText(value)) {
					result = null;
				} else {
					Integer parseSeq = parseInt(value);
					
					if(parseSeq == null) {
						result = null;
					} else {
						result = parseSeq;
					}	
				}
				
			}
		
		} catch(Exception exptn) {
			exptn.printStackTrace();
			return null;
		}
		
		return result;
	}
	
}
