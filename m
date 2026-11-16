Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798249;
	b=AFZCOwIK/KvlHG5S/aMrkcVKct8fTXuKDpI3zJm70QVJ/S1yv3nijJ3/ByCxmiuG5vvt
	 PfZkNxoNbBoLMdTFaJSAxzbTCZceci3xNw/eSzHujBm5ADA/1KMiZCOWP4l7LkBe4zDVO
	 UnFnQMfqdaLjlb5dMChe3nUtEoHcSfcf/3nzUz1uZ0iE8b4afmQwu1ePbUZNuhfMzUlO3
	 YD7b0M20bWcDnJCrOroVettIkjppAagRyWICwANc4Ez6vKj53RTKRfQsyuPk6aoA1iiYz
	 wLOcbmwAR8ar1RlTNt7CnnJiZe3Lgv6zuRflvZAnFNQizXbHuUKeWRY+pJFYSJrIjuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
	b=g7zisRQ1r/4Z1/WEm9kVcmdbnv4TRAkEQenc+G6auJ9JLkKoKQIaTCZKZOigRcGSqocT
	 Z8JOUwqAL/tEak57VKz7L9C1C2u1kl7Rb6/y/hR5ysmlFPauZZWoZAaJ9aAqKqSqhDxfx
	 nXuww++lhlk7M0sx4vfpvfu4qS0IR0c8lQYNg1yK2IP6oMvE6on9jZRengyp5G5ByN72f
	 qZleQ/RCB2dOX1BZO2GqLnAQp/5uEHDSrgMo5Ama5Xmv16YkFvy1s2eHeNMOAyAVfWqpc
	 fYWfjDRewjD61QiNUVKYnYyYdqlN5ZSY9C6MSTF55H929H8LRhqVD7gfyjFBbZKmNaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGKJJAbk;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB030606A330
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB030606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGKJJAbk
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3862015eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798247; x=1795403047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
        b=wGKJJAbkmfyjKBC1FQuCbSaaK2GGZ1hUqDKHVwayShZA3ggvo+gETtlvIHP7K7RbEa
         tsI2GWa/cRvA/JG5F7dOYaKGGj1GJoGlgoRAzok/e2fqqyC5H3hHVNOzd2997F5OxMNh
         /r+9mZNT5deGVF0hE/vIbuGM0Oe3CeSRGJ1PAdClkYYvtIGscI02GOfayGnYBx0hPzJ5
         eht7FSEdi96CghKRznZa9HOvbrxhSI6nXuCJyyizg586FVDnnd1kTVm0hWTtjCyM53+M
         PDS+N4MTLcdIAakwr6cIJGUqiFKZJPmPejpxqSBfDX3oEmLxUsYWei3l4vXX8+Z2PmoG
         OlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798247; x=1795403047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
        b=QzmAzZq1xqdTBXkf03zw7v7EWmjLRiAafh2uQtTrFp9bZYTGI8wDObxy+Z/+KhHmmf
         TZyFJtpyWvycF6957WBVUw94vanT+NZKHM51tScY19mRanRLwsqb/0sq7MyFrQj1N/Gr
         uwphXZuU0DADjjCOFOLapz9HeO6LBDby8pPNXf48X6h41VGsaY5FZedbzyghJATG5Pcc
         GAUnY211SeyF8BKZzZAak/9lNOBZGk0hXdHex7cs7LhmQqUfybM558sEuOIgqn92TP6D
         PyEyIC7UZu1gawMSyHbHO4BhB3Zbdt3hkDboDScK7Fb1LXpstNUlIR52wmOjPxkUyVpW
         Mu5A==
X-Forwarded-Encrypted: i=1; AL+hErHXlz/+nP9vHJbpNp/ZG439/fmbkNtbiarjN/EE9rniQF6Wbs65QJIy3yobrrJpSf9IbQsax3HcCAFopshMYik=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TL0m0Si8jbDp+tm7dbTgCF8kDEdfyJDk2vBmvKZdEyKfx8fJ6
	AI6ROACkzOAIB8dNKZ3T6zN5YcVEBYJY62wbF/8aYzzZCUU5mLafQl94
