//
//  1863. Sum of All Subset XOR Totals.swift
//  Leetcode
//
//  Created by howard on 5/20/24.
//

import Foundation

// 살펴보기 - https://leetcode.com/problems/sum-of-all-subset-xor-totals/editorial/?source=submission-ac

class Solution_1863 {
    init() {
//        print(subsetXORSum([1,3]))
//        print(subsetXORSum([5,1,6]))
        print(subsetXORSum([3,4,5,6,7,8]))
        
    }
    
    func subsetXORSum(_ nums: [Int]) -> Int {
        // 이전 수의 배열들을 저장해 둔다.
        // 이때 결과값과 index를 둘 다 저장해둬야 한다.
        // 배열에서 마지막 요소의 다음요소들부터 for 문을 진행한다.
        var result: Int = 0
        var currentDigitCount = 0
        var previousResultList: [(tempResult: Int, lastIndex: Int)] = []
        
        while currentDigitCount <= nums.count {
            // 여기서 하나씩 요소들 추가해서 ^ 계산하고
            // pre temp swap
            // 모든 값들을 더한다.
            currentDigitCount += 1
            var tempResultList: [(tempResult: Int, lastIndex: Int)] = []
            
            if currentDigitCount == 1 {
                tempResultList = nums.enumerated().map { ($0.element, $0.offset) }
                result = nums.reduce(0, { $0 + $1 })
            } else {
                previousResultList.removeLast()
                for previousResult in previousResultList {
                    for num in nums[(previousResult.lastIndex + 1)...].enumerated() {
                        let currentResult = previousResult.tempResult ^ num.element
                        tempResultList.append((tempResult: currentResult, lastIndex: previousResult.lastIndex + 1 + num.offset))
                        result += currentResult
                    }
                }
            }
            
            previousResultList = tempResultList
        }
        
        return result
    }
}
