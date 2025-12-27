# Version - these values are mastered here and overwrite the generated values in makefiles for Debug and Release
LIBDEVMAJOR = 1
LIBDEVMINOR = 0
LIBDEVDATE = '26.12.2025'

RELEASEDIR = Release
DEBUGDIR = Debug
RELEASE = $(RELEASEDIR)/makefile
DEBUG = $(DEBUGDIR)/makefile

# optimised and release version
#optdepth
# defines the maximum depth of function calls to be Mined. The
# range is 0 to 6, and the default value is 3.
PRODCOPTS = DEFINE=DEBUG_SERIAL NOSTACKCHECK OPTIMIZE Optimizerinline OptimizerInLocal OptimizerLoop OptimizerComplexity=30 OptimizerGlobal OptimizerDepth=6 OptimizerTime OptimizerSchedule OptimizerPeephole PARAMETERS=stack

# debug version build options
DBGCOPTS = DEFINE=_DEBUG DEFINE=DEBUG_SERIAL debug=full NOSTACKCHECK

all: $(RELEASE) $(DEBUG)
	execute <<
		cd $(RELEASEDIR)
		smake LIBDEVMAJOR=$(LIBDEVMAJOR) LIBDEVMINOR=$(LIBDEVMINOR) LIBDEVDATE=$(LIBDEVDATE) LIBDEVNAME=$(LIBDEVNAME) DEVICENAME=$(DEVICENAME)
		cd /
		<
	execute <<
		cd $(DEBUGDIR)
		smake LIBDEVMAJOR=$(LIBDEVMAJOR) LIBDEVMINOR=$(LIBDEVMINOR) LIBDEVDATE=$(LIBDEVDATE) LIBDEVNAME=$(LIBDEVNAME) DEVICENAME=$(DEVICENAME)
		cd /
		<
	
clean:
	execute <<
		cd $(RELEASEDIR)
		smake clean
		cd /
		<
	execute <<
		cd $(DEBUGDIR)
		smake clean
		cd /
		<
	
$(RELEASE): makefile.master makefile
	copy makefile.master $(RELEASE)
	splat -o "^SCOPTS.+\$" "SCOPTS = $(PRODCOPTS)" $(RELEASE)
	
$(DEBUG): makefile.master makefile
	copy makefile.master $(DEBUG)
	splat -o "^SCOPTS.+\$" "SCOPTS = $(DBGCOPTS)" $(DEBUG)
