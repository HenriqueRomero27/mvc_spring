<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Editar Jogo</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file = "../_templates/navbar.jsp"%>
        <div class="container">
            <h1>Editar Jogo</h1>
            <form action="/jogos/update" method="post">
                <input type="hidden" name="id" value="${jogo.id}">
                <div>
                    <label for="titulo" class="form-label">Título do Jogo</label>
                    <input type="text" id="titulo" name="titulo" class="form-control" value="${jogos.titulo}"  />
                </div>
                <div>
                    <label for="multiplayer" class="form-label">Multiplayer</label>
                    <input type="text" id="multiplayer" name="multiplayer" class="form-control" value="${jogos.multiplayer}"  />
                </div>
                <div>
                    <label for="genero" class="form-label">Gênero:</label>
                    <select name="genero" id="genero" class="form-select">
                        <c:forEach var="item" items="${generos}">
                            <option ${item.id == jogos.genero.id ? "selected" : ""} value="${item.id}">${item.nome}</option>
                        </c:forEach>
                    </select>
                </div>
                <a href="/jogos/list" class="btn btn-secondary">Voltar</a>
                <button type="submit" class="btn btn-success">Salvar</button>
            </form>
        </div>
        </body>
</html>

