param (
    [string]$AdvertiseAddr,        # Value for advertise_addr
    [string]$RetryJoin,            # Value for retry_join
    [string]$TokenDefault          # Value for tokens.default
)

# Hardcoded path to the Consul configuration file
$ConfigFilePath = "C:\\ProgramData\\consul\\config\\consul.hcl"

# Read the content of the configuration file
$configContent = Get-Content -Path $ConfigFilePath -Raw

# Replace placeholders with the provided values
$configContent = $configContent -replace "<ADVERTISE_ADDR>", $AdvertiseAddr
$configContent = $configContent -replace "<RETRY_JOIN>", $RetryJoin
$configContent = $configContent -replace "<TOKEN_DEFAULT>", $TokenDefault

# Write the updated content back to the configuration file
Set-Content -Path $ConfigFilePath -Value $configContent

Write-Output "Consul configuration file updated successfully."

# Start the Consul service
Write-Output "Starting the Consul service..."
Start-Service -Name "consul"

Write-Output "Consul service started successfully."
