Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122880;
	b=HlLTyPCy2sDwSLLcY0Qr1j4QkC/hqjWem2OsUNLU1NhpU5Q85Kt+MotX8P/zKMARhgEs
	 ktaOz82krF8npY7J9MhPnDtvz0Dapy85TL8P0bnW2d6YMTbDjrVtwhOgBI/uTz80OxDmm
	 BBxV+noAN4bqcmQ6hoHPNcFHvWlMcQKZyiz8oDKxFiH61LUmK6wwP/sXbt+Q+mc8KVjRA
	 k6+1wPkaQQx2QBLvd3Srwvey3ObQrz+IZZAN/q+MnXmUh9a+UXbwwBUgBuUtIesxuYE0d
	 EgEY1/hoL9NmLre5nHH8PdCth/+9G0etFpPPpObh9H28hDpbw2XhhC172V6lVPpoEBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122880;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=as9n+dNBfp1o44qNiI4p9jEq0z77VwxPRRD44uR3xLY=;
	b=aiR2ZLOt9ZYvcN+qucf+96T4nfOvkRaNIv+br7S/iyHaVNfXeg4DHADA32PB+ZzetDdg
	 FQB64+Rd1t1weCMhcXAR9e+sbWEOPDAf5rKM7QMZvSs2B3Cd3TsMRsJc/uyaS9uXu89sA
	 w9q8PZG1kjKo3aSC1/4cgQrgfADoDOobRe573NJSmNus83Vu+3nuH9g1MVKFqTNaNNvn+
	 KQ0xBcbFaJUvjEcW3Ar3w4QSPkMcTQl7m4xwYiSjo1abri6CNKpjALURo2rNabs1Iv21f
	 SaOgQDLmPqFQSAXK2O6dHZvbT50e7QTOERflEm+YQieENxqnBXghVWZcXjE4SnRgDwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kGnzMWBf;
	arc=none smtp.remote-ip=91.218.175.227
Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976FC606A31C
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 07:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 976FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kGnzMWBf
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4elqSwc3DAM5howwrqEHgu/Vk/FDsIcZJHWFPI3k6NI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794122876; v=1; x=1794727676;
 b=kGnzMWBfJQp2yk7gP3ByV94Oo30xQFkPnUMzpcRgIJvdiUTW9kyykkDH+8oZRtl+Tyn+HjvV
 VeWkGBNVcS9QrhAD29IxJSX59Jok/a4o84XAcwElVSYYeLsp1ZF3NOXosZIkUiArfW0aJGHc1z6
 LZyHphbVB6KgHSawy6iZBj7k=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e7fadc3522c9a21;
	Sun, 08 Nov 2026 07:27:56 +0000
X-Mizu-Trace-ID: 7e7fadc3522c9a21
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	surenb@google.com,
	hao.ge@linux.dev,
	abhishekbapat@google.com,
	brauner@kernel.org,
	aniketgattani@google.com,
	peterz@infradead.org,
	thehajime@gmail.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] selftests: Add missing generated files to .gitignore
Date: Sun,  8 Nov 2026 15:27:35 +0800
Message-ID: <20261108072735.36842-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
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

Add .gitignore entries for test binaries that are generated during
a build but leave git status dirty, and add the missing .gitignore
files for the alloc_tag and nommu directories.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---

These are all trivial one-liner changes, so I have folded them into a
single patch. Please let me know if you would prefer it to be split.

 tools/testing/selftests/alloc_tag/.gitignore  | 2 ++
 tools/testing/selftests/coredump/.gitignore   | 2 ++
 tools/testing/selftests/exec/.gitignore       | 4 ++++
 tools/testing/selftests/membarrier/.gitignore | 1 +
 tools/testing/selftests/nommu/.gitignore      | 3 +++
 5 files changed, 12 insertions(+)
 create mode 100644 tools/testing/selftests/alloc_tag/.gitignore
 create mode 100644 tools/testing/selftests/nommu/.gitignore

diff --git a/tools/testing/selftests/alloc_tag/.gitignore b/tools/testing/selftests/alloc_tag/.gitignore
new file mode 100644
index 000000000000..30fa3b6712c0
--- /dev/null
+++ b/tools/testing/selftests/alloc_tag/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+allocinfo_ioctl_test
diff --git a/tools/testing/selftests/coredump/.gitignore b/tools/testing/selftests/coredump/.gitignore
index e32f6e9006f6..6a9460c4450f 100644
--- a/tools/testing/selftests/coredump/.gitignore
+++ b/tools/testing/selftests/coredump/.gitignore
@@ -4,3 +4,5 @@ coredump_socket_test
 coredump_socket_protocol_test
 coredump_signal_test
 coredump_worker_test
+coredump_notify_signal_helper
+coredump_notify_signal_test
diff --git a/tools/testing/selftests/exec/.gitignore b/tools/testing/selftests/exec/.gitignore
index e42ecd4c908d..d39df26e5cf9 100644
--- a/tools/testing/selftests/exec/.gitignore
+++ b/tools/testing/selftests/exec/.gitignore
@@ -28,5 +28,9 @@ binfmt_transparent_interp
 binfmt_misc_loader
 binfmt_loader_payload
 binfmt_loader_payload_static
+binfmt_bind_interp
+binfmt_misc_delim
+binfmt_misc_disabled
+binfmt_misc_selfpin
 *.bpf.o
 vmlinux.h
diff --git a/tools/testing/selftests/membarrier/.gitignore b/tools/testing/selftests/membarrier/.gitignore
index f2fbba178601..031920478205 100644
--- a/tools/testing/selftests/membarrier/.gitignore
+++ b/tools/testing/selftests/membarrier/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 membarrier_test_multi_thread
 membarrier_test_single_thread
+membarrier_rseq_stress
diff --git a/tools/testing/selftests/nommu/.gitignore b/tools/testing/selftests/nommu/.gitignore
new file mode 100644
index 000000000000..37da7c4765cd
--- /dev/null
+++ b/tools/testing/selftests/nommu/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+nommu_mmap_test
+nommu_mremap_test
-- 
2.56.0

