from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b"<h1>PRT - Food Delivery App Deployment Successful</h1>")

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 5000), Handler)
    server.serve_forever()
