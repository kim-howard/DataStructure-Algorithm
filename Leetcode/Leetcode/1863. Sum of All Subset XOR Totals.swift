//
//  1863. Sum of All Subset XOR Totals.swift
//  Leetcode
//
//  Created by howard on 5/20/24.
//

import Foundation

class Solution_1863 {
    func subsetXORSum(_ nums: [Int]) -> Int {
        // 이전 수의 배열들을 저장해 둔다.
        // 이때 결과값과 index를 둘 다 저장해둬야 한다.
        // 배열에서 마지막 요소의 다음요소들부터 for 문을 진행한다.
        var result: Int = 0
        var currentDigitCount = 0
        var previousResultList: [(tempResult: Int, lastIndex: Int)] = []
        
        while currentDigitCount == nums.count {
            var tempResultList: [(tempResult: Int, lastIndex: Int)] = []
            // 여기서 하나씩 요소들 추가해서 ^ 계산하고
            // pre temp swap
            // 모든 값들을 더한다.
        }
        
        return 0
    }
}
