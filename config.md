# Important
This is a developer file. The developer uses it to update the settings stored in this repo.

By the way, I'm the developer :)

# Kitty settings (terminal)

``` sh
rm -rf ./config/kitty/
cp  -r ~/.config/kitty/ ./config/
```

# Hyprland and Hyprpaper settings (Walpaper and desktop)

``` sh
rm -rf ./config/hypr/
cp  -r ~/.config/hypr/ ./config/
```

Image:

``` sh
cp ~/Imágenes/mythical-dragon-beast-anime-style.jpg ./
```

# nvim settings (code editor) 

``` sh
rm -rf ./config/nvim/
cp  -r ~/.config/nvim/ ./config/
```
# others settings

``` sh
cp ~/.bashrc ./bashrc
cp ~/.zshrc ./zshrc
cp ~/.gitconfig ./gitconfig
```

# Packages installed in Arch
Update file in git:

``` sh
pacman -Qqe > pkglist.txt
```

Download Packages:
``` sh
sudo pacman -S --needed - < pkglist.txt
```
