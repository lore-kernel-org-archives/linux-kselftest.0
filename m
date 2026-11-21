Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288424;
	b=Q5KwR7L/ZlXziOTRtlh12yy/uolXrhDKX9Pp/weYA2ivPDyhoArQDHoYL5hIvvC/+2N7
	 NUIvbtfZe4TewxXfmDavV+w1BlSj/3C5/Xn72Pm4PdJeqxDiSEq4eNvuHJnkAnJcAHK1N
	 K+pbB/beW/+ZXH9Ss0RIIeQ2MPA8vsHLJ19AiS6YxkTHyR9/u1faX8Mm1bM7j4o57wiY8
	 Guszex+g3uwMOG+6AE253lMpQkaW7VM6wTXzBk4eDo/CAi6vtOxQHNxSZ5GZ7zOh4qgYi
	 HCxWB/XvLnUunCq0ykTHCbiV3ZA3bE/+5r/ceHLymih85BDWGVe8M5wb/l7qv4Mc0+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XckOn5FCGtnClD4l5C6V81UfiN1tJJnMtgHtot5cyoM=;
	b=wcTAXcxQ8g08cTpdbZnd8b15dFwnuU479BCRqkgA/BJQhL9n9pU5RgL45jXwlfReCAHP
	 f8wCi4rdskTHq6FQrwQ1Imhztzl7e+enK/ygieaWoZfCull5dCD9+H28+CPbEUmjgXzJE
	 dBMrgeWsgNDiH+0LCrzTRTdblXl2+gZ0lv06SCYGaW3PCY7lVmL0LijMp2uqW2K5+Azdx
	 hntuUzFN1wbdNJZBEbCpVMVEUgKID7htAHwvgBWvc9W25GGSLCRS86uesovfxNA7KHA7I
	 iDq61TgpQIFzsWs93i826c03UUlO1RV5YeSutzkf0rqeDYrvgQGXY0TLs6pLt66hZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pkkKtbZh;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53917606A32A
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 19:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53917606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pkkKtbZh
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91f0274f88cso30049146d6.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 11:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288423; x=1795893223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XckOn5FCGtnClD4l5C6V81UfiN1tJJnMtgHtot5cyoM=;
        b=pkkKtbZhKOTUxbL/OCg0rZi/Fby1Q3GGB14+TYR3BvwX2H7baGAy1qnMQc+3Rrpwc5
         jRupK60BOCUOIEQ5EEwQWG9ErP2r2qlvt4Tjxwk4NqHxttt4QztGPJ/5+6x+0GqY6py9
         Eus16HMneHQz2lj0tNHosb4EPg/g2ikgKQTyPrY60HbR0cujYIn7q6pYMKBqK6VCn5Yd
         K6VPMcxeVX4JhG3lSok+yubtPd0J/ibVBp/+CYn4vJm69WOAB1d5Za531uqqnrnGd5eR
         5/bPYosgwO+m8duZJnJW3LYblKY2wTMXEtB58gdhy1idGokmn4qaF4GTgzqHSGPhclRM
         Sciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288423; x=1795893223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XckOn5FCGtnClD4l5C6V81UfiN1tJJnMtgHtot5cyoM=;
        b=Wp6QuuMpd9Exfs1F3FQfwt1f4uCfDMX4ZkdY8AuSgHX3h9rZzpiSsZLNSH8MX/p++A
         hyRgYcWDHNu96CGbkc0zj5/lA/C6zuYtGOXfsDTyyIvhMhkREQR8no6AuxADliAxIuva
         wDwU6i5k7vORQBYa2BOFR6oRlP5YxYZLTutBqDaac27px/BitgSH+nAKd984s8fy/8gp
         b1//gktS21+BZ6OJAsp+unYfkEYWAZn2rEGlFUlC+AB91APcdHxcyspq6M4mYI5xoLWt
         2BLD00vrEFjXyrbjd5wVJVgtWoLW3YwTJFVl9ncSwaFhc2CQetIVc0/uBvgJs+keuLVU
         aKkg==
