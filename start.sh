#!/bin/bash

# Start the Jekyll server in the background
echo "Starting Jekyll server..."
bundle exec jekyll serve &
JEKYLL_PID=$! # Get the Process ID (PID) of the Jekyll server
echo "Jekyll server started with PID: $JEKYLL_PID"

# Open the website in the default browser
echo "Opening the website in the browser..."
open http://127.0.0.1:4000/

# Wait for the Jekyll server to finish (optional, e.g., when you press Ctrl+C)
wait $JEKYLL_PID
echo "Jekyll server stopped."