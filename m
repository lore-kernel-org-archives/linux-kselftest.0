Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645514;
	b=GvxFgEDSyvJ2dW/fATZXzaUOmDdKT9BTK33YQBv6Sb/q9dNMWVfEkxqrGbCfcvQNgyyX
	 hKPMgJoK7PLJSR5IUUvsfCAVlBt3UDnB9esErz7b/k+kW2yQ8WmCuIAM40vfQdpaCWxPW
	 CVZtyjGC/0LSb0RUf3zMu+efi3piTm5LWeXjU1gULbvCyuDK8FNVdJRKSc1ZxzEGIx4h9
	 vsunLFUB4SEK1XnquFcI4Cd0uika2YbcgU6JTL4KRAp1d9+Rxe5IcGNaGubnZcnbOc7x5
	 6Q3LMfv4hsD28w1luCSekbcddbLBZ5ljuPddcKZ7zidw/NENVgFpAcCzyTnpwaBVhSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jUhK5m1lvTjtdfmztu+bilD4B6b4ERUK5SOg2m81DN4=;
	b=qtHOiAZskMAW710qA2YRAywtHKN+db71nljbIxrM2tkNMgn6jg9bGar9/uaV7ZiJx6nc
	 YgKj4ULqxhg357+pBGruQ0A+/jjCJ80W6vyJ7K2KucabMoTPCGnWfzR+ralT552C+f8Xs
	 rO2pj4RIb5Jp9CCF0Y6q67EWcj/1qj0dukp4L7da6GitKZHsmSdYRxqruHyutWeIJx8Es
	 LH+yKo0od2DaeI73a3++9kMofI+QOz/5SuHXIa5WdXT+Wv9gSaOWcUzontWoC76Yfp0+0
	 Zw7YSPsBQnoH5D+foeiLIZRRXI/FnLat+rtYkaNHnoPhicPND6Jm33Jf4WDd2jJddzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqAS3Mzh;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A10606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 18:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqAS3Mzh
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0728so791759f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645512; x=1794250312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUhK5m1lvTjtdfmztu+bilD4B6b4ERUK5SOg2m81DN4=;
        b=CqAS3MzhLYzg+B3jKeGN3yX4yq1SxSwhC86d6uYzoHUr89jLXMs9uLMiSJAJ7Ub+iH
         znMrNrNTfQ1Pwb+rIeySiVqrW9e/SRwcwJ2Z2VNdN9P/sa0B86STdO7qVdUx4hY+g4Vt
         vHnLQWSPCkOZL7bayIjJQf5A6NHjvXFEy+PZmZG+jHOWrQ9fHZR7MBQ5FEhNCE5MRBN3
         h7OdM79DoV3FhvRuILYZXbtFL4OGvnNuu5Oai8mlNnrrzMhHdKYJXZ2RqfI8Z18VArMl
         3ycXtja8msh7ppZopdmNbyszb9hc5nzmKaF9B9jLuBZ/CYIXZliiTUZwP6lf0EjyIA5g
         ZAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645512; x=1794250312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUhK5m1lvTjtdfmztu+bilD4B6b4ERUK5SOg2m81DN4=;
        b=NfeN4m7YTfv5+ooM6M8Z4ZtYIpRBPwENgUGorx9jTrqC2uaEy0WcmRjD2W7pXRS4ja
         2YzTUFLzdEGbTDI8QHMjTWz75AwsCDcVtFc1OB7Qnc67QFTcoJ1X/JlDn/E+gFD8KsuC
         t0j3nYdOJi4Mc4ywQ581XYNptiGa6N4Wk9owVQkYKnlwwjJ/xcnKm1mEss7GBIYRT1ZN
         XSps0MkLakwx+gRzv0FnH1TZ910fofiTOfzagEQZlUPXHhb3jJPSx4GP6xlbAQ4Obfeu
         HWjDCnPWP6M8l1mTmRAeBelUY0onJyaw1K0wEH/ucwwgLxnRY+3jRsTMeN8Gw5iNAxc3
         DKWw==
X-Forwarded-Encrypted: i=1; AKwUvBxFaTd9PhEVDUug4awxnWWlAJgmP+UfopwvBtF5aXJ2mZd9xJpVe3WgxC3dPJjBxCowRt0A41atu5ylDCkDeJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vm8H8rMwRnCFuBlzN+AvCxOWtqWX3eMjFUjg8Za89DJiZXxkh
	HjGpTHDCIUjR6NPCU4VSHsvARQSsU014dGYqOn7gbbZh9IZPkjpiFUl2