X-Forwarded-Encrypted: i=1; AL+hErEiKHtDtTSlT3QTPz3mSOyYGvYdS6UBJCDJafXmP8DC+p7Y82Z5jAkYDPNKlv+wfJshPZbgdxUvmWm07OmYVTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EkJjLhcCnHhQEIVFlBIlPrsbMPbCSi/1tcAfJKMfEsuVE+utj
	FSJBpWfuKqnBX/wHbxzs5sRXSmM3adRlP4EiijqY04W7dxikrcq1/5SH
X-Gm-Gg: AZFdTZdwDSfakqp/PZ2z2yRUhz17kzBN3cxxh1lwI98NGG8OtYVC9Tof7RyF1DPUynX
	7IfWZBQ8sM5gbcWbocO+OargLd73DuxFKBBkeySwe/ZNrwsP3o/8KE1c18+mw34F6mATh/LvJQV
	U87WgW2sXY/gyiNR1hqMae+vSIXYv9kzjyoJRXJQlKRAieTHWQQMPsy0UI961JUg77mH75u6q+p
	7jkZlsz2urJCyN+vK/jPkzM6c34Gz+CloV553rGIQYtCBeEAvXrW7+d3cz+UdAGYhifBOc2pVcD
	7VTLXp7b9DRIAJpky2YXLnxhICULQIRsdYBFl9qzjcWAIWyDfo53FpeWwClHGfnYfBYAXs2DVAb
	ydjjkm0g2wneyPrNDFFjyVtK0uHwyfOTXPACm57wuOPhtUJsGO0JmTqdfq6ts1Tk10ZSQ2Vzo7J
	hHhmvfJDfqwLsXSC1ONgJuGC/LJD6mzgw2EeACX/34McZ4UOor6fe4cdf4CaW9RZr1lC3E+xmob
	rmWxBJivzi3KYL17hM6/vq1R15Jt5yyQM5gFNoziA0sYFJIcHyWAr1QqY9GkPT3AHAbkV4DW4iZ
	Bk5bdK5jC/g1ZRO8JI4aRlTWd26A0SpGm9MB+6aKUiZBCYOZCOxq+/9b8YWd+dhbSqvv2yT3BnL
	lzQ==
X-Received: by 2002:a05:6214:1c0e:b0:921:41fa:7601 with SMTP id 6a1803df08f44-92141fa7702mr67137086d6.17.1795288423188;
        Sat, 21 Nov 2026 11:13:43 -0800 (PST)
Received: from localhost ([143.198.29.12])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a24aa8sm60285076d6.42.2026.11.21.11.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:13:42 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/2] selftests/coredump: drop unused <linux/fs.h> include
Date: Sat, 21 Nov 2026 22:13:39 +0300
Message-Id: <20261121191340.91952-1-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.34.1
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

<linux/fs.h> pulls in <linux/mount.h>, which defines the MS_* flags as
macros.  <sys/mount.h> declares the same flags as enum constants, so
having <linux/fs.h> earlier in the file makes the macros expand inside
the enum declaration and the build fails:

  /usr/include/x86_64-linux-gnu/sys/mount.h:35:3:
  error: expected identifier before numeric constant

The include is not used by this test.  Drop it.

Seen with glibc 2.35 on Ubuntu 22.04.

Fixes: 59cd658eaf40 ("selftests/coredump: add coredump server selftests")
Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 tools/testing/selftests/coredump/stackdump_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/coredump/stackdump_test.c b/tools/testing/selftests/coredump/stackdump_test.c
index 1ec88937a1c2..8a681e486c3e 100644
--- a/tools/testing/selftests/coredump/stackdump_test.c
+++ b/tools/testing/selftests/coredump/stackdump_test.c
@@ -6,7 +6,6 @@
 #include <libgen.h>
 #include <limits.h>
 #include <linux/coredump.h>
-#include <linux/fs.h>
 #include <linux/limits.h>
 #include <pthread.h>
 #include <string.h>
-- 
2.34.1

