#!/usr/bin/env python

import bpy
bpy.context.scene.cycles.device = 'GPU'

# Remove render type overwrite
bpy.context.scene.render.use_overwrite = False
bpy.context.scene.render.use_placeholder = True

blender_version = bpy.app.version
uses_new_api = (blender_version[0] > 2) or (blender_version[0]==2 and blender_version[1] >= 78)

if uses_new_api:
    # after blender 2.79:
    cycles_prefs = bpy.context.user_preferences.addons['cycles'].preferences
    cycles_prefs.compute_device_type = 'CUDA'
    for device in cycles_prefs.devices:
        if(device.type == 'CUDA'):
            device.use = True
        else:
            device.use = False
else:
    # before blender 2.79:
    bpy.context.user_preferences.system.compute_device_type = 'CUDA'
    bpy.context.user_preferences.system.compute_device = 'CUDA_MULTI'
