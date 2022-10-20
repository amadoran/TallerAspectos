package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	File file = new File("Log.txt");
	Calendar cal = Calendar.getInstance();
	
	pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut retiro() : call(* moneyWithdrawal*(..) );
    after(): retiro(){
    	System.out.println("**** Retiro excitoso ****");
    	escribeArchivo("retiro");
    }
    
    pointcut transaccion(): call (* moneyMake*(..) );
    after (): transaccion() {
    	System.out.println("**** Transacción exitosa ****");
    	escribeArchivo("transacción");
    }
    
    private void escribeArchivo(String tipo) {
    	try(BufferedWriter bs = new BufferedWriter(new FileWriter(file.getPath(), true))){
    		bs.write("Tipo de transacción: " + tipo + " - Hora: " + cal.getTime());
    		bs.newLine();
    	} catch (IOException e) {
			e.getCause();
		}
    } 
}
