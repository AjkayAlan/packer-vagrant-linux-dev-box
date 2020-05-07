# packer-vagrant-ubuntu-dev-box

Creates a base developer ubuntu box with Packer that can be extended upon using vagrant. Installs a gui, some nice IDE's, and a fair bit of programming languages.

## Computer Setup

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
1. Install [Packer](https://www.packer.io/downloads/)

## Building Locally

Add the environment variables to your shell

Using PowerShell (Windows):
```PowerShell
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
```sh
for v in `cat .env` ; do export ${v%%=*}=${v##*=} ; done
```

Then build it:
```sh
packer build ubuntu.json
```

## Building With CI/CD

I am using a [GitHub Action](https://help.github.com/en/actions) to build this, and am uploading the built box to a private S3 bucket. It is fairly easy to setup:

1. Create an [AWS account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
1. Deploy the [CloudFormation](https://aws.amazon.com/cloudformation/) [template](cloudformation/s3-with-iam-user.yaml) to your AWS account
1. Grab the AccessKey and SecretKey from the [CloudFormation Output](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/outputs-section-structure.html)
1. Store the access key and secret key as [secrets on your GitHub Repository](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets), using `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
1. Update the `Upload Box To S3 Bucket` step in the [workflow](.github/workflows/build-boxes.yaml) to use the bucket you created
1. Commit to master and the build will run!

Make sure you change the AWS region in the workflow if you are not using us-east-1 (N. Virginia).
