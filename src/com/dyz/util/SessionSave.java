package com.dyz.util;

import java.util.HashMap;
import java.util.Map;

public class SessionSave {
	private static Map<String, String> SessionIdSave = new HashMap<String,String>();
	 
	public static Map<String, String> getSessionIdSave() {
		return SessionIdSave;
	}
 
	public static void setSessionIdSave(Map<String, String> sessionIdSave) {
		SessionIdSave = sessionIdSave;
	}

}
