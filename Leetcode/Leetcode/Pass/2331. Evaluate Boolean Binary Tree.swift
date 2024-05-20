//
//  2331. Evaluate Boolean Binary Tree.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/16/24.
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

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// 0 - false
// 1 - true
// 2 - OR
// 3 - AND

class Solution_Evaluate_Boolean_Binary_Tree {
    init() {
        print("result > \(evaluateTree(TreeNode.init(0)))")
        print("result > \(evaluateTree(TreeNode.init(1)))")
    }
    
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let root else { fatalError("no root") }
        switch root.val {
        case 0:
            return false
        case 1:
            return true
        case 2:
            return evaluateTree(root.left) || evaluateTree(root.right)
        case 3:
            return evaluateTree(root.left) && evaluateTree(root.right)
        default:
            fatalError("out of range")
        }
    }
}
