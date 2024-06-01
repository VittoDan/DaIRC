#!/bin/sh

/bin/bash Examples/advanced/massplitterscript/buildup.sh
/bin/bash Examples/advanced/massplitterscript/serverlaunch.sh &
/bin/bash Examples/advanced/massplitterscript/socketlaunch.sh &
/bin/bash Examples/advanced/massplitterscript/nodeserver.sh &
/bin/bash Examples/advanced/massplitterscript/tmuxlaunch.sh

