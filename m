Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856193;
	b=d8kfbM+ceaFOHnwm5Mqmd5dpFdwwD1ITuk2lK1vtqAp7YjmPJzJ7bW1pMaxFaZ3VSYmb
	 iVRQnxTQANSIbya/5pXCfQ4rdA1sDXLswIsOHyIjIsU9u4XJmgXrbhKMbjkKXFVURtxQZ
	 NxiWPcmCWnZuNgqR40XyDncRQ/7oOVfd6iPWPSRP9ThfCKaRD5xYuV3dMrJRM7Gw2PkUN
	 4QmYLPlV0D0gHes5bqhQ81aJhgozX5LMXG+3qRMUJFVbqDhnvWXZp0F2TveHLb+Et849e
	 JtsmvpWALdq9XmOn1xOt85dyjMwIGQGzIuAHbcQ9Io3HNxcgHnRzPVBZsjVSkzKxRRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856193;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bPzOvuX5VgrTU9yIIudolJJSPSRHz/AbtYrEX5LP0UI=;
	b=mEKMkQBqFeAoFVC73iEsTuZB6bMUp4iYMuNe1s7pKVdIqFMRJR9s31DqCmKm6S93tJM3
	 IYCGO9ge6jhkOefRAm8W4akdN75yDkVDOrx1l/bxmONcWHAKFwjFoSquJAalTAfq2ujZK
	 63nN50EsTZx1D1Sw5u4rbXMHxI3DaxGzlp9QlKC44x9t2SLac9uVl7+Q6u4fgUUsvsnnD
	 TUzz06UhYS8ORJzSLkf6wPCuVoe3vYOhGu5QYcqZ0VhbzGAmw2h70dWzLSZm8VR6GvFOt
	 4YvqlRRHdOSF4gmKp7YI0gyW0iSW5miF5hTEjFuFgxGvm1Yy6pV1XqHbtzRGGhP2L0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oD+d+Lkn;
	arc=none smtp.remote-ip=91.218.175.173
Received: from mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C1606A321
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 15:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oD+d+Lkn
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=miCtniVHMbA/PYAbgBN5voicnBaPD8dFe3tGyzcmStY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792856191; v=1; x=1793460991;
 b=oD+d+LknnrJtMB6YGH5IhzB4PZ6vnDly32tgyG10jqPCVWZf/bCvcAKLyrFeU8+0rCw8YXY2
 6b9Ax4b22ysrFjb5uqJTQlbPS+ylHSxOY9orkWpPQnyrZSsVLFnazSw3ZYy4pntUvMYObivk7Kg
 JXoNIj6WnyIMBnWkYVu2hgig=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a844d826a8c25d3;
	Sat, 24 Oct 2026 15:36:30 +0000
X-Mizu-Trace-ID: 7a844d826a8c25d3
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Masashi Honma <masashi.honma@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH bpf-next v4 1/6] bpf: Add syscall common attrs support for link_create
Date: Sat, 24 Oct 2026 23:36:02 +0800
Message-ID: <20261024153608.58569-2-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024153608.58569-1-leon.hwang@linux.dev>
References: <20261024153608.58569-1-leon.hwang@linux.dev>
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

Similar to the syscall common attrs support for map_create [1], add the
syscall common attrs support for link_create.

Create and finalize the internal verifier log instance.

Then, report the error messages for invalid prog fd, invalid attach type,
and invalid prog type.

Links:
[1] https://lore.kernel.org/bpf/20260514004634.3DA09C19425@smtp.kernel.org/

Link: https://lore.kernel.org/bpf/20260514004634.3DA09C19425@smtp.kernel.org/
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/bpf/syscall.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 90bc7230afa8..db870e795d04 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -5862,8 +5862,11 @@ static int bpf_map_do_batch(const union bpf_attr *attr,
 }
 
 #define BPF_LINK_CREATE_LAST_FIELD link_create.uprobe_multi.path_fd
-static int link_create(union bpf_attr *attr, bpfptr_t uattr)
+static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_attr *attr_common,
+		       bpfptr_t uattr_common, u32 size_common)
 {
+	struct bpf_verifier_log *log;
+	struct bpf_log_attr attr_log;
 	struct bpf_prog *prog;
 	int ret;
 
@@ -5873,14 +5876,24 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
 	if (attr->link_create.attach_type == BPF_STRUCT_OPS)
 		return bpf_struct_ops_link_create(attr);
 
+	log = bpf_log_attr_create_vlog(&attr_log, attr_common, uattr_common, size_common);
+	if (IS_ERR(log))
+		return PTR_ERR(log);
+
 	prog = bpf_prog_get(attr->link_create.prog_fd);
-	if (IS_ERR(prog))
-		return PTR_ERR(prog);
+	if (IS_ERR(prog)) {
+		bpf_log(log, "Invalid prog_fd.\n");
+		ret = PTR_ERR(prog);
+		prog = NULL;
+		goto out;
+	}
 
 	ret = bpf_prog_attach_check_attach_type(prog,
 						attr->link_create.attach_type);
-	if (ret)
+	if (ret) {
+		bpf_log(log, "Invalid attach_type.\n");
 		goto out;
+	}
 
 	switch (prog->type) {
 	case BPF_PROG_TYPE_CGROUP_SKB:
@@ -5959,12 +5972,20 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
 			ret = bpf_uprobe_multi_link_attach(attr, prog);
 		break;
 	default:
+		bpf_log(log, "Invalid prog type.\n");
 		ret = -EINVAL;
 	}
 
 out:
-	if (ret < 0)
-		bpf_prog_put(prog);
+	if (ret < 0) {
+		int err;
+
+		err = bpf_log_attr_finalize(&attr_log, log);
+		ret = err ? err : ret;
+		if (prog)
+			bpf_prog_put(prog);
+	}
+	kfree(log);
 	return ret;
 }
 
@@ -6536,7 +6557,7 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int size,
 		err = bpf_map_do_batch(&attr, uattr.user, BPF_MAP_DELETE_BATCH);
 		break;
 	case BPF_LINK_CREATE:
-		err = link_create(&attr, uattr);
+		err = link_create(&attr, uattr, &attr_common, uattr_common, size_common);
 		break;
 	case BPF_LINK_UPDATE:
 		err = link_update(&attr);
-- 
2.55.0

