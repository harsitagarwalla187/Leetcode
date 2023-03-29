# Longest Subsequence With Limited Sum
[Question](https://leetcode.com/problems/reducing-dishes/description/)

# Brute Force Solution:

```cpp
class Solution {
public:
    int maxSatisfaction(vector<int>& satisfaction) {
        
        sort(satisfaction.begin(), satisfaction.end());

        int n = satisfaction.size();
        int ans = 0;

        for(int i=0; i<n; i++) {
            int sum = 0;
            for(int j=i; j<n; j++) {
                sum += satisfaction[j]*(j-i+1);
            }
            ans = max(ans, sum);
        }
        return ans;
    }
};
```

# Optimised Solution:

```cpp
class Solution {
public:
    int maxSatisfaction(vector<int>& satisfaction) {
        
        sort(satisfaction.begin(), satisfaction.end());
 
        int n = satisfaction.size();
        int ans = 0, sum = 0, lkCo = 0;

        for(auto& i:satisfaction) {
            sum += i;
            lkCo += i * ((&i - &satisfaction[0]) + 1);
        }

        for(int i=0; i<n; i++) {
            ans = max(ans, lkCo);
            lkCo -= sum;
            sum -= satisfaction[i];
        }

        return ans;
    }
};
```