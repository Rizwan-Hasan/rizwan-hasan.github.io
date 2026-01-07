# ==============================================================================
# Makefile for Docker Compose Tasks
# This file translates the VS Code tasks.json into standard 'make' commands.
# ==============================================================================

# Ensure targets are not confused with files of the same name
.PHONY: live-preview deploy clean

# ------------------------------------------------------------------------------
# Default Behavior: Running 'make' with no arguments will execute the first
# target defined, which is 'live-preview'.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# 1. Live Preview (Corresponds to 'Live preview' task)
# Runs the 'liveserver' service defined in your docker-compose file, forcing a
# container recreation to ensure the latest changes are applied.
# ------------------------------------------------------------------------------
live-preview: clean
	@echo "Starting Docker Compose Live Preview (rizwan-portfolio-liveserver)..."
	docker-compose up rizwan-portfolio-liveserver --force-recreate

# ------------------------------------------------------------------------------
# 2. Deploy (Corresponds to 'Deploy' task)
# Runs the 'deploy' service, typically for staging or production deployment.
# ------------------------------------------------------------------------------
deploy: clean
	@echo "Running Docker Compose Deployment (rizwan-portfolio-deploy)..."
	docker-compose up rizwan-portfolio-deploy --force-recreate

# ------------------------------------------------------------------------------
# Helper Target: Clean
# A common helper to tear down the services started by docker-compose.
# ------------------------------------------------------------------------------
clean:
	@echo "Stopping and removing all Docker services..."
	docker-compose down
