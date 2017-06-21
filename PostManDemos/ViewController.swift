//
//  ViewController.swift
//  PostManDemos
//
//  Created by iFlame on 6/17/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    var objModelGetResponse : ModelGetResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GETRequestTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    func GETRequestTest(){
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "3ade654f-a94a-156d-d4d1-4fa8517e55da"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://postman-echo.com/get?test=123")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            if (error != nil) {
                self.showAlerForError(error: error as! NSError)
            }
            else {
                
                let httpResponse = response as? HTTPURLResponse
                print("httpResponse", httpResponse!.statusCode)
                
                
                if data != nil{
                    
                    let resonseString = String.init(data: data!, encoding: String.Encoding.utf8)
                    print("resonseString ==>> \(resonseString)\n\n")
                    
                    do{
                        if let responseData : [String: Any] = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]{
                            print("responseData ", responseData, "\n\n")
                        
                            let objModelGetResponse = ModelGetResponse()
                            objModelGetResponse.updateWithDictionary(dictionary: responseData)
                            self.objModelGetResponse = objModelGetResponse
                            //self.objModelGetResponse = ModelGetResponse.init(dictionary: responseData)

                        }
                    }
                    catch
                    {
                        print("responseData ", error)
                    }
                }
            }
        })
        
        dataTask.resume()
    }
    
    func showAlerForError(error : NSError) {
        
        let alert = UIAlertController(title: "Erroorrr", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        
        let actionCancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (alert) in
            
        }
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
}


