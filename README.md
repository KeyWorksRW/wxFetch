# wxFetch

This repository is primarily designed to be used by KeyWorks Software projects. You are welcome to use it yourself, but be aware that the repository is _not_ based on released versions of wxWidgets. It may or may not be current with the current wxWidgets dev tree -- though it will typically be close to current.

This repository is designed to be used by CMake's `FetchContent_Declare` command, and contains a snapshot of the wxWidgets dev source code. Besides eliminating the 10 submodules, it reduces the size and number of files that need to be downloaded as a dependency. For example, the initial creation of this repository had the following changes from the wxWidgets source code"

```
Original Total: 9,558 files, 666 folders, 155,896,875 bytes

versus 

New Total: 4,147 files, 236 folders, 78,803,757 bytes
```

You can use this repository as a wxWidgets dependency by placing the following in your `CMakeLists.txt` file:

```
    FetchContent_Declare(
        wxWidgets
        GIT_REPOSITORY "https://github.com/KeyWorksRW/wxFetch.git"
        GIT_SHALLOW TRUE
    )

    FetchContent_MakeAvailable( wxWidgets )
```

Alternatively, this can be added as a submodule or subtree to your own project. The one downside is that `FetchContent_Declare` will stay current with changes in this repository (unless you set FETCHCONTENT_UPDATES_DISCONNECTED). A submodule or subtree will have to be manually updated (which means you get to choose when to update).

See the wxWidgets [README](maintain/wxReadMe.md) file for information about wxWidgets.
