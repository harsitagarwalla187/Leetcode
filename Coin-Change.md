# Coin Change
[Ques-Link](https://leetcode.com/problems/coin-change/description/)

# My Solution:

```cpp
class Solution {
    
public:
    int coinChange(vector<int>& coins, int amount) {
        
        vector<int> dp(amount+1, 0);

        for(int i=1; i<=amount; i++) {
            int mnm = INT_MAX;
            for(int j=0; j<coins.size(); j++) {
                int temp = i-coins[j]; 
                if(temp >= 0 && dp[temp] != -1) {
                    mnm = min(dp[temp]+1, mnm);
                }
            }                   
            if(mnm != INT_MAX) dp[i] = mnm;
            else dp[i] = -1;
        }

        if(dp[amount] != -1)
            return dp[amount];
        else 
            return -1;
    }
};
```

# Complexity

- Time complexity: *O(amount * coins.length)*

- Space complexity: *O(amount)*
