Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9804334DCE0;
	Mon, 17 Aug 2026 11:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965452; cv=none; b=JlLEiG3pZQ49lcFdtR+9Y8+u4JSb4VfxVCnWZZbBQZpNxDgDo5StR6gP1JmZi5EvF9P6oeJp3Nlohour3Mzq9o+KkZiVL86KlxQgPEa3q25DgaaYFblR83e9l4Sd3pbgD7kGltTQxgCYIFcwKqIUVzLOx6PEkmVCOBBKdpwrUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965452; c=relaxed/simple;
	bh=JiLZMJoq4d69L4IH9eK1VMpFIEt1bTfHBBRtKsvQSJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ipiFuWSMRO09QSBhLp1gQ3dBgjSNPOrsB4J1WS7A9ZFqot1Ki9w1VcKBRlNbhAhOS06PuAEQMtuTlXH8ZB86SWZs/BwTAZdZAvZrbw89uY2A8hcQJJo3NWzSFFSULW/zLeF7bcthiA+YzaC0S88a/qbKBfx0WZFH43JVCqxaNzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BzvJ83lK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BzvJ83lK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 237C5169C;
	Mon, 17 Aug 2026 04:17:26 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.1.39.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87B863F66F;
	Mon, 17 Aug 2026 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786965450; bh=JiLZMJoq4d69L4IH9eK1VMpFIEt1bTfHBBRtKsvQSJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzvJ83lK2HNcMyBC+n2n4Zft0gSn0Amnn1C3Iyf2Qdxq/oeXl0paJwW/hSxc3TVMX
	 oZcWUmPzogg4oVfvDLsIj4SMYEmgO1DHKnxT1eAYijkxdczMYg66FD3mTPVRcszxvF
	 cB8zJcfXiRxDkO96u6UpLNGzqm9ITwg887zD/qtE=
From: Christian Loehle <christian.loehle@arm.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Rama Krishna Katta <ramakrishna.katta@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Gregory Price <gourry.memverge@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	linux-kernel@vger.kernel.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 1/3] selftests/ptrace: Skip get_set_sud if SUD is unsupported
Date: Mon, 17 Aug 2026 12:16:09 +0100
Message-Id: <1f16bf30aebbbf44ffc598359e0d474887162e7e.1786965107.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1786965107.git.christian.loehle@arm.com>
References: <cover.1786965107.git.christian.loehle@arm.com>
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

