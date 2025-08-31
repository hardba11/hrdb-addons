HRDB'S CONTROL SYNAPSE ADD-ON
================================================================================

Description
-----------

This flightgear's add-on controls the UAV synapse thanks to a gui.

Installation
------------

1. see [README](../README.md)
2. you need to install [synapse aircraft](https://github.com/hardba11/synapse)

Use
------

1. you need to run 2 instances of flightgear : your aircraft and synapse, see [synapse README](https://github.com/hardba11/synapse/blob/main/README.md)

Further informations
--------------------

synapse "read" your order from your aircraft via multiplay properties :

- `/sim/multiplay/generic/string[1]`
- `/sim/multiplay/generic/string[2]`
- `/sim/multiplay/generic/int[14]`
- `/sim/multiplay/generic/int[15]`

If your aircraft already use theese properties, it won't work, sorry :(


