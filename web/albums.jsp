<%@ page import="java.util.List" %>
<%@ page import="murach.music.Album" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Album</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #fdecec;
    text-align: center;
}
h2 {
    color: darkred;
}
.album-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 15px;
    margin-top: 30px;
}
.album-card {
    padding: 15px 30px;
    border: 2px solid red;
    border-radius: 10px;
    background: white;
    box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
    transition: 0.3s;
    font-weight: bold;
    width: 300px;
}
.album-card:hover {
    background: #ffe6e6;
    cursor: pointer;
}
a {
    text-decoration: none;
    color: purple;
}
a:hover {
    color: darkred;
}
</style>
</head>
<body>
<h2>Danh sách Album</h2>
<div class="album-container">
<%
List<Album> albums = (List<Album>) request.getAttribute("albums");
if (albums != null) {
    for (Album album : albums) {
%>
<div class="album-card">
    <a href="songs?album=<%= album.getName() %>">
        <%= album.getArtist() %> - <%= album.getName() %>
    </a>
</div>
<%
    }
}
%>
</div>
</body>
</html>
