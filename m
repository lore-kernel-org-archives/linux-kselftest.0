Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758476;
	b=Ewo1k0ofqnAFojMNmyjOn2Rite1WEuiKUsO1Hnwd3Yl6thESucCwHO1INsOas9+f8yMS
	 bBcZe0f35SpVF1gqNlPNtF/7j00Yl3eVJRL3hPSJuL7uJhn1Q5aeIuzFHiBuZMtpr+U0M
	 nMF5AHLav2PE0C0cFJiWNxKjItMdu0kcFAQ4t+x6Mv3BCJYXvUN7kM1uHuOyr6TW2jLTQ
	 irHA9533GXIH7w5B57Y8041uGklNywv+b/uTLKvmhaCQd6pkTzH4DX7dJNljipglEkcoC
	 PpD4UhGJJ3R2MrzbKUL/SeHxnPyvjA/zJWM1jMmt/SEoXEtzZ39yY+wJea3XJX2XVQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PEtMxT4PROaXkntuICK0I1QFQe5PSnm2qJpCmGFKExY=;
	b=CYZS6Y9weWc6V6FmvKNWHidxhu5bftXLMLV5W4dafjg4PQFEPFB0foRofupw8ybc5Jxf
	 h6rD46gH17B4WM/4YMbO+yk3OzZyZmPThheBtqmDInoYCMhMVhSzfb1Ip+tCantHtMmhz
	 ck9Zz927dAIFgVtmKq9ElcwY2OYGo9d5A5xzdC6ha9U3zdWkzxGKLMpSiGJenyHaZ0epJ
	 9QckuqGqX6dj/JFC2OytGUJyN2JhP7u/Azx47PCe8etO2TUa+JtL7aFVjtUdZQjQtI0FW
	 /sEjdupkDxQv92FHABmZgYLVasD816tOCg3GoQ/OUoFwgl5oz4C7wwcuQtaaUP7llKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsKyyuvV;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78EF606A8B4
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 16:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B78EF606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsKyyuvV
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea381ce04fso37200555ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 08:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794758475; x=1795363275; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PEtMxT4PROaXkntuICK0I1QFQe5PSnm2qJpCmGFKExY=;
        b=nsKyyuvVzpf4mEt0LAHbwEkBvfrLoEFPzZVHIcM9v4SHt+x9AnvvvAThxlWrqN9TjX
         1I01/UOnOEqK8y+ksqIeybbchY2UZCv8nEjSbjwAc6+EwcWv1kw9TGpeki6P3tDiQsXl
         zYebv8nVCO0CJRlZdHpUejaNs6GmXYhS9Nmcbl6/eUmnw3OCk9QRij8FpBwz8lVxzgaM
         EGKHO3Nn0IvAlRT7gR373iv124Tm4LDX3HYdMqxtlhXtfJkZ8UnikO021H6daijT4NIq
         iQVZSausiUWFoFtNudvY3FFKjgPXw0QufUNdr1ilo8QtV+F4D50H/iWTtqL7XK3JPey6
         TeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758475; x=1795363275;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEtMxT4PROaXkntuICK0I1QFQe5PSnm2qJpCmGFKExY=;
        b=S1UZ9+OrErS6hTttp4y0wruiuR++tb9EcV3Wg27WtTg/+VLfh7VEcMXb6rHYYiMetB
         Dz20dTXrGF5oht52t6GhAvrpssTriOOlblMnEgZFL9uTDxkvgRJbGUOUWY/GaljskXbL
         q4uBW/da+8mIMbOeQ6G0wr1XgCZ7PBlAlM/sNAmIbAFYhOvBpQocVQGRW71OyAophlsi
         guEaui80U0d6TWZhcfFiEtQLdST6mv/sngPBvs2zwq2xDC0n80iu06cCjkxK5djzlZ5O
         7H7kDZPaMTQlXwlv4ZczlOokpDYg0EI/t7EumvW7VQTwpHaFtSeZ+sq+Zc8s2eP0VUyA
         b9Vw==
X-Forwarded-Encrypted: i=1; AL+hErEYQ68Q5c+wG889xzbBSxhFa+kBkGJt1UAuFDIuU8n1G+/U5l2FmVDVo7apHNZ83A0BdcIfgSke5jR+r7L3dns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EAExLNh87XOifrMVYuhlVlvBGPafUGbmyNjVEVccaCrBsrbsm
	ijnlhHP/AbwtC+91za14UcywarISxeft+swXK55hxdfLVgt8yRJIZC5lqKJwD3B01T5CTwhJJN9
	u29byxGPkBqY3hg==
X-Received: from plbkf3.prod.google.com ([2002:a17:903:5c3:b0:2e9:7e8e:b72e])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3c2c:b0:2e9:93b7:23fc with SMTP id d9443c01a7336-2edf1ed96a2mr76147275ad.17.1794758474742;
 Sun, 15 Nov 2026 08:01:14 -0800 (PST)
