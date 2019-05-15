From: joel at joelfernandes.org (Joel Fernandes (Google))
Date: Wed, 15 May 2019 17:35:50 -0400
Subject: [PATCH v4 0/2] kheaders fixes for -rc
Message-ID: <20190515213552.203737-1-joel@joelfernandes.org>

Linus, Greg, Masahiro, Here are some simple fixes for the kheaders feature.
Please consider these patches for an rc release. They are based on Linus's
master branch. The only difference between the last series [1] and this one is
I squashed 1/3 and 3/3 and rebased.  Thanks!

[1] https://patchwork.kernel.org/cover/10939557/

Joel Fernandes (Google) (2):
kheaders: Move from proc to sysfs
kheaders: Do not regenerate archive if config is not changed

init/Kconfig                                | 17 +++++----
kernel/Makefile                             |  4 +--
kernel/{gen_ikh_data.sh => gen_kheaders.sh} | 17 ++++++---
kernel/kheaders.c                           | 40 +++++++++------------
4 files changed, 38 insertions(+), 40 deletions(-)
rename kernel/{gen_ikh_data.sh => gen_kheaders.sh} (82%)

--
2.21.0.1020.gf2820cf01a-goog
