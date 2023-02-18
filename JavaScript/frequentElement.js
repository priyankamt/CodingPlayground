// Program to find the most frequent element in an array

let fruits = ['apple', 'banana', 'orange', 'apple', 'orange', 'banana', 'banana'];
let frequency = {};

// Count the frequency of each fruit
for (let i = 0; i < fruits.length; i++) {
  if (fruits[i] in frequency) {
    frequency[fruits[i]]++;
  } else {
    frequency[fruits[i]] = 1;
  }
}

// Find the most frequent fruit
let mostFrequent = null;
for (let fruit in frequency) {
  if (mostFrequent == null || frequency[fruit] > frequency[mostFrequent]) {
    mostFrequent = fruit;
  }
}

console.log("The most frequent fruit is: " + mostFrequent);
