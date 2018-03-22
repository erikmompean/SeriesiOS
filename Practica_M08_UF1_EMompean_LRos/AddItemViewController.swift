//
//  AddItemViewController.swift
//  Practica_M08_UF1_EMompean_LRos
//
//  Created by Alumne on 8/3/18.
//  Copyright © 2018 CFGS La Salle Gracia. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var autorTextField: UITextField!
    @IBOutlet weak var prioridadTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    
    var database:FMDatabase = SQLiteSingleton.getInstance()
    var counter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func verBB(){
        if database.open(){
            let arg:[Any] = [Any]()
            if let resultSet = database.executeQuery("select * from series", withArgumentsIn: arg){
                while(resultSet.next()){
                    print(resultSet.string(forColumnIndex: 1))
                }
                
            }
            
            database.close()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save Segue" {
            if let tdlvc = segue.destination as? TableTableViewController{
                if let nombreText = nombreTextField.text , let autorText = autorTextField.text , let prioridadText = prioridadTextField.text, let statusText = statusTextField.text {
                    if !nombreText.isEmpty {
                        if database.open() {
                            if autorText.isEmpty {
                                
                            }
                            let insert = "INSERT INTO SERIES (NOMBRE , AUTOR , PRIORIDAD , STATUS) VALUES (?, ?, ?, ?)"
                            var data:[Any]=[Any]()
                            data.append(nombreText)
                            data.append(autorText)
                            data.append(prioridadText)
                            data.append(statusText)
                            
                            if !database.executeUpdate(insert, withArgumentsIn: data){
                                print(database.lastError().localizedDescription)
                            }else{
                                print("Insertado correctamente")
                            }
                            database.close()
                        }else{
                            print(database.lastError().localizedDescription)
                        }
                    }
                }
            }
        }
        verBB()
    }

}
