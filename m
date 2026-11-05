Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848118;
	b=w507EVLrjcRZ9c/5iG39KqqoRyQPqWY9vHf2UM3iFahHXB3gri29z+WIteIRpJKZ+kGq
	 d/IOZ/ObdRz+EvWdsRODUcv3vdSCMS/Pg1Arisue2cQ+17CqmG2bVuHk1pxCZ/ULjv3dE
	 e2ufKfK6ulcMVm/9jZXMNYFqdVsmmaRLjB/VbJ6f2258/m6izJN/p3IjOkL+tduTd8BSu
	 bruIyyrhsG5wq2zeP+eDCPbFlSWcFI1ZR0MWXCJgC4hYorjIsqYwBRz3WbpSK2A15KjDk
	 JbOdgm90lbQ9izvpNXaFbL7LOogW84oMeju4++itiSt5j4UggxD4IjGu54UlO5NLOPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+hTcrw2qlCHhO70X54WC3Z16qJoO8Le0y8rhZa3WBPA=;
	b=KuDhn850FseqK+zPUZTCF8Y4KtN4UXZ/MfetFy3qvnt43Xop1zYOcJKWPdxhYznjBhXl
	 5yEn00O7o30dodhaaJNpnT0SFIwt40H1iruxA6lsCVsaZNxWVG3/ewcvoPhJdkfFWsNVp
	 cQDO1KQGRM/yFU061XcyEVFAcK0CxWSu2sKFYEfXrrT0XHMFY1O+JZ73ib3DkwwyKQiH3
	 i0VTthtEu9th6irXJTDYZ2PQBjYLdNcHq7NeAw+KwQ25U1HJpNMFn9fsf3dy04Y/vdi+e
	 DdBGz6fMucyHk7JpnxwyGtgas3P+nh5ATJ39d/fY7u5E2AYEkyUKAVTwjgCFFz32eBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wakel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XhKUI6Xq;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC1D606A32C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 03:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC1D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XhKUI6Xq
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae8d29e0so12561115ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 19:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793848117; x=1794452917; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hTcrw2qlCHhO70X54WC3Z16qJoO8Le0y8rhZa3WBPA=;
        b=XhKUI6XqNxb34vhkv7Xp1GhTqJ/8iFS/JNQCI+ZjY1NqHajvZqgZxCFZrDUwYMwvE6
         BP3hw1pJEKqMfWHwNp4VFifFDntIMLzANbnT39cBRcH2bcpyXKvyGeh/g2k6i4WZ+1DM
         waphUfBfdMgHKwUp0jio826vFDu9gAZOm5JagNhghm9vpnKVlVA3xf/GKx/Isqbl8W4+
         yoxLa6+9ZH3GPn0TmquzEUxOlC9dKnWE/YbAWz/aZGxDK9lov4bf9BhqFksAazbDyvQj
         0ELyOh6vCKlysmai1zFRysjZHoQ3AuJkQPY3bHNWaybinsO5k/NqxRmSG7+RkICE/i2J
         YWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848117; x=1794452917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hTcrw2qlCHhO70X54WC3Z16qJoO8Le0y8rhZa3WBPA=;
        b=vCC+4WrDW0lvqefUI8VWrskq5uORW/0SPVkX3EJiRiaUNlpmiqOaaSDOjondzB+3GI
         DR0f5WI6tZeZNBL8kzLL7nrTtEEEXI/sVcvApt00mlEWfkrma8EvutszO/v43u/btc4x
         k4iD5Oml0H1SeQCXXXeMaJ11FvADUU2p5l7Bu2fle50P5pGS0cD3E1cSe0guHnNc0u/g
         pAclz6wLcTtthIhirh41Xw8iVLi3smUrNhQIh86nBj3m+88aLPlcRRXpAZZNILv/yG4+
         LdfgCL6XIfR3KokhfOCfEuoEC0pIBmL9hN/dVk9aCLqofwswoePz+KtxvBMPXTY6BdnH
         IUhA==
