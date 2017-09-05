//
//  Bard.swift
//  kdb3
//
//  Created by Benny Pollak on 8/18/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//
import Foundation

class Bard {
    // http://en.proverbia.net/shortlovequotes.asp?page=5
    static let lovisms: [String] = [
        "Without His love I can do nothing, with His love there is nothing I cannot do."
        , "There is only one happiness in life -- to love and to be loved."
        , "Where there is love there is life."
        , "Friendship often ends in love; but love in friendship, never."
        , "Love is a serious mental disease."
        , "The one who loves least controls the relationship."
        , "True love is like ghosts, which everybody talks about and few have seen."
        , "Love is not just looking at each other, it's looking in the same direction."
        , "The way to love anything is to realize that it might be lost."
        , "Love is the beauty of the soul."
        , "A loving heart is the truest wisdom."
        , "Every man needs two women, a quiet home-maker, and a thrilling nymph."
        , "A coward is incapable of exhibiting love; it is the prerogative of the brave."
        , "Once you have learned to love, You will have learned to live."
        , "The rose speaks of love silently, in a language known only to the heart."
        , "No three words have greater power than I Love You."
        , "Love is the master key which opens the gates of happiness."
        , "Love: A temporary insanity curable by marriage."
        , "Blue eyes say, Love me or I die; black eyes say, Love me or I kill thee."
        , "A heart that loves is always young."
        , "The hottest love has the coldest end."
        , "All women are flirts, but some are restrained by shyness, and others by sense."
        , "The magic of first love is our ignorance that it can never end."
        , "Love will find a way. Indifference will find an excuse."
        , "Love may be blind, but it can sure find its way around in the dark!"
        , "Love is not in our choice but in our fate."
        , "Live for love. Without love, you don't live."
        , "If love is shelter, I'm going to walk in the rain."
        , "Love is an irresistible desire to be irresistibly desired."
        , "Love is something eternal; the aspect may change, but not the essence."
        , "Love is what happens to a man and woman who don't know each other."
        , "What makes lovers never tire of one another is that they talk always about themselves."
        , "Love is the bridge between two hearts."
        , "I never loved another person the way I loved myself."
        , "Where we love is home, home that our feet may leave, but not our hearts."
        , "Real love stories never have endings."
        , "When we are in love we seem to ourselves quite different from what we were before."
        , "Life is the flower for which love is the honey."
        , "I pray Thee, O God, that I may be beautiful within."
        , "Love can neither be bought or sold, its only price is love."
        , "In this life we cannot do great things. We can only do small things with great love"
        , "Like the measles, love is most dangerous when it comes late in life."
        , "True love means two seeds grow separately until they join in Matrimony forever."
        , "Love is a canvas furnished by Nature and embroidered by imagination."
        , "The more one loves a mistress, the more one is ready to hate her."
    ]
    static let trumpisms: [String] = [
          "Believe me!"
        , "People say"
        , "Sad!"
        , "HUUUGE!"
        , "Bigly!"
    ]
    
    // http://www.renfaire.com/Language/insults.html
    static let insults: [String] = [
        "You fail, So did your dads condom!"
        , "If you want a good comeback you should go lick your mums face!"
        , "So, a thought crossed your mind? Must have been a long and lonely journey!"
        , "How did you get here? Did someone leave your cage open?"
        , "If I were a dog and you were a flower I'd lift up my leg and give you a shower!"
        , "Better at sex than anyone? Now all you need is a partner!"
        , "'I'd like to see things from your point of view, too bad, I can't shove my head that far up my arse!"
        , "You must have been born on a highway because that's where most accidents happen!"
        , "I'd slap you, but that would be animal abuse!"
        , "I could eat a bowl of alphabet soup and shit out a smarter statement than that!"
        , "It's scary to think that people like you are allowed to vote!"
        , "Learn from your parents mistakes, use birth control!"
        , "The smartest thing that ever came out your mouth was a penis!"
        , "Dont let your mind wander, it's far too small to be out by itself!"
        , "I called your boyfriend gay and he hit me with his purse!"
        , "Earth is full. Go home.!"
        , "Do you have to leave so soon? I was about to poison the tea!"
        , "Why don't you go play in traffic?"
        , "So you've changed your mind? Does this one work any better?"
        , "Nice outfit. Go stand on a street corner, you could make some money!"
        , "Your legs are like tescos. Open 24/7!"
        , "You'd better hide, the garbage collecter is coming!"
        , "Shut up, you'll never be the man your mother is!!"
        , "I'm busy now, can I ignore you another time?"
        , "I may be fat but you're ugly and at least I can loose weight!"
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
    static func bardInsult() -> String {
        return Bard.randoms([insult_thou,insult_adj1,insult_adj2,insult_noun]).joined(separator: " ")
    }
    static func insult() -> String {
        return Bard.insults[Int(arc4random_uniform(UInt32(Bard.insults.count)))]
    }
    static func trumpism() -> String {
        return Bard.trumpisms[Int(arc4random_uniform(UInt32(Bard.trumpisms.count)))]
    }
    static func lovism() -> String {
        return Bard.lovisms[Int(arc4random_uniform(UInt32(Bard.lovisms.count)))]
    }

}
