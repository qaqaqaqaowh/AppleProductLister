//
//  WebViewController.swift
//  AppleProduct
//
//  Created by NEXTAcademy on 10/27/17.
//  Copyright © 2017 asd. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {
    
    var request : URLRequest?

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        loadingView.hidesWhenStopped = true
        loadingView.startAnimating()
        
        webView.loadRequest(request!)

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

extension WikiViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingView.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        let alert = UIAlertController(title: "", message: "\(error)", preferredStyle: .alert)
        let button = UIAlertAction(title: "Return", style: .default) { (UIAlertAction) in
            self.removeFromParentViewController()
        }
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
    }
}
