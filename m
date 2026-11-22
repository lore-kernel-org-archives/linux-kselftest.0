Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343788;
	b=Ezjrjey+rKJZbuxeuD1SNomCAUZZfhj3+H6lqkTeYhpe57AFmnwv+EevxVshisJ4d+JG
	 J6f1b/9t9w7/Vu9MysKoHKDql7jCnBdIrsfyYvaKOqHMFY2azet7Ed1CPPEHxNSHgRzgN
	 K90WXvr7tMcj1C9pX1VcLjxXTLAL5T5yOExAaE0CIW0wtJYfkrZHgKLpndamcFGDox12b
	 bXyF14UGN37UVTfdEeXHtjoI3fjFE91gMpAuKXyzL/lngr3ftS0GEUNBPeXcpOVTwe3VT
	 WpspnHeITJPZKwpHdmzhxSbYd9uqxqHMCxvmfk5304oT1RjbmGR+423i5mJGV6fALuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
	b=qWNJCC4OLof0WNBu2slYEgUsqbosEwixENdJXW6cgVnLUGqC920y6VtqcQKrxkp27OxW
	 asw32acQlYFVg0bUDCrPZ1BC1hUJbskqJoFIBoBYm14Y/yLpa5RCSCE5R7xoxhKgn60mN
	 V46scmtKAzXjPRVr0/cibFbhNnvDCTk/ARgxMbP0KwNgPD/LeydPLnJ9xGf1UfYQ0HGAX
	 eS634QOlD7zZIwCNzaBMotcfrOxt0GZyotQAsnaalT/N9IM4B9UimMmEJzbf0TRWE+N+f
	 r0JadQkwDXkOBUtGg7/3xSFMDuPoJwPDvccIj8SzVbzzrovcxgnQESOHAD27UbHxNoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTrB9kG+;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536B606A331
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 10:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9536B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTrB9kG+
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5202845eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 02:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343787; x=1795948587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
        b=OTrB9kG+zDwFTQehuRLEAcN1WkieTn0pOHRiTB9/eh53c3uJmmO09751vH6i/+gOLu
         pgG7l2wyutG7jRl56gYC/AautEwNenET3+/Iapran3yZtODUegFhZG1V9/94yKeRr5FY
         Z4UqzyQ1JB+XAG/8SZByFJKP3WYfZx0dk0uWCqfuv7LYPyXnkVEY81BYhYsILQDZiuGt
         aB4Wwr4b0XCYkS+6oJ5rN0rhgLbtkHLCBODVy9bsmXvayQIsjdD5V3VJHNA1VCjMMCO4
         gYCFWQnb/bWBLN5VNuSdPgfqTQ8pC9kBnXx4gPoRiPbVFFVnx6F9ed8/bROlhoEeYlkm
         HNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343787; x=1795948587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jvXQi6RIlt7Mtlnt0QbS4ARuJGb7qPHJ6+jlWg3p4k=;
        b=if2vT9yqpnLD4Uqi1XprLo34vaLpawCj8qO3lY5RdQgdpAFYFLPtF/B3t6zUsMMuUf
         G+vqojNTUOMyWxThjkaMZ/BiJ/nfhwg58IaYTZWjbYD6HQuqN7Ayf3FuubeBUqSciTpm
         LnADAY9t9X8f4jKNgHtU0Jhg/vFRWsJXzhIlsKF9x2mngDRE5B35/tOFSTpKbMWTpPN4
         SRPrQeBXGoTtbexpVEoq8K7/iJ1FAL/R6aMAr2pcMoVSxg+FBUKOxEIVmgQ4sgTrH+Wf
         D1y+laBTCKdGuLGzM1ScgpX6z6iLaqTQgPydzPyWFKWRjL29rhU9sqKtc0NlNJQLUegO
         zwfg==
