Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667584;
	b=wmFBDsyAW8Ix6K4pdm+2SZ9G5cMYXrclgyth77KHlld3DOyoxQd78smTF9RVBOLaYeqS
	 WXF+pXXBJhDHSAVq17G65OElBOd7eXFkNlLX+WFEvBvDDPcsNpfE1irTuyKh4eD7HC90b
	 yMjCXVn5C+RBaKQKT3WeG5F4Wz1DZpEfDS+yAEbmAfaDCrPTQ/THC6cQtpY+YBhIXca/a
	 I/Dyk5kjWmxecJ5jDbtKOBiSNi7x+2rJjkakyrkw+W74wjKIR7Jdn7lIyyeEV8zS8O3U1
	 8jYHzjmlDxnASKoIfvkH/XYJbcjAQVeRXk6dlz1cDaqTyMeJHiFRS0Ogw2xSQF5PqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=plgo1VyyX/ZTHQrDVE4OpEvOdaKz2fz6hhtMI1sePFs=;
	b=IP3wCVX45AxzY/GX+WL9HfI5b7FLT9no5SZdLpGfDNZlluzKV45H5PFNsbh38aF+n2f7
	 ju7/VKydsQR294cGZnu9DL0v3KDnqjvhF7W7z+pIpIY0rSdNPO9YG7ZA5r7KbNcMDNXpn
	 ly/Zd2OuBuopASfFBHBbfL1Uw8Cvy+bQOeMSuoZUlJ4xijQFBE4aQEzlTHwpdZ75/rco6
	 Gw/2XWieC+Xi0mA600k6nSDY6jdzvvDed8n0P1/f+gDqdEVg6X5XRvFvp2ZqD7envk79J
	 zccmHAizNRTcNLR6h6ujo4N7IY4okeGsyfBw2UDNwZMO5JSO9DT0WMgnyNEnSAjJL0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i1FPCBui;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48624606A31B
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 11:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48624606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i1FPCBui
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso3102859eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 04:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667583; x=1793272383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plgo1VyyX/ZTHQrDVE4OpEvOdaKz2fz6hhtMI1sePFs=;
        b=i1FPCBuizCO26W639eEw/62D3Yu9yo/Y5brUjhFuMmOOnzlweK2N3jaqv8aklxIUOM
         kK1knNxc8zDSAcZL/odfpcGUAz35Ocf1Z7nuGPPkCYBC1LqbdjwGqZ8ijzn9SoY8JMJN
         wHO7xcxmVIoaH0peVVjOD9tFyoMVesdD6TPgCBYe0yu8tlRW751SVRgSKRZBrskpMQzz
         abdB0Eg9xWUOy2J5gi/Tl1fODqUJXOnQ4hblQVF5EFopSsi/4rdEWDMxaspq5m9a6/wf
         SUSNJe+g464Y2WVbCxqdh8dkbhQADAhvfB89rPo/KBdFZfelzIna0cosjVO8B+iODNw5
         0Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667583; x=1793272383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plgo1VyyX/ZTHQrDVE4OpEvOdaKz2fz6hhtMI1sePFs=;
        b=gY0Wl0VCWJzRvDSbhJnytvRD1pKsHgJqPW6ngPQvvnW4cNQlnYOZJE7l1jRewzRxMB
         PklIuykgIcY3MOYKsduzKpuJA0gVqmmyTDOt6b8yZiWZW5FEM7BaCgLBKX29t4RhIfN1
         nkNVH59TWHlqk1NuNPjxeSh6DlpNpFMcAtSmdAcy+0iEjSF7tXm7yGezwLKBgY9NsZhS
         6hHJainshkgtMP8RjIKDf9ALC8heS5hEMQm+phR+W4tAl/NBAQzFms4Eq4pYaetivY1/
         QcZvevKP7nDfyAv3a1/gRF9VaysP5GfUO4AWt54vZe9NJ1N+r5ywggBrZyXfIPQoV53z
         TC9g==
X-Forwarded-Encrypted: i=1; AKwUvBwGq+0Hfr3scKiv5aO96SNw6FBa+ViUuh+0aWI67mwpAPCOaCha7R7+Vd14whXo7dHl9oOa1iGguEnqrJsvHVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNm4v6uQO7eQgEKobs/A8tLjIffLxvi0Ce29huuadWLCO6SUXK
	0J6CleacvEJkaBnnkGMUb3xkZrMiR+fuJm+A34v7Gbg5m6U6jPgDBuHc
X-Gm-Gg: AYBFou0EazLyO6xf7Fvh4dCptJgWwp6+mi4r5Nw8KR57zohEndBKfvdEAaFwDCuvMxo
	ahFnK+k2FGohzAiUmLT44GfVksyc4NZAxArY4uUoOmIkA5bvckhDCpUbxeSt34wsqocYdKvwA1A
	LnL9JeYRSfPp+eJDwmuHbeuHy6/8ky7wIRIJVjLyBDkSHT5K/Lz4P3IZ8ywhy5/jZXQ5zwCXNhl
	9H31nyW50ALnxojrgoZBvkc4eF4za10tdqe8F2xZ2ecZU1wK0zvdpK18Kdsg3Fpi7HKte/C+UJb
	19DHEgDFqmpZ+x5EaikEZzLR6XnVIdbY48Xr3gnPC9jYs3p00SSHWyOOQYdtfNTp85PqmagwdGI
	eIFD8YI+FsdgL2rGW3NidvNtQEnm2yKMHZdAiKmjAtYNgr1J7O0F2RTX9jrb/WXn2Xak64T2/C+
	nyJZZtQLOP9pT/1mfZ0ot93GYuPpl6dbc13HDRdh0bnkOvzGUITHYQuAglO8Mp/kcXgkQ+Do9Tr
	hEU7luHV2dCqqSuwoAshqRb2WVB4s4bkUPphCgx85R7QHHOmQNXV98fD2IhOPAviPmWVBCpKZs5
	B3TdiuG3jvIC3WsRScKmYhqur6E2Sl02gBxmjIqtHMLzfTxksAMh12PLYqQd0OTY/fk=
