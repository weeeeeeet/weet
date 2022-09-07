package com.weet.app.exception;



public class ServiceException extends Exception {	
	private static final long serialVersionUID = 1L;


	public ServiceException(String message) {
		super(message);
	} // constructor #1
	
	
	public ServiceException(Exception e) {
		super(e);
	} // constructor #2	

} // end class
