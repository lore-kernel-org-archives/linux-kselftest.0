Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665340;
	b=vQ++O2k9SqdrDV8SS2n/kgA6pepLxgh/cRdE4w85QiTKIScTa2qpGgIBjbk7iaxRvxNp
	 TaePSyUPyrPmB17+gRQC1KZLoqMNZf6nivMk+ip7fRRrvMmBklpOBPKyh4lsuOYAmsjrN
	 NUbswqQt782hnUPzpvOPthvWLyCGqZfTqzZsgmjXei++Nt0vGattB/Xxqj+peKrbiXa9g
	 ZOZIfymChxjPXAVV+b9L5LNtYijFbQ2JMDee1nKYVsXFKuzySRPlSrXCaMUyT7Hdq+2U0
	 u7AfSflHJoHuDxmDR/Xd74OdFwngmhOLjAXKWgkCn4FnGSoK9pyJ16kbhb+PchwtFfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
	b=hFvWZWGuzifpWJM3eQfoPPmu0LmZFz/hRpIBIfH4W2OUTbfgd52V6BKjlEtf4DgDI1k4
	 kD1gZqQjqal8P5fdtFltTGSGQ6Bf8uUc4zBObabJ+ifx12V3vsvta96EPuTbhjFlQG1lb
	 AmsoC97OQlTMv3EbKty9GF6qGjYDTflD0ziVNqGcZxiLHDEBsuHDRcTU7ELfFywoNO10i
	 AyViGQgPpHUdGW1qfRmm7piQWqWAITeiTieR3iOUTxoJxdleuasOgUsiU/aPfzc8GDQJ0
	 pVAZNb1yjyRnWFWoVu6IjP6NhD867I2zhFK6Rl1808yhFVOygr1rrqv9vY2dGyN0+Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPismLtF;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF69D606A32E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 03:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF69D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPismLtF
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so3025276a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665339; x=1796270139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
        b=WPismLtFq5Vzdw8Nn3x6+EU4wIRclxtaK1grWHOPmfnwoDAUZzfXUDY4nq9NAKCLMj
         GANIvj9Y+FG28A4kXgbmKtWCNMIpcvYZaienVronBs5N3qZ4bo1tguMF7frVTREuTtyv
         fb5fzAuumNzc3XJwPZjidpRPRYH78Av7k7lkgw9d8WYkpYqrI/TJTmZb63Qne4izOLYO
         pgNmZByACdJHj5GMwEwH/FZIx4fZlnAiJGnzisoJvAcP8kZwXBXSTGtJrC55kFFdx1a6
         YwNpePuveMVYnzZ5mQbz9t2LsQOD/clS1vuZIOrz/ZqZvTE1kahiiSnis3MG2byNyVMW
         qJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665339; x=1796270139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
        b=GZdpkZnEEvuuutnjcFzTkulLQ42ImmHT9e79xDQLdeo7iYZGHcLA+L9JqDGSwbTcqi
         vljk7Uk/3FB2R9swoQKYVE/3uV7hS6e8peKtQ3tEeF1KU5dXZ5IB/noLdMJx9PP+Cgyr
         8jguGSU/ucC9kGaVM5mDPdRYHXNHa5R3Wgy4jrBbbYB4ZnEyqu0dsIY7bKEtPwtcCz/u
         Mk9TEp31dO+lWH8k/NkWMcasvWzhAcu3WO8+ecWAQua/WxLu8ctPZMT+jthXcAYxnnvB
         uuPqmB1P9mlhHVw/JOJaD4Sw/V65w6oF0MQlYQKa3R8OPzEf5u3c7Lsuz0k7OmHebDPu
         k3fg==
X-Forwarded-Encrypted: i=1; AL+hErE1xDFhBGDgCkSXx65pgKVW7UEKJc3Kn0NAQgoiUQSPQKxLEBEWvoxtoJgHjmJ0bmQmMRk8trXWY38ivO2VSWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z86VIxQtfVJ4PBJ5UG6dbHwaRqDYrmxhHtzLD2JouNakl9EUGo1
	PJSccXyaLUpB0bsP/Yr9SAhm2QiXZsJw5cUlS3Uw8qloKxfDkiKTRDYZ
X-Gm-Gg: AZFdTZeKh/cu1k4qSkZspE6hg2MsqGFu6EJt9FePBAKKkAnmVEUraGb+uvRId618MkY
	AE46VpNIILF03CCR/+jPxhrbJqp5ycSNL07+b6dyGD4B0HGX21FQS+GMRy4YTYYB34b/VdQ9yxM
	SrjLgnnkXhrBpqqv2biU3eovIBTPoehbGHJFiZslOQq9KVhSBE9Nkf9GdT03w8uIgvqihcdForh
	1vBJjVxikc5SEVGHdHDD338BjG1k48gFpjdabFJBkD2qXqiP2ztP5K+7/hHUG1lAEAnDuriWDyQ
	aIBxS7yd6HhVePTIh7aXTmG+8+JTAQfEyWY4lo4mGHtrMOGCT+VL82oGQuNXYmnNRn+Va0jq5hb
	pTy28iL9dYqrfaBy4uJxh76D/DtYvtMVVoMBtzFG2FmFpSuTPfgIa5q1GIJ1AD4w0IefJXeJ2UG
	TfNAGPnC+HGyjM8tc2rYpP1n5ThvBNxM4ZvE4no0z6LsnnvIg/wWzcDZ80h/CdysqFrAPm2i7WC
	ekSy8NDpq+OG136xz2nHQZRTE94syO0HPG6zNmc1PUX0INeNlJZn3hOHgsR/NnKiJPxxViPGzHU
	Oal9XD3hrzYiqFqOtFz3dkoX+trdhhVGGHoMCj4MzFm9BlNBXYBNmCEmuIhrU++heFRDDI30c61
	hdLZzEJaPiMgWb8nwF8NhND0oJU7uTFQaEu6b/EOJiskevbdAjYRrA1s6h03lLg==
X-Received: by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b41caead33mr17622224a91.38.1795665339096;
        Wed, 25 Nov 2026 19:55:39 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:38 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] selftests/alsa: Add a config file for the test-only options
Date: Thu, 26 Nov 2026 12:55:24 +0900
Message-ID: <20261126035526.1779288-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

Some of the ALSA selftests need kernel options that a normal config does
not enable. test-pcmtest-driver needs the pcmtest driver, seq-ump-test
needs CONFIG_SND_SEQ_UMP, utimer-test needs CONFIG_SND_UTIMER, and
aloop-test needs snd-aloop. Without them these tests skip.

CI systems build their kselftest kernels with make kselftest-merge, which
merges the config file of each selftest directory, and alsa has none. On
the KernelCI arm64 kselftest kernel all four options are off, and every
test-pcmtest-driver case skips.

Add a config file with only these options. mixer-test and pcm-test check
whatever sound drivers a system has, so no drivers are listed.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/config | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..67fa26a87217
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,6 @@
+CONFIG_DEBUG_FS=y
+CONFIG_SND_ALOOP=m
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_UMP=y
+CONFIG_SND_UTIMER=y
-- 
2.43.0

