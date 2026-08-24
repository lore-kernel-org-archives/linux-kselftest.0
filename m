Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD79463B88
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588881; cv=none; b=q96SM2hz1zblymcYnlDgwKyDGj4wR6KeqzMQsEENeQ9qjstqI+rXhCJG4529/u4ukRKpvVwvGaVcaIHk4ExSd0D3S/NyWpeT51wpc+GW5PkbTZsW+AqkCiMkuaDSJ8mXHLLtWPymoSxLB6IGhOf97GhZaNbc5Si6+C32rMHeq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588881; c=relaxed/simple;
	bh=mDHws/sZ8lLQ/1KdE+rARMYCh5XMOT8BgGpsfgO9eTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gN/wI7zDhp/rvf15Q/9lQUltQuM7VEOelruaVJ5NQ3vL9wPz1I9QHdlRYNc6Z+sdCUnDjTfPZtPPPxTqVu/9dkchAsACfdYnc91u+vnK6pthfCfijVPBbWV/G+Xjp8qyIwS28mzg2SnPTgRnPlC879qFHoFcx4OCoqKpzBNMQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbsnn6ym; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbsnn6ym"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d58efc7356so41351955ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787588879; x=1788193679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXZHhJ6DSOJ118FYJaNeGOw/BXFqZV/1rWGtWxFPkgw=;
        b=lbsnn6ymIAr0yodRK1K3HOBZ3XGASs52oqaNEEdLQAFszf2yfPX/81P6HTewCrrryX
         jHTNqb+BK4A8LFB7QVLHuIcnguGi2cfEjAdd5YCoXmB8bgGOk+KVM7UIxmIyetQDI72b
         SdakLmFbz43u6QhSPwG5rMUHAGXwbqyAa30IT5kN73tgTjBud4Dpb/BzmbHhniKl9sRm
         5Au+xu8umyItO0t43ueTsIQk/QZOq8JXU1xOuFlW7zGahnXl4eOsZxmUPFNVV37i+5N5
         IA976wmGjgKDlLfW9NctzyaZe2/2I/cqHS3mBryBVrBB1Rp3sch6TGSef9OqMqElOett
         RF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787588879; x=1788193679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXZHhJ6DSOJ118FYJaNeGOw/BXFqZV/1rWGtWxFPkgw=;
        b=OvfWFg0JX3c1ExRBitw7SOTu4faNYJForHnGwbcFkc8A2TjWNB7IIQc5eo6q6bzlBa
         tsRCJiANObAFYdP2EXqHz4hS+tddauvKD2tpp48GjiK64s3QLa+/WwVR2sositqChW2h
         YwgUtg29akRCYW7t6ghqRpiYyCoolHXxuX6bDzhBJiSfpdGws6fdws9DOIyxK8jJ4oMk
         2bXxnkHUOf72Ujo0ctIdovsGWt7lbuk+xRXbOG/NV/t+uZrDEkFwObrYk4HNhbav4d31
         YKf+qO1KoWqGdZ/K0aoVNJ1ClK+P8vIG8bURlYy/Y67hxpNAvegtldEDe75Evfpf3nvT
         r4zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Fzn9/P3Nto6Pr9yh2kYqHQx8gi3mV8RmMLQJKZKELa3Tv+dfWQb35EaquPJBCll3MUt+pShSvOUtp0QGIAY=@vger.kernel.org
X-Gm-Message-State: AFuF++l8+6QKkLKRzzPpp4JcaEnLWcOA0Nj+i0dBoVivMmZiNSSGu0jL
	ND9H11X6mtT5V8P4vzjrSNlEoWgvaEEE8mZMO3RGdZocImAmLbn6BXwL
X-Gm-Gg: AR+sD10Lmzk6GIU5iCslmA2uzP57D1Cm3KrpeIbq75sjzyel0eObAlW1EJwSkVBJ0xq
	Ez6xeEBYCmqgnBqeT32Q/nu0f6tYqvcrxYt7r8oiZdWkErmuJLZlR5AFBMlAZ0dwlFZ7TYx2c5m
	YFsfXpiMCf1rFt9eFmO8u088hWHQBTVa186wL35fqg4hJtuo+Hj3yOiS4ynXyc40A/zy6hV333p
	mziXl8bE4d1R8e/ldwaZU9R801AlBVMU06wNTdzfDm4x298beLPf4cfIz/ZP8nFAiyWEACcUJ2w
	nqRyo051mXXlEC61xrodoe1U0RARS4wQAFGZLl8nuHT4VIQkQa/EETCk3dRCS2pnWK3auLHMos4
	dMI8uA/Oz/wBmSKk+UOGIZOt9dklevSDfOhLJt2aI7Jm87GSvd0294aWXjfaK+cnl6FZ3Rx3uvi
	apwOvcMw3CgC/bv/9KQHP4C8jRy+VSobE49hQNKurBZJ0zzE2XDbMlfCNPYS1ggwT+0JyYvZ19b
	jAOJAfIAdG5wS8rOPfeW6ehE6Z2k0JR3qVw
