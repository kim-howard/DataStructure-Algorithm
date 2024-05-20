//
//  979. Distribute Coins in Binary Tree.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/18/24.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

//public class TreeNode_979 {
//    public var val: Int
//    public var left: TreeNode_979?
//    public var right: TreeNode_979?
//    public init() { self.val = 0; self.left = nil; self.right = nil; }
//    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//    public init(_ val: Int, _ left: TreeNode_979?, _ right: TreeNode_979?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}
//
//class Solution_Distribute_Coins_in_Binary_Tree {
//    
//    // 코인을 옮겨야 한다.
//    // 1. 특정 노드에서 leaf 까지 옮기는데 필요한 move와 현재 coin 수를 계산한다.
//    // 2. parent에서 줘야할 코인 수와 현재 코인 수를 뺀 값을 더한다.
//    // 결국 코인이 전달 되면 move가 계산될 수 있게끔 한다.
//    
//    // 이때 만약 하단에 더 많은 coin 이 있다면 이를 그대로 위로 올린다. - move 계산
//    
//    func distributeCoins(_ root: TreeNode_979?) -> Int {
//        guard let root else  { return 0 }
//        let currentNodeCoin = root.val
//        
//        if let left = root.left {
//            
//        }
//        
//        if let right = root.right {
//            
//        }
//        
//        return 0
//    }
//    
//    // 제일 하단이라고 생각해보자.
//    // 넘치는 경우 위로 올려야 함 val - 1
//    // 부족한 경우 필요 1
//    // 채우는 데 필요한 값, 올리는데 필요한 값
//    
//    // 중간 노드라고 하고 왼쪽 3개 필요 오른쪽 5개 필요
//    // 넘치는 경우 - 위로 올림 val - 1 + left + right
//    // 딱 맞는 경우 - val - 1 + left + right
//    // 부족한 경우 - left + right - val - 1
//    
//    func calCoinAndMove(_ root: TreeNode_979) -> (needCoin: Int, totalMove: Int) {
//        var needToDistributeCoin = 0
//        var needToDistributeMove = 0
//        
//        if root.left == nil && root.right == nil {
//            return (1 - root.val, root.val >= 1 ? 0 : 1)
//        }
//        
//        if let left = root.left {
//            
//        }
//        
//        if let right = root.right {
//            
//        }
//        
//        return (0,0)
//        
//    }
//}
