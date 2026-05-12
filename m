Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830A3A4278
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595898; cv=none; b=Jz2mfWoaq/svTiMMhi2kzYfjDOPd+FajlI5I8JFloFlAUrAU5K/Gb3y6HZGtnxlk26SGn66mrzIvaNRS48CCVc1X9u0173U+mKbXVUL3WrkyeAAgoKNegg0syrPf6SWPsKGIicJWvbuQqIDqlYPPmp2ZW3F1yy7+vuZWqLQSMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595898; c=relaxed/simple;
	bh=fJZFKUOghzEMeZWOVYJe5GtaC9XO6oUkZ/ybmbSiKao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/w+yDqQkP36DCnQHgMVEIGRnTYrSJZkxh5tq9DlBdCVKJPV6OqnqrkGxFyme5RhxoqsP84x8WD8CzMid2k8ahKDa/aXmFIRVrEQD7p+8NYRPMAcp+9QjX05Ul+KEJS1BYIhiprJ/3wRfVM0mlKNCCxxGhf3xh8awHldr83MS04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRe/hp4K; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRe/hp4K"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8173b2af32so4075515a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778595895; x=1779200695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUjQr6FUuM03jk59EvtMyB5628RRa1MHzieg0EeaWo0=;
        b=cRe/hp4Kdaa23tSc43IYOCgXYMZupSu6YwsJofF191aeLXw1IgqI2uk9u5hg4lqV0w
         Hj7ovUryRJNq0WRyWMaRRNSR6X6QcHW0rJZvqqnmMe/u7VAaksgd6DL+iIpwlo9xgqL6
         P3Feg/bLa4SFCyP6odV41W7RMIsVFJyOJqiGAZvVPh2dZ0NRYV/EzyJ5kJ+RPi1xz7o2
         xejHtQjAH79mf65APCRsD7Hcgzl7VDm5QojyjqvPf0DQ/aKi0kWAUNeHFGW1IcQQmlpd
         PYc/jSVYGf+6EmXFESQwgUimrCONfxxM77Zk/DQb2u36WIvv6o5oxBkVNBb6cb00m6SU
         D0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595895; x=1779200695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUjQr6FUuM03jk59EvtMyB5628RRa1MHzieg0EeaWo0=;
        b=HLphpJLeKFGPTsj0u0RPj+lYQbT7BEeLPG5TAD2qUzEVikKxIgq0su03Ir+1eQHGTJ
         Tae028g9CkyLQRrWnXoH/Ud9x0N0eO84gRtUNWiWSCyQdYO8/igv6H83BNQgc6p/HlYI
         llXtXAfd/H5dQp8gDKReDIheKZjwII11doRHmztRqLYKRroovyt1IS8gPXoR2RGSWuWF
         pKQQSsJSuFKbQZ6dawmssyQPa/u40G5pSKvtVa72W4U3emedan5lwHYv9gPljvVDYYqF
         0VADbKEvQ7Sy4vE7URyML7G0NdVe+VFvcyDb+yvhUuvPwQh36tXLRIAEPBaamwwkvZCC
         a0bg==
X-Forwarded-Encrypted: i=1; AFNElJ9naseRy+ESOraq/C9A2iMiq96g4e6W79epoYUxnNJaEHQBFfUji5umO9eOzFrfEQY283rlBNw3bzZc7ZGMG34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyDd92i0rrJZEs9SSlalaIPqee+Z9uKovbXbggOPTGz+EEm07
	pv2PtKeeQThndQ2gHG8e1/PfIt0VHtxwsFtjQZlvg1Dewf17R4fe+JpJ
X-Gm-Gg: Acq92OHZbVODOhmWFOx31i22MgigXXs+25F1SUwAC5DOO6kO/ENkEWbg3JDnxqxq33s
	3VgcGWvE/bJUT41HVm8B0pZictouqQQidSXJKO+k0/lEFghSyqInk8mZHrfj8BPLKYgv5uwP3mJ
	dEYJMYDZQo2dXo1gNVccTz8vI/4mZ3rpN6QFw6yybKaAPr+IWopj8TIJgcvrG7rbyMyPs6Gx38p
	zWvEPG1PMvgooyIJ8U0/u/+Y17SAj2hiiie8ZzlOPJywplpSlH2wImo50Z9QWF1kSUtpmO50wSJ
	H2opdvBah7TgsJAaB5fQGG8xBMbqLqM0/PzWIbnZLCGqwlbV7okkxzvsZnRyCg4gEGD874i8Odi
	+l0MaKNLdWqx4sx0B+EI2kprFepU7+Ftd6GMGa3DKWUeWOjMGmDIPx8lrMZiDQKx4bAev5WE5GL
	JA74BHf1tCkBAkaS/jSIgsjm4r2HofstmPg17FkMRZ0I/S1oU1mOuXxowjWudT6tEquzMzf0twv
	KPOkoTLQfhlrzpM8EeMn3xRTtk=
X-Received: by 2002:a05:6a20:430a:b0:398:7792:3882 with SMTP id adf61e73a8af0-3aad42cb96emr16411493637.16.1778595895526;
        Tue, 12 May 2026 07:24:55 -0700 (PDT)
Received: from localhost.localdomain (zaq3d738d39.rev.zaq.ne.jp. [61.115.141.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c861esm29850103b3a.30.2026.05.12.07.24.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 May 2026 07:24:55 -0700 (PDT)
From: Atsushi Matsui <matsui.atsushi.home@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atsushi Matsui <matsui.atsushi.home@gmail.com>
Subject: [PATCH] selftests/watchdog: mention temperature in status help
Date: Tue, 12 May 2026 23:24:48 +0900
Message-ID: <20260512142448.12151-1-matsui.atsushi.home@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: mattsu <matsui.atsushi.home@gmail.com>

The status option already exercises WDIOC_GETTEMP, but the usage text
does not mention that it also reports temperature. The file header also
contains a stale TODO for adding WDIOC_GETTEMP coverage.

Mention temperature in the status option help and remove the stale TODO.

Signed-off-by: mattsu <matsui.atsushi.home@gmail.com>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 4f09c5db0c7f..0626c96f2c9f 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -5,8 +5,6 @@
 * - Tests Magic Close - CONFIG_WATCHDOG_NOWAYOUT
 * - Could be tested against softdog driver on systems that
 *   don't have watchdog hardware.
-* - TODO:
-* - Enhance test to add coverage for WDIOC_GETTEMP.
 *
 * Reference: Documentation/watchdog/watchdog-api.rst
  */
@@ -83,7 +81,7 @@ static void usage(char *progname)
 	printf(" -f, --file\t\tOpen watchdog device file\n");
 	printf("\t\t\tDefault is /dev/watchdog\n");
 	printf(" -i, --info\t\tShow watchdog_info\n");
-	printf(" -s, --status\t\tGet status & supported features\n");
+	printf(" -s, --status\t\tGet status, supported features, and temperature\n");
 	printf(" -b, --bootstatus\tGet last boot status (Watchdog/POR)\n");
 	printf(" -d, --disable\t\tTurn off the watchdog timer\n");
 	printf(" -e, --enable\t\tTurn on the watchdog timer\n");
-- 
2.54.0

