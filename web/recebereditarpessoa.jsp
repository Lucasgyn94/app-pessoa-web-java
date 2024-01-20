<%-- 
    Document   : recebereditarpessoa
    Created on : 12 de jan. de 2024, 19:04:20
    Author     : lucas
--%>
<%@page import="models.Pessoa" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
        // recebe os valores da tela
        int vidpessoa = Integer.parseInt(request.getParameter("idpessoa"));
        String vnomepessoa = request.getParameter("nomepessoa");
        String vemail = request.getParameter("email");
        
        Pessoa pes = new Pessoa();
        pes.setIdPessoa(vidpessoa);
        pes.setNomePessoa(vnomepessoa);
        pes.setEmail(vemail);
        
        if (pes.alterarPessoa()) {
            response.sendRedirect("consultarpessoa.jsp?pmensagem=Pessoa alterada com sucesso");
        } else {
            response.sendRedirect("consultarpessoa.jsp?pmensagem=Problemas ao salvar pessoa");
        }
    %>
