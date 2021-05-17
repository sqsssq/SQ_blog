package blogServlet;

import entity.UserService;
import entity.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.annotation.MultipartConfig;

//@WebServlet(name = "register")
@MultipartConfig
public class register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = request.getParameter("regUsername");
        String password = request.getParameter("regPassword");
        String email = request.getParameter("regEmail");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String regDate = sdf.format(new Date());
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssS");
        String time = sdf2.format(new Date());
        String path = this.getServletContext().getRealPath("/") + File.separator + "photo" + File.separator;
        // 读取页面选中的文件
        Part part = request.getPart("photo");

        part.write(path + time + ".jpg");
        String picPath = time + ".jpg";
        UserService.adduser(username, password, email, regDate, picPath);
//        user u = UserService.login(username, password);
//        if (u != null) {
//            session.setAttribute("username", username);
//            session.setAttribute("user", u);
//            session.removeAttribute("code");
//            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
//            rd.forward(request, response);
//        } else {
            request.setAttribute("infox", "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n" +
                    "                <strong>SUCCESS</strong> 注册成功\n" +
                    "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "                    <span aria-hidden=\"true\">&times;</span>\n" +
                    "                </button>\n" +
                    "            </div>");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
            rd.forward(request, response);
//        }
    }
}
