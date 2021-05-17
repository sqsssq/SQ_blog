package blogServlet;

import entity.user;
import entity.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebServlet(name = "LoginAction")
public class LoginAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String incode = request.getParameter("tcode");
        HttpSession session = request.getSession();
        String code = (String) session.getAttribute("code");
        if (!code.equals(incode)) {
            request.setAttribute("wrongname", username);
            request.setAttribute("info", "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <strong>ERROR</strong> 验证码错误\n" +
                    "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "                    <span aria-hidden=\"true\">&times;</span>\n" +
                    "                </button>\n" +
                    "            </div>");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            rd.forward(request, response);
        } else {
            user u = UserService.login(username, password);
            if (u != null) {
                session.setAttribute("username", username);
                session.setAttribute("user", u);
                session.removeAttribute("code");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("info", "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">\n" +
                        "                <strong>ERROR</strong> 用户名或密码错误\n" +
                        "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                        "                    <span aria-hidden=\"true\">&times;</span>\n" +
                        "                </button>\n" +
                        "            </div>");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
                rd.forward(request, response);
            }
        }
    }
}
