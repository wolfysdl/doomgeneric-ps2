################################################################
#
# $Id:$
#
# $Log:$
#

ifeq ($(V),1)
	VB=''
else
	VB=@
endif


#CC=clang  # gcc or g++
#EE_CFLAGS+=-ggdb3 -Os
EE_LDFLAGS+=-Wl,--gc-sections
EE_INCS += -I$(PS2SDK)/ports/include/SDL -I$(PS2SDK)/ports/include
EE_LDFLAGS += -L$(PS2SDK)/ports/lib -L$(PS2DEV)/gsKit/lib -L$(PS2DEV)/

#EE_CFLAGS+=-ggdb3 -Wall -DNORMALUNIX -DLINUX -DSNDSERV -D_DEFAULT_SOURCE # -DUSEASM
EE_LIBS+=-lSDL2main -lSDL2 -lpatches -lgskit -ldmakit -lps2_drivers -lm -lc -ldebug
EE_INCS+=-I$(PS2SDK)/ports/include/SDL2 -I$(PS2SDK)/ports/include

# subdirectory for objects
OBJDIR = build
EE_BIN = doomgeneric.elf

EE_OBJS = i_main.o dummy.o am_map.o doomdef.o doomstat.o dstrings.o d_event.o d_items.o d_iwad.o d_loop.o d_main.o d_mode.o d_net.o f_finale.o f_wipe.o g_game.o hu_lib.o hu_stuff.o info.o i_cdmus.o i_endoom.o i_joystick.o i_scale.o i_sound.o i_system.o i_timer.o memio.o m_argv.o m_bbox.o m_cheat.o m_config.o m_controls.o m_fixed.o m_menu.o m_misc.o m_random.o p_ceilng.o p_doors.o p_enemy.o p_floor.o p_inter.o p_lights.o p_map.o p_maputl.o p_mobj.o p_plats.o p_pspr.o p_saveg.o p_setup.o p_sight.o p_spec.o p_switch.o p_telept.o p_tick.o p_user.o r_bsp.o r_data.o r_draw.o r_main.o r_plane.o r_segs.o r_sky.o r_things.o sha1.o sounds.o statdump.o st_lib.o st_stuff.o s_sound.o tables.o v_video.o wi_stuff.o w_checksum.o w_file.o w_main.o w_wad.o z_zone.o w_file_stdc.o i_input.o i_video.o doomgeneric.o doomgeneric_sdl.o

all:	 $(EE_BIN)

clean:
	rm -rf $(OBJDIR)
	rm -f $(EE_BIN)
	rm -f $(EE_BIN).gdb
	rm -f $(EE_BIN).map
	rm -rf $(EE_OBJS)

$(EE_BIN):	$(OBJS)
#	@echo [Linking $@]
#	$(VB)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) \
#	-o $(OUTPUT) $(LIBS) -Wl,-Map,$(OUTPUT).map
#	@echo [Size]
#	-$(CROSS_COMPILE)size $(OUTPUT)

$(EE_OBJS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

#$(OBJDIR)/%.o:	%.c
#	@echo [Compiling $<]
#	$(VB)$(CC) $(CFLAGS) -c $< -o $@

print:
	@echo OBJS: $(EE_OBJS)

# Include makefiles
include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal