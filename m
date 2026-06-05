Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81C481247
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646340; cv=none; b=Qm9Y9ecnBwANWGM593IvfC23HZVK+XpK9DxJlbhSShDetrhYbjfp/ALk6XoYg6a/gO77K6hNSP/ARoJb7Pr2+sE+lKM8N06LKRBdv/7Vadu6vjztbf/Blf+CoOS/bDmtDJsKE+nzQsJnOFlHRgTCq0G/8oPmSUEKt5Uno6CsnTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646340; c=relaxed/simple;
	bh=PfutUKIqzXDbwQNZXvUnk5WP3oIrhExHpFNoi2EpCyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DzWNfmve0n2nE//Lr4/YOVp2lV7bLSLGOls2Tjs+O5G6WzyBd/y02m0ovdrrza/u1A0FLbVGzAjN2Y2+gA7UOQ+ZQpcwzHzr0/sQv3KlcRHZ2fS6DeSrnkYCtCUk3+npH34rU+k5dpxixgU5V2Tgw6WZgtK1haikiOnb8g4vPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Il+f4yUS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Il+f4yUS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D7CB4E407B2;
	Fri,  5 Jun 2026 07:58:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E8125FED1;
	Fri,  5 Jun 2026 07:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BA38106A1F91;
	Fri,  5 Jun 2026 09:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780646334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rEHP/0Hnr6DhKDiEfbJrbXJw1dNpY4hE653apPJG8no=;
	b=Il+f4yUScqGC5qGxyjoq5Hy4/yGfFXESkLzj4xWFZ897Vs6hx51Lcs/+0aQD2AEycfMYqt
	xS8t5SGndrx9nkfn7wsipaQWyr07Ujw963buFfSlbsA8aQq5VP62CcE9y3fl+2JsH2KTmX
	uB1UbW/LVYSAxS3Rai8s8KMA9BG17YWmXPkHGMyjqPUmqiPrRi+TXJTSO5q1T0xfKwbMX2
	Myrxciv/F8qVzaj0qHvJ5K1WlQWe0+uKrazmdOJzyjFgvs1YB33Rjl8CFwDckeTZRCe07I
	VfDMWuIFddSHBkD4t8Wrv7oswBgFZXqFzj7grUz4Utjv4G2sB9c5g8f4RniFrg==
From: "Bastien Curutchet (eBPF Foundation)" <bastien.curutchet@bootlin.com>
Date: Fri, 05 Jun 2026 09:58:51 +0200
Subject: [PATCH bpf-next] bpf/selftests: remove lirc test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-remove-lirc-test-v1-1-ee3f1ea5f3ae@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqDMBBG4VeRWTsQL4TSVxEXafynHWijTIII4
 rs3uPwW55yUYYpMz+Ykw65Z11TRtQ3FT0hvsC7V1LveO+9GNvzWHfxVi1yQC0t8BAl+GGUIVLP
 NIHrcy4lem3DCUWi+rj8BaY9ZbAAAAA==
X-Change-ID: 20260604-remove-lirc-test-fc8afa634f3a
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexis Lothore <alexis.lothore@bootlin.com>, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 "Bastien Curutchet (eBPF Foundation)" <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

test_lirc_mode.sh fails with the following when run from the vmtest VM:
root@(none):/root/bpf# ./test_lirc_mode2.sh
Failed to read decoded IR: Resource temporarily unavailable
FAIL: lirc_mode2

As part of the ongoing effort to get rid of any standalone test, this
script should either be fixed and converted to test_progs or removed.

Remove it.

Signed-off-by: Bastien Curutchet (eBPF Foundation) <bastien.curutchet@bootlin.com>
---
Hi all,

I went back up to v6.13 without finding a working commit. Maybe
something's wrong with my setup but comments inside
test_lirc_mode2_user.c say that three kernel configurations are needed
to have the test working and I ensured they were indeed enabled (with
s/BPF_RAWIR_EVENT/BPF_LIRC_MODE2).

