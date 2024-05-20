//
//  118. Pascal's Triangle.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/13/24.
//

import Foundation

class Solution_Pascal_s_Triangle {
    init() {
        print(generate(30))
    }
    
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        for rowIndex in 0..<numRows {
            
            var semiResult: [Int] = []
            
            for colIndex in 0..<rowIndex + 1 {
                if colIndex == 0 {
                    semiResult.append(1)
                } else if colIndex == rowIndex {
                    semiResult.append(1)
                } else {
                    semiResult.append(result[rowIndex - 1][colIndex - 1] + result[rowIndex - 1][colIndex])
                }
            }
            result.append(semiResult)
            
        }
        
        return result
    }
}
