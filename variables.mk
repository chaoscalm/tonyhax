
.DELETE_ON_ERROR:

.PHONY: clean

SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

# Common variables

TONYHAX_VERSION=v1.3.2

CC=mips-linux-gnu-gcc
CFLAGS=-O1 -Wall -Wextra -Wno-main -EL -march=r3000 -mabi=32 -mfp32 -mno-abicalls -fno-pic -fdata-sections -ffunction-sections -fno-builtin -nostdlib -DTONYHAX_VERSION=$(TONYHAX_VERSION)

LD=mips-linux-gnu-ld
LDFLAGS=-EL --gc-sections

OBJCOPY=mips-linux-gnu-objcopy
OBJCOPYFLAGS=-O binary

# Entry point variables

ENTRY_MCS := $(patsubst $(SELF_DIR)/entrypoints/%-tpl.mcs, %.mcs, $(wildcard $(SELF_DIR)/entrypoints/*-tpl.mcs))
ENTRY_RAW := \
	BASCUS-9415400047975 \
	BASCUS-9424400000000 \
	BASCUS-9455916 \
	BASLUS-00571 \
	BASLUS-00856 \
	BASLUS-00882CHSv1 \
	BASLUS-01066TNHXG01 \
	BASLUS-01384DRACULA \
	BASLUS-01419TNHXG01 \
	BASLUS-01485TNHXG01 \
	BASLUS-01506XSMOTOv1 \
	BESCES-0096700765150 \
	BESCES-0142000000000 \
	BESCES-0228316 \
	BESLES_01182CHSv1 \
	BESLES-01376 \
	BESLES-02618 \
	BESLES-02908TNHXG01 \
	BESLES-02909TNHXG01 \
	BESLES-02910TNHXG01 \
	BESLES-02942CHSVTRv1 \
	BESLES-03057SSBv1 \
	BESLES-03645TNHXG01 \
	BESLES-03646TNHXG01 \
	BESLES-03647TNHXG01 \
	BESLES-03827SSII \
	BESLES-03954TNHXG01 \
	BESLES-03955TNHXG01 \
	BESLES-03956TNHXG01 \
	BESLES-04095XSMOTO

ENTRY_FILES := $(ENTRY_MCS) $(ENTRY_RAW)

# Program loader variables

LOADER_FILES := tonyhax.mcs BESLEM-99999TONYHAX tonyhax.exe

# FreePSXBoot images

FREEPSXBOOT_BIOS = v2.0 v2.1 v2.2 v3.0 v4.1 v4.4 v4.5
FREEPSXBOOT_IMAGES := $(patsubst %,tonyhax_bios_%.mcd,$(FREEPSXBOOT_BIOS))
