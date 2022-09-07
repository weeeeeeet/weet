package com.weet.app.exception;



public class DAOException extends Exception {	
	private static final long serialVersionUID = 1L;


	public DAOException(String message) {
		super(message);
	} // constructor #1
	
	
	public DAOException(Exception e) {
		super(e);
	} // constructor #2	

} // end class
