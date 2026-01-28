Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271AC3314D7;
	Wed, 28 Jan 2026 03:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570407; cv=none; b=N5TnciIO6LU5erS9srvLN6unleoX2MwlSAcrH6sFRprA1ZszsJLFCbRXPdu2YzqGsY6CHGi9N8eZDcvy4WLnY03qQ7ZTC6wAKtTQxOfrMVWqTDgBtl2LSZlkC0DHdPUzfcspfTn3YKgyBrVOzznFQlDOYE7x29tIN6qnAqAoFgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570407; c=relaxed/simple;
	bh=pasMR4Ygz9qFZaIQ1r+gvgo/O4vK/SWhOSegJiBFM+s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PKspOB/UHYGT8IoOrsqht7Myfe7jCEmw1pXnv08HQfvwgKBY9Agos7BRy2KAptuFC9BlvglgevjBtKpjHtWWLrvxINrJnEC0jB+cy1yeFSO9yoOPidUiUmJ6aCqgoBVlckYx2HQ5SWySLhsRl0BzUXiCuwFjGnKyLoPiJdNTiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=pzn12l3+; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="pzn12l3+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OD26JToyDDl5Sgwi12v/k4z4U3Ry0aaK+EFkcVoSzl0=;
	b=pzn12l3+8i2u0VdW8ObsjpHBUYiRi5QgiY9/e9Ff2NU9gMiDOJb6ykZehU1P2/eldejwciE1Q
	4ilwISyzTFydBUQAtNmC1IpmPAkEpUypzMGzoAp5lBtKuPSrq/kNRlK1uAA2mrgvhVgZ0SfvnwL
	nEkQP9EhdJ/amGMMMnpDTGI=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f16r45tFSzLlvt;
	Wed, 28 Jan 2026 11:16:36 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 02D0A40565;
	Wed, 28 Jan 2026 11:20:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:20:02 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 14/14] selftests: sud_test: Support aarch64
Date: Wed, 28 Jan 2026 11:19:34 +0800
Message-ID: <20260128031934.3906955-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031934.3906955-1-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

From: kemal <kmal@cock.li>

Support aarch64 to test "Syscall User Dispatch" with sud_test
selftest testcase.

Signed-off-by: kemal <kmal@cock.li>
---
 tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c | 2 +-
 tools/testing/selftests/syscall_user_dispatch/sud_test.c      | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
index 073a03702ff5..6059abe75cb3 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
@@ -41,7 +41,7 @@
  * out of the box, but don't enable them until they support syscall user
  * dispatch.
  */
-#if defined(__x86_64__) || defined(__i386__)
+#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
 #define TEST_BLOCKED_RETURN
 #endif
 
diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_test.c b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
index b855c6000287..3ffea2f4a66d 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_test.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
@@ -192,6 +192,10 @@ static void handle_sigsys(int sig, siginfo_t *info, void *ucontext)
 	((ucontext_t *)ucontext)->uc_mcontext.__gregs[REG_A0] =
 			((ucontext_t *)ucontext)->uc_mcontext.__gregs[REG_A7];
 #endif
+#ifdef __aarch64__
+	((ucontext_t *)ucontext)->uc_mcontext.regs[0] = (unsigned int)
+			((ucontext_t *)ucontext)->uc_mcontext.regs[8];
+#endif
 }
 
 int setup_sigsys_handler(void)
-- 
2.34.1

