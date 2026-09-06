Received: from out-2uec-a100.jellyfish.systems (out-2uec-a100.jellyfish.systems [63.250.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC64CCDFB
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788705606; cv=none; b=RXNIcYcQL2f3ausfuG39hLo4kNpzxYQMfKvfrsSi9u/yIH5QS6B0Ct57YQac6UKiKZqHjMGYF5UxdVZfJGHKh52PlknxeUqU9KvOwYBUUk4WMLaeoCiiSnsXlLcZgt+kqEjY6uW5rsJuya81fibxsGvrFx79HzvguAlWZJr0i1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788705606; c=relaxed/simple;
	bh=ID6pU/SCipMAoR6bnnWttfaKW8Cz/CkOPUWe7BjzTR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fLtM4+BZKJrh//JdMFBh3uCCNNlyRhh8IIYepq0adTegJu5nqUq2sMipU66Z4xuCZHvhW+WznJcT7v2/m2qJ7Qzjco3Omm2IlND3RKC6e5gm43fR2jQQbbcmiNGyIf93F/8ez5lD/GGzS8Jg3Mq6XMEM5QdHEdc/vJM7V11pTxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=FzFwf7sF; arc=none smtp.client-ip=63.250.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="FzFwf7sF"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdCXK0lK1z8sWg;
	Sun, 06 Sep 2026 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788705589;
	bh=18NIljhIBXGMPhC2bNVsXV9nKFTRbDl30rj7K0iSWS0=;
	h=From:To:Cc:Subject:Date:From;
	b=FzFwf7sF/gdufKxLTVuVYA5VCNtjND9bRMGjbLU+PzU68TRqq01DngEM99zlTwaIk
	 ClGGwvSkSBehiYeHQdTKqAtZhbrktcXGgUnt+p6qH22xbx/wXEQUItwmrApwj0H/cC
	 2MqWg2Ic+K9RfD1DeDkJkHH+cEF62TCZsUWX0gS8MMp1Iju+yyZnn/NPAdwuBSe+a/
	 v0IDKnvjZp/HZwLDH1Ar9V9M7ZTDeFjCjkBnWgTxJHNPmPNxEm7PAY3LoYIQWsv9PX
	 /T1fLYT5cFFn0HrdFC7cDTF6MNtSIwa8DM8mV0KyCnrszEtRFdQbHENwf/GpfLsBop
	 /qu1v0905WQog==
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
	David Vernet <void@manifault.com>
Subject: [PATCH bpf] selftests/bpf: Exercise double release in cpumask failure test
Date: Sun,  6 Sep 2026 22:39:34 +0800
Message-ID: <20260906143934.848632-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

create_cpumask() can return NULL, but test_alloc_double_release does
not check its result before releasing it. The expected NULL-pointer
diagnostic allows the test to pass when the first release is rejected,
without checking the second release at all. Removing the second call
still produces the same expected rejection.

Return when creation fails and expect the release-ownership diagnostic.
This makes the verifier accept the first release and reject the second
use of the invalidated reference.

Verified that the guarded single-release control is accepted and the
guarded double-release program is rejected at its second release. All
36 cpumask subtests pass on the matching kernel.

Fixes: 7b6abcfa15cd ("selftests/bpf: Add selftest suite for cpumask kfuncs")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/bpf/progs/cpumask_failure.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/cpumask_failure.c b/tools/testing/selftests/bpf/progs/cpumask_failure.c
index 4628feb53d8..e98493bd575 100644
--- a/tools/testing/selftests/bpf/progs/cpumask_failure.c
+++ b/tools/testing/selftests/bpf/progs/cpumask_failure.c
@@ -45,12 +45,14 @@ int BPF_PROG(test_alloc_no_release, struct task_struct *task, u64 clone_flags)
 }
 
 SEC("tp_btf/task_newtask")
-__failure __msg("NULL pointer passed to trusted R1")
+__failure __msg("release kfunc bpf_cpumask_release expects referenced PTR_TO_BTF_ID passed to R1")
 int BPF_PROG(test_alloc_double_release, struct task_struct *task, u64 clone_flags)
 {
 	struct bpf_cpumask *cpumask;
 
 	cpumask = create_cpumask();
+	if (!cpumask)
+		return 0;
 
 	/* cpumask is released twice. */
 	bpf_cpumask_release(cpumask);
-- 
2.55.0

