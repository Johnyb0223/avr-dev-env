# AVR Development Container

This Docker container provides a simple Linux environment for developing with [AVR microcontrollers](https://en.wikipedia.org/wiki/AVR_microcontrollers).

## Usage

First ensure that you have Docker installed on your system. If you don't, you can install it by following the instructions [here](https://docs.docker.com/get-docker/). Also make sure the Docker daemon is running.

Next, clone this repository to your local machine.

Go into the Dockerfile and change the username to your desired username. Then, build the image with the command

```bash
docker build -t "avr-dev-env":"latest" .
```

 This will build the image and tag it as `avr-dev-env:latest`.

During the build process a home directory is automatically created for the specified user. The home directory is `/home/<username>` and is empty by default.

The workflow I currently use is to then navigate to whatever directory I want to work in and mount it to the container. This is done using the `-v` flag when starting the container. For example, to mount the current directory to the container, use the command

```bash
docker run -it -v $(pwd):/home/<username>/src avr-dev-env:latest`
```

where `<username>` is the username you specified in the Dockerfile. All the files in the current working directory will be found in the `/home/<username>/src` directory.

**Note:** I have it setup so that the created user has read/write/execute permissions for all files under the `/home/<username>` directory. This should work correctly. If not you may have to set permissions yourself and even broader you may find yourself needing to execute commands in the container as the root user. You can change the current user with the command `su <username>`. For example to change to the root user, use the command `su -` and I have conveniently set the password to `password`. I would then use the command `su <username>` to change back to the my specified user.

## Features

- **AVR Toolchain**: Includes avr-gcc, avrdude, avr-gdb, avr-libc, simavr, make, and git.
- **Man Pages**: Comes with man pages enabled for Linux utilities and AVR toolchain.

## Useful Resources

- [avr-libc documentation](https://www.nongnu.org/avr-libc/user-manual/index.html): very useful user manuals and FAQs for AVR microcontrollers.
- [avrdude documentation](https://avrdudes.github.io/avrdude/6.4/avrdude.pdf)
- [interesting and helpful examples](http://www.rjhcoding.com/index.php)
- [simavr and gdb Debugging Tips](https://aykevl.nl/2020/06/simavr-debug/): Tips for debugging with simavr and gdb.
