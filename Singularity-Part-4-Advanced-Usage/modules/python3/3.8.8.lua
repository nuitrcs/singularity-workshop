help([[
Python 3.8.8 from anaconda
]])

local pkgName = "python3"
local version = "3.8.8"

whatis("Name: " .. pkgName)
whatis("Version: " .. version)

depends_on("singularity")

local bashStr = 'singularity exec -B /projects:/projects /projects/w10001/tempuser03/Singularity/part4/anaconda3_latest.sif python3 $@'

set_shell_function("python3",bashStr)
