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
    static let randomInsults: [String] = [
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

    static let insult_thou = [ "Thou" , "Verily, ye be a" , "Ye" , "Thou be a" , "Forsooth! Thou art a" , "Thou cans't not be but a" , "Thou art truly a" , "Verily, thou art naught but a" , "Thou art a" , "S'wounds thou art a"]
    static let insult_adj1 = [ "artless" , "bawdy" , "beslubbering" , "bootless" , "burly-boned" , "caluminous" , "churlish" , "cockeyed" , "clouted" , "craven" , "cullionly" , "curtis" , "darkish" , "dissembling" , "droning" , "errant" , "fawning" , "fishified" , "fobbing" , "froward" , "frothy" , "fusty" , "glee king" , "goatish" , "gorbellied" , "impertinent" , "infectious" , "jarring" , "loggerheaded" , "lumpish" , "mammering" , "mangled" , "misbegotten" , "mewling" , "odiferous" , "paunchy" , "poisonous" , "pribbling" , "puking" , "puny" , "qualling" , "rank" , "reeky" , "roguish" , "ruttish" , "saucy" , "spleeny" , "spongy" , "surly" , "tottering" , "unmuzzled" , "vain" , "venomed" , "vallainous" , "warped" , "wart-necked" , "wayward" , "weedy" , "wimpled" , "yeasty" ]
    static let insult_adj2 = [ "base-court" , "bat-fowling" , "beef-witted" , "beetle-headed" , "boil-brained" , "bunched-backed" , "clapper-clawed" , "clay-brained" , "common-kissing" , "crook-pated" , "dismal-dreaming" , "dizzy-eyed" , "dog-hearted" , "dread-bolted" , "earth-vexing" , "elf-skinned" , "empty-hearted" , "evil-eyed" , "eye-offending" , "fat-kidneyed" , "fen-sucked" , "flap-mouthed" , "fly-bitten" , "folly-fallen" , "fool-born" , "full-gorged" , "guts-griping" , "half-faced" , "hasty-witted" , "heavy-handed" , "hedge-born" , "hell-hated" , "horn-mad" , "idle-headed" , "ill-breeding" , "ill-composed" , "ill-nurtured" , "iron-witted" , "knotty-pated" , "lean-witted" , "lily-livered" , "mad-bread" , "milk-livered" , "motley-minded" , "muddy-mettled" , "onion-eyed" , "pale-hearted" , "paper-faced" , "pinch-spotted" , "plume-plucked" , "pottle-deep" , "pox-marked" , "raw-boned" , "reeling-ripe" , "rough-hewn" , "rude-growing" , "rug-headed" , "rump-fed" , "shag-eared" , "shard-borne" , "sheep-biting" , "shrill-gorged" , "spur-galled" , "sour-faced" , "swag-bellied" , "tardy-gaited" , "tickle-brained" , "toad-spotted" , "unchin-snouted" , "weak-hinged" , "weather-bitten" , "white-livered"]
    static let insult_noun = [ "apple-john" , "baggage" , "barnacle" , "bladder" , "boar-pig" , "bugbear" , "bum-bailey" , "canker-blossom" , "clack-dish" , "clotpole" , "coxcomb" , "codpiece" , "crutch" , "cutpurse" , "death-token" , "dewberry" , "dogfish" , "egg-shell" , "flap-dragon" , "flax-wench" , "flirt-gill" , "foot-licker" , "fustilarian" , "giglet" , "gudgeon" , "gull-catcher" , "haggard" , "harpy" , "hedge-pig" , "hempseed" , "hedge-pig" , "horn-beast" , "hugger-mugger" , "jack-a-nape" , "jolthead" , "lewdster" , "lout" , "maggot-pie" , "malignancy" , "malkin" , "malt-worm" , "mammet" , "manikin" , "measle" , "minimus" , "minnow" , "miscreant" , "moldwarp" , "mumble-news" , "nut-hook" , "pantaloon" , "pigeon-egg" , "pignut" , "puttock" , "pumpion" , "rabbit-sucker" , "rampallion" , "ratsbane" , "remnant" , "rudesby" , "ruffian" , "scantling" , "scullion" , "scut" , "skainsmate" , "snipe" , "strumpet" , "varlot" , "vassal" , "waterfly" , "whey-face" , "whipster" , "wagtail" , "younker" ]
    static func randoms(_ inArray: [[String]]) -> [String] {
        var array:[String] = []
        for a in inArray {
            array.append(a[Int(arc4random_uniform(UInt32(a.count)))])
        }
        return array
    }
    static func insult() -> String {
        return Bard.randoms([insult_thou,insult_adj1,insult_adj2,insult_noun]).joined(separator: " ")
    }
}
