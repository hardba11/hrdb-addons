#This file is part of FlightGear.
#
#FlightGear is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 2 of the License, or
#(at your option) any later version.
#
#FlightGear is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with FlightGear.  If not, see <http://www.gnu.org/licenses/>.

# This is the main addon Nasal hook. It MUST contain a function
# called "main". The main function will be called upon init with
# the addons.Addon instance corresponding to the addon being loaded.
#
# This script will live in its own Nasal namespace that gets
# dynamically created from the global addon init script.
# It will be something like "__addon[ADDON_ID]__" where ADDON_ID is
# the addon identifier, such as "org.flightgear.addons.Skeleton".
#
# See $FG_ROOT/Docs/README.add-ons for info about the addons.Addon
# object that is passed to main(), and much more. The latest version
# of this README.add-ons document is at:
#
#   https://sourceforge.net/p/flightgear/fgdata/ci/next/tree/Docs/README.add-ons
#

var unload = func(addon) {
  # This function is for addon development only. It is called on addon 
  # reload. The addons system will replace setlistener() and maketimer() to
  # track this resources automatically for you.
  #
  # Listeners created with setlistener() will be removed automatically for you.
  # Timers created with maketimer() will have their stop() method called 
  # automatically for you. You should NOT use settimer anymore, see wiki at
  # http://wiki.flightgear.org/Nasal_library#maketimer.28.29
  #
  # Other resources should be freed by adding the corresponding code here,
  # e.g. myCanvas.del();
}

var main = func(addon) {
  var root               = addon.basePath;
  var myAddonId          = addon.id;
  var mySettingsRootPath = "/addons/by-id/" ~ myAddonId;

  print("--- LOADING ADDON "~ myAddonId ~" initialized from path "~ root ~" ---");


  var model_name = getprop("/sim/model/name") or '';
  var my_alias = nil;
  var my_prop = nil;

  for(var wingman = 0 ; wingman < 3 ; wingman += 1)
  {
    my_alias = props.globals.getNode("/gear/gear[0]/position-norm");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/gear/gear[0]/position-norm").alias(my_alias);
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/gear/gear[1]/position-norm").alias(my_alias);
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/gear/gear[2]/position-norm").alias(my_alias);
    # if aircraft is brsq, wingmens will have the same config (stores, livery, etc)
    if(model_name == 'brsq')
    {
      my_alias = props.globals.getNode("/sim/multiplay/generic/int[0]");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/int[0]").alias(my_alias);

      my_alias = props.globals.getNode("/sim/multiplay/generic/int[1]");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/int[1]").alias(my_alias);

      my_alias = props.globals.getNode("/sim/multiplay/generic/int[2]");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/int[2]").alias(my_alias);

      my_alias = props.globals.getNode("/sim/model/canopy-pos-norm");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[0]").alias(my_alias);

      my_alias = props.globals.getNode("/controls/lighting/formation-lights");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[2]").alias(my_alias);

      my_alias = props.globals.getNode("/engines/engine[0]/reheat");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[8]").alias(my_alias);

      my_alias = props.globals.getNode("/engines/engine[1]/reheat");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[9]").alias(my_alias);

      my_alias = props.globals.getNode("/sim/model/livery/file");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/model/livery/file").alias(my_alias);

      my_alias = props.globals.getNode("/sim/model/livery/texture");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/model/livery/texture").alias(my_alias);

      my_alias = props.globals.getNode("/sim/model/livery/texture-tank");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/model/livery/texture-tank").alias(my_alias);

      my_alias = props.globals.getNode("/sim/model/livery/texture-gears");
      my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/model/livery/texture-gears").alias(my_alias);
    }
    else
    {
      setprop("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/int[0]", 31);
      setprop("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/int[1]", 160);
      setprop("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/int[2]", 487);
    }

    my_alias = props.globals.getNode("/gear/gear[0]/rollspeed-ms");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[4]").alias(my_alias);

    my_alias = props.globals.getNode("/gear/gear[1]/rollspeed-ms");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[5]").alias(my_alias);

    my_alias = props.globals.getNode("/gear/gear[2]/rollspeed-ms");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[6]").alias(my_alias);

    my_alias = props.globals.getNode("/gear/gear[0]/steering-norm");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[7]").alias(my_alias);

    my_alias = props.globals.getNode("/gear/gear[0]/wow");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[10]").alias(my_alias);

    my_alias = props.globals.getNode("/gear/gear[1]/wow");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[11]").alias(my_alias);

    my_alias = props.globals.getNode("/gear/gear[2]/wow");
    my_prop = props.globals.getNode("/ai/models/wingman["~ wingman ~"]/sim/multiplay/generic/float[12]").alias(my_alias);

   }

}






