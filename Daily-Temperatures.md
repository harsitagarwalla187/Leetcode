# Daily Temperatures
[Question(https://leetcode.com/problems/daily-temperatures/description/)

My Solution:
```cpp
class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& v) {

        vector<int> ans(v.size(), 0);
        for(int i=v.size()-2;i>=0;i--) {
            int j = i+1;
            while(j<v.size() && v[j] <= v[i])
                j += ans[j]? ans[j]:v.size();
            if(j<v.size()) ans[i] = j-i;
        }
        return ans;
    }
};
```
