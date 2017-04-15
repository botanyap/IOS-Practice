//
//  PageOneViewController.swift
//  BoApps
//
//  Created by Macbook Air on 3/30/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var mWebview:UIWebView!
    @IBOutlet weak var mActivityIndicator:UIActivityIndicatorView!
    
    @IBAction func onClickDegment(sender:AnyObject){
        switch sender.selectedSegmentIndex {
        case 0:
            self.openWeb()
            break
        default:
             self.openPDF()
            break
        }
    }
    
    func openWeb() {
        print("Web")
        let url = URL(string:"http://www.apple.com/th")
        let req = URLRequest(url : url!)
        self.mWebview.loadRequest(req)
    }
    
    func openPDF() {
        print("PDF")
        let pdfPath = Bundle.main.path(forResource: "product.pdf", ofType: nil)
        
        let pdfData = NSData(contentsOfFile: pdfPath!)
        self.mWebview.load(pdfData! as Data, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: NSURL() as URL)
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.openWeb()
//        self.mWebview.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.mActivityIndicator.startAnimating()
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.mActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView:UIWebView ,shouldStartLoadWith request:URLRequest ,navigationType:UIWebViewNavigationType) -> Bool {
        
        if request.url?.absoluteString == "http://www.apple.com/th" {
            _ = self.navigationController?.popViewController(animated: true)
            return false
        }
         return true
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
