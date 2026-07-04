Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154B3A3804
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783162675; cv=none; b=OWkqO2SrOHikxAZigbXFDalmjv7rIDXYB2hmc8PBIbmTsMVeSaA6M4TAjBBPnY8p8fi+5Zi37nFWU2AHygzEcUwVnbMA83oA/BFYu8jiGOAwZsbwZ/oEIWSR6Up6m+1O8E0zQmZyQltoVvQDqJgMpvv59V2a9gHKvy4YDEizr/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783162675; c=relaxed/simple;
	bh=LpNMONAFHratRfzTozrtWCPtx2mIhGjyICB1cGXRlQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bT90HjnUhUP2eSvce5pnbGVN5O+TXOZ8imhhvyGUVCAyrkmaA3GDEWf6NfpwP/Q0GooHpn4KkEBBf0GRAVgwXtTTzdY4UwTbpfcw6qClRamRuHv+mOpMZxy3/i9032ZxFRdugKOfqJOdI34YRezZobAhUNW+BclOfsUTB+TTKos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxSfLdah; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxSfLdah"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so672527a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783162673; x=1783767473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6fJsXDYm01gP/6NPsGPNca/1nthqrVfe5CcgN03ZolE=;
        b=fxSfLdahgyUDsb0hQUOYnjCQ0G3Zka6kWDxRkfUC1HLTLN7R3072W8t+OPoBLvV6iU
         8VPdTBkF9MxsHVknhsowwJQpvHGzAk1Pw1mQU0wxuMlz+m8kp0DLdKmJ1CAMBcJfjG29
         cpxtF3mhOwpuKUyGFBjVxb5FtM4eNWpl2XAa+ZhvkUdCISBRL959io2uUrUhGCNyKXuZ
         a7ac382nFKodEM/NFZoOM4kDkqteUa/LmGYeITqQYJkW6cUzEGCiFdH4StMyslx1tNjm
         29L8g0RjFkUVAjsNli7W8RcI+lvTayQmZ+vWSOtq8RkIFYTR//i6G8TssEsbsCwOLxDy
         59Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783162673; x=1783767473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fJsXDYm01gP/6NPsGPNca/1nthqrVfe5CcgN03ZolE=;
        b=sQ1CcEmQY27jtLCDxJ3eaN1Ftvd7SKoOro+tX/dtalGR90EOoZEgkJMY9x1IvgoNU1
         Ja4NJTxB4RtBQyvR5XjHhar69A1bMKVjSJgyCPMyFEmb89F2bfS2Aa5S1P30CKy+FJPt
         zr/U0RKBrElH/qmbLDxVt/YSTLZ3N9lAfi+yc4vBnZdJTPYB5kkCqgzsfPcRQLICgRSA
         vTHWwerrWegx8oxZPya68elAwBptj94q4Nsu7i2KyEcKTw/pFPjNhXWWAw3RPT0bn3UK
         yxgU0Is0sMNakO7fEDOwkdxBjB0ZEzkMsE4Fibp6MvUG4pLg/6OXyQ849pQFHNGmxe7D
         4s7g==
X-Forwarded-Encrypted: i=1; AFNElJ86tg/NT8v7AUJ+UuUvC7CW4Yuyvf9cq6iRRtzneMqHlyuOJU3ltivgg3CnPNwsZny+v+0HvUI1pd9VEayirmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRhXsuboNrPuyjsz5i54I7/BR+KnpvTqVTSshDKs8xB4ZKvD7O
	EpdPUHvsmXcacLzCqhm4daFAR/36yAeVul722JrH448dfNyERmtrQ2DN
X-Gm-Gg: AfdE7cmnOkhov8vw4kZRq2QWCuO0oO8eUgDwN4JrhfTJS/XVx8vcbt3oCPd32ksU0bA
	Pk/x52tlaUxvmqSje9I6FckXjgvfKbnMyOF410Wqs55+sewYcmwXWcSAbAtyz7IkbAwVG5Bs2Dg
	RGtSa+j9vCcWLvpHq9F/kDETMVTj0TovW1dhntvfLCvpS36tP8Xyy823MZ0c9/nto5v57+Hqy2a
	snkibeTyJleG5euWXKUiN4IMjld1w2KNniWRR+P7rEkWXuqGBIhzgWQrvtCjv5DXY1oeYNHqDGh
	Q9BUtcDeg4dXTkCP5IA53AcnWpRzzwIQAn2vlE+jWFHLnKgeujTkLvYpTm0ZwF6F5VHsY1/sgPG
	FhnBtg57WtCMmlrRs4eMjc4RbkDdEVUVDyBawiKdBVbNzDWE1sB+agaMK34VyF0x+eTJ3q4/AqN
	4Qy1y1OT1mjEnRh8Y98X0YjaWFqSVKfi0FeddHscWtcO6ykfTGOLx19wr/Vw==
X-Received: by 2002:a05:6a20:6f93:b0:3bf:82c5:ed0f with SMTP id adf61e73a8af0-3c03e512963mr3099508637.44.1783162673047;
        Sat, 04 Jul 2026 03:57:53 -0700 (PDT)
Received: from fedora.mrout-thinkpadp16vgen1.punetw6.csb ([103.133.229.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm17179812eec.27.2026.07.04.03.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 03:57:52 -0700 (PDT)
From: Malaya Kumar Rout <malayarout91@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Malaya Kumar Rout <malayarout91@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/alsa: Fix memory leak in find_controls error path
Date: Sat,  4 Jul 2026 16:27:36 +0530
Message-ID: <20260704105736.94874-1-malayarout91@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In find_controls(), card_data is allocated with malloc() but when
snd_ctl_open_lconf() fails, the code jumps to next_card without
freeing the allocated memory. This results in a memory leak for
each card where snd_ctl_open_lconf() fails.

Add free(card_data) before goto next_card to ensure proper cleanup
of the allocated memory in the error path.

Fixes: 5aaf9efffc57 ("kselftest: alsa: Add simplistic test for ALSA mixer controls kselftest")
Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index d4f845c32804..c5ae2a026ce9 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -84,6 +84,7 @@ static void find_controls(void)
 		if (err < 0) {
 			ksft_print_msg("Failed to get hctl for card %d: %s\n",
 				       card, snd_strerror(err));
+			free(card_data);
 			goto next_card;
 		}
 
-- 
2.54.0

