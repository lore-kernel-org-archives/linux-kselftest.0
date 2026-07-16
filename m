Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67841D651
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784203072; cv=none; b=lH+zEKxjiQ/loO+Ebif9NHZHbRMN0TQWPdFYJ8rdntndKG+Mjx19UzSaGMnTHxfAJgaWgP/7utGk/azUuWyh3C4joINrd2zfUs9fp2QRpKMjfD+XnpKr6Rc123s59dMwzUjshIE8PTMPPMAOGjWjzHLDR5ykIFX9A9491ofF4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784203072; c=relaxed/simple;
	bh=+GHwzsQ+4i43LI5Xh5tdHnXG/sDaoYxRx5Sy1qBv2Ds=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDJqpUe68ofGlKrWy0XIVxR7XmoaXOIJW4VOzLRDVmWFwzN2+QWgEybALXz0yc/sUZhnPlVzKF+zxeFTzPJjsvAAEEySeq2hJekVUqCraejJA3RkBSI152zXff6QVu4Z3N9GXa1CmTfSgceLMmHY2oRtVw9aaEEXdsHgYNTXbz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQj9JGjL; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQj9JGjL"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca88130e09aso4302247a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784203069; x=1784807869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crvbQPwYA/dMgK99dNCCjn85E0qewMxmyRRTho2IQ6E=;
        b=gQj9JGjLqnzBb6FyIV1q/UgbGAUZfFqMXsYeDi5J+1ibSTCjTg2Pj7Gr5Svv2ulIi0
         OWXu8/MV/IB81Zboqy8vUM06xP9doWZc+nYJGy9ugfLKEwrRSoUp3/iwrbmhLWGqbfB0
         uAOhxmOeQ9hXYhpRUGlVJga+I4jgD7jn53Z6i75/OtO4joG93PK1no7iZ5ZsdUF0Sy4C
         WgGax7JOiZ6dbj3a5OWCXau97ziGD6w+UE3LdsIKv+20hOljX3vwYhkJN6/WkSFRcD0M
         SrLxkm7nVNETeJjzTAnF0wo3SEyBZPJKvZwepivEDOp3X3/77LJ9xiXa3Y1cx0vUf8nc
         DHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784203069; x=1784807869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=crvbQPwYA/dMgK99dNCCjn85E0qewMxmyRRTho2IQ6E=;
        b=s+T1qRzzMeFYq1DsjA1WDQQ3vjQ0W49KvNK9oBwjIEZRlTvEIVos65ek8zjsHxamHl
         OpGsnizD8XWDoKU7SfDiNu98V9pW8mIBGD1hcUSNQ04wCcrDASWTXosscqIAhBPShp6v
         Es2Nc/qvOT20eEBqDsNU5f9GRNDvnBJ24zsutxYyr7K3sX/HOrK+J4y3GeQSGGw0xwfs
         QbovDsZ3Gd4i5X2hkgDbJC/WYec9ZKSRog37+8Os8dHrSWoLqVppIQsDFt2SjItc/pO+
         bAw0XrjxPrVMDL5JS3uMztMd3c8uuf7u2YE6QIaVjFPcHde0wvp/UdxeWzzNSrse1I0o
         tjiA==
X-Forwarded-Encrypted: i=1; AHgh+RqunXtCpAP9K6G8kV9F8omuYTLax4aetWul+TOdPayrfL5HGjShq0RYpt/wByPEy0ZoPwTcQrnHgLwXqib237g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUAzuJVKEmc6WGpO25+ZwVQHIJ0zh+ZnlrUxEukBeFYCRp0gUR
	ogC0lTiEQvTK0QVsl8Xra8pF2Y77sjGg01+J7CgpiO+j+w2yxbJMHikJ
X-Gm-Gg: AfdE7cnuxfsPY1HcE5p19BoT+YLO4w/jQGjR31l5dhlCbGNCNchZBoBMKE0iqsJ05d1
	0Iy6Q9DXupnFvEgyjkv9dESrM9kvXV2CssV3xiRGwAKFnt1RRZucO1jhWKJyHMHlTW0B1xULsA1
	7V9heXSJWcMYaRZ9HscqyNO1JZ3IJ1NuWLeUyvxnWt49O75gI7Rj8Qas3t+QZZYJ6ecw5ZAmESa
	hiyN1wq2bOqLECtpLLoT5muenrBi8RdM66ZfuyKfe4rhf4TogTYOcpbMYgdQ3bE+7CRB7skWe+Y
	Po9KXIB1IdKrJQ4V/qbIxY/cHj14Vfng4+PDpbrNWZPj5L461mYh6cAmgvMiDs75I42Jtj276Yv
	O/NF16NazP9aQicdKm71da4y6lD6CE6YgH5YMC1kJfikx45ZDsfht53x26YO7x1JU4H31ss8gBD
	WeA8LpUwaaFpsoLx1kKdyWIe0AtmGfX7L8WITDCv8a
X-Received: by 2002:a05:6a21:329b:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c3571d0bf6mr12359951637.37.1784203068527;
        Thu, 16 Jul 2026 04:57:48 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:90:2db1:9c31:f107:8086:4204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6ebe98sm10920690eec.26.2026.07.16.04.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:57:47 -0700 (PDT)
Sender: Deepak Rao Gaikwad <deepaksraog@gmail.com>
From: deepakroag <gaikwad.dcg@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/3] test: expand proc smaps coverage and require TMPFS
Date: Thu, 16 Jul 2026 17:27:31 +0530
Message-ID: <20260716115734.80909-3-gaikwad.dcg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716115734.80909-1-gaikwad.dcg@gmail.com>
References: <20260716115734.80909-1-gaikwad.dcg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CONFIG_TMPFS to the selftest config. Assert Private_Clean,
Private_Dirty, Swap, and SwapPss fields in /proc/$PID/smaps output.

Signed-off-by: deepakroag <gaikwad.dcg@gmail.com>
---
 tools/testing/selftests/proc/config        | 1 +
 tools/testing/selftests/proc/proc-pid-vm.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/proc/config b/tools/testing/selftests/proc/config
index 68fbd2b35..7dfc3d381 100644
--- a/tools/testing/selftests/proc/config
+++ b/tools/testing/selftests/proc/config
@@ -1 +1,2 @@
 CONFIG_PROC_FS=y
+CONFIG_TMPFS=y
diff --git a/tools/testing/selftests/proc/proc-pid-vm.c b/tools/testing/selftests/proc/proc-pid-vm.c
index 4e6a3e53f..59535bb3a 100644
--- a/tools/testing/selftests/proc/proc-pid-vm.c
+++ b/tools/testing/selftests/proc/proc-pid-vm.c
@@ -20,7 +20,6 @@
  * Test /proc/$PID/smaps_rollup
  * Test /proc/$PID/statm
  *
- * FIXME require CONFIG_TMPFS which can be disabled
  * FIXME test other values from "smaps"
  * FIXME support other archs
  */
@@ -409,6 +408,10 @@ int main(void)
 			"AnonHugePages:         0 kB\n",
 			"Shared_Hugetlb:        0 kB\n",
 			"Private_Hugetlb:       0 kB\n",
+			"Private_Clean:         4 kB\n",
+			"Private_Dirty:         0 kB\n",
+			"Swap:                  0 kB\n",
+			"SwapPss:               0 kB\n",
 			"Locked:                0 kB\n",
 		};
 		int i;
-- 
Deepak Rao Gaikwad

