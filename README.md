# n8n - Free Setup

This repository is designed to run n8n for free on GitHub Codespaces or other free hosting services.

## ⚡ Quick Start - Run Locally with Docker

**The fastest way to run n8n on your local machine:**

```bash
git clone https://github.com/ali-m07/n8n.git
cd n8n
docker-compose up -d
```

That's it! 🎉 n8n will be running on **http://localhost:13000**

**Default credentials:**
- Username: `admin`
- Password: `changeme`

**Useful commands:**
```bash
# View logs
docker-compose logs -f n8n

# Stop n8n
docker-compose stop

# Start n8n
docker-compose start

# Restart n8n
docker-compose restart

# Stop and remove containers
docker-compose down
```

**Note:** n8n will automatically start when Docker Desktop starts (thanks to `restart: unless-stopped` policy).

---

## 🎯 Which Platform Should You Choose?

### ⭐ BEST OPTION: **n8n Cloud Free Tier** (100% Free - No Hosting Needed!)
- **Completely free** - No credit card, no hosting setup
- **1000 executions/month** - Usually enough for LinkedIn posting
- **Always running** - Perfect for scheduled posts
- **All integrations** - LinkedIn included
- **Easiest setup** - Just sign up and use!

### Alternative: **Oracle Cloud Free Tier** (100% Free Forever)
- **Always free VPS** - No expiration
- **Always running** - Perfect for scheduled tasks
- **Full control** - Your own server
- **Best for**: Users who want self-hosted solution

### For Development & Testing → **GitHub Codespaces**
- **60 free hours/month** - Good for testing
- **Stops when inactive** - Not suitable for scheduled tasks
- **Best for**: Development, testing workflows

## 🚀 Method 1: n8n Cloud Free Tier ⭐ (Easiest - Recommended)

**This is the easiest and truly free option!** No hosting setup needed.

### n8n Cloud Setup Steps:
1. Go to [n8n.io](https://n8n.io) and sign up (completely free)
2. No credit card required
3. Start creating workflows immediately
4. Connect LinkedIn and schedule your posts
5. Done! ✅

**n8n Cloud Free Tier Includes:**
- ✅ 1000 workflow executions per month
- ✅ Unlimited workflows
- ✅ All integrations (LinkedIn, etc.)
- ✅ Scheduled workflows
- ✅ Webhooks
- ✅ Always running
- ✅ No hosting needed

**Perfect for LinkedIn posting!** 1000 executions/month is usually enough for daily/weekly posts.

## 🚀 Method 2: Oracle Cloud Free Tier (100% Free Forever)

Oracle Cloud offers a free VPS that never expires - perfect for hosting n8n!

### Oracle Cloud Setup Steps:
1. Go to [cloud.oracle.com](https://cloud.oracle.com) and sign up (no credit card needed)
2. Create a free VM:
   - Choose "Always Free" tier
   - Select Ubuntu 22.04
   - Use ARM-based Ampere A1 (4 VMs, 24GB RAM total) - **FREE**
3. SSH into your VM and install Docker:
   ```bash
   sudo apt update
   sudo apt install docker.io -y
   sudo systemctl start docker
   sudo usermod -aG docker $USER
   ```
4. Run n8n:
   ```bash
   sudo docker run -d \
     --name n8n \
     -p 5678:5678 \
     -v ~/.n8n:/home/node/.n8n \
     -e N8N_BASIC_AUTH_ACTIVE=true \
     -e N8N_BASIC_AUTH_USER=admin \
     -e N8N_BASIC_AUTH_PASSWORD=your-password \
     --restart unless-stopped \
     docker.n8n.io/n8nio/n8n:latest
   ```
5. Access n8n at `http://your-vm-public-ip:5678`

**Oracle Cloud Benefits:**
- ✅ Always free (never expires)
- ✅ Always running
- ✅ Full control
- ✅ No credit card required
- ✅ Perfect for scheduled LinkedIn posts

## 🐳 Method 4: GitHub Codespaces (For Development/Testing)

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

## 🚀 Method 3: Run Locally + Cloudflare Tunnel (Free)

If you can keep your computer running, use Cloudflare Tunnel for free public access.

### Local Setup Steps:
1. Install n8n on your computer:
   ```bash
   npm install -g n8n
   n8n start
   ```
2. Install Cloudflare Tunnel:
   - Download from [cloudflare.com/products/tunnel](https://cloudflare.com/products/tunnel)
   - Or use: `cloudflared tunnel --url http://localhost:5678`
3. Get free public URL from Cloudflare
4. Access n8n from anywhere!

**Benefits:**
- ✅ Completely free
- ✅ No hosting needed
- ⚠️ Requires your computer to be on

## 📝 Other Options (May Require Payment)

### Render / Fly.io / Railway
⚠️ **Note:** These services may require payment or have limited free tiers. For truly free options, use **n8n Cloud** or **Oracle Cloud**.

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
  - **n8n Cloud**: ⭐ Best option (1000 executions/month, always running, free)
  - **Oracle Cloud**: Great for self-hosted (always free, always running)
  - **Local + Tunnel**: Good if computer stays on
  - **Codespaces**: Not recommended (stops when inactive)
- **Limitations**: 
  - **n8n Cloud**: 1000 executions/month (usually enough)
  - **Oracle Cloud**: Free tier limits (usually sufficient)
  - **Local**: Requires computer to be on
  - **Codespaces**: 60 hours/month, stops when inactive

## 🔗 Useful Links

- [n8n Documentation](https://docs.n8n.io)
- [GitHub Codespaces](https://github.com/features/codespaces)
- [n8n Community](https://community.n8n.io)

## 📄 License

This repository uses the n8n license. For more details, see [LICENSE.md](LICENSE.md).
