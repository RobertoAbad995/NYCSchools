//
//  SchoolDetailsViewController.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import UIKit

class SchoolDetailsViewController: UIViewController {

    @IBOutlet weak var vsTitle: UIStackView!
    @IBOutlet weak var imgTitle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTotalStudents: UILabel!
    
    @IBOutlet weak var lblInfo: UIStackView!
    @IBOutlet weak var stackNoStudents: UIStackView!
    //    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vcLocation: UIView!
    @IBOutlet weak var svLocation: UIStackView!
    @IBOutlet weak var svDescription: UIStackView!
    
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDescription: UITextField!
    
    var locationView: LocationViewController?
    let containerSegueName = "vLocation"
    
    
    var s : School?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        prepareInfo()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func prepareInfo(){
//        lblTitle.text = s?.schoolName
        lblTitle.text = s?.school_name!
        lblTitle.layer.masksToBounds = true
        
        lblAbout.text = "About " + (s?.school_name ?? "About the school")
        lblDesc.text = s?.overview_paragraph
    }
    
    func prepareUI(){
        imgTitle.image = UIImage(named: "school0000\(Int.random(in: 1..<9)).jpg")
        imgTitle.contentMode = .scaleAspectFit
        imgTitle.frame = self.view.bounds
        
        
        imgTitle.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vsTitle.layer.masksToBounds = true
        vsTitle.layer.cornerRadius = 10
        vsTitle.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        
        
        //total students
        lblTotalStudents.text = "Total students " + s!.total_students!
        stackNoStudents.layer.masksToBounds = true
        stackNoStudents.layer.cornerRadius = 10

        
        stackNoStudents.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)

        lblInfo.layer.cornerRadius = 5
        
        //elements
        //add shadows to stack container of the view
        svLocation.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        svLocation.layer.shadowOffset = CGSize(width: -3,height: 4)
        svLocation.layer.shadowOpacity = 1
        svLocation.layer.shadowRadius = 2
        svLocation.layer.masksToBounds = false
        //add border radius to the VEIW
        vcLocation.layer.masksToBounds = true
        vcLocation.layer.cornerRadius = 15
        
        
        //description text
        svDescription.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        svDescription.layer.shadowOffset = CGSize(width: -3,height: 4)
        svDescription.layer.shadowOpacity = 1
        svDescription.layer.shadowRadius = 2
        svDescription.layer.masksToBounds = false
        
        lblDesc.lineBreakMode = .byWordWrapping
        lblDesc.numberOfLines = 0
        
//        prepareForSegue(segue: self, sender: <#T##AnyObject?#>)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        prepareForSegue(segue: segue, sender: nil)
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == containerSegueName {
            locationView = segue.destination as? LocationViewController
            locationView?.school = self.s
        }
    }

}
