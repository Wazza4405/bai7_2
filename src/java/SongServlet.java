package murach.music;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/songs")
public class SongServlet extends HttpServlet {
    private Map<String, List<String>> albumSongs = new HashMap<>();

    @Override
    public void init() throws ServletException {
        // Khớp tên file mp3 với thư mục thực tế
        albumSongs.put("Rosie", Arrays.asList("Gone.mp3", "3am.mp3", "two years.mp3", "Messy.mp3"));
        albumSongs.put("Justice", Arrays.asList("Ghost.mp3", "2 Much.mp3", "Stay.mp3", "Anyone.mp3"));
        albumSongs.put("Hero", Arrays.asList("intentions.mp3", "hero.mp3", "darling he lied.mp3", "cigarettes.mp3"));
        albumSongs.put("MTP", Arrays.asList("Đừng làm trái tim anh đau.mp3", "Chắc ai đó sẽ về.mp3", "Anh sai rồi.mp3", "Chay ngay đi.mp3"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String albumName = request.getParameter("album");
        List<String> songs = albumSongs.get(albumName);

        request.setAttribute("album", albumName);
        request.setAttribute("songs", songs);

        RequestDispatcher dispatcher = request.getRequestDispatcher("songs.jsp");
        dispatcher.forward(request, response);
    }
}
