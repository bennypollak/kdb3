//
//  ViewController.swift
//  kdb3
//
//  Created by Benny Pollak on 7/16/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBAction func secretChanged(_ sender: Any) {
        let string = secret1.text
        
        let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!
        SharedDefaults.set(string, forKey: "Key")
        SharedDefaults.synchronize()

    }

    @IBOutlet weak var secret1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!
        secret1.text = SharedDefaults.string(forKey: "Key") ?? ""
        
        let userDefaults = UserDefaults.standard
        let name = userDefaults.string(forKey: "name_preference")
        print(name)


    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