If someone disagrees with this removal please speak up and I'll
investigate this further.

Best regards,
Bastien
---
 tools/testing/selftests/bpf/.gitignore             |   1 -
 tools/testing/selftests/bpf/Makefile               |   3 -
 .../selftests/bpf/progs/test_lirc_mode2_kern.c     |  26 ---
 tools/testing/selftests/bpf/test_lirc_mode2.sh     |  41 -----
 tools/testing/selftests/bpf/test_lirc_mode2_user.c | 177 ---------------------
 5 files changed, 248 deletions(-)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 986a6389186ba..b815bf0d88774 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -17,7 +17,6 @@ test_verifier_log
 feature
 urandom_read
 test_sockmap
-test_lirc_mode2_user
 flow_dissector_load
 test_tcpnotify_user
 test_libbpf
diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index bc049620c7745..653c949fc854d 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -117,7 +117,6 @@ TEST_FILES = xsk_prereqs.sh $(wildcard progs/btf_dump_test_case_*.c)
 
 # Order correspond to 'make run_tests' order
 TEST_PROGS := test_kmod.sh \
-	test_lirc_mode2.sh \
 	test_bpftool_build.sh \
 	test_doc_build.sh \
 	test_xsk.sh \
@@ -135,7 +134,6 @@ TEST_GEN_PROGS_EXTENDED = \
 	bench \
 	flow_dissector_load \
 	test_cpp \
-	test_lirc_mode2_user \
 	veristat \
 	xdp_features \
 	xdp_hw_metadata \
@@ -325,7 +323,6 @@ $(OUTPUT)/test_sockmap: $(CGROUP_HELPERS) $(TESTING_HELPERS)
 $(OUTPUT)/test_tcpnotify_user: $(CGROUP_HELPERS) $(TESTING_HELPERS) $(TRACE_HELPERS)
 $(OUTPUT)/test_sock_fields: $(CGROUP_HELPERS) $(TESTING_HELPERS)
 $(OUTPUT)/test_tag: $(TESTING_HELPERS)
-$(OUTPUT)/test_lirc_mode2_user: $(TESTING_HELPERS)
 $(OUTPUT)/flow_dissector_load: $(TESTING_HELPERS)
 $(OUTPUT)/test_maps: $(TESTING_HELPERS)
 $(OUTPUT)/test_verifier: $(TESTING_HELPERS) $(CAP_HELPERS) $(UNPRIV_HELPERS)
