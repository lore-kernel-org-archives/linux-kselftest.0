Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667580;
	b=qe9QHjL9BozjbXJO2sNtj27UgxRaD9JQoIVLzTiTeV/eJdY8OqV1mAXgawKMoIzqS/fC
	 bvplxB36NtsgZYLNH+rbiPzRMnkamnXrgBglGohENq+W/85fVsFPXK6X+gDHHKJhL/xvY
	 eh5hA377CaSA8DFd17JuRjML7TFtEgTgyuADKpzPHi1s4j4djs5p8QpcrIwT50Yg/FC+d
	 Sk6VhuokqMK+oJWNa3uKjNC2W6KFD2XdZkJGJehWUzxGOUEcLL/bEOtJEus5qcGfhsGyO
	 P43ChSnMySaNY6vAT1y+1pI5xDxMmZcSoJdoDM0S2OidYwLjuReKZ4THOqxIje4r9pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
	b=Y3zuc9hpfB+FMfKcOM8mcvYi8M6RsZz4PrF7ZuOJNVcbZdd08oGdn542XZSbc2JKcYAG
	 L2CT9xdolG2HSpZTMMcq1Ywq8XEmAPZeHwnch7DK28FomnzcnwIaBQNJUoadTRJ+tl5Et
	 eqno2NY+egvUBvjXBsbHDBynmjZy1349UIv8Xo8FziXYQqtAyrvsOQ3ZQAJfUMuiBKcHX
	 GzDVUnUtoXf7r7Wccm+W9FkgrMetRLFfTJgHvpl6gnoK2H/EDyFkwnuIAbRjypSV69swE
	 lnq4NR03LPpKft4wfofqfq31juvY0gjeI+lAWUPdhhRXxHor6PP9Q537yrOaXUxxocg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVlifdhM;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FBB606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 11:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FBB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVlifdhM
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1366419eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667579; x=1793272379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
        b=GVlifdhMD8peZksqyC6MnS7qD+0lfFkn24BKyxAmJI7BVH1EiCH6cO0jGnFHNGRWXX
         6UHoo9GYJnNNIYOjysaZOa3YZ2YK34NJ2BD6einTFyUg3t7iK7dqDH2UgzviMn3VR4k9
         rILnvDAmjRllXbgAIj8fMPvUa+mMWs3YSzY4YQ11kWHpBszPHDrzjoyNY+8kStoBi0nA
         5lM8860Mswqh2TDrmPZIMgkBgsHpw2GlR+mR3nf+fYKeXPaQOJZ4EThy+3V/CZo+Yea3
         6f5rYL4w1vQQTNdOiMCb3FisOqQsuWvSkgh4W/ag9VMCj2z2nyn4TFgFaY19zngFdWH5
         OHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667579; x=1793272379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
        b=GkTUcKgOpJEikacVAKXJv3dZJzuCwuXtlBcPc9GPRnFclqJLsGTpQwQwgA83uiR4MT
         7+yhyeU0sDrnSDlzQisktUMtRndC9Eu6oKItG2uDRkUVGCn28YkRaFW8cD4ENJ5XrinF
         QXEjhCdeDErNoIRGfp2UMndI55uh9n3BEp2aU+7WwTuTtaodZfF9UlY0KlVpbA8rEKmw
         hq5gAwMKb9o8kyTJ/BZ3ZFFwqIanh4uAKllKuujd7HaKcC5jrqrDxs7MZ8o7rbANby/H
         fRWHVdNF2ZT7I2FZoPHFwkgsUg0qvY2kc8AhOfemJq19ktXmqENMfmo3eo9dCNEOqmjk
         Y8GA==
X-Forwarded-Encrypted: i=1; AKwUvBy5Lwk/WmoRsiSFlL3TBHykzsabzU+WQDk1pJqLRz+4MlJL5MqKdQIfDT8hLpv7wSWg2E1Q5i/ZAreb+Etiw+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp3kNoisf3iWfCbbZues3AADZOgwK+VvLMK8RRqJW6zcMFq4ZX
	dWNry9Z3FVyMRjm3OVugp+fDWDs9MADMMJTHb7S0x9+l2yKWTmJjm5md
