Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273744;
	b=oINhx2P9mbJ1JLa7yzn/T54N3lvLETIdZk0V8INYUBB9fZD4jfquFPmQ9Inx8G6bMtjl
	 PN3ZwBvl9itXP+JGzeqkfio0EGQiZM2TiaEDICJhJSq9MhAvmSYYF8hX23PjHYPpHdtla
	 0AF9Rep65Iy3dah5M218myYyRns2anBQlEN3VPJTMPjo1ejrLhYZFwoKyFCNP7SKgbxjJ
	 o91r8U/xAtDV8WVJp+oYtwyV7SxLguowsKG/XC4W9vJzIfjDtTkZEeSQMis+y9wM3XplH
	 +jYnDWhuXI8XCTFSluiOjl+8CJy+Efk5Hq5YKe8ijhM40Y+/yXrX8MVV14sd2Vq7cSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXbw32FyqwWtnmBn1lXG7BN0TCQUjpx07xM/44+T2L0=;
	b=rJ5d6z9srEuyb+RBOL41zMuHSXIp+G7de3EMSikBsDy81sMHBqqTuhSOxOCf2szla0pf
	 MMQCRQrl8Bl4avjVcZT5+2jQUQ/wLtH3SrKQznwZ0/KX242VlrBA9/c9+tyhO7/yWGtkI
	 M4oMHfBx2dC8A0NdhMnhXP92VeFkwZG/3IBD9v/q/QUamm52+8gVn9tGNarpg4dTiktlQ
	 VsjzGqD2twOW10kSG7WynX+NYJaQkf6iwM4H3gHzEP7QZhMiDTG7atT5b1lZXW2T60D6n
	 9lsafTyaI4IjW++MV38PG1bMEH45zG6YwJO7SJIL0VAoYAvr4IV2e8qT4b80crrsfVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xa51ZiR+;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B4960A2602
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 01:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B4960A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xa51ZiR+
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37198ed3727so2029598eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 17:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794273743; x=1794878543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXbw32FyqwWtnmBn1lXG7BN0TCQUjpx07xM/44+T2L0=;
        b=xa51ZiR+d9zKwyv9egIbRnoOsRjx67xbEZvVEDd+5NGGhTzdr8qY5VLeGjwhim8FLt
         JNR3vNI+HPnkGd01uHIsjNX5hKj+hTTI6kb7HoJFDotA4xjgMlZsAhOSR2lmZa4syohc
         mFlcNdXHRtbAjTAoTv5MoBYVrGpWgPmZzLBNWGBpygOpMorwsiIGFFv1FxKNU8a9gyVC
         mHyYcJRLHAP9HGmPmD+movR3SMy6XBK6Y68eodn7Dqptj/huHue02V5E4Wxg4qjeYONZ
         kzlslydtC6ah/PXy0x6u9e5e9jfi5NLYwHZeLfTLgRUfATgBQWYW8gmLz+uigznPlIOk
         cutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273743; x=1794878543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXbw32FyqwWtnmBn1lXG7BN0TCQUjpx07xM/44+T2L0=;
        b=md1NUYcZ5gcjLI4J1v+z0VXLGMrLmNwCNUgHZRIXzetyx6o+RMD94aRB1TzSAffXN8
         uO6j24N8zBU5GKZzdSDViv6EV9UZftegZCKER4Id8/nnli3ehCGvN3xE4tNA1usN3dN0
         3S0xjGOJeBzuDrPWsavgAeAd7fTEmqLPre5Gpfvkr6G7IXqB3WKfkiRuZR9Xk6crBLT2
         WhCCEAg2V5Meu/8I9MRiRndLcA+1vC+THVfn0x8BBTjH19YGm01Pb09rizYj9IBgp8rF
         zUu77xFQjbpwzKaAuo30n6g8NCGN4Cs2AyNNc9+vBA4DMeEGfIhfsG4Q1zmwswFI7hZF
         GTnA==
