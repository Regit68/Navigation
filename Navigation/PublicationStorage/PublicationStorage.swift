//
//  PublicationStorage.swift
//  Navigation
//
//  Created by Irina on 07.02.2022.
//

import UIKit

var harukiMurakami = UIImage(named: "1Q84")
var wednesdayTimBurton = UIImage(named: "Wednesday Tim Burton")
var moulinRouge = UIImage(named: "Moulin Rouge")
var heartTransplantation = UIImage(named: "Heart transplantation")

struct PublicationStorage {
    static let publications = [
        /// Section 0.
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
}
