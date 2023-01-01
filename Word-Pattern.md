# Word Pattern
[Question](https://leetcode.com/problems/word-pattern/description/)

# Solution:
```cpp
class Solution {
public:
    bool wordPattern(string pattern, string s) {
        
        // 
        unordered_map<char, string> mp;
        // To mark whether the word is spotted before or not
        unordered_map<string, bool> spotted;
        // Stores all the words
        stringstream words(s);
        string word="";
        // Current index of Pattern
        int in=0;

        // Iterating every word
        while(words >> word) {
            //If the word was seen before then
            if(spotted[word]) {
                //If the word doesn't matches the pattern
                if(mp[pattern[in]] != word) {
                    return false;
                }
            } else {
                // If word was not seen before and the ith pattern
                // was seen before then return false
                if(mp.count(pattern[in])) return false;
                // Neither the Word was not seen before 
                // nor the ith pattern 
                // so insert the word
                mp[pattern[in]] = word;
                spotted[word]   = true;
            }
            in++;
        }
        
        // Check length of pattern and no. of words are equal or not
        if(in == pattern.size()) return true;
        else return false;
    }
};
```