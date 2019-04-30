package examples.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 DROP SCHEMA IF EXISTS `UserData`;
CREATE SCHEMA IF NOT EXISTS `UserData` DEFAULT CHARACTER SET utf8;
USE `UserData`;

CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL,
  `user` varchar(20) NOT NULL,
  `sin` varchar(9) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `Users` (`id`, `user`, `sin`, `pass`)
VALUES
	(1, 'shawn', '111111111', 'nwahs'),
	(2, 'jack', '222222222', 'kcaj'),
	(3, 'roy', '333333333', 'yor'),
	(4, 'bob', '444444444', 'bob'); 
 */
//bob' or '1'='1
public class InjectionSample{

	private static final String ADDRESS = "jdbc:mysql://localhost:3306/UserData";
	private static final String USER = "cst8288";
	private static final String PASS = "8288";
	private final String QUERY = "select * from UserData.users where user='%s' and pass='%s'";
	private final String SAFE_QUERY = "select * from UserData.users where user=? and pass=?";
	private String user, pass;

	public void getLogin(){
		Scanner console = new Scanner( System.in);
		System.out.print( "User>>");
		user = console.nextLine();
		System.out.print( "Pass>>");
		pass = console.nextLine();
		console.close();
	}

	public String executeQuery(){
		StringBuilder builder = new StringBuilder();
		try( Connection con = DriverManager.getConnection( ADDRESS, USER, PASS);
				Statement statement = con.createStatement();
				ResultSet result = statement.executeQuery( String.format( QUERY, user, pass))){
			builder.append(String.format( QUERY, user, pass));
			builder.append(System.lineSeparator());
			builder.append( String.format( "%-6s%-8s%-12s%-10s%n",
					("ID"),
					("user"),
					("sin"),
					("pass")));
			while( result.next()){
				builder.append( String.format( "%-6d%-8s%-12s%-10s%n",
						result.getInt( "ID"),
						result.getString( "user"),
						result.getString( "sin"),
						result.getString( "pass")));
			}
		}catch( SQLException e){
			e.printStackTrace();
		}
		return builder.toString();
	}

	public String executeSafeQuery(){
		StringBuilder builder = new StringBuilder();
		try( Connection con = DriverManager.getConnection( ADDRESS, USER, PASS);
				PreparedStatement statement = con.prepareStatement(SAFE_QUERY)){
			statement.setString( 1, user);
			statement.setString( 2, pass);
			builder.append(statement);
			builder.append(System.lineSeparator());
			ResultSet result = statement.executeQuery();
			builder.append( String.format( "%-6s%-8s%-12s%-10s%n",
					("ID"),
					("user"),
					("sin"),
					("pass")));
			while( result.next()){
				builder.append( String.format( "%-6d%-8s%-12s%-10s%n",
						result.getInt( "ID"),
						result.getString( "user"),
						result.getString( "sin"),
						result.getString( "pass")));
			}
		}catch( SQLException e){
			e.printStackTrace();
		}
		return builder.toString();
	}

	public static void main( String[] arg){
		InjectionSample inject = new InjectionSample();
		inject.getLogin();
		System.out.println( "Unsafe");
		System.out.println( inject.executeQuery());
		System.out.println( "Safe");
		System.out.println( inject.executeSafeQuery());
	}
}
