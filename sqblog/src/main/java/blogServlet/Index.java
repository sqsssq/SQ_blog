package blogServlet;

import entity.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Index extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession();
        String str = (String) session.getAttribute("username");
        if (str == null) {
            response.sendRedirect("Login");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
            rd.forward(request, response);
        }
    }
}
