# Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

def containsDuplicate(nums):
    seen = set()
    for num in nums:
        if num in seen:
            return True
        seen.add(num)
    return False

nums = [1, 2, 3, 4, 5]
print(containsDuplicate(nums))  # False

nums = [1, 2, 3, 2, 4, 5]
print(containsDuplicate(nums))  # True

# another solution

def containsDuplicateSol(nums):
    nums.sort()
    for i in range(1,len(nums)):
        if nums[i] == nums[i-1]:
            return True
    return False

print(containsDuplicateSol([1, 2, 3, 2, 4]))