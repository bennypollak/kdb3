//
//  ViewController.swift
//  kdb3
//
//  Created by Benny Pollak on 7/16/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var secret1: UITextField!
    @IBOutlet weak var secret2: UITextField!
    @IBOutlet weak var secret3: UITextField!
    @IBOutlet weak var secret4: UITextField!
    @IBOutlet weak var secret5: UITextField!
    var secrets:[UITextField] = []
    @IBAction func secretChanged(_ sender: Any) {
        let field = (sender as! UITextField)
        let string = field.text
        
        let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!
        SharedDefaults.set(string, forKey: "secret\(field.tag+1)")
        SharedDefaults.synchronize()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        secrets = [secret1, secret2, secret3, secret4, secret5]

        let defaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!
        for s in secrets  {
            s.text = defaults.string(forKey: "secret\(s.tag+1)") ?? ""
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

