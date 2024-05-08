//
//  13. Roman to Integer.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/8/24.
//

import Foundation

/// https://leetcode.com/problems/roman-to-integer/description/


// 다음 숫자는 더 작은 값이어야 함
// 만약 다음 숫자가 크다면 다음 숫자에서 지금 숫자를 뺀 값을 더한다.
class Solution_Roman_to_Integer {
    func romanToInt(_ s: String) -> Int {
        var symbolInfo: [String: Int] = [:]
        symbolInfo.updateValue(1, forKey: "I")
        symbolInfo.updateValue(5, forKey: "V")
        symbolInfo.updateValue(10, forKey: "X")
        symbolInfo.updateValue(50, forKey: "L")
        symbolInfo.updateValue(100, forKey: "C")
        symbolInfo.updateValue(500, forKey: "D")
        symbolInfo.updateValue(1000, forKey: "M")
        
        var result: Int = 0
        var temp: Int = 0
        
        for (index, ch) in s.enumerated() {
            let current = symbolInfo[String(ch)] as! Int
            
            if temp == 0 {
                temp = current
            } else {
                if temp >= current {
                    result += temp
                    temp = current
                } else { // temp < current
                    result -= temp
                    result += current
                    temp = 0
                }
            }
            
            if index == s.count - 1 {
                result += temp
            }
        }
        
        return result
    }
}

/// 좋은 런타임 코드 - 필요한 6가지 조건만 정확하게 짚어냈다.
/// 정말 필요한 조건들을 추려낼 수 있는 문제인지 봐야함.
//class Solution {
//    func romanToInt(_ s: String) -> Int {
//        var sum = 0
//        var prevChar: Character = " "
//        let romanMap: [Character:Int] = ["I" : 1,
//                                        "V" : 5,
//                                        "X" : 10,
//                                        "L" : 50,
//                                        "C" : 100,
//                                        "D" : 500,
//                                        "M" : 1000]
//        for c in s {
//            if (prevChar == "I" && (c == "V" || c == "X")) ||
//                (prevChar == "X" && (c == "L" || c == "C")) ||
//                (prevChar == "C" && (c == "D" || c == "M")) {
//                sum += romanMap[c]! - 2 * romanMap[prevChar]!
//            } else {
//                sum = romanMap[c]! + sum
//            }
//            prevChar = c
//        }
//
//        return sum
//    }
//}
