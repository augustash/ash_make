; Core makefile for AAI drupal sites.
; Run drush make ash_core.make
api = 2
core = 7.x


; ------------------------------------------------------------------------------
; Drupal Core
; ------------------------------------------------------------------------------

projects[drupal][type]                        = "core"
projects[drupal][version]                     = "7.22"
;projects[drupal][patch][]                    = "http://drupal.org/files/string-offset-cast-1824820-2.patch"


; ------------------------------------------------------------------------------
; Misc. Utilities
; ------------------------------------------------------------------------------

; Ctools
;
; This suite is primarily a set of APIs and tools to improve the developer
; experience. It also contains a module called the Page Manager whose job is
; to manage pages. In particular it manages panel pages, but as it grows it
; will be able to manage far more than just Panels.
; @see http://drupal.org/project/ctools
projects[ctools][subdir]                      = "contrib"
projects[ctools][version]                     = "1.2"

; Libraries
;
; common denominator for all Drupal modules/profiles/themes that integrate with
; external libraries. This module introduces a common repository for libraries
; in sites/all/libraries resp. sites/<domain>/libraries for contributed modules
; @see http://drupal.org/project/libraries
projects[libraries][subdir]                   = "contrib"
projects[libraries][version]                  = "2.1"

; Token
;
; Tokens are small bits of text that can be placed into larger documents via
; simple placeholders, like %site-name or [user]. The Token module provides a
; central API for modules to use these tokens, and expose their own token
; values.
; @see http://drupal.org/project/token
projects[token][subdir]                       = "contrib"
projects[token][version]                      = "1.5"

; Rules
;
; allows site administrators to define conditionally executed actions based
; on occurring events
; @see http://drupal.org/project/rules
projects[rules][subdir]                       = "contrib"
projects[rules][version]                      = "2.3"

; Context
;
; allows you to manage contextual conditions and reactions for different
; portions of your site. You can think of each context as representing a
; "section" of your site. For each context, you can choose the conditions
; that trigger this context to be active and choose different aspects of
; Drupal that should react to this active context.
; @see http://drupal.org/project/context
projects[context][subdir]                     = "contrib"
projects[context][version]                    = "3.0-beta6"

; Features
;
; enables the capture and management of features in Drupal. A feature is a
; collection of Drupal entities which taken together satisfy a certain use-case
; @see http://drupal.org/project/features
projects[features][subdir]                    = "contrib"
projects[features][version]                   = "2.0-beta2"

; Node Queue
;
; allows users to collect nodes in an arbitrarily ordered list.
; @see http://drupal.org/project/nodequeue
projects[nodequeue][subdir]                   = "contrib"
projects[nodequeue][version]                  = "2.0-beta1"

; Advanced Help
;
; allows module developers to store their help outside the module system,
; in pure .html files. The files can be easily translated simply by copying
; them into the right translations directory
; @see http://drupal.org/project/advanced_help
projects[advanced_help][subdir]               = "contrib"
projects[advanced_help][version]              = "1.0"

; Transliteration
;
; Provides one-way string transliteration (romanization) and cleans file names
; during upload by replacing unwanted characters.
; @see http://drupal.org/project/transliteration
projects[transliteration][subdir]             = "contrib"
projects[transliteration][version]            = "3.1"

; Valet
;
; A Drupal Quicksilver/Alfred navigation system
; @see https://github.com/JaceRider/Valet
projects[valet][subdir]                       = "contrib"
projects[valet][type]                         = "module"
projects[valet][download][type]               = "git"
projects[valet][download][url]                = "git@github.com:JaceRider/Valet.git"

; Menu Block
;
; @see http://drupal.org/project/menu_block
projects[menu_block][subdir]                  = "contrib"
projects[menu_block][version]                 = "2.3"

; Menu Position
;
; allows for the creation of rules that will dynamically add the current page
; into the menu system at the requested spots.
; @see http://drupal.org/project/menu_position
projects[menu_position][subdir]               = "contrib"
projects[menu_position][version]              = "1.1"

; QuickTabs
;
; allows you to create blocks of tabbed content, specifically views, blocks,
; nodes* and other quicktabs*. You can create a block on your site containing
; multiple tabs with corresponding content. Clicking on the tabs makes the
; corresponding content display instantly, using jQuery.
; @see http://drupal.org/project/quicktabs
projects[quicktabs][subdir]                   = "contrib"
projects[quicktabs][version]                  = "3.4"

