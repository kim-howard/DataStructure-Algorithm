//
//  1219. Path with Maximum Gold.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/14/24.
//

import Foundation

class Solution_Path_with_Maximum_Gold {
    init(){
        var value = getMaximumGold([[0,6,0],[5,8,7],[0,9,0]])
        print("result \(value)")
    }
    
    // MARK: 사실 이 문제는 이렇게 풀면 안되고 모든 유일한 경로를 구해서 값을 더하는 방식으로 짜야한다.
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        // 엣지 케이스가 있어서 모든 starting point에 대해서 진행
        var visitedIndexMatrixForStart: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var result = 0
        
        for rowIndex in 0..<grid.count {
            for colIndex in 0..<grid[0].count where grid[rowIndex][colIndex] != 0 && !visitedIndexMatrixForStart[rowIndex][colIndex] {
                collectGold([(rowIndex, colIndex)], currentGold: grid[rowIndex][colIndex])
            }
        }
        
        func collectGold(_ currentPathList: [(row: Int, col: Int)], currentGold: Int)  {
            let lastPosition = currentPathList.last!
            var currentMinerVisitingPath = currentPathList
            var totalGold = currentGold
            
            var isStuck: Bool = true
            
            // 이동할때의 기준은
            // index 가능성
            // 1. 0이 아닐 것 2. 방문을 한적이 없을 것
            // 이동을 하고 나서는 visited update 할 것
            
            // can go up?
            if lastPosition.row != 0 && grid[lastPosition.row - 1][lastPosition.col] != 0 && !isContain(currentPathList, target: (lastPosition.row - 1, lastPosition.col)) {
                isStuck = false
                let newRowIndex = lastPosition.row - 1
                let newColIndex = lastPosition.col
                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
            }
            
            // can go down?
            if lastPosition.row < grid.count - 1 && grid[lastPosition.row + 1][lastPosition.col] != 0 && !isContain(currentPathList, target: (lastPosition.row + 1, lastPosition.col)) {
                isStuck = false
                let newRowIndex = lastPosition.row + 1
                let newColIndex = lastPosition.col
                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
            }
            
            // can go left?
            if lastPosition.col != 0 && grid[lastPosition.row][lastPosition.col - 1] != 0 && !isContain(currentPathList, target: (lastPosition.row, lastPosition.col - 1)) {
                isStuck = false
                let newRowIndex = lastPosition.row
                let newColIndex = lastPosition.col - 1
                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
            }
            
            // can go right?
            if lastPosition.col < grid[0].count - 1 && grid[lastPosition.row][lastPosition.col + 1] != 0 && !isContain(currentPathList, target: (lastPosition.row, lastPosition.col + 1)) {
                isStuck = false
                let newRowIndex = lastPosition.row
                let newColIndex = lastPosition.col + 1
                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
            }
            
            
            if isStuck {
                print("Path > \(currentMinerVisitingPath) && Gold : \(totalGold)")
                result = max(result, totalGold)
            }
        }
        
        func isContain(_ list: [(row: Int, col: Int)], target: (row: Int, col: Int)) -> Bool {
            var isContain: Bool = false
            for item in list {
                if target.row == item.row && target.col == item.col {
                    isContain = true
                    break
                }
            }
            return isContain
        }
        
        return result
    }
    
//    func getMaximumGold(_ grid: [[Int]]) -> Int {
//        // 시작점을 구현할때 한번 방문한 곳은 시작점을 만들 필요가 없다.
//        // 분기가 나타났을때 해당 지점까지의 경로를 기록하고 분기의 경로를 추가한 다음 최댓값을 찾는다.
//        var visitedIndexMatrixForStart: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
//        var result = 0
//        
//        for rowIndex in 0..<grid.count {
//            for colIndex in 0..<grid[0].count where grid[rowIndex][colIndex] != 0 && !visitedIndexMatrixForStart[rowIndex][colIndex] {
//                visitedIndexMatrixForStart[rowIndex][colIndex] = true
//                collectGold([(rowIndex, colIndex)], currentGold: grid[rowIndex][colIndex])
//            }
//        }
//        
//        func collectGold(_ currentPathList: [(row: Int, col: Int)], currentGold: Int)  {
//            let lastPosition = currentPathList.last!
//            var currentMinerVisitingPath = currentPathList
//            var totalGold = currentGold
//            
//            var isStuck: Bool = true
//            
//            // 이동할때의 기준은
//            // index 가능성
//            // 1. 0이 아닐 것 2. 방문을 한적이 없을 것
//            // 이동을 하고 나서는 visited update 할 것
//            
//            // can go up?
//            if lastPosition.row != 0 && grid[lastPosition.row - 1][lastPosition.col] != 0 && !isContain(currentPathList, target: (lastPosition.row - 1, lastPosition.col)) {
//                isStuck = false
//                let newRowIndex = lastPosition.row - 1
//                let newColIndex = lastPosition.col
//                visitedIndexMatrixForStart[newRowIndex][newColIndex] = true
//                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
//            }
//            
//            // can go down?
//            if lastPosition.row < grid.count - 1 && grid[lastPosition.row + 1][lastPosition.col] != 0 && !isContain(currentPathList, target: (lastPosition.row + 1, lastPosition.col)) {
//                isStuck = false
//                let newRowIndex = lastPosition.row + 1
//                let newColIndex = lastPosition.col
//                visitedIndexMatrixForStart[newRowIndex][newColIndex] = true
//                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
//            }
//            
//            // can go left?
//            if lastPosition.col != 0 && grid[lastPosition.row][lastPosition.col - 1] != 0 && !isContain(currentPathList, target: (lastPosition.row, lastPosition.col - 1)) {
//                isStuck = false
//                let newRowIndex = lastPosition.row
//                let newColIndex = lastPosition.col - 1
//                visitedIndexMatrixForStart[newRowIndex][newColIndex] = true
//                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
//            }
//            
//            // can go right?
//            if lastPosition.col < grid[0].count - 1 && grid[lastPosition.row][lastPosition.col + 1] != 0 && !isContain(currentPathList, target: (lastPosition.row, lastPosition.col + 1)) {
//                isStuck = false
//                let newRowIndex = lastPosition.row
//                let newColIndex = lastPosition.col + 1
//                visitedIndexMatrixForStart[newRowIndex][newColIndex] = true
//                collectGold(currentMinerVisitingPath + [(newRowIndex, newColIndex)], currentGold: totalGold + grid[newRowIndex][newColIndex])
//            }
//            
//            
//            if isStuck {
//                print("Path > \(currentMinerVisitingPath) && Gold : \(totalGold)")
//                result = max(result, totalGold)
//            }
//        }
//        
//        func isContain(_ list: [(row: Int, col: Int)], target: (row: Int, col: Int)) -> Bool {
//            var isContain: Bool = false
//            for item in list {
//                if target.row == item.row && target.col == item.col {
//                    isContain = true
//                    break
//                }
//            }
//            return isContain
//        }
//        
//        return result
//    }
}