X-Forwarded-Encrypted: i=1; AKwUvByUGNYigeFA5hwC0HbCt8uNVKI9ugB+o1xC52HUHHHMOUMMv/txIoKrIiLesSIqoFWqR9eyYnkTzCA19w4oOhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bCIQzFKWAYjflO50Xtrfzg+PdfdLjGhGG/868ZxSyt+w1XK/d
	iD3rTHioDbLb9ErSwHvIX1LrnBEDV4DUdfQZ2XOQ825SIyL8LyMqk1Pd99Unx+PmjLQ2SkJbxPK
	S7g==
X-Received: from plof6.prod.google.com ([2002:a17:902:8606:b0:2e2:f305:e980])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b8b:b0:2e9:7ff5:544c
 with SMTP id d9443c01a7336-2eb3642fe87mr148706835ad.25.1793848116599; Wed, 04
 Nov 2026 19:08:36 -0800 (PST)
Date: Thu,  5 Nov 2026 03:08:34 +0000
In-Reply-To: <20260910034821.2935214-1-wakel@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260910034821.2935214-1-wakel@google.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105030834.3318480-1-wakel@google.com>
Subject: [PATCH v2] selftests: rtc: Support harness test filtering and arguments
From: Wake Liu <wakel@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Shuah Khan <shuah@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-rtc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

rtctest implements its own main() function with a rigid switch (argc)
check that only accepts an optional single argument for the RTC device
node path. This prevents kselftest_harness standard arguments from
working properly:

1. Passing filter options like -t <name> or -T <name> triggers a usage
   error because argc is greater than 2.
2. Passing -l or -h causes rtctest to treat "-l" or "-h" as the device
   node path and fail with access() errors before ever reaching the
   harness argument checker.

Parse command line arguments with getopt() to pass all kselftest harness
options (such as -t, -T, -v, -V, -f, -F, -r, -d, -h, and -l) through to
test_harness_run(), while preserving the ability to specify an optional
RTC device node path as a non-option argument. Also ensure optind is
reset before invoking test_harness_run() so the harness can inspect the
options, and bypass device accessibility checks when help or test
listing is requested.

Signed-off-by: Wake Liu <wakel@google.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
v2:
- Rebased onto v7.4-rc1, no code changes.
- Added Alexandre's Acked-by.

Alexandre, the other rtctest changes for v7.4 went through the RTC
tree. Would you be willing to queue this one there as well? Shuah,
please let me know if you would rather take it via kselftest.

v1: https://lore.kernel.org/all/20260910034821.2935214-1-wakel@google.com/

 tools/testing/selftests/rtc/rtctest.c | 44 +++++++++++++++++++++------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 552191fe1ca0..eb26d957835d 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -487,18 +487,44 @@ TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
 int main(int argc, char **argv)
 {
 	int ret = -1;
+	int opt, i;
+	int non_opt = 0;
+
+	while ((opt = getopt(argc, argv, "dhlF:f:V:v:t:T:r:")) != -1) {
+		switch (opt) {
+		case 'h':
+			fprintf(stderr,
+				"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name] [rtcdev]\n\n",
+				argv[0]);
+			optind = 1;
+			return test_harness_run(argc, argv);
+		case 'l':
+			optind = 1;
+			return test_harness_run(argc, argv);
+		case '?':
+			fprintf(stderr,
+				"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name] [rtcdev]\n",
+				argv[0]);
+			return KSFT_FAIL;
+		default:
+			break;
+		}
+	}
 
-	switch (argc) {
-	case 2:
-		rtc_file = argv[1];
-		/* FALLTHROUGH */
-	case 1:
-		break;
-	default:
-		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
-		return 1;
+	for (i = optind; i < argc; i++) {
+		if (non_opt == 0) {
+			rtc_file = argv[i];
+			non_opt++;
+		} else {
+			fprintf(stderr,
+				"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name] [rtcdev]\n",
+				argv[0]);
+			return KSFT_FAIL;
+		}
 	}
 
+	optind = 1;
+
 	/* Run the test if rtc_file is accessible */
 	if (access(rtc_file, R_OK) == 0)
 		ret = test_harness_run(argc, argv);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.398.g882cbad275-goog

