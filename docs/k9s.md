# Install k9s for k8s CLI manage tool

- [guide](https://k9scli.io/topics/install/)

## install

for Ubuntu

```bash
 sudo wget https://github.com/derailed/k9s/releases/download/v0.32.7/k9s_linux_amd64.deb && sudo apt install ./k9s_linux_amd64.deb && sudo rm k9s_linux_amd64.deb
```

### problem found: k9s couldn't show any pods which `k get pods -A` does returns

#### **🔹 Option 2: Change File Permissions (Recommended)**
If you want to **use the existing `/etc/rancher/k3s/k3s.yaml` file** without copying it, you need to change its permissions so your user can read it.

##### **Step 1: Check Current Permissions**
Run the following command to check who owns the file and its current permissions:
```bash
ls -l /etc/rancher/k3s/k3s.yaml
```
Example output:
```
-rw------- 1 root root 1934 Feb  2 10:30 /etc/rancher/k3s/k3s.yaml
```
- `-rw-------`: **Only root** can read and write.
- `root root`: The **owner and group** of the file is `root`.

Currently, non-root users **cannot read the file**. We need to fix this.

---

##### **Step 2: Make the File Readable**
Run this command to change permissions:
```bash
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
```
🔹 **What This Does:**
- `644` means **owner can read and write (`rw-`), others can only read (`r--`)**.
- The file will now be **readable by all users**.

Check permissions again:
```bash
ls -l /etc/rancher/k3s/k3s.yaml
```
Expected output:
```
-rw-r--r-- 1 root root 1934 Feb  2 10:30 /etc/rancher/k3s/k3s.yaml
```
Now, your user **can read the kubeconfig** without `sudo`.

---

##### **Step 3: Set the `KUBECONFIG` Variable**
Now, tell your system to use this kubeconfig file:
```bash
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```
To make it permanent (so it works every time you open a terminal), add it to your shell configuration:
```bash
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
source ~/.bashrc
```
For **Zsh users** (`~/.zshrc` instead of `~/.bashrc`):
```bash
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.zshrc
source ~/.zshrc
```

---

##### **Step 4: Restart K9s**
Now, you should be able to run K9s without permission errors:
```bash
k9s
```

---

#### **🚀 Summary**
1. *Check the current permissions** (`ls -l /etc/rancher/k3s/k3s.yaml`).  
2. *Change permissions** so all users can read the file (`sudo chmod 644 /etc/rancher/k3s/k3s.yaml`).  
3. *Set `KUBECONFIG`** to use this file (`export KUBECONFIG=/etc/rancher/k3s/k3s.yaml`).  
4. *Restart K9s** and check if it works (`k9s`).  

