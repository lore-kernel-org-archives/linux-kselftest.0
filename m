Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590223;
	b=0LpIQ3lJkzYr9hjZVLOQkH9bWqTXEva4A4biMJuZQMPBdMOir9LisiM0SaOwfTuzFDGj
	 HhOVnK6P9zCh+QDR4gA/vWBJu8lIHci8z/v6AjG134yQ1jxRoe0TRhzMpYuTqaLrEpzYX
	 X9N2b871RXLvvr0hTPCazLa83KVJKsaQsV1AO/1rGoTB7vfZLcR/Hit1v0ejFXLGbEeyB
	 WYPHfdg94FcDodgzbSJkHHEYqFRIT+ZeFRD1S2usEDFtNQvbX608jtpGTX5X0t1gfo+MT
	 8+QkJkSXxGW24lVs5VzG74tR/BxDOtrYHPzqUh+dfeacvAespQJUSmKci7dG/mAai9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590223;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UQC/K0jJ85LGO+otAnkAPpagW90dChlO7NHeMGClZuc=;
	b=3rihWYan7hSHoxxGxAUJLXJUPuTeQM6Q2LZUpRVxS8AqgzmGSbrTsJV9Q1UluADqm6I8
	 gZOz3InJHIL/cb2D96rxNb6NaYLvaSNMND6ezg2LVxanBoqc/AjWgzrJA984LRJ5x2GJy
	 MNSxQ6kmmqrj5VNsUMOs0WMLEC5BQ0bgPnkwsKp1dD5OR6kILVcajMNuGEeluxooY9W+0
	 qdhrSlDvg+ZtCkzIWcOz85Nz3DmVETQr/elPjOVyNnL+jYmD4NjY8Ld7iazgPVyH8XKSQ
	 HvK6H/LMgO04zdBKP0iTAGRwRDv9rwvpFhbRXv6Ho2aa68fZ2gwPcAckU5eC0KSFxlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dSnKZM7S;
	arc=none smtp.remote-ip=91.218.175.238
Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2405E606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 07:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2405E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dSnKZM7S
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pDXq/bQPSOMDN96qcxBcP6kE+pu/jJa6f6lXStcnJfo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795590220; v=1; x=1796195020;
 b=dSnKZM7S8pcgEUSfUaqX9x15qUN3wIbkER/KukO0s2FTP+/MO1UcyZOSVRu7/OLdtFA7S4gc
 ANK7XVXyWfaEo4zj5fSLCcZhAYu6bzDjZjon5r+EGj+qCRzWwsCPAOtsMOOLlfiR6RedeztVARM
 9TQ2Xar9lPEXUVxUsdb0ZgKg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 54d1b2241158fd04;
	Wed, 25 Nov 2026 07:03:39 +0000
X-Mizu-Trace-ID: 54d1b2241158fd04
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
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
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Xu Kuohai <xukuohai@huawei.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v2 1/2] bpf, lsm: fix bpf_setsockopt() on a half set up child in inet_csk_clone
Date: Wed, 25 Nov 2026 15:03:21 +0800
Message-ID: <20261125070330.16625-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

security_inet_csk_clone() is called at the end of inet_csk_clone_lock().
The child is locked, which is why the hook is in
bpf_lsm_locked_sockopt_hooks, but it is not set up yet:
icsk->icsk_ca_ops and the ipv6_pinfo still point to the ones of the
listener, and the timers are not initialized.

So bpf_setsockopt() from a lsm_cgroup prog is wrong there for:

 - TCP_CONGESTION: puts icsk->icsk_ca_ops, which the child holds no
   reference on.
 - IPV6_TCLASS: writes to the ipv6_pinfo of the listener.
 - SO_KEEPALIVE, TCP_KEEPIDLE: arm the keepalive timer before
   tcp_init_xmit_timers() sets it up.

Options considered:
 1. Remove the hook from bpf_lsm_locked_sockopt_hooks, as commit
    5416c9aea832 ("bpf: Fix the kernel crash caused by bpf_setsockopt().")
    did for socket_sock_rcv_skb. Not done, setting options like
    SO_PRIORITY on the child is what the hook is used for and it works.
 2. Make these options work. This needs the child set up before the
    hook, too much for a fix.

So give the hook its own bpf_setsockopt() and return -EOPNOTSUPP for
these options there. bpf_getsockopt() is left as is.

