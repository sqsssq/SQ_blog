package blogServlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

//@WebServlet(name = "Response02")
public class identifyCode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpeg");
        HttpSession session = request.getSession();
        // 在内存中创建一张图片
        BufferedImage image = new BufferedImage(70, 30, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        // 设置背景
        g.setColor(Color.blue);
        g.fillRect(0, 0, 70, 30);
        Random r = new Random();
        int i = r.nextInt(8999) + 1000;
        session.setAttribute("code", String.valueOf(i));
//        System.out.println(i);
        g.setColor(Color.white);
        g.setFont(new Font(null, Font.BOLD, 24));
//        System.out.println(i);
//        System.out.println(Str    ing.valueOf(i));
        g.drawString(String.valueOf(i), 10, 25);

        // 获取相应的输出流（自动关闭）
        OutputStream os = response.getOutputStream();

        ImageIO.write(image, "jpg", os);
    }
}