X-Forwarded-Encrypted: i=1; AL+hErFWNvgNTUYT+7Ll9ok8XkodscNvrGRCoT1mCiOC1Y0IVGokCv5jqRBq40sgquVDXzAsyok1uO+AYzgujSDvmik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LFFrLgyH8k0UnCZVtYFP4LXIwqj+FmkApT1BebbDh89oqHepG
	c4sae7SbBvdB9Ug9ZQ9kE1LwgFIvapKCfJAtaRabCkai8VLid+oz+iEj
X-Gm-Gg: AYBFou2V5y/cMC/bT1avSPeQirbQLvQKNtUmjxkVDd8FetDrzguffg3MUcewPJL+Pze
	tsAVEYVOruNmZUCCcXQT+UOdtJh9PSZjsCST+UZJs73IiNqvo9ABrBWVyZHJD6hoxrZYquiJhiy
	qcJIJX+phehLYKrHMlI3zCJiKxbQNufwiCEfAeYxwZ3TKVnSgLoQ056JhGadYlOfvf9dHU8j21M
	pgH7OfZFT/e9424kTZ6eRGyzmkb2PZkJL7X0tUB6S0Mm6MEeApPEQw0YgbvPyZCJL0IDGMqSt0+
	O3rBMoea0WzaZEybWRCN14Il5CIKXc3zniv0WSkC0QxBOlEgHAhZPuVg5S+yRLhP11Ghw8V7TIW
	z3al0hYJGTARuw6iWNYp9hGamVr3mGGNX7CDmeD3eYMqAkgGG/CiwzDpygIGECS7M4UgLtORpE5
	t7Ndmj7O8rC/ixNmHhd2O1xs4GsFJF4/Pu1+vWh9B72JD5FeBKMI8riWPgATvgFAeYNlOrZiA4K
	Fk/ADBl6U+2uHaCODjggPcM4b8aWGN57n2CPUJD7zmjFwkIJDu6jVx4atI1gsEO1CYgJGwEJNrW
	2n7kjJdumwpWtQy0zZUtcF1jT/bWVxRGfjavquq+rhwto9zLf/fKH8WvTdTwbAsFX668Cu4yExx
	HW/BKDjCf1hjgtEj4M9L7TRQdy9BqtuX9RN8LZrkEKJJMGJz1Cu6FEDkUe4/siiPS
X-Received: by 2002:a05:7301:791:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3751f563675mr1249907eec.10.1794273742996;
        Mon, 09 Nov 2026 17:22:22 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm2139981eec.6.2026.11.09.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:22 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	shuah@kernel.org,
	alyandra5b@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] selftests/alsa: Add a test for the sequencer UMP conversion of RPN/NRPN
Date: Tue, 10 Nov 2026 10:22:13 +0900
Message-ID: <20261110012213.740288-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequencer converts MIDI 1.0 CC and CONTROL14 events to UMP for
UMP clients. Add a test that sends such events from a legacy client to
a UMP MIDI 2.0 client and checks the RPN/NRPN packets it receives, and
one that checks that a UMP MIDI 1.0 client gets the CCs as they are.

The cases cover switching between RPN and NRPN, Data Entry sent with
nothing selected, repeated Data Entry, Null RPN and NRPN, and the
CONTROL14 path. Some of them come from the KUnit test in Alyandra
Zahran Nadhir's patch.

The test skips when /dev/snd/seq can't be opened or the kernel has no
UMP support in the sequencer.

Link: https://lore.kernel.org/all/20261107111056.667-1-alyandra5b@gmail.com/
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
This depends on the RPN/NRPN series [1]. Without it, 11 of the 22
tests fail.

[1] https://lore.kernel.org/all/cover.1794141913.git.sammiee5311@gmail.com/

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under
qemu: 22/22 pass with the series applied.

 tools/testing/selftests/alsa/.gitignore     |   1 +
 tools/testing/selftests/alsa/Makefile       |   3 +-
 tools/testing/selftests/alsa/seq-ump-test.c | 452 ++++++++++++++++++++
 3 files changed, 455 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/alsa/seq-ump-test.c