Date: Sun, 15 Nov 2026 16:01:05 +0000
In-Reply-To: <20261115160105.2507650-1-jiaqiyan@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115160105.2507650-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115160105.2507650-4-jiaqiyan@google.com>
Subject: [PATCH v4 3/3] Documentation: add documentation for MFD_MF_KEEP_UE_MAPPED
From: Jiaqi Yan <jiaqiyan@google.com>
To: linmiaohe@huawei.com, muchun.song@linux.dev
Cc: nao.horiguchi@gmail.com, william.roche@oracle.com, ljs@kernel.org, 
	vbabka@kernel.org, tony.luck@intel.com, wangkefeng.wang@huawei.com, 
	willy@infradead.org, akpm@linux-foundation.org, osalvador@suse.de, 
	rientjes@google.com, duenwen@google.com, jthoughton@google.com, 
	jgg@nvidia.com, ankita@nvidia.com, peterx@redhat.com, 
	sidhartha.kumar@oracle.com, ziy@nvidia.com, skhan@linuxfoundation.org, 
	corbet@lwn.net, david@kernel.org, dave.hansen@linux.intel.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Document its motivation, userspace API, behaviors, and limitations.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/userspace-api/index.rst         |  1 +
 .../userspace-api/mfd_mfr_policy.rst          | 81 +++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/userspace-api/mfd_mfr_policy.rst

diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index a68b1bea57a8..9c40445ea354 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -69,3 +69,4 @@ Everything else
    futex2
    perf_ring_buffer
    ntsync
+   mfd_mfr_policy
diff --git a/Documentation/userspace-api/mfd_mfr_policy.rst b/Documentation/userspace-api/mfd_mfr_policy.rst
new file mode 100644
index 000000000000..a5441bfbe78b
--- /dev/null
+++ b/Documentation/userspace-api/mfd_mfr_policy.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================================================
+Userspace Memory Failure Recovery Policy via memfd
+==================================================
+
+:Author:
+    Jiaqi Yan <jiaqiyan@google.com>
+
+
+Motivation
+==========
+
+When a userspace process is able to recover from memory failures (MF)
+caused by uncorrected memory error (UE) in the DIMM, especially when it is
+able to avoid consuming known UEs, keeping the memory page mapped and
+accessible is beneficial to the owning process for a couple of reasons:
+
+- The memory pages affected by UE have a large smallest granularity, for
+  example 1G hugepage, but the actual corrupted amount of the page is only
+  several cachelines. Losing the entire hugepage of data is unacceptable to
+  the application.
+
+- In addition to keeping the data accessible, the application still wants
+  to access with a large page size for the fastest virtual-to-physical
+  translations.
+
+Memory failure recovery for 1G or larger HugeTLB is a good example. With
+memfd userspace process can control whether the kernel hard offlines its
+hugepages that backs the in-RAM file created by memfd.
+
+
+User API
+========
+
+``int memfd_create(const char *name, unsigned int flags)``
+
+``MFD_MF_KEEP_UE_MAPPED``
+
+	When ``MFD_MF_KEEP_UE_MAPPED`` bit is set in ``flags``, MF recovery
+	in the kernel does not hard offline memory due to UE until the
+	returned ``memfd`` is released. IOW, the HWPoison-ed memory remains
+	accessible via the returned ``memfd`` or the memory mapping created
+	with the returned ``memfd``. Note the affected memory will be
+	immediately isolated and prevented from future use once the memfd
+	is closed. By default ``MFD_MF_KEEP_UE_MAPPED`` is not set, and
+	kernel hard offlines memory having UEs.
+
+Notes about the behavior and limitations
+
+- Even if the page affected by UE is kept, a portion of the (huge)page is
+  already lost due to hardware corruption, and the size of the portion
+  is the smallest page size that kernel uses to manage memory on the
+  architecture, i.e. PAGE_SIZE. Accessing a virtual address within any of
+  these parts results in a SIGBUS (BUS_MCEERR_AR or BUS_MCEERR_AO) with
+  si_addr_lsb = PAGE_SHIFT. Accessing virtual address outside these
+  parts is good until it is corrupted by new UEs.
+
+- ``MFD_MF_KEEP_UE_MAPPED`` currently only works for HugeTLB, so
+  ``MFD_HUGETLB`` must also be set when setting ``MFD_MF_KEEP_UE_MAPPED``.
+  Otherwise ``memfd_create`` returns EINVAL.
+
+- For ``MAP_PRIVATE`` mappings, even with ``MFD_MF_KEEP_UE_MAPPED``,
+  the first write anywhere in a hugepage that has memory error fails
+  for the whole hugepage, because the copy-on-write must copy the
+  entire hugepage and inevitably consumes the UEs. The result is
+  likely a SIGBUS BUS_MCEERR_AR with si_addr_lsb = 30 for 1G hugepage,
+  as modern x86 hardware usually supports CONFIG_ARCH_HAS_COPY_MC to
+  recover various in-kernel memcpy routines from memory error.
+
+- ``MFD_MF_KEEP_UE_MAPPED`` works with ``MFD_ALLOW_SEALING``, and file
+  seals work as usual. Seals, including ``F_SEAL_WRITE``, can still be
+  added after hugepage having UEs, since memory failure recovery doesn't
+  hold extra references on the kept hugepages.
+
+- Truncate, hole punch, and close operations from userspace all dissolve
+  the hugepage. If dissolving fails, the HWPoison-ed HugeTLB page stays
+  out of use. Note that ``F_SEAL_SHRINK``, ``F_SEAL_WRITE`` and
+  ``F_SEAL_FUTURE_WRITE`` prevent truncating or punching holes in the
+  memfd, so a HWPoison-ed hugepage in a sealed memfd is only dissolved
+  when the memfd is finally released.
-- 
2.56.0.611.g1030f0b940-goog

