FROM mcr.microsoft.com/mssql/server
# Create work directory
RUN mkdir -p /usr/work
WORKDIR /usr/work
# Copy all scripts into working directory
COPY . /usr/work/
# Grant permissions for the import-data script to be executable
# Can't grant permissions, so run this before creating image
# RUN chmod +x /usr/work/import-data.sh
EXPOSE 1433
CMD /bin/bash ./entrypoint.sh