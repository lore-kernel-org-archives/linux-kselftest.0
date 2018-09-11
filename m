From: alexey.skidanov at intel.com (Alexey Skidanov)
Date: Tue, 11 Sep 2018 20:29:27 +0300
Subject: ion selftest compilation failed
Message-ID: <d81022fe-7fa6-2371-d6c2-057bb552d125@intel.com>

Hi,

ION selftest compilation failed with the following error on my machine:

ionmap_test.c:12:27: fatal error: linux/dma-buf.h: No such file or directory

I have resolved it by exporting kernel headers for user space:

make headers_install INSTALL_HDR_PATH=/usr

Probably it should be part of the make file?

Tthanks,
Alexey
