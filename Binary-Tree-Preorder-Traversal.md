# Binary Tree Preorder Traversal
[Question](https://leetcode.com/problems/binary-tree-preorder-traversal/description)

# Recursive:
```cpp
class Solution {
    vector<int> v;
    void preorder(TreeNode* root) {

        if(root == NULL) {
            return;
        }

        v.push_back(root->val);

        preorder(root->left);
        preorder(root->right);
    }
public:
    vector<int> preorderTraversal(TreeNode* root) {
        preorder(root);
        return v;
    }
};
```
Time Complexity:  O(V)
Space Complexity: O(V)

# Iterative:
```cpp
class Solution {
public:
    vector<int> preorderTraversal(TreeNode* root) {
       
        if(!root) return {};

        vector<int> ans;
        stack<TreeNode*> q;
        q.push(root);

        while(!q.empty()) {
            TreeNode* curr = q.top();
            q.pop();
            ans.push_back(curr->val);
            if(curr->right) q.push(curr->right);
            if(curr->left) q.push(curr->left);
        }
        return ans;
    }
};
```
Time Complexity:  O(V)
Space Complexity: O(V)

# Morris Traversal:
```cpp
class Solution {
public:
    vector<int> preorderTraversal(TreeNode* root) {
       
        if(!root) return {};

        vector<int> ans;

        while (root) {
            if (root->left == NULL) {
                ans.push_back(root->val);
                root = root->right;
            } else {
                TreeNode* current = root->left;
                while (current->right && current->right != root)
                    current = current->right;
                if (current->right == root) {
                    current->right = NULL;
                    root = root->right;
                } else {
                    ans.push_back(root->val);
                    current->right = root;
                    root = root->left;
                }
            }
        }
        return ans;
    }
};
```

Time Complexity:  O(V)
Space Complexity: O(1)