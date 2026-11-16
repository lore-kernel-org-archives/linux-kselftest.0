Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798242;
	b=dHGGDbTrIgwFGTpeweNSNe+te29ozXLX173XGBOvoINA+0aymOFBB5LoZrU35J71PtyS
	 EP1HY21f3tyJVZnLyJ9ini5kxdguanwXx0xhYfYf86L3eAeShmKWR/ojg57xSkUPU4XKc
	 oCfgiyAQUbLIoR6DKjg9qE8VrkfjtPcrNdEUXozuI0+WCWc5gBLvEXw90Pnu0k9T94dPd
	 p1eD6bco9+q105lXbq+WujfhVwtP8pkynd6nLC4LfYE9OGQJLfQqOrWfujF4xVelDCGZA
	 oRP4Cz+1YiLY5ycfJLVX5lJw3FQdS97DYTrM9re831slj7INRLLFp2rUKJop/wa4bIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
	b=jE9SeQOiBG19Wx/x04nrRKxluL6yqAgCLZUHZrLSQ1a6Ddck88EH5/w+MbHUfUGI7EIN
	 HSG4JzmXmI6qd4x+M2qqu549c9OMTy2Z6PsTIERg7migfIoTAfxW6veHzvbjd/dTqYPe8
	 LKocfNJCvZ24UmK3K3DqBgtoCu4LCMneBxxluuc//6YXV6DSBFgwMLbbS5vgQS2y8U+J/
	 0IHxEXN3s8v/Xuj4jQG3c5/Vdz2+r+PWzodWQKz051hMgIQm8bqS2T616qJ0mT+Wznyfs
	 V8vEVSYNQq24XKQZPnDP8lcZjBr2AGM4qWWk6cDtN6ssAPLxU2RPEAn15mfWwsCi3ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybKS4G7a;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51929606A881
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51929606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybKS4G7a
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so8650101eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798239; x=1795403039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
        b=ybKS4G7akInIdfyuopW0i7MzNAHHhFJs0VsmC1NaI3dodJUHEUeD9GYw5jDoc+Y+2z
         bKKvyev8t+msX/NArlcSHiHRiup94Bi1hrRxuyVIkSvo+7Wonh5p74vBPp+lXf4d7LQW
         hShCDEQfRFUF1svOwlYaosXNmsH80bj5XZq6ahsAP6h588kapU+P0aR9tY7HIVpUTCgd
         4Ul9sfPta+4Yh7qS8ywSa9NKPMo3dNcLMvI4+qhstc9eqPUKqHcdSINel9sK/jBjIoNG
         yWebFEGEZjHkpDb1Yr7B+HqM6uMWF8u0qzt++bWztvlpSQHLd2gLXR69BpV+MgqIyrHI
         6M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798239; x=1795403039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
        b=lTY55LjdIQRiOvXEB3CnfmaghJKIMiraDqcDZzEG50h0AaCbEK7KzcCKqf7x9ZrHQL
         w5lQPuMTM8FlbDlOJK0pAyxunOrjCHZW/h+XKhTQf/8fDdOLi58EOrh5g+a6SHc6f3Yc
         iZvr3Pzidii6rXFP5s6pdtSsudyoWNhTvDH0cxD1aiNv2Q5K4x475316jxtQpY+Dpb3d
         XusX9kgHg4yIocZHUqCzBLH9DuJA7psFGHVe03Tvb+atWuPUG3/JxhdlF7vzyF/SXwxt
         6Tpjqisr71XvIONjptwu0yh9ht05HecYobpmPJ7edBR8RqfxgeqNC9uwxxMIYWTbPAX3
         DcGg==
X-Forwarded-Encrypted: i=1; AL+hErFSxWRCZKg0AlEH3cnDqJYsQqt6WOtV87RVUv3ltiL84ye9O/jNv3AhcasQfZc/ac1WBOwLeYxRGXTDGKH0gII=@vger.kernel.org
X-Gm-Message-State: APuU4Z99UF7/BPWL0oAiGwjwqkrKAapNtWQ76hmSko8JefJE9oU+d0ck
	I0sayhO/ybhl62LMr70Kl21CSF43HpzRqHB37hEP7ELapMy8Z/dP2I2lN8rBlbUzX00=
