// Find two strings are anagram or not

function isAnagram(str1, str2) {
    // First, remove any non-alphabetic characters and convert to lowercase
    str1 = str1.replace(/[^a-zA-Z]/g, '').toLowerCase();
    str2 = str2.replace(/[^a-zA-Z]/g, '').toLowerCase();
  
    // If the strings have different lengths, they cannot be anagrams
    if (str1.length !== str2.length) {
      return false;
    }
  
    // Sort the characters in each string and compare them
    var sortedStr1 = str1.split('').sort().join('');
    var sortedStr2 = str2.split('').sort().join('');
  
    return sortedStr1 === sortedStr2;
  }

console.log(isAnagram("anagram", "nagaram")); //true 
console.log(isAnagram('rail safety', 'fairy tales')); // true
console.log(isAnagram('hello', 'world')); //false