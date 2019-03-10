FROM openhab/openhab:latest

# add non-free repository for dependencies
RUN sed -i "s/stretch main/stretch main contrib non-free/" /etc/apt/sources.list

# install runtime dependencies
RUN apt-get update && apt-get install -y apt-utils && \
		DEBIAN_FRONTEND=noninteractive apt-get install -y \
		libttspico0 \
		libttspico-utils \
		libttspico-dev \
		libttspico-data \
		lame && \
	apt-get clean && rm -r /var/lib/apt/lists/*
