//
//  SeriesManager.swift
//  Practica_M08_UF1_EMompean_LRos
//
//  Created by Alumne on 15/3/18.
//  Copyright © 2018 CFGS La Salle Gracia. All rights reserved.
//

import Foundation

class SeriesManager {
    var series:[Serie] = [Serie]()
    var seriesDB:FMDatabase = SQLiteSingleton.getInstance()
    var data:[Any] = [Any]()
    
    init() {
        selectAllSeries()
    }

    func selectAllSeries(){
        let sql:String = "SELECT * FROM SERIES"
        series=[Serie]()
        if seriesDB.open(){
            if let resultSet = seriesDB.executeQuery(sql , withArgumentsIn: data){
                while(resultSet.next()){
                    let serie = Serie(id: Int(resultSet.int(forColumnIndex: 0)), nombre: resultSet.string(forColumnIndex: 1)!, autor: resultSet.string(forColumnIndex: 2)!, prioridad: Int(resultSet.long(forColumnIndex: 3)), status: Int(resultSet.int(forColumnIndex: 4)))
                    self.series.append(serie)
                    
                    
                }
                resultSet.close()
                
            }
            seriesDB.close()
        } else {
            print("Error : \(seriesDB.lastErrorMessage())" )
        }
    }
    
    func addSerie(serie:Serie){
        self.series.append(serie)
    }
    func deleteSerie(index:Int) {
        self.series.remove(at: index)
    }
    

    
}
