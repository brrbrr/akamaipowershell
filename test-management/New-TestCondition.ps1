function New-TestCondition
{
    Param(
        [Parameter(Mandatory=$true,ParameterSetName='pipeline',ValueFromPipeline=$true)] [object] $Condition,
        [Parameter(Mandatory=$true,ParameterSetName='requestbody')]  [string] $Body,
        [Parameter(Mandatory=$false)] [string] $EdgeRCFile = '~\.edgerc',
        [Parameter(Mandatory=$false)] [string] $Section = 'default',
        [Parameter(Mandatory=$false)] [string] $AccountSwitchKey
    )

    begin{}

    process{
        $Path = "/test-management/v2/functional/test-catalog/conditions?accountSwitchKey=$AccountSwitchKey"

        if($Condition){
            $Body = $Condition | ConvertTo-Json -Depth 100
        }

        try {
            $Result = Invoke-AkamaiRestMethod -Method POST -Path $Path -Body $Body -EdgeRCFile $EdgeRCFile -Section $Section
            return $Result
        }
        catch {
            throw $_ 
        }
    }

    end{}

}
# SIG # Begin signature block
# MIIgEgYJKoZIhvcNAQcCoIIgAzCCH/8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC8xQsnlOkCddml
# xqC4hcW4ZbfzZgEJY7+DMBYPvVXfRKCCDsEwggawMIIEmKADAgECAhAIrUCyYNKc
# TJ9ezam9k67ZMA0GCSqGSIb3DQEBDAUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNV
# BAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMTA0MjkwMDAwMDBaFw0z
# NjA0MjgyMzU5NTlaMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDVtC9C0CiteLdd1TlZG7GIQvUzjOs9gZdwxbvEhSYwn6SOaNhc9es0
# JAfhS0/TeEP0F9ce2vnS1WcaUk8OoVf8iJnBkcyBAz5NcCRks43iCH00fUyAVxJr
# Q5qZ8sU7H/Lvy0daE6ZMswEgJfMQ04uy+wjwiuCdCcBlp/qYgEk1hz1RGeiQIXhF
# LqGfLOEYwhrMxe6TSXBCMo/7xuoc82VokaJNTIIRSFJo3hC9FFdd6BgTZcV/sk+F
# LEikVoQ11vkunKoAFdE3/hoGlMJ8yOobMubKwvSnowMOdKWvObarYBLj6Na59zHh
# 3K3kGKDYwSNHR7OhD26jq22YBoMbt2pnLdK9RBqSEIGPsDsJ18ebMlrC/2pgVItJ
# wZPt4bRc4G/rJvmM1bL5OBDm6s6R9b7T+2+TYTRcvJNFKIM2KmYoX7BzzosmJQay
# g9Rc9hUZTO1i4F4z8ujo7AqnsAMrkbI2eb73rQgedaZlzLvjSFDzd5Ea/ttQokbI
# YViY9XwCFjyDKK05huzUtw1T0PhH5nUwjewwk3YUpltLXXRhTT8SkXbev1jLchAp
# QfDVxW0mdmgRQRNYmtwmKwH0iU1Z23jPgUo+QEdfyYFQc4UQIyFZYIpkVMHMIRro
# OBl8ZhzNeDhFMJlP/2NPTLuqDQhTQXxYPUez+rbsjDIJAsxsPAxWEQIDAQABo4IB
# WTCCAVUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUaDfg67Y7+F8Rhvv+
# YXsIiGX0TkIwHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0P
# AQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMDMHcGCCsGAQUFBwEBBGswaTAk
# BggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAC
# hjVodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9v
# dEc0LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5j
# b20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAcBgNVHSAEFTATMAcGBWeBDAED
# MAgGBmeBDAEEATANBgkqhkiG9w0BAQwFAAOCAgEAOiNEPY0Idu6PvDqZ01bgAhql
# +Eg08yy25nRm95RysQDKr2wwJxMSnpBEn0v9nqN8JtU3vDpdSG2V1T9J9Ce7FoFF
# UP2cvbaF4HZ+N3HLIvdaqpDP9ZNq4+sg0dVQeYiaiorBtr2hSBh+3NiAGhEZGM1h
# mYFW9snjdufE5BtfQ/g+lP92OT2e1JnPSt0o618moZVYSNUa/tcnP/2Q0XaG3Ryw
# YFzzDaju4ImhvTnhOE7abrs2nfvlIVNaw8rpavGiPttDuDPITzgUkpn13c5Ubdld
# AhQfQDN8A+KVssIhdXNSy0bYxDQcoqVLjc1vdjcshT8azibpGL6QB7BDf5WIIIJw
# 8MzK7/0pNVwfiThV9zeKiwmhywvpMRr/LhlcOXHhvpynCgbWJme3kuZOX956rEnP
# LqR0kq3bPKSchh/jwVYbKyP/j7XqiHtwa+aguv06P0WmxOgWkVKLQcBIhEuWTatE
# QOON8BUozu3xGFYHKi8QxAwIZDwzj64ojDzLj4gLDb879M4ee47vtevLt/B3E+bn
# KD+sEq6lLyJsQfmCXBVmzGwOysWGw/YmMwwHS6DTBwJqakAwSEs0qFEgu60bhQji
# WQ1tygVQK+pKHJ6l/aCnHwZ05/LWUpD9r4VIIflXO7ScA+2GRfS0YW6/aOImYIbq
# yK+p/pQd52MbOoZWeE4wgggJMIIF8aADAgECAhAHIszIesP43uahmQLOEsTtMA0G
# CSqGSIb3DQEBCwUAMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwHhcNMjIwMzEwMDAwMDAwWhcNMjMwMzAx
# MjM1OTU5WjCB3jETMBEGCysGAQQBgjc8AgEDEwJVUzEZMBcGCysGAQQBgjc8AgEC
# EwhEZWxhd2FyZTEdMBsGA1UEDwwUUHJpdmF0ZSBPcmdhbml6YXRpb24xEDAOBgNV
# BAUTBzI5MzM2MzcxCzAJBgNVBAYTAlVTMRYwFAYDVQQIEw1NYXNzYWNodXNldHRz
# MRIwEAYDVQQHEwlDYW1icmlkZ2UxIDAeBgNVBAoTF0FrYW1haSBUZWNobm9sb2dp
# ZXMgSW5jMSAwHgYDVQQDExdBa2FtYWkgVGVjaG5vbG9naWVzIEluYzCCAiIwDQYJ
# KoZIhvcNAQEBBQADggIPADCCAgoCggIBALiCVhyjVWQnarv6/Pdf97vrz6idrh6v
# hHMOEaB6CxEnjSEn+ukSkOo1Yuq700EIF3zNtOYNssWNMWHkDMv6HRd4SUgWqObR
# UnsxYIcwuiqBZ7lAJ0tnfDv/I4mnSD0WTmOJyMuyBzhQIPErwgDaYZNwKY8z5r8i
# XLa5LVampC97cm69gQMh7xqeXG5xXkTm84lQ0Ub0l2s6GsFR6EP5NbiufFqhbECs
# sedLu0y788juJZwZuxtfTJ7oAmfnrhZ5nzImGfTmvLVsfnztdf5J4wJqiROTtr/x
# 5qDd7zQEnAwMxIH8K75tUclPmfVw/RHCTHBdjBilFajVghSDsFhYB3gN+MFQwPq8
# tXvyCVtv6tMaxtQ5IlDWcVbde1WrM7Y+F0NYUR37kngc1g19+81068Xf5upoFk+s
# k1nL5lR7Ppl2Rx/CbOAktuDXOjPGpamZDfL6BMpHYC0He1FAnn0urIif014E2wlh
# /6C6Lz3Z7cMq3na/uRZs770bHUDzW5iPqKfviO6It44DvNh3jY0cnUzBq5jbzfVY
# u0yyIg2R8CJro3EWnRwViFVvVGTiToUX2DeAoM/eOYtTVDOZNyKC2XscvuoZiT1H
# FO1RJA+aLsv2J8xVHrnRuKXGstJgJce90z9ONa7hw4ZAJiFkiOKfyJ93jYfMnDGr
# 6Ne9/Z2A+Q/lAgMBAAGjggI1MIICMTAfBgNVHSMEGDAWgBRoN+Drtjv4XxGG+/5h
# ewiIZfROQjAdBgNVHQ4EFgQUwv2lfAnAr+YF8AVrOUgJbp0qCEkwLgYDVR0RBCcw
# JaAjBggrBgEFBQcIA6AXMBUME1VTLURFTEFXQVJFLTI5MzM2MzcwDgYDVR0PAQH/
# BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMIG1BgNVHR8Ega0wgaowU6BRoE+G
# TWh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNENvZGVT
# aWduaW5nUlNBNDA5NlNIQTM4NDIwMjFDQTEuY3JsMFOgUaBPhk1odHRwOi8vY3Js
# NC5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRDb2RlU2lnbmluZ1JTQTQw
# OTZTSEEzODQyMDIxQ0ExLmNybDA9BgNVHSAENjA0MDIGBWeBDAEDMCkwJwYIKwYB
# BQUHAgEWG2h0dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBlAYIKwYBBQUHAQEE
# gYcwgYQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBcBggr
# BgEFBQcwAoZQaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1
# c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcnQwDAYDVR0T
# AQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEApw9nsvZn9pJnIuDUfGrB4zLqszHo
# 7B4MkNI/mYXHOXSTtan6JMTReBpef1FeGR1k9NLV0gw5brI0OJEcEmvvaisK7o9s
# G0fI5783FyS/sTEnRrsVVie3+h7THYPHNc/2frleWoZ1BgnfQk+ssK42nO2yJGac
# ucuNh4hP5J9HDRY1FRyv+EVu0ez/P/lopbi3FaWF2uON4JWhj9YfHHmvySHCsSOL
# EzKt+f8C2UzhdvTl1k/HPYZ80gD8tkX+7XFDFbZte7t0AELvSS7AAoli1uk1LAtg
# hJcop2m4izJ6iONfc/jVXeswsOORaNcaQA9VcyuVNgxPpXll4W6haBn20IU+86vo
# 6MDJSpisbJvZ7s+0dhyZhy2nrteAFoLATehF2kWinPejeRKy0HV2a1TNaIUh13fu
# yIaNghUdStF+CoGNXe7h2yQX1qmZWnZWZRQumU44Vq1Wew0tgHGSMUAxwioafojX
# QrEa8S8pYG/675jxqjEXwTt5WoCCWDoSfYkku9qANLxkg1f6ZM5v612w8PEdbJpo
# FtwmfLRA57KZ50IcxCk/yUWyFQkvSyupfRurRTjVFDD0OLYr4JdQVpFzZj8z6Quh
# pxbUv+GUtlRIRe4sfyam/VRhblyXMA3Uea8cveWiwjuEDppEPgsIs4G4WBn7RuFV
# mKw3mUwz0p7xjQIxghCnMIIQowIBATB9MGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQK
# Ew5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBD
# b2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEAcizMh6w/je5qGZ
# As4SxO0wDQYJYIZIAWUDBAIBBQCgfDAQBgorBgEEAYI3AgEMMQIwADAZBgkqhkiG
# 9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIB
# FTAvBgkqhkiG9w0BCQQxIgQgIpu3osdeBt5xWUmmFFvFS5GHO/j/YNQbfg1zUkcm
# SWowDQYJKoZIhvcNAQEBBQAEggIAphg7rXY4qPBVR5JlKVmGzVnuLxxrRs3zpCUv
# BEuE+CkQlOV2tNqef4+HqtBG5IEQ0t5aYHqPt1XN3RGFETyqE5ImQWj0ux8/IG+m
# 2Tvkonf5TtoNS85zVaUxiEgwTMRj38CeZz6ncWAw+N/qfyosaE/Uslw8KMVmRthE
# +FBsJPRqD86FVrJ5pEvEvz2XmeAofGUK4Kv6Hddh2o0siwBkdfmqwj8guZ0KkyqM
# LGmuKijMTkYL0oVw59i/qj+9DJ1g5V+p5qYDE8ejpisKVXcGmXnJ7p+66CA3jTnV
# WAs8Jyiru/pmuvyiS9/aBr2F/UqAaB9BvgJRge7gSbhLKZtEQqo/Ru3p3xh1NPf+
# fK9KVQD7nrvLUW4BNfagbtFch7Q5Xd1v4gpTE5RlyoKGZGMJQCCP1B1Dp3Upsqf1
# lZLpKZkNCBEw6nniGwQPmTjhe2vUNUNVwoEUIvolTD0XSPTLLJ4pYS8TbwJF2n+C
# XzR1+xQM0+vCnpBxl2U2+nIE2dk+tfxFw/N//M/CvCwWL54UAUiAdIPnpk3d/wwT
# wkPOTluu9Do98xNw0GQcmCeFaqz83KzeMF4XiLQwQcLLz8M9PpacycIxtxPI5/gY
# 5QyBmZpwBCFg+i9Z35Sf1CXxUuWU1EANdn/JDEUW4iw4v5j2F2ZzTkaZ+awjO3Bs
# gttJ3Gqhgg19MIINeQYKKwYBBAGCNwMDATGCDWkwgg1lBgkqhkiG9w0BBwKggg1W
# MIINUgIBAzEPMA0GCWCGSAFlAwQCAQUAMHcGCyqGSIb3DQEJEAEEoGgEZjBkAgEB
# BglghkgBhv1sBwEwMTANBglghkgBZQMEAgEFAAQgw/yj3kgflF90fq+oAg8MMl6W
# a/htncl5xxqIc9K0MdkCEFmX05b5i6Eas4FRisHrzgAYDzIwMjIwMzIzMTg1NDEw
# WqCCCjcwggT+MIID5qADAgECAhANQkrgvjqI/2BAIc4UAPDdMA0GCSqGSIb3DQEB
# CwUAMHIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNV
# BAsTEHd3dy5kaWdpY2VydC5jb20xMTAvBgNVBAMTKERpZ2lDZXJ0IFNIQTIgQXNz
# dXJlZCBJRCBUaW1lc3RhbXBpbmcgQ0EwHhcNMjEwMTAxMDAwMDAwWhcNMzEwMTA2
# MDAwMDAwWjBIMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4x
# IDAeBgNVBAMTF0RpZ2lDZXJ0IFRpbWVzdGFtcCAyMDIxMIIBIjANBgkqhkiG9w0B
# AQEFAAOCAQ8AMIIBCgKCAQEAwuZhhGfFivUNCKRFymNrUdc6EUK9CnV1TZS0DFC1
# JhD+HchvkWsMlucaXEjvROW/m2HNFZFiWrj/ZwucY/02aoH6KfjdK3CF3gIY83ht
# vH35x20JPb5qdofpir34hF0edsnkxnZ2OlPR0dNaNo/Go+EvGzq3YdZz7E5tM4p8
# XUUtS7FQ5kE6N1aG3JMjjfdQJehk5t3Tjy9XtYcg6w6OLNUj2vRNeEbjA4MxKUpc
# DDGKSoyIxfcwWvkUrxVfbENJCf0mI1P2jWPoGqtbsR0wwptpgrTb/FZUvB+hh6u+
# elsKIC9LCcmVp42y+tZji06lchzun3oBc/gZ1v4NSYS9AQIDAQABo4IBuDCCAbQw
# DgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYB
# BQUHAwgwQQYDVR0gBDowODA2BglghkgBhv1sBwEwKTAnBggrBgEFBQcCARYbaHR0
# cDovL3d3dy5kaWdpY2VydC5jb20vQ1BTMB8GA1UdIwQYMBaAFPS24SAd/imu0uRh
# pbKiJbLIFzVuMB0GA1UdDgQWBBQ2RIaOpLqwZr68KC0dRDbd42p6vDBxBgNVHR8E
# ajBoMDKgMKAuhixodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vc2hhMi1hc3N1cmVk
# LXRzLmNybDAyoDCgLoYsaHR0cDovL2NybDQuZGlnaWNlcnQuY29tL3NoYTItYXNz
# dXJlZC10cy5jcmwwgYUGCCsGAQUFBwEBBHkwdzAkBggrBgEFBQcwAYYYaHR0cDov
# L29jc3AuZGlnaWNlcnQuY29tME8GCCsGAQUFBzAChkNodHRwOi8vY2FjZXJ0cy5k
# aWdpY2VydC5jb20vRGlnaUNlcnRTSEEyQXNzdXJlZElEVGltZXN0YW1waW5nQ0Eu
# Y3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBIHNy16ZojvOca5yAOjmdG/UJyUXQKI0ej
# q5LSJcRwWb4UoOUngaVNFBUZB3nw0QTDhtk7vf5EAmZN7WmkD/a4cM9i6PVRSnh5
# Nnont/PnUp+Tp+1DnnvntN1BIon7h6JGA0789P63ZHdjXyNSaYOC+hpT7ZDMjaEX
# cw3082U5cEvznNZ6e9oMvD0y0BvL9WH8dQgAdryBDvjA4VzPxBFy5xtkSdgimnUV
# QvUtMjiB2vRgorq0Uvtc4GEkJU+y38kpqHNDUdq9Y9YfW5v3LhtPEx33Sg1xfpe3
# 9D+E68Hjo0mh+s6nv1bPull2YYlffqe0jmd4+TaY4cso2luHpoovMIIFMTCCBBmg
# AwIBAgIQCqEl1tYyG35B5AXaNpfCFTANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQG
# EwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNl
# cnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgQ0EwHhcN
# MTYwMTA3MTIwMDAwWhcNMzEwMTA3MTIwMDAwWjByMQswCQYDVQQGEwJVUzEVMBMG
# A1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTEw
# LwYDVQQDEyhEaWdpQ2VydCBTSEEyIEFzc3VyZWQgSUQgVGltZXN0YW1waW5nIENB
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvdAy7kvNj3/dqbqCmcU5
# VChXtiNKxA4HRTNREH3Q+X1NaH7ntqD0jbOI5Je/YyGQmL8TvFfTw+F+CNZqFAA4
# 9y4eO+7MpvYyWf5fZT/gm+vjRkcGGlV+Cyd+wKL1oODeIj8O/36V+/OjuiI+GKwR
# 5PCZA207hXwJ0+5dyJoLVOOoCXFr4M8iEA91z3FyTgqt30A6XLdR4aF5FMZNJCMw
# XbzsPGBqrC8HzP3w6kfZiFBe/WZuVmEnKYmEUeaC50ZQ/ZQqLKfkdT66mA+Ef58x
# FNat1fJky3seBdCEGXIX8RcG7z3N1k3vBkL9olMqT4UdxB08r8/arBD13ays6Vb/
# kwIDAQABo4IBzjCCAcowHQYDVR0OBBYEFPS24SAd/imu0uRhpbKiJbLIFzVuMB8G
# A1UdIwQYMBaAFEXroq/0ksuCMS1Ri6enIZ3zbcgPMBIGA1UdEwEB/wQIMAYBAf8C
# AQAwDgYDVR0PAQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMIMHkGCCsGAQUF
# BwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
# CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRB
# c3N1cmVkSURSb290Q0EuY3J0MIGBBgNVHR8EejB4MDqgOKA2hjRodHRwOi8vY3Js
# NC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290Q0EuY3JsMDqgOKA2
# hjRodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290
# Q0EuY3JsMFAGA1UdIARJMEcwOAYKYIZIAYb9bAACBDAqMCgGCCsGAQUFBwIBFhxo
# dHRwczovL3d3dy5kaWdpY2VydC5jb20vQ1BTMAsGCWCGSAGG/WwHATANBgkqhkiG
# 9w0BAQsFAAOCAQEAcZUS6VGHVmnN793afKpjerN4zwY3QITvS4S/ys8DAv3Fp8MO
# IEIsr3fzKx8MIVoqtwU0HWqumfgnoma/Capg33akOpMP+LLR2HwZYuhegiUexLoc
# eywh4tZbLBQ1QwRostt1AuByx5jWPGTlH0gQGF+JOGFNYkYkh2OMkVIsrymJ5Xgf
# 1gsUpYDXEkdws3XVk4WTfraSZ/tTYYmo9WuWwPRYaQ18yAGxuSh1t5ljhSKMYcp5
# lH5Z/IwP42+1ASa2bKXuh1Eh5Fhgm7oMLSttosR+u8QlK0cCCHxJrhO24XxCQijG
# GFbPQTS2Zl22dHv1VjMiLyI2skuiSpXY9aaOUjGCAoYwggKCAgEBMIGGMHIxCzAJ
# BgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5k
# aWdpY2VydC5jb20xMTAvBgNVBAMTKERpZ2lDZXJ0IFNIQTIgQXNzdXJlZCBJRCBU
# aW1lc3RhbXBpbmcgQ0ECEA1CSuC+Ooj/YEAhzhQA8N0wDQYJYIZIAWUDBAIBBQCg
# gdEwGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMBwGCSqGSIb3DQEJBTEPFw0y
# MjAzMjMxODU0MTBaMCsGCyqGSIb3DQEJEAIMMRwwGjAYMBYEFOHXgqjhkb7va8oW
# kbWqtJSmJJvzMC8GCSqGSIb3DQEJBDEiBCBiXqGchpAUC5O/FULDAVWeasrU4UiA
# 3UTvaUh40KgvaTA3BgsqhkiG9w0BCRACLzEoMCYwJDAiBCCzEJAGvArZgweRVyng
# RANBXIPjKSthTyaWTI01cez1qTANBgkqhkiG9w0BAQEFAASCAQAx9RCJ5+JIBYom
# uvV3YtJ7ly052wqOITYWmBzvJmiTDDYpDAqAzCB4ymePoqY75mx8QZuOMGndgpx8
# hkuAF6YSAyT8MJE8i4tjVKL1MxPo7TnX2Sn3UTbZaZaeTbN1VHLAzt48leMXkce2
# AVACwmhHQKOz58NEo02GitviWGYHGh4St9NsXLfK2+GGP6qdxSBn4CkWekW9mpYj
# 2aSjoQQVX1cr+u/WR33giwxZeG543m18J7HxJPfbnTWR4Q22oineI6lYKAHinlds
# cCdaYPI7MiYjXoCJBFEmPIWZnKmocmbD2uVa3gPXmjDNQe299M0aRPtrlzMt2AI+
# lbJkyMOb
# SIG # End signature block
