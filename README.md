# packer-vagrant-ubuntu-dev-box
Creates a base developer ubuntu box with Packer that can be extended upon using vagrant. Installs a gui, some nice IDE's, and a fair bit of programming languages.

## Computer Setup

1. Install VirtualBox
2. Install Vagrant
3. Install Packer

## Building Locally
Add the environment variables to your shell

Using PowerShell (Windows):
```
$content = Get-Content ".\.env" -ErrorAction Stop
Write-Verbose "Parsed .env file"

foreach ($line in $content) {
    if ($line.StartsWith("#")) { continue };
    if ($line.Trim()) {
        $line = $line.Replace("`"","")
        $kvp = $line -split "=",2
        [Environment]::SetEnvironmentVariable($kvp[0].Trim(), $kvp[1].Trim(), "Process") | Out-Null
    }
}
```

Using Bash (Linux/MacOS):
```
for v in `cat .env` ; do export ${v%%=*}=${v##*=} ; done
```

Then build it:
```
packer build ubuntu.json
```

## Building With CI/CD
I am using a GitHub Action to build this, and am uploading the built box to a private S3 bucket. It is fairly easy to setup:

1. Create an AWS account
2. Deploy the CloudFormation template
3. Grab the AccessKey and SecretKey from the CloudFormation
4. Store them as secrets with your GitHub Repository, using `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
5. Commit to master and the build will run!

Make sure you change the AWS region in the workflow if you are not using us-east-1 (N. Virginia).
