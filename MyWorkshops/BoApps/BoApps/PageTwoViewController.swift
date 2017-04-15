//
//  PageTwoViewController.swift
//  BoApps
//
//  Created by Macbook Air on 3/30/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash //lbในการ parse xml

class PageTwoViewController: UIViewController {
    
    @IBOutlet weak var mDieselLabel:UILabel!
    @IBOutlet weak var mE85Label:UILabel!
    @IBOutlet weak var mE20Label:UILabel!
    @IBOutlet weak var mS91Label:UILabel!
    @IBOutlet weak var mS95Label:UILabel!
    @IBOutlet weak var mDateLabel:UILabel!


    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
//        self.getCitiesByCountry(countryName: "China")
        
        //self.mDieselLabel.text = "24.55"
        var fontSize:CGFloat = 27;
        
        if UIDevice().screenType == .iPhone4 {
            fontSize = 27;
            
        }else if UIDevice().screenType == .iPhone5 {
            
            fontSize = 28;
            
        }else if UIDevice().screenType == .iPhone6 {
            
            fontSize = 29;
            
        }else if UIDevice().screenType == .iPhone6Plus {
            
            fontSize = 31;
        }else{
            
            fontSize = 60;
        }
  
        self.mE20Label.font = UIFont(name: "DS-Digital", size: fontSize)
        self.mE85Label.font = UIFont(name: "DS-Digital", size: fontSize)
        self.mS91Label.font = UIFont(name: "DS-Digital", size: fontSize)
        self.mS95Label.font = UIFont(name: "DS-Digital", size: fontSize)
        self.mDieselLabel.font = UIFont(name: "DS-Digital", size: fontSize)
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        let soapMsg = NSLocalizedString("REQ", comment: "Current Oil Price REQ.")
//        print(soapMsg)
        
        let url:URL = URL(string: "http://www.pttplc.com/webservice/pttinfo.asmx")!
        let wsSoapAction = "http://www.pttplc.com/ptt_webservice/CurrentOilPrice"
        
        var urlRequest = URLRequest(url: url)
        let msgLength = String(format: "%tu",soapMsg.lengthOfBytes(using: String.Encoding.utf8))
        urlRequest.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(wsSoapAction, forHTTPHeaderField: "SOAPAction")
        urlRequest.setValue(msgLength, forHTTPHeaderField: "Content-Length")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = soapMsg.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        Alamofire.request(urlRequest).responseString { (response) in
            switch response.result {
            case .success:
                self.parseXml(response.result.value!)
//                print(response.result.value!)
                break
            default:
                break
            }
        }
    }
    
    func parseXml(_ xml:String){
        let wellXML = xml.replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&gt;", with: ">")
        //        print("wellXML : \(wellXML)")
        
        let doc = SWXMLHash.parse(wellXML)
        let dataArray = doc["soap:Envelope"]["soap:Body"]["CurrentOilPriceResponse"]["CurrentOilPriceResult"]["PTT_DS"].children
//        print(dataArray.description)
        
        //        let item = dataArray[1]
        //        let product = item["PRODUCT"].element?.text
        //        print("product : \(product!)")
        
        
        for item in dataArray{
            let product = (item["PRODUCT"].element?.text)!
            let price = item["PRICE"].element?.text
            let date = item["PRICE_DATE"].element?.text!
            
            self.mDateLabel.text = date
            
            if product == "Blue Diesel" {
                self.mDieselLabel.text = price
            }else if product == "Blue Gasohol E20"{
                self.mE20Label.text = price
            }else if product == "Blue Gasohol E85" {
                self.mE85Label.text = price
            }else if product == "Blue Gasohol 91" {
                self.mS91Label.text = price
            }else if product == "Blue Gasohol 95" {
                self.mS95Label.text = price
            }
            
        }
    }

    
//    func getCitiesByCountry(countryName:String) {
//        
//        let tmp = NSLocalizedString("REQ_CITY", comment: "get Cities By Country.")
//        
//        let soapMsg = String(format:tmp, countryName)
//        
//        print(soapMsg)
//        
//        let url:URL = URL(string: "http://www.webservicex.net/globalweather.asmx")!
//        let wsSoapAction = "http://www.webserviceX.NET/GetCitiesByCountry"
//        
//        var urlRequest = URLRequest(url: url)
//        let msgLength = String(format: "%tu",soapMsg.lengthOfBytes(using: String.Encoding.utf8))
//        urlRequest.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue(wsSoapAction, forHTTPHeaderField: "SOAPAction")
//        urlRequest.setValue(msgLength, forHTTPHeaderField: "Content-Length")
//        urlRequest.httpMethod = "POST"
//        urlRequest.httpBody = soapMsg.data(using: String.Encoding.utf8, allowLossyConversion: false)
//        
//        Alamofire.request(urlRequest).responseString { (response) in
//            switch response.result {
//            case .success:
//                self.parseXmlCities(response.result.value!)
//                //print(response.result.value!)
//                break
//            default:
//                break
//            }
//        }
//    }
//    
//    func parseXmlCities(_ xml:String){
//        let wellXML = xml.replacingOccurrences(of: "&lt;", with: "<")
//        .replacingOccurrences(of: "&gt;", with: ">")
//        
//        let doc = SWXMLHash.parse(wellXML)
//        let dataArray = doc["soap:Envelope"]["soap:Body"]["GetCitiesByCountryResponse"]["GetCitiesByCountryResult"]["NewDataSet"].children
//        print(dataArray.description)
//        
//        
//        let item = dataArray[0]
//        
//        let citiy = (item["City"].element?.text!)!
//        
//        
//        print(citiy)
//
//        
//}
    
    @IBAction func onClickRefresh() {
        print("Refresh")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

public extension UIDevice {
    
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        
        case iPhone4
        
        case iPhone5
        
        case iPhone6
        
        case iPhone6Plus
        
        case Unknown
    }
    
    var screenType: ScreenType {
        guard iPhone else { return .Unknown}
        switch UIScreen.main.nativeBounds.height {        
        case 960:
            
            return .iPhone4
            
        case 1136:
            
            return .iPhone5
            
        case 1334:
            
            return .iPhone6
            
        case 2208:

            return .iPhone6Plus
        default:
            return .Unknown
            
        }
    }
}


