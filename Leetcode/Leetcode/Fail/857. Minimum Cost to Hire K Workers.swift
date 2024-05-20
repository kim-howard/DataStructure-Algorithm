//
//  857. Minimum Cost to Hire K Workers.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/11/24.
//

import Foundation

// TimeOut ㅠㅠ

//Input: quality = [10,20,5], wage = [70,50,30], k = 2
//Output: 105.00000
//Explanation: We pay 70 to 0th worker and 35 to 2nd worker.


// [7 2.5 6] -> 이후 계산에서 또 해야함 의미가 없음
// 10 기준 [70 140 35] = 105
// 20 기준 [25 50 12.5] = -1
// 5 기준  [60 120 30] = 150
// Q 기준으로 시작해서 기준의 비율만큼 wage 를 가계산 - wage 와 비교한 뒤 최소 가격보다 높으면 넣는다.
// 그 다음 그 배열에서 기준을 제외한 만큼 k - 1 명을 계산한다. -> sort 이후 아래 k개 더하기

// 두번째
// ratio 로 sort
//
// 이 다음 계산을 어떻게? sort 하는 순간 index가 꼬이는데?
// index를 포함한 뒤 sort를 하면 된다.



//Input: quality = [3,1,10,10,1], wage = [4,8,2,2,7], k = 3
//Output: 30.66667
//Explanation: We pay 4 to 0th worker, 13.33333 to 2nd and 3rd workers separately.

//class Solution_Minimum_Cost_to_Hire_K_Workers {
//    init() {
//        var q = [10,20,5]
//        var wage = [70, 50, 30]
//        var k = 2
//        print("ANS -> \(mincostToHireWorkers(q, wage, k))")
//        print("NEXT @@@@@")
//        
//        q = [3,1,10,10,1]
//        wage = [4,8,2,2,7]
//        k = 3
//        print("ANS -> \(mincostToHireWorkers(q, wage, k))")
//    }
//    
//    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
//        var result: Double = 0
//        let ratioList: [Double] = quality.enumerated().map { Double(wage[$0.offset]) / Double($0.element) }
//        
//        for currentRatio in ratioList {
//            let currentRatioWageList: [Double] = quality.map { Double($0) * currentRatio }
//            var semiResultList: [Double] = []
//            
//            for (tempWageIndex, tempWage) in currentRatioWageList.enumerated() where Int(tempWage) >= wage[tempWageIndex] {
//                
//                if semiResultList.isEmpty {
//                    semiResultList.append(tempWage)
//                } else {
//                    var newWageTempIndex: Int?
//                    for newWage in semiResultList.enumerated() where newWage.offset < k && newWage.element >= tempWage {
//                        newWageTempIndex = newWage.offset
//                        break
//                    }
//                    if let newWageTempIndex {
//                        semiResultList.insert(tempWage, at: newWageTempIndex)
//                    } else if semiResultList.count < k {
//                        semiResultList.append(tempWage)
//                    }
//                    
//                }
//            }
//            
//            if semiResultList.count < k {
//                continue
//            }
//            
//            let semiResult = semiResultList[0..<k].reduce(0, +)
//            print("semi \(semiResult) , current \(result)")
//            if result == 0 {
//                result = semiResult
//            } else {
//                result = min(result, semiResult)
//            }
//        }
//        
//        return Double(Int(round(result * 100000))) / Double(100000)
//    }
//    
////    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
////        var result: Double = 0
////        // 기준 잡고
////        var pivotWage: Double = 0
////        let ratio: [Double] = quality.enumerated().map { Double(wage[$0.offset]) / Double($0.element) }
////        
////        
////        for (qindex, qValue) in quality.enumerated() {
////            pivotWage = Double(wage[qindex])
////            print("pivot \(qindex) , \(qValue), \(pivotWage)")
////            
////            // wage 변환 + 기준에 안맞으면 제외
////            var newWageList: [Double] = []
////            
////            for (wIndex, wValue) in wage.enumerated() {
////                let tempWage: Double = Double(quality[wIndex]) * ratio[qindex]
////                if tempWage >= Double(wValue) {
////                    
////                    
////                    if newWageList.isEmpty {
////                        newWageList.append(tempWage)
////                    } else {
////                        var newWageTempIndex: Int?
////                        for newWage in newWageList.enumerated() where newWage.offset <= k && newWage.element > tempWage {
////                            newWageTempIndex = newWage.offset
////                            break
////                        }
////                        if let newWageTempIndex {
////                            newWageList.insert(tempWage, at: newWageTempIndex)
////                            newWageList = Array(newWageList[0..<k])
////                        }
////                    }
////                    
////                    
////                    newWageList.append(Double(tempWage))
////                    
////                    
////                } else {
////                    continue
////                }
////            }
////            
////            print("new wage \(newWageList)")
////            if newWageList.count < k {
////                continue
////            }
////            
////            // 최소 k 명 처리
////            let semiResult = newWageList.reduce(0, +)
////            print("semi \(semiResult) , current \(result)")
////            if result == 0 {
////                result = semiResult
////            } else {
////                result = min(result, semiResult)
////            }
////            print("NEXT")
////        }
////        
////        // 소수점 5자리까지만
////        return Double(Int(round(result * 100000))) / Double(100000)
////    }
//}
