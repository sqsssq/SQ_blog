package blogServlet;

import entity.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.annotation.MultipartConfig;

//@WebServlet(name = "addAlbum")
@MultipartConfig
public class addAlbum extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String info = request.getParameter("infox");
        System.out.println(info);


        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssS");
        String time = sdf2.format(new Date());
        String path = this.getServletContext().getRealPath("/") + File.separator + "picture" + File.separator;
        // 读取页面选中的文件
        Part part = request.getPart("filename");

        part.write(path + time + ".jpg");
        String picPath = time + ".jpg";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String Date = sdf.format(new Date());
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        UserService.addAlbum(picPath, username, Date, info);

        RequestDispatcher rd = request.getRequestDispatcher("/Album");
        rd.forward(request, response);
    }
}