X-Received: by 2002:a17:903:350f:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2d670d1ff53mr369558225ad.9.1787588878665;
        Mon, 24 Aug 2026 09:27:58 -0700 (PDT)
Received: from frank0988server (114-27-66-217.dynamic-ip.hinet.net. [114.27.66.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6767a614asm19505405ad.31.2026.08.24.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:27:58 -0700 (PDT)
From: Chun-Cheng Chang <frank0988855428@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chun-Cheng Chang <frank0988855428@gmail.com>
Subject: [PATCH] selftests/watchdog: fix WDIOC_GETSTATUS flag decoding
Date: Mon, 24 Aug 2026 16:27:49 +0000
Message-ID: <20260824162749.1859778-1-frank0988855428@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wdiof_status table decodes WDIOC_GETSTATUS results and
watchdog_info.options, both of which use WDIOF_* flags.

It incorrectly contains WDIOS_* flags, which are only valid for
WDIOC_SETOPTIONS. Since the values overlap, status bits can be
reported as enable, disable, or temperature-panic operations.

Replace the WDIOS_* entries with the missing WDIOF_* status flags
and use WDIOF_UNKNOWN consistently.

Fixes: ac7e8d3e4a7c ("selftests/watchdog: add support for WDIOC_GETSTATUS")
Signed-off-by: Chun-Cheng Chang <frank0988855428@gmail.com>
---
 .../selftests/watchdog/watchdog-test.c        | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 4f09c5db0c7f..3802649b2944 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -106,24 +106,28 @@ struct wdiof_status {
 	const char *status_str;
 };
 
-#define WDIOF_NUM_STATUS 8
+#define WDIOF_NUM_STATUS 12
 
 static const struct wdiof_status wdiof_status[WDIOF_NUM_STATUS] = {
-	{WDIOF_SETTIMEOUT,  "Set timeout (in seconds)"},
-	{WDIOF_MAGICCLOSE,  "Supports magic close char"},
-	{WDIOF_PRETIMEOUT,  "Pretimeout (in seconds), get/set"},
-	{WDIOF_ALARMONLY,  "Watchdog triggers a management or other external alarm not a reboot"},
-	{WDIOF_KEEPALIVEPING,  "Keep alive ping reply"},
-	{WDIOS_DISABLECARD,  "Turn off the watchdog timer"},
-	{WDIOS_ENABLECARD,  "Turn on the watchdog timer"},
-	{WDIOS_TEMPPANIC,  "Kernel panic on temperature trip"},
+	{WDIOF_OVERHEAT, "Reset due to CPU overheat"},
+	{WDIOF_FANFAULT, "Fan failed"},
+	{WDIOF_EXTERN1, "External relay 1"},
+	{WDIOF_EXTERN2, "External relay 2"},
+	{WDIOF_POWERUNDER, "Power bad/power fault"},
+	{WDIOF_CARDRESET, "Card previously reset the CPU"},
+	{WDIOF_POWEROVER, "Power over voltage"},
+	{WDIOF_SETTIMEOUT, "Set timeout (in seconds)"},
+	{WDIOF_MAGICCLOSE, "Supports magic close char"},
+	{WDIOF_PRETIMEOUT, "Pretimeout (in seconds), get/set"},
+	{WDIOF_ALARMONLY, "Watchdog triggers a management or other external alarm not a reboot"},
+	{WDIOF_KEEPALIVEPING, "Keep alive ping reply"},
 };
 
 static void print_status(int flags)
 {
 	int wdiof = 0;
 
-	if (flags == WDIOS_UNKNOWN) {
+	if (flags == WDIOF_UNKNOWN) {
 		printf("Unknown status error from WDIOC_GETSTATUS\n");
 		return;
 	}
-- 
2.53.0

