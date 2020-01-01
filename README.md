# Gauges

Gauges for [Minetest](https://www.minetest.net/), a free and open source infinite
world block sandbox game.

[**Forum topic**](https://forum.minetest.net/viewtopic.php?f=11&t=10250)

## Installation

### Download the mod

To install Gauges, clone this Git repository into your Minetest's `mods/`
directory:

```bash
git clone https://github.com/minetest-mods/gauges.git
```

You can also
[download a ZIP archive](https://github.com/minetest-mods/gauges/archive/master.zip)
of Gauges. If you do so, you will need to extract the archive then rename
the resulting folder from `gauges-master` to `gauges` – this is
**absolutely** required, as the mod won't work otherwise.

### Enable the mod

Once you have installed Gauges, you need to enable it in Minetest.
The procedure is as follows:

#### Using the client's main menu

This is the easiest way to enable Gauges when playing in singleplayer
(or on a server hosted from a client).

1. Start Minetest and switch to the **Local Game** tab.
2. Select the world you want to enable Gauges in.
3. Click **Configure**, then enable `gauges` by double-clicking it
   (or ticking the **Enabled** checkbox).
4. Save the changes, then start a game on the world you enabled Gauges on.
5. Gauges should now be running on your world.

#### Using a text editor

This is the recommended way to enable the mod on a server without using a GUI.

1. Make sure Minetest is not currently running (otherwise, it will overwrite
   the changes when exiting).
2. Open the world's `world.mt` file using a text editor.
3. Add the following line at the end of the file:

```text
load_mod_gauges = true
```

If the line is already present in the file, then replace `false` with `true`
on that line.

4. Save the file, then start a game on the world you enabled Gauges on.
5. Gauges should now be running on your world.

## Version compatibility

Gauges requires Minetest 5.0.0 or newer to work as expected.

## License

Copyright © 2014-2020 Hugo Locurcio and contributors

- Code is licensed under the MIT license, see
  [`LICENSE.md`](LICENSE.md) for details.
- Textures are licensed under CC0 1.0 Universal, see
  [`LICENSE.assets.md`](LICENSE.assets.md) for details.
