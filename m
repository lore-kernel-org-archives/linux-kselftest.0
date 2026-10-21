Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581962;
	b=Pnk5J/jYMkj/YKxaq0tZJJn5ALxlpeb7ELAiDVe0kXgcbsenFwhDoOACxj31jF6Dm1W+
	 RcklOfEGB0E6S6SNqwuSWVR6/5FMI8/wuckktj0qs9CDmuy1diI3kDXB1pzrzbABzB1TP
	 IFyN3vTnUIETUBIyuGHd35z0PmEmrcDq227mzZJuCPEylHDg/u6s/VYdz3EL3+jb5Tuxd
	 xJU7kMewBNO5plaum7nkpBoB2UXC5aoTJ/CSHyPqkMI/cpzkfOogJio026APFcWjkFxOE
	 fxNuGyHkqJFMz5/VoEcgOUzZkXp/n7ym1dpC4Sq8M1NBf79dUjNeseqKqWRpATFGBNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
	b=oWssPTIgn9MVkX5p94T7JaRY2ucy7IftqW8W9OtAy95AaCRy0pGJ0U77PadP0058xin2
	 Lt/wLOOjgsVg2et1Vo/JYxvgEzwv7L9zUFJOzC8cvAROA0tPJK6ZKEVXIFEX1qXF62vew
	 kbzio9KR7IMVT4ik5lz7kvcZyNGEUAfFkXc91OhxMVISp9o5RB3fVtwjccIY1mfSI8xAz
	 1GJx+/8w1lq7eazsMM9HN48re+kBH6t33eZA7ZnY+xsG2m/xyR6VTfnyG4AORANXK3a6h
	 JaYTUmezNLiNC107r2NndNe0YCM+sZlXvuZPEyj1Qu0VI0wol6zy1r74fOawLSCUD1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkLC7HeY;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB82606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 11:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB82606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkLC7HeY
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso1083973eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792581961; x=1793186761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
        b=KkLC7HeYFLkHWL6a/YJIjripfrp8Tlbapk9ls0aJmQSlRiHSs3GU0Xa2g9vkueejnn
         WGepQ0sG8Mu4CLV8tsdpkkx5sVuMVlnWNE3BU7BnRQNGMqEdP+T9wl40+sYZIT9BZjA8
         akn2KMFElAh6pXjn86N+wFie2wmntjE5RYBkBxqwaHx5kamu8DjWGrwqgPHrU1RMrSIb
         kUeX40BH0ZXQ9y92VNIusYxBx+5sp60OUrmIX3dojenW2z0AyyH+N4nd8CpixI/EQqK3
         ft3iATIbj+/QXBxEUpGMwDSOs9powJaopfl7VRpwByD1k6ZQZitxxiSW/J1EHUeC+TJc
         C57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581961; x=1793186761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
        b=lsb4kCDMKKiB7cnUIT8628z4ua4POTXqo36py+SU7sPJJk0AL7Ma7ZLjmrgbhlgpMD
         ma+vROrU06JcuPWmk131Y2eVKOfoCHq74SXrlU1T894Rwb4YPDiqVDycSTmQ6PI1z8Ft
         RXpif07B4Dx0Lqb6iKxvKZa/2WW15czij6EjQrDW/+p0DaE4o0Alq2cz3ta1uPCTiYCq
         TUTCcM5y9o1dRsq42B0CcCEDjsZ4Rymj3zeGvpNneaHj45wuehb5fm8lo5VEg4IwodGu
         VZx72w0xjbyFGMFxB7Ubq60fF7nZS36aczLe1r9ZbqOe9QFp4H4Yf7HywLXks+SNjSEe
         jPKA==
X-Forwarded-Encrypted: i=1; AKwUvBwpdq/3w3TMflie7roycEJoEAhLJ/IdpXqSeQT9FvBbbDepAnW5+Tg0bCN7oQeMhNA8ZeZFZr5NOU7SJA5+WNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7khR+dpp1WNM8wk76kWibvYMEpXxb1lCI3aDI97CfAOlk020a
	n7oMyzTAwAYavEKln0Zjk3/ZN4nAPr2wygxtbuRSDr2Uf0V4eLjQQfOw
X-Gm-Gg: AYBFou33alIYw8w30qwVxicaju7M6Vrx21QbVz5hZmtNkcgYjLID3GzQmt8DgasHRV1
	0GK0/3R3D5EBrpEkjGsgoO3xiU9lyC4EpIDiaz9WiR5FWkNhOJ0x3pMQc4Gc8T7P3r/tyA7zmO7
	8cPpAKmqXwX2qfqBgz+y6nefdACHzpBIJ4V9Wwa86EPZUj3CdVNlvfec5yq3+yesbewT2Nt4PSU
	zDX7tTwJ19IJSWdncjC3nl/+DkYBGpyhrqFlSaSyhaDlBwk+AzMPRWa5PfERMklhtzYswbkL71L
	UrNGRsjMsthfsTPCiETpL8HUm9DBWq2u0uz/6+6WRUW1JLCvTfvmMZHZe3kY8hdBY9L0qrG7iid
	tLlc9l7Kgu0T2fZOduliKmYlJ4a4Gn5B/jUJfG9MZsfUcL2L0EZaRSM5ZCHcdnSpEvDA0Y5LRTJ
	Gn76hLZAiSKsI1SnqtFcFXI9wGcwUMIUz87Rp6A8k623Y3gO5m1R+kWnvPSsD/CsKcQZS/AD1oj
	nx45RVxRNKYU3UBydE9ZbUv3DvOYUhBLIGzpiziFEkm92WgDc7ThQWcHaXwnf6at5EAyfdmA4SD
	rlFVb/EO4q9c/U9eB0ZL6o2mwuR+krZAXYyGRU8AEMeBXUF78NcjMMXd5AVcxS3IA54=
X-Received: by 2002:a05:701b:2051:20b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-190a604f7f6mr2326894c88.19.1792581960622;
        Wed, 21 Oct 2026 04:26:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm5810344c88.17.2026.10.21.04.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:26:00 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] selftests: ALSA: pcmtest: Compare all captured bytes in ni_capture
Date: Wed, 21 Oct 2026 20:25:54 +0900
Message-ID: <20261021112554.4037107-1-sammiee5311@gmail.com>
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

The ni_capture test reads rate * time frames into each channel buffer
and then compares rate * time bytes. A frame is sample_size bytes per
channel, so with S16_LE only the first half of each channel is checked.
If the second half is wrong the test still passes.

Compare rate * time * sample_size bytes per channel.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index e025a7bac26b..18ee72d5d4c9 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -265,7 +265,7 @@ TEST_F(pcmtest, ni_capture) {
 	snd_pcm_close(handle);
 
 	for (i = 0; i < CH_NUM; i++) {
-		for (j = 0; j < params.rate * params.time; j++)
+		for (j = 0; j < params.rate * params.time * params.sample_size; j++)
 			ASSERT_EQ(chan_samples[i][j], patterns[i].buf[j % patterns[i].len]);
 		free(chan_samples[i]);
 	}
-- 
2.43.0

