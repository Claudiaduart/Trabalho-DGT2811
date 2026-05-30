<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cadastroee.model.Produto, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Produtos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container">
    <h2>Lista de Produtos</h2>
    <a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a>
    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Produto> lista = (List<Produto>) request.getAttribute("listaProdutos");
                if (lista != null) {
                    for (Produto p : lista) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getNome() %></td>
                <td><%= p.getQuantidade() %></td>
                <td><%= p.getPrecoVenda() %></td>
                <td>
                    <a href="ServletProdutoFC?acao=formAlterar&id=<%= p.getId() %>" class="btn btn-primary btn-sm">Alterar</a>
                    <a href="ServletProdutoFC?acao=excluir&id=<%= p.getId() %>" class="btn btn-danger btn-sm">Excluir</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