X-Gm-Gg: AYBFou2m8R313U6m9WSso8ywuzzrgygGQ4QwFjeOgwrZ94Jn0ksqpk5WYs2lSy78miE
	bNHX/3P+gw2oo4pJLAA5KEBTIXSbccYfPLw4HHGMXna4R7ZBv2eUahYAjQCySqnIo7NdoJOGCa/
	1+ZxIjkEYp7OjCzyLEdcUjfbrG8hdMJKB1h/AItDDQBTasesKctTOCK2QVDN/IXBkKQjbjJV9cZ
	vPOqhDOpbwDgaD/IeJ+uEe/43ecTkFJV+hnyU7N7FR0P9ybSfRVTh6wjQfAAnLTBiNEfUfNZdd1
	xzH/JfoAUYZ+6AGnxUzkIKAv0t4BadEtbwlr17TxVPEF5zuVVpyBRGLDtVvDDdr9gicGVawRuR7
	uvh3yUeVWcVviijkeWKKMxWJEbP+bjBiFhlDZs+I34KR2Glcw8a1djsjc/de5cauBaW5N2b5LrF
	L/WNesttMBZhpRzu+SLXG55n27ZFQKphzz96hGbEVgQaUWqToHqyvlN+mf0pwxtiuRyDpdPZcgm
	vjcKj2MTGQK+wQ8KYNl0m6LGlI2qY0Qk1MJlANW5vMH7tGFTQFzx3mStVYcLUH3By2IaEqYrf0a
	nZhXBg0v5hiOi2WKkfKqglT3S7ESardMHzeeLw0uzoLqmvyYdZjCg7hs/j7VHrSmtgNeSG7WnGX
	LfYJnpIK28YfREFNjuvX7ypa3Vie7q4KmZzHE9sCm
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr10427324eec.7.1794798246554;
        Sun, 15 Nov 2026 19:04:06 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:04:06 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 4/4] selftests/alsa: Test the sequencer UMP Note On/Off conversion
Date: Mon, 16 Nov 2026 12:03:37 +0900
Message-ID: <20261116030338.422671-5-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116030338.422671-1-sammiee5311@gmail.com>
References: <20261116030338.422671-1-sammiee5311@gmail.com>
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

seq-ump-test only covers the RPN/NRPN conversion. Check that a Note On
with zero velocity becomes a Note Off and that a key pressure of zero
stays a key pressure, from a legacy client to UMP MIDI 1.0 and MIDI 2.0
clients. Also check Note On and Note Off between UMP MIDI 1.0 and MIDI
2.0 clients.

Without the three previous fixes, midi1_key_pressure,
ump_midi1_to_midi2_note and ump_midi2_to_midi1_note fail.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/seq-ump-test.c | 187 +++++++++++++++++++-
 1 file changed, 179 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/alsa/seq-ump-test.c b/tools/testing/selftests/alsa/seq-ump-test.c
index d1eca920cfc8..55bb7ea5b02f 100644
--- a/tools/testing/selftests/alsa/seq-ump-test.c
+++ b/tools/testing/selftests/alsa/seq-ump-test.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Test the conversion of MIDI 1.0 sequencer events to UMP.
+ * Test the sequencer conversion of MIDI 1.0 events to UMP, and of UMP
+ * packets between MIDI 1.0 and MIDI 2.0 clients.
  *
- * A legacy client sends CC and CONTROL14 events to a UMP client, and the
- * test checks the packets that the UMP client receives. The converter keeps
- * its RPN/NRPN state per destination port and channel, so each test uses
- * new clients.
+ * A client sends events to a UMP client, and the test checks the packets
+ * that the UMP client receives. The converter keeps its RPN/NRPN state
+ * per destination port and channel, so each test uses new clients.
  */
 #include <errno.h>
 #include <fcntl.h>
@@ -124,6 +124,48 @@ static int send_event(struct seq_client *src, struct seq_client *dst,
 	return 0;
 }
 
+static int send_note(struct seq_client *src, struct seq_client *dst,
+		     int type, int ch, int note, int velocity)
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
+	ev.data.note.channel = ch;
+	ev.data.note.note = note;
+	ev.data.note.velocity = velocity;
+	if (write(src->fd, &ev, sizeof(ev)) != sizeof(ev))
+		return -errno;
+	return 0;
+}
+
+/* send a UMP packet from a UMP client */
+static int send_ump(struct seq_client *src, struct seq_client *dst,
+		    unsigned int w0, unsigned int w1)
+{
+	struct snd_seq_ump_event ev;
+
+	memset(&ev, 0, sizeof(ev));
+	ev.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_EVENT_LENGTH_FIXED |
+		   SNDRV_SEQ_EVENT_UMP;
+	ev.queue = SNDRV_SEQ_QUEUE_DIRECT;
+	ev.source.client = src->id;
+	ev.source.port = src->port;
+	ev.dest.client = dst->id;
+	ev.dest.port = dst->port;
+	ev.ump[0] = w0;
+	ev.ump[1] = w1;
+	if (write(src->fd, &ev, sizeof(ev)) != sizeof(ev))
+		return -errno;
+	return 0;
+}
+
 /*
  * Read what the UMP client received until it is quiet, and keep the
  * packets of message type @mt. Returns the number of packets kept.
@@ -212,11 +254,11 @@ static int send_events(struct seq_client *src, struct seq_client *dst,
 				 ARRAY_SIZE(ev)));			\
 } while (0)
 
-/* compare the RPN/NRPN packets received with the expected ones */
-#define EXPECT_PACKETS(...) do {					\
+/* compare the packets of message type @mt with the expected ones */
+#define EXPECT_MT_PACKETS(mt, ...) do {					\
 	const struct packet want[] = { __VA_ARGS__ };			\
 	struct packet got[MAX_PACKETS];					\
