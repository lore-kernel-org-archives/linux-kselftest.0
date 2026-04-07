Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6065126FA5B
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572561; cv=none; b=JQxCkaDA2Wgr73bP1gbO2lQdiDoZtXWYmtRgMzWDlG2A3P+J90xm+in4LIpfCfg7Km/fYM160ILlsP3a+HeYudYxbIBeuKJfdgxWcEk9xvYLplhptx+vqbLtk1mVd7NekPjKheyiac9x6F8JBlvWJLIz/uXb6FczF8fCa3iGZXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572561; c=relaxed/simple;
	bh=ruJfw0yxki9i49bwWKgVXg9RYwXel0TmFTpZwK8U93A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLu8FB8xRQSSuVLUqw4YLWLUUk8s+1sdiclt5Tb7EtmnpoQyqjFUoZyWDAmM3z5zMmTca+OURrkaMG+S1vMeXEwVzmWQC59tTBE0Jlc1/LcSELc/rilNGXxqShGbohMLDFKDas2AmzBeTxB8JWgazBM09wM4GC3TCS7GA8Lg78A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S8dkUqVx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S8dkUqVx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso33227095e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775572558; x=1776177358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwQXi5Tu0OP3YXIfJ0yEywBxARJgRMYgFrQgcpLPUL0=;
        b=S8dkUqVxysSSKE5iR8LdKcCzLZMdX3Vs42CqLgSJOubLtWtL1KfAFGZPsnLUJvbkh+
         D19yaW39ts/TLCdclmNqCZucEh3OsMwQceoHfDiWuHPCsxGm6a+pYKXwQIBjlzBVaJs3
         GAGrLyOnvCe+PFsITAbQpG3hqZMjZanhYiCKmgptw1teNP450zSrqGqE8exqG0cC0qdw
         48X5TjlK8lGtpFBY+5T1Vq6TxlftnErDbUDPjYEnZZgx2Gg+lx1qtC5ey/VApvrhICZZ
         s6+3Y7qheyVtD16W4/nqlYErGQq3DY3xjp42QfuoqYtq1WZ2B7laKwgw6HCI3kddM2h5
         x0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572558; x=1776177358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LwQXi5Tu0OP3YXIfJ0yEywBxARJgRMYgFrQgcpLPUL0=;
        b=BZqgmPLULPH9eUd1yTsAI96TJNZpDLRb5Yipm8m8fvYrMy8N8f5XHo1MfuimqtQD14
         w9ZumCkLQvlJxKcg4kzUIiQtbtYLjunYEbudwmFuHQaWquH66TLCl8Z6k4syeWV3ISEf
         3RPjeecbd/MTjFO7172vhJhchFOKiT8SYTkXlbaNFOveXEqrc16xa4zR8onCuTmLKVk/
         +Jc+FcSbLWYHC/LUJvzJQB0x8M85yXM85iazLO7OIkztSmFngb7Zx9+WGk7ob48bpNl+
         P8MJTM0RFsdWyEdadJ6aRegThICnZzJOt48Vsm3P+gJkMW05oKKyY81ECq9zCz8ICNFz
         kRLA==
X-Gm-Message-State: AOJu0YwVRZgL2l2Gg35OZy3PABXNhLVGofP/sx8WRAq3t8jAba4t5CUp
	7tehXmTmVwN/Kyo2qxMQFEnj2IKtxVsuJJuv4KTIPgqaRthqmaG6C2p0MGZc/jjRWtg=
X-Gm-Gg: AeBDievevXRC1SpFjiiX0HLKdacl+YSvkfgQzlrj27ELN+ED+kdSHgyAdO6vSLGyxon
	L4fMCW7mQlhRqQ8oHbb7QWqT/ntIR0YY9ejqwCZe7BX5O2u6ZwC+YoQ4gIWa0unJZ9kek6iOeBx
	GOYaVt0RJGlxp2h4QvCE2TJDx8UNxAxb9DI8EABkFdjPhPIED/jYL4PYMH/8LXzJHP+UsM/Om7F
	cvAcgig7hUN6gjKAiSrXLG9q5aXsInUEv7rIn4H7K3WrKmWJenXbPv8ZhE77AsmlEu2mCjpc12c
	5UzPoDKRJlE3M/IqBIkmjL+gJSS+WBzmsc26FDFJH7XSOT+qg0UZ/7nl3cBh2XHfF8nnJt61nk9
	1QgVirqgY13ZWEqpx9ZXL5XewzwwdvLzK9ii6oaV3FUK4PFGNKKQRHZ2Ecg7VHiKenvVlKghebu
	20fkcVIhOZbqAg
X-Received: by 2002:a05:600c:a404:b0:488:b749:8478 with SMTP id 5b1f17b1804b1-488b74988e4mr67381975e9.6.1775572557735;
        Tue, 07 Apr 2026 07:35:57 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df5ed3sm16357686eec.6.2026.04.07.07.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:35:56 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 07 Apr 2026 11:35:46 -0300
