//
//  PublicationStorage.swift
//  Navigation
//
//  Created by Irina on 07.02.2022.
//

import UIKit

/// Posts for the uicollectionview.
var rollsRoyce = UIImage(named: "rollsRoyce")
var snowboarder = UIImage(named: "snowboarder")
var tulipsField = UIImage(named: "tulipsField")
var catDog = UIImage(named: "catDog")
var arrow = UIImage(systemName: "arrow.right")

//var cake = UIImage(named: "cake")
//var flamingo = UIImage(named: "flamingo")
//var girl = UIImage(named: "girl")
//var mallard = UIImage(named: "mallard")
//var iceCream = UIImage(named: "iceCream")
//var japaneseGarden = UIImage(named: "japaneseGarden")
//var horseLady = UIImage(named: "horseLady")
//var madHatter = UIImage(named: "madHatter")
//var northernLight = UIImage(named: "northernLight")
//var pathosFair = UIImage(named: "pathosFair")
//var spermWhale = UIImage(named: "spermWhale")
//var samoyeds = UIImage(named: "samoyeds")
//var scientistsSingapore = UIImage(named: "scientistsSingapore")
//var surfing = UIImage(named: "surfing")
//var universe = UIImage(named: "universe")
//var wingsuitRider = UIImage(named: "wingsuitRider")

/// Posts for the uitableview.
var harukiMurakami = UIImage(named: "1Q84")
var wednesdayTimBurton = UIImage(named: "Wednesday Tim Burton")
var moulinRouge = UIImage(named: "Moulin Rouge")
var heartTransplantation = UIImage(named: "Heart transplantation")

struct PublicationStorage {
     static let publications = [
         /// Section 0.
         [
             Photo(title: "Photos",
                   photo1: rollsRoyce!,
                   photo2: snowboarder!,
                   photo3: tulipsField!,
                   photo4: catDog!,
 //                  photo5: cake!,
 //                  photo6: flamingo!,
 //                  photo7: girl!,
 //                  photo8: mallard!,
 //                  photo9: iceCream!,
 //                  photo10: japaneseGarden!,
 //                  photo11: horseLady!,
 //                  photo12: madHatter!,
 //                  photo13: northernLight!,
 //                  photo14: pathosFair!,
 //                  photo15: spermWhale!,
 //                  photo16: samoyeds!,
 //                  photo17: scientistsSingapore!,
 //                  photo18: surfing!,
 //                  photo19: universe!,
 //                  photo20: wingsuitRider!,
                   arrowButton: arrow!)
         ],
         /// Section 1.
         [
             Post(author: "atsukooshio",
                  image: harukiMurakami!,
                  description: "The last novel by the most famous author of modern Japanese prose - Haruki Murakami, the main literary sensation of the new century, \"magnum opus of the renowned master\" and must read for anyone who wants to understand the Japanese culture of our day, by opinion of some critics.",
                  likes: 4_905,
                  views: 5_194),
             Post(author: "news_Hollywood",
                  image: wednesdayTimBurton!,
                  description: "Wednesday is an upcoming American horror comedy streaming television series, based around the character Wednesday Addams of The Addams Family. Project being helmed by Tim Burton.",
                  likes: 187_372,
                  views: 194_563),
             Post(author: "@abrunkus",
                  image: moulinRouge!,
                  description: "Paris's Moulin Rouge to high-kick its way back on stage in September. The Moulin Rouge has been shut since March 12, 2020 -- the longest closure since the theatre was destroyed by fire in 1915.",
                  likes: 643_578,
                  views: 749_345),
             Post(author: "donatelife",
                  image: heartTransplantation!,
                  description: "First pig-to-human heart transplant: what can scientists learn?",
                  likes: 56_742,
                  views: 76_721)
         ]
     ]
    
    static let photos = [
        Photo(title: "Photos",
              photo1: rollsRoyce!,
              photo2: snowboarder!,
              photo3: tulipsField!,
              photo4: catDog!,
//                  photo5: cake!,
//                  photo6: flamingo!,
//                  photo7: girl!,
//                  photo8: mallard!,
//                  photo9: iceCream!,
//                  photo10: japaneseGarden!,
//                  photo11: horseLady!,
//                  photo12: madHatter!,
//                  photo13: northernLight!,
//                  photo14: pathosFair!,
//                  photo15: spermWhale!,
//                  photo16: samoyeds!,
//                  photo17: scientistsSingapore!,
//                  photo18: surfing!,
//                  photo19: universe!,
//                  photo20: wingsuitRider!,
              arrowButton: arrow!)
    ]
 }









//struct PublicationStorage {
//    /// Section 0.
//    static let photos = [
//        Photo(title: "Photos",
//              photo1: rollsRoyce!,
//              photo2: snowboarder!,
//              photo3: tulipsField!,
//              photo4: catDog!,
//              //                  photo5: cake!,
//              //                  photo6: flamingo!,
//              //                  photo7: girl!,
//              //                  photo8: mallard!,
//              //                  photo9: iceCream!,
//              //                  photo10: japaneseGarden!,
//              //                  photo11: horseLady!,
//              //                  photo12: madHatter!,
//              //                  photo13: northernLight!,
//              //                  photo14: pathosFair!,
//              //                  photo15: spermWhale!,
//              //                  photo16: samoyeds!,
//              //                  photo17: scientistsSingapore!,
//              //                  photo18: surfing!,
//              //                  photo19: universe!,
//              //                  photo20: wingsuitRider!,
//              arrowButton: arrow!)
//    ]
//    /// Section 1.
//    static let publications = [
//        Post(author: "atsukooshio",
//             image: harukiMurakami!,
//             description: "The last novel by the most famous author of modern Japanese prose - Haruki Murakami, the main literary sensation of the new century, \"magnum opus of the renowned master\" and must read for anyone who wants to understand the Japanese culture of our day, by opinion of some critics.",
//             likes: 4_905,
//             views: 5_194),
//        Post(author: "news_Hollywood",
//             image: wednesdayTimBurton!,
//             description: "Wednesday is an upcoming American horror comedy streaming television series, based around the character Wednesday Addams of The Addams Family. Project being helmed by Tim Burton.",
//             likes: 187_372,
//             views: 194_563),
//        Post(author: "@abrunkus",
//             image: moulinRouge!,
//             description: "Paris's Moulin Rouge to high-kick its way back on stage in September. The Moulin Rouge has been shut since March 12, 2020 -- the longest closure since the theatre was destroyed by fire in 1915.",
//             likes: 643_578,
//             views: 749_345),
//        Post(author: "donatelife",
//             image: heartTransplantation!,
//             description: "First pig-to-human heart transplant: what can scientists learn?",
//             likes: 56_742,
//             views: 76_721)
//    ]
//}