X-Received: by 2002:a05:693c:401b:b0:369:21a:dce0 with SMTP id 5a478bee46e88-369021ae29dmr2009629eec.6.1792667583112;
        Thu, 22 Oct 2026 04:13:03 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:13:02 -0700 (PDT)
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
Subject: [PATCH 2/3] selftests: ALSA: pcmtest: Test errors from the PCM callbacks
Date: Thu, 22 Oct 2026 20:12:43 +0900
Message-ID: <f1b98dad097550f09e38ee7e90ce30106d89a09d.1792660433.git.sammiee5311@gmail.com>
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

The driver can return an error from its open, hw_params, prepare and
trigger callbacks, controlled by the inject_*_err module parameters.
No test uses them, so nothing checks that these errors reach user space.

Add a test for each callback. It sets the parameter, checks that the
matching call fails with the driver's error, then clears the parameter
and checks that the call succeeds. The trigger test also checks that a
failed start leaves the stream in the PREPARED state. The fixture
teardown clears all parameters, so a failed test does not affect the
next one.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index fc4d12542808..380364ee7924 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -5,6 +5,7 @@
  *
  * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
  */
+#include <errno.h>
 #include <string.h>
 #include <alsa/asoundlib.h>
 #include "kselftest_harness.h"
@@ -58,6 +59,20 @@ static int read_patterns(void)
 	return 0;
 }
 
+static int set_param(const char *name, int value)
+{
+	char path[128];
+	FILE *f;
+
+	sprintf(path, "/sys/module/snd_pcmtest/parameters/%s", name);
+	f = fopen(path, "w");
+	if (!f)
+		return -1;
+	fprintf(f, "%d", value);
+
+	return fclose(f) ? -1 : 0;
+}
+
 static int get_test_results(char *debug_name)
 {
 	int result;
@@ -141,6 +156,10 @@ FIXTURE(pcmtest) {
 };
 
 FIXTURE_TEARDOWN(pcmtest) {
+	set_param("inject_open_err", 0);
+	set_param("inject_hwpars_err", 0);
+	set_param("inject_prepare_err", 0);
+	set_param("inject_trigger_err", 0);
 }
 
 FIXTURE_SETUP(pcmtest) {
@@ -343,4 +362,74 @@ TEST_F(pcmtest, reset_ioctl) {
 	snd_pcm_close(handle);
 }
 
+/*
+ * Here we check that an error from each PCM callback reaches user space. The driver returns
+ * the error while the matching 'inject_*_err' parameter is set, and works again once it is
+ * cleared.
+ */
+TEST_F(pcmtest, open_err) {
+	snd_pcm_t *handle;
+	char pcm_name[32];
+
+	sprintf(pcm_name, "hw:%d,0,0", self->card);
+
+	ASSERT_EQ(set_param("inject_open_err", 1), 0);
+	ASSERT_EQ(snd_pcm_open(&handle, pcm_name, SND_PCM_STREAM_PLAYBACK, 0), -EBUSY);
+
+	ASSERT_EQ(set_param("inject_open_err", 0), 0);
+	ASSERT_EQ(snd_pcm_open(&handle, pcm_name, SND_PCM_STREAM_PLAYBACK, 0), 0);
+	snd_pcm_close(handle);
+}
+
+TEST_F(pcmtest, hw_params_err) {
+	snd_pcm_t *handle;
+	char pcm_name[32];
+
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	sprintf(pcm_name, "hw:%d,0,0", self->card);
+	ASSERT_EQ(snd_pcm_open(&handle, pcm_name, SND_PCM_STREAM_PLAYBACK, 0), 0);
+	ASSERT_EQ(snd_pcm_hw_params_any(handle, self->hwparams), 0);
+
+	ASSERT_EQ(set_param("inject_hwpars_err", 1), 0);
+	ASSERT_EQ(snd_pcm_hw_params(handle, self->hwparams), -EBUSY);
+
+	ASSERT_EQ(set_param("inject_hwpars_err", 0), 0);
+	ASSERT_EQ(snd_pcm_hw_params(handle, self->hwparams), 0);
+	snd_pcm_close(handle);
+}
+
+TEST_F(pcmtest, prepare_err) {
+	snd_pcm_t *handle;
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, &self->params,
+			       self->card, SND_PCM_STREAM_PLAYBACK), 0);
+
+	ASSERT_EQ(set_param("inject_prepare_err", 1), 0);
+	ASSERT_EQ(snd_pcm_prepare(handle), -EINVAL);
+
+	ASSERT_EQ(set_param("inject_prepare_err", 0), 0);
+	ASSERT_EQ(snd_pcm_prepare(handle), 0);
+	snd_pcm_close(handle);
+}
+
+TEST_F(pcmtest, trigger_err) {
+	snd_pcm_t *handle;
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, &self->params,
+			       self->card, SND_PCM_STREAM_CAPTURE), 0);
+
+	ASSERT_EQ(set_param("inject_trigger_err", 1), 0);
+	ASSERT_EQ(snd_pcm_start(handle), -EINVAL);
+	ASSERT_EQ(snd_pcm_state(handle), SND_PCM_STATE_PREPARED);
+
+	ASSERT_EQ(set_param("inject_trigger_err", 0), 0);
+	ASSERT_EQ(snd_pcm_start(handle), 0);
+	ASSERT_EQ(snd_pcm_state(handle), SND_PCM_STATE_RUNNING);
+	snd_pcm_close(handle);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

