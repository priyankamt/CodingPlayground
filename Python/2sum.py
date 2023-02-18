# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target
def twoSum(nums, target):
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[j] == target - nums[i]:
                    return [i, j]

print(twoSum([2, 7, 11, 15],9))