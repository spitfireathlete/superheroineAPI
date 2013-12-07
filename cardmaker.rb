require "rmagick"

image1 = Magick::Image.read("SaraBlakely.jpg").first
image2 = Magick::Image.read("Supergirl.png").first
image2 = image1.append(true)
image2.write("final.png");
image2.display


