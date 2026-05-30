<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cadastroee.model.Produto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container">
    <%
        Produto produto = (Produto) request.getAttribute("produto");
        String acao = (produto == null) ? "incluir" : "alterar";
        String textoBotao = (produto == null) ? "Incluir" : "Alterar";
    %>
    <h2><%= (produto == null) ? "Novo Produto" : "Alterar Produto" %></h2>
    <form action="ServletProdutoFC" method="post" class="form">
        <input type="hidden" name="acao" value="<%= acao %>">
        <% if ("alterar".equals(acao)) { %>
        <input type="hidden" name="id" value="<%= produto.getId() %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">Nome</label>
            <input type="text" name="nome" class="form-control" value="<%= (produto != null) ? produto.getNome() : "" %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Quantidade</label>
            <input type="text" name="quantidade" class="form-control" value="<%= (produto != null) ? produto.getQuantidade() : "" %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Preço de Venda</label>
            <input type="text" name="precoVenda" class="form-control" value="<%= (produto != null) ? produto.getPrecoVenda() : "" %>">
        </div>
        <button type="submit" class="btn btn-primary"><%= textoBotao %></button>
    </form>
</body>
</html>
