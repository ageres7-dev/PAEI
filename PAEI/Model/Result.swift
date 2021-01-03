//
//  Result.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//

struct Result {
    let shortInfo: String
    let picture: String
    var characteristic: String

    init(shortInfo: String = "", picture: String = "", characteristic: String = "") {
        self.shortInfo = shortInfo
        self.picture = picture
        self.characteristic = characteristic
    }
}

//enum Paei: String {
//    case largeP = "P"
//    case smoleP = "p"
//    case dash = "-"
//    case largeA = "A"
//    case smoleA = "a"
//    case largeE = "E"
//    case smoleE = "e"
//    case largeI = "I"
//    case smoleI = "i"
//}
