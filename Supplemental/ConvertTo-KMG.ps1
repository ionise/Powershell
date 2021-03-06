﻿filter ConvertTo-KMG {
     <#
     .SYNOPSIS
      Converts byte counts to Byte\KB\MB\GB\TB\PB format
     .DESCRIPTION
      Accepts an [int64] byte count, and converts to Byte\KB\MB\GB\TB\PB format
      with decimal precision of 2
     .EXAMPLE
     3000 | convertto-kmg
     #>

    $bytecount = $_
    switch ([math]::truncate([math]::log($bytecount,1024))) 
    {
              0 {"$bytecount Bytes"}
              1 {"{0:n2} KB" -f ($bytecount / 1kb)}
              2 {"{0:n2} MB" -f ($bytecount / 1mb)}
              3 {"{0:n2} GB" -f ($bytecount / 1gb)}
              4 {"{0:n2} TB" -f ($bytecount / 1tb)}
        default {"{0:n2} PB" -f ($bytecount / 1pb)}
    }
}
