Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC82D7814
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 04:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829367; cv=none; b=ss5dqpPKjPU0t1wfFAbsT0ifZMBMvpXWE2gQtvItMc6Zn16dxCCujG9RQClrQ8fX/nC6LOlCn9Kvv9avYA+8Aal0qnXalv3JS0dCCnI2P+34yFqe5iwhpkAtnBiucB4kPVS1hTa1yodKjMfJUUl3rVDD3LfcbRlF2ej/SgXx/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829367; c=relaxed/simple;
	bh=VAj6oUe/TU0O43DOvhQx6ZvzmDHg3qu28qW30e0TS1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsQ5bCo9eHAP3uu0dyH6ad1sRr/LPnZMHBT7ttG3GxeHv0oMaCAwvBS1cDBTogaz6cuQKw8RMMjxj6eAA//H7BeeJzdlAgycG/dZQgSImbtqEdwBXqSqL7Co0E4v9RDb+xFm5U43BRcM7i/7u0NwkQ7JWPyxe5PWus5zPoju8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRn/Ekcy; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRn/Ekcy"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92eafc94c9cso117005285a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 21:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783829365; x=1784434165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfLzU+Ux3JyzhsCTRzc6rXQZzc52Sb+wpPjR6e6mN6s=;
        b=JRn/EkcyfRJ6M8Qp16TFbox85SAeTcXEsk7FV3P0Sne64W7hqL0TnrM12c3jCFXPcw
         1rPgeB9PtPB5ejzU32hzIaHKPV9y3xSYFnsiqHRpfsEcgeO1y7UpQdQhrqTeOakwRWma
         hh6uWI6QuWD4jxuGPZwsNzTNXTqCQclzAqrLcghY3kjRgPGQ73xnEpYK0d8B5epqVmT4
         Sc+RsLDNqt4S919je58iuqO8wSuMMb5VuK7nEam4+R7yO0v3OdCW7DOQpyEzVbAtlu5d
         fovN/25J/SALI13VtV7s9vQfsthhlHqf+bA+iR7/nyiltehKRKjiiEzrwu7s+bE5sWcw
         gfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783829365; x=1784434165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jfLzU+Ux3JyzhsCTRzc6rXQZzc52Sb+wpPjR6e6mN6s=;
        b=KDhdzM/P0LFvMf+uZ1TjS5soU4RbIF+R0U27EVq0VnPOGfzXSeACeKw/Vqt8inkr9h
         HsogL7lDD0pTW7IX6eVyaFNtuUtt3zB4zuEXbw+TN8aOSLdL+KfbuTp1uOnqy6gxQZB3
         3hmyoptk2Hr2gBqZg/DS1MkInV4NDnE7v1uoofG5UkHlhDs2PG8f+RxfWtKRCer+5YiW
         /0M5nQJW3mvmXbkPtLJArk10AEOQqwcZnr3E4wAwnCAlE12SfbQdHCCFytkCHB1Sdhm5
         SI3TQ8+OJrE+2AyCtyoApeS7PyNGGV+4A6DId9gajbmiVwLq1UTidH+9o8VlKiowcmpa
         wUYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMbgCbNI1wFgux9Vwt79o+3yKC5o9bV/D3dRMdA6zmkLk2VCy45MykJRBnHU0pWDn4u8dY4xGjuFkcpszb3Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrU18ob/GNC0u8gtZdSSUSSmGLY3rNvs2HfQ2qS98r6T1fnuRI
	tSeMBTE/kf071WmJDJt7BQaVdivCLiXnXFT03tGpg6wU8zBqj9y0a78T
