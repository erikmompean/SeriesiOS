//
//  SQLiteSingleton.swift
//  Practica_M08_UF1_EMompean_LRos
//
//  Created by Alumne on 13/3/18.
//  Copyright © 2018 CFGS La Salle Gracia. All rights reserved.
//

import Foundation
private let dataBaseName:String = "SeriesPelis.db"
private var databasePath:String = String()
private var database:FMDatabase?
class SQLiteSingleton {

    class func getInstance()->FMDatabase {
        if(database == nil){
            let fileManager = FileManager()
            
            if let dirDocument = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
                let dataBaseURL = dirDocument.appendingPathComponent(dataBaseName)
                databasePath = dataBaseURL.absoluteString
                database = FMDatabase(path: databasePath)
            }
        }
        return database!
    }
}
