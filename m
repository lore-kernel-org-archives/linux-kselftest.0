Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665344;
	b=2jxOea6ffJVCcUHkVbG5Rn2Clb3RusaK5O19L+CuPqCnItMaYYUBG2kgr8k5xQf8/50S
	 FwAJ90d4owkkhIVxTzMSKtiDIr4zE/uGSfzom8PWq+ZFvwRt+N++bjrL9hC3gJxz7voxw
	 WD8DJSx/MWUP7hcuXASo9Re7YHNpYJ89vmw9cs0GqY0oGSzPMve+B2dEd3451tlSClLTe
	 iz1ASsqzAgmy5S2oc7wA+Xc5zXl1Ys9wDeeEctFTKcYHEAwp9rW60JIaIxAkXkOnB7Qrg
	 VSgKjk5E0iVx3s/DYCLEFIhrIIN1s3Ixd36cPYAIpbW99wk8yMiwlU2sANN/PgA9DvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
	b=goxw7ydDh5wKxnHoI1R2VWZPehz8t2KcgXB1v/88Sb7paoH4e7nafiG0AtTsW/kAZqVs
	 8kSaUjPEp08csj2AyaTztDzsc21ybYuWSDftakUnsrECs+p2RJPw2Y1Spx+eQwvTLY74e
	 HlV1Jrn405a1xZlpdRL45J3IfVyAqv7Uq1DbRaFPD2eJa3cTvrlPZsCK91Xf21eJX6i+3
	 3METnSfKacpcrNEp06Xas8GlOK+UwrzvdTiySKqEKHAXzuzjxT6WldCtYTLKS5dS17K1A
	 qLxlGWljXnQaWl4YFcnlCeJjCHa1H3Lu41qIRQsjXChQ74vngjlzoiQVrtM+TII2sQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="msI/o92b";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B13606A329
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 03:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B13606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=msI/o92b
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3938766a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665343; x=1796270143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
        b=msI/o92bEHnsjco9Ke0fI073BxQiXbX3VM9rf/9oUFGDcNUWNjQxV6Vno4qbzpCJIj
         7I5HPAw3UUvneqRFGSgmiw3EsQIPhKQvKSdP0gwGr+f/8Wl/tSeny+5Ff8d3IEEOcPxq
         4Hw6VKA2j9ZQY7hfSVHWwwsfSrInQ3ewHihSo/3uBOtwAwJkIuL6U8ffgIj8t81XlmNM
         ap3flkleijeEP17wAQt/vU2Niu4jI4GbmAr5cN0jLuGYyhb1bTScXugaIW+/aNkfWksT
         3vh1sKZBFclsHKi8MgF8mcY3S081l6v+n0nf9q/TS/8RdNR0AU+76wSYKFdRFc1JZuy0
         aISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665343; x=1796270143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
        b=HzC0hCU7/Oe/VZITanh4WQ5GGhgE3tdmoWesVzvP47p0ewbrr+I5UJ2LXJ37G0xTeu
         C76UEoCnnBVygCIddCZgId6XRnLFIL/LOE+FC9gjWOS0NylMv9JTLbSSxvV/NsvRwfjf
         21wt7Iu5VLWgaF+7gUVe0+BLeiE6HXglChRUbT+qFuPzL1LPU1Ue7/7EwOxrvlhbdSj5
         mQ2IZDUXgpTEtwaq9mCbotdVxOvy5tryuoIlu7MTlnqUY7rxdtsvh+D5/ERKdYOZIyfr
         tgtcTylYI+d6qnjnblF83BxU026zX2L5LEh1LWl5mypR6hepsiPxQLjIm9jY/Oo+/T0H
         31KA==
X-Forwarded-Encrypted: i=1; AL+hErHbi6QfkEOi03Uxcy4gaLFhiFSvSFbOJAwdVoaOHHvFS+Egm1pg44Sd2UI/gOkGBh+CWz2FQ2rf9fzcSDPwvHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z97DZxeM5PjcLOPfGkwuTuaNB/ZpHKbVED8WVRWn2Cj4/Zc9pvI
	pX0A8iXUY9d28Q/DxlR/x7PH96oBsicu/moPdsQ53WzBlV5J6Ik8r0ZVHePdTBNRsHY=
X-Gm-Gg: AZFdTZc9vu1+kpixAECAV26w38bQvRytMCv5MqxAdGsYt0mCvEu914qzMCovlZumTa1
	ZApnOje/e+ZTYud5TuBR70cA6VuXOweBr9r92BKrhRcEPn+mObxubGtZMsaKfKzQWduo/xc7OfW
	z79PHnzy+JLcj5HgiB7ah8yRYbNS80VjYd1Z6x1N0wVqnyRWi0ELLXmfOSYDPm2IKL1fUdi30Hb
	lYMQLYyqgmlmgDMKEMdu5W1XJt7ptS6kTwRwGMXdXd3+ElyvDbv0RCQDjYbS7vnsLJQdUaPLBlK
	X0qRnn/boE1+ztZ+ymECff2qTzQVvYTNC7qNylWWjRNRmw79+n6+WLOgks1HF6RWFmT9nZ+L5AI
	nrmkF7kNAIXUCjtbRG0XevQ+UiKsP2RyG7mQtVCK8FgKRA19OSXJoEdh99uQhVHtgAbZvOgiv5n
	fPZW2JZR/2wj/X2SxdqQ0W05uu8XoZBB1U8HBmWduAIQiXynDBp5tN6dWbq8jH1bWrcmPWmWHm9
	13erNYWHaR9fw93A+TIbBKKGatrIA60WmPw1MAfSNonYDzHNflOWamTHr+yarnCD+QfgGZQkzwF
	0b/nYxXiNhZIuZowC3lrVNYdPu4AVsLLTmhkwlky0bvWXXec6MJn1QKFz67+HfF7zfWGSij1Xel
	eBg7C9Sy5fX/nyomdg6ChhnizFCARaavKo5iQ9fiqp+1b0tgY0Vtd01tWwVdrng==
X-Received: by 2002:a17:90b:288e:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b41c907e21mr18204723a91.26.1795665343049;
        Wed, 25 Nov 2026 19:55:43 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:42 -0800 (PST)
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
Subject: [PATCH 2/2] selftests: ALSA: pcmtest: Load the module when it is missing
Date: Thu, 26 Nov 2026 12:55:25 +0900
Message-ID: <20261126035526.1779288-3-sammiee5311@gmail.com>
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

test-pcmtest-driver skips when the pcmtest debugfs files are missing.
The driver has no device to bind to, so nothing loads the module, and the
test skips even on a kernel that builds it.

Run modprobe once before skipping, as the net pktgen test does. The
module stays loaded. In the default order the test runs after mixer-test
and pcm-test, so the extra card does not change what they check.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index b796a5613c6f..ea6a9e0f7483 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -6,6 +6,7 @@
  * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
  */
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <alsa/asoundlib.h>
@@ -171,6 +172,9 @@ FIXTURE_SETUP(pcmtest) {
 		SKIP(return, "This test needs root to run!");
 
 	err = read_patterns();
+	/* nothing loads the module on its own, so ask for it */
+	if (err && !system("modprobe -q snd-pcmtest"))
+		err = read_patterns();
 	if (err)
 		SKIP(return, "Can't read patterns. Probably, module isn't loaded");
 
-- 
2.43.0

