//
//  14. Longest Common Prefix.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/9/24.
//

import Foundation

// EASY

class Solution_Longest_Common_Prefix {
    init() {
        var strs = ["flower","flow","flight"]
        print(strs)
        print(longestCommonPrefix(strs))
        
        strs = ["dog","racecar","car"]
        print(strs)
        print(longestCommonPrefix(strs))
        
        strs = ["dog","dog"]
        print(strs)
        print(longestCommonPrefix(strs))
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = strs[0]
        
        for singleStr in strs[1...] {
            
            var tempIndex = -1
            
            for index in 0..<min(result.count, singleStr.count) {
                
                if result[index] == singleStr[index] {
                    tempIndex += 1
                    if index != min(result.count, singleStr.count) - 1 {
                        continue
                    }
                }
                
                if tempIndex == -1 {
                    result = ""
                } else {
                    result = result[0...tempIndex]
                }
                
                tempIndex = -1
                break
            }
            
            if result.isEmpty {
                break
            }
        }
        
        return result
    }
}



extension String {
    subscript (at: Int) -> String {
        let start = index(startIndex, offsetBy: at)
        return String(self[start])
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
