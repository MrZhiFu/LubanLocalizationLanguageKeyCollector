set WORKSPACE=.
set UNITYPORJECTPATH=..
set LUBAN_DLL=%WORKSPACE%\Tools\Luban\Luban.dll
set CONF_ROOT=.

dotnet %LUBAN_DLL% ^
    -t all ^
    -c cs-bin ^
    -c cs-l10n-key ^
    -d bin ^
    --conf %CONF_ROOT%\luban.conf ^
    -x cs-bin.outputCodeDir=%UNITYPORJECTPATH%\Assets\GameMain\Scripts\Gen\DataTable ^
    -x cs-l10n-key.outputCodeDir=%UNITYPORJECTPATH%\Assets\GameMain\Scripts\L10nKey ^
    -x outputDataDir=%UNITYPORJECTPATH%\Assets\GameMain\Config\DataTable\Bin
pause