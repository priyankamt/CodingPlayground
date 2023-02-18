function reverseString(str) {
    //start with empty string
    let newStr = "";
    for (let i = str.length - 1; i >= 0; i--) {
        newStr += str[i];
    }
    return newStr;
}

console.log(reverseString("hello"))

//Solution 2 by using in built function

function reverseStringInBuilt(str) {
    //return array of strings
    arrstrings = str.split("");
    // reverse elements
    reverseString = arrstrings.reverse();
    //join reversed array back to string
    joinstring = reverseString.join("");
    //return string
    return joinstring;
}

reverseStringInBuilt("hello")
reverseString("hello")