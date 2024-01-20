<%-- 
    Document   : editarpessoa
    Created on : 12 de jan. de 2024, 18:47:29
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Pessoa"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        <link rel="stylesheet" type="text/css" href="styles/editarpessoa.css">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
            Pessoa c = new Pessoa();
            c = c.consultarPessoa(idPessoa);
        %>
        
        <div class="container">
            <form id="pessoa" action="recebereditarpessoa.jsp" method="POST">
                <h3>Alterar Pessoa</h3>
                <p></p>
                
                <fieldset>
                    <div class="idColaborador">
                        <label>Pessoa</label>
                        <input type="text" name="idpessoa" readonly="true" value="<%= c.getIdPessoa() %>" />
                    </div>
                </fieldset>
                    
                <fieldset>
                    <div class="nomepessoa">
                        <label>Nome</label>
                        <input type="text" name="nomepessoa" required maxlength="40" value="<%= c.getNomePessoa() %>"  />
                    </div>
                </fieldset>
                    
                <fieldset>
                    <div class="email">
                        <label>Email</label>
                        <input type="email" name="email" required maxlength="50" value="<%= c.getEmail() %>"  />
                    </div>
                </fieldset>
                    
                <div class="row">
                    <div class="form-group col-md-3 h-10">
                        <input type="submit" value="Alterar" class="btn btn-primary" />
                    </div>
                    <div class="form-group col-md-3 h-10">
                        <input type="reset" value="Cancelar" class="btn btn-danger" />
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
