<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Songs</title>
<style>
body { font-family: Arial; background: #ffe6e6; text-align: center; }
h2 { color: darkred; }
.song-card { margin: 10px auto; width: 350px; padding: 10px; border: 1px solid red; border-radius: 5px; background: white; }
a { text-decoration: none; color: darkblue; }
a:hover { color: darkred; }
audio { outline: none; }
</style>
</head>
<body>
<%
    String albumName = (String) request.getAttribute("album");
    List<String> songs = (List<String>) request.getAttribute("songs");
%>
<h2>Album: <%= albumName %></h2>
<h3>Danh sách bài hát</h3>

<% if (songs != null) {
    for (String song : songs) { %>
        <div class="song-card">
            🎵 <%= song.replace(".mp3","") %>
            <br>
            <audio controls style="margin-top:5px; width:300px;">
                <source src="music/<%= song %>" type="audio/mpeg">
                Trình duyệt của bạn không hỗ trợ phát nhạc
            </audio>
            <br>
            <a href="music/<%= song %>" download>Tải về</a>
        </div>
<%  }
} %>

<br>
<a href="albums">← Quay lại Album</a>

<!-- ---------- Script: chỉ cho phép 1 audio chạy cùng lúc ---------- -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // lấy tất cả các thẻ <audio> trên trang
    const audios = Array.from(document.querySelectorAll('audio'));

    audios.forEach(current => {
        current.addEventListener('play', function() {
            audios.forEach(a => {
                if (a !== current) {
                    a.pause();
                    // nếu bạn muốn reset về đầu khi bị pause, bỏ comment dòng dưới:
                    // a.currentTime = 0;
                }
            });
        });
    });
});
</script>

</body>
</html>
