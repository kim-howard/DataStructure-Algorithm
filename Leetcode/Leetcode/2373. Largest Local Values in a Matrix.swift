//
//  2373. Largest Local Values in a Matrix.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/12/24.
//

import Foundation

class Solution_Largest_Local_Values_in_a_Matrix {
    init() {
        var input = [[9,9,8,1],[5,6,2,6],[8,2,6,4],[6,2,2,2]]
        print("Input \(input)")
        print("Output \(largestLocal(input))")
        print("DONE!")
        
        input = [[1,1,1,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,1,1,1],[1,1,1,1,1]]
        print("Input \(input)")
        print("Output \(largestLocal(input))")
        print("DONE!")
    }
    
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let resultRowCount = grid.count - 2
        let resultColCount = resultRowCount
        var result: [[Int]] = Array(repeating: Array(repeating: 0, count: resultRowCount), count: resultColCount)
        
        var savedMaxQ: [Int] = []
        
        for colIndex in 0..<resultColCount {
            savedMaxQ.removeAll()
            
            for rowIndex in 0..<resultRowCount {
                
                let thirdColTempMax = max(grid[rowIndex + 2][colIndex], grid[rowIndex + 2][colIndex + 1], grid[rowIndex + 2][colIndex + 2])
                
                if savedMaxQ.count == 3 {
                    savedMaxQ.removeFirst()
                    savedMaxQ.append(thirdColTempMax)
                } else {
                    let firstColTempMax = max(grid[rowIndex][colIndex], grid[rowIndex][colIndex + 1], grid[rowIndex][colIndex + 2])
                    let secondColTempMax = max(grid[rowIndex + 1][colIndex], grid[rowIndex + 1][colIndex + 1], grid[rowIndex + 1][colIndex + 2])
                    savedMaxQ.append(contentsOf: [firstColTempMax, secondColTempMax, thirdColTempMax])
                }
                
                result[rowIndex][colIndex] = savedMaxQ.max()!
            }
        }
        
        return result
    }
    
    
}
