Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09D395AC5
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 22:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787610644; cv=none; b=nXEcgq9zDl81wTA+VYUP9PivUK2uVvf6p2AJiwIOmrgAs5W3OQSoS8koVLni9l6JuJlV3hOf8S4Wcrv8QOsIeNfDVyhsgZujI3/mduk1p8ScSbjVuc3QWQUich+JINtX4ZO81nVTd3plAAcKsE992/YXZr1dcHqJzo2Fm8IC+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787610644; c=relaxed/simple;
	bh=46PX0FlkGlV536K0GKo1yzcpkUA04/z+e0JSVcYfBMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HWjPj43GxcObTpTti9K/qBAdN9zXx6uqWPbDu4zzJ1wToVA/bBXne07AqwbtDVoefTzKHjtEgnK7lGxz63c0h002ROLyBkrHSCYcjDbPz6EA4NZMu/VruPVaflS/fGxJSjpzBvTq1FCcLxqeUbSSgTgalu64OoQ9nLUofFA+TwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPzePrLU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPzePrLU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso25654885e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 15:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787610640; x=1788215440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ji4BxHAWPOY00GQuR7X51Lc07RsBjSGz9WKxTKhJHKg=;
        b=hPzePrLU+Llj9CkWIKV/PKcERUdcq3tq7MItUD+rrj2MSRzqxcG63SmoybwQf+QBA1
         QZ00pG3BS4BBC29sREDeC2RI+JwJSWKXsWxehynzmXpG0zWBSRTB8LYK1u/nG8+XiNje
         HpJrqgjYfA9mY1TjGEe49SbhRj2fZbeFcU5CSrRD/v0j/hBc8pCyvuF/AqrlLtGhWxpe
         hXJ72xZINMzJoPO3pD/2rebImF/DCSD1ObgO7hEgNNTVdp2DHxveU2i7SCylmf09CcZ9
         K5gLX5y6umy/At7A6qMFR66ZX+AWDmJh3bdZHkNzAL/vSyqKdTYGeZMCczPtVInYglyi
         Urng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787610640; x=1788215440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ji4BxHAWPOY00GQuR7X51Lc07RsBjSGz9WKxTKhJHKg=;
        b=Yx8z6o3CarT1EpxgPgtbQc2ExOQrttmhoMpsBIrouhol9uRhqnhuahXKwprpHeDLQ7
         mSzudZ1qzUW4ERSKEJo696bHWh/CLjmwqIy+dkkCLha8nJuzuoP/Z6SjMLGHCfZyByCD
         G1rc4jrCO2nXBwKftdT+u0TH+h4AeCUg+kiELkKrtSee0hCQFohHYQsKiQ1u+oqZCXvW
         Co8zWTDWVlX/HJlcsZzO6Jmz+5KyAYCqStPj1iepfs5BLP16f+XlTNd9KmoRsHEqsD7b
         DO6fSiswhodUq8lT6zzu506m8UsPds6uBucyW8DydEGdSQv3YL3NdJgqSopPX+9MkA0i
         otPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr938rNdiosLjOX+ETEaKuYZg7DL1WZ+O4B6omL5iLoGJT011z5pSC9Smq34xKEx4hdO3hzN/a5lAyNRKqvdZA=@vger.kernel.org
X-Gm-Message-State: AFuF++muS9Il15QPs2mPhsJQE183075fE9Dw9PrW4LXFmJmYVh/hjKql
	EVakveO4t+5C2uRGN5UddaAA/UnAnNG3noBQ5bRaC1+9hfeuq0uE6Zej
X-Gm-Gg: AR+sD10H27VCfoKISSajmFWZET6vWXMB78QmDhE0pBC6Jikz/nogQpjiopeTA2UeXTO
	L+IElPmN3VT2dzw93ApbeJYYzRv0E9Z5X9zkTzgClAPOA0g3RuZNzlHkcEUWKGS6j1ryQu5Asox
	qHnaCBOxUKl7Hw9bKpdE52W7iJC2LEaHTdTljh6A67IuLEQN9rrjTvY4PiXvRDvC+mDnxHyWo/J
	ar3uOSuCOMF/4pDVrNgk0rgD6wOeXK+uPZIuPLRZ6FTGoH8fozI8/Pi5Rci4PGMeOD+zkKGhUJX
	Mzi9pKfi/BUN2zOrChJrkTEUw8xxetWnIAv98cEZCJIM/OEPrmo5XhhU9Kbi/CHs1H/iD17NqhT
	OqaoqkcGm/m5Wfi8pDhohzxw3nDXUMechSAKsPYccaDz2/PANySLeXWzl7Wfffm6tkmTT7mZFHt
	foVuUAeSPp9JctBTHel1tesj9OfneJbnHjumDOWiV3yZWxzD3lT85pdA0E+4psV0aHWI6HVYeU+
	iEAqTQke2RE
X-Received: by 2002:a05:600c:138e:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-499d656bb71mr19576815e9.10.1787610640333;
        Mon, 24 Aug 2026 15:30:40 -0700 (PDT)
Received: from hisam ([2407:d000:508:2027:836a:630c:55cc:a9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d63669e6sm9049155e9.13.2026.08.24.15.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 15:30:40 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: kvm@vger.kernel.org
Cc: dmatlack@google.com,
	alex@shazbot.org,
	shuah@kernel.org,
	seanjc@google.com,
	jrhilke@google.com,
	rananta@google.com,
	vipinsh@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH v2] vfio: selftests: Include <libgen.h> for basename() on non-glibc builds
Date: Tue, 25 Aug 2026 03:28:47 +0500
Message-ID: <20260824222845.459181-3-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs.c calls basename() but does not include its declaration.
Glibc exposes basename() through <string.h> with _GNU_SOURCE, while
musl declares it in <libgen.h>.

With musl, this results in an implicit-function-declaration error and
subsequent type-mismatch errors at the callers.

Include <libgen.h> so the declaration is available on both glibc and
musl. This is safe at both call sites: the arguments are local writable
char[PATH_MAX] buffers filled by readlink_safe().

Link: https://lore.kernel.org/kvm/CALzav=fs4bqMM7BXNPXqhtbqGzA+LW5fgx2-1Q5=sTN5+krYhw@mail.gmail.com/
Fixes: a262fc49e0aa ("KVM: selftests: Build and link selftests/vfio/lib into KVM selftests")
Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
v2:
  - Changed subject prefix from "selftests/vfio:" to "vfio: selftests:"
  - Added David's Reviewed-by tag.

 tools/testing/selftests/vfio/lib/sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vfio/lib/sysfs.c b/tools/testing/selftests/vfio/lib/sysfs.c
index 11415448b2e2..daf117a299a6 100644
--- a/tools/testing/selftests/vfio/lib/sysfs.c
+++ b/tools/testing/selftests/vfio/lib/sysfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <fcntl.h>
+#include <libgen.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
-- 
2.51.0

