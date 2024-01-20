/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author lucas
 */
public class Pessoa {
    private int idPessoa;
    private String nomePessoa;
    private String email;
   
    public boolean IncluirPessoa() {
        String sql = "insert into pessoa (nomePessoa, email) values (?, ?);";
        Connection con = Conexao.conectar();

        if (con == null) {
            System.out.println("Erro ao obter conexão.");
            return false;
        }

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomePessoa);
            stm.setString(2, this.email);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage() + " SQL: " + sql);
            ex.printStackTrace();
            return false;
        } finally {
            Conexao.desconectar(con);
        }

        System.out.println("Pessoa cadastrada com sucesso!");
        return true;
    }




    
    public boolean alterarPessoa() {
        Connection con = Conexao.conectar();
        
        String sql = "update pessoa ";
               sql += "set nomePessoa = ?, ";
               sql += " email = ? ";
               sql += " where idPessoa = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomePessoa);
            stm.setString(2, this.email);
            stm.setInt(3, this.idPessoa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro" + ex.getMessage());
            return false;
        }
        return true;
        
    }
    
    public boolean excluirPessoa() {
        Connection con = Conexao.conectar();
        
        String sql = "delete from pessoa ";
               sql += "where idPessoa = ?";
               
               
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idPessoa);
            stm.execute();
            
        } catch (SQLException ex) {
            System.out.println("Erro" + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public List<Pessoa> consultarPessoas() {
        List<Pessoa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        
        String sql = "select idPessoa, nomePessoa, email ";
               sql += "from pessoa ";
               sql += "order by 2";
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                Pessoa pessoa = new Pessoa();
                pessoa.setIdPessoa(rs.getInt("idPessoa"));
                pessoa.setNomePessoa(rs.getString("nomePessoa"));
                pessoa.setEmail(rs.getString("email"));
                lista.add(pessoa);
            }
        } catch (SQLException ex) {
            System.out.println("Erro" + ex.getMessage());
        }
        
        return lista;
    }
    
    public Pessoa consultarPessoa(int pIdPessoa) {
        Connection con = Conexao.conectar();

        String sql = "select idPessoa, nomePessoa, email ";
        sql += "from pessoa ";
        sql += "where idPessoa = ?";

        Pessoa colab = null;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pIdPessoa);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                colab = new Pessoa();  // Corrigido aqui, cria uma nova instância de Pessoa
                colab.setIdPessoa(rs.getInt("idPessoa"));
                colab.setNomePessoa(rs.getString("nomePessoa"));
                colab.setEmail(rs.getString("email"));
            }
        } catch(SQLException ex ) {
            System.out.println("Erro: " + ex.getMessage());
        } finally {
            Conexao.desconectar(con);  // Certifique-se de fechar a conexão no bloco finally
        }

        return colab;
    }


    public int getIdPessoa() {
        return this.idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getNomePessoa() {
        return this.nomePessoa;
    }

    public void setNomePessoa(String nomePessoa) {
        this.nomePessoa = nomePessoa;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
    
}
