$session = New-PSSession NKOVAR1
Copy-Item -FromSession $session "C:\Users\Nathan.kovar" -Filter "*.*" -Exclude "*\Google\Chrome" -Recurse -Destination "C:\Users\blaine.smith\Desktop\Nathan" 