X-Gm-Gg: AfdE7cnxf3UhzWuHZCIjoOLWvX+DjO32SXPdI7NQ5TzALslcD0mYlUzSAmWK94WJbcv
	YUd109vFKNaD7aBhK4IHTsgPp97JENv/Ro3wrIpVfMOi/7VtHsXgqU5g4kCI9izgBhYe4FaigR4
	wU9Z5B4sCoBowQGqlQS9UvnWEMY0tQXaOiLUM/5WZufyJsHOo4HlZvd26JpX27IntSPEbWed00B
	9Zif9pMJV7V8UsVZ44FdMOk/aa8g1DQ+1ZmNNmRFOLpOHgad/KMm5rQQp2ZuZVPfm41xfxtRrnK
	RFW/7X4Vak1z6BmF+Xz3kYqBDZ+RryW0SgXLNoVCy1OZfnJVga4WORCtdRePetG/cKwKhlVvzZO
	8j9yKKG37Gv5Oh1rX4buI4tl5j7d8nujX0npSKGklVadMAbJEYC/lGVdqZHyQOIFghmK4eHg1/E
	XO49vzXJ3FHaLgtFiX0YOdThMKfjWRmY9VaEZbHWH+I4FS6Lu/lyonuSolGcQ7zxgysCZqTsYrY
	h7NCmuXUE4fV9vZQOqVecnHeE/PVOlOasUCV1z4ciw=
X-Received: by 2002:a05:620a:6403:b0:92e:c117:5ee6 with SMTP id af79cd13be357-92ef2c63c87mr502225185a.82.1783829364696;
        Sat, 11 Jul 2026 21:09:24 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-44-200-214-82.compute-1.amazonaws.com. [44.200.214.82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf9d9bsm687147085a.28.2026.07.11.21.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:09:24 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH net 1/2] ptp: reject frequency adjustments that overflow scaled_ppm_to_ppb()
Date: Sun, 12 Jul 2026 04:09:21 +0000
Message-ID: <20260712040922.6403-2-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712040922.6403-1-deepshah146@gmail.com>
References: <20260712040922.6403-1-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ptp_clock_adjtime() converts tx->freq to ppb with scaled_ppm_to_ppb()
and rejects the request if it exceeds ops->max_adj.  On 64-bit systems
that conversion computes (1 + ppm) * 125 in s64, which can overflow for
a large tx->freq and wrap the result back into [-max_adj, max_adj].  The
check then passes and the original out-of-range value is handed to
->adjfine().

For example tx->freq = 147573952589676412 makes (1 + ppm) * 125 equal
2^64 + 9, which wraps to ppb == 0 and is accepted.

Reject the request with -ERANGE if either the addition or the
multiplication overflows.  This hardens the max_adj sanity check and is
not a security fix.  It follows up commit 475b92f93216 ("ptp: improve
max_adj check against unreasonable values"), which fixed the analogous
s32 narrowing but not this overflow.

Fixes: d39a743511cd ("ptp: validate the requested frequency adjustment.")
Signed-off-by: Deep Shah <deepshah146@gmail.com>
---
 drivers/ptp/ptp_clock.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index d6f54ccaf93b..f83aa44b0a74 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/posix-clock.h>
 #include <linux/pps_kernel.h>
 #include <linux/property.h>
@@ -159,7 +160,18 @@ static int ptp_clock_adjtime(struct posix_clock *pc, struct __kernel_timex *tx)
 		delta = ktime_to_ns(kt);
 		err = ops->adjtime(ops, delta);
 	} else if (tx->modes & ADJ_FREQUENCY) {
-		long ppb = scaled_ppm_to_ppb(tx->freq);
+		long ppb;
+		s64 tmp;
+
+		/*
+		 * scaled_ppm_to_ppb() multiplies (1 + freq) by 125 in s64;
+		 * reject a ->freq large enough to overflow that, which could
+		 * otherwise wrap the result back into the max_adj range.
+		 */
+		if (check_add_overflow(tx->freq, 1, &tmp) ||
+		    check_mul_overflow(tmp, 125, &tmp))
+			return -ERANGE;
+		ppb = scaled_ppm_to_ppb(tx->freq);
 		if (ppb > ops->max_adj || ppb < -ops->max_adj)
 			return -ERANGE;
 		err = ops->adjfine(ops, tx->freq);
-- 
2.43.0

