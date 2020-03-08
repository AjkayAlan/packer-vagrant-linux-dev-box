# Credits to https://gist.github.com/grenzi/82e6cb8215cc47879fdf3a8a4768ec09
# for reading .env into env vars

# Read the local env file
$content = Get-Content ".\.env" -ErrorAction Stop
Write-Verbose "Parsed .env file"

# Load the content to environment
foreach ($line in $content) {
    if ($line.StartsWith("#")) { continue };
    if ($line.Trim()) {
        $line = $line.Replace("`"","")
        $kvp = $line -split "=",2
        [Environment]::SetEnvironmentVariable($kvp[0].Trim(), $kvp[1].Trim(), "Process") | Out-Null
    }
}

vagrant box add .\output-vagrant\$($env:OUTPUT_BOX_NAME).zip --force --name $env:OUTPUT_BOX_NAME
