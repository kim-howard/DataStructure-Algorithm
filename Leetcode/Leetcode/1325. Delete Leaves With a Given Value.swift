//
//  1325. Delete Leaves With a Given Value.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/17/24.
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

public class TreeNode_1325 {
    public var val: Int
    public var left: TreeNode_1325?
    public var right: TreeNode_1325?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode_1325?, _ right: TreeNode_1325?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution_Delete_Leaves_With_a_Given_Value {
    func removeLeafNodes(_ root: TreeNode_1325?, _ target: Int) -> TreeNode_1325? {
        var newTree = root
        // left 확인
        if let left = root?.left {
            newTree?.left = removeLeafNodes(left, target)
        }
        
        // right 확인
        if let right = root?.right {
            newTree?.right = removeLeafNodes(right, target)
        }
        
        if newTree?.left == nil, newTree?.right == nil, target == newTree?.val {
            return nil
        } else {
            return newTree
        }
    }
}
