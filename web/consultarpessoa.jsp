<%-- 
    Document   : consultarpessoa.jsp
    Created on : 12 de jan. de 2024, 13:12:49
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.Pessoa" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/consultarpessoa.css">
        <title>JSP Page</title>
        
    </head>
    <body>
        <% 
            Pessoa pes = new Pessoa();
            List<Pessoa> listapessoas = pes.consultarPessoas();
        %>
        <h4 class="text-center">Consulta de Pessoas</h4>
        
        <!-- label para lançar mensagem de feedback da atualização -->
        <label class="cabecalho" id="msg">
            <% if(request.getParameter("pmensagem") != null) { out.write(request.getParameter("pmensagem")); } %>
        </label>
        
        <table id="consulta" class="table">
            <thead class="thead-dark">
                <th>Nome</th>
                <th>Email</th>
                <th>Editar</th>
                <th>Excluir</th>
            </thead>
            <tbody>
            <% for (Pessoa p : listapessoas) { %>
                <tr>
                    <td><%= p.getNomePessoa() %></td>
                    <td><%= p.getEmail() %></td>

                    <!-- Botão de Editar -->
                    <td class="box-btn-editar">
                        <a href='editarpessoa.jsp?idPessoa=<%= p.getIdPessoa() %>'>
                            <button type="button" class="botaoeditar">
                                Editar <i class='far fa-edit' style='color: blue'></i>
                            </button>
                        </a>
                    </td>

                    <!-- Botão de Excluir -->
                    <td class="box-btn-excluir">
                        <button type="button" class="botaoexcluir" onclick="mostrarExclusao(<%= p.getIdPessoa() %>)">
                            Excluir <i class="far fa-trash-alt" style="color: red"></i>
                        </button>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>

        <!-- Pop-up de Exclusão -->
        <div class="msg-popup2">
            <h5 class="text-center" style="color: #ffffff; font-size: arial-bold">Exclusão</h5>
            <h5 class="text-center" style="color: #ffffff">Confirmar a <b>exclusão</b> do registro ? </h5>
            <div class="text-center">
                <a href="#"> <button class="btn btn-dark" onclick="cancela()">Não</button> </a>
                <a id="excluir" href="#"> <button class="btn btn-danger" onclick="confirmarExclusao()">Sim</button> </a>
            </div>
        </div>

        <!-- Script JavaScript -->
        <script>
            function cancela(){
                document.getElementsByClassName("msg-popup2")[0].style.display="none";
            }

            function mostrarExclusao(pessoa) {
                document.getElementsByClassName("msg-popup2")[0].style.display="block";
                var link = document.getElementById("excluir");
                link.href = "excluirpessoa.jsp?idpessoa=" + pessoa;
            }

            function confirmarExclusao() {
                // Adicione qualquer lógica adicional para confirmar a exclusão se necessário
                // Por exemplo, você pode querer exibir uma mensagem de confirmação antes de redirecionar
                // Se estiver tudo bem, você pode redirecionar diretamente daqui
                window.location.href = document.getElementById("excluir").href;
            }
        </script>
    </body>
</html>
