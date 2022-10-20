package com.bank;

import java.io.File;
import java.util.Calendar;

public aspect Logger {
	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	
	pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut retiro() : call(* moneyWithdrawal*(..) );
    after(): retiro(){
    	System.out.println("**** Retiro excitoso ****");
    }
    
    
}
