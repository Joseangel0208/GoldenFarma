/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package facturacion;

/**
 *
 * @author emiliano
 */
public class IVA {
    
    private Double precio;
    
    
    public IVA(Double precio) {
        this.precio = precio;
       
    }
   
    public  Double calcular_iva()
    { 
        double iva;               
        iva = precio*15/100;
        return iva;
        
    }
    }

