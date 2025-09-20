# five-leaveengine Script

A modern and optimized FiveM script that allows players to leave their vehicle engine running when exiting. Perfect for emergency services and roleplay scenarios.

## Features

- **Engine Control**: Hold F key while exiting to keep engine running
- **Smart Lighting**: Automatic headlight control with high beams
- **Emergency Vehicle Support**: Optional restriction to emergency vehicles only
- **Multiple Notification Systems**: Support for ox_lib and native notifications
- **Performance Optimized**: Efficient code with minimal resource usage
- **Configurable**: Extensive configuration options

## Installation

1. Download the script files
2. Place in your `resources` folder
3. Add `ensure five-leaveengine` to your `server.cfg`
4. Configure settings in `config.lua`

## Dependencies

- **Optional**: `ox_lib` (for enhanced notifications)

## Configuration

Edit `config.lua` to customize the script:

```lua
Config = {
    RestrictToEmergency = false,    -- Limit to emergency vehicles only
    KeepDoorOpen = true,           -- Keep door open when exiting
    EnableHighBeams = true,        -- Enable automatic high beams
    NotificationDuration = 5000,   -- Notification duration in ms
    CheckInterval = 100,           -- Main loop check interval
    HoldDuration = 150,           -- F key hold duration required
    ExitKey = 75,                 -- F key (default)
    
    Notifications = {
        enabled = true,
        type = 'ox_lib',          -- 'native' or 'ox_lib'
        messages = {
            instruction = 'Hold ~b~F ~w~when exiting to leave engine running.',
            success = 'Engine left running!',
            restricted = 'This feature is only available for emergency vehicles.'
        }
    }
}
```

## Usage

1. Enter any vehicle (or emergency vehicle if restricted)
2. Hold **F key** while exiting the vehicle
3. Engine will remain running with lights on
4. Normal exit (without holding F) turns off lights automatically

## Key Features Explained

### Emergency Vehicle Restriction
- Set `RestrictToEmergency = true` to limit feature to emergency vehicles only
- Emergency vehicles include police cars, ambulances, fire trucks (class 18)

### Notification System
- Supports both native GTA notifications and ox_lib notifications
- Automatically detects ox_lib availability
- Customizable messages and duration

### Performance Optimization
- Efficient event handling
- Smart notification system (prevents spam)
- Optimized main loop with configurable intervals

## Compatibility

- **Framework**: Standalone (no framework required)
- **Optional**: ox_lib for enhanced notifications

## Support

For issues or questions, please create an issue on the repository.

## Credits

**Original Author**: FAXES  
**Optimization**: alpy

## License

This project is open source. Feel free to modify and distribute according to your needs.

---

*Made with ❤️ for the FiveM community*