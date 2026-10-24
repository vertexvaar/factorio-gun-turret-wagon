# Machine Gun Wagon

Factorio 2.1 mod (Space Age optional). A cargo wagon with three machine gun turrets on its roof. The guns work like
gun turrets, also while the train is moving, and reload from magazines in the wagon's cargo.

- Put any bullet magazines into the wagon (10 slots). Each gun keeps 10 magazines loaded.
- The guns turn and unfold faster than a gun turret, so they can hit targets while passing.
- Turret damage and shooting speed research applies as usual. Wagon quality carries over to the guns.
- Works on elevated rails.
- Unlocked by the technology "Machine gun wagon" (after railway and gun turret).

## How it works

Factorio has no turrets on rolling stock. Each wagon gets three hidden turrets (not selectable, not attackable,
no collision). While the wagon moves, the script teleports them along with it every tick; standing wagons cost
nothing per tick. Every 30 ticks the guns are topped up from the wagon. Mining the wagon returns the loaded magazines.

## Tests

    python tests/run.py                 # headless, with Space Age
    python tests/run.py --no-space-age
    python tests/shots.py               # opens a game window briefly, writes previews/shots/*.png

## Release

    python tools/package.py             # dist/<name>_<version>.zip
    python tools/publish.py publish     # first release (needs FACTORIO_API_KEY)
    python tools/publish.py upload      # later releases
