//
//  94. Binary Tree Inorder Traversal.swift
//  Leetcode
//
//  Created by HyeonTae Kim on 5/19/24.
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

public class TreeNode_94 {
    public var val: Int
    public var left: TreeNode_94?
    public var right: TreeNode_94?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode_94?, _ right: TreeNode_94?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution_94 {
    init() { }
    
    func inorderTraversal(_ root: TreeNode_94?) -> [Int] {
        var result: [Int] = []
        guard let root else { return [] }
        
        if let left = root.left {
            result.append(contentsOf: inorderTraversal(left))
        }
        
        result.append(root.val)
        
        if let right = root.right {
            result.append(contentsOf: inorderTraversal(right))
        }
        
        return result
    }
}
