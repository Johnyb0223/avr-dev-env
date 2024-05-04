# AVR Development Container

This Dockerfile provides a simple Linux environment for developing with [AVR microcontrollers](https://en.wikipedia.org/wiki/AVR_microcontrollers).

## Usage (Visual Studio Code Dev Containers)

To utilize this container with Visual Studio Code's Dev Containers extension, follow these steps:

1. Ensure Docker is installed on your system. If not, install it from [here](https://docs.docker.com/get-docker/).
2. Ensure Docker daemon is running.
3. Install the Docker extension and Dev Containers extension in Visual Studio Code.

The Dev Containers extension expects there to be a `.devcontainer` directory in the root of your project. Thats what this repository is for. You can add it to your project as a submodule by running the following command in your project directory:

```bash 
git submodule add https://github.com/Johnyb0223/avr-dev-env.git .devcontainer
```

see we have named it `.devcontainer`. Now all you have to do is initiate the Dev Container extension and it will open the project in the container. To do this click on the blue icon in the bottom left corner and select "Reopen in Container".

The `devcontainer.json` file should look like this.

```json
{
    "name": "avr-dev-env",
    "dockerFile": "${localWorkspaceFolder}/avr-dev-env/Dockerfile"
}
```

Now in the bottom left corner of Visual Studio Code, you should see a blue icon right below the gear icon. Click on this icon and select "Reopen in Container". This will build the container and open a new window in the container.

## Features

- **AVR Toolchain**: Includes avr-gcc, avrdude, avr-gdb, avr-libc, simavr, make, and git.
- **Man Pages**: Comes with man pages enabled for Linux utilities and AVR toolchain.
- **Clang-Format**: Includes a local installation of clang-format for formatting code. Add the following line to your vscode settings.json to have your files formatted on save.

    ```json
    "editor.formatOnSave": true
    ```
    If this doesn't work you need to ensure you have the clang-format vscode extension installed locally in the container.

## Useful Resources

- [avr-libc documentation](https://www.nongnu.org/avr-libc/user-manual/index.html): very useful user manuals and FAQs for AVR microcontrollers.
- [avrdude documentation](https://avrdudes.github.io/avrdude/6.4/avrdude.pdf)
- [interesting and helpful examples](http://www.rjhcoding.com/index.php)
- [simavr and gdb Debugging Tips](https://aykevl.nl/2020/06/simavr-debug/): Tips for debugging with simavr and gdb.
