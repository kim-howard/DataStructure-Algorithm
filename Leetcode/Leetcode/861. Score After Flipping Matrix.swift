//
//  861. Score After Flipping Matrix.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/13/24.
//

import Foundation

class Solution_Score_After_Flipping_Matrix {
    init() {
//        print(matrixScore([[0,0,1,1],[1,0,1,0],[1,1,0,0]]))
        print(matrixScore([[0]]))
    }
    
    func matrixScore(_ grid: [[Int]]) -> Int {
        var result = 0
        var newGrid: [[Int]] = grid
        func flipRows(_ rowIndex: Int) {
            print("flip Row \(rowIndex)")
            for colIndex in 0..<grid[0].count {
                if newGrid[rowIndex][colIndex] == 0 {
                    newGrid[rowIndex][colIndex] = 1
                } else {
                    newGrid[rowIndex][colIndex] = 0
                }
            }
        }
        
        func flipCols(_ colIndex: Int) {
            print("flip Col \(colIndex)")
            for rowIndex in 0..<grid.count {
                if newGrid[rowIndex][colIndex] == 0 {
                    newGrid[rowIndex][colIndex] = 1
                } else {
                    newGrid[rowIndex][colIndex] = 0
                }
            }
        }
        
        func sumCols(_ colIndex: Int) -> Int {
            var sum = 0
            for rowIndex in 0..<grid.count {
                sum += newGrid[rowIndex][colIndex]
            }
            return sum
        }
        
        for rowIndex in 0..<grid.count {
            if newGrid[rowIndex][0] == 0 {
                flipRows(rowIndex)
            }
        }
        
        for colIndex in 0..<grid[0].count {
            let maxValue = grid.count
            let currentColSum = sumCols(colIndex)
            if maxValue - currentColSum > currentColSum {
                flipCols(colIndex)
            }
        }
        
        for colIndex in 0..<grid[0].count {
            let power = pow(Double(2), Double(grid[0].count - 1 - colIndex))
            result += sumCols(colIndex) * Int(power)
        }
        
        return result
    }
    
    
}
