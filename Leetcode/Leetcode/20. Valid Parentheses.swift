//
//  20. Valid Parentheses.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/10/24.
//

import Foundation

class Solution_Valid_Parentheses {
    init() {
        var s = "()"
        print("Input : \(s)")
        print("Output : \(isValid(s))")
        
        s = "()[]{}"
        print("Input : \(s)")
        print("Output : \(isValid(s))")
        
        
        s = "(]"
        print("Input : \(s)")
        print("Output : \(isValid(s))")
        
        s = "(())"
        print("Input : \(s)")
        print("Output : \(isValid(s))")
        
        s = "(()){}"
        print("Input : \(s)")
        print("Output : \(isValid(s))")
        
        s = "((){)}"
        print("Input : \(s)")
        print("Output : \(isValid(s))")
        
        s = "{[]}"
        print("Input : \(s)")
        print("Output : \(isValid(s))")
    }
    
    func isValid(_ s: String) -> Bool {
        var result = ""
        
        for ch in s {
            if result.isEmpty {
                result.append(ch)
                continue
            }
            
            if ch == ")" {
                if result.last == "(" {
                    result.removeLast()
                } else {
                    return false
                }
            } else if ch == "}" {
                if result.last == "{" {
                    result.removeLast()
                } else {
                    return false
                }
            } else if ch == "]" {
                if result.last == "[" {
                    result.removeLast()
                } else {
                    return false
                }
            } else {
                result.append(ch)
            }
        }
        
        return result.isEmpty
    }
    
    // 속도는 제일 빠르다.
    // 다른 답변을 봤을때 생각이 드는 것은 switch 를 왜 생각못했을까 하는 점
}
