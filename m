Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491528;
	b=c1nBK4T7+v1v3IzT7XelhK7rXncIWP+xfuAxCZiMMV5c5MLKnNIDdjVaqx/shJnLsbWw
	 CY/BZN5pj/oCUpY2OtIiJhmJeq7YfDgH7NjQgJDSSaa7KXguw20m7ZKaZTLVwd2GXx5nZ
	 1tXeNIlUAUa+hnoH7p+XDzkIN2iSa96j0M+iIq+j+hKf71IgcIywvf/pS2Ljup3F4+5Dp
	 4bY7KWCnkLGsH3ryPoMxaIRa5uvflkhd0ssCmMbAwwSRKOQo2CbvFb4gWp0Y9zUZq4fan
	 tgHHnJThvKJArHfBNEEMlO0tky/GioqAtN4Xw+ebOsCuk7i3MYIQsxvZ0VPVI92AePQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
	b=FV42A0IVgOQkRZMCAvDkWwlleXsoHQaL9zsFZAjOKpQUTrxRJMqpCkrg4hDiHhamiu1q
	 Foj3XBidwCWqHYAQi1wyMPprPV7yF3yHxGYUIT3V6lW+fQnfXlS5ibS4zuXDsQfgJmyDd
	 ZBVHBa0Pb/xux24OAsBwvgHuLYHcfa7bXz8hBvsxwygqSnMH21buHCEzML+CYyU8ezb8S
	 /5bdWLsb8QvhZHnK9tdCqZBvrceCtsBBvkonsrraE0ya5ATFw8ED6iqnVuRUtlGhSJ+ng
	 RuwZTvLzQrOUHwQEHnXXToTcejN+SH/ASHix5TJBYfjDlM+KtkMwp4xuRnYsnBNtx1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3trgOPb;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A5C606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A5C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3trgOPb
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so2254932a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491528; x=1793096328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
        b=p3trgOPbamSlH2FX6sMX4Uk+/fGAXeeETd4TyWqfq+VnLK/VwB8r1znS5wyJ5609iO
         t3ehoco6VB/rKdXKCEwMmaTdasjbvmjUBwqIpUR1776N+PtAkVyTjTRxTw5QfuCYM6EN
         JJFtgvvPN3s2NwJeF899DzlenLBim1v/CzNMto0IZum8QhIwNP0O7Gf2a8ENfsnP1lTF
         mGQfncnOEvArhugKgF773QgTMsRhmqR1U7pDseY0yV3w73lObqCOw3HvdBBJkhF9QE3D
         4r40bSBstEbGd+DziyqW5RrGTaHLW2wote0/jDCQ7+gTmzOHTgZwJYUiX+poUL6T78/z
         siIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491528; x=1793096328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
        b=WDuoMoK+qgeR6eXA7gti+2H3Kr0d2oJ+X0UM7hSt4SDh5C6Mg8CsJ8rYfgUfRoZ/S5
         0y+AiIF7Cv3TE0NJr4XqdFyP7S1Gu7pjCT9KFtephBgrNRsgS/iR4RwEdHK8uLSPrXh6
         vgKl+0Qik3TZ48hqQFZvA3pxCo4DKuwNIiWY9M3P8OIWnjM5si7zAgTs7AqSzsqvd7LC
         d5QL7DwuCLglMZ7QtPBs95tT730UUkvnmvsvSMIhhHMOFeEZWrwxpbHa7GnUdmDKIsvA
         +XbgDcpqJW6V469+L0cPmA5UvYoPT8XBej9K79lhYkXeTRjpPdu6RVruJ/EtUN8B4kfR
         S/2g==
X-Forwarded-Encrypted: i=1; AKwUvBzvwuyjLrGvoFSyF8P4VSWyRyOHvYftg2yAhQM4SCBq3p8tZg+0mo7ajiH3TSUoA0Ha/XpitEsr5pgt/bh6YdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFiqQxGTysVOe5nAKwUTsThfVpYtXpCXBSCpLA6U1lGPqGgV+Y
	lccSQY+rX5x8gjlNXlCTX8hc4l3bdehU035nAZ4t/dyJ2/VyI5Mk9mzS
X-Gm-Gg: AYBFou3ekRf19V90SZSklNeMJajaCiQYgZBaq4TU/srXSDdGkKuoOtvJs9alOEZKvzv
	9PhJ/pT6T6YdIpqunFB7AB3FVVz6YQMIlPbegBhYBfIs2Qh0mmics0pXWvphkofACK0bs6LB3yT
	NZqWKxGcPU5+F0wUwY3dkfSS9OVeiwxkEVGNIWrQ2Sfg0ZA9obTC6xUyVCEWP9dL4YTap2gXjuZ
	UjpDSMNYj/xNeD3TEeG16w8mwKT+oD3Z/LzrxxwRGutHAjQMkDXIUkbMW3D1DzMr3lyFjGofsn0
	UXX470yyExnuV3RBQkg8RYQImMLc1wBO35f81X0n1zJ7cuabkgN6NCvbeCDZMNL/wfOeC2QoNJ3
	1wS8j1ZqKWUu2cClTqrCC312+l9t+fVyJOOrmn1j7V6KLraHCe0hRrCGxvPNDMeQT77QWfd76ST
	1I+HMZDjNAE3GpiTSaf93AgKhYd8o/kS7FeNXArOw7G3YmldlHZ/XgsSb+Jtukkf7q6BtwcG9pc
	uivbnxurrSOdhw8z9Hfcv/PnCL7qZ3T8r3md5j8SeWj6jc/zLGtlvXFRRJPlDodrBlMPJJO86s=
