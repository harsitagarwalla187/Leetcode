# Longest Subsequence With Limited Sum
[Question](https://leetcode.com/problems/longest-subsequence-with-limited-sum/description/)

# Solution:

```cpp
class Solution {
public:
    vector<int> answerQueries(vector<int>& nums, vector<int>& queries) {
        
        sort(nums.begin(), nums.end());

        for(int i=1;i<nums.size();i++) nums[i] += nums[i-1];

        for(auto& i:queries) 
          i = upper_bound(nums.begin(),nums.end(),i)-nums.begin();

        return queries;
    }
};
```