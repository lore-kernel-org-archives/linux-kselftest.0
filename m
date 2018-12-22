From: sean@mess.org (Sean Young)
Date: Sat, 22 Dec 2018 11:32:29 +0000
Subject: ir test compile errors
In-Reply-To: <f209e2d2-63c7-eb0a-171d-4db193070a45@kernel.org>
References: <f209e2d2-63c7-eb0a-171d-4db193070a45@kernel.org>
Message-ID: <20181222113229.ykohcu637zadmwo3@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181222113229.e-a4F3txR3uHHQqSvf2xgne4uxUkj0IwUo5-cSSlJaI@z>

On Fri, Dec 21, 2018@09:52:32AM -0700, shuah wrote:
> Hi Sean,
> 
> I started to see compile errors on ir test. Could you please take a look and
> see if you can fix them.
> 
> 
> ir_loopback.c:32:16: error: field ‘proto’ has incomplete type
>   enum rc_proto proto;
>                 ^~~~~
> ir_loopback.c:37:4: error: ‘RC_PROTO_RC5’ undeclared here (not in a
> function)
>   { RC_PROTO_RC5, "rc-5", 0x1f7f, "rc-5" },
>     ^~~~~~~~~~~~
> ir_loopback.c:38:4: error: ‘RC_PROTO_RC5X_20’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC5’?
>   { RC_PROTO_RC5X_20, "rc-5x-20", 0x1f7f3f, "rc-5" },
>     ^~~~~~~~~~~~~~~~
>     RC_PROTO_RC5
> ir_loopback.c:39:4: error: ‘RC_PROTO_RC5_SZ’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC5X_20’?
>   { RC_PROTO_RC5_SZ, "rc-5-sz", 0x2fff, "rc-5-sz" },
>     ^~~~~~~~~~~~~~~
>     RC_PROTO_RC5X_20
> ir_loopback.c:40:4: error: ‘RC_PROTO_JVC’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC5’?
>   { RC_PROTO_JVC, "jvc", 0xffff, "jvc" },
>     ^~~~~~~~~~~~
>     RC_PROTO_RC5
> ir_loopback.c:41:4: error: ‘RC_PROTO_SONY12’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_JVC’?
>   { RC_PROTO_SONY12, "sony-12", 0x1f007f, "sony" },
>     ^~~~~~~~~~~~~~~
>     RC_PROTO_JVC
> ir_loopback.c:42:4: error: ‘RC_PROTO_SONY15’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_SONY12’?
>   { RC_PROTO_SONY15, "sony-15", 0xff007f, "sony" },
>     ^~~~~~~~~~~~~~~
>     RC_PROTO_SONY12
> ir_loopback.c:43:4: error: ‘RC_PROTO_SONY20’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_SONY15’?
>   { RC_PROTO_SONY20, "sony-20", 0x1fff7f, "sony" },
>     ^~~~~~~~~~~~~~~
>     RC_PROTO_SONY15
> ir_loopback.c:44:4: error: ‘RC_PROTO_NEC’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_JVC’?
>   { RC_PROTO_NEC, "nec", 0xffff, "nec" },
>     ^~~~~~~~~~~~
>     RC_PROTO_JVC
> ir_loopback.c:45:4: error: ‘RC_PROTO_NECX’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_NEC’?
>   { RC_PROTO_NECX, "nec-x", 0xffffff, "nec" },
>     ^~~~~~~~~~~~~
>     RC_PROTO_NEC
> ir_loopback.c:46:4: error: ‘RC_PROTO_NEC32’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_NECX’?
>   { RC_PROTO_NEC32, "nec-32", 0xffffffff, "nec" },
>     ^~~~~~~~~~~~~~
>     RC_PROTO_NECX
> ir_loopback.c:47:4: error: ‘RC_PROTO_SANYO’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_SONY20’?
>   { RC_PROTO_SANYO, "sanyo", 0x1fffff, "sanyo" },
>     ^~~~~~~~~~~~~~
>     RC_PROTO_SONY20
> ir_loopback.c:48:4: error: ‘RC_PROTO_RC6_0’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC5_SZ’?
>   { RC_PROTO_RC6_0, "rc-6-0", 0xffff, "rc-6" },
>     ^~~~~~~~~~~~~~
>     RC_PROTO_RC5_SZ
> ir_loopback.c:49:4: error: ‘RC_PROTO_RC6_6A_20’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC6_0’?
>   { RC_PROTO_RC6_6A_20, "rc-6-6a-20", 0xfffff, "rc-6" },
>     ^~~~~~~~~~~~~~~~~~
>     RC_PROTO_RC6_0
> ir_loopback.c:50:4: error: ‘RC_PROTO_RC6_6A_24’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC6_6A_20’?
>   { RC_PROTO_RC6_6A_24, "rc-6-6a-24", 0xffffff, "rc-6" },
>     ^~~~~~~~~~~~~~~~~~
>     RC_PROTO_RC6_6A_20
> ir_loopback.c:51:4: error: ‘RC_PROTO_RC6_6A_32’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC6_6A_24’?
>   { RC_PROTO_RC6_6A_32, "rc-6-6a-32", 0xffffffff, "rc-6" },
>     ^~~~~~~~~~~~~~~~~~
>     RC_PROTO_RC6_6A_24
> ir_loopback.c:52:4: error: ‘RC_PROTO_RC6_MCE’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_RC6_0’?
>   { RC_PROTO_RC6_MCE, "rc-6-mce", 0x00007fff, "rc-6" },
>     ^~~~~~~~~~~~~~~~
>     RC_PROTO_RC6_0
> ir_loopback.c:53:4: error: ‘RC_PROTO_SHARP’ undeclared here (not in a
> function); did you mean ‘RC_PROTO_SANYO’?
>   { RC_PROTO_SHARP, "sharp", 0x1fff, "sharp" },
>     ^~~~~~~~~~~~~~
>     RC_PROTO_SANYO
> ir_loopback.c: In function ‘main’:
> ir_loopback.c:101:9: error: ‘LIRC_MODE_SCANCODE’ undeclared (first use in
> this function); did you mean ‘LIRC_MODE_LIRCCODE’?
>   mode = LIRC_MODE_SCANCODE;
>          ^~~~~~~~~~~~~~~~~~
>          LIRC_MODE_LIRCCODE
> ir_loopback.c:101:9: note: each undeclared identifier is reported only once
> for each function it appears in
> 

This means that the linux/lirc.h that was included was older than v4.16,
so we should use the lirc.h from the tree, not the system.


Sean
---
>From 17b11718b270ebf70a146a3e1cb38260dcfeddbb Mon Sep 17 00:00:00 2001
From: Sean Young <sean@mess.org>
Date: Sat, 22 Dec 2018 11:24:11 +0000
Subject: [PATCH] Use lirc.h from kernel tree, not from system
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the system lirc.h is older than v4.16, you will get errors like:

ir_loopback.c:32:16: error: field ‘proto’ has incomplete type
  enum rc_proto proto;

Signed-off-by: Sean Young <sean at mess.org>
---
 tools/testing/selftests/ir/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/ir/Makefile b/tools/testing/selftests/ir/Makefile
index f4ba8eb84b95..ad06489c22a5 100644
--- a/tools/testing/selftests/ir/Makefile
+++ b/tools/testing/selftests/ir/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 TEST_PROGS := ir_loopback.sh
 TEST_GEN_PROGS_EXTENDED := ir_loopback
+APIDIR := ../../../include/uapi
+CFLAGS += -Wall -O2 -I$(APIDIR)
 
 include ../lib.mk
-- 
2.19.2