diff --git a/tools/testing/selftests/bpf/progs/test_lirc_mode2_kern.c b/tools/testing/selftests/bpf/progs/test_lirc_mode2_kern.c
deleted file mode 100644
index 7a6620671a833..0000000000000
--- a/tools/testing/selftests/bpf/progs/test_lirc_mode2_kern.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// test ir decoder
-//
-// Copyright (C) 2018 Sean Young <sean@mess.org>
-
-#include <linux/bpf.h>
-#include <linux/lirc.h>
-#include <bpf/bpf_helpers.h>
-
-SEC("lirc_mode2")
-int bpf_decoder(unsigned int *sample)
-{
-	if (LIRC_IS_PULSE(*sample)) {
-		unsigned int duration = LIRC_VALUE(*sample);
-
-		if (duration & 0x10000)
-			bpf_rc_keydown(sample, 0x40, duration & 0xffff, 0);
-		if (duration & 0x20000)
-			bpf_rc_pointer_rel(sample, (duration >> 8) & 0xff,
-					   duration & 0xff);
-	}
-
-	return 0;
-}
-
-char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/test_lirc_mode2.sh b/tools/testing/selftests/bpf/test_lirc_mode2.sh
deleted file mode 100755
index 5252b91f48a18..0000000000000
--- a/tools/testing/selftests/bpf/test_lirc_mode2.sh
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/bash
-# SPDX-License-Identifier: GPL-2.0
-
-# Kselftest framework requirement - SKIP code is 4.
-ksft_skip=4
-ret=$ksft_skip
-
-msg="skip all tests:"
-if [ $UID != 0 ]; then
-	echo $msg please run this as root >&2
-	exit $ksft_skip
-fi
-
-GREEN='\033[0;92m'
-RED='\033[0;31m'
-NC='\033[0m' # No Color
-
-modprobe rc-loopback
-
-for i in /sys/class/rc/rc*
-do
-	if grep -q DRV_NAME=rc-loopback $i/uevent
-	then
-		LIRCDEV=$(grep DEVNAME= $i/lirc*/uevent | sed sQDEVNAME=Q/dev/Q)
-		INPUTDEV=$(grep DEVNAME= $i/input*/event*/uevent | sed sQDEVNAME=Q/dev/Q)
-	fi
-done
-
-if [ -n "$LIRCDEV" ];
-then
-	TYPE=lirc_mode2
-	./test_lirc_mode2_user $LIRCDEV $INPUTDEV
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		echo -e ${RED}"FAIL: $TYPE"${NC}
-	else
-		echo -e ${GREEN}"PASS: $TYPE"${NC}
-	fi
-fi
-
-exit $ret
diff --git a/tools/testing/selftests/bpf/test_lirc_mode2_user.c b/tools/testing/selftests/bpf/test_lirc_mode2_user.c
deleted file mode 100644
index 88e4aeab21b7b..0000000000000
--- a/tools/testing/selftests/bpf/test_lirc_mode2_user.c
+++ /dev/null
@@ -1,177 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// test ir decoder
-//
-// Copyright (C) 2018 Sean Young <sean@mess.org>
-
-// A lirc chardev is a device representing a consumer IR (cir) device which
-// can receive infrared signals from remote control and/or transmit IR.
-//
-// IR is sent as a series of pulses and space somewhat like morse code. The
-// BPF program can decode this into scancodes so that rc-core can translate
-// this into input key codes using the rc keymap.
-//
-// This test works by sending IR over rc-loopback, so the IR is processed by
-// BPF and then decoded into scancodes. The lirc chardev must be the one
-// associated with rc-loopback, see the output of ir-keytable(1).
-//
-// The following CONFIG options must be enabled for the test to succeed:
-// CONFIG_RC_CORE=y
-// CONFIG_BPF_RAWIR_EVENT=y
-// CONFIG_RC_LOOPBACK=y
-
-// Steps:
-// 1. Open the /dev/lircN device for rc-loopback (given on command line)
-// 2. Attach bpf_lirc_mode2 program which decodes some IR.
-// 3. Send some IR to the same IR device; since it is loopback, this will
-//    end up in the bpf program
-// 4. bpf program should decode IR and report keycode
-// 5. We can read keycode from same /dev/lirc device
-
-#include <linux/bpf.h>
-#include <linux/input.h>
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <poll.h>
-#include <sys/types.h>
-#include <sys/ioctl.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-
-#include "bpf_util.h"
-#include <bpf/bpf.h>
-#include <bpf/libbpf.h>
-
-#include "testing_helpers.h"
-
-int main(int argc, char **argv)
-{
-	struct bpf_object *obj;
-	int ret, lircfd, progfd, inputfd;
-	int testir1 = 0x1dead;
-	int testir2 = 0x20101;
-	u32 prog_ids[10], prog_flags[10], prog_cnt;
-
-	if (argc != 3) {
-		printf("Usage: %s /dev/lircN /dev/input/eventM\n", argv[0]);
-		return 2;
-	}
-
-	ret = bpf_prog_test_load("test_lirc_mode2_kern.bpf.o",
-				 BPF_PROG_TYPE_LIRC_MODE2, &obj, &progfd);
-	if (ret) {
-		printf("Failed to load bpf program\n");
-		return 1;
-	}
-
-	lircfd = open(argv[1], O_RDWR | O_NONBLOCK);
-	if (lircfd == -1) {
-		printf("failed to open lirc device %s: %m\n", argv[1]);
-		return 1;
-	}
-
-	/* Let's try detach it before it was ever attached */
-	ret = bpf_prog_detach2(progfd, lircfd, BPF_LIRC_MODE2);
-	if (ret != -ENOENT) {
-		printf("bpf_prog_detach2 not attached should fail: %m\n");
-		return 1;
-	}
-
-	inputfd = open(argv[2], O_RDONLY | O_NONBLOCK);
-	if (inputfd == -1) {
-		printf("failed to open input device %s: %m\n", argv[1]);
-		return 1;
-	}
-
-	prog_cnt = 10;
-	ret = bpf_prog_query(lircfd, BPF_LIRC_MODE2, 0, prog_flags, prog_ids,
-			     &prog_cnt);
-	if (ret) {
-		printf("Failed to query bpf programs on lirc device: %m\n");
-		return 1;
-	}
-
-	if (prog_cnt != 0) {
-		printf("Expected nothing to be attached\n");
-		return 1;
-	}
-
-	ret = bpf_prog_attach(progfd, lircfd, BPF_LIRC_MODE2, 0);
-	if (ret) {
-		printf("Failed to attach bpf to lirc device: %m\n");
-		return 1;
-	}
-
-	/* Write raw IR */
-	ret = write(lircfd, &testir1, sizeof(testir1));
-	if (ret != sizeof(testir1)) {
-		printf("Failed to send test IR message: %m\n");
-		return 1;
-	}
-
-	struct pollfd pfd = { .fd = inputfd, .events = POLLIN };
-	struct input_event event;
-
-	for (;;) {
-		poll(&pfd, 1, 100);
-
-		/* Read decoded IR */
-		ret = read(inputfd, &event, sizeof(event));
-		if (ret != sizeof(event)) {
-			printf("Failed to read decoded IR: %m\n");
-			return 1;
-		}
-
-		if (event.type == EV_MSC && event.code == MSC_SCAN &&
-		    event.value == 0xdead) {
-			break;
-		}
-	}
-
-	/* Write raw IR */
-	ret = write(lircfd, &testir2, sizeof(testir2));
-	if (ret != sizeof(testir2)) {
-		printf("Failed to send test IR message: %m\n");
-		return 1;
-	}
-
-	for (;;) {
-		poll(&pfd, 1, 100);
-
-		/* Read decoded IR */
-		ret = read(inputfd, &event, sizeof(event));
-		if (ret != sizeof(event)) {
-			printf("Failed to read decoded IR: %m\n");
-			return 1;
-		}
-
-		if (event.type == EV_REL && event.code == REL_Y &&
-		    event.value == 1 ) {
-			break;
-		}
-	}
-
-	prog_cnt = 10;
-	ret = bpf_prog_query(lircfd, BPF_LIRC_MODE2, 0, prog_flags, prog_ids,
-			     &prog_cnt);
-	if (ret) {
-		printf("Failed to query bpf programs on lirc device: %m\n");
-		return 1;
-	}
-
-	if (prog_cnt != 1) {
-		printf("Expected one program to be attached\n");
-		return 1;
-	}
-
-	/* Let's try detaching it now it is actually attached */
-	ret = bpf_prog_detach2(progfd, lircfd, BPF_LIRC_MODE2);
-	if (ret) {
-		printf("bpf_prog_detach2: returned %m\n");
-		return 1;
-	}
-
-	return 0;
-}

---
base-commit: 73f574b0cd0ef87a25afdffe1d907b55f7fcc940
change-id: 20260604-remove-lirc-test-fc8afa634f3a

Best regards,
-- 
Bastien Curutchet (eBPF Foundation) <bastien.curutchet@bootlin.com>

