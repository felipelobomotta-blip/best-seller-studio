# Book Genesis V4 — Installer for Windows (PowerShell)
# Installs 19 skills + 1 agent + knowledge base to ~/.claude/

$ErrorActionPreference = "Stop"

$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $RepoDir) { $RepoDir = Get-Location }
$SkillsDir = Join-Path $RepoDir "skills"
$KnowledgeDir = Join-Path $RepoDir "knowledge"
$AgentsDir = Join-Path $RepoDir "agents"
$TargetSkills = Join-Path $env:USERPROFILE ".claude\skills"
$TargetKnowledge = Join-Path $env:USERPROFILE ".claude\knowledge"
$TargetAgents = Join-Path $env:USERPROFILE ".claude\agents"

Write-Host ""
Write-Host "  ____              _      ____                      _     " -ForegroundColor Blue
Write-Host " | __ )  ___   ___ | | __ / ___| ___ _ __   ___  ___(_)___ " -ForegroundColor Blue
Write-Host " |  _ \ / _ \ / _ \| |/ /| |  _ / _ \ '_ \ / _ \/ __| / __|" -ForegroundColor Blue
Write-Host " | |_) | (_) | (_) |   < | |_| |  __/ | | |  __/\__ \ \__ \" -ForegroundColor Blue
Write-Host " |____/ \___/ \___/|_|\_\ \____|\___| |_| |_|\___||___/_|___/" -ForegroundColor Blue
Write-Host "                          V4 - Genesis Score V3.7" -ForegroundColor Yellow
Write-Host ""
Write-Host "Installing 19 skills + 1 agent + knowledge base" -ForegroundColor Yellow
Write-Host ""

# Check that skills directory exists
if (-not (Test-Path $SkillsDir)) {
    Write-Host "Error: skills\ directory not found. Run this script from the book-genesis repository root." -ForegroundColor Red
    exit 1
}

# Create target directories
foreach ($dir in @($TargetSkills, $TargetKnowledge, $TargetAgents)) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# Copy each skill
$count = 0
Get-ChildItem -Path $SkillsDir -Directory | ForEach-Object {
    $skillName = $_.Name
    $skillFile = Join-Path $_.FullName "SKILL.md"
    if (Test-Path $skillFile) {
        $destDir = Join-Path $TargetSkills $skillName
        if (-not (Test-Path $destDir)) {
            New-Item -ItemType Directory -Path $destDir -Force | Out-Null
        }
        Copy-Item $skillFile (Join-Path $destDir "SKILL.md") -Force
        Write-Host "  + $skillName" -ForegroundColor Green
        $count++
    }
}

Write-Host ""

# Copy knowledge base
$kbCount = 0
if (Test-Path $KnowledgeDir) {
    Get-ChildItem -Path $KnowledgeDir -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName (Join-Path $TargetKnowledge $_.Name) -Force
        Write-Host "  + knowledge/$($_.Name)" -ForegroundColor Green
        $kbCount++
    }
}

# Copy agents
$agentCount = 0
if (Test-Path $AgentsDir) {
    Get-ChildItem -Path $AgentsDir -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName (Join-Path $TargetAgents $_.Name) -Force
        Write-Host "  + agent/$($_.Name)" -ForegroundColor Green
        $agentCount++
    }
}

Write-Host ""
Write-Host "Done! $count skills + $agentCount agents + $kbCount knowledge files installed" -ForegroundColor Green
Write-Host ""
Write-Host "Skills:    $TargetSkills" -ForegroundColor Blue
Write-Host "Agents:    $TargetAgents" -ForegroundColor Blue
Write-Host "Knowledge: $TargetKnowledge" -ForegroundColor Blue
Write-Host ""
Write-Host "Open Claude Code and type /book-genesis to start writing."
Write-Host ""
