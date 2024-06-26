<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Deletar Jogo</title>
        <!-- <link rel="stylesheet" href="/app/src/main/webapp/css/bootstrap.min.css"> -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>        
        <%@ include file = "../_templates/navbar.jsp"%>
        <div class="contanier">

            <h1>Deletar Jogo</h1>
            
            <form action="/jogos/delete" method="post">
                <input type="hidden" name="id" value="${jogo.id}">
                <p>Tem certeza que deseja remover o jogo ${jogo.titulo}?</p>
                <a href="/jogos/list" class="btn btn-secondary">Voltar</a>
                <button type="submit" class="btn btn-danger">Remover</button>
            </form>
        </div>
    </body>
</html>

