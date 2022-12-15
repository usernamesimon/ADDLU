

# Function Generator control scripts:
The function generators in the lab (rack) can be controlled using the scripts 
provided in the tools directory.
Use the --help command line option to find out more about their supported 
features.

## Examples:

- Set the output frequency to 1 MHz

    $ ./Agilent33250A.py --freq --value=1000000
        
- Activate the output (both commands are equivalent)

    $ ./Agilent33250A.py --output --value=ON
    $ ./Agilent33250A.py --output --value=1
    
- Deactivate the output (both commands are equivalent)

    $ ./Agilent33250A.py --output --value=OFF
    $ ./Agilent33250A.py --output --value=0


