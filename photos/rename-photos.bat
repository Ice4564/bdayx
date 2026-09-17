@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo Renaming all photos in this folder to 1, 2, 3 ...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$f = Get-ChildItem -File | Where-Object { $_.Extension -match '^\.(jpe?g|jfif|png|webp)$' } | Sort-Object Name; $i = 0; foreach ($x in $f) { $i++; Rename-Item -LiteralPath $x.FullName -NewName ('__tmp_' + $i + $x.Extension.ToLower()) }; $j = 0; Get-ChildItem -File -Filter '__tmp_*' | Sort-Object { [int]($_.BaseName -replace '__tmp_','') } | ForEach-Object { $j++; Rename-Item -LiteralPath $_.FullName -NewName ($j.ToString() + $_.Extension) }; Write-Host ('Done: ' + $j + ' photos')"
pause
