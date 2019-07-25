Function Compare-DirectoryContents { 
  # Recursively compares the file contents of two directories and returns differences
  # Returns a hash: 
  #   - Keys are relative path filenames
  #   - Values are integer values:
  #     1 : File exists only in $dir1
  #     2 : File exists only in $dir2
  #     3 : File exists in both dirs, but contents are different

  param ([string]$dir1,[string]$dir2)

  $sha1crypt = New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider
  $dir1 = $dir1.ToLower()
  $dir2 = $dir2.ToLower()
  $files1 = Get-ChildItem -Path $dir1 -File -Recurse | ForEach-Object {$_.FullName.ToLower().Replace($dir1,$null)}
  $files2 = Get-ChildItem -Path $dir2 -File -Recurse | ForEach-Object {$_.FullName.ToLower().Replace($dir2,$null)}

  # Compare file lists
  $compare_out = Compare-Object -ReferenceObject $files1 -DifferenceObject $files2
  # Store differences as a hash for easier lookup
  $filesdiff = @{}
  foreach ($object in $compare_out) {
    If ($object.SideIndicator -eq "<=") {$fileloc = 1} Else {$fileloc = 2}
    $filesdiff.Add($object.InputObject,$fileloc)
  }

  # For common files, compare contents
  foreach ($file in $files1) {
    # Check that it exists in both dirs
    If (-Not $filesdiff.ContainsKey($file)) {
      $fullname1 = $($dir1 + $file)
      $fullname2 = $($dir2 + $file)
      $hash1 = $sha1crypt.ComputeHash([System.IO.File]::ReadAllBytes($fullname1))
      $hash2 = $sha1crypt.ComputeHash([System.IO.File]::ReadAllBytes($fullname2))
      If (Compare-Object -ReferenceObject $hash1 -DifferenceObject $hash2) {
        # Hashes are different
        $filesdiff.Add($file,3)
      }
    }
  }
  return $filesdiff
}

# Compare-DirectoryContents <directory1> <directory2>

Exit 0