X-Gm-Gg: AYBFou1rMZ8lxM15TS2wYVggl8RnkwWY3rEi0j2CPxSS3M83tCb+uA75Mg2P/Gam289
	rkpFDU5uEcu1RKvyN22OBBviT/yPs4RJtgf0uKC8DhIZfj8Qt3gAoQQ3Y4OO/cwlHOlJF3bkuOZ
	6ubMR6CLlZ/xrSDhJHuIx16LMtKsp0MB10YJN2LmCzuYFfI280d0oaJyltFvCymcGFV++MB6cQr
	P3vWJttYBaOwj3eCxVaFhQsqsNlEFKwMmgX7eKstSXbWSGeTRH2gmdhTFDtwPe+i/ZLn3jfSVvk
	+jGyxOipObqRKAxUsCMVtUkCOPD+vFJHQ+OXg3qo3OLTbmsv6qJeA9LafEmwSFEuyjc63nGRap3
	y5EF75Q4zr4PTCGJXMeF3yzheTjwUTMoIJ2bAIkXSZ72GfsU5o8PJHbEcXeW0xU1fs+B34OQnw7
	90I5nXQpqqoT7+J6zV4brsl6jnAkE/1VuZy4W9RTNm77pCHbQHI0Sjigvb9cL2BEpyBK+EIK/uE
	p+OlCrqspZ+f72jVsIm3jP2Ky4X2dS5j9b6zcQ4ShitjHoRb9VQmo91H2+g3WxUE+LLnGfjfHNd
	TAb+2bIHr60N4iHCmrw6o/vAq+lHNPJk7MEa2fuYFPoSdL8MzYLsrLtAlvTTAjpiLDg=
X-Received: by 2002:a05:693c:414c:20b0:358:2e30:8e5 with SMTP id 5a478bee46e88-3674b62ecdbmr7545567eec.1.1792667578429;
        Thu, 22 Oct 2026 04:12:58 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:12:57 -0700 (PDT)
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
Subject: [PATCH 1/3] selftests: ALSA: pcmtest: Move the capture data check into a helper
Date: Thu, 22 Oct 2026 20:12:42 +0900
Message-ID: <2922e4e3021760ebed68b8e44b80fe0b2e3f1d9c.1792660433.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792660433.git.sammiee5311@gmail.com>
References: <cover.1792660433.git.sammiee5311@gmail.com>
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

The capture test checks the captured bytes against the patterns in an
inline loop. A pause test added later needs the same check, so move the
loop into find_capture_mismatch(). It returns the offset of the first
wrong byte, or -1 when all bytes match.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 18ee72d5d4c9..fc4d12542808 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -82,6 +82,25 @@ static size_t get_sec_buf_len(unsigned int rate, unsigned long channels, snd_pcm
 	return rate * channels * snd_pcm_format_physical_width(format) / 8;
 }
 
+/*
+ * Check interleaved capture data against the patterns. Return the offset of the first wrong
+ * byte, or -1 if all bytes match.
+ */
+static long find_capture_mismatch(const unsigned char *it, struct pcmtest_test_params *params)
+{
+	size_t i, cur_ch, pos_in_ch;
+
+	for (i = 0; i < params->sec_buf_len * params->time; i++) {
+		cur_ch = (i / params->sample_size) % CH_NUM;
+		pos_in_ch = i / params->sample_size / CH_NUM * params->sample_size
+			    + (i % params->sample_size);
+		if (it[i] != patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len])
+			return i;
+	}
+
+	return -1;
+}
+
 static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,
 			snd_pcm_hw_params_t *hwparams, struct pcmtest_test_params *params,
 			int card, snd_pcm_stream_t stream)
@@ -207,9 +226,7 @@ TEST_F(pcmtest, playback) {
  */
 TEST_F(pcmtest, capture) {
 	snd_pcm_t *handle;
-	unsigned char *it;
 	snd_pcm_sframes_t read_res;
-	int i, cur_ch, pos_in_ch;
 	void *samples;
 	struct pcmtest_test_params *params = &self->params;
 
@@ -226,13 +243,7 @@ TEST_F(pcmtest, capture) {
 	read_res = snd_pcm_readi(handle, samples, params->rate * params->time);
 	ASSERT_EQ(read_res, params->rate * params->time);
 	snd_pcm_close(handle);
-	it = (unsigned char *)samples;
-	for (i = 0; i < self->params.sec_buf_len * self->params.time; i++) {
-		cur_ch = (i / params->sample_size) % CH_NUM;
-		pos_in_ch = i / params->sample_size / CH_NUM * params->sample_size
-			    + (i % params->sample_size);
-		ASSERT_EQ(it[i], patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len]);
-	}
+	ASSERT_EQ(find_capture_mismatch(samples, params), -1);
 	free(samples);
 }
 
-- 
2.43.0

