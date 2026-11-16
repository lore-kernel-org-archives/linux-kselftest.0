Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798244;
	b=pecgta/0fSTJeLOnerTaztOddvPgj4SiRD6XF9xFUXqq2ortqnWBUorpBbNAYFjfyM12
	 vfkP5grCNGDEI8fhhHP80CM2KaB6Avw+bO5Hxx4EgWvu3ssIhzIZKVaUk0XrPDpm+SVuP
	 /VZISn4//tlxwfVfsHUycZfJkFZ5rVsnzbO/RFeIzfy0L2TSrZYrp6aWgkwGHMqviUNFc
	 0EzwbOqW/HaZYJqNrpfi7IBQBpDdFdbnSR7EGFbM5mFb5WY8s2ZBO7y8dYxs07OvqhQNW
	 hT7qNnjtjJ/rPhaTvZPl7Y62apbIz+I7ybi+ofcbzp0wVmqPjqipYIfn4jk5wAZu23Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
	b=XW7iPr9kSSVnr1UfIqzC/L6cu0h817d5GEsVMsOnL69aH3jiD2q5EpzG0binsgC2QlTp
	 wzoumwvImDZzF6c9riIlTc2eVa04PdL10SjbItxhU1qTrbPg7vRAX0t0Cwvl9/9KHxeqa
	 htrMKEWqQrpAbS3UZ4pW4xCmumbJXTSVCylCfoAGpK2Bzx+mxfGqsue58NU0J11U5mbZq
	 WW8i5bMsNAq7X6HtnNnbDh332VGSOATAdMd7zVK7xVegXLzs7yhhU6o4XBsCRd7bDnzY/
	 WQ6R+9WaDb/Ps3tk1LtZGAOPXBNPW60LPFODeYEAwpOap0zWal3cPAt621/pd/yTO/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvDJNgg;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12796606A880
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12796606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvDJNgg
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so4520628eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798243; x=1795403043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
        b=bzvDJNggqUoq0TyUa1hN7WNyA7Xjm2AA4kC2UrJ7yMrYB8dbmketv7XDbp95p336CF
         Y0HRuDTMJMUlQGYxnFRLuZzDz5ZD8J6nB4WiUeTqyeRe9EC6bd/1MHxxOv84ViTWC2Ao
         Bh6GxxOZIIvYWh5y7RuU3bNloKyB3ZHcpBTtXY0UEOiv/eFMYcPzgUqcWxWfVEqWAfS3
         txCzve78djzcTRd+Hr9clFzcb9X2HruJ42HaxKsNFn/eyzXkK0nSSyrPgijMKuHFK7/e
         UQOxf21Pvbt5qBHeXaK9VkncOoJ8LnCr45/amjLJHenTxeUtN27BQ0ANP1DxT4UW183Z
         /xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798243; x=1795403043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
        b=Jkxb9cEhoDBvErBIh9SvE+VxJQGUQb5SCGOwY6LOQnYQ8X/ookqQwXoboiGyaVEoph
         m7tnQJDE09EdmJJNHYaKO+NSvVb4HkDeLVrsCArqDEsN+QZziF+VNTQS4YY7ncRvotVr
         dTgNBYjaHesOowqV8e70KUv2NJqzb73Mt6Wl6v1SPfhZ95gJiW/9qVi3pqnsVB+FrDN+
         OcQEMMlnEJElnni6Kb0pzdQlhBOGlM1e+sC5w9ewW3fKoD/THpOdIxWSORN1B8A4+Cnc
         yNVg4/v3tKaUAusuk3FHMwIrB8IFppS0/faWjzY+Q1zcANNtVDfQ1NQpImopm2O7xM3Z
         8/tg==
X-Forwarded-Encrypted: i=1; AL+hErGBEKgoNFYL1yjl/3zSovcUQ+0jna8S0UwaKixTP7YfvaEejOz74Mc2SzXZHzh1SkVwYUNF3luuEtDR5nj2ytA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u1Z7wxD0CBLYpnKAb4LnV+nqVmlN2/xPeFzZB+K48nB8ujG6o
	BIhyd0vaxzFBezfqC+6SNU4+KVebPBuL31l+doI+wAhFvZibaSWyWFWg
X-Gm-Gg: AYBFou10ceurRj81M5P+VEZzwY1ZbZ9zx8tM4W9YjKh4luWThRmKRU26M5xViZPP7wl
	5ncK8Z08WAZq/R2cCK+U6b30XouqrZTHaqePFdWpksxRYRbnu6Xdt/36vTGTB51qK693hmWjwHu
	AD9hEyggcbdZWvbN9A2Y5dUxlG0o6I1DWU671bnKUXDJ+LaRWNZB34NlhfWlilwSjFvlhtwBxJd
	hFJpNP646LK8wQAG8/eUOjpORiOOLSDH507Xv8bDAvYh7vfeKqfKl3WaH9U+VVRGXu0UgvvCV0n
	81wKng0oK5pZtGiPoYPmNUxUL+RkVckUyzCMmDtr99fcXUlcfjtPF1V7CWPoqLB3U4Q9qXiGpGt
	A1HZr1dtZfsd/wQJv8EcBF5xUb8E1a0PQ9Wcf7FIPe+5GEeF9v4tBfbLdHpbWR45FOsM7J0DbNe
	MrDOnvpvE6jlXjCogmrbiGD7AVE5R9O7R3WYGnB4J+S8qJYtXWTFnfJXYyP7zagF98c4HHaahtE
	UnKAsFdij8bjfVh9Nl+HkypWlklEfMBf8v5mhNXTj9cpQzXQtV+7Ms798DGwOfUVVO2/+d0DMAc
	64f70DKN2eusWWd0UHe69rndCuoM7KXvAcGUpj4ZchIDYjKB0OTQdHExJ81rlLK/cH5WoFjNpbq
	8Rk91uEgWB4l1JyW9eX+QcIiDykn0VgPP4JsW7pe03q4=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr17694637eec.25.1794798243051;
        Sun, 15 Nov 2026 19:04:03 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:04:02 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] ALSA: seq: ump: Keep a soft MIDI 2.0 Note On from becoming a Note Off
Date: Mon, 16 Nov 2026 12:03:36 +0900
Message-ID: <20261116030338.422671-4-sammiee5311@gmail.com>
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

The cvt_ump_midi2_to_midi1() scales the 16-bit MIDI 2.0 velocity down to
7 bits. A Note On with a velocity below 0x200 becomes a MIDI 1.0 Note On
with zero velocity, which a MIDI 1.0 receiver takes as a Note Off.

Send velocity 1 then, as ump_midi2_to_note_ev() does for legacy
clients and cvt_ump_midi2_to_legacy() does in the UMP core.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index b35e3a50ec52..b42a7ffbf31e 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -457,6 +457,10 @@ static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 	case UMP_MSG_STATUS_NOTE_OFF:
 		midi1->note.note = midi2->note.note;
 		midi1->note.velocity = downscale_16_to_7bit(midi2->note.velocity);
+		/* a note-on with 0 velocity would be a note-off in MIDI 1.0 */
+		if (midi2->note.status == UMP_MSG_STATUS_NOTE_ON &&
+		    !midi1->note.velocity)
+			midi1->note.velocity = 1;
 		break;
 	case UMP_MSG_STATUS_POLY_PRESSURE:
 		midi1->paf.note = midi2->paf.note;
-- 
2.43.0

