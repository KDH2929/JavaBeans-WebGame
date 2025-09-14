package com.Donghwan.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Donghwan.dao.UserDao;
import com.Donghwan.model.User;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao dao;
 
	 public UserController() {
	        super();
	        dao = new UserDao();
	    }
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("new_score"))
		{
			int score=Integer.parseInt(request.getParameter("score"));
			String id=request.getParameter("id");
			
			dao.addScore(id, score);
			dao.getAllUsers();			
			RequestDispatcher move = request.getRequestDispatcher("shooting.jsp");
            move.forward(request, response);
		}
		
		if(action.equalsIgnoreCase("delete"))
		{
			String id2=request.getParameter("id");
			dao.deleteUser(id2);
			RequestDispatcher move = request.getRequestDispatcher("admin.jsp");
            move.forward(request, response);
		}
		
		if(action.equalsIgnoreCase("modify"))
		{
		
			user.setId(request.getParameter("id"));
            user.setPassword(request.getParameter("password"));
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setDate(request.getParameter("date"));
            user.setScore(Integer.parseInt(request.getParameter("score")));
       
         
            dao.modify(user);
			RequestDispatcher move = request.getRequestDispatcher("admin.jsp");
            move.forward(request, response);
		}
		
		if(action.equalsIgnoreCase("find"))
		{
			String text=request.getParameter("text");
			RequestDispatcher move = request.getRequestDispatcher("admin.jsp");
			request.setAttribute("text",text);
            move.forward(request, response);
		}
       
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        String state=request.getParameter("action");
        
        if (state.equalsIgnoreCase("sign_up"))
        {
        	String pass=request.getParameter("password");
        	String pass2=request.getParameter("password_check");
        	
        	if(!pass.equalsIgnoreCase(pass2))
        	{
        		RequestDispatcher move = request.getRequestDispatcher("sign-up.jsp");
        		request.setAttribute("fail","fail");
                move.forward(request, response);
        	}
        	
        	
        	else
        	{
        	user.setId(request.getParameter("id"));
            
            user.setPassword(request.getParameter("password"));
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
             
             
            java.util.Date date = new Date(); 
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String format = formatter.format(date);
            
            user.setDate(format);        
            dao.addUser(user);
           
            RequestDispatcher move = request.getRequestDispatcher("home.jsp");
            move.forward(request, response);
        	}
        }
        
        
        if (state.equalsIgnoreCase("check"))
        {
        	String id=request.getParameter("id");
        	String password=request.getParameter("password");
        	boolean bool=dao.check(id, password);
        	
        	if(bool==true)
        	{	
        		String name=dao.find_name(id);
        	
        		RequestDispatcher move = request.getRequestDispatcher("session.jsp");
        		request.setAttribute("id",id);
        		request.setAttribute("name", name);
        		move.forward(request, response);
        	}
        	
        	else
        	{
        		RequestDispatcher move = request.getRequestDispatcher("loginPage.jsp");
        		request.setAttribute("fail", "fail");
        		move.forward(request, response);
        	}
        }
 
        
        
	}

}
