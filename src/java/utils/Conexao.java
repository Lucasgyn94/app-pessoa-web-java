/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author lucas
 */
public class Conexao {
    private static final String URL = "jdbc:postgresql://localhost:5432/pessoadb";
    private static final String USUARIO = "postgres";
    private static final String SENHA = "carros14";
    
    public static void criarTabelaPessoa() {
        Connection conexao = null;
        Statement stmt = null;

        try {
            conexao = conectar();
            stmt = conexao.createStatement();

            // Script SQL para DROP TABLE IF EXISTS
            String dropTableSQL = "DROP TABLE IF EXISTS pessoa";
            stmt.executeUpdate(dropTableSQL);

            // Script SQL para CREATE TABLE
            String createTableSQL = "CREATE TABLE pessoa ("
                + "idPessoa SERIAL PRIMARY KEY,"
                + "nomePessoa VARCHAR(255) NOT NULL,"
                + "email VARCHAR(255) NOT NULL)";
            stmt.executeUpdate(createTableSQL);

            System.out.println("Tabela pessoa criada com sucesso!");
        } catch (SQLException ex) {
            System.out.println("Erro ao criar a tabela pessoa: " + ex.getMessage());
        } finally {
            // Fechar recursos
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    System.out.println("Erro ao fechar o Statement: " + ex.getMessage());
                }
            }
            desconectar(conexao);
        }
    }
    
    
    public static Connection conectar() {
        Connection conexao = null;
        try {
            Class.forName("org.postgresql.Driver"); // Adicione esta linha
            conexao = DriverManager.getConnection(URL, USUARIO, SENHA);
            testarConexao(conexao);
        } catch (SQLException ex) {
            System.out.println("Erro ao conectar ao banco de dados: " + ex.getMessage());
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver do PostgreSQL não encontrado. Certifique-se de ter o driver JDBC correto no classpath.");
            ex.printStackTrace();
        }
        return conexao;
    }


    
    public static void desconectar(Connection conexao) {
        try {
            if (conexao != null && !conexao.isClosed()) {
                conexao.close();
                System.out.println("Conexão encerrada com sucesso!");
            }
        } catch(SQLException ex) {
            System.out.println("Erro ao fechar a conexão: " + ex.getMessage());
        }
    }
    
    private static void testarConexao(Connection conexao) {
        if (conexao != null) {
            System.out.println("Conexão estabelecida com sucesso");
        } else {
            System.out.println("Falha ao estabelecer conexão");
        }
    }
}
