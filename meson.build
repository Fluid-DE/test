###########
# Project #
###########

project('com.github.alecaddd.jarvis', ['c', 'vala'],
           version: '0.alpha',
     meson_version: '>= 0.53.0'
)


###########
# Version #
###########

project_version = meson.project_version()
version_array = project_version.split('.')
project_major_version = version_array[0].to_int()
project_minor_version = version_array[1]


#################
# Default paths #
#################

project_prefix = get_option('prefix')
project_bindir = join_paths(project_prefix, get_option('bindir'))
project_localedir = join_paths(project_prefix, get_option('localedir'))
project_datadir = join_paths(project_prefix, get_option('datadir'))
project_pkgdatadir = join_paths(project_datadir, meson.project_name())
project_schemadir = join_paths(project_datadir, 'glib-2.0', 'schemas')


###########
# Options #
###########

#Compiler

vala_version_required = '0.48.2'
vala = meson.get_compiler('vala')
cc = meson.get_compiler('c')

if not vala.version().version_compare('>= @0@'.format(vala_version_required))
    error('Valac >= @0@ required!'.format(vala_version_required))
endif

#Argument

add_project_arguments([
    '-DGETTEXT_PACKAGE="' + meson.project_name() + '"',
    ],
    language:'c'
)

add_project_arguments([
        '--vapidir', join_paths(meson.current_source_dir(), 'vapi'),
        '--pkg', 'config',
    ],
    language: 'vala',
)

#Configuration file

config_h = configuration_data()

package_bugreport = 'http://bugzilla.gnome.org/enter_bug.cgi?product=' + meson.project_name()

# package
set_defines = [
  ['PACKAGE', meson.project_name()],
  ['PACKAGE_BUGREPORT', package_bugreport],
  ['PACKAGE_NAME', meson.project_name()],
  ['PACKAGE_STRING', '@0@ @1@'.format(meson.project_name(), project_version)],
  ['PACKAGE_TARNAME', meson.project_name()],
  ['PACKAGE_URL', 'https://wiki.gnome.org/Apps/Calendar'],
  ['PACKAGE_VERSION', project_version],
  ['VERSION', project_version],
  ['GETTEXT_PACKAGE', meson.project_name()],
  ['APPLICATION_ID', meson.project_name()]
]

foreach define: set_defines
  config_h.set_quoted(define[0], define[1])
endforeach

# Compiler flags

config_data = configuration_data()
config_data.set('version', meson.project_version())
config_data.set('testdata_dir', join_paths(meson.source_root(), 'data', 'tests'))
config_data.set('app_name', meson.project_name())

config_file = configure_file(
         output: 'config.h',
  configuration: config_h
)

project_config_dep = declare_dependency(
    sources: config_file,
    include_directories: include_directories('.')
)

################
# Dependencies #
################

glib_dep = dependency('glib-2.0', version: '>= 2.58.0')
gtk_dep = dependency('gtk+-3.0', version: '>= 3.22.20')
gio_dep = dependency('gio-2.0', version: '>= 2.58.0')

gnome = import('gnome')
i18n = import('i18n')
pkg = import('pkgconfig')

top_inc = include_directories('.')

data_dir = join_paths(meson.source_root(), 'data')
po_dir = join_paths(meson.source_root(), 'po')
src_dir = join_paths(meson.source_root(), 'src')


###########
# Subdirs #
###########

subdir('src')
subdir('po')
subdir('data')

meson.add_install_script('meson/post_install.py')
