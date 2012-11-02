# Ash Make Drupal Installation

This Document describes all the necessary steps to install Drupal using Ash_make.

For more information please refer to: [Ash Make Wiki](https://github.com/augustash/ash_make/wiki)


##### Clone Ash Make
Create the domain folder inside your projects folder.
Inside domain folder run the following command.

    $ git clone git://github.com/augustash/ash_make.git

### Automated Process

Move the file mbuild.sh outside ash_make folder.

    mv ash_make/mbuild.sh mbuild.sh

Run the bash script:

    ./mbuild.sh
    
After the script finish please remember to remove the file mbuild.sh before you push 
your code
    
    rm -rf mbuild.sh
    
Also check the file sites/sites.php and update the local environment if needed.