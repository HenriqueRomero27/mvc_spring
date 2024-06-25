<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Novo Jogo</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file = "../_templates/navbar.jsp"%>
        <div class="container">
            <h1>Novo Jogo</h1>
            <form action="/jogos/insert" method="post">
                <div>
                    <label class="form-label" for="nome">Título do Jogo</label>
                    <input class="form-control" type="text" id="titulo" name="titulo" placeholder="Digite o título do Jogo" />
                </div>
                <div>
                    <label for="multiplayer" class="form-label">Multiplayer</label>
                    <input type="text" id="multiplayer" name="multiplayer" class="form-control" placeholder="Digite se o jogo é muiltiplayer ou não"  />
                </div>
                <label class="form-label" for="genero">Selecione o gênero do jogo</label>
                <select class="form-select" name="genero" id="generos">
                    <c:forEach var="item" items="${genero}">
                        <option value="${item.id}">${item.nome}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-success">Salvar</button>
           
                </form>
                <br />
                <a href="/jogos/list" class="btn btn-secondary">Voltar</a>
            </form>
        </div>
    </body>
</html>

