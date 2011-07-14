; Drupal core version
core = 7.x
projects[drupal][type] = core

; drush make API version
api = 2

; Contrib Modules
projects[advanced_help][subdir] = "contrib"
projects[block_class][subdir] = "contrib"
projects[block_class][version] = "1.x-dev"
projects[boxes][subdir] = "contrib"
projects[boxes][version] = "1.0-beta3"
projects[captcha][subdir] = "contrib"
projects[captcha][version] = "1.0-alpha3"
projects[colorbox][subdir] = "contrib"
projects[context][subdir] = "contrib"
projects[ctools][subdir] = "contrib"
projects[date][subdir] = "contrib"
projects[devel][subdir] = "contrib"
projects[extlink][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[imce][subdir] = "contrib"
projects[imce_wysiwyg][subdir] = "contrib"
projects[jquery_plugin][subdir] = "contrib"
projects[menu_block][subdir] = "contrib"
projects[menu_position][subdir] = "contrib"
projects[metatags_quick][subdir] = "contrib"
projects[nodequeue][subdir] = "contrib"
projects[nodequeue][version] = "2.0-alpha2"
projects[page_title][subdir] = "contrib"
projects[pathauto][subdir] = "contrib"
projects[quicktabs][subdir] = "contrib"
projects[rules][subdir] = "contrib"
projects[smtp][subdir] = "contrib"
projects[smtp][version] = "1.x-dev"
projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0-beta2"
projects[token][subdir] = "contrib"
projects[views][subdir] = "contrib"
projects[views_slideshow][subdir] = "contrib"
projects[views_slideshow][version] = "3.0-alpha1"
projects[webform][subdir] = "contrib"
projects[wysiwyg][subdir] = "contrib"
projects[xmlsitemap][subdir] = "contrib"

; Themes
projects[tao][subdir] = "contrib"
projects[rubik][subdir] = "contrib"
projects[framework][subdir] = "contrib"

; Libraries
libraries[tinymce][download][type] = "get"
libraries[tinymce][download][url] = "https://sourceforge.net/projects/tinymce/files/TinyMCE/3.3.9.2/tinymce_3_3_9_2.zip"
libraries[tinymce][directory_name] = "tinymce"
libraries[tinymce][destination] = "libraries"


; Install Profiles
projects[ash_profile][type] = "profile"
projects[ash_profile][download][type] = "git"
projects[ash_profile][download][url] = "git://github.com/augustash/ash_profile.git"
projects[ash_profile][download][tag] = "7.x-1.0"

; AAI Custom Modules
;projects[ash_blog][type] = "module"
;projects[ash_blog][subdir] = "ash"
;projects[ash_blog][download][type] = "git"
;projects[ash_blog][download][url] = "git://github.com/augustash/ash_blog.git"
;projects[ash_blog][download][tag] = "1.0"

;projects[ash_calendar][type] = "module"
;projects[ash_calendar][subdir] = "ash"
;projects[ash_calendar][download][type] = "git"
;projects[ash_calendar][download][url] = "git://github.com/augustash/ash_calendar.git"
;projects[ash_calendar][download][tag] = "1.0"

;projects[ash_search][type] = "module"
;projects[ash_search][subdir] = "ash"
;projects[ash_search][download][type] = "git"
;projects[ash_search][download][url] = "git://github.com/augustash/ash_search.git"
;projects[ash_search][download][tag] = "1.0"

;projects[ash_photo_gallery][type] = "module"
;projects[ash_photo_gallery][subdir] = "ash"
;projects[ash_photo_gallery][download][type] = "git"
;projects[ash_photo_gallery][download][url] = "git://github.com/augustash/ash_photo_gallery.git"
;projects[ash_photo_gallery][download][tag] = "1.0"

;projects[ash_news_feed][type] = "module"
;projects[ash_news_feed][subdir] = "ash"
;projects[ash_news_feed][download][type] = "git"
;projects[ash_news_feed][download][url] = "git://github.com/augustash/ash_news_feed.git"
;projects[ash_news_feed][download][tag] = "1.0"

; AAI Base Theme
;projects[squareone][type] = "theme"
;projects[squareone][subdir] = "ash"
;projects[squareone][download][type] = "git"
;projects[squareone][download][url] = "git://github.com/augustash/squareone.git"
;projects[squareone][download][tag] = "1.0"

