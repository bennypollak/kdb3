//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by Benny Pollak on 7/16/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//
/*

 */
import UIKit

class KeyboardViewController: UIInputViewController, UIGestureRecognizerDelegate {

    var backCount = 1
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    let emoticons = [":-)": "I'm happy!"
        , ":'-)": "So sad!"
        , ">:(": "Fuck you!"
        , ":-*": "Kisses!"
        , ";)": "Wink!"
        , ":-D": "Funny!"
        , ":$": "So embarrassed!"
    ]
    let ijomes1 = [
        ["fu.png","Fuck you!"]
        , ["sad.png","So sad!"]
        , ["thumbs_down_angry.png","No way!"]
        , ["ok.png","Ok!"]
    ]
    let ijomes2 = [
        ["yahoomail.png","@@@yo372002@yahoo.com"]
        , ["gmail2.png","@@@bpollak@gmail.com"]
        , ["Phone.png","@@@+1-347-416-1525"]
        , ["secret.png","@@@Key"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view = KeyboardView()

        // Perform custom UI setup here
//        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:)))
//        lpgr.minimumPressDuration = 0.5
//        lpgr.delaysTouchesBegan = true
//        lpgr.delegate = self
//        self.view.addGestureRecognizer(lpgr)
        if true {
            
            let next = createImgButton(named: "", imgNamed: "next.png", action: #selector(KeyboardViewController.nextKeyboardPressed(_:)))
            next.backgroundColor = .clear
            view.addSubview(next)
            view.addConstraint(NSLayoutConstraint(item: next, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40))
            next.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            next.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            let back = createImgButton(named: "", imgNamed: "back.jpg", action: #selector(KeyboardViewController.backKeyboardPressed(_:)))
            back.backgroundColor = .clear
 
            view.addSubview(back)
            view.addConstraint(NSLayoutConstraint(item: back, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40))
            back.leftAnchor.constraint(equalTo: next.rightAnchor).isActive = true
            back.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        }
        
        let buttonTitles = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

        var row: UIView? = nil
        if false {
            row = addTextButtonRow(row, buttonTitles: buttonTitles)
        }
        
        row = addButtonRow(row, buttonInfo: ijomes1)
        row = addButtonRow(row, buttonInfo: ijomes2)
        row = addTextButtonRow(row, buttonTitles: Array(emoticons.keys))

        /*
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as! UIView;
 */
    }
    func addTextButtonRow(_ topView: UIView?, buttonTitles: [String]) -> UIView {
        let buttons = createButtons(titles: buttonTitles)
        let row = UIView()
        view.addSubview(row)
        row.translatesAutoresizingMaskIntoConstraints=false
        for button in buttons {
            row.addSubview(button)
        }
        addRowConstraints(row, topView: topView)
        addConstraints(buttons, containingView: row)
        return row
    }
    func createRow(topView:UIView?, botView:UIView, buttons:[UIButton]) -> UIView {
        let row = UIView()
        view.addSubview(row)
        row.translatesAutoresizingMaskIntoConstraints=false
        for button in buttons {
            row.addSubview(button)
        }
        addRowConstraints(row, topView: topView)
        return row
    }
    func addButtonRow(_ prevView: UIView?, buttonInfo: [[String]]) -> UIView {
        var imgButtons: [UIButton] = []
        for info in buttonInfo {
            imgButtons.append(createImgButton(named: info[1], imgNamed: info[0]))
        }
        let row = createRow(topView: prevView, botView: view, buttons: imgButtons)
        addConstraints(imgButtons, containingView: row)
        return row
    }
    func createImgButton(named: String, imgNamed: String, action: Selector = #selector(KeyboardViewController.ijomePressed(_:))) -> UIButton  {
        let button = UIButton(type: .custom)
        let image = UIImage(named: imgNamed)
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        button.setImage(image, for: UIControlState.normal)
        button.sizeToFit()
        button.backgroundColor = .white
        button.setTitle(named, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)

        return button
    }

    func addRowConstraints(_ row: UIView, topView: UIView?) {
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40))
        if topView != nil {
            view.addConstraint(NSLayoutConstraint(item: row, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1.0, constant: 0))
        } else {
            view.addConstraint(NSLayoutConstraint(item: row, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        }
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0))
    }
    func createButtons(titles: [String]) -> [UIButton] {
        
        var buttons = [UIButton]()
        
        for title in titles {
            let button = UIButton.init(type:.system) as UIButton
            button.setTitle(title, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints=false
            button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.sizeToFit()
            button.addTarget(self, action: #selector(KeyboardViewController.ijomePressed(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        return buttons
    }
    func addConstraints(_ buttons: [UIButton], containingView: UIView){
        for (index, button) in buttons.enumerated() {
            let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal
                , toItem: containingView, attribute: .top, multiplier: 1.0, constant: 1)
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: containingView, attribute: .bottom, multiplier: 1.0, constant: -1)
            var leftConstraint : NSLayoutConstraint!
            if index == 0 {
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: containingView, attribute: .left, multiplier: 1.0, constant: 1)
            }else{
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: buttons[index-1], attribute: .right, multiplier: 1.0, constant: 1)
                let widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            if index == buttons.count - 1 {
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: containingView, attribute: .right, multiplier: 1.0, constant: -1)
            }else{
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: buttons[index+1], attribute: .left, multiplier: 1.0, constant: -1)
            }
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        //btn.setTitleColor(textColor, for: [])
    }
    @IBAction func keyPressed(_ button: UIButton) {
        let bstring = button.titleLabel!.text
        var string = "?"
        if bstring == "Y" {
            string = "yo372002@yahoo.com"
        } else if (bstring == "B") {
            let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!

            string = SharedDefaults.string(forKey: "Key") ?? ""

        } else if (bstring == "G") {
            string = "bpollak@gmail.com"
        } else if (bstring == "P") {
            string = "347-416-1525"
        }
        (textDocumentProxy as UIKeyInput).insertText("\(string)")
        UIDevice.current.playInputClick()
    }
    @IBAction func ijomePressed(_ button: UIButton) {
        let bstring = button.titleLabel!.text
        var string = ""+bstring!
        var space = " "
        if (string.hasPrefix("@@@")) {
            let r = string.index(string.startIndex, offsetBy: 3)..<string.endIndex
            let substring1 = string[r]
            let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!
            string = SharedDefaults.string(forKey: substring1) ?? substring1
            space = ""
        } else if string.characters.count == 1 {
            space = ""
        } else {
            string = emoticons[string] ?? string
        }
        UIDevice.current.playInputClick()
        let text = "\(string)\(space)"
        backCount = text.characters.count
        (textDocumentProxy as UIKeyInput).insertText(text)
    }
    @IBAction func nextKeyboardPressed(_ sender: Any) {
        UIDevice.current.playInputClick()
        //        handleInputModeList(from: view, with: UIEvent.tou)
        advanceToNextInputMode()
    }
    @IBAction func backKeyboardPressed(_ sender: Any) {
        for _ in 0..<backCount {
            UIDevice.current.playInputClick()
            (textDocumentProxy as UIKeyInput).deleteBackward()
        }
        backCount = 1
    }
    @IBAction func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        if gesture.state != .ended {
            return
        }
        UIDevice.current.playInputClick()
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }

//        let p = g    }
    @IBAction func dismissKeyboardPressed(_ sender: Any) {
       UIDevice.current.playInputClick()
       dismissKeyboard()
        
    }
    

}
