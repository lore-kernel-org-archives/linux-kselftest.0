Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667590;
	b=muQZa6TYVGqTTAPXTmR1/RwRpl5YNugD2DG3AADiOQS2Gv/dMBHfC/Ejr5t5orJ0/pS2
	 05enJ2MTRuYup4pGreR5dGual04hJWsJqkfm6pbajye5lY0eTWwLW5Lak8S0LfXh0azb0
	 jlg1tzBPADju/UuzWmu65kbFvm0xeeSao87qHlx378XwwPsM281abfbeOrVI8bBupYT5n
	 UuEa9bS9Gd8Qs4Gx9H3yoR7I4spIqG/Xu92JTBmnFETetUeBdoRK/H3z/lIlkpypGVewc
	 gA3Myj2vq6XxdobxxdvMOuPD+u27n1WLgM+Hk5lqxpMZscTXVNVRUvy9okx/W4IX54Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O85oEWnqbB7A3aswtwEX6Ghna+/vXCw0tN0v3/yndfs=;
	b=grPgy8cQrqPOs7V76kWl31cSO7fGkSCuoDVT89VuE8GGwE3JbvEOPB3rfs/zkPNvl+xV
	 uoARq8muUcvuQ5z/Y/FzfJnE8gXi3A/22aAX/0jqRblJ2qHDh3htHpAHN2Ec8EePSidtE
	 ioaFr5Xd7ogcjxIK7qUfHlx9lFABBYvu/Kk7hMpdJqDtvt/BX8C6sF/T6HST2yHqdfoji
	 N1hKvaSEbh84X6R8DtiaIKUq4UlrbS1f51GEuJPcqyyTxON34HrB9cqGtegPS2VNNjw+c
	 1sMKcQ+/WG4oHTDCbcQNNPKdN7f7OlaJOJS0a2HDvvVqGKJLColS9yaT94n5YzVLXvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="XU9/dvRS";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5C2606A31B
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 11:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XU9/dvRS
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2480000eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667589; x=1793272389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O85oEWnqbB7A3aswtwEX6Ghna+/vXCw0tN0v3/yndfs=;
        b=XU9/dvRSHYB+giTZMeAi9/POi2ADnlIdyVKYNXDcXxlyNMpfOuQihfv2TUQdzwrDfH
         O9vcXGpPR7zy+HiiYg8K4+YLoaZl2gNa0NWbdRXwiBeNz3Kr0diyzhVhw0/q/lWIgOQJ
         Yaz2A5k2RXxN7Xviy7NRWoF5hM0z0guCpp2LvrPABd1AP6p0iYVAhhRwtDCi4t9xhAF/
         CwDEPiIMQk146avf+XPAnDcPOuSu0gs2gjEO463Hx/OR+48Ky68UxBgkMaw8PhPZ9zIG
         t302diJwq3KupsyYif6yfvdRXbVnFeOiCM6H7P4VxvBmp0kdxLdHyRmynhlFnb4JoL+A
         fYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667589; x=1793272389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O85oEWnqbB7A3aswtwEX6Ghna+/vXCw0tN0v3/yndfs=;
        b=TOZogv3s+4hXyLfUl4KiAWNSkNB6YNM8CdYTvYSkc1MDq1X3zlDfHyKlbTXlePSAzN
         0F7XeKXOniEjCtQW6oCdosRd7JczOinvjNfl8REpw59Ei4upXjgDtp0Uc4y/WqZN00lh
         KYyE+bjLGA68rU/zOmZ775b7mFzOdRetAXDEMlQajF3cqjXQyyU+f0gZjJs3puqta92S
         55IF9wQxDmwm+snsx36/T5hruxNd1HlCXMGIzLpKuNrcTN/4QPfKHtDw9vJlgf/aR/VY
         LlLAP7I/SVCH3bnQkM+3TDiyu4GZhGsszP8BHsc2v/LystPLUArCMGcbQN94GH2iM5th
         Uyqg==
X-Forwarded-Encrypted: i=1; AKwUvByhL4n2rPLoTbN+DKe868ykDKnxG1D/pes2cEwc9myR8PPqp+i+sKckguxN91ZmbA/3EKq9t/O+TwZi+DQolRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtZJnWnxvHxhQMMGmt3MKsFMF4fM7jD7sCLE2Xes/EeX2HtsHA
	NEanp3BnrIXHkCqDa5qVGHjsVr2ZFxDgBH/bi+W4SUfcUA8sG8c9nN4F