For example, SO_KEEPALIVE ends up with:

  Oops: general protection fault, probably for non-canonical address 0xfbd59c0000000025: 0000 [#1] SMP KASAN PTI
  KASAN: maybe wild-memory-access in range [0xdead000000000128-0xdead00000000012f]
  RIP: 0010:__run_timers+0x5d2/0xab0
  Call Trace:
   <IRQ>
   run_timer_base+0x107/0x190
   run_timer_softirq+0x1a/0x40
   handle_softirqs+0x251/0xa70
   __irq_exit_rcu+0x1a8/0x260
   irq_exit_rcu+0xe/0x30
   sysvec_apic_timer_interrupt+0xc2/0x110
   </IRQ>

Fixes: 9113d7e48e91 ("bpf: expose bpf_{g,s}etsockopt to lsm cgroup")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v1 -> v2 : fix some issues reported by AI.
---
 include/linux/bpf.h  |  1 +
 kernel/bpf/bpf_lsm.c | 13 +++++++++++++
 net/core/filter.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 1dd9db16f324..207a3be3138d 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -4159,6 +4159,7 @@ extern const struct bpf_func_proto bpf_task_storage_delete_proto;
 extern const struct bpf_func_proto bpf_for_each_map_elem_proto;
 extern const struct bpf_func_proto bpf_btf_find_by_name_kind_proto;
 extern const struct bpf_func_proto bpf_sk_setsockopt_proto;
+extern const struct bpf_func_proto bpf_sk_clone_setsockopt_proto;
 extern const struct bpf_func_proto bpf_sk_getsockopt_proto;
 extern const struct bpf_func_proto bpf_sk_setsockopt_nodelay_proto;
 extern const struct bpf_func_proto bpf_unlocked_sk_setsockopt_proto;
diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index ae23511fd811..bec940efd354 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -79,6 +79,16 @@ BTF_ID(func, bpf_lsm_inet_conn_established)
 #endif
 BTF_SET_END(bpf_lsm_locked_sockopt_hooks)
 
+/*
+ * List of LSM hooks that trigger on a locked child socket which is not
+ * set up yet, bpf_setsockopt is restricted there.
+ */
+BTF_SET_START(bpf_lsm_clone_sockopt_hooks)
+#ifdef CONFIG_SECURITY_NETWORK
+BTF_ID(func, bpf_lsm_inet_csk_clone)
+#endif
+BTF_SET_END(bpf_lsm_clone_sockopt_hooks)
+
 /* List of LSM hooks that trigger while the socket is _not_ locked,
  * but it's ok to call bpf_{g,s}etsockopt because the socket is still
  * in the early init phase.
@@ -282,6 +292,9 @@ bpf_lsm_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 	case BPF_FUNC_setsockopt:
 		if (prog->expected_attach_type != BPF_LSM_CGROUP)
 			return NULL;
+		if (btf_id_set_contains(&bpf_lsm_clone_sockopt_hooks,
+					prog->aux->attach_btf_id))
+			return &bpf_sk_clone_setsockopt_proto;
 		if (btf_id_set_contains(&bpf_lsm_locked_sockopt_hooks,
 					prog->aux->attach_btf_id))
 			return &bpf_sk_setsockopt_proto;
diff --git a/net/core/filter.c b/net/core/filter.c
index 53c042b267ab..f17b3c5dd473 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -5938,6 +5938,48 @@ const struct bpf_func_proto bpf_sk_setsockopt_proto = {
 	.arg5_type	= ARG_MEM_SIZE,
 };
 
+/*
+ * security_inet_csk_clone() runs at the end of inet_csk_clone_lock(), the
+ * child is locked but not set up yet: its timers are not initialized, it
+ * holds no reference on icsk_ca_ops, an IPv6 child still points to the
+ * ipv6_pinfo of the listener and a MPTCP subflow has no msk.
+ */
+BPF_CALL_5(bpf_sk_clone_setsockopt, struct sock *, sk, int, level,
+	   int, optname, char *, optval, int, optlen)
+{
+	bool mptcp = sk_fullsock(sk) && sk_is_tcp(sk) && sk_is_mptcp(sk);
+
+	switch (level) {
+	case SOL_SOCKET:
+		if (optname == SO_KEEPALIVE ||
+		    (optname == SO_SNDBUF && mptcp))
+			return -EOPNOTSUPP;
+		break;
+	case SOL_TCP:
+		if (optname == TCP_KEEPIDLE || optname == TCP_CONGESTION ||
+		    (optname == TCP_NOTSENT_LOWAT && mptcp))
+			return -EOPNOTSUPP;
+		break;
+	case SOL_IPV6:
+		if (optname == IPV6_TCLASS)
+			return -EOPNOTSUPP;
+		break;
+	}
+
+	return _bpf_setsockopt(sk, level, optname, optval, optlen);
+}
+
+const struct bpf_func_proto bpf_sk_clone_setsockopt_proto = {
+	.func		= bpf_sk_clone_setsockopt,
+	.gpl_only	= false,
+	.ret_type	= RET_INTEGER,
+	.arg1_type	= ARG_PTR_TO_BTF_ID_SOCK_COMMON,
+	.arg2_type	= ARG_ANYTHING,
+	.arg3_type	= ARG_ANYTHING,
+	.arg4_type	= ARG_PTR_TO_MEM | MEM_RDONLY,
+	.arg5_type	= ARG_MEM_SIZE,
+};
+
 BPF_CALL_5(bpf_sk_getsockopt, struct sock *, sk, int, level,
 	   int, optname, char *, optval, int, optlen)
 {
-- 
2.43.0

