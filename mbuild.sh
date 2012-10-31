#!/bin/bash

FILEX_LOC=$1
# If no arguments set as our github url
if [ "X$FILEX_LOC" == "X" ];
then
    FILEX_LOC='https://raw.github.com/augustash/ash_make/master/ash_make.make'
fi

function colorize() {

    
    Escape="\e[00";
    #Escape="\033";
    
    BlackF="${Escape};30m"; 
    RedF="${Escape};31m"; 
    GreenF="${Escape};32m";
    YellowF="${Escape};33m"; 
    BlueF="${Escape};34m"; 
    Purplef="${Escape};35m";
    CyanF="${Escape};36m"; 
    WhiteF="${Escape};37m";
    
    BlackB="${Escape};40m"; 
    RedB="${Escape};41m"; 
    GreenB="${Escape};42m";
    YellowB="${Escape};43m"; 
    BlueB="${Escape};44m"; 
    PurpleB="${Escape};45m";
    CyanB="${Escape};46m"; 
    WhiteB="${Escape};47m";
    
    BoldOn="${Escape};1m"; 
    BoldOff="${Escape};22m";
    ItalicsOn="${Escape};3m"; 
    ItalicsOff="${Escape};23m";
    UnderlineOn="${Escape};4m"; 
    UnderlineOff="${Escape};24m";
    BlinkOn="${Escape};5m"; 
    BlinkOff="${Escape};25m";
    InvertOn="${Escape};7m"; 
    InvertOff="${Escape};27m";
    
    #Reset="${Escape}[0m";
    Reset="${Escape}m";
}

