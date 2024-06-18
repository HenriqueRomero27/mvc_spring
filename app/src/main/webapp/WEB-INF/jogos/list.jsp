
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Lista de Jogos</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file = "../_templates/navbar.jsp"%>
        <div class="container">
            <h1>Lista de Jogos</h1>
            <a href="/jogos/insert" class="btn btn-primary">Novo Jogo</a>
            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Gênero</th>
                    <th>Multiplayer</th>
                    <th>&nbsp;</th>
                </tr>
                <c:forEach var="item" items="${jogos}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.titulo}</td>
                        <td>${item.genero.nome}</td>
                        <td>${item.multiplayer}</td>
                        <td>
                            <a class="btn btn-secondary" href="/jogos/update?id=${item.id}">Editar</a>
                            <a class="btn btn-danger" href="/jogos/delete?id=${item.id}">Deletar</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

