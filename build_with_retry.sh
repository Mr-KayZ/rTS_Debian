#!/bin/bash

# Configuration
MAX_RETRIES=3
LOG_FILE="docker_log.txt"
BUILD_TAG="rts-debian"

# Clear previous log
> "$LOG_FILE"

echo "Starting Docker build with automatic retry..."
echo "Log file: $LOG_FILE"
echo "----------------------------------------"

for attempt in $(seq 1 $MAX_RETRIES); do
    echo "Attempt $attempt of $MAX_RETRIES..."
    echo "=== Build Attempt $attempt - $(date) ===" >> "$LOG_FILE"
    
    # Run docker build and capture output
    docker build -t "$BUILD_TAG" . 2>&1 | tee -a "$LOG_FILE"
    DOCKER_EXIT_CODE=${PIPESTATUS[0]}
    
    # Check for actual build failures in the log (live-build errors)
    if grep -q "E: An unexpected failure occurred, exiting..." "$LOG_FILE" || \
       grep -q "E: Sub-process /usr/bin/dpkg returned an error code" "$LOG_FILE" || \
       grep -q "Errors were encountered while processing:" "$LOG_FILE" || \
       [ $DOCKER_EXIT_CODE -ne 0 ]; then
        
        echo "Build failed on attempt $attempt"
        echo "=== BUILD FAILED ===" >> "$LOG_FILE"
        
        # Extract errors and warnings from log
        echo "" >> "${LOG_FILE}.errors"
        echo "=== ERRORS - Attempt $attempt - $(date) ===" >> "${LOG_FILE}.errors"
        
        # Capture dpkg/apt errors
        grep -E "(E: Sub-process|E: An unexpected failure|Errors were encountered while processing:|Failed to fetch|Unable to locate package|E: Package.*has no installation candidate|Err:|E:)" "$LOG_FILE" >> "${LOG_FILE}.errors" 2>/dev/null
        
        # Capture which packages failed
        sed -n '/Errors were encountered while processing:/,/^$/p' "$LOG_FILE" >> "${LOG_FILE}.errors" 2>/dev/null
        
        echo "" >> "${LOG_FILE}.errors"
        echo "=== WARNINGS - Attempt $attempt ===" >> "${LOG_FILE}.errors"
        grep -E "(W:|WARNING|Warning:)" "$LOG_FILE" >> "${LOG_FILE}.errors" 2>/dev/null
        
        if [ $attempt -lt $MAX_RETRIES ]; then
            echo "Retrying in 5 seconds..."
            sleep 5
        fi
    else
        echo "Build succeeded on attempt $attempt"
        echo "=== BUILD SUCCESSFUL ===" >> "$LOG_FILE"
        
        # Extract warnings even on success for review
        echo "" >> "$LOG_FILE"
        echo "=== WARNINGS SUMMARY ===" >> "$LOG_FILE"
        grep -E "(W:|WARNING|Warning:)" "$LOG_FILE" >> "$LOG_FILE" 2>/dev/null || echo "No warnings found" >> "$LOG_FILE"
        
        exit 0
    fi
done

echo ""
echo "============================================="
echo "Build failed after $MAX_RETRIES attempts"
echo "Check $LOG_FILE for details"
echo "Errors and warnings summary saved to: ${LOG_FILE}.errors"
echo "============================================="
exit 1
