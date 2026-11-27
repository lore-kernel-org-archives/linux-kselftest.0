Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805905;
	b=sVQ/P1z0QoMlHkcntxHTdnbX06uOFWXkjVU743IWVbggfJUPBBFXnRIdHpikEuwbXmnw
	 J1XSaDXvnjdYnZ51ksnnzutWfYtbhr7e01zla1bx96yGxfpLok5TyPaRBavdq18eXEbxV
	 dEuE4fqZFsFysrfr5FV1zKTiCz/x99pz5h2Dg+Xv9I3X+Q9bt/caOlpVzYyraaKPRK1+Z
	 9IyzPvOS+1zC3jO2ypRmII6/BLWwzr9Nn2K9SftoSQju6HgBy8HIDasCrTna07KVlGoi5
	 d0XuHR1xQ9vTX2ptFSSiDSV9vsK7G8R0yoxOpGp0+2hE0IHiKl8+d01uQrUXPv8Hazg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805905;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fqjA7d9oxPlvdGR3cNqFBxqIEuFEPoAWBVhZCbSck08=;
	b=07E0GOdCSZF6BBPCU3HhX7uGo+0Jy7ccO9xh2qoel+uJhwl+5GliXsrNZOak8x3dPWMs
	 j5EChsnOukuADZzy0m8+4ouIdjLoEv4jL/YR39u/gaPArpFrbRVNznXZJkPOosmMb0cjt
	 MB3hbcXM7d7eH8AHM6XIkmaicurX/P7IYdh/ctLVo69t/yloyzaM4U8096dmu/2C36fw2
	 Sd1tGJJUVfdfvP/ivMCKvQlY7f7LmMOY920ByIVYWCN0d980nmMyhvj32WTO6DGUANYM6
	 4M8TU3jXhfHljg/UfKj6U/MEdwoEWU89tPOofDtDCWo/CKx7NfbWQWpkBnLZDkxR/XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=wBtCXrch;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC707606A323;
	Fri, 27 Nov 2026 18:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC707606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=wBtCXrch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795805904;
	bh=fqjA7d9oxPlvdGR3cNqFBxqIEuFEPoAWBVhZCbSck08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wBtCXrchLjjIdLBDVDc9SOmQI8i+IAMjYu8bW214pzFCg9Nv/2Z7VUShgnHm/5mPS
	 uHeHmbPtuzg4Gxpa9w0dUkb1u8G1wxow0u4qw5KZwgZ0OpQfLpMv8+2svYQvykADmV
	 ok+77GValhmeOmzHmNzxjSv5pkMpeZxiqbj/I+flqf2AYhe8dhOfzHTWmx8dgqNo9z
	 0OZcf30RX0/cOlCE+5QbbsQbSoVV3eYzKSzehPKAQC6miy7KpUTibFxjbb3jSgRrnw
	 CAGua2aglq3iGVbwjFJyZDRmd8Pxzv/S+z3UB067CHGESYfjGZFi71bKwmgb/r8pPs
	 MN0uPmvTZnYOQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbjNw02z6zXCw;
	Fri, 27 Nov 2026 13:58:24 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>,
	Aniket Gattani <aniketgattani@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v2 03/16] selftests/membarrier: Rebuild the tests when their header changes
Date: Fri, 27 Nov 2026 13:58:08 -0500
Message-ID: <20261127185822.158216-4-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
References: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
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

membarrier_test_impl.h holds the test code of
membarrier_test_single_thread and membarrier_test_multi_thread. The
Makefile does not list it as a prerequisite. A change to the header
does not rebuild the two tests, and a stale binary is run.

Add the header to LOCAL_HDRS. lib.mk makes each test depend on these
headers and keeps them out of the compiler command line.

Also add membarrier_rseq_stress to .gitignore.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/membarrier/.gitignore | 1 +
 tools/testing/selftests/membarrier/Makefile   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tools/testing/selftests/membarrier/.gitignore b/tools/testing/selftests/membarrier/.gitignore
index f2fbba178601..031920478205 100644
--- a/tools/testing/selftests/membarrier/.gitignore
+++ b/tools/testing/selftests/membarrier/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 membarrier_test_multi_thread
 membarrier_test_single_thread
+membarrier_rseq_stress
diff --git a/tools/testing/selftests/membarrier/Makefile b/tools/testing/selftests/membarrier/Makefile
index 829f95c83515..20bb66380090 100644
--- a/tools/testing/selftests/membarrier/Makefile
+++ b/tools/testing/selftests/membarrier/Makefile
@@ -6,4 +6,6 @@ TEST_GEN_PROGS := membarrier_test_single_thread \
 		membarrier_test_multi_thread \
 		membarrier_rseq_stress
 
+LOCAL_HDRS += membarrier_test_impl.h
+
 include ../lib.mk
-- 
2.47.3

