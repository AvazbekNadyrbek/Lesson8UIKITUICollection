//
//  CardModel.swift
//  Lesson8UIKIT
//
//  Created by Авазбек Надырбек уулу on 22.05.25.
//

import UIKit

// Identifiable protocol is used to identify unique instances of a type.
struct CardModel: Identifiable {
    
    var id: String = UUID().uuidString
    var image: String
    var name: String
    var price: Int
    var date: String
    var counter: Int
    var number: Int
    
    static var mocData: [CardModel] {
        return [
            CardModel(image: "ceIlImg1", name: "Volvo xc90, 2020", price: 6_234_234, date: "19 february 2025", counter: 225, number: 112323),
            CardModel(image: "ceIlImg2", name: "Volvo xc90, 2020", price: 6_234_234, date: "19 february 2025", counter: 225, number: 112323),
            CardModel(image: "ceIlImg3", name: "Volvo xc90, 2020", price: 6_234_234, date: "19 february 2025", counter: 225, number: 112323),
            
            CardModel(image: "ceIlImg1", name: "Volvo xc90, 2020", price: 6_234_234, date: "19 february 2025", counter: 225, number: 112323),
            CardModel(image: "ceIlImg2", name: "Volvo xc90, 2020", price: 6_234_234, date: "19 february 2025", counter: 225, number: 112323),
            CardModel(image: "ceIlImg3", name: "Volvo xc90, 2020", price: 6_234_234, date: "19 february 2025", counter: 225, number: 112323),
        ]
    }
}
