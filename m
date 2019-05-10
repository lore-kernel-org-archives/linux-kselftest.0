From: joel at joelfernandes.org (Joel Fernandes (Google))
Date: Fri, 10 May 2019 17:02:40 -0400
Subject: [PATCH 0/3] kheaders fixes for -rc
Message-ID: <20190510210243.152808-1-joel@joelfernandes.org>

Linus, Greg, Masahiro,
Here are some simple fixes for the kheaders feature. Please consider these
patches for an rc release. They are based on Linus's master branch. Thanks!

Joel Fernandes (Google) (3):
kheaders: Move from proc to sysfs
kheaders: Do not regenerate archive if config is not changed
kheaders: Make it depend on sysfs

init/Kconfig                                | 17 +++++----
kernel/Makefile                             |  4 +--
kernel/{gen_ikh_data.sh => gen_kheaders.sh} | 17 ++++++---
kernel/kheaders.c                           | 40 +++++++++------------
4 files changed, 38 insertions(+), 40 deletions(-)
rename kernel/{gen_ikh_data.sh => gen_kheaders.sh} (82%)

--
2.21.0.1020.gf2820cf01a-goog
