//
//  Plants.swift
//  PlantApp
//
//  Created by Irsyad Abdillah on 09/01/23.
//

import SwiftUI

struct Plants: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let desc: String
    let price: String
    let image: String
}

struct Plant {
    static let list = [
        Plants(name: "Montsera",
               desc: "About Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama.",
               price: "IDR. 150.000",
               image: "plant_image1"),
        Plants(name: "Cactus",
               desc: "About Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama.",
               price: "IDR. 199.000",
               image: "plant_image2"),
        Plants(name: "Fictus",
               desc: "About Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama.",
               price: "IDR. 99.000",
               image: "plant_image3"),
        Plants(name: "Peace Lily",
               desc: "About Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama.",
               price: "IDR. 210.000",
               image: "plant_image4"),
        Plants(name: "Montsera",
               desc: "About Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama.",
               price: "IDR. 175.000",
               image: "plant_image5")
    ]
}
