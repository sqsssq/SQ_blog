package blogServlet;

import entity.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "addBlogMessage")
public class addBlogMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String info = request.getParameter("info");
        String time = request.getParameter("time");
        int userID = Integer.parseInt(request.getParameter("userID"));
        int blogID = Integer.parseInt(request.getParameter("blogID"));

        UserService.addblogMessage(userID, blogID, info, time);
    }
}
