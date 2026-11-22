Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343779;
	b=Gl7wt+nBexf8hXbrDn+mRSxYphD+3tQh18BXETVAMJ45oEEMtb8Lq0CBeYbDYSb9Hvh2
	 wbcpw2qNFZBEN9QLRRuIqu1uabZ9jFogZu6A8NMSn7bRvgpX157QteKxM8L4Uakq8Z/Z3
	 YuXAzuBBs6+m6ccwiC1k6tQsqdx17Kb2/8xBjZIA50C7+BMzEzfF43lVq74Ex8u1ncAVn
	 Qyk99B1B4c+Inxy5QqoFece79Ev12jN6pm0AGpRw8WQqlFqobhNUlTWPjU98/KvPUlFXX
	 GrlYm7yE3MvfgX3Wb3RGA/ywtVu+VmTrhMGdWmtDF2KHrbGzti6gndAODV8fk6wK/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
	b=1nP1xw1LJeyHh/+ciYayUr6Vk+TKfbhqNCohocg64U9Sciu+LsWiQlAV6sY0JrUBvBhe
	 d8k/HwcjD6hJx0AmAZYgIUEpYeB1jM4veft7MxH98+6742gpXhZHvMcimVU/wqcAo6m5l
	 gdPkV9xHYHAMUbamd5VkPeBRcRRIAWdAhzpHvF+80q4qIoqi2+93IAM69VdnztF72T1Ul
	 Do5A2VjkWpwkrOhbKe0IXhnRetZWqEwT5HZv+apKWzphUW+qs//jqVrwB3Sk3nQhN5zqu
	 WvQ4fnaQ1p/DoRDYmnzE8RM9dMFL1h9TdYG89G1j/5D+HGXOSYRcm2yDHUlVtdOAGAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NHbP/zuj";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9C2606A332
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 10:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D9C2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHbP/zuj
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3863db981d4so2943516eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343778; x=1795948578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
        b=NHbP/zujJOpVBIV0m8IFi6zdapbIMuZEKUzKc1Mcw/QTHVdtTDlj+CNCR/eMMP7PDK
         dTSb3zc450m9kpRmzdWCMUY/VKxgf12GZJiZ38U8P2EqmfaswaB3NL7Cp+p6jv3CouTc
         29+0y7Qa7/qoPRzQYX1GTfiIu5zbfVrLldBe1OvM0RJCzK+fteJf6EAeWz0+6n38Vo9L
         79wVgpInJM1iT5lj1iZ6xLHOyRxLShUoGF39CedT2uDUqL5d8f2yIPEndFOk6PvFQZrV
         G5Ry87DCGUU5/7aYTrWHo7oAS9dPmPL8e86GrKgNZuwp3hRVrWqEpmTAS/hZXGM8U1B7
         7Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343778; x=1795948578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
        b=NPes8Yhjz1FBy+3QU6L7TgtUFmwuumCnFspAJPFTTTZu6C8ClWUpAEJ1DTTP1ZRbWc
         ax6XzHlH29Z0aXS3HkbeQrDE+ggg0HJN9StaexH2A0KknbFjJDg17f3AIdqE1YDX2v54
         2Qtf3ZLCenSqF5JuzPr2tkPs1kGwTayc/fhGJtOjclcJMr0/E/q/p46wnasRRih8zmMn
         dZmKtJDO43pS/xCSP0zu7Y5sblfkpb0QFfN1LjWGT8ZhqcorVt/dLyFdT+mSAdSSY6IM
         x0Qyp+hDL54oSOxVBoxL/TjsyAr7xiku1ycrGgCgJYST04FEIYFDhaHr+jbE3Vyt+AI1
         hPyw==
X-Forwarded-Encrypted: i=1; AL+hErFnpOEWDBoXfwkIi4o2GX/yPDwjFXWdtqckHaw6X1wgto/96TgejHKfD0kOLmHV2EcOInuOlqeTqHevWBkQoU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tPNdr4KITjUp8U+NmH3KJ1XANLQTtOhbQg9TIGnlPBwRUTE18
	wiAUxG66uDKD1pvU2eNuYJO97wdXPq5EqIbXGkYCvjDzsW7l7kOHO3/P
X-Gm-Gg: AZFdTZfSI2R0odg+qx3p8ycxEudhy61TMevrkp/ugbZFaUTJD1gnlGYnY8s5pUBJeQA
	r62QmL7j8iRwlaGSWErTmy8OcBzJDIFy6UbiW1HH6dkQG2Vh1cL6GT0FjF2AJaVaCqxMMqktYF2
	Q0HC+gTpW5wMgB5KaWIdhbcTgDdDu5FOIRsLYeBqREGKhsCCfTdDExp6N6oKweuXj+6IKR0Yq9X
	MYq6rYpAPI2yhMNNA4AdwzhQFllpO/Dx1Du6rszHqWCYg73dsROhbPAJV3jZokhFOWT9+J5vrc7
	cWOdiue7r5zIO6RMbNRfUmZs6Hz68iKiXXG2u0tg6lwMD83F8uhso3EGuV3DXnrhSkMXdww58Qy
	7MKRgTZmrsiWOKU3pBMyu5BR6ISvJdwafdO11HziFWfvejHN/vrK3DtGBSRGqxcDisEjNr5jQzQ
	lzrLUGxsk3pIAOTq6JOKsCNPz4mHWTcbFXI4iM/N/3ZJZKurO1JIRo5J9wtGTzdQe4yCirQQk1w
	Tk6xwZZsH4lql8BOyv9RH7pRDbJdB2ebFzlPq2m6OA0PsLRBacNzpPVs2YV/yB0pUUAlFxdz9Ve
	qsEMcpZE0fKm0lIBT/FRZilS/czLauRsG8Hwp08urniyTDr1LZiB9tBvOxXnyStyXbKaqM75KcA
	Z4gog8uslQfF72xDuVfEHOm6g+SOvHbBgv5OH2fB7pLM=
X-Received: by 2002:a05:7301:2222:b0:384:2662:a7fe with SMTP id 5a478bee46e88-3856c9a1180mr7697616eec.1.1795343777651;
        Sun, 22 Nov 2026 02:36:17 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm26176803eec.9.2026.11.22.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:36:17 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] ALSA: seq: ump: Convert MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
Date: Sun, 22 Nov 2026 19:36:09 +0900
Message-ID: <20261122103611.3264343-1-sammiee5311@gmail.com>
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

A UMP MIDI 1.0 client gets nothing when a UMP MIDI 2.0 client sends an
RPN or NRPN. Patch 1 converts them to CCs the way the core converter
does, and patch 2 adds a test.

A related question. In the other direction, CC 101, 100, 6 and 38 from
a UMP MIDI 1.0 client reach a MIDI 2.0 client as four MIDI 2.0 CC
messages. The same CCs from a legacy client are combined into one RPN
message by cc_ev_to_ump_midi2(). Should cvt_ump_midi1_to_midi2() do
that too? I can send it if you want it.

Tested in QEMU (x86_64) on sound/for-next 1afd6b7547b2. seq-ump-test
passes 28 of 29 without patch 1, where the new test gets no packets,
and 29 of 29 with it.

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  ALSA: seq: ump: Don't drop MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
  selftests/alsa: Test the sequencer UMP MIDI 2.0 RPN conversion

 sound/core/seq/seq_ump_convert.c            | 36 +++++++++++++++++++++
 tools/testing/selftests/alsa/seq-ump-test.c | 20 ++++++++++++
 2 files changed, 56 insertions(+)

-- 
2.43.0

