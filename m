Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE0EEC3
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284909; cv=none; b=r7Yk9zRqVfUjTllm1zVX1o9RV3Zc4V3kmk12UMnXlQiXAdlElQA7kaYC9eszaLp9XdCw7tZ7G7MbI6F7knTdATB5m7UB/7m/i4IU1Wo9ptLHVRQKOotXpZraQzb4S8a/0cZZFzspbC3qCzbRQpVElEo6N/coZMWp8q+EhbL7o8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284909; c=relaxed/simple;
	bh=45pvCpoozTCiJIeGIqRoWCtW796yt/btSJjWG4nk5Co=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=G0MRJfMcx9v3PwAZiD7VkDZr8tvdy5PpE2Knau8dUsAD8twTXqSBRH51llsKqk/FZyLxu4It/MaQgpqHPZwyYjZHts5v/h93QAXCeBuILpE9jLaFHxzOzRbPv4oAHUsjV8vfi/VRf2Dwo18/k+vTe97lrjhVFd8YdiJ/kVS6URI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nDajEzua; arc=none smtp.client-ip=95.215.58.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nDajEzua"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=45pvCpoozTCiJIeGIqRoWCtW796yt/btSJjWG4nk5Co=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792284905; v=1; x=1792889705;
 b=nDajEzua+QfEMTme01CcJFA+NEX40lfBG650dkdeE2CiS5XAlKm8TP0CkYluFbMKkYk4ljng
 TMQVeJRiDiV1TvRcKajh0M9PnALUlXv09QKzM5LiUnqvoTS105acAMQzDkm2RC9LwE7Z3B4vQZp
 E3qwgCidTHfG+HS99Y4FmlP8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9fe994895f7c21ac;
	Sun, 18 Oct 2026 00:55:04 +0000
X-Mizu-Trace-ID: 9fe994895f7c21ac
X-Migadu-Flow: FLOW_OUT
From: KaFai Wan <kafai.wan@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Menglong Dong <menglong8.dong@gmail.com>,
	KaFai Wan <kafai.wan@linux.dev>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Feng Jiang <jiangfeng@kylinos.cn>,
	Vineet Gupta <vineet.gupta@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v3 0/4] selftests/bpf: Fix selftests fails with clang23
Date: Sun, 18 Oct 2026 08:53:44 +0800
Message-ID: <20261018005348.2195130-1-kafai.wan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with clang/LLVM 23 breaks several selftests. Patches #1 to #4 fix
those failures.

Changes in v3:
 - Remove the patch already applied.

Changes in v2:
 - https://lore.kernel.org/bpf/20261014113043.640435-1-kafai.wan@linux.dev/
 - Collect the selftest fixes from the two patches in v1
   patches: #1, #5, #6 and #7.
 - Add three new patches: #2, #3 and #4.

Changes in v1:
 - https://lore.kernel.org/bpf/20261012135624.2749743-1-kafai.wan@linux.dev/T/
 - https://lore.kernel.org/bpf/20261012140202.2754552-1-kafai.wan@linux.dev/T/

---
KaFai Wan (4):
  bpf: Determine freplace staticness from BTF linkage
  selftests/bpf: Fix stack_arg precision backtracking log expectation
  selftests/bpf: Fix stack arg pruning test JOIN log expectation
  selftests/bpf: Use _exit() in uprobe_multi_test clone-ed child

 kernel/bpf/verifier.c                                      | 3 ++-
 tools/testing/selftests/bpf/prog_tests/exceptions.c        | 2 +-
 tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c | 4 ++--
 tools/testing/selftests/bpf/progs/stack_arg_precision.c    | 4 ++--
 tools/testing/selftests/bpf/progs/verifier_stack_arg.c     | 4 ++--
 5 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.43.0
