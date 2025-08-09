---
layout: post
title: "Programming Algorithms Part 1"
date: '2025-07-25 11:31:17 +05:30'
tags: dsa algorithm
---


## Kandane's Algorithm

Kadane's Algorithm is a popular and efficient method to find the maximum sum of a contiguous subarray in an array of integers. It works in O(n) time complexity, making it optimal for this problem.

### Pseudo Code

```plaintext
function kadane(arr):
    max_so_far = -infinity
    max_ending_here = 0
    for i in range(len(arr)):
        max_ending_here = max_ending_here + arr[i]
        if max_ending_here < 0:
            max_ending_here = 0
        if max_so_far < max_ending_here:
            max_so_far = max_ending_here
    return max_so_far
```

### Implementation

```python
def max_subarray_sum(nums):
    max_sum = float('-inf')
    current_sum = 0
    
    for num in nums:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)

    return max_sum

# Example Usage
nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print(max_subarray_sum(nums))  # Output: 6
```

## Dijkstra's Algorithm
