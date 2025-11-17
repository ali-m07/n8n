# Quick Start Guide for n8n

## 🎯 Quick Method: GitHub Codespaces

### Step 1: Upload to GitHub
```bash
cd ~/n8n-github
git init
git add .
git commit -m "Initial commit: n8n setup"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/n8n-github.git
git push -u origin main
```
(Replace YOUR_USERNAME with your GitHub username)

### Step 2: Setup in Codespaces
1. Go to your GitHub repository
2. Click the **"Code"** button (green)
3. Select the **"Codespaces"** tab
4. Click **"Create codespace on main"**
5. Wait for the Codespace to start (2-3 minutes)

### Step 3: Access n8n
1. After the Codespace opens, go to the **"Ports"** tab
2. Find port **5678**
3. Click the **"Open in Browser"** icon
4. n8n is ready to use! 🎉

## 🔄 Alternative Method: Railway (Free)

1. Go to [railway.app](https://railway.app) and sign up
2. "New Project" → "Deploy from GitHub repo"
3. Select your repository
4. Railway will automatically set up n8n

## 💡 Important Note
- Codespaces: 60 free hours per month
- Railway: Has free limitations but is always available
- All your data is stored in volumes
