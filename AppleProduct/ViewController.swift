//
//  ViewController.swift
//  AppleProduct
//
//  Created by NEXTAcademy on 10/27/17.
//  Copyright © 2017 asd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleBar: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    let array = ["Macbook_Air","MacBook_with_Retina_Display","White_AppleWatch_with_Screen","IMac_vector.svg","190px-IPad_Mini_4_ClearPhoto"]
    var products : Array<Product> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleBar.title = "Apple Product List"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for name in array {
            let image = UIImage(named: name)
            let product = Product()
            product.image = image
            products.append(product)
        }
        
        products[0].name = "MacBook Air"
        products[1].name = "MacBook (Retina)"
        products[2].name = "Apple Watch"
        products[3].name = "iMac"
        products[4].name = "iPad Mini 4"
        
        products[0].launchDate = "June 5, 2017"
        products[1].launchDate = "June 5, 2017"
        products[2].launchDate = "April 24, 2015"
        products[3].launchDate = "December 2017"
        products[4].launchDate = "October 11, 2017"
        
        products[0].url = "https://en.wikipedia.org/wiki/MacBook_Air"
        products[1].url = "https://en.wikipedia.org/wiki/MacBook_(Retina)"
        products[2].url = "https://en.wikipedia.org/wiki/Apple_Watch"
        products[3].url = "https://en.wikipedia.org/wiki/IMac"
        products[4].url = "https://en.wikipedia.org/wiki/IPad_Mini_4"
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! iPhoneTableViewCell
        let currentProduct = products[indexPath.row]
        cell.appleImageView.image = currentProduct.image
        cell.productLabel.text = currentProduct.name
        cell.launchDateLabel.text = currentProduct.launchDate
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.delegate = self
        vc.product = product
        vc.titleText = titleBar.title!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: changeTitleBarDelegate {
    func changeTitleBar(_ string: String) {
        titleBar.title = string
    }
}
