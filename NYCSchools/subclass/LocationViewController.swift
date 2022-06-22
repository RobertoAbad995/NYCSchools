//
//  LocationViewController.swift
//  NYCSchools
//
//  Created by Consultant on 6/16/22.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblNeighboor: UILabel!
    @IBOutlet weak var lblBus: UILabel!
    @IBOutlet weak var lblTrain: UILabel!
    
    var school: School?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblLocation.text = school?.location
        lblNeighboor.text = school?.neighborhood
        lblBus.text = school?.bus
        lblTrain.text = school?.subway
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