function run_edits () {

    for((j=1; j<=${#domains[@]}; j++));do
        
        CLIENT_DOMAIN=${domains[j]}
        CLIENT_CODE=${codes[j]}
    
        echo '####################################################################################'
        echo "# Creating directories structure for ${domains[j]}"
        echo '####################################################################################'


        DIRECTORIES="sites/$CLIENT_DOMAIN sites/$CLIENT_DOMAIN/files sites/$CLIENT_DOMAIN/modules sites/$CLIENT_DOMAIN/themes sites/$CLIENT_DOMAIN/themes/custom"

        for dir in $DIRECTORIES
        do
        echo -ne "Creating directory $dir ... "
          # Lets check if directory exists
          # if does exist remove and create
          # else create
          if [ -d $dir ]; then
        rm -rf $dir
            mkdir $dir
          else
        mkdir $dir
          fi
        echo 'OK'
        done

        # Set permissions on files folder
        chmod 777 "sites/$CLIENT_DOMAIN/files"

        # Copy settings file
        cp -p "./sites/default/default.settings.php" "./sites/$CLIENT_DOMAIN/settings.php"

        # Copy contrib framework theme
        cp -Rp "./sites/all/themes/contrib/framework" "./sites/$CLIENT_DOMAIN/themes/custom/"

        # Rename framework theme folder to client code
        mv "./sites/$CLIENT_DOMAIN/themes/custom/framework/" "./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE"

        # Rename theme info file
        mv "./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/framework.info" "./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info"

        # Copy sites.php file
        cp "./sites/example.sites.php" "./sites/sites.php"


        echo "Editing File $CLIENT_CODE.info "
        echo "Editing file sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info ..."

        # Replaces theme name
        echo -ne "Changing theme name ... "
        ORG_TEXT="name = Framework"
        REPLACE_WITH="name = $CLIENT_CODE theme"
        sed -i -e 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' ./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
        echo "OK"

        # Replaces theme description
        echo -ne "Changing theme description ... "
        ORG_TEXT="Framework is a blank canvas for theme developers. Use Framework as a starting point to facilitate your theme development."
        REPLACE_WITH="Theme created by August Ash, Inc for $CLIENT_DOMAIN"
        sed -i -e 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' ./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
        echo "OK"

        # Replaces information string
        echo -ne "Adding script information ... "
        ORG_TEXT="; Information added by drupal.org packaging script on.*"
        REPLACE_WITH="; Information added by August Ash, Inc packaging script on "`date +%Y-%m-%d`
        sed -i -e 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' ./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
        echo "OK"

        # Replaces theme project
        echo -ne "Changing theme project name ... "
        ORG_TEXT="framework"
        REPLACE_WITH="$CLIENT_CODE"
        sed -i -e 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' ./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
        echo "OK"

        # updates theme datestamp
        echo -ne "Updating datetimestamp ... "
        REPLACE_WITH=`date +%s`
        sed -i -e "s/datestamp = .*/datestamp = \"${REPLACE_WITH}\"/" ./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
        echo "OK"

        # updates theme version
        REPLACE_WITH=`date +%s`
        VERSION="7.x-0.1"
        sed -i -e "s/version = .*/version = \"${VERSION}\"/" ./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info


        echo "Editing File template.php "
        echo -ne "Editing file sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/template.php ... "
        sed -i -e 's/framework_/'"$CLIENT_CODE"_'/' ./sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/template.php
        echo "OK"

       echo -ne "Editing file sites/sites.php ... "
       echo -e '$sites["'aai$CLIENT_CODE.victor.aaidev.net'"] = "'$CLIENT_DOMAIN'";' >> ./sites/sites.php

       echo -e "\n"

    done

    # Adds the local development settings
    echo '$sites["'$CLIENT_CODE.dev'"] = "'$CLIENT_DOMAIN'";' >> ./sites/sites.php
    echo -e "\n"
}

function create_database () {

    echo '####################################################################################'
    echo '#                              Creating Database                                   #'
    echo '####################################################################################'

    # TODO - Find a better way to
    # autodetect shell since which
    # does not work for mac
    #MYSQL=`which mysql`
    #if [ ! $SHELL = "/bin/bash" ]; then
    #     MYSQL=`mysql`
    #     #MYSQL=`whence -p mysql`
    #     #say "z-shell is bad, bad, bad. Please use bash. Bash is awesome!"
    #fi
    MYSQL=mysql

    tick="'"
    q1=" CREATE DATABASE IF NOT EXISTS $db_name;"
    q2=" GRANT ALL ON $db_name.* TO $tick$db_username$tick@$tick$db_host$tick IDENTIFIED BY $tick$db_password$tick;"
    q3=" FLUSH PRIVILEGES;"

    sql="${q1}${q2}${q3}"

    $MYSQL -h $db_host -u$db_username -p$db_password -e "$sql"
}

clear

echo -e "${YellowB}####################################################################################${Reset}"
echo -e "${YellowB}#  Hello, "$USER".                                                                    #${Reset}"
echo -e "${YellowB}#   This script will automaticali download all necessary files for a Drupal        #${Reset}"
echo -e "${YellowB}#   Installation. Please answer carefully the questions bellow.                    #${Reset}"
echo -e "${YellowB}#   If it breaks you can keep both pieces... :)                                    #${Reset}"
echo -e "${YellowB}####################################################################################${Reset}"

read -p "How many domains this installation contains? [1]: " multisite
multisite=${multisite:-1}

# Do we got a integer?
if [ ! $(echo "$multisite" | grep -E "^[0-9]+$") ]; then
    echo $multisite is not a valid integer. Quiting ...
    exit 1
fi
#if is multisite we need to ask some questions

#has_multisite is used inside show_review
has_multisite='n'

if (("$multisite" >= 2)); then
    has_multisite="y"
    read -p "Enter the main domain name: " main_domain
    read -p "Enter the main domain prefix: " main_code
    
    domains[1]=$main_domain
    codes[1]=$main_code
    
    while [ $multisite -gt 1 ]; do
        read -p "Enter <$multisite> additional domain: " domains[$multisite]
        read -p "Enter <$multisite> additional prefix: " codes[$multisite]
        let multisite=multisite-1
    done 

    else

        read -p "Enter the main domain name: " main_domain
        read -p "Enter the main domain prefix: " main_code
        
        #add the main domain and code to the hash
        domains[1]=$main_domain
        codes[1]=$main_code
fi


# check if we dont have empty values
# for domains and codes
for((j=1; j<=${#domains[@]}; j++));do

    if [ -z ${domains[j]} ]; then
        echo "Domain $j is empty Exiting..."
        exit
    fi
    
    if [ -z ${codes[j]} ]; then
        echo "Code $j is empty Exiting..."
        exit
    fi
done


has_database=n
read -p "Automatically try to create a database for this Drupal installation? [N]: " input_database
has_database=${input_database:-has_database}

db_host='127.0.0.1'
db_name=$main_code"_drupal_dev"
db_username='developer'
db_password=''

# Do we want to create database?
if [ $has_database == "y" ]; then
    
    read -p "Enter Dabatase hostname [$db_host]: " has_new_host
    db_host=${has_new_host:-$db_host}
    
    read -p "Enter Database Name [$db_name]: " in_db_name
    db_name=${in_db_name:-$db_name}
    
    if [ -z "$db_name" ]; then
        echo "Database name cannot be empty. Exiting..."
        exit
    fi

    read -p "Enter Database Username [$db_username]: " in_db_username
    db_username=${in_db_username:-$db_username}
    
    if [ -z "$db_username" ]; then
        echo "Database username cannot be empty. Exiting..."
        exit
    fi
    
    read -p "Enter Database password [$db_password]: " in_db_password
    db_password=${in_db_password:-$db_password}
fi

function show_review () {

    clear
    # Show main domain and main code
    divider===============================
    divider=$divider$divider
    header="\n %-20s %20s\n"
    format=" %-20s %20s \n"
    width=43
    printf "$header"
    printf "%$width.${width}s\n" "$divider"
    echo " Main Domain Information"
    printf "%$width.${width}s\n" "$divider"
    printf "$format" \
    "Client Domain Name" "$main_domain" \
    "Client Code" "$main_code"
    printf "%$width.${width}s\n" "$divider"

    # Show additional domains in this installation
    # if any
    if [ $has_multisite == "y" ]; then
        divider===============================
        divider=$divider$divider
        header="\n %-10s %10s %20s\n"
        format=" %-10s %10s %20s \n"
        width=43
        printf "$header"
        printf "%$width.${width}s\n" "$divider"
        echo " Additional Domains Information"
        printf "%$width.${width}s\n" "$divider"
        for((j=1; j<=${#domains[@]}; j++));do
            printf "$format" \
            "Domain [${j}] " "${codes[j]}"  "${domains[j]}" 
        done
        printf "%$width.${width}s\n" "$divider"
    fi

    # Show database information
    if [ $has_database == "y" ]; then
        divider===============================
        divider=$divider$divider
        header="\n %-20s %20s\n"
        format=" %-20s %20s \n"
        width=43
        printf "$header"
        printf "%$width.${width}s\n" "$divider"
        echo " Database Information"
        printf "%$width.${width}s\n" "$divider"
        printf "$format" \
        "Database Host" "$db_host" \
        "Database Name" "$db_name" \
        "Database Username" "$db_username" \
        "Database Password" "$db_password"
        printf "%$width.${width}s\n" "$divider"
    fi

    divider===============================
    divider=$divider$divider
    header="\n %-10s %10s %20s\n"
    format=" %-10s %10s %20s \n"
    width=43
    printf "$header"
    printf "%$width.${width}s\n" "$divider"
    echo " ash.make file location "
    printf "%$width.${width}s\n" "$divider"
    printf "$format" \
        "$FILEX_LOC" 
    printf "%$width.${width}s\n" "$divider"
}

show_review

run="n"
read -p "This information looks correct to you? [N]: " run
run=${run:-1}

overwrite_files="y"

if [ -f ./sites/sites.php ];
then
    clear
    colorize
    overwrite_files="n"
    
    echo -e "${RedF}####################################################################################${Reset}"
    echo -e "${RedF}#                          WARNING WARNING WARNING                                 #${Reset}"
    echo -e "${RedF}####################################################################################${Reset}"
    echo -e "${RedF}####################################################################################${Reset}"
    echo -e "${RedF}#                                                                                  #${Reset}"
    echo -e "${RedF}#                          Looks like there's a drupal                             #${Reset}"
    echo -e "${RedF}#                          installation on this folder.                            #${Reset}"
    echo -e "${RedF}#                          Are you sure you want to continue?                      #${Reset}"
    echo -e "${RedF}#                          The files will be overwritten                           #${Reset}"
    echo -e "${RedF}#                                                                                  #${Reset}"
    echo -e "${RedF}####################################################################################${Reset}"

    
    read -p "Are sure to continue? FILES WILL BE OVERWRITTEN!!! [N]: " overwrite_files
    overwrite_files=${overwrite_files:-1}
fi



clear

if [ $overwrite_files == "y" ]; then

    FILE_DATA=""

    if [[ $FILEX_LOC =~ ^(http|https):// ]];
    then
        echo '####################################################################################'
        echo '#                           Downloadign Ash_Make                                   #'
        echo '####################################################################################'
        FILE_DATA=$(curl -o /tmp/ash_make.make $FILEX_LOC)
    else
        FILE_DATA=$(cat $FILEX_LOC)
    fi

    echo '####################################################################################'
    echo '#                                Running Drush                                     #'
    echo '####################################################################################'
    #drush make ash_make/ash_make.make .
    drush make "/tmp/ash_make.make" .

    run_edits
    
    if [ $has_database == "y" ]; then
        create_database
    fi
    else
        echo "Quiting..."
        exit
fi
echo '####################################################################################'
echo "#                                    FIM                                           #"
echo '####################################################################################'
