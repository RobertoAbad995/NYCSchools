//
//  SchoolsTableViewController.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import UIKit

class SchoolsTableViewController: UITableViewController {

    var items = [School]()
    let business : NYCSchools = NYCSchools()
    var icon = UIImage(systemName: "building.columns.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        items = business.getList().sorted(by: { $0.schoolName < $1.schoolName })
        items = business.getList().sorted(by: { $0.school_name! < $1.school_name!})
    }

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return items.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = items[indexPath.row].schoolName
        cell.textLabel?.text = items[indexPath.row].school_name
        cell.detailTextLabel?.text = items[indexPath.row].overview_paragraph
//        cell.detailTextLabel?.text = items[indexPath.row].overviewParagraph
        cell.imageView?.image = icon
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let view = storyboard?.instantiateViewController(withIdentifier: "SchoolDetailsViewController") as! SchoolDetailsViewController
        view.s = items[indexPath.row]
        self.navigationController?.show(view, sender: nil)
    }
}
