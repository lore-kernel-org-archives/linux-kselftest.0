Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEE74A4840
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439121; cv=none; b=K/fngVAowchYuTOUPNTjAraBWasPH6ubn45WQL9ZuJY3Vgl7sqnXIFCkFfJKwd2px+bAGG41NUNVZurLVjqlmJSR5hQ6I6/8DBgQHKdW0D1Zjd09wRMzIQrkFZ2cM3jRxG303mYBRn6ENwUgFIYVWvACpmmfqN6l6S/JRVJPti0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439121; c=relaxed/simple;
	bh=w7532gPELHA88uMYZ476EJzKWxB14Q6u51dqffu08Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPVKwPVGm1crSLiP8NHfT3OZ7VcGI6IJf4mrYDcoq7CcbV264aKDkauP572od5yyG5sSkgU8zegtwpMd/eXMDsTljXe4Z0qR3rBLp5vFE2QsRXSe/As4yVcpaouiBMTA5RCQX/fksHqIVYQHo7e2ldLtLAAkWse3ZuLd95ICGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEB84Ts7; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEB84Ts7"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so2439753a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788439119; x=1789043919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZL/5qy3Rxb5D1WeCSPayT4wJDAfxlWxQ3ePUaY0WH0Y=;
        b=WEB84Ts761HfGW+FNKpVfjChiqCgJ2p5YpmKq/OcpqxeuJWsH42UuBIr0RqC6hdRC9
         nhuWtwk93ktvu6dx62/pJPV4w5F0BGX4jxFacTzO8EMOrnQ7PG+9SEt12ZXwqfP0UhtU
         lmCy08G2oTzWw9sL3XBQc8PtM7hLEysDeMdDSwov7cKM1ehZvDYXCqqlBl1XP8owrI5/
         IuYHV6kjh+jFztclAFKYps9DVA5FlvO1IIqpBDfeUgAmXpfPBgELPp20zb9HFxzMWD2o
         kQwT03RQh69J759dKa4R1Fi4Ixbc5c+Vv01ir32aXchqqZSYWecIu+VbpX5jeVJcgasw
         IUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439119; x=1789043919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZL/5qy3Rxb5D1WeCSPayT4wJDAfxlWxQ3ePUaY0WH0Y=;
        b=WAovoIat78voz8/UER85j4jlZpGU8nx0KY8a4aDdrmvIrlqWWrMm8LAK+RJhE0vnM6
         fv8gygqeLR9XB7b/nK8XweBH93k0CWxXs8dJd1hbVQdfsThHEwoRpa3HVAh+voEvLozn
         88/1huqMdhih1IOrCv1fRJycadyf2OsZv+LymrZ0+DT9CEvfTElNT0yin38bA7nviQ05
         wVOPnyVAKHo12N2Hat2V6JBWgtPA9niPy0SzNQoLvQ45LdnErL6bnIjPNmgUydzkJiaD
         acFiSLsxS1Oy1dCQ0MIPTPLrZUREcSmFV4nWF1nwKAoV7d9RAN+PUJR7g9dmbHtxr8Y7
         svMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSqy7A5KeEOb7saAg1R0yFtkVg+vgSAHYXci8C01ZJ0bqlCFvfkl8J4kRepOvGc/7TRdXn8I8yuG2LiGnmepI=@vger.kernel.org
X-Gm-Message-State: AFuF++m9F0/8Eyjx9pFwrs1iWaVbu/mnkaBFbFbKXGuH5GOnkj92fxXl
	5x2TDWhBZoRv8kDD95T1Ng/oFDVsnv2q4Lhgva7j2U/2ru+wpOk/94JU
X-Gm-Gg: AYBFou1RUAXdb0MXIn2XmfVA60xFhoFPXPChV57hiMlIIH03IOFXvyY++6DCVUmeXzh
	c9LNJF8VGOE0kIgfzLCkVobxNK74bfOy7ZM3brbAFyNsuHgBPVHxHdRLo/vxSP6594ve4EoRTQE
	Wk4R6KQkogJIMKDGSbfBzwT5oJl6dPpa+JiQGKr9MpzYBwdLSHEQeqtKA8WM3jOHvWYVmlDv0cW
	ftXMQ++jrc5JN2f29APJU4WGwOs1uqce8ifnWQ54Wy8xWh/mKOvayz+MTjsTNl7fvl8SpaiTf7Z
	7yc+NxZibFXGL2TwCLEAgsUuNpaKETcPT8Gvdmjyrw1iNr09+ImLK4qcXEt7WJ/Drq5DC6Z7Z2y
	4U316GO/RhfikfSR95q8kBlNTN3ihLkl6DsrOe6net4wjKrM1lIadRIm2UiL/OLlX8WXqHoeyYb
	ewKEaD5FJdeAc2Z5QlcafsyJUDd00hc33U2XmxuQDh42v0Ut0leAm4TesekID4yVQ3nlr1UfbjB
	6r02tN76ApSNe9ElasrCb9N9mJFoT9a5TYGybJHj+fusPnacmR2
X-Received: by 2002:a17:90b:4d82:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39aee1ab4c4mr15866117a91.18.1788439119065;
        Thu, 03 Sep 2026 05:38:39 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832c14fsm5403904a91.3.2026.09.03.05.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:38:38 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] selftests/alsa: Fix the step check for INTEGER controls
Date: Thu,  3 Sep 2026 21:38:32 +0900
Message-ID: <20260903123832.97377-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The modulo sits inside the subtraction, so the check evaluates
int_val - (min % step) rather than (int_val - min) % step. The
INTEGER64 branch below it is parenthesised correctly.

The written form passes only when the value equals min % step, and such
a value is always on a step boundary, so it never misses a real
violation. It only reports valid values as invalid.

snd-aloop declares step 1 on four controls, so every non-zero value on
them is reported. Before:

  # PCM Rate Shift 100000.0 value 100000 invalid for step 1 minimum 80000
  # Totals: pass:660 fail:101 xfail:0 xpass:0 skip:296 error:0

After, same card, nothing else changed:

  # Totals: pass:740 fail:21 xfail:0 xpass:0 skip:296 error:0

Eighteen files under sound/ declare a non-zero step.

Fixes: 5aaf9efffc57 ("kselftest: alsa: Add simplistic test for ALSA mixer controls kselftest")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 tools/testing/selftests/alsa/mixer-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index a329f901c5ed..0857d64c322a 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -319,8 +319,8 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 
 		/* Only check step size if there is one and we're in bounds */
 		if (snd_ctl_elem_info_get_step(ctl->info) &&
-		    (int_val - snd_ctl_elem_info_get_min(ctl->info) %
-		     snd_ctl_elem_info_get_step(ctl->info))) {
+		    (int_val - snd_ctl_elem_info_get_min(ctl->info)) %
+		    snd_ctl_elem_info_get_step(ctl->info)) {
 			ksft_print_msg("%s.%d value %ld invalid for step %ld minimum %ld\n",
 				       ctl->name, index, int_val,
 				       snd_ctl_elem_info_get_step(ctl->info),
-- 
2.43.0

