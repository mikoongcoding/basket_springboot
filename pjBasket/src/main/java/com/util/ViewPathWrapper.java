package com.util;

import java.util.Arrays;
import java.util.Iterator;

import com.google.gson.Gson;

public class ViewPathWrapper {

	private static final Gson gson = new Gson();

	public static String forward(String path) {
		return "forward:/" + path + ".jsp";
	}

	public static String redirect(String path) {
		return "redirect:/" + path + ".jsp";
	}

	public static String web_inf(String path) {
		return "forward:/WEB-INF/view/" + path + ".jsp";
	}

	// Don't use that
	public static String printString(String data) {
		return data;
	}

	// Object to jsonType String
	public static String printJson(Object jsonElement) {
		return gson.toJson(jsonElement);
	}
	
	public static String printJsonIncludeNull(Object jsonElement) {
		Iterator<String> i = Arrays.asList(gson.toJson(jsonElement).split("\"null\"")).iterator();
		StringBuilder json = new StringBuilder(i.next());
		while (i.hasNext()) {
			json.append("null");
			json.append(i.next());
		}
		return json.toString();
	}
}
