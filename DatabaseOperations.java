package DBDesign.ProgAsg1;

import java.sql.*;
import java.util.Iterator;
import java.util.Vector;

import javax.swing.table.DefaultTableModel;

public class DatabaseOperations {
	Connection con = null;
	Statement stmt;
	ResultSet rs;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?autoReconnect=true&useSSL=false", "root", "momldad");
			//Statement stmt = con.createStatement();
		} catch (ClassNotFoundException e) {

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public ResultSet execQuery(String query){
		
		try {
			stmt = getConnection().createStatement();
			 rs = stmt.executeQuery(query);
			 return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;		
	}
	
	public int execUpdate(String updateStmt){
		Statement stmt;
		int rowsAffected=0;
		try {
			stmt = getConnection().createStatement();
			rowsAffected= stmt.executeUpdate(updateStmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return rowsAffected;
	}
	public void closeCon(){
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
