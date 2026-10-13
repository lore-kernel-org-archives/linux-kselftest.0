Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA6F3D3008;
	Tue, 13 Oct 2026 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882522; cv=none; b=pjBiRmLTSnjqv6c3xRvD+fAX3FizkESIbe9R7Zsdr6npunE8hhLhmZfLimwZW561u0aeBuiw1L4DguTuR9CIW6uDUF4H5MOkKL7Ak68eSHa3RidSbAhpvjHcgb3wTiSvw7UK4HXlsTjvmFdA1BZIS0oIxR/AywXIDt2Fa4paWwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882522; c=relaxed/simple;
	bh=eMOXsSdVdxT4T6tkh53/qZ42Qcq8NLzJUleT0BKOC2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGY+FM5Twl0SUIebXfRAnhHNUzDx0B32yHTu3OiUjjXuabkxUasLJ7OphRP+3Jui7fZ90bufDItydrMrqsGgw8m5vxEsQGbDRwQsBwZ3MAE+N/gcWVNn+yI9z3P5wH0BVIu4/MDp9AU9xOjfvN7B6hYhP86HwwW16jQiIjIBQZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bFG4Z2Yv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bFG4Z2Yv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 615D8169E;
	Tue, 13 Oct 2026 02:08:37 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 288F93F7B4;
	Tue, 13 Oct 2026 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791882520; bh=eMOXsSdVdxT4T6tkh53/qZ42Qcq8NLzJUleT0BKOC2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFG4Z2Yv4vf+1nmkYMtc1QA04rPn+qS1+6/wicjt7N+QoUFxWFielzDdWPRTHVizg
	 f7xFCvmzENeNqPliukuWy5XkrmAlRoC23q8Q1Wjn+rMmWwoOdK5iELE74WkCWxBYpd
	 3/Z7TNJTAvdfMXdsNSBBtJC4oy6t4cVpDq2kud1w=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Christian Loehle <christian.loehle@arm.com>,
	Rama Krishna Katta <ramakrishna.katta@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH RESEND 1/3] selftests/ptrace: Skip get_set_sud if SUD is unsupported
Date: Tue, 13 Oct 2026 10:08:19 +0100
Message-Id: <6bb0418578cdee62b500c3011ab620e8b90f8455.1791881928.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791881928.git.christian.loehle@arm.com>
References: <cover.1791881928.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall User Dispatch is unavailable on architectures without generic
syscall entry. Such architectures return -EINVAL for otherwise valid SUD
ptrace requests.

The test currently treats this as a failure even though the feature is
not supported. Probe SUD with a valid disabled configuration before
creating the tracee and skip the test when the kernel returns EINVAL.
Other errors remain test failures, and kernels that support SUD continue
to exercise the ptrace GET/SET requests.

Fixes: 8c8fa605f7b8 ("selftest, ptrace: Add selftest for syscall user dispatch config api")
Reported-by: Rama Krishna Katta <ramakrishna.katta@arm.com>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 tools/testing/selftests/ptrace/get_set_sud.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/ptrace/get_set_sud.c b/tools/testing/selftests/ptrace/get_set_sud.c
index 2e619c7599bb..395674f85964 100644
--- a/tools/testing/selftests/ptrace/get_set_sud.c
+++ b/tools/testing/selftests/ptrace/get_set_sud.c
@@ -22,6 +22,14 @@ TEST(get_set_sud)
 	int ret = 0;
 	int status;
 
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_OFF,
+		    0UL, 0UL, 0UL);
+	if (ret == -1 && errno == EINVAL)
+		SKIP(return, "Syscall User Dispatch is not supported");
+	ASSERT_EQ(0, ret) {
+		TH_LOG("PR_SET_SYSCALL_USER_DISPATCH: %m");
+	}
+
 	child = fork();
 	ASSERT_GE(child, 0);
 	if (child == 0) {
-- 
2.34.1

