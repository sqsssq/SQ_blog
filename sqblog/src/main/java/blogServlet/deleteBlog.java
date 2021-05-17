package blogServlet;

import entity.UserService;
import entity.blog;
import entity.message;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "deleteBlog")
public class deleteBlog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String ID = request.getParameter("id");
        long id = Integer.parseInt(ID);
        UserService.deleteBlog((int) id);
        RequestDispatcher rd = request.getRequestDispatcher("/blogList");
        rd.forward(request, response);
    }
}
