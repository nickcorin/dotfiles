#!/usr/bin/env python3

from distutils import spawn
import os
import subprocess
import sys


def main():
    if spawn.find_executable("git") is None:
        print("cannot continue without git installed")
        sys.exit(1)

    base_dir = os.getenv("HOME", "~")
    dotfiles_dir = os.path.join(base_dir, "dotfiles")

    if not os.path.exists(dotfiles_dir):
        print("dotfiles does not exist, cloning")
        git_clone("git@github.com:nickcorin/dotfiles.git", dotfiles_dir)
    else:
        print("dotfiles exists, pulling latest")
        git_pull(dotfiles_dir)

    config_dir = os.getenv("XDG_CONFIG_HOME", os.path.join(base_dir, ".config")) 

    symlinks = [
            (os.path.join(dotfiles_dir, "zshrc"), os.path.join(base_dir, ".zshrc")),
            (os.path.join(dotfiles_dir, ".config"), config_dir),
    ]

    for (src, target) in symlinks:
        create_symlinks(src, target)


def create_symlinks(src: str, target: str, depth: int = 0, max_depth: int = 1):
    if os.path.isdir(src) and depth < max_depth:
        for file in os.listdir(src):
            create_symlinks(os.path.join(src, file), os.path.join(target, file), depth+1, max_depth)
            pass
    else:
        try:
            print(f"creating symlink: '{target}' -> '{src}'")
            os.symlink(src, target)
        except FileExistsError:
            # We don't care about this, we can just skip for now. Perhaps in the future we can provide optional
            # functionality to check whether the existing file /  directory is a symlink and if not, then it is
            # overwritten.
            pass
        except:
            # Pass through all other exceptions.
            raise




def git_clone(repository_uri: str, target_dir: str):
    print("cloning dotfiles repository")
    subprocess.run([f"git clone {repository_uri} {target_dir}"], shell=True)


def git_pull(repository_dir: str, branch: str="master"):
    print(f"pulling latest {branch}")
    os.chdir(repository_dir)
    subprocess.run([f"git pull origin {branch}"], shell=True)


if __name__ == "__main__":
    main()
