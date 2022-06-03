// Solution created by Andrei Krotov. 2022, 3 Jun.

// 704. Binary Search
//
// Tags:
// Array
// Binary Search
//
// Problem:
//Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
//
//You must write an algorithm with O(log n) runtime complexity.
//
//
//
//Example 1:
//
//Input: nums = [-1,0,3,5,9,12], target = 9
//Output: 4
//Explanation: 9 exists in nums and its index is 4
//Example 2:
//
//Input: nums = [-1,0,3,5,9,12], target = 2
//Output: -1
//Explanation: 2 does not exist in nums so return -1
//
//
//Constraints:
//
//1 <= nums.length <= 104
//-104 < nums[i], target < 104
//All the integers in nums are unique.
//nums is sorted in ascending order.

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        
        let right = nums.count - 1
        let left = 0
        
        guard right != left else { return nums[left] == target ? left : -1 }
        guard nums[right] != target else { return right }
        guard nums[left] != target else { return left }
        
        let mid = (left + right) / 2
        
        guard mid != left, mid != right else { return -1 }
        
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            return search(Array(nums.dropLast(right - mid)), target)
        } else {
            let searchResult = search(Array(nums.dropFirst(mid)), target)
            return searchResult == -1 ? -1 : mid + searchResult
        }
    }
}

let solution = Solution()
print("nums = [-1,0,3,5,9,12], target = 9, result =", solution.search([-1,0,3,5,9,12], 9))
print("nums = [-1,0,3,5,9,12], target = 2, result =", solution.search([-1,0,3,5,9,12], 2))
print("nums = [5], target = 5, result =", solution.search([5], 5))
