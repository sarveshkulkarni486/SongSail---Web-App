package com.example.music;

import java.sql.*;
import java.util.*;
public class DatabaseConfig {
	private static final String url = "jdbc:mysql://localhost:3309/music";
	private static final String dbuser = "root";
	private static final String password = "Sarvesh@2001";
	
	private static final int INITIAL_POOL_SIZE = 5;
	private static final int MAX_POOL_SIZE = 10;
	
	private List<Connection> connectionPool;
	
	public DatabaseConfig() throws SQLException {
		initializeConnectionPool();
	}
	private void initializeConnectionPool() throws SQLException {
		connectionPool = new ArrayList<>(INITIAL_POOL_SIZE);
		for(int i=0; i<INITIAL_POOL_SIZE; i++) {
			Connection con = DriverManager.getConnection(url, dbuser, password);
			connectionPool.add(con);
		}
	}
	public synchronized Connection getConnection() throws SQLException {
		if(connectionPool.isEmpty()) {
			if(connectionPool.size()<MAX_POOL_SIZE) {
				Connection newcon = DriverManager.getConnection(url, dbuser, password);
				connectionPool.add(newcon);
				return newcon;
			} else {
				throw new SQLException("Connection pool exhausted, try again later");
			}
		} else {
			return connectionPool.remove(connectionPool.size()-1);
		}
	}
	public synchronized void releaseConnection(Connection conn) {
		connectionPool.add(conn);
	}
	
	public synchronized void closeConnection() throws SQLException {
		for(Connection conn : connectionPool) {
			conn.close();
		}
		connectionPool.clear();
	}


}
