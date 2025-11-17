# n8n - Free Setup

This repository is designed to run n8n for free on GitHub Codespaces or other free hosting services.

## 🎯 Which Platform Should You Choose?

### For Scheduled Tasks & Webhooks (LinkedIn, Social Media, etc.) → **Railway** ✅
- **Always running** - Perfect for scheduled posts and webhooks
- **Persistent storage** - Your workflows stay active
- **Free tier available** - $5 credit monthly
- **Best for**: LinkedIn posting, scheduled workflows, webhooks

### For Development & Testing → **GitHub Codespaces**
- **60 free hours/month** - Good for testing
- **Stops when inactive** - Not suitable for scheduled tasks
- **Best for**: Development, testing workflows

## 🚀 Method 1: Railway (Recommended for LinkedIn/Scheduled Tasks)

Railway is the best choice for LinkedIn posting because it stays running 24/7, ensuring your scheduled posts work reliably.

### Railway Setup Steps:
1. Go to [Railway.app](https://railway.app) and sign up
2. Select "New Project"
3. Choose "Deploy from GitHub repo"
4. Select this repository
5. Railway will automatically detect `docker-compose.yml`
6. Your n8n instance will be available at a Railway-provided URL
7. Set up your LinkedIn workflow in n8n!

**Railway Benefits:**
- ✅ Always running (perfect for scheduled LinkedIn posts)
- ✅ Persistent data storage
- ✅ Free $5 credit monthly
- ✅ Automatic HTTPS
- ✅ Webhook support

## 🐳 Method 2: GitHub Codespaces (For Development/Testing)

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

## 🐳 Method 3: Other Free Services

### Render (Free with limitations):
1. Go to [Render.com](https://render.com) and sign up
2. Select "New +" and then "Web Service"
3. Connect your GitHub repository
4. Settings:
   - **Build Command**: `echo "No build needed"`
   - **Start Command**: `docker-compose up`
   - **Docker Compose File**: `docker-compose.yml`

### Fly.io (Free):
1. Go to [Fly.io](https://fly.io) and sign up
2. Install CLI: `curl -L https://fly.io/install.sh | sh`
3. Login: `fly auth login`
4. Launch: `fly launch` (uses `docker-compose.yml`)

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
- **LinkedIn Integration**: Use Railway for reliable scheduled posting (stays running 24/7)
- **Limitations**: 
  - Railway: Free tier has $5 credit/month
  - Codespaces: Stops when inactive (not good for scheduled tasks)

## 🔗 Useful Links

- [n8n Documentation](https://docs.n8n.io)
- [GitHub Codespaces](https://github.com/features/codespaces)
- [n8n Community](https://community.n8n.io)

## 📄 License

This repository uses the n8n license. For more details, see [LICENSE.md](LICENSE.md).
