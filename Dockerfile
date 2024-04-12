# Use the official Ubuntu 20.04 LTS image as a base
FROM ubuntu:jammy

# Change this to desired username
ENV USERNAME=default-user

# Update package lists and install essential packages
RUN apt-get update && \
    apt-get install -y \
    git \
    gcc-avr \
    avr-libc \
    avrdude \
    gdb-avr \
    simavr  \
    make    \
    man-db  \
    clang-format

# Add AVR-GCC binaries to PATH
ENV PATH="/opt/avr-gcc-${AVR_GCC_VERSION}/bin:${PATH}"

# Unminimize the base image so we have access to man pages becuase we love them!
RUN yes | unminimize

# Set root user password to 'password'
RUN echo "root:password" | chpasswd

# Create user
RUN useradd --create-home --shell /bin/bash ${USERNAME}

# Set permissions for the user's home directory
RUN chmod -R u=rwx /home/${USERNAME}

# Switch to the newly created user
USER ${USERNAME}

# Set the working directory to the user's home directory
WORKDIR /home/${USERNAME}

# Specify the command to run when the container starts
CMD ["/bin/bash"]
