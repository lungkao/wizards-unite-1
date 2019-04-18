Get-ChildItem "../output/images" -Filter *.png | 
Foreach-Object {
    $file = $_.FullName
    $name = $_.BaseName

    magick convert background.png ../output/images/$($name).png -gravity center -composite ../output/images/$($name)_featured.jpg
}