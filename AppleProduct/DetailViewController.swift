//
//  DetailViewController.swift
//  AppleProduct
//
//  Created by NEXTAcademy on 10/27/17.
//  Copyright © 2017 asd. All rights reserved.
//

import UIKit

protocol changeTitleBarDelegate {
    func changeTitleBar(_ string: String)
}

class DetailViewController: UIViewController {
    
    var product = Product()
    var titleText = ""

    @IBOutlet weak var titleTextBar: UITextField!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    var delegate : changeTitleBarDelegate?
    
    @IBAction func wikiButton(_ sender: Any) {
        let string = product.url!
        let url = URL(string: string)
        let request = URLRequest(url: url!)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier:
        "WikiViewController") as! WikiViewController
        vc.request = request
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "Edit" {
            nameTextField.isEnabled = true
            dateTextField.isEnabled = true
            titleTextBar.isEnabled = true
            sender.setTitle("Change!", for: .normal)
        } else {
            nameTextField.isEnabled = false
            dateTextField.isEnabled = false
            titleTextBar.isEnabled = false
            product.name = nameTextField.text
            product.launchDate = dateTextField.text
            delegate?.changeTitleBar(titleTextBar.text!)
            sender.setTitle("Edit", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = product.image
        nameTextField.text = product.name
        dateTextField.text = product.launchDate
        titleTextBar.text = titleText

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
