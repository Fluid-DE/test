public class Application : Gtk.Application {

	public Application () {
		Object (
			application_id: "com.github.alecaddd.jarvis",
			flags: ApplicationFlags.FLAGS_NONE
		);
	}

	protected override void activate () {
		var metro = new Jarvis.Window (this);
		add_window (metro);
	}
}
