package entity;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    public static Connection getConnect() {
        //注册驱动
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //建立连接
        String url = "JDBC:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=UTF-8";
        String sqlUser = "root";
        String sqlPassword = "123456";
        try {
            Connection conn = DriverManager.getConnection(url, sqlUser, sqlPassword);
            return conn;
        } catch (SQLException throwables) {
            System.out.println("DataBase Connect Error");
            throwables.printStackTrace();
        }
        return null;
    }
    // 用户注册
    public static void adduser(String username, String password, String email, String registerTime, String head) {
        Connection conn = getConnect();

        QueryRunner runner = new QueryRunner();
        String sql = "insert into user(username,password,email,registerTime,head) " +
                "values(?,?,?,?,?)";

        try {
            runner.execute(conn, sql, username, password, email, registerTime,head);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public static user login(String username, String password) {
        Connection conn = getConnect();

        QueryRunner runner = new QueryRunner();

        String sql1 = "select * from user where username = ? and password= ?";
//        runner.execute(conn, sql);
        List<user> user1 = null;
        try {
            user1 = runner.query(conn, sql1, new BeanListHandler<user>(user.class), username, password);
            if (user1.size() > 0)
                return user1.get(0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return null;
    }


    public static void addBlog(String title, String info, String t, String summary) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql = "insert into blog(Title,information,Time,summary) values(?,?,?,?)";

        try {
            runner.execute(conn, sql, title, info, t, summary);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void addMessage(int userId, String info, String messageTime) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql = "insert into messageBoard(userID,information,messageTime) values(?,?,?)";

        try {
            runner.execute(conn, sql, userId, info, messageTime);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void addblogMessage(int userId, int blogID, String info, String messageTime) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql = "insert into discuss(userID,blogID,information,messageTime) values(?,?,?,?)";

        try {
            runner.execute(conn, sql, userId, blogID, info, messageTime);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void deleteBlog(int id) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql = "delete from discuss where blogID=?";
        String sql2 = "delete from blog where id=?";

        try {
            runner.execute(conn, sql, id);
            runner.execute(conn, sql2, id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void deleteAlbum(int id) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql = "delete from album where id=?";

        try {
            runner.execute(conn, sql, id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static List<blog> getAllBlog() {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql1 = "select * from blog";
//        runner.execute(conn, sql);
        List<blog> blogs = new ArrayList<>();
        try {
            blogs = runner.query(conn, sql1, new BeanListHandler<blog>(blog.class));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return blogs;
    }

    public static List<album> getAllAlbum() {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql1 = "select * from album";
//        runner.execute(conn, sql);
        List<album> albums = new ArrayList<>();
        try {
            albums = runner.query(conn, sql1, new BeanListHandler<album>(album.class));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return albums;
    }

    public static List<message> getAllMessage() {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql1 = "SELECT userID, head, information, username, messageTime \n" +
                "FROM messageboard AS a\n" +
                "LEFT JOIN `user` AS b\n" +
                "ON a.userID = b.id\n";
//        runner.execute(conn, sql);
        List<message> messages = new ArrayList<>();
        try {
            messages = runner.query(conn, sql1, new BeanListHandler<message>(message.class));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return messages;
    }

    public static blog blogInfo(int id) {
        Connection conn = getConnect();

        QueryRunner runner = new QueryRunner();

        String sql1 = "select * from blog where id = ?";
//        runner.execute(conn, sql);
        List<blog> blogs = null;
        try {
            blogs = runner.query(conn, sql1, new BeanListHandler<blog>(blog.class), id);
            return blogs.get(0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return null;
    }

    public static List<message> blogDiscussInfo(int id) {
        Connection conn = getConnect();

        QueryRunner runner = new QueryRunner();

        String sql1 = "SELECT userID, head, information, username\n" +
                "FROM discuss AS a\n" +
                "LEFT JOIN `user` AS b\n" +
                "ON a.userID = b.id\n" +
                "WHERE a.blogID = ?";
//        runner.execute(conn, sql);
        List<message> blogMessages = null;
        try {
            blogMessages = runner.query(conn, sql1, new BeanListHandler<message>(message.class), id);
            return blogMessages;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return null;
    }

    // 模糊查询
    public static List<blog> getSearch(String key) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        key = "%" + key + "%";
        String sql1 = "select * from blog where Title like ? or information like ? or summary like ?";
//        runner.execute(conn, sql);
        List<blog> blogs = new ArrayList<>();
        try {
            blogs = runner.query(conn, sql1, new BeanListHandler<blog>(blog.class), key, key, key);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return blogs;
    }

    public static int updateBlog(int id, String title, String info, String t, String summary) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql1 = "update blog set title = ?, information = ?, time = ?, summary = ?  where id = ?";
//        runner.execute(conn, sql);
        int f = 0;
        try {
            f = runner.update(conn, sql1, title, info, t, summary, id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        DbUtils.closeQuietly(conn);
        return f;
    }

    public static void addAlbum(String picture, String username, String time, String information) {
        Connection conn = getConnect();
        QueryRunner runner = new QueryRunner();
        String sql = "insert into album(picture,username,time, information) values(?,?,?,?)";

        try {
            runner.execute(conn, sql, picture, username, time,information);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
