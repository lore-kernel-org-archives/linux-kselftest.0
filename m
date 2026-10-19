Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424221;
	b=ymbNzpyhnkA9A6HTJHaUnAJwKi12vPK1yd8HDnp1ol+9jfedxlkCG6IZAtYa5c8LeIcb
	 Qt/xYAM76MVo7+SmjVyE83AF1v5VSmIIaKcCoFHkerES/FRXrXDZ2LTRZopcK5bUFeWcu
	 3UoW9FAYoSHYRAR1N8N81bEbUGNLrW5IqBxI7yAHCedWws2NmhVNOV7Qv1q169oqwqSpT
	 6OisraJhIj0nCpEEKL818WNt/wmXH/LDsh2BYv6KS1w0sX/ZTmlic+EkPrgjrGu9SJA7e
	 9AxGNkks87aw/Hw6aHS9BND6kgrte/J31vCk3QDWSyAN1md2RBAzhCIS2tvAwqDASxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424221;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=deXBqyfAo/Vfws6DH3Z1JUfsbc61ULDoEgL19VqtNqE=;
	b=Ldfj9YP2iGgSD0v1HeymKF53ZQmdzQotVYQkLwwq8QoMq/J7b283D86OLXFPPES8HeYd
	 1VFgFlLVmGFNJMtrtvT3911II59FSZkjKmSoCDcqfAPew7MrRqSlB/qMG6RzpZMVPGeaG
	 ed9z/Nxuf1aBUoLzOLaE+3ajEijyOAn9A29jdoue9pWUCVAZUbHoXKvHItIVx/jeOiKND
	 1tA4OrD9o4Ygg47LlKjlqhgn3gaW+1E4FKHgKLyDkba8ZFO44C0RO0PEnRWOFr4KjFhdP
	 cPwZe4SKm+pIEkPrFLzyFpoua1yhko/K8V62gYt2uZqo2xDtakR52wU+JnXCpfs9n8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="HAO98/+K";
	arc=none smtp.remote-ip=91.218.175.240
Received: from mta0.migadu.com (out-240.mta0.migadu.com [91.218.175.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6DC607F494
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 15:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6DC607F494
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HAO98/+K
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=om3kQmdx8ocf5lPZ0IJTMg5b7GxhDx8E4UJpudDVNNU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792424219; v=1; x=1793029019;
 b=HAO98/+KhWedi0dWq72rKefpLeTuoZBwD00kPi8B8/N9WEYN9nlAeSD7w42w6n9lpOwiM4mj
 GTwgauRKeKqLvp4eBB1i2xTc8ckrJDvyd3NNhOw9vbEZ9ub8smqiHUvk5FkAnWMBLq8iTy8vmR7
 imevZu0NBvgT8KmzMrPLkE+E=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9ad514df6fff4f7a;
	Mon, 19 Oct 2026 15:36:58 +0000
X-Mizu-Trace-ID: 9ad514df6fff4f7a
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
Subject: [PATCH bpf-next v2 2/6] bpf: Add syscall common attrs support for xdp link_create
Date: Mon, 19 Oct 2026 23:36:24 +0800
Message-ID: <20261019153628.15912-3-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019153628.15912-1-leon.hwang@linux.dev>
References: <20261019153628.15912-1-leon.hwang@linux.dev>
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

With the syscall common attrs support for link_create, add syscall common
attrs support for xdp link_create in order to report the invalid target
ifindex error and the underlying driver's error.

Define a stub bpf_log() when CONFIG_BPF_SYSCALL is not set. Afterwards,
bpf_log() can be called without CONFIG_BPF_SYSCALL guard in
net/core/dev.c.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 include/linux/bpf_verifier.h | 5 +++++
 include/linux/netdevice.h    | 3 ++-
 kernel/bpf/syscall.c         | 2 +-
 net/core/dev.c               | 7 ++++++-
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index de9845526ce0..0b8f764157fc 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1259,8 +1259,13 @@ __printf(2, 0) void bpf_verifier_vlog(struct bpf_verifier_log *log,
 				      const char *fmt, va_list args);
 __printf(2, 3) void bpf_verifier_log_write(struct bpf_verifier_env *env,
 					   const char *fmt, ...);
+#ifdef CONFIG_BPF_SYSCALL
 __printf(2, 3) void bpf_log(struct bpf_verifier_log *log,
 			    const char *fmt, ...);
+#else
+__printf(2, 3) static inline void bpf_log(struct bpf_verifier_log *log,
+					  const char *fmt, ...) {}
+#endif
 int bpf_vlog_init(struct bpf_verifier_log *log, u32 log_level,
 		  char __user *log_buf, u32 log_size);
 void bpf_vlog_reset(struct bpf_verifier_log *log, u64 new_pos);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 3cff2174dc03..4548b0fd824d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4417,7 +4417,8 @@ struct sk_buff *validate_xmit_skb_list(struct sk_buff *skb, struct net_device *d
 struct sk_buff *dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev,
 				    struct netdev_queue *txq, int *ret);
 
-int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog);
+int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog,
+			struct bpf_verifier_log *log);
 u8 dev_xdp_prog_count(struct net_device *dev);
 int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
 int dev_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 201658b75ab7..5652ecf21289 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -5942,7 +5942,7 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_a
 		break;
 #ifdef CONFIG_NET
 	case BPF_PROG_TYPE_XDP:
-		ret = bpf_xdp_link_attach(attr, prog);
+		ret = bpf_xdp_link_attach(attr, prog, log);
 		break;
 	case BPF_PROG_TYPE_SCHED_CLS:
 		if (attr->link_create.attach_type == BPF_TCX_INGRESS ||
diff --git a/net/core/dev.c b/net/core/dev.c
index 18dc88990510..96be63b9331e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -97,6 +97,7 @@
 #include <linux/kthread.h>
 #include <linux/bpf.h>
 #include <linux/bpf_trace.h>
+#include <linux/bpf_verifier.h>
 #include <net/net_namespace.h>
 #include <net/sock.h>
 #include <net/busy_poll.h>
@@ -10771,7 +10772,8 @@ static const struct bpf_link_ops bpf_xdp_link_lops = {
 	.update_prog = bpf_xdp_link_update,
 };
 
-int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
+int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog,
+			struct bpf_verifier_log *log)
 {
 	struct net *net = current->nsproxy->net_ns;
 	struct bpf_link_primer link_primer;
@@ -10784,6 +10786,7 @@ int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 	dev = dev_get_by_index(net, attr->link_create.target_ifindex);
 	if (!dev) {
 		rtnl_unlock();
+		bpf_log(log, "Invalid target_ifindex.\n");
 		return -EINVAL;
 	}
 
@@ -10812,6 +10815,8 @@ int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 	if (err) {
 		link->dev = NULL;
 		bpf_link_cleanup(&link_primer);
+		if (extack._msg)
+			bpf_log(log, "%s\n", extack._msg);
 		trace_bpf_xdp_link_attach_failed(extack._msg);
 		goto out_put_dev;
 	}
-- 
2.55.0

