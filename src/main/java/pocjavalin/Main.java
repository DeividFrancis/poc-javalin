package pocjavalin;

import com.sun.jdi.Location;

import io.javalin.Javalin;

public class Main {
	public static void main(String[] args) {
		var app = Javalin.create(config -> {
//			config.addStaticFiles();
			config.spaRoot.addFile("/", "index.html");}
		).post("/api/ping", ctx -> {

					ctx.json(new Response("Pong"));
				} )
				.start(7070);
	}
	
	record Response(String message) {}
}
