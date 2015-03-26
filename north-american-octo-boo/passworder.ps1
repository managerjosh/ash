ipmo Active*
$excludeUsers = "Administrator", "Guest", "binddn","krbtgt"

#password generation
function generatePassword($length){
    $Assembly = Add-Type -AssemblyName System.Web
    $password = [System.Web.Security.Membership]::GeneratePassword($length,2)
    # Remove quotes
    $password = $password -replace '"','_'
    $password = $password -replace "'","_"
    # Return it!
    return $password
}
$resultsCSV = @()

get-aduser -Filter * | foreach {
    $userDN = $_.DistinguishedName
    $userName = $_.SAMAccountName
    $password = generatePassword(20)
    $outputObject = New-Object System.Object
    if($excludeUsers -notcontains $userName){
    	# We disable any account that we don't want changed. Accounts that aren't active can't hurt us!
    	if($_.Enabled -eq 'True'){
	        echo '"$userNAme"','"$password"'

            $outputObject | Add-Member -type NoteProperty -name 'Username' -value $userName
            $outputObject | Add-Member -type NoteProperty -name 'Password' -value $password
            $resultsCSV += $outputObject
            # Change account password (and check)
	        $secure_password = ConvertTo-SecureString -AsPlainText "$password" -Force
	        Set-ADAccountPassword -Identity $userName -Reset -NewPassword $secure_password    
            if($? -eq $true){
                $outputObject | Add-Member -type NoteProperty -name 'Updated' -value 'True'
            } else {
                $outputObject | Add-Member -type NoteProperty -name 'Password' -value 'False'
            }
	        Set-ADUser -Identity $userName -Enabled $true
            Write-Output $outputObject
	    }
    }
}
$resultsCSV | Export-Csv -NoTypeInformation .\Users.csv
