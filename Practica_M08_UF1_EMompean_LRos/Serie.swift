//
//  Serie.swift
//  Practica_M08_UF1_EMompean_LRos
//
//  Created by Alumne on 15/3/18.
//  Copyright © 2018 CFGS La Salle Gracia. All rights reserved.
//

import Foundation

class Serie{
    var id:Int
    var nombre:String
    var autor:String
    var prioridad:String
    var status:String
    
    init(id:Int, nombre:String, autor:String, prioridad:Int, status:Int) {
        self.id = id
        self.nombre = nombre
        self.autor = autor
        switch prioridad {
        case 0:
            self.prioridad = "Baja"
        case 1:
            self.prioridad = "Media"
        case 2:
            self.prioridad = "Alta"
        default:
            self.prioridad = "Media"
        }
        
        if status == 0 {
            self.status = "En emision"
        } else {
            self.status = "Terminada"
        }
        
    }
    
}
