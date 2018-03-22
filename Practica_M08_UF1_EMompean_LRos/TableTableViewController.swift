//
//  TableTableViewController.swift
//  Practica_M08_UF1_EMompean_LRos
//
//  Created by Alumne on 8/3/18.
//  Copyright © 2018 CFGS La Salle Gracia. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    var serieDB:FMDatabase=SQLiteSingleton.getInstance()
    var seriesManager = SeriesManager()
    var valueToPass:Serie!
    @IBAction func goBack(segue :  UIStoryboardSegue){
        seriesManager.selectAllSeries()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDataBase()
    }
    
    func setUpDataBase(){
        if serieDB.open(){
            if !serieDB.executeStatements("CREATE TABLE IF NOT EXISTS SERIES (ID_SERIE INTEGER PRIMARY KEY AUTOINCREMENT, NOMBRE TEXT, AUTOR TEXT, PRIORIDAD TEXT, STATUS TEXT)"){
                print(serieDB.lastError().localizedDescription)
            }
            if !serieDB.executeStatements("CREATE TABLE IF NOT EXISTS GENEROS (ID_GENERO INTEGER PRIMARY KEY AUTOINCREMENT, NOMBRE TEXT, DESCRIPCION TEXT)"){
                print(serieDB.lastError().localizedDescription)
            }
            if !serieDB.executeStatements("CREATE TABLE IF NOT EXISTS GENEROS_SERIES (ID_GENERO_SERIE INTEGER PRIMARY KEY AUTOINCREMENT, ID_GENERO INTEGER , ID_SERIE INTEGER, FOREIGN KEY(ID_GENERO) REFERENCES GENEROS(ID_GENERO), FOREIGN KEY(ID_SERIE) REFERENCES SERIE(ID_SERIE))"){
                print(serieDB.lastError().localizedDescription)
            }
            serieDB.close()
        } else {
            print(serieDB.lastError().localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let segueIdentifier = segue.identifier{
                if segueIdentifier=="Detail"{
                    if let cell = sender as? UITableViewCell{
                        if let indexPath = tableView.indexPath(for: cell){
           
                            if let navigationController = segue.destination as? UINavigationController{
                                if let serieDetailViewController = navigationController.visibleViewController as? SerieDetalleViewController{
                                    serieDetailViewController.serie=seriesManager.series[indexPath.row]
                                }
                            }
                        }
                    }
                }else if segueIdentifier==""{
                    
                }
            }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesManager.series.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        let serie:Serie = seriesManager.series[indexPath.row]
        valueToPass = serie
        cell.textLabel?.text = serie.nombre
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            seriesManager.deleteSerie(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }

}

