Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C50E23BF9F
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 00:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063455; cv=none; b=AbYWUPH1O+1VdeBXA1KhuJ9666iegggL/3BN7qrtZunuzKYMfrNgEalCTc+WjGlseWSNMI1nco87Vwd/saKVSiyN4uWcQxw6Cla9j9czrrMGaB7shz6N54uHx26skTleCj3WRgNseQjL9en5/r685uQocpuM+QaVWLXPqHRyAGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063455; c=relaxed/simple;
	bh=/Cli3Qg9lIea/JErzSXsDrgN00uFn3Tt+AsnDL8c0b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sooU2K+PtyhXbIdr+xxfqZFFuIEjLu36+eaz1jQYtyC2pycJ1YkK7AJJqEu3TumpU5umJPPPgQQAMK59tGGXw7WlLxZu7HkmxB978VglJIaExwbjpH+QoNU/mQb/hh02NyAi1+kqUUvyHsnBQyi1AEzzrLlUjSBkxczRlcw2B2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqLJpgpD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqLJpgpD"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84874b52eabso3848271b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 17:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063452; x=1786668252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byf5De8f/rkIIW6xYCfuIrbPDKZkiq6mBD0098KD+S0=;
        b=JqLJpgpDSn2vBntBooNLhBp8g/FvPi0RDu6RvnLrBIwguGl6yR8+MJUveuWHjFA3jK
         wGoh0P/BHRPIR5C1RwhPab+wxRUoP8GVH5t3tNzE3Aqi77XVC/CiUUp1FESU3ubIvrzD
         qrp+fBc4NN3uZDqKZ7CeSqDIrFekTZLuLkc4xP/ZNoi5eKRCYu/DjcUHVgEHQ69y4sYv
         zJGqZuxcXBFiBAYX8a1Lzu7Mo8ANd24q6NgIKqC+0tF/hm37djm3WSJj0hzUL1lqIgzA
         5BUewhCovJM/Z6V1ajZHaLH20BBFV6YyCc8aa7oy9rWNEwofDJgLwe70okW/K5uOQxZ6
         d2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063452; x=1786668252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=byf5De8f/rkIIW6xYCfuIrbPDKZkiq6mBD0098KD+S0=;
        b=o/HRvlnc/IemXwFaRfRqi66hHgF7lj4ufBYgDT+MPGHHFzEdg2RzQcIsOH+m4Iy1Ct
         sTjtNOujTPNOtXBeOe+0EmzDprLtrtF8au8kGHGI24saloS2v0t+aj6RcLZxRjiRKyJE
         4n+RzppRZwvGpOKl+7oHqA14tZ1vj1IFabuNbKsM2aXwWPsDplIEuKsz+XMddiaIl1UR
         J0vxV2OLG6lUzxlhU4/CxTYWhvTcuaj7fDOx7cnoP/4OFhTDjM+NWja1ZOzNEDpxNYvr
         nBgiwoMT+zMktbK7nNrKmHGYVQkXXGPk3xjxXa7/TYYNYLQ4ivSbeJn7j11V2lyurKX/
         Kchg==
X-Forwarded-Encrypted: i=1; AHgh+RpkkqUF8GHsPk/kxCvKB4Ph/+XOwkKnKhJaVSeDmct5n/TOi6R4KYRSnyJT16v5lsEtjyTJjDSeaieZ/GpiT3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF322jkxxoE3IcOUNjjuCTfxeLF2HZw11QWwCBqwdf6tVp12uf
	d8BwqzIdWcjBD2QIsJZOtd9Wq5C66IFFOAIXNhgKbYFCJ863Zn+kDCJEvolGzg==
