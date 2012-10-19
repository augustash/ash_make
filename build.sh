#!/bin/bash

ASHMAKEPATH="ash_make"

# Check for proper number of command line args.
EXPECTED_ARGS=2

if [ $# -ne $EXPECTED_ARGS ]
then
 echo "Usage: `basename $0` client_domain.com client_code"
 exit 1
fi

CLIENT_DOMAIN=$1
CLIENT_CODE=$2


#echo '#####################################'
#echo '# Cloning Ash_Make...'
#echo '#####################################'

# Removes ash_make folder if it exists
# EG: the script failed first time and
# is run for the second time
#if [ -d $ASHMAKEPATH ]; then
#  rm -rf $ASHMAKEPATH
#fi

# Clone Ash_Make
#git clone git://github.com/augustash/ash_make.git

echo '#####################################'
echo '# Running Drush...'
echo '#####################################'
drush make ash_make/ash_make.make .

echo '#####################################'
echo '# Creating directories structure..'
echo '#####################################'

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
cp -p "sites/default/default.settings.php" "sites/$CLIENT_DOMAIN/settings.php"

# Copy contrib framework theme
cp -Rp "sites/all/themes/contrib/framework" "sites/$CLIENT_DOMAIN/themes/custom/"

# Rename framework theme folder to client code
mv "sites/$CLIENT_DOMAIN/themes/custom/framework/" "sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE"

# Rename theme info file
mv "sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/framework.info" "sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info"

# Copy sites.php file
cp "sites/example.sites.php" "sites/sites.php"


echo "#####################################"
echo "# Editing File $CLIENT_CODE.info "
echo "#####################################"
echo "Editing file sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info ..."

# Replaces theme name
echo -ne "Changing theme name ... "
ORG_TEXT="name = Framework"
REPLACE_WITH="name = $CLIENT_CODE Theme"
sed -ie 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
echo "OK"

# Replaces theme description
echo -ne "Changing theme description ... "
ORG_TEXT="Framework is a blank canvas for theme developers. Use Framework as a starting point to facilitate your theme development."
REPLACE_WITH="Theme created by August Ash, Inc for $CLIENT_DOMAIN"
sed -ie 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
echo "OK"

# Replaces information string
echo -ne "Adding script information ... "
ORG_TEXT="; Information added by drupal.org packaging script on.*"
REPLACE_WITH="; Information added by August Ash, Inc packaging script on "`date +%Y-%m-%d`
sed -ie 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
echo "OK"

# Replaces theme project
echo -ne "Changing theme project name ... "
ORG_TEXT="framework"
REPLACE_WITH="$CLIENT_CODE"
sed -ie 's/'"$ORG_TEXT"'/'"$REPLACE_WITH"'/' sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
echo "OK"

# updates theme datestamp
echo -ne "Updating datetimestamp ... "
REPLACE_WITH=`date +%s`
sed -i "s/datestamp = .*/datestamp = \"${REPLACE_WITH}\"/" sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info
echo "OK"

# updates theme version
REPLACE_WITH=`date +%s`
VERSION="7.x-0.1"
sed -i "s/version = .*/version = \"${VERSION}\"/" sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/$CLIENT_CODE.info


echo "#####################################"
echo "# Editing File template.php "
echo "#####################################"
echo -ne "Editing file sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/template.php ... "
sed -ie 's/framework_/'"$CLIENT_CODE"_'/' sites/$CLIENT_DOMAIN/themes/custom/$CLIENT_CODE/template.php
echo "OK"

echo "#####################################"
echo "# Editing File sites.php "
echo "#####################################"
echo -ne "Editing file sites/sites.php ... "
echo '$sites["'$CLIENT_CODE.dev'"] = "'$CLIENT_DOMAIN'";' >> sites/sites.php
echo '$sites["'aai$CLIENT_CODE.victor.aaidev.net'"] = "'$CLIENT_DOMAIN'";' >> sites/sites.php
echo "OK\n"

echo "#####################################"
echo "# FIM "
echo "#####################################"
echo "Remember to remove the file build.sh"
echo "by running rm -rf build.sh"
