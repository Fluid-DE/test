src_inc = include_directories('.')

################
# Dependencies #
################

project_deps = [
  glib_dep,
  gtk_dep,
  gio_dep,
  project_config_dep,
]

#######################
# Include directories #
#######################

dashboard_incs = [
  top_inc,
  include_directories('.'),
]

###################
# Private library #
###################

file = files()

file += gnome.compile_resources(
  'my-resources','my-resources.xml',
  c_name: 'gui',
)

file += [
'main.vala',
'application.vala',
'window.vala',
'mywidget.vala',
]




##############
# Executable #
##############
executable (
    meson.project_name (),
    file,
    dependencies : [
        project_deps,
    ],
    install: true,
    install_dir: project_bindir,
)


