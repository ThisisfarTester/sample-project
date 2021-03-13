package com.util;

public class FieldValidator {
	private String flag;
	public String validateUser(String user, String pwd, String type){
		if("".equals(user) && "".equals(pwd)){
			if("-1".equals(type))
				flag="empty record";
		}if(!("".equals(user)) && "".equals(pwd)){
				flag="empty pwd";
		}if("".equals(user) && !("".equals(pwd))){
				flag="empty user";
		}
		if(!("".equals(user)) && !("".equals(pwd))){
			if("-1".equals(type))
				flag="empty role";
		}	
		return flag;
	}
	public String validateField(String fname, String lname, String pwd, String gendar, String [] hby){
		if("".equals(fname)){
			flag="empty fname";
		}else if("".equals(lname)){
			flag="empty lname";
		}else if(gendar==null){
			flag="empty gendar";
		}else if("".equals(pwd)){
			flag="empty pwd";
		}else if(hby==null){
			flag="empty hoby";
		}else{
			flag="success";
		}
		return flag;
	}
}