X-Gm-Gg: AYBFou2YLVIOCZL6LleLbpNelDPVUh3eXrQXUI9T0LXAbFA6gBMTIAyI4H+mNSevLRK
	VfamrZlbQJyQBuAZUFCl7CgS9ArKtOSm/2z/L2Lq3iJHQhCAEKTbTmxido8/JcNswMLA3TMEfeD
	/C8LO12dzbEkqgpC2OtUlPVq7psuwl+7s4K8RB6PVg2dh2zjEmLoZ3SXK1sy69+lgkXnSDejl2L
	fwWLmZXRmmaeDoVvICKgO2msoZvd5ajauo6QnHZzNw2xdF9zN4BM2IxEfDA47xEkkdaRPFrJ+4J
	ojhtF6noHpy1Hyma5ZAWCZskEOuAWO41cdNtcWcsoYkGWG5EAcpk+wgAGq6NzdaEJRYQrUZqbCw
	aJxnjz7b09npH9TPCitC5mvocGjZp2COY2x7kna3xRBn2f78mlagUlDVnxC/0idYT6RaDAezf6g
	WyVi0RFKovrDnBTYSy6XfBkbFWa19MgTmhPxVKFctbsNdHxqDINPAdwbFXsYVwn/D4Et9vFZWyQ
	LaS51icHZAajqbZrZmr5guy1tdSp/Pgn6v+NOBLkPC3sMQnwGoKIRLaVqFEzLHIYMDUQUs+B2vD
	lIFr1VA7mbL8HwDyRAIKpY0cmSPCiQ1CH61DEMR1rLr2AD27GUJTJMZ62i039Gekmzg=
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr1910947eec.14.1792667588795;
        Thu, 22 Oct 2026 04:13:08 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:13:07 -0700 (PDT)
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
Subject: [PATCH 3/3] selftests: ALSA: pcmtest: Test pausing a capture stream
Date: Thu, 22 Oct 2026 20:12:44 +0900
Message-ID: <906d65ff1cf78f5e173a5476eadcbca285aa2b17.1792660433.git.sammiee5311@gmail.com>
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

The driver supports pause, but no test uses it.

Add a capture test that pauses the stream halfway for half a second.
The core does not read the hardware pointer while the stream is
paused, so a driver that keeps running shows up only at the release,
as a jump of the pointer. Check that the jump is under a tenth of a
second, and that the data carries on from where it stopped.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 380364ee7924..b796a5613c6f 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -7,6 +7,7 @@
  */
 #include <errno.h>
 #include <string.h>
+#include <unistd.h>
 #include <alsa/asoundlib.h>
 #include "kselftest_harness.h"
 
@@ -362,6 +363,54 @@ TEST_F(pcmtest, reset_ioctl) {
 	snd_pcm_close(handle);
 }
 
+/*
+ * Here we pause a capture stream halfway. The core does not read the hardware pointer while
+ * the stream is paused, so a driver that keeps running only shows up after the release, as a
+ * jump of the pointer. The data must also continue where it stopped, so the whole buffer still
+ * matches the patterns.
+ */
+TEST_F(pcmtest, capture_pause) {
+	snd_pcm_t *handle;
+	snd_pcm_sframes_t read_res, paused_avail, avail, frames, half;
+	unsigned char *samples;
+	struct pcmtest_test_params *params = &self->params;
+
+	samples = calloc(params->sec_buf_len * params->time, 1);
+	ASSERT_NE(samples, NULL);
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, params,
+			       self->card, SND_PCM_STREAM_CAPTURE), 0);
+
+	frames = params->rate * params->time;
+	half = frames / 2;
+	read_res = snd_pcm_readi(handle, samples, half);
+	ASSERT_EQ(read_res, half);
+
+	ASSERT_EQ(snd_pcm_pause(handle, 1), 0);
+	ASSERT_EQ(snd_pcm_state(handle), SND_PCM_STATE_PAUSED);
+	paused_avail = snd_pcm_avail(handle);
+	ASSERT_GE(paused_avail, 0);
+	usleep(500000);
+
+	/*
+	 * At 8000 Hz the pause is 4000 frames long. Allow a tenth of a second (800 frames) for
+	 * the release.
+	 */
+	ASSERT_EQ(snd_pcm_pause(handle, 0), 0);
+	avail = snd_pcm_avail(handle);
+	ASSERT_GE(avail, 0);
+	ASSERT_LT(avail - paused_avail, (snd_pcm_sframes_t)params->rate / 10);
+	read_res = snd_pcm_readi(handle, samples + snd_pcm_frames_to_bytes(handle, half),
+				 frames - half);
+	ASSERT_EQ(read_res, frames - half);
+	snd_pcm_close(handle);
+
+	ASSERT_EQ(find_capture_mismatch(samples, params), -1);
+	free(samples);
+}
+
 /*
  * Here we check that an error from each PCM callback reaches user space. The driver returns
  * the error while the matching 'inject_*_err' parameter is set, and works again once it is
-- 
2.43.0