; Redirect
;
; @see http://drupal.org/project/redirect
projects[redirect][subdir]                    = "contrib"
projects[redirect][version]                   = "1.0-rc1"

; References
;
; provides D7 versions of the 'node_reference' and 'user_reference' field types,
; that were part of the CCK package in D6, at functional parity with the D6
; counterparts.
; @see http://drupal.org/project/references
; @see http://drupal.org/node/533222 for details.
projects[references][subdir]                  = "contrib"
projects[references][version]                 = "2.1"

; SMTP
;
; allows Drupal to bypass the PHP mail() function and send email directly to an
; SMTP server. The module supports SMTP authentication and can even connect
; to servers using SSL if supported by PHP.
; @see http://drupal.org/project/smtp
projects[smtp][subdir]                        = "contrib"
projects[smtp][version]                       = "1.0"

; Strongarm
;
; gives site builders a way to override the default variable values that Drupal
; core and contributed modules ship with. It is not an end user tool, but a
; developer and site builder tool which provides an API and a limited UI
; @see http://drupal.org/project/strongarm
projects[strongarm][subdir]                   = "contrib"
projects[strongarm][version]                  = "2.0"


; ----------------------
; Links, images, etc.
; ----------------------

; Pathauto
;
; module automatically generates URL/path aliases for various kinds of content
; (i.e., nodes, taxonomy terms, users) without requiring the user to manually
; specify the path alias
; @see http://drupal.org/project/pathauto
projects[pathauto][subdir]                    = "contrib"
projects[pathauto][version]                   = "1.2"

; Linkit
;
; provides an easy interface for internal and external linking. Linkit links
; to nodes, users, managed files, terms and have basic support for all entities
; by default, using an autocomplete field.
; @see http://drupal.org/project/linkit
projects[linkit][subdir]                      = "contrib"
projects[linkit][version]                     = "2.6"

; Image Link Formatter
;
; allow an image field to be displayed with a link to a custom URL
; @see http://drupal.org/project/image_link_formatter
projects[image_link_formatter][subdir]        = "contrib"
projects[image_link_formatter][version]       = "1.x-dev"

; External Links
;
; used to differentiate between internal and external links. Using jQuery,
; it will find all external links on a page and add an external icon  indicating
; it will take you offsite or a mail icon for mailto links.
; @see http://drupal.org/project/extlink
projects[extlink][subdir]                     = "contrib"
projects[extlink][version]                    = "1.12"


; ----------------------
; Blocks, Boxes, etc.
; ----------------------

; Block Class
;
; allows users to add classes to any block through the block's configuration
; interface. By adding a very short snippet of PHP to a theme's block.tpl.php
; file, classes can be added to the parent <div class="block ..."> element
; of a block. Hooray for more powerful block theming!
; @see http://drupal.org/project/block_class
projects[block_class][subdir]                 = "contrib"

; Boxes
;
; provides an inline interface for editing blocks, allowing you to change the
; contents of blocks without going to an admin page. Boxes provides exportables
; for its blocks via the (required) Chaos tools module. This allows modules
; to provide blocks in code that can be overwritten in the UI.
;
; Chaos tools is required to use Boxes.
;
; @see http://drupal.org/project/boxes
projects[boxes][subdir]                       = "contrib"
projects[boxes][version]                      = "1.1"


; ----------------------
; Frontend
; ----------------------

; Colorbox
;
; light-weight customizable lightbox plugin for jQuery. This module allows for
; integration of Colorbox into Drupal.
; @see http://drupal.org/project/colorbox
; @see http://www.jacklmoore.com/colorbox/
projects[colorbox][subdir]                    = "contrib"
projects[jquery_update][version]              = "2.4"

; Jquery Update
;
; Upgrades the version of jQuery in Drupal core to a newer version of jQuery.
; @see http://drupal.org/project/jquery_update
; projects[jquery_update][subdir]             = "contrib"
; projects[jquery_update][version]            = "2.3"

; jQuery Plugin
;
; provides miscellaneous jQuery plugins, which can be loaded from any module
; or theme by calling `drupal_add_library('jquery_plugin', $plugin)` in Drupal 7
; @see http://drupal.org/project/jquery_plugin
projects[jquery_plugin][subdir]               = "contrib"


; ------------------------------------------------------------------------------
; Views
; ------------------------------------------------------------------------------

; Views
;
; @see http://drupal.org/project/views
projects[views][subdir]                       = "contrib"
projects[views][version]                      = "3.7"

