[![Gem Version](https://badge.fury.io/rb/honeybii.svg)](http://badge.fury.io/rb/honeybii)

`<(||')` [honeybii](http://www.honeybii.com)
==========

honeybii is a tool that converts images to ascii art.

installation
----------

`$ gem install honeybii`

usage
----------

###code

    require 'honeybii'

    ascii_bee = ShadedAscii.new('/path/to/an/image.jpg')
    puts ascii_bee
    very_detailed_mona_lisa = ShadedAscii.new('/path/to/an/image.png', 2)
    puts very_detailed_mona_lisa
    starry_night_with_a_weird_gradient = ShadedAscii.new('/path/to/an/image.png', gradient: 2)
    puts starry_night_with_a_weird_gradient
    thick_looking_bee_near_flower = ShadedAscii.new('/path/to/an/image.gif', 10, style: 'one_to_one')
    puts thick_looking_bee_near_flower

###command line

    Usage: honeybii file.(png|gif|jpg) [options]
        -p, --pixel-size PIXELS          Size of image chunks to process into ascii (smaller => more detail) [default: 12]
        -g, --gradient N                 Gradient characters [default: 0] [{0=>"@%8\#$VYx*=+:~-. "}, {1=>"8Oo:. "}, {2=>"#+: "}]
        -o, --one-to-one                 One-to-one shading, as opposed to relative

_Examples:_

- `$ honeybii /path/to/some/image.png`
- `$ honeybii /path/to/some/other/image.JPG -p 2`
- `$ honeybii /path/to/yet/another/image.Gif -g 1 --one-to-one`

current features
----------

image => shaded ascii art

planned features
----------

custom gradients  
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

