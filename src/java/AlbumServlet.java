package murach.music;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/albums")
public class AlbumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        List<Album> albums = new ArrayList<>();
        albums.add(new Album("Rosie", "Rosé"));
        albums.add(new Album("Justice", "Justin Bieber"));
        albums.add(new Album("Hero", "Starfall"));
        albums.add(new Album("MTP", "Sơn Tùng MTP"));

        request.setAttribute("albums", albums);
        request.getRequestDispatcher("/albums.jsp").forward(request, response);
    }
}
