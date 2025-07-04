#!/bin/bash
echo '****' $1 $2
cd $1;
mv $2 $2.org

sed -e 's/DPF(D_BLAB, ("\(.*\)")/TraceEvents(TRACE_LEVEL_INFORMATION, TRACE_DRIVER, "%!FUNC! \1"/' \
    -e 's/DPF(D_TERSE, ("\[%s.*.*ntStatus))/TraceEvents(TRACE_LEVEL_INFORMATION, TRACE_DRIVER, "%!FUNC! ntStatus=%!STATUS!", ntStatus)/' \
    -e 's/DPF(D_TERSE, ("\(.*\))/TraceEvents(TRACE_LEVEL_ERROR, TRACE_DRIVER, "%!FUNC! \1/' \
    -e 's/DPF(D_VERBOSE, (\(".*\))/TraceEvents(TRACE_LEVEL_VERBOSE, TRACE_DRIVER, "%!FUNC! \1/' \
    -e 's/DPF(D_BLAB, (\(".*\))/TraceEvents(TRACE_LEVEL_INFORMATION, TRACE_DRIVER, "%!FUNC! \1/' \
    -e 's/DPF(D_VERBOSE, ("\(.*\)")/TraceEvents(TRACE_LEVEL_ERROR, TRACE_DRIVER, "%!FUNC! \1"/' \
    -e 's/DPF(D_TERSE, ("\(.*\)")/TraceEvents(TRACE_LEVEL_ERROR, TRACE_DRIVER, "%!FUNC! \1"/' \
    -e 's/DPF(D_ERROR, ("\(.*\)")/TraceEvents(TRACE_LEVEL_ERROR, TRACE_DRIVER, "%!FUNC! \1"/' \
    -e 's/DPF(D_ERROR, ("\(.*\)",\(.*\))/TraceEvents(TRACE_LEVEL_ERROR, TRACE_DRIVER, "%!FUNC! \1", \2/' \
    -e 's/DPF_ENTER((".*N__))/TraceEvents(TRACE_LEVEL_INFORMATION, TRACE_DRIVER, "%!FUNC! Enter")/' \
    -e 's/DPF_ENTER(("\(.*\))/TraceEvents(TRACE_LEVEL_INFORMATION, TRACE_DRIVER, "%!FUNC! \1/' \
    $2.org > $2