; Views Slideshow
;
; can be used to create a slideshow of any content (not just images) that can
; appear in a View. Powered by jQuery, it is heavily customizable; you may
; choose slideshow settings for each View you create
; @see http://drupal.org/project/views_slideshow
projects[views_slideshow][subdir]             = "contrib"
projects[views_slideshow][version]            = "3.0"

; BxSlider Views Slideshow
;
; Carrousel integration with Views & Views slideshow
; BxSlider integration
; @see http://drupal.org/project/bxslider_views_slideshow
; @see http://bxslider.com/
projects[bxslider_views_slideshow][subdir]    = "contrib"
projects[bxslider_views_slideshow][version]   = "1.38"

; Draggable Views
;
; makes rows of a view "draggable" which means that they can be rearranged
; by Drag'n'Drop.
; @see http://drupal.org/project/draggableviews
projects[draggableviews][subdir]              = "contrib"
projects[draggableviews][version]             = "2.x-dev"


; ------------------------------------------------------------------------------
; Entities
; ------------------------------------------------------------------------------

; Entity (Entity API)
;
; extends the entity API of Drupal core in order to provide a unified way to
; deal with entities and their properties. Additionally, it provides an entity
; CRUD controller, which helps simplifying the creation of new entity types.
; @see http://drupal.org/project/entity
projects[entity][subdir]                      = "contrib"
projects[entity][version]                     = "1.0"

; Auto Entity Label
;
; allows hiding of entity label fields.
; @see http://drupal.org/project/auto_entitylabel
projects[auto_entitylabel][subdir]            = "contrib"
projects[auto_entitylabel][version]           = "1.1"

; ECK (Entity Construction Kit)
;
; allows the creation and management of entity types with custom properties;
; adding bundles to entity types; and fields to bundles, with the help of the
; Field UI module.
; @see http://drupal.org/project/ECK
projects[eck][subdir]                         = "contrib"
projects[eck][version]                        = "2.0-rc2"

; File Entity
;
; provides interfaces for managing files. It also extends the core file entity,
; allowing files to be fieldable, grouped into types, viewed (using display
; modes) and formatted using field formatters. File entity integrates with a
; number of modules, exposing files to Views, Entity API, Token and more.
; @see http://drupal.org/project/file_entity
projects[file_entity][subdir]                 = "contrib"
projects[file_entity][version]                = "2.0-unstable7"


; ------------------------------------------------------------------------------
; Fields or field- or form-related modules
; ------------------------------------------------------------------------------

; Maxlength
;
; allows you to set maximum length of any field on any form making use of the
; form API
; @see http://drupal.org/project/Maxlength
projects[maxlength][subdir]                   = "contrib"
projects[maxlength][version]                  = "3.0-beta1"

; Address Field
;
; defines a new field type to store international postal addresses, implementing
; a subset of the address elements defined in the xNAL standard. The field
; configuration lets you determine which elements of an address should be
; present in the field widget form and which ones should be rendered for display
; @see http://drupal.org/project/addressfield
projects[addressfield][subdir]                = "contrib"
projects[addressfield][version]               = "1.0-beta3"

; Date
;
; a flexible date/time field type Date field and a Date API
; @see http://drupal.org/project/date
projects[date][subdir]                        = "contrib"
projects[date][version]                       = "2.6"

; Link
;
; provides a standard custom content field for links. With this module links
; can be added easily to any content types and profiles and include advanced
; validating and different ways of storing internal or external links and URLs.
; It also supports additional link text title, site wide tokens for titles and
; title attributes, target attributes, css class attribution, static repeating
; values, input conversion, and many more.
; @see http://drupal.org/project/link
projects[link][subdir]                        = "contrib"
projects[link][version]                       = "1.1"

; Pathologic
;
; an input filter which can correct paths in links and images in your Drupal
; content in situations which would otherwise cause them to "break"
; @see http://drupal.org/project/pathologic
projects[pathologic][subdir]                  = "contrib"
projects[pathologic][version]                 = "2.10"

; Field Permissions
;
; allows site administrators to set field-level permissions to edit, view and
; create fields on any entity.
; @see http://drupal.org/project/field_permissions
projects[field_permissions][subdir]           = "contrib"
projects[field_permissions][version]          = "1.0-beta2"

; Field Group
;
; group fields together. All fieldable entities will have the possibility to add
; groups to wrap their fields together. Fieldgroup comes with default HTML
; wrappers like vertical tabs, horizontal tabs, accordions, fieldsets or div
; wrappers.
; @see http://drupal.org/project/field_group
projects[field_group][subdir]                 = "contrib"
projects[field_group][version]                = "1.1"