X-Gm-Gg: AR+sD13h9YRXK9HXjPOCS8slRVEpiyNEd2Oj7MTPD6VtPYZHl/KOiCCM/v4gm0n6LB5
	lN9DjhvRtIOiYCz5+k4B9zRrMCLQJFlaoeeHnk/rbSAEwg/bfr0JTq/Wu0D/tIiSNYf7zV9sP1e
	5r/HTmRJzFzLXtU/hRz6rXnFsHJ+zA0KQ1sxNh9BC3Qn6FsSZCqb6s9cpe+Kt5A1apoOACaarpP
	IZkMe+hZeqGlfRbVVI7K5LODIcJheepKnKunqlTNQjQt/wQow8gdYdViZcdmUleCpSt24dJbPFO
	CYlAoX6ZBrrSC9jcZ/UEaN6mdhKWyxvUroHsMfagf7EYUTySSJR6DI7wCiNqhRxCuh9mdyOxA/h
	ontwLiAWTKdjE2y3q7kgER0rEhYR638ho4s14GE4MJjUnvszgi9SR+tVhQW70RmEdXHoaIdjL6x
	yThlhPCGzekcpZZ4QFcYKqPsw+6T/6HI3XIMM7j1gKsTR08xaWvn0myhLegqSSUnvlpgpwaB6rY
	NwHkjLSCbOfaETW
X-Received: by 2002:a05:6a00:3a12:b0:848:354f:4f8f with SMTP id d2e1a72fcca58-84f2dff3015mr21231822b3a.22.1786063451696;
        Thu, 06 Aug 2026 17:44:11 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm172922b3a.42.2026.08.06.17.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:44:11 -0700 (PDT)
From: Ning Ding <dingning04@gmail.com>
To: bpf@vger.kernel.org
Cc: memxor@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Ning Ding <dingning04@gmail.com>
Subject: [PATCH bpf-next 2/2] selftests/bpf: Test RCU iterator state pruning
Date: Thu,  6 Aug 2026 17:43:20 -0700
Message-ID: <20260807004320.134069-3-dingning04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807004320.134069-1-dingning04@gmail.com>
References: <20260807004320.134069-1-dingning04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a path where RCU protection reaches zero and then starts again.
The iterator is untrusted after this gap and must be rejected.

Signed-off-by: Ning Ding <dingning04@gmail.com>
---
 .../selftests/bpf/progs/iters_task_failure.c  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/iters_task_failure.c b/tools/testing/selftests/bpf/progs/iters_task_failure.c
index fe3663dedbe14..bac394ae77f44 100644
--- a/tools/testing/selftests/bpf/progs/iters_task_failure.c
+++ b/tools/testing/selftests/bpf/progs/iters_task_failure.c
@@ -61,6 +61,33 @@ int BPF_PROG(iter_tasks_lock_and_unlock)
 	return 0;
 }
 
+SEC("?fentry.s/" SYS_PREFIX "sys_getpgid")
+__failure __msg("expected an RCU CS when using bpf_iter_task_next")
+__flag(BPF_F_TEST_STATE_FREQ)
+int BPF_PROG(iter_tasks_rcu_state_pruning)
+{
+	struct bpf_iter_task it;
+
+	bpf_rcu_read_lock();
+	bpf_iter_task_new(&it, NULL, BPF_TASK_ITER_ALL_PROCS);
+
+	if (likely(bpf_get_prandom_u32())) {
+		/* Keep the outer RCU lock active. */
+		bpf_rcu_read_lock();
+		bpf_rcu_read_unlock();
+	} else {
+		/* Create an unprotected gap. */
+		bpf_rcu_read_unlock();
+		bpf_rcu_read_lock();
+	}
+
+	bpf_iter_task_next(&it);
+	bpf_iter_task_destroy(&it);
+	bpf_rcu_read_unlock();
+
+	return 0;
+}
+
 SEC("?fentry.s/" SYS_PREFIX "sys_getpgid")
 __failure __msg("expected an RCU CS when using bpf_iter_css_next")
 int BPF_PROG(iter_css_lock_and_unlock)
-- 
2.43.0

