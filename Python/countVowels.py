# Program to count the number of each vowels

def count_vowels(s):
    vowels = 'aeiou'
    count = {}
    for vowel in vowels:
        count[vowel] = 0
    for char in s:
        if char in vowels:
            count[char] += 1
    return count

string = "Hello World"
result = count_vowels(string)
print(result)

