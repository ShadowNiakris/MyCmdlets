
function New-RandomPassword{
	<#
	.SYNOPSIS
	generate random password
	.DESCRIPTION
	Default password length is 14
	.PARAMETER Length
	Desired length of the password
	.EXAMPLE
	.\New-RandomPassword.ps1 -Length 12
	#>

	param
	(
		[byte]$Length=14
	)
	Add-Type -AssemblyName System.Web
	[System.Web.Security.Membership]::GeneratePassword($Length,2)
}

function Convert-ToBase64{
	<#
	.SYNOPSIS
	convert text to base64 encoding
	.DESCRIPTION
	only first string in parameters
	.PARAMETER text
	text to encode
	.EXAMPLE
	.\COnvert-tobase64 -text password
	#>
    param
    (
        [string]$text=""
    )
    
    [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($text))
}

function Convert-FromBase64toUTF8{
    param(
        [string]$text=""
    )

    [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($text))
}

New-Alias -Name tobase64 -Value Convert-toBase64
New-Alias -Name frombase64 -Value Convert-fromBase64toUTF8
New-Alias -Name nrp -Value New-RandomPassword
