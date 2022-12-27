# Maximum Bags With Full Capacity of Rocks
[Question](https://leetcode.com/problems/maximum-bags-with-full-capacity-of-rocks/description/)

# Solution:

```cpp
class Solution {
public:
    int maximumBags(vector<int>& capacity, vector<int>& rocks, int additionalRocks) {
        
        int count = 0;
        for(int i=0;i<capacity.size();i++) capacity[i] -= rocks[i];

        sort(capacity.begin(), capacity.end());

        for(int i=0;i<capacity.size() && additionalRocks>0;i++) {
            if(capacity[i] == 0) {
                count++;
            } else {
                int temp = additionalRocks - capacity[i];
                if(temp == 0) {
                    count++;
                    break;
                }  else if(temp < 0) {
                    break;
                } else {
                    additionalRocks = temp;
                    count++;
                }
            }
        }
        return count;
    }
};
```