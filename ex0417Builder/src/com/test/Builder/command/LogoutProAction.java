package com.test.Builder.command;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.Builder.controller.CommandAction;

public class LogoutProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		// 세션 제거
		HttpSession session = request.getSession(); 
		session.invalidate();
		
		return "index.jsp";
	}

}
