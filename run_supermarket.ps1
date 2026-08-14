Write-Host ""
Write-Host "========================================"
Write-Host " Prism AI Supermarket"
Write-Host " Runtime Launcher"
Write-Host "========================================"
Write-Host ""

Write-Host "[1] Checking repository structure..."

$folders = @(
    "kernel",
    "packages",
    "adapters",
    "templates",
    "ops",
    "commerce"
)

foreach ($folder in $folders) {
    if (Test-Path ".\$folder") {
        Write-Host "  [OK] $folder"
    }
    else {
        Write-Host "  [MISSING] $folder"
    }
}

Write-Host ""
Write-Host "[2] Checking commerce layer..."

$commerceFiles = @(
    "commerce\membership.md",
    "commerce\product-model.md",
    "commerce\pricing-model.md",
    "commerce\licensing.md",
    "commerce\entitlement-model.md"
)

foreach ($file in $commerceFiles) {
    if (Test-Path ".\$file") {
        Write-Host "  [OK] $file"
    }
    else {
        Write-Host "  [MISSING] $file"
    }
}

Write-Host ""
Write-Host "========================================"
Write-Host " Prism AI Supermarket is ready."
Write-Host "========================================"
Write-Host ""
