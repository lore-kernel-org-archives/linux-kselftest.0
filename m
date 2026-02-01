Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2D273803
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769949567; cv=none; b=sCd/mfV5kA9kSY7hRu/Og+MiRgvHeunETV2OQx5SUyU0PO+YZGHeRen/qjOE00N5NyeBB+8P7HFJABNzoFttIS2zE3hlvy+ssINGW2P7W775I20lTXcpf6si8BvyAtQvjfz0ZcV6KlJu0s8MKRhWOyEBI4MssoX846lyjAueRig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769949567; c=relaxed/simple;
	bh=g0A5TH7j8z7YJKojI1DZ5gu3Eb65RYRR9EghIByGtT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8nKPP/T8jHqLALHxvuoRv4BikiREpx16ULiT8nxXg3EPdcCx2sF0g5fGoUcJuW+LuvLrMWUHs5dx5gr93IQbt7C22uD5HFk5orV1jKMCBleVbitt3xzWGdkWNvuV3FcgowEldPjBYptRl6+vxI2ivQ/qfEq07y2KWjeBz1fVpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa0gTh8T; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa0gTh8T"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-823075fed75so2176059b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 04:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769949566; x=1770554366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g0A5TH7j8z7YJKojI1DZ5gu3Eb65RYRR9EghIByGtT4=;
        b=Xa0gTh8TeGNGgxPkxjNzJ8hcPdgjPSOPAPwcdvuvxjqwPkDNK7TzrBrd9qwkA4qXu2
         sJ60xSP2w7j8SV0lO1CMhL7guKGYipfjeqlinK96RFXTpHngT5riBQZgjslcgB9n1jSz
         5Hu5kdnKR1NEeo18JR0Vkm2Tc7b64C134Ulu97FzSlA1USxts+4r8Gs2SQiRUW6QTVHf
         ro9gsdNe664fOiuHZZrOWr6LvMWpauvyXw8I+crMoBysqNHk5sWQMuay4sDSSlXTyXn/
         D+4RiAdncXcbENIGDq05mEH3ki/Rwy14FBm0eAQEWtcMQRBRyl1fKcVwCfs2PNGI5V74
         3PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769949566; x=1770554366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0A5TH7j8z7YJKojI1DZ5gu3Eb65RYRR9EghIByGtT4=;
        b=fg/OlmlLk/33C7gJ8wvwUu9RWCGlkntSZ3Ne1b88O77vIbvtW+bFhdoeTOO+wbEp6G
         Y18jPcwCvty4SOJA1hmcErNHNQEbytzDTuuaS7fSIYt8whPIBhvFurRPLlURrebX+R8Y
         x10RhAEzbyhwzI60qbqhjWH7ec1SIB9Ha6U7Y3cP+FdxWk/uoCGSQI4krfdoj+8tgm95
         tu10zp44XFtQBN9228s8zyQ5x1Id7noez93ktmCzqxIv49s1tZ8HKJu2JBvijm7ttlyi
         nfL3yAJNxMK33qQGJeXshKIAPZAkOYRlUm7M0Y2a9wan7/bMBnuyNDnlnruo9eA61hKE
         EkAg==
X-Forwarded-Encrypted: i=1; AJvYcCWywW2WfFoFKPvDpn6uxLgfBlfZZwEeAia3CKNljLXU67az8kWY4zc1V9aLjE2dnUpfnMTIUy1nkG82axcBbUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRGPIL20b2C6ie9LaSQS28fnqq9RGGm/6F5pnuLCWw2gtdYDLL
	nEsLkxBDvV+aOBPLhT/zGGIS1Xfkfs+kDWcwL7WBr6gP7E/hX0KOCTE=
X-Gm-Gg: AZuq6aKE9Qkim2Ec+Kvb3HAP3Wy2txeCS0nVdRaQynThQWMumfCNkTihngyufCjikQC
	oq73Ah8AZYXYJJnPepvAg7hQZO8EY3PSXe96EAQAiWst4NAEmM8DrwAhBhX8EgUYv0UjGGGYy6T
	zIV8pqrd/92mxBCm1Y9Fp7HtQGCoZP0yUsjY/PMeCvRsWz/k1MNZqEO91qz104ISNUmeQByb6aA
	sWasaYtoOt2Y7v/EC/PFIpUXAjCErmvCvxj2AAiT432UHxpRimZ7t3DvH/SkUms7/oYymDKIjT9
	0LToLWv0lnnrQMiho/jteEA512pwom6heOjzcaFAFOCboJQl/mvk2SsRep9Lw52t2EF0UDBVxvx
	T5e33UE6I9RCsG+fF0DA/bsS6pEytjtShhfJ+EPvG6mSIIvLX9QbvV76zz683Yyj85dGXyd7spp
	7PHoBspd1tWU2A5btAuODlJTQ6kW/zSg==
X-Received: by 2002:a05:6a00:2d10:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-823ab641c68mr7672874b3a.1.1769949566114;
        Sun, 01 Feb 2026 04:39:26 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379a19d33sm12940173b3a.0.2026.02.01.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 04:39:25 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Jinseok Kim <always.starving0@gmail.com>
Subject: [PATCH] kunit: tool: fix duplicated .com in run_checks.py author email
Date: Sun,  1 Feb 2026 21:39:01 +0900
Message-ID: <20260201123901.325975-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The author email in the copyright line has a typo with
"google.com.com" instead of "google.com".

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 tools/testing/kunit/run_checks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/kunit/run_checks.py b/tools/testing/kunit/run_checks.py
index c6d494ea3373..6b58b337a1f5 100755
--- a/tools/testing/kunit/run_checks.py
+++ b/tools/testing/kunit/run_checks.py
@@ -5,7 +5,7 @@
 # It is only of interest if you're making changes to KUnit itself.
 #
 # Copyright (C) 2021, Google LLC.
-# Author: Daniel Latypov <dlatypov@google.com.com>
+# Author: Daniel Latypov <dlatypov@google.com>

 from concurrent import futures
 import datetime
--
2.43.0
