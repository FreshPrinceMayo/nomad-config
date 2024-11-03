param (
    [string]$AdvertiseAddr,        # Value for advertise_addr
    [string]$RetryJoin,            # Value for retry_join
    [string]$TokenDefault          # Value for token.default
)

# Path to the Consul configuration file
$ConsulConfigFilePath = "C:\\ProgramData\\consul\\config\\consul.hcl"

# Read and update the Consul configuration file
try {
    $consulConfigContent = Get-Content -Path $ConsulConfigFilePath -Raw
    $consulConfigContent = $consulConfigContent -replace "<ADVERTISE_ADDR>", $AdvertiseAddr
    $consulConfigContent = $consulConfigContent -replace "<RETRY_JOIN>", $RetryJoin
    $consulConfigContent = $consulConfigContent -replace "<TOKEN_DEFAULT>", $TokenDefault
    Set-Content -Path $ConsulConfigFilePath -Value $consulConfigContent
    Write-Output "Consul configuration file updated successfully."
} catch {
    Write-Error "Failed to update Consul configuration file: $_"
}

# Path to the Nomad client configuration file
$NomadConfigFilePath = "C:\\ProgramData\\nomad\\conf\\client.hcl"

# Read and update the Nomad client configuration file
try {
    $nomadConfigContent = Get-Content -Path $NomadConfigFilePath -Raw
    $nomadConfigContent = $nomadConfigContent -replace "<TOKEN_DEFAULT>", $TokenDefault
    Set-Content -Path $NomadConfigFilePath -Value $nomadConfigContent
    Write-Output "Nomad client configuration file updated successfully with the new token."
} catch {
    Write-Error "Failed to update Nomad client configuration file: $_"
}

# Start the Consul service
try {
    Write-Output "Starting the Consul service..."
    Start-Service -Name "consul"
    Write-Output "Consul service started successfully."
} catch {
    Write-Error "Failed to start the Consul service: $_"
}

# Start the Nomad service
try {
    Write-Output "Starting the Nomad service..."
    Start-Service -Name "nomad"
    Write-Output "Nomad service started successfully."
} catch {
    Write-Error "Failed to start the Nomad service: $_"
}
