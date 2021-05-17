package blogServlet;

import entity.UserService;
import entity.blog;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "editor")
public class editor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String ID = request.getParameter("id");
        long id = Integer.parseInt(ID);
        blog b = UserService.blogInfo((int) id);
        request.setAttribute("b", b);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/edit.jsp");
        rd.forward(request, response);
    }
}
