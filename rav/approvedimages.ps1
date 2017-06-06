function get-imageinfo
{
param (
         [Parameter(Mandatory = $true)] [string] $ImageIDq
         #[Parameter(Mandatory = $true)] [string] $availabilityZone2
       )
            
           $Src = Get-FoldersCreatedToShareResults
           $DateNTime = Get-Date -Format "dd_MM_yyyy_HH_mm_ss";
           $ResultFileForAMIInformation = "$($Src)\BlueAMIInformation_ResultFile_" + $DateNTime + ".txt"

            
       $images = Get-EC2Image -owner self, amazon
       $fullimages = $images.ImageId
 #$fullimages
       
           foreach ($img in $fullimages)

            {
             write-host "comparing $img with $ImageIDq"
                if($img -ne $ImageIDq) 
                {
                $value = 1
                }
                else
                {
                $value = 0
                 "The Passed AMI Value matches with Image ID " | out-file -Append $ResultFileForAMIInformation
                break
                }
             } 
          
             return $value

           }