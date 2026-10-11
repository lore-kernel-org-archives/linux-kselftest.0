Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F946D0B1;
	Sun, 11 Oct 2026 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758053; cv=none; b=b8u8L658kmqbYjFG4qzxYiWGwDMT75cRNzT98CjcTywlytuGOp+OMrWShdSgqYFl6ooJX5XPvP97qk7AcEXY/9php06kcWvscrBkUlxjMI2c1ctMgc5z6NX7z2Y622uoLUIYJQ0uddL74czXLHttLbh0KC3YcXzQBZSD0oWB1pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758053; c=relaxed/simple;
	bh=Kc9DmJSBFLurxMClSmavCXYgaAe/+NlK9ylk9KsSpbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmGpPaPUjpo9SenW/IH0vMdl2IwJEsDBvMo4IKyJosTFK8HX43nVJDcqqjKNa7QAbUNj0n5y92efBwD3NORn34ttS+tfd0G6XWySIhaGV3ZRwnCfBvpXyTJzv/cZvJUdHGjyQMfyi7xA751AfVPAU47LouyvOdJXPdtEJGzuuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ua32L9UR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ua32L9UR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4545F1F0089C;
	Sun, 11 Oct 2026 22:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758052;
	bh=MtBrUZk9L4rkfwDGHCQBcgRtyBALUY+U/RwYmPk4KOo=;
	h=From:To:Cc:Subject:Date;
	b=Ua32L9URjZTITJTZSFrFmYMwiIL3GwAVFKD2SgoXL1sBgdPqFxYujI7GSQQ4smK5/
	 271mrUUOg75peDejLzBzpCEPS/GseYF/8aXgIG8hkDTYs9HUNg1avSUvfpvq7y4qQt
	 OHRv5nv7ifR3Fh16NgWfYEo9414JiXVYDcrW8o8nAtJW/H1BrWFP7Muw/7RSGKVyQP
	 zaoYwT1EtGEXFd39Pmqez7nIGlZkZnl/Gq7tE0ijSCGd0GghZNcL2qCayTwN83Dorb
	 Lt2uKwiDgJD+3GcUsQ8t7weBnSqYUURyg+gWezylWP1o7IAO1x/pvzkBUi67bB8N7G
	 jxHAYvgsPjtFA==
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/rseq: depend on librseq.so only
Date: Sun, 11 Oct 2026 18:33:35 -0400
Message-ID: <20261011223358.2327625-7-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each test program lists $(TEST_GEN_PROGS_EXTENDED) as a prerequisite to
pick up librseq.so. Since that list also holds the test programs built by
the same rules, every build prints a page of

  make: Circular <prog> <- <prog> dependency dropped.

Depend on $(OUTPUT)/librseq.so, which is what the rules need.

Fixes: cb48828f06afa ("selftests/rseq: Don't run tests with runner scripts outside of the scripts")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/rseq/Makefile | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index aba6317f6cb8e..977da558fa2f5 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -40,38 +40,38 @@ include ../lib.mk
 $(OUTPUT)/librseq.so: rseq.c rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -shared -fPIC $< $(LDLIBS) -o $@
 
-$(OUTPUT)/%: %.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/%: %.c $(OUTPUT)/librseq.so rseq.h rseq-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(OUTPUT)/librseq.so rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_benchmark: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_compare_twice: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_mm_cid: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_mm_cid: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(TEST_GEN_PROGS_EXTENDED) \
+$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(OUTPUT)/librseq.so \
 					rseq.h rseq-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/slice_test: slice_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/slice_test: slice_test.c $(OUTPUT)/librseq.so rseq.h rseq-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/check_optimized: check_optimized.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/check_optimized: check_optimized.c $(OUTPUT)/librseq.so rseq.h rseq-*.h
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
-- 
2.53.0

