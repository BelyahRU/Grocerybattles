//
//  Source.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 26.08.2023.
//

import Foundation

struct Source {
    
    static func getUsersArray() -> [User] {
        [
            .init(name: "Phillip Rosser", level: "50", points: "103"),
            .init(name: "Liviva levin", level: "80", points: "80"),
            .init(name: "Lincoln Dokidis", level: "20", points: "78"),
            .init(name: "Abram Vetrous", level: "50", points: "54"),
            .init(name: "Gustavo Bator", level: "25", points: "42"),
            .init(name: "Marilyn Schleifer", level: "25", points: "40")
        ]
    }
}

struct User {
    let name: String
    let level: String
    let points: String
}
