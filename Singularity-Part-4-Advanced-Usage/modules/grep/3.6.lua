help([[
grep 3.6
]])

local pkgName = "grep"
local version = "3.6"

whatis("Name: " .. pkgName)
whatis("Version: " .. version)

depends_on("singularity")

local bashStr = 'singularity exec -B /projects:/projects /home/tempuser03/Singularity/part4/ubuntu_hirsute.sif grep $@'

set_shell_function("grep-container",bashStr)
