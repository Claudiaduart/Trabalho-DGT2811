package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/ServletProdutoFC"})
public class ServletProdutoFC extends HttpServlet {

    @EJB
    ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String destino;

        if ("formIncluir".equals(acao) || "formAlterar".equals(acao)) {
            destino = "ProdutoDados.jsp";
        } else {
            destino = "ProdutoLista.jsp";
        }

        if ("listar".equals(acao)) {
            request.setAttribute("listaProdutos", facade.findAll());

        } else if ("formAlterar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("produto", facade.find(id));

        } else if ("excluir".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            facade.remove(facade.find(id));
            request.setAttribute("listaProdutos", facade.findAll());

        } else if ("alterar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = facade.find(id);
            produto.setNome(request.getParameter("nome"));
            produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
            facade.edit(produto);
            request.setAttribute("listaProdutos", facade.findAll());

        } else if ("incluir".equals(acao)) {
            Produto produto = new Produto();
            produto.setNome(request.getParameter("nome"));
            produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
            facade.create(produto);
            request.setAttribute("listaProdutos", facade.findAll());
        }

        request.getRequestDispatcher(destino).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
