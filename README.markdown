[![Gem Version](https://badge.fury.io/rb/honeybii.svg)](http://badge.fury.io/rb/honeybii)

[honeybii](http://honeybii.com)
==========

honeybii is a tool that converts images to ascii art.

This project's secondary reason, below FUN, is to help me learn Ruby. If you see anything that doesn't particularly jive with The Ruby Way, open an issue! Or submit a Pull Request!

installation
----------

`$ gem install honeybii`

usage
----------

###code

    require 'honeybii'
    ascii_bee = ShadedAscii.new('/path/to/an/image.jpg')
    puts ascii_bee

###command line

    Usage: honeybii [options]
        -i, --image FILENAME      Name of image file to convert (png|gif|jpg)
        -s, --pixel-size PIXELS   Size of image chunks to process into ascii (smaller => more detail) [default: 12]
        -g, --gradient N          Gradient level (the lower the denser) [default: 0] [{0=>"MNHKbX6Yji+!:'. "}, {1=>"@%8\#$VYx*=+:~-. "}, {2=>"MHb6j+: "}, {3=>"@8Oo:. "}, {4=>"8Oo:. "}, {5=>"#+: "}]

_Examples:_

- `$ honeybii -i /path/to/some/image.jpg`
- `$ honeybii -i /path/to/some/other/image.JPG -s 2`
- `$ honeybii -i /path/to/yet/another/image.Jpg -s 400`

current features
----------

image => shaded ascii art

planned features
----------

image => line ascii art  
colored ascii (as html)

                                 ..                   
                 .~. -~::~-   -~:~~. .~.              
                  .::   ..:=-=~.   .~~.               
    ..-...          ~x=~ =#888$V--=x~         ...-~--.
    -.~~~::::::~--.. ~*Y*:Y$$V$**x+. .--~:~::+::++:~~-
    ....-~:+::+==x*=+++*VY$V$*xV*+:+=+++++~::~::~~~-. 
      ....-~---:::+=++=*xx###V$$YYx*=++=+:+:~~--~-.   
         .-.--~:+:~~~::~~.=8#$$+--~~++:::+=++:~~-     
           ...---....-:*=++*YY*==:+:-.....-.--..      
                   .+==:-+$####V:~~~*:                
                  :*+-:x*V8#88$VY=++.~+-              
                 :~  =Y-=%%888#$$: =x..:~.            
               .+~  *Y- =8##8#$Y$+  +*- -.            
               .. .=*.  :88##8*Y#~   +*.              
                  :*.   .V###$*VV.    ~+-             
                 -*.     =8$#Y*$:      .:-            
                .=~       x8#$$+         :.           
                --         +Yx~                       

