<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="models.Pessoa" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles/cadastropessoa.css" type="text/css" rel="stylesheet" >
    <title>JSP Page</title>
</head>
<body>
    <div class="container">
        <form id="pessoa" action="/PessoaWeb/receberdadospessoa.jsp" method="POST">
            <h3>Cadastro de Pessoas</h3>
            <p></p>
            <label class="cabecalho" id="msg">
                <% if (request.getParameter("pmensagem") != null) out.write(request.getParameter("pmensagem")); %>
            </label>
            
            <!-- Paragrafo oculo para exibir a mensagem de sucesso-->
            <p id="mensagemSucesso" style="display: none; color: green;">Cadastro realizado com sucesso!</p>
            <!-- Nome -->
            <div class="box-nome-email-pessoa">
                <fieldset>
                    <label>Nome</label>
                    <div class="nomepessoa">
                        <input id="nomepessoa" name="nomepessoa" placeholder="Informe o nome" type="text" required maxlength="40" style="text-transform: uppercase" />
                    </div>
                </fieldset>

                <fieldset>
                    <label>Email</label>
                    <div class="email">
                        <input id="email" name="email" placeholder="Informe o email" type="email" required maxlength="50" />
                    </div>
                </fieldset><br>
            </div>

            <div class="box-btn-cadastrar-cancelar">
                <div class="form-group col-md-3 h-10">
                    <input type="submit" value="Cadastrar" class="btn btn-primary" onclick="enviaForm()" />
                </div>

                <div class="form-group col-md-3 h-10">
                    <input type="button" value="Cancelar" class="btn btn-danger" onclick="cancelarCadastro()" />
                </div>
            </div>
        </form>
    </div>
            
    <script>
        function enviaForm() {
            // impedindo envio do formulário automaticamente
            event.preventDefault();
            
            // submetendo o formulário com AJAX
            $.ajax({
                type: 'POST',
                url: '/PessoaWeb/receberdadospessoa.jsp',
                data: $('#pessoa').serialize(), // serializa os dados do formulário
                success: function(data) {
                    //Sucesso na submissão
                    // pode ser enviado para index.html
                $('#mensagemSucesso').show();    
                setTimeout(function() {
                        window.location.href = 'index.html';
                    }, 3000)
                },
                error: function(error) {
                    console.error('Erro ao enviar formulario: ', error);
                }
            });
        }

        function cancelarCadastro() {
            window.location.href = 'index.html';
        }
    </script>
</body>
</html>
