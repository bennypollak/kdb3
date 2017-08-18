//
//  Bard.swift
//  kdb3
//
//  Created by Benny Pollak on 8/18/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//
import Foundation
class Bard {
    // http://www.renfaire.com/Language/insults.html
    static let insults: [String] = [
          "Thou be a fawning lean-witted boar-pig!"
        , "Thou art truly a vacant fly-bitten mammet!"
        , "Thou cans't not be but a dankish rough-hewn hempseed!"
        , "Verily, thou art naught but a puny lean-witted flap-dragon!"
        , "Thou art a gnarling elf-skinned horn-beast!"
        , "S'wounds thou art a wenching shrill-gorged maggot-pie!"
        , "Verily, ye be a droning clay-brained cutpurse!"
        , "Thou be a venomed pale-hearted hedge-pig!"
        , "Verily, ye be a churlish ill-nurtured malt-worm!"
        , "Thou be a surly dismal-dreaming flax-wench!"
        , "Thou cans't not be but a fawning ill-breeding lout!"
        , "Verily, ye be a droning plume-plucked moldwarp!"
        , "Verily, thou art naught but a bawdy fool-born whey-face!"
        , "Thou art a spongy guts-griping canker-blossom!"
        , "S'wounds thou art a fobbing ill-composed dogfish!"
        , "Forsooth! Thou art a yeasty folly-fallen death-token!"
        , "S'wounds thou art a frothy weather-bitten varlot!"
    ]
    static func insult() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(Bard.insults.count)))
        return Bard.insults[randomIndex]
    }
}
