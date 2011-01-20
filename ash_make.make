; Drupal core version, pressflow
core = 6.x
projects[pressflow][type] = "core"
projects[pressflow][download][type] = "get"
projects[pressflow][download][url] = "http://files.pressflow.org/pressflow-6-current.tar.gz"

; drush make API version
api = 2

; Contrib Modules
projects[admin][subdir] = "contrib"
projects[advanced_help][subdir] = "contrib"
projects[better_formats][subdir] = "contrib"
projects[boxes][subdir] = "contrib"
; Get the dev version of boxes (see http://drupal.org/node/887260)
projects[boxes][version] = "1.x-dev"
projects[captcha][subdir] = "contrib"
projects[cck][subdir] = "contrib"
projects[colorbox][subdir] = "contrib"
projects[colorbox][version] = "1.x-dev"
projects[context][subdir] = "contrib"
projects[ctools][subdir] = "contrib"
projects[date][subdir] = "contrib"
; Getting dev version of date module to fix PHP 5.3 bug.
projects[date][version] = "2.x-dev"
projects[devel][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[filefield][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[imageapi][subdir] = "contrib"
projects[imagecache][subdir] = "contrib"
projects[imagefield][subdir] = "contrib"
projects[imce][subdir] = "contrib"
projects[imce_wysiwyg][subdir] = "contrib"
projects[jquery_plugin][subdir] = "contrib"
projects[jquery_ui][subdir] = "contrib"
projects[jquery_update][subdir] = "contrib"
projects[jquery_update][version] = "2.0-alpha1"
projects[menu_block][subdir] = "contrib"
projects[menutrails][subdir] = "contrib"
projects[node_import][subdir] = "contrib"
projects[nodequeue][subdir] = "contrib"
projects[nodewords][subdir] = "contrib"
projects[page_title][subdir] = "contrib"
projects[pathauto][subdir] = "contrib"
projects[rules][subdir] = "contrib"
projects[simpletest][subdir] = "contrib"
projects[site_map][subdir] = "contrib"
projects[smtp][subdir] = "contrib"
projects[strongarm][subdir] = "contrib"
projects[token][subdir] = "contrib"
projects[unlimited_css][subdir] = "contrib"
projects[vertical_tabs][subdir] = "contrib"
projects[views][subdir] = "contrib"
projects[views_slideshow][subdir] = "contrib"
projects[webform][subdir] = "contrib"
projects[wysiwyg][subdir] = "contrib"
projects[xmlsitemap][subdir] = "contrib"

; Themes
; Getting older version of Zen until we update our theme to Zen 2.0 compat.
projects[zen][version] = "1.1"
projects[zen][subdir] = "contrib"
projects[tao][location] = http://code.developmentseed.org/fserver
projects[tao][subdir] = "contrib"
projects[rubik][location] = http://code.developmentseed.org/fserver
projects[rubik][subdir] = "contrib"

; Libraries
libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip"
libraries[jquery_ui][directory_name] = "jquery.ui"
libraries[jquery_ui][destination] = "modules/contrib/jquery_ui"
libraries[tinymce][download][type] = "get"
libraries[tinymce][download][url] = "https://sourceforge.net/projects/tinymce/files/TinyMCE/3.3.9.2/tinymce_3_3_9_2.zip"
libraries[tinymce][directory_name] = "tinymce"
libraries[tinymce][destination] = "libraries"


; Install Profiles
projects[ash_profile][type] = "profile"
projects[ash_profile][download][type] = "git"
projects[ash_profile][download][url] = "git://github.com/augustash/ash_profile.git"
projects[ash_profile][download][tag] = "6.x-1.3"

; AAI Custom Modules
projects[ash_blog][type] = "module"
projects[ash_blog][subdir] = "ash"
projects[ash_blog][download][type] = "git"
projects[ash_blog][download][url] = "git://github.com/augustash/ash_blog.git"
projects[ash_blog][download][tag] = "1.0"

projects[ash_calendar][type] = "module"
projects[ash_calendar][subdir] = "ash"
projects[ash_calendar][download][type] = "git"
projects[ash_calendar][download][url] = "git://github.com/augustash/ash_calendar.git"
projects[ash_calendar][download][tag] = "1.0"

projects[ash_search][type] = "module"
projects[ash_search][subdir] = "ash"
projects[ash_search][download][type] = "git"
projects[ash_search][download][url] = "git://github.com/augustash/ash_search.git"
projects[ash_search][download][tag] = "1.0"

projects[ash_photo_gallery][type] = "module"
projects[ash_photo_gallery][subdir] = "ash"
projects[ash_photo_gallery][download][type] = "git"
projects[ash_photo_gallery][download][url] = "git://github.com/augustash/ash_photo_gallery.git"
projects[ash_photo_gallery][download][tag] = "1.0"

projects[ash_news_feed][type] = "module"
projects[ash_news_feed][subdir] = "ash"
projects[ash_news_feed][download][type] = "git"
projects[ash_news_feed][download][url] = "git://github.com/augustash/ash_news_feed.git"
projects[ash_news_feed][download][tag] = "1.0"

; AAI Base Theme
projects[squareone][type] = "theme"
projects[squareone][subdir] = "ash"
projects[squareone][download][type] = "git"
projects[squareone][download][url] = "git://github.com/augustash/squareone.git"
projects[squareone][download][tag] = "1.0"
