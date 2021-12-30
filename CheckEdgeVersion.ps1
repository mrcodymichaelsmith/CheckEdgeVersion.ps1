#Make sure to uncomment and place your computer name in the $Computer Names Variable. 
#$ComputerNames =  @('Computer1', 'Computer2', 'Computer3', etc)

foreach($i in $ComputerNames){

    echo $i
    #Ping Test. If PC is shut off, script will stop for the current PC in pipeline and move to the next one.
    if(Test-Connection -ComputerName $i -Count 1 -Quiet)
    {
       invoke-command -computername $i -ScriptBlock {Get-WmiObject -Class Win32_Product | where Name -Like "*Edge*"} #>> EdgeUpdate.txt
    } 

}