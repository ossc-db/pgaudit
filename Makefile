# contrib/pg_audit/Makefile

MODULE_big = pgaudit
OBJS = pgaudit.o $(WIN32RES)

EXTENSION = pgaudit
DATA = pgaudit--1.0.sql
PGFILEDESC = "pgAudit - An audit logging extension for PostgreSQL"

REGRESS = pgaudit

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/pgaudit
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif