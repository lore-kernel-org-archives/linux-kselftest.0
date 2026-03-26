Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216936922F
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534674; cv=none; b=n8fsTQiaCspJsP4DXcPwZB1090ql1rgTSKfXp8y71giafh726/S98cUQhcGL907VvMQ0RIyRSYY5quTt7t0Ek5TCfutC4kg10nas5XvcK3hVErC7XoxI0pIFB2L9qsY1HTshVY28Uwt0LMn+MGWLnuboymfLtUkILj+/IfbRFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534674; c=relaxed/simple;
	bh=WVbCpWwtXFS5WnRF1GNs4kUcVMd1qblCOHqrZ/DEfCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq4GG35vlzhxy3jJ7zSEQKAE9sWG9R/X2FwbCvCIY4qJwQIqn4oWe+4HiWgZNQIyTbGLBB1hlR35PAGhQ8aAAaqbo9kkMnrISso6VzJZeYYEENZePin8btDElEVphGu2VAK8UoiZJwD33VYBPMQlsRattcmomaBh0xDsNscicuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aEK53iSg; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aEK53iSg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774534667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ni2FOm+AKZAFdBlcw1DzXopDy53nnYWg3V8M/1f2/Q=;
	b=aEK53iSgYB1Xg0JVyrEQW2Mb6yMvIXx15VjUa1ek/QwIXZsmsGqU5mwLDHuBxcMKvf6Dz5
	seBxe7IpoUCxpR0LKtZiYJhCzP4ABDYUmJj++GuoXFm2X+MU3MKC6TXwNQnDH4ayw6jEUK
	EeR5mvfLkiDND3WTAerNwfM2q4xJoQY=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	Leon Hwang <leon.hwang@linux.dev>,
	Toke Hoiland-Jorgensen <toke@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v2 1/2] bpf: Fix abuse of kprobe_write_ctx via freplace
Date: Thu, 26 Mar 2026 22:17:17 +0800
Message-ID: <20260326141718.17731-2-leon.hwang@linux.dev>
In-Reply-To: <20260326141718.17731-1-leon.hwang@linux.dev>
References: <20260326141718.17731-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

uprobe programs are allowed to modify struct pt_regs.

Since the actual program type of uprobe is KPROBE, it can be abused to
modify struct pt_regs via kprobe+freplace when the kprobe attaches to
kernel functions.

For example,

SEC("?kprobe")
int kprobe(struct pt_regs *regs)
{
	return 0;
}

SEC("?freplace")
int freplace_kprobe(struct pt_regs *regs)
{
	regs->di = 0;
	return 0;
}

freplace_kprobe prog will attach to kprobe prog.
kprobe prog will attach to a kernel function.

Without this patch, when the kernel function runs, its first arg will
always be set as 0 via the freplace_kprobe prog.

To fix the abuse of kprobe_write_ctx=true via kprobe+freplace, disallow
attaching freplace programs on kprobe programs with different
kprobe_write_ctx values.

Fixes: 7384893d970e ("bpf: Allow uprobe program to change context registers")
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/bpf/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 51ade3cde8bb..1dd2ea076d8b 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3733,6 +3733,11 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		tr = prog->aux->dst_trampoline;
 		tgt_prog = prog->aux->dst_prog;
 	}
+	if (prog->type == BPF_PROG_TYPE_EXT &&
+	    prog->aux->kprobe_write_ctx != tgt_prog->aux->kprobe_write_ctx) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
 
 	err = bpf_link_prime(&link->link.link, &link_primer);
 	if (err)
-- 
2.53.0

