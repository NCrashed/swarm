import std.stdio;
import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	res.render!("index.dt", req);
}

shared static this()
{
	auto router = new URLRouter;
	router.get("/", &index);
	router.get("*", serveStaticFiles("./public/"));
	
	auto settings = new HTTPServerSettings;
	settings.bindAddresses = ["127.0.0.1"];
	settings.port = 8080;	
	
	listenHTTP(settings, router);
}