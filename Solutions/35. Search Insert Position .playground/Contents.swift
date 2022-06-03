// Solution created by Andrei Krotov. 2022, 3 Jun.

// 35. Search Insert Position
//
// Tags:
// Array
// Binary Search
//
// Problem:
//Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
//You must write an algorithm with O(log n) runtime complexity.
//
//
//
//Example 1:
//
//Input: nums = [1,3,5,6], target = 5
//Output: 2
//Example 2:
//
//Input: nums = [1,3,5,6], target = 2
//Output: 1
//Example 3:
//
//Input: nums = [1,3,5,6], target = 7
//Output: 4
//
//
//Constraints:
//
//1 <= nums.length <= 104
//-104 <= nums[i] <= 104
//nums contains distinct values sorted in ascending order.
//-104 <= target <= 104

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        let right = nums.count - 1
        let left = 0
        
        guard right != left else { return nums[left] >= target ? left : left + 1 }
        guard nums[right] != target else { return right }
        guard nums[left] != target else { return left }
        
        let mid = (left + right) / 2
        print(left, mid, right)
        
        if mid == left || mid == right {
            if nums[left] >= target {
                return left
            } else if nums[right] >= target {
                return right
            } else {
                return right + 1
            }
        }
        
        let midNum = nums[mid]
        
        if midNum == target {
            return mid
        } else if midNum > target {
            return searchInsert(Array(nums.dropLast(right - mid)), target)
        } else {
            let searchResult = searchInsert(Array(nums.dropFirst(mid)), target)
            return mid + searchResult
        }
    }
}

let solution = Solution()

print("nums = [1], target = 2, result = ", solution.searchInsert([1], 2))
print("nums = [1,3,5,6], target = 0, result = ", solution.searchInsert([1,3,5,6], 0))
print("nums = [1,3,5,6], target = 2, result = ", solution.searchInsert([1,3,5,6], 2))
print("nums = [1,3,5,6], target = 5, result = ", solution.searchInsert([1,3,5,6], 5))
print("nums = [1,3,5,6], target = 7, result = ", solution.searchInsert([1,3,5,6], 7))
