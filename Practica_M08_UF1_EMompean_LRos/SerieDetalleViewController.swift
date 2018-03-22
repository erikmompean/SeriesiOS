//
//  SerieDetalleViewController.swift
//  Practica_M08_UF1_EMompean_LRos
//
//  Created by Alumne on 20/3/18.
//  Copyright © 2018 CFGS La Salle Gracia. All rights reserved.
//

import UIKit

class SerieDetalleViewController: UIViewController {
    
    var serie:Serie?
    
    @IBOutlet weak var nombreSerie: UILabel!
    @IBOutlet weak var autorSerie: UILabel!
    @IBOutlet weak var prioridadSerie: UILabel!
    @IBOutlet weak var statusSerie: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreSerie.text = serie?.nombre
        autorSerie.text = serie?.autor
        prioridadSerie.text = String(describing: serie!.prioridad)
        statusSerie.text = String(describing: serie!.status)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
