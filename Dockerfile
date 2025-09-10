FROM python:3.10-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Install git
RUN sed -i 's|deb.debian.org/debian|archive.debian.org/debian|g' /etc/apt/sources.list \
 && sed -i '/security.debian.org/s|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid \
 && apt-get update && apt-get install -y git

# Qui' sotto metti il link del mediaflow-proxy che vuoi utilizzare opuure lascialo cosi se vuoi utilizzare quello originale
# nel caso hai un tuo MFP diverso sostituisci https://github.com/mhdzumair/mediaflow-proxy con il tuo lasciando invariato quello che viene dopo
RUN git clone https://github.com/nzo66/mediaflow-proxy.git temp_mediaflow
# Questo non toccarlo
RUN git clone https://github.com/nzo66/HF-MFP.git temp_hfmfp

# Copy all files from both repositories to the main directory
RUN cp -r temp_mediaflow/* . 2>/dev/null || true
RUN cp -r temp_hfmfp/* . 2>/dev/null || true

# Remove temporary directories
RUN rm -rf temp_mediaflow temp_hfmfp

# Copy the local config.json file to the container

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt \
 && pip install --no-cache-dir psutil


EXPOSE 7860

# Run run.py when the container launches
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]
