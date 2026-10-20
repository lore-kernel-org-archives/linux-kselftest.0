Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510111;
	b=nHIqC95Y6QokkTQfNBbmT50S2jbUNakKYmNyKREZ72wD4UTt47A3viIzAWHF7h/qv17p
	 S7rGPLJ4FgMpBkpxDB89bYIYjq4KNroaDHzXboQRMs/0eBbs9aAep0LpXegFi2Hoh4NeL
	 0hTApegpca51IdAmL3FJNuB4Y25UbEOg0AV3QsoYy+/8WwDR9smVO34nNiEOgDYlqyyWm
	 o3LYjhEx12gdDjbDhGEZihSEmiNM+BebF5d5+NLICTvowIfWoOXkXDrRCWXZ4q/d0Gf9q
	 8vPrm9w+E5DQJMIOhvlALZu4oZpcbXPoO4ChJmxSnI+HhFesmIIFwXWhYR3So/yNhfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510111;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wu6c1+lhfsbnXjg7eEvFVI8XNrk+lweGeb1/GciTzuM=;
	b=Ngd8FEqSRQXHq6U0uR8JWb+JoBJ8R188HeSQkFUAb1lQtHvAgAnzGMvY1P+dnmg9YX8U
	 4YUgYPXXuIitq14G14xaj53R4guunZWP8V/tvLukWn7FcjyVWPRoixm5ok4OSKg5K9Kd/
	 bC7j1RSSMcdAkVAV1yPNqr5iRXFnjkPCEQPBfrr7LITyir1Xfj5pbLYND3NQmAItFmfbI
	 1RI+sBbH65NSfO1Jvx1EO/FnaulEdbIi2lZDQozsZ2vrG+Wx69e9MX0gD5+B9QMOIEpcN
	 GfhLRhSaIvPHzTlS4VUH5rZ4Rh5lVx4w4duyHxxyG1MZOws0sbcUGmqCWVgLeedRHXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EOrzMaxD;
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78BC606A33A
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 15:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B78BC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EOrzMaxD
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2zapS+vIIEgfWQ0p9XxDH62ew/nt1UcgtSOrLI6cP1c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792510108; v=1; x=1793114908;
 b=EOrzMaxDnfIaRIr5QkWMaomqi26DFEzAlS09g7KHfiwJseqME7ZNMoJLZEt0Do0kUmEbzWEB
 +xfuwW7Sbm+0eUOh9VCQ87t8ewm1OEkNP8t6uT15gJLR9ilVTgyQDjuh6ZlI9TNpmiSTnX+d03y
 Tnp0/11svD9CafTxG7U/aYBM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6ac59b544f27bcc;
	Tue, 20 Oct 2026 15:28:28 +0000
X-Mizu-Trace-ID: c6ac59b544f27bcc
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
Subject: [PATCH bpf-next v3 1/6] bpf: Add syscall common attrs support for link_create
Date: Tue, 20 Oct 2026 23:27:59 +0800
Message-ID: <20261020152804.39863-2-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020152804.39863-1-leon.hwang@linux.dev>
References: <20261020152804.39863-1-leon.hwang@linux.dev>
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

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/bpf/syscall.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 849bc9136299..61d100e794b4 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -5856,8 +5856,11 @@ static int bpf_map_do_batch(const union bpf_attr *attr,
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
 
@@ -5867,14 +5870,24 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
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
@@ -5953,12 +5966,19 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
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
+		int err = bpf_log_attr_finalize(&attr_log, log);
+
+		ret = err ? err : ret;
+		if (prog)
+			bpf_prog_put(prog);
+	}
+	kfree(log);
 	return ret;
 }
 
@@ -6530,7 +6550,7 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int size,
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

