//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by Benny Pollak on 7/16/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//
/*
 var output: String!
 var buttons: [UIButton] {
 return [officialButton, personal1button, personal2button]
 }
 */
import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = KeyboardView()

        // Perform custom UI setup here
        if true {
            
            self.nextKeyboardButton = UIButton(type: .custom)
            self.nextKeyboardButton.setTitle(NSLocalizedString("", comment: "Title for 'Next Keyboard' button"), for: [])
            self.nextKeyboardButton.sizeToFit()
            self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
            self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
            nextKeyboardButton.setImage(UIImage(named: "next.png"), for: UIControlState.normal)
            nextKeyboardButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit

            self.view.addSubview(self.nextKeyboardButton)
            view.addConstraint(NSLayoutConstraint(item: nextKeyboardButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50))

            
            self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        }
        
//
//        //
    
        let buttonTitles = ["Q", "W", "E", "R", "T", "Y","a","n","d","m","o","r","n","d","m","o","r"]
        let buttonImages = ["Phone.png","Yahoo-Mail-logo.png","back.jpg","fu.png","funny.png","gmail.jpeg","gmail2.png","hide.png","lcase.png","next.jpg","next.png","noay.jpg","ok.jpg","ok.png","return.png","sad.png","secret.png","space.png","thumbsdown.gif","ucase.png","yahoomail.png","ymail.png"
]
        var topRow: UIView? = nil
        if false {
        let buttons = createButtons(titles: buttonTitles)
        topRow = UIView()
        view.addSubview(topRow!)
        topRow?.translatesAutoresizingMaskIntoConstraints=false
        for button in buttons {
            topRow?.addSubview(button)
        }
        view.addConstraint(NSLayoutConstraint(item: topRow, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: topRow, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50))
        view.addConstraint(NSLayoutConstraint(item: topRow, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: topRow, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0))
        
        addConstraints(buttons, containingView: topRow!)
        }

        /*
         let buttonInfo = [
         ["",""]
         , ["",""]
         ]
         */
        
        let buttonInfo = [
            ["fu.png","Fuck you!"]
            , ["sad.png","So sad!"]
            , ["thumbs_down_angry.png","No way!"]
            , ["ok.png","Ok!"]
        ]
        let buttonInfo2 = [
            ["yahoomail.png","@@@yo372002@yahoo.com"]
            , ["gmail2.png","@@@bpollak@gmail.com"]
            , ["Phone.png","@@@+1-347-416-1525"]
            , ["secret.png","@@@Key"]
        ]
        
        let row2 = addButtonRow(topRow, buttonInfo: buttonInfo)
        let row3 = addButtonRow(row2, buttonInfo: buttonInfo2)
        
        //        var imgButtons: [UIButton] = []
        //        for info in buttonInfo {
        //            imgButtons.append(crButton(named: info[1], imgNamed: info[0]))
        //        }
        //        let botRow = crRow(topView: topRow, botView: view, buttons: imgButtons)
        //        addConstraints(imgButtons, containingView: botRow)
        //
        /*
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as! UIView;
 */
    }
    func addButtonRow(_ prevView: UIView?, buttonInfo: [[String]]) -> UIView {
        var imgButtons: [UIButton] = []
        for info in buttonInfo {
            imgButtons.append(crButton(named: info[1], imgNamed: info[0]))
        }
        let row = crRow(topView: prevView, botView: view, buttons: imgButtons)
        addConstraints(imgButtons, containingView: row)
        return row
    }
    func crButton(named: String, imgNamed: String) -> UIButton  {
        let button = UIButton(type: .custom)
        let image = UIImage(named: imgNamed)
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        button.setImage(image, for: UIControlState.normal)
//        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.sizeToFit()
        button.backgroundColor = .clear
        button.setTitle(named, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(KeyboardViewController.ijomePressed(_:)), for: .touchUpInside)

        return button
    }
    func crRow(topView:UIView?, botView:UIView, buttons:[UIButton]) -> UIView {
        let row = UIView()
        view.addSubview(row)
        row.translatesAutoresizingMaskIntoConstraints=false
        for button in buttons {
            row.addSubview(button)
        }
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50))
        if topView != nil {
            view.addConstraint(NSLayoutConstraint(item: row, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1.0, constant: 0))
        } else {
            view.addConstraint(NSLayoutConstraint(item: row, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        }
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0))
        return row
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
        //self.nextKeyboardButton.setTitleColor(textColor, for: [])
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
        let string = ""+bstring!
        UIDevice.current.playInputClick()
        (textDocumentProxy as UIKeyInput).insertText("\(string) ")
        //advanceToNextInputMode()
    }
    @IBAction func nextKeyboardPressed(_ sender: Any) {
        UIDevice.current.playInputClick()

        advanceToNextInputMode()
        
    }
    @IBAction func dismissKeyboardPressed(_ sender: Any) {
       UIDevice.current.playInputClick()
       dismissKeyboard()
        
    }
    

}
