package blogServlet;

import entity.UserService;
import entity.blog;
import entity.message;
//import entity.messageBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "messageBoard")
public class messageBoard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        List<message> messages = UserService.getAllMessage();
        request.setAttribute("messages", messages);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/message.jsp");
        rd.forward(request, response);
    }
}