; Prepopulate
;
; allows fields in most forms to be pre-populated from the $_REQUEST variable.
; @see http://drupal.org/project/prepopulate
projects[prepopulate][subdir]                 = "contrib"
projects[prepopulate][version]                = "2.x-dev"

; Captcha
;
; challenge-response test most often placed within web forms to determine
; whether the user is human
; @see http://drupal.org/project/captcha
projects[captcha][subdir]                     = "contrib"
projects[captcha][version]                    = "1.0-beta2"

; Default Menu Link
;
; Provides the user with a check box on all content types to set the
; "provide a menu link" value to true by default.
; @see http://drupal.org/project/default_menu_link
projects[default_menu_link][subdir]           = "contrib"

; Webform
;
; module for making surveys in Drupal. After a submission, users may be sent
; an e-mail "receipt" as well as sending a notification to administrators.
; Results can be exported into Excel or other spreadsheet applications. Webform
; also provides some basic statistical review and has and extensive API for
; expanding its features.
; @see http://drupal.org/project/webform
projects[webform][subdir]                     = "contrib"

; Text Formatter
;
; provides a field display formatter to render field values as HTML or comma
; separated lists. This can currently be used on all core field types (text,
; long text, number, list, and taxonomy reference etc..) and some contributed
; fields.
; @see http://drupal.org/project/textformatter
projects[textformatter][subdir]               = "contrib"
projects[textformatter][version]              = "1.3"

; ----------------------
; WYSIWYG editors
; ----------------------

; IMCE
;
; image/file uploader and browser that supports personal directories and quota.
; @see http://drupal.org/project/imce
projects[imce][subdir]                        = "contrib"
projects[imce][version]                       = "1.7"

; IMCE Mkdir
;
; allows users to create and delete sub-directories under directories assigned
; by IMCE
; @see http://drupal.org/project/imce_mkdir
projects[imce_mkdir][subdir]                  = "contrib"
projects[imce_mkdir][version]                 = "1.0"

; IMCE WYSIWYG
;
; Allows to use IMCE module with Wysiwyg module.
; Currently supports CKEditor, FCKEditor, TinyMCE
; @see http://drupal.org/project/imce_wysiwyg
projects[imce_wysiwyg][subdir]                = "contrib"
projects[imce_wysiwyg][version]               = "1.0"

; WYSIWYG
;
; Allows to use client-side editors to edit content. It simplifies the
; installation and integration of the editor of your choice. This module
; replaces all other editor integration modules. No other Drupal module is
; required
; @see http://drupal.org/project/wysiwyg
projects[wysiwyg][subdir]                     = "contrib"
projects[wysiwyg][version]                    = "2.2"

; WYSIWYG Button Order
;
; provide the functionality of dynamically reordering buttons and adding
; separators between them. `wysiwyg` is the only dependency
; @see http://drupal.org/project/wysiwyg_button_order
projects[wysiwyg_button_order][subdir]        = "contrib"
projects[wysiwyg_button_order][version]       = "1.0-rc1"

; Media
;
; provides an extensible framework for managing files and multimedia assets,
; regardless of whether they are hosted on your own site or a 3rd party site -
; it is commonly referred to as a 'file browser to the internet'.
; @see http://drupal.org/project/media
projects[media][subdir]                       = "contrib"
projects[media][version]                      = "2.x-dev"

; Media Browser Plus
;
; enhancement module for the Media module. The focus is on UX improvements for
; Media that won't bloat the main module. Currently the additions are
;   * Adding tags to media when uploading
;   * Pulling down title and description information from web based media
;     sources
; @see http://drupal.org/project/media_browser_plus
projects[media_browser_plus][subdir]          = "contrib"
projects[media_browser_plus][version]         = "1.0-beta3"

; Media Gallery
;
; provide a rich media gallery. It currently supports images and youtube videos
; well. Other file types may or may not work as well, but the facility is there
; to add them.
; @see http://drupal.org/project/media_gallery
projects[media_gallery][subdir]               = "contrib"
projects[media_gallery][version]              = "1.0-beta7"

; Media Vimeo
;
; integrates with the Media module to make Vimeo videos available as
; file entities.
; @see http://drupal.org/project/media_vimeo
projects[media_vimeo][subdir]                 = "contrib"
projects[media_vimeo][version]                = "1.0-beta4"