X-Gm-Gg: AYBFou1ouxnUAA8PitnC3jSCIlL12k1Zi6TVsvhp8mHX27KbI9eHStk8y5djlpPEWB3
	RVuPpn2zWSJT13H0gPi1MhO9doFvMDGwruCBxziQu8m8hp/Z2Nam0nFQiOX0Kadxvy+fAAxdQ9N
	YKmfmUkt2bV17BH8SPQ6wjhXwy5C67cZB9N8xpnP7hUBtcRJ+Ty1ts0oz23aS9X2unUhggqTY0p
	QYt83DkoiRwcE8s8zJLmtzlaFHU1lyYrzcDxbs3ff3at6IOCEY6NfbvE6WX9s+qzW+9u71a9CwD
	c/RQN0nvoiRG9bPwyPzzvk0w9C3HdtN8G9cbKlUePqgX0jNyRhz1mTJkXN9XQLJiB5ZIZhtYoaJ
	7tir8SxPqgiykVkFVOSGROKKwa/58RflKGIYipizhoxePHWJYCR0B9jAdNZ9h0YQK0rKt0EPccD
	TymKhD1I/3PPad17WU6CIbv1HFwJNXMfw4dN5Oy6zoO5Jrfe+UkFl+sRj/HZhByKam+t5yqKiYj
	JZU8vmx27BNLJXUAY+J/HM5y73g/vrXjGF2uLdU4zbhQru8IKlLtl4tXxOwAtL9UF5rNcERugJ4
	/NPah7mwuVSNjMLxSy55GCM=
X-Received: by 2002:a05:6000:4559:b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48e6e2bc780mr16125799f8f.8.1793645512031;
        Mon, 02 Nov 2026 10:51:52 -0800 (PST)
Received: from fedora ([2a02:4540:28:4cc2:7f6a:92cc:ff40:8b84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm21260812f8f.10.2026.11.02.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:51:51 -0800 (PST)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yeoreum.yun@arm.com,
	ziy@nvidia.com,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH v2] selftests/mm: handle child status safely in khugepaged
Date: Mon,  2 Nov 2026 22:21:30 +0330
Message-ID: <20261102185130.30504-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <auhvkuDO8cP9Pip4@thinkstation>
References: <auhvkuDO8cP9Pip4@thinkstation>
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

collapse_fork(), collapse_fork_compound() and
collapse_max_ptes_shared() take the child result from
WEXITSTATUS() without checking WIFEXITED(). For a child
killed by a signal WEXITSTATUS() is 0, which is KSFT_PASS:
the parent runs its own checks and the test reports ok even
though the child crashed.

Fail the test when the child did not exit normally, and print
the signal that killed it. Also fail when fork() fails,
instead of reading an uninitialised status.

Use get_child_status() in all four fork tests, and use
wait_for_child() to handle fork() and waitpid() in the
three blocking-wait tests.

Fixes: bd212a7dbdb1 ("kselftest: mm: return fail when child test result is fail in khugepaged")
Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 61 +++++++++++++++++++------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1bc7acc66a46..b90daf008239 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1004,9 +1004,44 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
 
-static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
+static int get_child_status(int wstatus)
+{
+	char buf[64];
+
+	if (WIFEXITED(wstatus))
+		return WEXITSTATUS(wstatus);
+
+	if (WIFSIGNALED(wstatus)) {
+		snprintf(buf, sizeof(buf), "Child killed by signal %d",
+			 WTERMSIG(wstatus));
+		fail(buf);
+	} else {
+		fail("Child terminated abnormally");
+	}
+
+	return KSFT_FAIL;
+}
+
+static int wait_for_child(pid_t pid)
 {
 	int wstatus;
+
+	if (pid < 0) {
+		fail("fork() failed");
+		return KSFT_FAIL;
+	}
+
+	if (waitpid(pid, &wstatus, 0) == -1) {
+		fail("waitpid() failed");
+		return KSFT_FAIL;
+	}
+
+	return get_child_status(wstatus);
+}
+
+static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
+{
+	pid_t pid;
 	void *p;
 
 	p = ops->setup_area(1);
@@ -1019,7 +1054,8 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		fail("Fail");
 
 	ksft_print_msg("Share small page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
 			success("OK");
@@ -1035,8 +1071,7 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		_exit(exit_status);
 	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = wait_for_child(pid);
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1053,12 +1088,13 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 
 static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *ops)
 {
-	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = alloc_hpage(ops);
 	ksft_print_msg("Share huge page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
 			success("OK");
@@ -1085,8 +1121,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 		_exit(exit_status);
 	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = wait_for_child(pid);
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1104,12 +1139,13 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops *ops)
 {
 	int max_ptes_shared = thp_read_num("khugepaged/max_ptes_shared");
-	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = alloc_hpage(ops);
 	ksft_print_msg("Share huge page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
 			success("OK");
@@ -1146,8 +1182,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 		_exit(exit_status);
 	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = wait_for_child(pid);
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1248,7 +1283,7 @@ static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *o
 	for (; i < n; i++)
 		ip[i * stride] = i + 0xbeef0000;
 	/* A child that died reading the racing pages is a failure, not a zero */
-	child_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
+	child_status = get_child_status(wstatus);
 
 	ksft_print_msg("Check the parent sees only its own writes...");
 	for (i = 0; i < n; i++)
-- 
2.55.0

