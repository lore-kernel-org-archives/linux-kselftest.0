Received: from out-2z4y-a139.jellyfish.systems (out-2z4y-a139.jellyfish.systems [198.54.127.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0D33C1AD
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788705596; cv=none; b=HfzsfGE6i70qftIZBKGi4k6Zw7xKWEMbP/wk2IUQH5kLA4VVuvqavQctXOMG7S+EIucW2sziaOYeQqs92xIO9Le0q942K/iqp/UASooJl2mXCL25sSE5EwSUBpCezXTj43CaPv8W5ECIJigBeIFHaTIA2kwg22oP01ZDY/ND9C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788705596; c=relaxed/simple;
	bh=HjX43IXUVj0c1iU7YYoc2MlHHzj53Q0lGrYgc3kbfwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TTOPgMPqt1RQNznexndVUfO9IYiUuIcBaLmOvoWTzMRPUdLOFV+dIvc1JGwquMnLmAN4GDjpGJNp7+5MHyIochXtnVq7ndy72AM9QVfC2iBkPNIegLrRujcCFlJhkf1ilJ8BiQodpPdg5k+BO77zj+EZejQpmJa2ILAES0JYnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=NJQ6bb1n; arc=none smtp.client-ip=198.54.127.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="NJQ6bb1n"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdCX13skmz2x9X;
	Sun, 06 Sep 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788705573;
	bh=6ySDbc6oyC0qahabQIu62xCvVoIVq3NcjYGnbezvhBY=;
	h=From:To:Cc:Subject:Date:From;
	b=NJQ6bb1nnQLbupaenLLkab6hsY7dJKt2xSHDBjcC/tLtqADesOKMiMz6gXXhI87yB
	 DH//mdmjX9HDRQyDzIaZ+vvhl59VYC5V+6R0SAONXZoueIBCvbTTJwEwSzgAiFBAXh
	 V1fmgRM1iXYV+vDeIqXNnQlHSZLQJNLckuEJmoF5y39Lh1XtlyS+BCdZAwqQRnLsuk
	 91BYYyPJdEq1owE2LuA6rKN/bBZerOGWm0fSizE/nbY30RGzjaGiZT7kkYkBDeUs8t
	 9lWvnyWYCm0kxHv0mY+/ZfsJs/8eBZm+q3NKTiTNrWXYwoXTHvFiHijz05udLuIwb9
	 yeBU+LODqV95A==
From: Tianyi Chen <hi@tychen.cc>
To: andrii@kernel.org,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Tianyi Chen <hi@tychen.cc>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghong Song <yonghong.song@linux.dev>,
	Brian Vazquez <brianvv@google.com>
Subject: [PATCH bpf] selftests/bpf: Check returned keys in map batch validators
Date: Sun,  6 Sep 2026 22:39:18 +0800
Message-ID: <20260906143918.848536-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

The hash and array batch validators mark visited entries by output
position, making the subsequent completeness checks always succeed.
Duplicate keys with matching values can therefore hide missing entries.

Check that returned keys fall within the populated range and index
the visited array by key. This detects missing entries while preserving
unordered results and existing per-CPU value validation.

Controlled inputs confirm that the old validators accept duplicates
and out-of-range keys with matching values, while the updated checks
reject them. Ordered, reversed and shuffled valid keys still pass,
and scalar and per-CPU value corruption is still rejected. The full
test_maps suite passes with no skips on the matching kernel.

Fixes: 30ff3c59137d ("selftests/bpf: Add batch ops testing for htab and htab_percpu map")
Fixes: f0fac2cec286 ("selftests/bpf: Add batch ops testing to array bpf map")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/bpf/map_tests/array_map_batch_ops.c | 5 ++++-
 tools/testing/selftests/bpf/map_tests/htab_map_batch_ops.c  | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/map_tests/array_map_batch_ops.c b/tools/testing/selftests/bpf/map_tests/array_map_batch_ops.c
index b595556315b..76d3800a82a 100644
--- a/tools/testing/selftests/bpf/map_tests/array_map_batch_ops.c
+++ b/tools/testing/selftests/bpf/map_tests/array_map_batch_ops.c
@@ -45,6 +45,9 @@ static void map_batch_verify(int *visited, __u32 max_entries, int *keys,
 
 	memset(visited, 0, max_entries * sizeof(*visited));
 	for (i = 0; i < max_entries; i++) {
+		CHECK(keys[i] < 0 || keys[i] >= max_entries, "key checking",
+		      "error: i %d key %d out of range\n", i, keys[i]);
+
 		if (is_pcpu) {
 			cpu_offset = i * nr_cpus;
 			for (j = 0; j < nr_cpus; j++) {
@@ -59,7 +62,7 @@ static void map_batch_verify(int *visited, __u32 max_entries, int *keys,
 			      "error: i %d key %d value %lld\n", i, keys[i],
 			      values[i]);
 		}
-		visited[i] = 1;
+		visited[keys[i]] = 1;
 	}
 	for (i = 0; i < max_entries; i++) {
 		CHECK(visited[i] != 1, "visited checking",
diff --git a/tools/testing/selftests/bpf/map_tests/htab_map_batch_ops.c b/tools/testing/selftests/bpf/map_tests/htab_map_batch_ops.c
index 5da493b94ae..430949f9691 100644
--- a/tools/testing/selftests/bpf/map_tests/htab_map_batch_ops.c
+++ b/tools/testing/selftests/bpf/map_tests/htab_map_batch_ops.c
@@ -50,6 +50,8 @@ static void map_batch_verify(int *visited, __u32 max_entries,
 
 	memset(visited, 0, max_entries * sizeof(*visited));
 	for (i = 0; i < max_entries; i++) {
+		CHECK(keys[i] < 1 || keys[i] > max_entries, "key checking",
+		      "error: i %d key %d out of range\n", i, keys[i]);
 
 		if (is_pcpu) {
 			for (j = 0; j < bpf_num_possible_cpus(); j++) {
@@ -65,7 +67,7 @@ static void map_batch_verify(int *visited, __u32 max_entries,
 			      ((int *)values)[i]);
 		}
 
-		visited[i] = 1;
+		visited[keys[i] - 1] = 1;
 
 	}
 	for (i = 0; i < max_entries; i++) {
-- 
2.55.0

