/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

import utils.Conexao;
import java.sql.Connection;

/**
 *
 * @author lucas
 */
public class Principal {

    public static void main(String[] args) {
        Connection conexao = Conexao.conectar();
        Conexao.criarTabelaPessoa();
        Conexao.desconectar(conexao);
    }
    
}
