// Solution created by Andrei Krotov. 2022, 3 Jun.

// 278. First Bad Version
//
// Tags:
// Interactive
// Binary Search
//
// Problem:
//You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
//
//Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
//
//You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
//
//
//
//Example 1:
//
//Input: n = 5, bad = 4
//Output: 4
//Explanation:
//call isBadVersion(3) -> false
//call isBadVersion(5) -> true
//call isBadVersion(4) -> true
//Then 4 is the first bad version.
//Example 2:
//
//Input: n = 1, bad = 1
//Output: 1
//
//
//Constraints:
//
//1 <= bad <= n <= 231 - 1

class Solution {
    var bad = -1
    
    func firstBadVersion(_ n: Int) -> Int {
        findBadVersion(good: 0, bad: n)
    }
    
    private func findBadVersion(good: Int, bad: Int) -> Int {
        guard bad - good != 1 else { return bad }
        
        let mid = (good + bad) / 2
        
        return isBadVersion(mid) ? findBadVersion(good: good, bad: mid) : findBadVersion(good: mid, bad: bad)
    }
}

extension Solution {
    func isBadVersion(_ version: Int) -> Bool { version >= bad }
}

let solution = Solution()

solution.bad = 4
print("n = 5, bad = 4, result = ", solution.firstBadVersion(5))
solution.bad = 1
print("n = 1, bad = 1, result = ", solution.firstBadVersion(1))
