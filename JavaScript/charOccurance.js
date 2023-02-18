// Find number of occurrences of a character in a string

function countOccurrences(str, char) {
    let count = 0;
  
    for (let i = 0; i < str.length; i++) {
      if (str[i] === char) {
        count++;
      }
    }
    return count;
}

console.log(countOccurrences('hello world', 'o')); // 2
console.log(countOccurrences('mississippi', 's')); // 4

  