Subject: [PATCH 2/3] selftests/namespaces: Fix waitpid race in
 listns_efault_test cleanup
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-selftests-namespaces_fixes-v1-2-59109909d88b@suse.com>
References: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
In-Reply-To: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
To: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775572546; l=3317;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ruJfw0yxki9i49bwWKgVXg9RYwXel0TmFTpZwK8U93A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QF0cRacwgjbTV7M69qSX6/IpJxZn3/A2k77vLqxIKuj/B9Azjr5TbQSFO0/nkgeniJ+RUWGmaEy
 r+dMejsrdawo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The efault tests spawn two categories of child processes: namespace
children (each in its own mount namespace, for concurrent destruction) and
an iterator child that calls listns() in a tight loop.  The cleanup loop
used waitpid(-1), which reaps any child in any order. If the iterator child
exits early (e.g. because listns() returned ENOSYS) before all namespace
children have been reaped, waitpid(-1) may consume it instead.  The
subsequent targeted waitpid(iter_pid) would then block indefinitely.

Track the PIDs of the namespace children explicitly and use targeted
waitpid() calls in the cleanup loop so the iterator child cannot be
inadvertently reaped during namespace cleanup.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/namespaces/listns_efault_test.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/namespaces/listns_efault_test.c b/tools/testing/selftests/namespaces/listns_efault_test.c
index c7ed4023d7a8..ac3b208264f5 100644
--- a/tools/testing/selftests/namespaces/listns_efault_test.c
+++ b/tools/testing/selftests/namespaces/listns_efault_test.c
@@ -39,7 +39,7 @@ TEST(listns_partial_fault_with_ns_cleanup)
 	__u64 *ns_ids;
 	ssize_t ret;
 	long page_size;
-	pid_t pid, iter_pid;
+	pid_t pid, iter_pid, ns_pids[5];
 	int pidfds[5];
 	int sv[5][2];
 	int iter_pidfd;
@@ -115,6 +115,7 @@ TEST(listns_partial_fault_with_ns_cleanup)
 
 		pid = create_child(&pidfds[i], CLONE_NEWNS);
 		ASSERT_NE(pid, -1);
+		ns_pids[i] = pid;
 
 		if (pid == 0) {
 			close(sv[i][0]); /* Close parent end */
@@ -165,7 +166,7 @@ TEST(listns_partial_fault_with_ns_cleanup)
 
 	/* Wait for all mount namespace children to exit and cleanup */
 	for (i = 0; i < 5; i++) {
-		waitpid(-1, NULL, 0);
+		waitpid(ns_pids[i], NULL, 0);
 		close(sv[i][0]);
 		close(pidfds[i]);
 	}
@@ -251,7 +252,7 @@ TEST(listns_late_fault_with_ns_cleanup)
 	__u64 *ns_ids;
 	ssize_t ret;
 	long page_size;
-	pid_t pid, iter_pid;
+	pid_t pid, iter_pid, ns_pids[10];
 	int pidfds[10];
 	int sv[10][2];
 	int iter_pidfd;
@@ -321,6 +322,7 @@ TEST(listns_late_fault_with_ns_cleanup)
 
 		pid = create_child(&pidfds[i], CLONE_NEWNS);
 		ASSERT_NE(pid, -1);
+		ns_pids[i] = pid;
 
 		if (pid == 0) {
 			close(sv[i][0]); /* Close parent end */
@@ -374,7 +376,7 @@ TEST(listns_late_fault_with_ns_cleanup)
 
 	/* Wait for all children and cleanup */
 	for (i = 0; i < 10; i++) {
-		waitpid(-1, NULL, 0);
+		waitpid(ns_pids[i], NULL, 0);
 		close(sv[i][0]);
 		close(pidfds[i]);
 	}
@@ -403,7 +405,7 @@ TEST(listns_mnt_ns_cleanup_on_fault)
 	__u64 *ns_ids;
 	ssize_t ret;
 	long page_size;
-	pid_t pid, iter_pid;
+	pid_t pid, iter_pid, ns_pids[8];
 	int pidfds[8];
 	int sv[8][2];
 	int iter_pidfd;
@@ -463,6 +465,7 @@ TEST(listns_mnt_ns_cleanup_on_fault)
 
 		pid = create_child(&pidfds[i], CLONE_NEWNS);
 		ASSERT_NE(pid, -1);
+		ns_pids[i] = pid;
 
 		if (pid == 0) {
 			close(sv[i][0]); /* Close parent end */
@@ -509,7 +512,7 @@ TEST(listns_mnt_ns_cleanup_on_fault)
 
 	/* Wait for children and cleanup */
 	for (i = 0; i < 8; i++) {
-		waitpid(-1, NULL, 0);
+		waitpid(ns_pids[i], NULL, 0);
 		close(sv[i][0]);
 		close(pidfds[i]);
 	}

-- 
2.53.0

