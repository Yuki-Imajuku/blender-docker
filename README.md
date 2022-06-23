# blender-docker

```txt
Ubuntu Version: 20.04
CUDA Version: 11.3.1
Blender Version: 3.2.0
```

## Usage
- Directory Structure
    ```txt
    hoge
    ├── hoge.blend
    ├── src
    │   └── script.py
    :
    ```

- Command
    ```sh
    # build docker container
    docker build -t blender .

    # run docker container (cycles render engine)
    docker run --rm --gpus '"device=0,1"' --name blender \
        --mount type=bind,source=[path to hoge],target=/mnt \
        blender:latest \
        /mnt/hoge.blend -E CYCLES -t 0 -P /mnt/src/script.py
    ```
