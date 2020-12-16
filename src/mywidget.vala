using Gtk;

[GtkTemplate (ui = "/org/foo/my/mywidget.ui")]
public class Jarvis.MyWidget : Box {

	public string text {
		get { return entry.text; }
		set { entry.text = value; }
	}

	[GtkChild]
	public Entry entry;

	public MyWidget (string text) {
		this.text = text;
	}
	
}
