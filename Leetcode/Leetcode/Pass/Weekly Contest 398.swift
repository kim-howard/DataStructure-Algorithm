//
//  Weekly Contest 398.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/19/24.
//

import Foundation

class Solution_398 {
    init() {
        

//    Input: nums = [3,4,1,2,6], queries = [[0,4]]
        print("result \(isArraySpecial([3,4,1,2,6], [[0,4]]))")
//    Input: nums = [4,3,1,6], queries = [[0,2],[2,3]]
        print("result \(isArraySpecial([4,3,1,6], [[0,2],[2,3]]))")

        
//        print("result \(isArraySpecial([1]))")
//        print("result \(isArraySpecial([2,1,4]))")
//        print("result \(isArraySpecial([4,3,1,6]))")
    }
    
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        var result: [Bool] = []
        let oddMaps = nums.map { $0 % 2 == 1 }
        
        for query in queries {
            var flag = true
            var currentIsOdd = true
            
            for (index, isOdd) in oddMaps[query.first!...query.last!].enumerated() {
                if index == 0 {
                    currentIsOdd = isOdd
                    continue
                }
                
                if currentIsOdd {
                    guard !isOdd else {
                        flag = false
                        break
                    }
                    currentIsOdd = false
                } else {
                    guard isOdd else {
                        flag = false
                        break
                    }
                    currentIsOdd = true
                }
            }
            
            result.append(flag)
        }
        
        
        
        return result
    }
    
//    func isArraySpecial(_ nums: [Int]) -> Bool {
//        var flag = true
//        var currentIsOdd = true
//        
//        for (index, num) in nums.enumerated() {
//            if index == 0 {
//                currentIsOdd = (num % 2 == 1)
//                continue
//            }
//            
//            if currentIsOdd {
//                guard num % 2 == 0 else {
//                    flag = false
//                    break
//                }
//                currentIsOdd = false
//            } else {
//                guard num % 2 == 1 else {
//                    flag = false
//                    break
//                }
//                currentIsOdd = true
//            }
//        }
//        
//        return flag
//    }
}
