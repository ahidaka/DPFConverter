# DPFConverter
Rewrite the source code of the Windows Audio sample driver that uses the DPF (KdPrint / DbgPrint) method to output messages to the WPP/TraceView method.

Windows Audio on GitHub (https://github.com/microsoft/Windows-driver-samples/tree/main/audio/) contains some useful audio sample drivers.

However, some of them contain macros for KdPrint/DbgPrint debug messages such as 'DPF_ENTER', making it difficult to output WPP/TraceView debug messages.

So I used a WSL2 SED script amd bash, which is often used in Linux, to rewrite these useful sample codes to output WPP/TraceView debug messages.

Of course, it is necessary to specify the Include file and change the WPP-specific settings in Visual Studio, and this simple script still has some misjudgments when rewriting. However, it is much more comfortable to use the modern WPP/TraceView debugging method than manually converting a large number of source codes, and as a result, it will definitely allow you to focus on the tasks you should be focusing on, such as debugging and operation confirmation, in a relatively short time.

## Note

To use this, it is assumed that you will manually convert the source code using WSL2 to run sed and bash. For example, in the case of the Simple Audio Sample Device Driver, the following command operations are required.

## Files
- Scrpipts/sesx.sh -- Main conversion script
- Scrpipts/dpsrch.sh -- Parent script to run for individual sources

## Example

```sh
cd audio/simpleaudiosample/source
(cd Filters; dpsrch.sh)
(cd Main; dpsrch.sh)
(cd Utiitues; dpsrch.sh)
```
