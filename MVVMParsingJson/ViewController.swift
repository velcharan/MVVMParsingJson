//
//  ViewController.swift
//  MVVMParsingJson
//
//  Created by velcharan sridhar on 09/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var modelTableView: UITableView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    var ViewModel = CourseViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewModel.vc = self
        ViewModel.FAQSeerviceCall()
    }
}

extension ViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.faq_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = modelTableView.dequeueReusableCell(withIdentifier: "ModelTableViewCell", for: indexPath) as! ModelTableViewCell
        //let mycourse = self.ViewModel.course_arr[indexPath.row]
        let myFaq = self.ViewModel.faq_arr[indexPath.row]
        cell.faqCell = myFaq
        return cell
    }
}