diff --git a/tools/testing/selftests/alsa/.gitignore b/tools/testing/selftests/alsa/.gitignore
index 7b0e1e9ebf1b..a0762c3c52e6 100644
--- a/tools/testing/selftests/alsa/.gitignore
+++ b/tools/testing/selftests/alsa/.gitignore
@@ -2,5 +2,6 @@ aloop-test
 global-timer
 mixer-test
 pcm-test
+seq-ump-test
 test-pcmtest-driver
 utimer-test
diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index afd64a679dc1..92de58287e77 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -16,7 +16,8 @@ LDLIBS+=-lpthread
 
 OVERRIDE_TARGETS = 1
 
-TEST_GEN_PROGS := aloop-test mixer-test pcm-test test-pcmtest-driver utimer-test
+TEST_GEN_PROGS := aloop-test mixer-test pcm-test seq-ump-test test-pcmtest-driver \
+		  utimer-test
 
 TEST_GEN_PROGS_EXTENDED := libatest.so global-timer
 
diff --git a/tools/testing/selftests/alsa/seq-ump-test.c b/tools/testing/selftests/alsa/seq-ump-test.c
new file mode 100644
index 000000000000..d1eca920cfc8
--- /dev/null
+++ b/tools/testing/selftests/alsa/seq-ump-test.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the conversion of MIDI 1.0 sequencer events to UMP.
+ *
+ * A legacy client sends CC and CONTROL14 events to a UMP client, and the
+ * test checks the packets that the UMP client receives. The converter keeps
+ * its RPN/NRPN state per destination port and channel, so each test uses
+ * new clients.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <sound/asequencer.h>
+
+#include "kselftest_harness.h"
+
+#define MAX_PACKETS	8
+#define CAP_IN	(SNDRV_SEQ_PORT_CAP_WRITE | SNDRV_SEQ_PORT_CAP_SUBS_WRITE)
+#define CAP_OUT	(SNDRV_SEQ_PORT_CAP_READ | SNDRV_SEQ_PORT_CAP_SUBS_READ)
+#define READ_TIMEOUT_MS	100
+
+/* first word of a MIDI 2.0 RPN/NRPN packet on group 0 */
+#define RPN(ch, bank, index) \
+	(0x40200000u | ((ch) << 16) | ((bank) << 8) | (index))
+#define NRPN(ch, bank, index) \
+	(0x40300000u | ((ch) << 16) | ((bank) << 8) | (index))
+
+struct packet {
+	unsigned int w0;
+	unsigned int w1;
+};
+
+struct seq_client {
+	int fd;
+	int id;
+	int port;
+};
+
+/* the same scaling as the kernel's upscale_14_to_32bit() */
+static unsigned int data14(unsigned int msb, unsigned int lsb)
+{
+	unsigned int src = (msb << 7) | lsb;
+	unsigned int val = src << 18;
+	unsigned int repeat;
+
+	if (src <= 0x2000)
+		return val;
+	repeat = src & 0x1fff;
+	return val | (repeat << 5) | (repeat >> 8);
+}
+
+/* returns 0, or a negative errno with *skip set when UMP is unavailable */
+static int open_client(struct seq_client *c, int midi_version,
+		       unsigned int cap, int *skip)
+{
+	struct snd_seq_client_info info;
+	struct snd_seq_port_info port;
+	int ver = SNDRV_SEQ_VERSION;
+
+	c->fd = open("/dev/snd/seq", O_RDWR | O_NONBLOCK);
+	if (c->fd < 0) {
+		*skip = 1;
+		return -errno;
+	}
+	if (ioctl(c->fd, SNDRV_SEQ_IOCTL_CLIENT_ID, &c->id) < 0)
+		return -errno;
+
+	if (midi_version) {
+		if (ioctl(c->fd, SNDRV_SEQ_IOCTL_USER_PVERSION, &ver) < 0) {
+			*skip = 1;
+			return -errno;
+		}
+		memset(&info, 0, sizeof(info));
+		info.client = c->id;
+		if (ioctl(c->fd, SNDRV_SEQ_IOCTL_GET_CLIENT_INFO, &info) < 0)
+			return -errno;
+		info.midi_version = midi_version;
+		if (ioctl(c->fd, SNDRV_SEQ_IOCTL_SET_CLIENT_INFO, &info) < 0) {
+			*skip = 1;
+			return -errno;
+		}
+	}
+
+	memset(&port, 0, sizeof(port));
+	port.addr.client = c->id;
+	strcpy(port.name, "seq-ump-test");
+	port.capability = cap;
+	port.type = SNDRV_SEQ_PORT_TYPE_MIDI_GENERIC |
+		    SNDRV_SEQ_PORT_TYPE_APPLICATION;
+	if (ioctl(c->fd, SNDRV_SEQ_IOCTL_CREATE_PORT, &port) < 0)
+		return -errno;
+	c->port = port.addr.port;
+	return 0;
+}
+
+static void close_client(struct seq_client *c)
+{
+	if (c->fd >= 0)
+		close(c->fd);
+	c->fd = -1;
+}
+
+static int send_event(struct seq_client *src, struct seq_client *dst,
+		      int type, int ch, int param, int value)
+{
+	struct snd_seq_event ev;
+
+	memset(&ev, 0, sizeof(ev));
+	ev.type = type;
+	ev.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_EVENT_LENGTH_FIXED;
+	ev.queue = SNDRV_SEQ_QUEUE_DIRECT;
+	ev.source.client = src->id;
+	ev.source.port = src->port;
+	ev.dest.client = dst->id;
+	ev.dest.port = dst->port;
+	ev.data.control.channel = ch;
+	ev.data.control.param = param;
+	ev.data.control.value = value;
+	if (write(src->fd, &ev, sizeof(ev)) != sizeof(ev))
+		return -errno;
+	return 0;
+}
+
+/*
+ * Read what the UMP client received until it is quiet, and keep the
+ * packets of message type @mt. Returns the number of packets kept.
+ */
+static int read_packets(struct seq_client *dst, unsigned int mt,
+			struct packet *out)
+{
+	struct pollfd pfd = { .fd = dst->fd, .events = POLLIN };
+	struct snd_seq_ump_event ev;
+	int n = 0;
+
+	while (poll(&pfd, 1, READ_TIMEOUT_MS) > 0) {
+		if (read(dst->fd, &ev, sizeof(ev)) != sizeof(ev))
+			break;
+		if (!(ev.flags & SNDRV_SEQ_EVENT_UMP) || ev.ump[0] >> 28 != mt)
+			continue;
+		if (n < MAX_PACKETS) {
+			out[n].w0 = ev.ump[0];
+			out[n].w1 = ev.ump[1];
+		}
+		n++;
+	}
+	return n;
+}
+
+FIXTURE(seq_ump) {
+	struct seq_client src;
+	struct seq_client dst;
+};
+
+FIXTURE_SETUP(seq_ump)
+{
+	int skip = 0;
+	int err;
+
+	self->src.fd = -1;
+	self->dst.fd = -1;
+
+	err = open_client(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0,
+			  CAP_IN, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	err = open_client(&self->src, 0, CAP_OUT, &skip);
+	ASSERT_EQ(0, err);
+}
+
+FIXTURE_TEARDOWN(seq_ump)
+{
+	close_client(&self->src);
+	close_client(&self->dst);
+}
+
+struct event {
+	int type;
+	int ch;
+	int param;
+	int value;
+};
+
+#define CC(ch, param, value) \
+	{ SNDRV_SEQ_EVENT_CONTROLLER, ch, param, value }
+#define C14(ch, param, value) \
+	{ SNDRV_SEQ_EVENT_CONTROL14, ch, param, value }
+
+static int send_events(struct seq_client *src, struct seq_client *dst,
+		       const struct event *ev, int n)
+{
+	int i, err;
+
+	for (i = 0; i < n; i++) {
+		err = send_event(src, dst, ev[i].type, ev[i].ch,
+				 ev[i].param, ev[i].value);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
+#define SEND(...) do {							\
+	const struct event ev[] = { __VA_ARGS__ };			\
+									\
+	ASSERT_EQ(0, send_events(&self->src, &self->dst, ev,		\
+				 ARRAY_SIZE(ev)));			\
+} while (0)
+
+/* compare the RPN/NRPN packets received with the expected ones */
+#define EXPECT_PACKETS(...) do {					\
+	const struct packet want[] = { __VA_ARGS__ };			\
+	struct packet got[MAX_PACKETS];					\
+	int n = read_packets(&self->dst, 4, got);			\
+	int i;								\
+									\
+	ASSERT_EQ((int)ARRAY_SIZE(want), n);				\
+	for (i = 0; i < n; i++) {					\
+		EXPECT_EQ(want[i].w0, got[i].w0);			\
+		EXPECT_EQ(want[i].w1, got[i].w1);			\
+	}								\
+} while (0)
+
+#define EXPECT_NO_PACKETS() do {					\
+	struct packet got[MAX_PACKETS];					\
+									\
+	EXPECT_EQ(0, read_packets(&self->dst, 4, got));			\
+} while (0)
+
+/* RPN 0/1 with Data Entry */
+TEST_F(seq_ump, rpn)
+{
+	SEND(CC(0, 101, 0), CC(0, 100, 1), CC(0, 6, 0x40), CC(0, 38, 0));
+	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x40, 0) });
+}
+
+/* Data Entry after a Null RPN is not sent at the next selection */
+TEST_F(seq_ump, data_after_null_rpn)
+{
+	SEND(CC(0, 101, 0x7f), CC(0, 100, 0x7f), CC(0, 6, 0x40), CC(0, 38, 0));
+	SEND(CC(0, 101, 0), CC(0, 100, 1));
+	EXPECT_NO_PACKETS();
+}
+
+/* Data Entry before any selection is not sent at the next selection */
+TEST_F(seq_ump, data_before_selection)
+{
+	SEND(CC(0, 6, 0x40), CC(0, 38, 0), CC(0, 101, 0), CC(0, 100, 1));
+	EXPECT_NO_PACKETS();
+}
+
+/* the same for an NRPN selected after a Null RPN */
+TEST_F(seq_ump, data_after_null_rpn_to_nrpn)
+{
+	SEND(CC(0, 101, 0x7f), CC(0, 100, 0x7f), CC(0, 6, 0x40), CC(0, 38, 0));
+	SEND(CC(0, 99, 0), CC(0, 98, 5));
+	EXPECT_NO_PACKETS();
+}
+
+/* a repeated Data Entry goes to the selected RPN */
+TEST_F(seq_ump, repeated_data)
+{
+	SEND(CC(0, 101, 0), CC(0, 100, 2), CC(0, 6, 0x40), CC(0, 38, 0));
+	SEND(CC(0, 6, 0x10), CC(0, 38, 0), CC(0, 101, 0), CC(0, 100, 1));
+	EXPECT_PACKETS({ RPN(0, 0, 2), data14(0x40, 0) },
+		       { RPN(0, 0, 2), data14(0x10, 0) });
+}
+
+/* two values for one RPN, then another RPN */
+TEST_F(seq_ump, two_rpns)
+{
+	SEND(CC(0, 101, 0), CC(0, 100, 0), CC(0, 6, 2), CC(0, 38, 0));
+	SEND(CC(0, 6, 12), CC(0, 38, 0));
+	SEND(CC(0, 101, 0), CC(0, 100, 1), CC(0, 6, 0x40), CC(0, 38, 0));
+	EXPECT_PACKETS({ RPN(0, 0, 0), data14(2, 0) },
+		       { RPN(0, 0, 0), data14(12, 0) },
+		       { RPN(0, 0, 1), data14(0x40, 0) });
+}
+
+/* the RPN number is held after a send, like the NRPN number */
+TEST_F(seq_ump, rpn_msb_held)
+{
+	SEND(CC(0, 101, 1), CC(0, 100, 1), CC(0, 6, 0x40), CC(0, 38, 0));
+	SEND(CC(0, 100, 2), CC(0, 6, 0x10), CC(0, 38, 0));
+	EXPECT_PACKETS({ RPN(0, 1, 1), data14(0x40, 0) },
+		       { RPN(0, 1, 2), data14(0x10, 0) });
+}
+
+/* selecting an NRPN replaces an RPN selection, and the reverse */
+TEST_F(seq_ump, selector_switch)
+{
+	SEND(CC(0, 101, 0x11), CC(0, 100, 0x12), CC(0, 99, 0x21),
+	     CC(0, 98, 0x22));
+	SEND(CC(0, 6, 0x31), CC(0, 38, 0x32));
+	SEND(CC(1, 99, 0x41), CC(1, 98, 0x42), CC(1, 101, 0x51),
+	     CC(1, 100, 0x52));
+	SEND(CC(1, 6, 0x61), CC(1, 38, 0x62));
+	EXPECT_PACKETS({ NRPN(0, 0x21, 0x22), data14(0x31, 0x32) },
+		       { RPN(1, 0x51, 0x52), data14(0x61, 0x62) });
+}
+
+/*
+ * A pending Data Entry MSB is sent for the old selection when another
+ * one is made. Other channels keep their own selection.
+ */
+TEST_F(seq_ump, pending_flush_and_channels)
+{
+	SEND(CC(2, 101, 0x09), CC(2, 100, 0x08));
+	SEND(CC(3, 99, 0x17), CC(3, 98, 0x18));
+	SEND(CC(2, 6, 0x25), CC(2, 99, 0x29));
+	SEND(CC(3, 6, 0x33), CC(3, 38, 0));
+	EXPECT_PACKETS({ RPN(2, 0x09, 0x08), data14(0x25, 0) },
+		       { NRPN(3, 0x17, 0x18), data14(0x33, 0) });
+}
+
+/* a Null NRPN deselects, and its data is not sent */
+TEST_F(seq_ump, null_nrpn)
+{
+	SEND(CC(0, 99, 0x7f), CC(0, 98, 0x7f), CC(0, 6, 0x40), CC(0, 38, 0));
+	EXPECT_NO_PACKETS();
+}
+
+/* a Null RPN also deselects an NRPN */
+TEST_F(seq_ump, null_rpn_after_nrpn)
+{
+	SEND(CC(0, 99, 1), CC(0, 98, 2), CC(0, 101, 0x7f), CC(0, 100, 0x7f));
+	SEND(CC(0, 6, 0x10), CC(0, 38, 0));
+	EXPECT_NO_PACKETS();
+}
+
+/* a Null NRPN does not touch the RPN number */
+TEST_F(seq_ump, null_nrpn_keeps_rpn_number)
+{
+	SEND(CC(0, 100, 1), CC(0, 99, 0x7f), CC(0, 98, 0x7f), CC(0, 101, 0));
+	SEND(CC(0, 6, 0x10), CC(0, 38, 0));
+	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x10, 0) });
+}
+
+/* a Null RPN sent around a Null NRPN still deselects */
+TEST_F(seq_ump, null_rpn_split_by_null_nrpn)
+{
+	SEND(CC(0, 100, 0x7f), CC(0, 99, 0x7f), CC(0, 98, 0x7f),
+	     CC(0, 101, 0x7f));
+	SEND(CC(0, 6, 0x10), CC(0, 38, 0));
+	EXPECT_NO_PACKETS();
+}
+
+/* a Null RPN after an RPN with LSB 127 does not select RPN 0/127 */
+TEST_F(seq_ump, null_rpn_after_lsb_127)
+{
+	SEND(CC(0, 101, 0), CC(0, 100, 0x7f), CC(0, 6, 0x40), CC(0, 38, 0));
+	SEND(CC(0, 101, 0x7f), CC(0, 100, 0x7f), CC(0, 6, 0x10), CC(0, 38, 0));
+	EXPECT_PACKETS({ RPN(0, 0, 0x7f), data14(0x40, 0) });
+}
+
+/* CONTROL14: RPN 0/1 with Data Entry */
+TEST_F(seq_ump, c14_rpn)
+{
+	SEND(C14(0, 101, 1), C14(0, 6, 0x40 << 7));
+	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x40, 0) });
+}
+
+/* CONTROL14: Data Entry before any selection is not sent */
+TEST_F(seq_ump, c14_data_before_selection)
+{
+	SEND(C14(0, 6, 0x40 << 7), C14(0, 101, 1), C14(0, 101, 2));
+	EXPECT_NO_PACKETS();
+}
+
+/* CONTROL14: a repeated Data Entry goes to the selected RPN */
+TEST_F(seq_ump, c14_repeated_data)
+{
+	SEND(C14(0, 101, 1), C14(0, 6, 0x40 << 7), C14(0, 6, 0x10 << 7));
+	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x40, 0) },
+		       { RPN(0, 0, 1), data14(0x10, 0) });
+}
+
+/* CONTROL14: selecting an NRPN replaces an RPN selection, and the reverse */
+TEST_F(seq_ump, c14_selector_switch)
+{
+	SEND(C14(4, 101, (1 << 7) | 2), C14(4, 99, (3 << 7) | 4));
+	SEND(C14(4, 6, (5 << 7) | 6));
+	SEND(C14(5, 99, (7 << 7) | 8), C14(5, 101, (9 << 7) | 10));
+	SEND(C14(5, 6, (11 << 7) | 12));
+	EXPECT_PACKETS({ NRPN(4, 3, 4), data14(5, 6) },
+		       { RPN(5, 9, 10), data14(11, 12) });
+}
+
+/* CONTROL14: a pending Data Entry is sent for the old selection */
+TEST_F(seq_ump, c14_pending_flush)
+{
+	SEND(C14(6, 99, (2 << 7) | 3), CC(6, 6, 0x35),
+	     C14(6, 101, (4 << 7) | 5));
+	EXPECT_PACKETS({ NRPN(6, 2, 3), data14(0x35, 0) });
+}
+
+/* CONTROL14: a Null RPN deselects an NRPN, and so does a Null NRPN */
+TEST_F(seq_ump, c14_null)
+{
+	SEND(C14(0, 99, (3 << 7) | 4), C14(0, 101, 0x3fff));
+	SEND(C14(0, 6, 0x10 << 7));
+	SEND(C14(1, 101, 1), C14(1, 99, 0x3fff), C14(1, 6, 0x10 << 7));
+	EXPECT_NO_PACKETS();
+}
+
+/* CONTROL14: a Null NRPN does not touch the RPN number */
+TEST_F(seq_ump, c14_null_nrpn_keeps_rpn_number)
+{
+	SEND(CC(0, 100, 1), C14(0, 99, 0x3fff), CC(0, 101, 0));
+	SEND(C14(0, 6, 0x10 << 7));
+	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x10, 0) });
+}
+
+/* a UMP MIDI 1.0 client gets the CCs as they are, RPN selection included */
+TEST(midi1_passthrough)
+{
+	struct seq_client src = { .fd = -1 }, dst = { .fd = -1 };
+	struct packet got[MAX_PACKETS];
+	int skip = 0;
+	int err;
+
+	err = open_client(&dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			  CAP_IN, &skip);
+	if (skip) {
+		close_client(&dst);
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	}
+	ASSERT_EQ(0, err);
+	ASSERT_EQ(0, open_client(&src, 0, CAP_OUT, &skip));
+
+	ASSERT_EQ(0, send_event(&src, &dst, SNDRV_SEQ_EVENT_CONTROLLER,
+				9, 0x40, 0x22));
+	ASSERT_EQ(0, send_event(&src, &dst, SNDRV_SEQ_EVENT_CONTROLLER,
+				3, 101, 0x12));
+	ASSERT_EQ(0, send_event(&src, &dst, SNDRV_SEQ_EVENT_CONTROLLER,
+				3, 99, 0x34));
+	ASSERT_EQ(3, read_packets(&dst, 2, got));
+	EXPECT_EQ(0x20b94022u, got[0].w0);
+	EXPECT_EQ(0x20b36512u, got[1].w0);
+	EXPECT_EQ(0x20b36334u, got[2].w0);
+
+	close_client(&src);
+	close_client(&dst);
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0

