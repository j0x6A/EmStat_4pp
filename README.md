# EmStat 4PP

A Windows-only Flutter application shell organized around feature views and
ViewModels.

## Project structure

- `lib/app/` composes the application and its tab navigation.
- `lib/core/` contains the shared `UsbPort` and `EmStatDevice` classes.
- `lib/features/<feature>/` contains each feature's view and ViewModel.

## Tabs

The application currently provides `README`, `Terminal`, `Switches`, `4pp`,
and `vdP` tabs. The `README` tab is a placeholder, and the feature tabs are UI
scaffolds. Hardware communication and measurement operations are not
implemented yet.

The project currently targets Windows and does not include Android platform
configuration.

## Shared objects

`EmStatApp` creates one `UsbPort` and one `EmStatDevice` at startup. The device
receives the port instance. The application also creates the ViewModels for all
five tabs. `ReadmeViewModel` has no port or device dependency.
`TerminalViewModel` receives the same port; `SwitchesViewModel`,
`FourPpViewModel`, and `VdpViewModel` receive the same device. All views receive
only their ViewModels and have no direct dependency on the port or device.
The application calls `dispose()` on these ViewModels, then the device, and
finally the port when closing normally or removing the app widget.
Both classes currently contain no communication logic.
