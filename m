Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D56382379
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 06:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787254; cv=none; b=Tl+RcNy4cOFjwnS9b4PYRmS3eVW5+0N6Y9pbaJZ1YHt70c39pwX6nt5TWoYCciyZQiL1S/7ZLc+WWHN/dROSST7FH9aiTjfMGE4CG9ZaJekaJ3Rwx+tYjrhQJjpu5Me04sP2+buxsJtKep0sBnAaELHM4e4AbWz3xnCsSCb/t5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787254; c=relaxed/simple;
	bh=gzmNlmMApSypPBhZvx9nxVBx3Yh17K5S4fe4DDgxgKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDCE7r78ctvtYLyTM/jeJ89Y2SzB98ue0Q2BQhNo5gyni3jqzu5Ytpzb11aaJDtJwr3o1eflj6YQllihaLXyVuwQNp25GhvfYTtHU7DGb3qDcTuekl8T4NCWI2V2nlQnPRl485T217I8vppoGiSdR9a/BygzA7stEXOA8i33NaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IYD4nb77; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IYD4nb77"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784787238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=elw6nFLy/P6WL5mNuJ1195kInp61UN0arSV7Sn5n+e0=;
	b=IYD4nb77QKHlfm+gk8ZEa9dq1uZ+fFPOpqN9grB3vsE5T3zjKcxG+bQU1qbPmkUs8gPwO1
	Fw9FOTH4AEZbCIqkU8JzaMlHoJ1Rng+Q/mOcUyMy+VTublXNwHORfsFF5gLZjVpMGVQNS3
	i+FvCcC1w0f9K3lDmVjNbgWQPftWHXs=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2] selftests/bpf: Report the real error from libarena parallel workers
Date: Thu, 23 Jul 2026 14:13:37 +0800
Message-ID: <20260723061347.398591-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Several CI runs failed in the libarena parallel tests with -4 (-EINTR) [1],
which says nothing about what actually went wrong.

Two workers can fail like this:

  worker 1: gives up, e.g. the rendezvous times out, sets test_abort and
            returns its own error (-ETIMEDOUT)
  worker 2: sees test_abort and returns -EINTR

-EINTR only means "someone else already gave up", so it carries no
information. Which of the two gets reported depends on the order
pthread_join() collects them, because

	err = err ?: (long)thread_ret;

keeps the first non-zero value and drops the rest. When the -EINTR worker
comes first, the error describing the actual failure is lost.

Skip -EINTR entirely: a worker only returns it once another worker has
already reported the real error, so report and log only the real errors.

It is still unclear whether the timeouts come from CI load or from a
problem in the test itself. Report the error accurately first, so the next
failure can be diagnosed.

[1]:
https://github.com/kernel-patches/bpf/actions/runs/29867905253/job/88764463566
https://github.com/kernel-patches/bpf/actions/runs/29878191901/job/88794845824

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

---
v1 -> v2:
- hoist the worker_err declaration to the top of the function
- skip -EINTR workers entirely: do not aggregate and do not log them
- comment/commit message wording fixes

v1: https://lore.kernel.org/bpf/20260722064713.357277-1-jiayuan.chen@linux.dev/
---
 .../selftests/bpf/prog_tests/libarena.c        | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/libarena.c b/tools/testing/selftests/bpf/prog_tests/libarena.c
index df7e4b8dc394..daade4150af6 100644
--- a/tools/testing/selftests/bpf/prog_tests/libarena.c
+++ b/tools/testing/selftests/bpf/prog_tests/libarena.c
@@ -73,6 +73,7 @@ static int run_libarena_parallel_test_workers(struct libarena *skel,
 	uint32_t nthreads;
 	void *thread_ret;
 	int ret, err = 0;
+	int worker_err;
 	int i;
 
 	for (nthreads = 0; nthreads < UINT_MAX; nthreads++) {
@@ -118,7 +119,22 @@ static int run_libarena_parallel_test_workers(struct libarena *skel,
 			continue;
 		}
 
-		err = err ?: (long)thread_ret;
+		worker_err = (long)thread_ret;
+
+		/*
+		 * A worker that bails out because another one already gave up
+		 * reports -EINTR. It is collateral damage that carries no
+		 * information, so skip it entirely: never let it become the
+		 * reported error, and don't log it either.
+		 */
+		if (!worker_err || worker_err == -EINTR)
+			continue;
+
+		if (!err)
+			err = worker_err;
+
+		fprintf(stdout, "%.*s__%d returned %d\n", (int)prefixlen, name,
+			i, worker_err);
 	}
 
 	free(threads);
-- 
2.43.0

