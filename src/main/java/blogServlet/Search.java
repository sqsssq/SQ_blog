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
import java.util.List;

//@WebServlet(name = "Search")
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String likeName = request.getParameter("likeName");
        List<blog> blogs = UserService.getSearch(likeName);
        request.setAttribute("blogs", blogs);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/blogList.jsp");
        rd.forward(request, response);
    }
}
