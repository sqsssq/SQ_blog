package blogServlet;

import entity.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "deleteAlbum")
public class deleteAlbum extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String ID = request.getParameter("id");
        long id = Integer.parseInt(ID);
        UserService.deleteAlbum((int) id);
        RequestDispatcher rd = request.getRequestDispatcher("/Album");
        rd.forward(request, response);
    }
}
