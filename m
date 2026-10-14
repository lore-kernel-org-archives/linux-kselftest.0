Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C24915B1;
	Wed, 14 Oct 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008110; cv=none; b=PWc0YMepNwCHnWctzuoIgGR3+qVkz1xAZPQibzt3gURJ6IxmPDbxVe2GnQnEOV8BA1+PVLHEhlPdXeeiA1Wxt42MIkKppZFRzSssjIf3vaC3ncYCRW6Ui7M3U35VVxV08VtdLZTZC/xIQeHiOj0WrQk9gMj9stbiRVy+vs7xmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008110; c=relaxed/simple;
	bh=AgqGlu2BY5ng4eYmRHOahKYpcbdK8lw45IMQ2tv0I9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hj1yVSBL/k2fEOHtyaq8gTmYtfiZixf95peQj73xL3bWMzzZ+4jwl06qm54F3/VUKxyvquCg4f0qiX8EhQOM2h0oPDt4/7Qs45AFhGkpgglhrAtI8HCRS+IOg2yKcGTQAnjP12PhKSJNlPHBSi9DOAeU+Fj9Nz0G+xx0Y+9Rlf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eX39hvwZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eX39hvwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBA21F000C7;
	Wed, 14 Oct 2026 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008109;
	bh=OI39lvz58b0+E1hyecTZu8SYZkDLpmgMHlgI5k8XVSI=;
	h=From:To:Cc:Subject:Date;
	b=eX39hvwZFBEVAx5tqiKZkBYt/20L3u56k8dNdVC8zjHWQ9Rd5OioY33qttVX6bo4Y
	 bVte+R8d6xWe9KbIQkriPasj7RF2zwIzejjiV33TRu6AnUEWkaIZmBEObbDGbs6v5o
	 Ybb52aBN70PKlTIzUTbELuXbQ5jHXm6VPZGkmiohretv79oFd66N9Hg/JtzVcuuJh+
	 48Ax9M5cA9481DLZuFIeuI7SOMVN/A8NrL7QAlIOJ48bNAd+yv0p5wMQf03B3Vg5He
	 gliCrQ8XqxZkcIb8xZ8D4xWILngTQ7PCincvkxuTv0KXbMiECv1bVa5cCje93lQ2bd
	 NWqIQqAVPEQSQ==
From: Sasha Levin <sashal@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	llvm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/futex: load atomic values before harness comparisons
Date: Wed, 14 Oct 2026 16:01:47 -0400
Message-ID: <20261014200147.1364987-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang 21 rejects the harness comparison because typeof(*futex) preserves
the atomic qualification. Load the value explicitly in the three affected
assertions so the harness compares unsigned integers. Atomic access and
its existing sequentially consistent ordering are preserved.

The baseline produces three invalid-operands errors. The complete futex
suite builds with Clang 21 and GCC 14 after the change.

Fixes: 608323bf7bb8 ("selftests: futex: Add tests for robust release operations")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/futex/functional/robust_list.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/robust_list.c b/tools/testing/selftests/futex/functional/robust_list.c
index 87217c5493619..895e6cfe59bcd 100644
--- a/tools/testing/selftests/futex/functional/robust_list.c
+++ b/tools/testing/selftests/futex/functional/robust_list.c
@@ -669,7 +669,7 @@ TEST_F(vdso_unlock, test_robust_try_unlock_uncontended)
 	ret = self->vdso(futex, tid, &head.list_op_pending);
 
 	ASSERT_EQ(ret, tid);
-	ASSERT_EQ(*futex, 0);
+	ASSERT_EQ(atomic_load(futex), 0);
 
 	/* Check only the lower 32 bits for the 32-bit entry point */
 	if (variant->is_32) {
@@ -709,7 +709,7 @@ TEST_F(vdso_unlock, test_robust_try_unlock_contended)
 	ret = self->vdso(futex, tid, &head.list_op_pending);
 
 	ASSERT_EQ(ret, tid | FUTEX_WAITERS);
-	ASSERT_EQ(*futex, tid | FUTEX_WAITERS);
+	ASSERT_EQ(atomic_load(futex), tid | FUTEX_WAITERS);
 	ASSERT_EQ(head.list_op_pending, &lock.list);
 }
 
@@ -793,7 +793,7 @@ TEST_F(futex_op, test_futex_robust_unlock)
 				      &head.list_op_pending, variant->val3);
 
 	ASSERT_EQ(ret, 0);
-	ASSERT_EQ(*futex, 0);
+	ASSERT_EQ(atomic_load(futex), 0);
 
 	if (variant->op & FUTEX_ROBUST_LIST32) {
 		exp = (uint64_t)(unsigned long)&lock.list;

base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.53.0