-	int n = read_packets(&self->dst, 4, got);			\
+	int n = read_packets(&self->dst, mt, got);			\
 	int i;								\
 									\
 	ASSERT_EQ((int)ARRAY_SIZE(want), n);				\
@@ -226,12 +268,22 @@ static int send_events(struct seq_client *src, struct seq_client *dst,
 	}								\
 } while (0)
 
+/* compare the MIDI 2.0 channel voice packets received */
+#define EXPECT_PACKETS(...)	EXPECT_MT_PACKETS(4, __VA_ARGS__)
+
 #define EXPECT_NO_PACKETS() do {					\
 	struct packet got[MAX_PACKETS];					\
 									\
 	EXPECT_EQ(0, read_packets(&self->dst, 4, got));			\
 } while (0)
 
+#define SEND_NOTE(type, ch, note, velocity)				\
+	ASSERT_EQ(0, send_note(&self->src, &self->dst,			\
+			       SNDRV_SEQ_EVENT_##type, ch, note, velocity))
+
+#define SEND_UMP(w0, w1) \
+	ASSERT_EQ(0, send_ump(&self->src, &self->dst, w0, w1))
+
 /* RPN 0/1 with Data Entry */
 TEST_F(seq_ump, rpn)
 {
@@ -416,6 +468,20 @@ TEST_F(seq_ump, c14_null_nrpn_keeps_rpn_number)
 	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x10, 0) });
 }
 
+/* a note-on with zero velocity is a note-off */
+TEST_F(seq_ump, note_on_zero_velocity)
+{
+	SEND_NOTE(NOTEON, 1, 60, 0);
+	EXPECT_PACKETS({ 0x40813c00, 0 });
+}
+
+/* a key pressure of zero is a key pressure, not a note-off */
+TEST_F(seq_ump, key_pressure)
+{
+	SEND_NOTE(KEYPRESS, 2, 64, 0);
+	EXPECT_PACKETS({ 0x40a24000, 0 });
+}
+
 /* a UMP MIDI 1.0 client gets the CCs as they are, RPN selection included */
 TEST(midi1_passthrough)
 {
@@ -449,4 +515,109 @@ TEST(midi1_passthrough)
 	close_client(&dst);
 }
 
+/* a pair of clients whose MIDI versions each test chooses */
+FIXTURE(seq_pair) {
+	struct seq_client src;
+	struct seq_client dst;
+};
+
+FIXTURE_SETUP(seq_pair)
+{
+	self->src.fd = -1;
+	self->dst.fd = -1;
+}
+
+FIXTURE_TEARDOWN(seq_pair)
+{
+	close_client(&self->src);
+	close_client(&self->dst);
+}
+
+static int open_pair(struct seq_client *dst, int dst_version,
+		     struct seq_client *src, int src_version, int *skip)
+{
+	int err;
+
+	err = open_client(dst, dst_version, CAP_IN, skip);
+	if (!err)
+		err = open_client(src, src_version, CAP_OUT, skip);
+	return err;
+}
+
+/* to UMP MIDI 1.0, a key pressure of zero is a key pressure */
+TEST_F(seq_pair, midi1_key_pressure)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, 0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_NOTE(KEYPRESS, 2, 64, 0x50);
+	SEND_NOTE(KEYPRESS, 2, 64, 0);
+	EXPECT_MT_PACKETS(2, { 0x20a24050, 0 }, { 0x20a24000, 0 });
+}
+
+/* to UMP MIDI 1.0, a note-on with zero velocity is a note-off */
+TEST_F(seq_pair, midi1_note_on_zero_velocity)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, 0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_NOTE(NOTEON, 1, 60, 0);
+	EXPECT_MT_PACKETS(2, { 0x20813c00, 0 });
+}
+
+/* UMP MIDI 1.0 to MIDI 2.0: a note-on with zero velocity is a note-off */
+TEST_F(seq_pair, ump_midi1_to_midi2_note)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x20913c00, 0);
+	EXPECT_PACKETS({ 0x40813c00, 0 });
+}
+
+/*
+ * UMP MIDI 2.0 to MIDI 1.0: a note-on whose velocity scales down to zero
+ * stays a note-on with velocity 1, and a note-off stays a note-off
+ */
+TEST_F(seq_pair, ump_midi2_to_midi1_note)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x40913c00, 0xc8000000);
+	SEND_UMP(0x40913c00, 0x01000000);
+	SEND_UMP(0x40913c00, 0);
+	SEND_UMP(0x40813c00, 0);
+	EXPECT_MT_PACKETS(2, { 0x20913c64, 0 }, { 0x20913c01, 0 },
+			  { 0x20913c01, 0 }, { 0x20813c00, 0 });
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

