# n8n - Free Setup

This repository is designed to run n8n for free on GitHub Codespaces or other free hosting services.

## 🎯 Which Platform Should You Choose?

### For Scheduled Tasks & Webhooks (LinkedIn, Social Media, etc.) → **Render** ✅ (100% Free)
- **Free tier** - Completely free forever
- **Auto-wake** - Wakes up when needed (may take 30-60 seconds)
- **Persistent storage** - Your workflows stay saved
- **Best for**: LinkedIn posting, scheduled workflows (with wake-up delay)

### Alternative: **Fly.io** (100% Free)
- **Always free** - No credit card required
- **Always running** - No sleep mode
- **Best for**: LinkedIn posting, scheduled workflows, webhooks

### For Development & Testing → **GitHub Codespaces**
- **60 free hours/month** - Good for testing
- **Stops when inactive** - Not suitable for scheduled tasks
- **Best for**: Development, testing workflows

## 🚀 Method 1: Render (100% Free - Recommended)

Render offers a completely free tier that's perfect for n8n. The service may sleep after inactivity but wakes up automatically when accessed.

### Render Setup Steps:
1. Go to [Render.com](https://render.com) and sign up (no credit card needed)
2. Click "New +" → "Web Service"
3. Connect your GitHub account and select this repository
4. Render will automatically detect `render.yaml`
5. Configure:
   - **Name**: n8n (or any name you like)
   - **Plan**: Free
   - **Environment Variables**: Set `N8N_BASIC_AUTH_PASSWORD` to your desired password
6. Click "Create Web Service"
7. Wait for deployment (2-3 minutes)
8. Your n8n instance will be available at `https://your-app.onrender.com`

**Render Benefits:**
- ✅ 100% free forever
- ✅ No credit card required
- ✅ Auto-wakes when accessed
- ✅ Persistent storage
- ✅ Automatic HTTPS
- ⚠️ May sleep after 15 minutes of inactivity (wakes in 30-60 seconds)

## 🐳 Method 3: GitHub Codespaces (For Development/Testing)

GitHub Codespaces offers 60 free hours per month.

**⚠️ Note:** Codespaces stops when inactive - **NOT recommended for scheduled LinkedIn posts**

### Steps:

1. **Fork this repository** (or create a new repository)
2. Click the **"Code"** button on GitHub
3. Select **"Codespaces"** and then **"Create codespace on main"**
4. Wait for the Codespace to start up
5. After it opens, n8n will automatically run on port 5678
6. Click on port 5678 and select **"Open in Browser"**

### Accessing n8n:
- URL: `http://localhost:5678`
- Codespaces automatically creates a public URL for you

## 🚀 Method 2: Fly.io (100% Free - Always Running)

Fly.io offers a free tier that stays running 24/7 - perfect for scheduled LinkedIn posts!

### Fly.io Setup Steps:
1. Go to [Fly.io](https://fly.io) and sign up
2. Install CLI: 
   ```bash
   curl -L https://fly.io/install.sh | sh
   ```
3. Login:
   ```bash
   fly auth login
   ```
4. Deploy:
   ```bash
   cd ~/n8n-github
   fly launch
   ```
5. Follow the prompts (use defaults)
6. Set password:
   ```bash
   fly secrets set N8N_BASIC_AUTH_PASSWORD=your-password-here
   ```
7. Your n8n will be available at `https://your-app.fly.dev`

**Fly.io Benefits:**
- ✅ 100% free (3 shared VMs)
- ✅ Always running (no sleep)
- ✅ Perfect for scheduled tasks
- ✅ Automatic HTTPS
- ✅ Webhook support

## 🐳 Method 4: Railway (Paid After First Month)

⚠️ **Note:** Railway is no longer free after the first month. Use Render or Fly.io for free hosting.

If you still want to use Railway:
1. Go to [Railway.app](https://railway.app)
2. Select "New Project" → "Deploy from GitHub repo"
3. Select this repository
4. Railway will use `railway.json` and `Dockerfile`

## ⚙️ Configuration

### Change Password:
In the `docker-compose.yml` file, modify the following variables:
- `N8N_BASIC_AUTH_USER`: username
- `N8N_BASIC_AUTH_PASSWORD`: password

### Disable Authentication:
In `docker-compose.yml`, change `N8N_BASIC_AUTH_ACTIVE=true` to `false`.

## 📝 Important Notes

- **Data**: All workflows and settings are stored in the `n8n_data` volume
- **Security**: In public environments, always enable authentication
- **LinkedIn Integration**: 
  - **Fly.io**: Best for scheduled posts (always running, 100% free)
  - **Render**: Good option (free, wakes up automatically, may have 30-60s delay)
  - **Codespaces**: Not recommended (stops when inactive)
- **Limitations**: 
  - **Render**: Sleeps after 15 min inactivity (wakes automatically)
  - **Fly.io**: 3 shared VMs limit (usually enough for n8n)
  - **Codespaces**: 60 hours/month, stops when inactive
  - **Railway**: No longer free after first month

## 🔗 Useful Links

- [n8n Documentation](https://docs.n8n.io)
- [GitHub Codespaces](https://github.com/features/codespaces)
- [n8n Community](https://community.n8n.io)

## 📄 License

This repository uses the n8n license. For more details, see [LICENSE.md](LICENSE.md).
