package blogServlet;

import entity.UserService;
import entity.album;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "Album")
public class Album extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<album> albums = UserService.getAllAlbum();
        request.setAttribute("albums", albums);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/album.jsp");
        rd.forward(request, response);
    }
}
