# Delete Columns to Make Sorted
[Question](https://leetcode.com/problems/delete-columns-to-make-sorted/description)

# Solution:
```cpp
class Solution {
public:
    int minDeletionSize(vector<string>& strs) {
        int count= 0;
        for(int j=0; j<strs[0].size(); j++) {
            char ch = strs[0][j];
            for(int i=1; i<strs.size(); i++) {
                if(ch <= strs[i][j]) ch = strs[i][j];
                else {
                    count++;
                    break;
                }
            }
        }
        return count;
    }
};
```