; Media YouTube
;
; integrates with the Media module to make Youtube videos available as
; file entities.
; @see http://drupal.org/project/media_youtube
projects[media_youtube][subdir]               = "contrib"
projects[media_youtube][version]              = "1.0-beta2"



; ------------------------------------------------------------------------------
; Development Tools (these should not be enabled in production)
; ------------------------------------------------------------------------------

; Devel
;
; A suite of modules containing fun for module developers and themers
; @see http://drupal.org/project/devel
projects[devel][subdir]                       = "contrib"
projects[devel][version]                      = "1.3"


; ------------------------------------------------------------------------------
; SEO/SEM modules
; ------------------------------------------------------------------------------

; Google Analytics
;
; Adds the Google Analytics web statistics tracking system to your website.
; @see http://drupal.org/project/google_analytics
projects[google_analytics][subdir]            = "contrib"
projects[google_analytics][version]           = "1.3"

; Metatags Quick
;
; Meta tags support for Drupal 7 sites based on Fields API.
; @see http://drupal.org/project/metatags_quick
projects[metatags_quick][subdir]              = "contrib"
projects[metatags_quick][version]             = "2.7"

; Page Title
;
; gives you granular control over the page title. You can specify patterns for
; how the title should be structured and, on content creation pages, specify
; the page title separately to the content's title.
; @see http://drupal.org/project/page_title
projects[page_title][subdir]                  = "contrib"
projects[page_title][version]                 = "2.7"

; XML Sitemap
;
; creates a sitemap that conforms to the sitemaps.org specification. This helps
; search engines to more intelligently crawl a website and keep their results
; up to date
; @see http://drupal.org/project/xmlsitemap
projects[xmlsitemap][subdir]                  = "contrib"


; ------------------------------------------------------------------------------
; Themes
; ------------------------------------------------------------------------------

; Wraith
;
; New base theme for our Drupal projects. Utilizes Twitter Bootstrap, Sass,
; and Coffeescript
; @see https://github.com/JaceRider/Wraith
projects[wraith][type]                        = "theme"
projects[wraith][download][type]              = "git"
projects[wraith][download][url]               = "git@github.com:JaceRider/Wraith.git"


; ------------------------------------------------------------------------------
; Install Profiles
; ------------------------------------------------------------------------------

projects[ash_profile][type]                   = "profile"
projects[ash_profile][download][type]         = "git"
projects[ash_profile][download][url]          = "git://github.com/grafikchaos/ash_profile.git"
projects[ash_profile][download][branch]       = "new_core_profile"
;projects[ash_profile][download][tag]         = "7.x-1.6"

; ------------------------------------------------------------------------------
; AAI Custom Modules
; ------------------------------------------------------------------------------

; Ash Blog
;projects[ash_blog][type]                     = "module"
;projects[ash_blog][subdir]                   = "ash"
;projects[ash_blog][download][type]           = "git"
;projects[ash_blog][download][url]            = "git://github.com/augustash/ash_blog.git"
;projects[ash_blog][download][tag]            = "1.0"

; Ash Calendar
;projects[ash_calendar][type]                 = "module"
;projects[ash_calendar][subdir]               = "ash"
;projects[ash_calendar][download][type]       = "git"
;projects[ash_calendar][download][url]        = "git://github.com/augustash/ash_calendar.git"
;projects[ash_calendar][download][tag]        = "1.0"

; Ash Search
;projects[ash_search][type]                   = "module"
;projects[ash_search][subdir]                 = "ash"
;projects[ash_search][download][type]         = "git"
;projects[ash_search][download][url]          = "git://github.com/augustash/ash_search.git"
;projects[ash_search][download][tag]          = "1.0"

; Ash Gallery
;projects[ash_photo_gallery][type]            = "module"
;projects[ash_photo_gallery][subdir]          = "ash"
;projects[ash_photo_gallery][download][type]  = "git"
;projects[ash_photo_gallery][download][url]   = "git://github.com/augustash/ash_photo_gallery.git"
;projects[ash_photo_gallery][download][tag]   = "1.0"

; Ash News Feed
;projects[ash_news_feed][type]                = "module"
;projects[ash_news_feed][subdir]              = "ash"
;projects[ash_news_feed][download][type]      = "git"
;projects[ash_news_feed][download][url]       = "git://github.com/augustash/ash_news_feed.git"
;projects[ash_news_feed][download][tag]       = "1.0"
