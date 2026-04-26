# Book Genesis installer for Windows PowerShell.
# Installs full skill folders, including supporting references, to ~/.claude/.

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
Write-Host "Book Genesis" -ForegroundColor Blue
Write-Host "V4/V5 legacy system + portable Codex edition" -ForegroundColor Yellow
Write-Host ""
Write-Host "Installing skills, supporting references, agents, and knowledge base" -ForegroundColor Yellow
Write-Host ""

if (-not (Test-Path $SkillsDir)) {
    Write-Host "Error: skills\ directory not found. Run this script from the repository root." -ForegroundColor Red
    exit 1
}

foreach ($dir in @($TargetSkills, $TargetKnowledge, $TargetAgents)) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

$count = 0
Get-ChildItem -Path $SkillsDir -Directory | ForEach-Object {
    $skillName = $_.Name
    $skillFile = Join-Path $_.FullName "SKILL.md"
    if (Test-Path $skillFile) {
        $destDir = Join-Path $TargetSkills $skillName
        if (Test-Path $destDir) {
            Remove-Item -LiteralPath $destDir -Recurse -Force
        }
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
        Copy-Item -Path (Join-Path $_.FullName "*") -Destination $destDir -Recurse -Force
        Write-Host "  + $skillName" -ForegroundColor Green
        $count++
    }
}

$kbCount = 0
if (Test-Path $KnowledgeDir) {
    Get-ChildItem -Path $KnowledgeDir -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName (Join-Path $TargetKnowledge $_.Name) -Force
        Write-Host "  + knowledge/$($_.Name)" -ForegroundColor Green
        $kbCount++
    }
}

$agentCount = 0
if (Test-Path $AgentsDir) {
    Get-ChildItem -Path $AgentsDir -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName (Join-Path $TargetAgents $_.Name) -Force
        Write-Host "  + agent/$($_.Name)" -ForegroundColor Green
        $agentCount++
    }
}

Write-Host ""
Write-Host "Done. $count skills + $agentCount agents + $kbCount knowledge files installed" -ForegroundColor Green
Write-Host ""
Write-Host "Skills:    $TargetSkills" -ForegroundColor Blue
Write-Host "Agents:    $TargetAgents" -ForegroundColor Blue
Write-Host "Knowledge: $TargetKnowledge" -ForegroundColor Blue
Write-Host ""
Write-Host "Open Claude Code and type /book-genesis or /book-genesis-codex to start writing."
Write-Host ""
