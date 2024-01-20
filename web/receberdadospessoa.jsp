<%-- 
    Document   : receberdadospessoa
    Created on : 11 de jan. de 2024, 15:27:45
    Author     : lucas
--%>
<%@page import="models.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
    try {
        // recebe os valores na tela
        String vnomepessoa = request.getParameter("nomepessoa");
        String vemail = request.getParameter("email");

        Pessoa pes = new Pessoa();
        pes.setNomePessoa(vnomepessoa);
        pes.setEmail(vemail);

        if (pes.IncluirPessoa()) {
            response.sendRedirect("/PessoaWeb/cadastrarpessoa.jsp?pmensagem=Pessoa cadastrada com sucesso");
        } else {
            response.sendRedirect("/PessoaWeb/cadastrarpessoa.jsp?pmensagem=Problemas ao cadastrar pessoa");
        }

    // Adicione este bloco catch
    } catch (Exception e) {
        out.println("Erro no processamento: " + e.getMessage());
        e.printStackTrace();
    }
%>
