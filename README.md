```
        __          .__
_______/  |_ ___.__.|  |_______
\____ \   __<   |  ||  |\_  __ \
|  |_> >  |  \___  ||  |_|  | \/
|   __/|__|  / ____||____/__|
|__|         \/

https://ptylr.com  
https://www.linkedin.com/in/ptylr/
```

# docker-dev-firstspirit

Local FirstSpirit development environment using Docker and ngrok.

This setup enables you to run a FirstSpirit server locally and expose it securely over HTTPS using your **ngrok custom domain**.

> **Note:** The official FirstSpirit Docker image is secured. You must authenticate with FirstSpirit's Docker registry to use it.

---

## 🔧 Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop)
- [ngrok](https://ngrok.com/) account with a **custom domain**
- Valid `fs-license.conf` file from FirstSpirit
- Docker credentials for `docker.artifactory.e-spirit.hosting`

---

## 📁 Directory Overview

```
.
├── conf/
│   ├── firstspirit/
│   │   ├── fs-license.conf             # Required: Your FirstSpirit license
│   │   └── fs-server.conf              # Required: Edit to match your ngrok domain
│   └── ngrok/
│       └── ngrok.yml                   # Required: Configure with your ngrok token & custom domain
├── .env                                # Required: Docker login credentials (copy from .env.example)
├── docker-compose.yml                  # Docker Services definition
├── start.sh                            # Helper script to login and start containers
└── README.md                           # This file
```

---

## 🚀 Quick Start

1. **Copy and update your environment files:**

```bash
cp .env.example .env
cp conf/firstspirit/fs-server.conf.example conf/firstspirit/fs-server.conf
cp conf/ngrok/ngrok.yml.example conf/ngrok/ngrok.yml
```

2. **Update values:**

- `.env`: Add your Docker credentials for FirstSpirit's registry
- `fs-server.conf`: Replace all references to `your-ngrok-domain.ngrok-free.app` with your **custom ngrok domain**
- `ngrok.yml`: Set your `authtoken` and `domain`

3. **Place your FirstSpirit license file:**

```bash
mv your-fs-license.conf conf/firstspirit/fs-license.conf
```

4. **Start the environment:**

```bash
./start.sh
```

> This logs in and runs `docker compose up -d --build`

---

## 🔁 Usage

- To restart containers:

```bash
docker compose up -d
```

- To shut down and clean up:

```bash
docker compose down -v
```

---

## 🧪 Notes

- This environment is **for local development only**
- You must use a **custom ngrok domain**
- The FirstSpirit image is built for `linux/amd64` — you may need to specify platform on Apple Silicon or ARM machines

---

## Legal Notices

This project includes configuration and tooling to assist with running a **FirstSpirit** server in a local development environment. While this repository is provided under the **[MIT license](./LICENSE)**, the **FirstSpirit Docker image** (`docker.artifactory.e-spirit.hosting/e-spirit/firstspirit`) is:

- **Proprietary software**, owned and licensed by **Crownpeak Technology, inc**.
- **Not included under this repository's license**.
- **Access-controlled** — You must have valid credentials and a commercial license to download and use the image.

You are responsible for ensuring that you have a valid FirstSpirit license agreement and appropriate access credentials to use the Docker image referenced in this setup.

For more information about licensing FirstSpirit, please contact [Crownpeak](https://www.crownpeak.com/contact).

## Disclaimer

This document is provided for information purposes only. Paul Taylor may change the contents hereof without notice. This document is not warranted to be error-free, nor subject to any other warranties or conditions, whether expressed orally or implied in law, including implied warranties and conditions of merchantability or fitness for a particular purpose. Paul Taylor specifically disclaims any liability with respect to this document and no contractual obligations are formed either directly or indirectly by this document. The technologies, functionality, services, and processes described herein are subject to change without notice.