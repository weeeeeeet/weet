package com.weet.app.exception;



public class ControllerException extends Exception {	
	private static final long serialVersionUID = 1L;


	public ControllerException(String message) {
		super(message);
	} // constructor #1
	
	
	public ControllerException(Exception e) {
		super(e);
	} // constructor #2	

} // end class