X-Gm-Gg: AYBFou14agddBwS0+XYgblK7QMmLiHEElQWSOvDuZo1VnmbZJu1QFpPxJcCv0+xj5I6
	1KbVHYTKBFiRqvY0oYUMvuZiiKgqbHUvo4LQ9m6Az1texUYVdh1HjRVMz/0LS3/18/M/LJRVPCh
	7975NqlfG7le3r29DM4RsT/UzihZ+UTxMdZsIoOLmlhnWhUNjaBp/Luifntv84nuelMLMMoCIBl
	dh16F5y5eySa2haumBi/clBYwtA3+ed9NSxG10NR6p6IkIIMC5ovVMs54fQXd6nffTyXKJZJ8dN
	n7d8uNIz5pHNd7RFoVdiMw5wH90o6qH9VnWN0R3dSe99w6ybgltMuZftWidEBVUdWUI8MKu/lhP
	yb76O0v438VVINIBDgzAGkP5xFkIZn1buFzn/fAH2jPD1e0132WrRWYb24vLucfe6EXiD57hnQY
	E2LEsR93M9JHs6ZgqIcW0U7Lpe5FIGU8K1zthmA7KYmsDmNaP5i8Ef7DQKfAg7tq4ZOdVi+MdW9
	1Kf4gAT3WQ5d7CBb4JZGp6KUq4wcaeiQ/i1cgqbDgWEWuLmlVgvGtvtYiyzqxqW23LAdiq7Tn6a
	18o2O5i1QxPyn6FkecctmKutI9uyuRL8rXIx2Vy9Y4+HOz3LzOb4+lQlFQDGZkGelMVO7QJfQ0u
	37vh/KoB+wPN88v4EJMOVX+wxj9FUB/3PVVa755ksm2A2vJ6Nrz1yaT4mvveVYg==
X-Received: by 2002:a05:7301:1284:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-3796395410dmr13036616eec.4.1794798239386;
        Sun, 15 Nov 2026 19:03:59 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:58 -0800 (PST)
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
Subject: [PATCH 2/4] ALSA: seq: ump: Convert a zero-velocity Note On to Note Off for MIDI 2.0
Date: Mon, 16 Nov 2026 12:03:35 +0900
Message-ID: <20261116030338.422671-3-sammiee5311@gmail.com>
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

When a UMP MIDI 1.0 client sends to a MIDI 2.0 client,
cvt_ump_midi1_to_midi2() passes a Note On with zero velocity as a MIDI
2.0 Note On with zero velocity. The MIDI 1.0 sender meant a Note Off,
but the MIDI 2.0 receiver gets a Note On.

The other MIDI 1.0 to MIDI 2.0 conversions send a Note Off here:
note_ev_to_ump_midi2() for legacy sequencer events, and
cvt_legacy_cmd_to_ump() in the UMP core. Do the same.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index c248d87f7a83..b35e3a50ec52 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -380,6 +380,10 @@ static int cvt_ump_midi1_to_midi2(struct snd_seq_client *dest,
 	switch (midi1->note.status) {
 	case UMP_MSG_STATUS_NOTE_ON:
 	case UMP_MSG_STATUS_NOTE_OFF:
+		/* MIDI 2.0 doesn't treat a note-on with 0 velocity as note-off */
+		if (midi1->note.status == UMP_MSG_STATUS_NOTE_ON &&
+		    !midi1->note.velocity)
+			midi2->note.status = UMP_MSG_STATUS_NOTE_OFF;
 		midi2->note.note = midi1->note.note;
 		midi2->note.velocity = upscale_7_to_16bit(midi1->note.velocity);
 		break;
-- 
2.43.0