X-Forwarded-Encrypted: i=1; AL+hErEFNc/+tNTp8S8eG4nQYmWNSogssxXW1i3p/M63qjA/FA4Im03qfm4vMjTc1hnFcxpwVnhHV3dUyHVYXNmsyQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rP2pWNh1wqqEknNzlb8UoQ0KdSE9rnyd2pQ4awl4HJdE2PnFp
	l46dH0wVPDc3kpKo+oe/bPi9Uh9yIiY7GSQpA2lHCqs4axbtHf/7hTmL
X-Gm-Gg: AZFdTZf1ntJSNVEVrnGcdpce9MFOa2aOdENYyAvE/X6CF8aKgKMWA7j1XR3/JhN4Miy
	Rg1mQsextFKjVHhkbz9F+X6NEXpbF85Qreqd53eewiTJfnkrkJls/Eed0oGE1MChWzmLvijVIod
	M68yUdkoeYDUFPpnzmMaVu1mKZ6FaXYXRadnsvquKVutI8wyeeX2HB8E33mJBTeYmrHuHBu8jdr
	QWlZAZCeS+wSdxgCcqEDHMdkhBW8upcsFLr+JKqJkQS30zREOfJ5hYeATlarJd8VmSc1dIHrvCA
	VWt4JR0BX/64GX/S7uJ8VcMfTX+D+f7l1a+3WLE5DmG0n2t+5ugUa8RwOCd/tG/Yv9vqmKer9Qn
	RRWtX/yOs7Zjqtcce4mPkIBWuAfaBW5TZ2lPxiDipRkndnUFjxqr9u8jDmDyubpc8tc7JxS9QZo
	hKQ+MeMQGZx76nxgWc+MNjHgxLCrdu57mwvJLQ4Kw4zDZX3WVyM6ouvpR0KOJ6mTDUSoFdnyKXz
	2sIKYWzjERkO6fczD/Vxgl9v2EwpR757aAZcuxuRqUiETBL1Oc80m82EfGOYU+TfyxPHX5RR+sx
	/hydK7EEyeWhL41xOPRKK22Mjj3FDLrYxYo4S0dBjLF2DVyvPyvJzxwkrgUPOIlNuYUIjfGChrC
	lTGfl9AhHkEBk4MnFpZ4L9LmQ4AIBx7+d6NhbelFy
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr10341532eec.3.1795343786729;
        Sun, 22 Nov 2026 02:36:26 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm26176803eec.9.2026.11.22.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:36:26 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests/alsa: Test the sequencer UMP MIDI 2.0 RPN conversion
Date: Sun, 22 Nov 2026 19:36:11 +0900
Message-ID: <20261122103611.3264343-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122103611.3264343-1-sammiee5311@gmail.com>
References: <20261122103611.3264343-1-sammiee5311@gmail.com>
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

Check that an RPN and an NRPN from a UMP MIDI 2.0 client reach a UMP
MIDI 1.0 client as the four CCs that select and set them. The NRPN data
has low bits set, so CC 38 is checked as well.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/seq-ump-test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/alsa/seq-ump-test.c b/tools/testing/selftests/alsa/seq-ump-test.c
index 55bb7ea5b02f..7030d061dfae 100644
--- a/tools/testing/selftests/alsa/seq-ump-test.c
+++ b/tools/testing/selftests/alsa/seq-ump-test.c
@@ -620,4 +620,24 @@ TEST_F(seq_pair, ump_midi2_to_midi1_note)
 			  { 0x20913c01, 0 }, { 0x20813c00, 0 });
 }
 
+TEST_F(seq_pair, ump_midi2_to_midi1_rpn)
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
+	SEND_UMP(0x40210001, 0x80000000);
+	SEND_UMP(0x40310203, 0x12345678);
+	EXPECT_MT_PACKETS(2, { 0x20b16500, 0 }, { 0x20b16401, 0 },
+			  { 0x20b10640, 0 }, { 0x20b12600, 0 },
+			  { 0x20b16302, 0 }, { 0x20b16203, 0 },
+			  { 0x20b10609, 0 }, { 0x20b1260d, 0 });
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

