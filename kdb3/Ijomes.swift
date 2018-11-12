//
//  Ijomes.swift
//  kdb3
//
//  Created by Benny Pollak on 10/11/18.
//  Copyright © 2018 Alben Software. All rights reserved.
//

import Foundation

struct Ijomes {
    static func randomTextFor(_ text: String, _ lang: String) -> String {
        let r = text.index(text.startIndex, offsetBy: 3)..<text.endIndex
        var string = ""
        let substring1 = text[r]
        if substring1 == "bard" {
            string = Bard.bardInsult()
        } else if substring1 == "trumpism" {
            string = Bard.trumpism()
        } else if substring1 == "insult" {
            if lang == "en" {
                string = Bard.insult()
            } else {
                string = Cervantes.insult()
            }
        } else if substring1 == "lovism" {
            if lang == "en" {
                string = Bard.lovism()
            } else {
                string = Cervantes.lovism()
            }
        }
        return string
    }
    static func textFor(_ itext: String, _ textValues:[String:String], _ isMessage:Bool, _ lang: String) -> String {
        var ijome = ""
        var space = ""
        var text = itext
        if text[0].containsEmoji {
            ijome = text[0]
            if text != ijome {
                let r = text.index(text.startIndex, offsetBy: 2)..<text.endIndex
                text = String(text[r])
            }
        }
        if (text.hasPrefix("@@@")) {
            let r = text.index(text.startIndex, offsetBy: 3)..<text.endIndex
            let substring1:String = String(text[r])
            let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!
            text = SharedDefaults.string(forKey: substring1) ?? substring1
        } else if (text.hasPrefix("###")) {
            text = Ijomes.randomTextFor(text, lang)
            space = " "
            //        } else if string.characters.count == 1 {
            //            space = ""
        } else {
            text = (textValues[text] ?? text).localized(lang)
            space = " "
        }
        
        text = ijome == "" || isMessage ? "\(text)\(space)" : "\(ijome) (\(text)\(space))"
        return text
    }
    static let emoticons = [
        // must add leading space
        [" :)", "😂 Smiled!"]
        , [" :'-)", "😩 So sad!"]
        , [" >:(", "Fuck you!"]
        , ["😠", "Fuck you!"]
        , [" :-*", "Kisses!"]
        , [" ;)", "Wink!"]
        , [" :-D", "Funny!"]
        , [" :$", "So embarrassed!"]
    ]
    
    static let ijomes1 = [
        ["🖕", "Fuck you!"]
        , ["sad.png", "☹️ So sad!"]
        , ["love2.png", "❤️ ###lovism"]
        , ["trump2.png", "###trumpism"]
        , ["insult2.jpg", "😤 ###insult"]
        , ["shakespeare.jpg", "###bard"]
    ]
    
    static let ijomes2 = [
        ["secret1.png", "@@@secret1"]
        , ["secret2.png", "@@@secret2"]
        , ["secret3.png", "@@@secret3"]
        , ["secret4.png", "@@@secret4"]
        , ["secret5.png", "@@@secret5"]
    ]
    
    static let ijomes3 = [
        ["imsick.png", "😷 So sick!"]
        , ["💘", "Love you!"]
        , ["sohappy.png", "😂 So happy!"]
        , ["boobs1.jpg", "👏 Life is beautiful!"]
        , ["what.png", " What?"]
        , ["😱", "WTF!"]
    ]
    static let ijomes4 = [
        ["stella.jpg", "Stella!"]
        , ["truelove2.png", "We'll always have Paris!"]
        , ["haveadrink.jpg", "Have a drink!"]
        , ["ahhhhh.jpg", "Ahhh!"]
        , ["truelove.png", "True love!"]
        , ["badday.png", "Having a bad day!"]
    ]

    static let ijomes5 = [
        ["yahoomail.png", "@@@yo372002@yahoo.com"]
        , ["gmail2.png", "@@@bpollak@gmail.com"]
        , ["Phone.png", "@@@+1-347-416-1525"]
        , ["👍", "Ok!"]
        , ["😫", "Oh no!"]
        , ["wink.png", "Wink!"]
    ]
    
    
    static let ijomes6 = [
        ["imsick.png", "So sick!"]
        , ["angry.jpeg", "Very angry!"]
        , ["thumbs_down_angry.png", "No way!"]
        , ["wasntme.png", "😇 It wasn't me!"]
        , ["what.png", "What?"]
        , ["wtf.png", "WTF!"]
    ]

}
