# **Dropbox-uploader**

**System Control Script for uploading to Dropbox the** contents of a specific directory

## **Installation**

**To begin, update the **`.dropbox_uploader`** file by opening it in a text editor and replacing** the placeholder values with your actual Dropbox s**ecrets. For instance:**

```bash
$ nano .dropbox_uploader
```

Once you have updated that file, copy it to the [root](vscode-file://vscode-app/c:/Users/massi/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html) user’s home directory:

```bash
$ cp .dropbox_uploader /root/.dropbox_uploader
```

Next, copy the entire [bin](vscode-file://vscode-app/c:/Users/massi/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html) directory to `/root/bin`. This directory contains the script that automates the file uploads:

```bash
$ cp -r bin/ /root/bin
```

Within the newly copied [dropbox_uploader.sh](vscode-file://vscode-app/c:/Users/massi/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html) file, locate and change the name of the target directory to the one you want to monitor. You can do this by editing the file:

```bash
$ nano /root/bin/dropbox_uploader.sh
```

### Installing the Script as a Service

After editing, copy the [dropbox-uploader.service](vscode-file://vscode-app/c:/Users/massi/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html) file to the [system](vscode-file://vscode-app/c:/Users/massi/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html) directory. This step registers the new service with your system:

```bash
$ cp systemd/dropbox-uploader.service \
      /etc/systemd/system/dropbox-uploader.service
```

Once copied, reload the systemd manager configuration so it recognizes the new service:

```bash
systemctl daemon-reload
```

You are now ready to enable automatic startup of the service and to start it immediately:

```bash
$ systemctl enable dropbox-uploader &&
      systemctl start dropbox-uploader
```

### Enjoy Automated Uploads

At this point, you have successfully installed and started the application. To enjoy automated uploads, simply copy or move files into the target directory you specified in `dropbox_uploader.sh`. 

The service will automatically handle the uploading process to your Dropbox account.

## About The Inventor and Author

This piece of software has been developed by Dr. Massimiliano Pala (Max), who has contributed to Open Source Projects for more than thirty years. Throughout his career he has worked on many projects such as OpenCA and OpenSSL and still finds it fascinating being able to contribute to the world with small, little inventions and tools.

Max always enjoys a collaborative approach to solve problems and optimize existing solutions, join our OpenCA or OpenWebTrust efforts and make them your own!