X-Received: by 2002:a17:90b:582d:b0:3ab:c674:d83c with SMTP id 98e67ed59e1d1-3acef13e7e2mr7913373a91.27.1792491527690;
        Tue, 20 Oct 2026 03:18:47 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:47 -0700 (PDT)
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
Subject: [PATCH 1/2] selftests: ALSA: pcmtest: Check the frame count of each transfer
Date: Tue, 20 Oct 2026 19:18:36 +0900
Message-ID: <6f16e2a01f18c0ea069164bab31999182ff6d49e.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792390197.git.sammiee5311@gmail.com>
References: <cover.1792390197.git.sammiee5311@gmail.com>
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

The tests keep the result of snd_pcm_writei(), snd_pcm_readi() and
their non-interleaved forms in a size_t. A size_t is never negative, so
ASSERT_GE(res, 0) always passes.

The capture tests still catch a failed read when they compare the data.
But the playback tests do not. The driver sets pc_test to 1 when it saw
no corrupted data, and that is also true when it saw no data at all. So
a playback test passes even when every write fails.

Store the result as snd_pcm_sframes_t and check that the whole request
was transferred. The calls block, so a short count means an error.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 95065ef3b441..5bba17434a6b 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -166,7 +166,7 @@ FIXTURE_SETUP(pcmtest) {
 TEST_F(pcmtest, playback) {
 	snd_pcm_t *handle;
 	unsigned char *it;
-	size_t write_res;
+	snd_pcm_sframes_t write_res;
 	int test_results;
 	int i, cur_ch, pos_in_ch;
 	void *samples;
@@ -190,7 +190,7 @@ TEST_F(pcmtest, playback) {
 		it[i] = patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len];
 	}
 	write_res = snd_pcm_writei(handle, samples, params->rate * params->time);
-	ASSERT_GE(write_res, 0);
+	ASSERT_EQ(write_res, params->rate * params->time);
 
 	snd_pcm_close(handle);
 	free(samples);
@@ -206,7 +206,7 @@ TEST_F(pcmtest, playback) {
 TEST_F(pcmtest, capture) {
 	snd_pcm_t *handle;
 	unsigned char *it;
-	size_t read_res;
+	snd_pcm_sframes_t read_res;
 	int i, cur_ch, pos_in_ch;
 	void *samples;
 	struct pcmtest_test_params *params = &self->params;
@@ -222,7 +222,7 @@ TEST_F(pcmtest, capture) {
 	snd_pcm_format_set_silence(params->format, samples,
 				   params->rate * params->channels * params->time);
 	read_res = snd_pcm_readi(handle, samples, params->rate * params->time);
-	ASSERT_GE(read_res, 0);
+	ASSERT_EQ(read_res, params->rate * params->time);
 	snd_pcm_close(handle);
 	it = (unsigned char *)samples;
 	for (i = 0; i < self->params.sec_buf_len * self->params.time; i++) {
@@ -239,7 +239,8 @@ TEST_F(pcmtest, ni_capture) {
 	snd_pcm_t *handle;
 	struct pcmtest_test_params params = self->params;
 	char **chan_samples;
-	size_t i, j, read_res;
+	snd_pcm_sframes_t read_res;
+	size_t i, j;
 
 	chan_samples = calloc(CH_NUM, sizeof(*chan_samples));
 	ASSERT_NE(chan_samples, NULL);
@@ -257,7 +258,7 @@ TEST_F(pcmtest, ni_capture) {
 
 	for (i = 0; i < 1; i++) {
 		read_res = snd_pcm_readn(handle, (void **)chan_samples, params.rate * params.time);
-		ASSERT_GE(read_res, 0);
+		ASSERT_EQ(read_res, params.rate * params.time);
 	}
 	snd_pcm_close(handle);
 
@@ -273,7 +274,8 @@ TEST_F(pcmtest, ni_playback) {
 	snd_pcm_t *handle;
 	struct pcmtest_test_params params = self->params;
 	char **chan_samples;
-	size_t i, j, read_res;
+	snd_pcm_sframes_t write_res;
+	size_t i, j;
 	int test_res;
 
 	chan_samples = calloc(CH_NUM, sizeof(*chan_samples));
@@ -294,8 +296,9 @@ TEST_F(pcmtest, ni_playback) {
 	}
 
 	for (i = 0; i < 1; i++) {
-		read_res = snd_pcm_writen(handle, (void **)chan_samples, params.rate * params.time);
-		ASSERT_GE(read_res, 0);
+		write_res = snd_pcm_writen(handle, (void **)chan_samples,
+					   params.rate * params.time);
+		ASSERT_EQ(write_res, params.rate * params.time);
 	}
 
 	snd_pcm_close(handle);
-- 
2.43.0

