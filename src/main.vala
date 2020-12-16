public static int main (string[] args) {

	Intl.setlocale (LocaleCategory.ALL, "");
	Intl.textdomain (GETTEXT_PACKAGE);

	Intl.setlocale (LocaleCategory.ALL, "it_IT");

	Environment.set_application_name (PACKAGE_NAME);
	print ("value-type : %s\n", PACKAGE_NAME);
	print ("Testo : %s\n", _("TEST"));
	Environment.set_prgname (PACKAGE_NAME);

	var application = new Application ();

	return application.run (args);
}
