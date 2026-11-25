Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617181;
	b=2uI0SOTbEH27fQdarOPLIWQ1P5I1VsNT7phT5kq/IpYz1/x0TVYo3Hqc4WBl6e7K8WNw
	 GBp/fxmXmHl/oK9FzxwilhLdyGy305G1f7fNW6gDiK6RrRXLYDOOkhY14xzIUDybBJTVh
	 8gIiQcIu4mzPauKlNyHhAcENS3YKc107veHRbpJIIdYtnFmH7oCmAsJyLkNQJSAhfO/tr
	 GkZ3Q48o6i6Dd9xkOQ+ktAnzjguWJXAE4cK7L6+YZLaILMllxrSnB2ySuQ6M4Z+lw+prn
	 klqFt6qixPQeO2022H0Q/1miKz88eGc9v3BnXv3OAbCCMp5b4nkZBS62A9+hZNIoXUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617181;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=512KT+dszHg+efwS3BYuJV7mtcBzhHtr0Z9hlCoHSL0=;
	b=M1EDrnBdpaOXV/JrREDL/QIVKn8prbJtTGXQERB5m92KkK+zXtjrX+reB1sIvLeZMZWd
	 gj/d6Cv/vw4V5eruyInJw1w9c1qqTjwYSCCagp2BDuQi9MidkQUvkmHPNqSTklKX0BLqu
	 2ocQ8+mXC9cLxCMptN+rbIAjmGL1TmqKfUNwTuX62mtPRwGSchfe4aqEp4UKRttzQVqnL
	 EwSjF64yMxsTyY+zF/GDM3Z3uclonps5MMxAeh3Gulw3Hyqq+p23GfgZOCJAE8Fww4//K
	 AilX8LzgN4g520JufwK5swQ0aQx30Z32fBpdNQJF85DdABccTcuINGsBD5023t02g/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FW5+uWxd;
	arc=none smtp.remote-ip=95.215.58.26
Received: from mta1.migadu.com (out-26.mta1.migadu.com [95.215.58.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D8606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 14:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287D8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FW5+uWxd
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z4IB+Ki3a8PjnrMq6MarlatYObpvI30K+1qs+OUo6t0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795617179; v=1; x=1796221979;
 b=FW5+uWxdIs+vo91DNV8wRdMW1ndH78gwe5LDKAgBEzL61M4+TLLjYsV2RZgdWAHROFHcvZWP
 YkTnbHYbtMGxiVxPI+7d1DbI6tIBQ1fTg82nJ28Ab8gPh4sfPVp0ApWwLPy+2/SfhmTZpWgdVjI
 SeWBPX8/ia9XFi7GK1wLJ/Vw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aba4313b7db095e1;
	Wed, 25 Nov 2026 14:32:59 +0000
X-Mizu-Trace-ID: aba4313b7db095e1
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
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
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next v4 5/6] libbpf: Add log_opts support for BPF_TRACE_ITER
Date: Wed, 25 Nov 2026 22:31:37 +0800
Message-ID: <20261125143138.47174-6-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125143138.47174-1-leon.hwang@linux.dev>
References: <20261125143138.47174-1-leon.hwang@linux.dev>
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

Add iter.info and iter.len to pass iterator information separately from
log_opts. Keep the existing iter_info and iter_info_len fields working
for callers that do not request logs.

Thereafter, log_opts can work for iter link_create.

Meanwhile, add log_opts support for bpf_program__attach_iter() API.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 tools/lib/bpf/bpf.c    | 23 +++++++++++++++++------
 tools/lib/bpf/bpf.h    |  8 ++++++++
 tools/lib/bpf/libbpf.c |  5 +++--
 tools/lib/bpf/libbpf.h |  3 ++-
 4 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
index 38dcb31e8c0e..ad6b356cc48c 100644
--- a/tools/lib/bpf/bpf.c
+++ b/tools/lib/bpf/bpf.c
@@ -808,11 +808,6 @@ int bpf_link_create(int prog_fd, int target_fd,
 	if (iter_info_len && attach_type != BPF_TRACE_ITER)
 		return libbpf_err(-EINVAL);
 
-	if (iter_info_len)
-		iter_info = OPTS_GET(opts, iter_info, (void *)0);
-	else
-		log_opts = OPTS_GET(opts, log_opts, (void *)0);
-
 	/* validate we don't have unexpected combinations of non-zero fields */
 	if (iter_info_len || target_btf_id) {
 		if (iter_info_len && target_btf_id)
@@ -821,6 +816,22 @@ int bpf_link_create(int prog_fd, int target_fd,
 			return libbpf_err(-EINVAL);
 	}
 
+	if (attach_type == BPF_TRACE_ITER) {
+		if (iter_info_len) {
+			iter_info = OPTS_GET(opts, iter_info, (void *)0);
+		} else {
+			log_opts = OPTS_GET(opts, log_opts, (void *)0);
+			iter_info = OPTS_GET(opts, iter.info, (void *)0);
+			iter_info_len = OPTS_GET(opts, iter.len, 0);
+			if (iter_info_len && target_btf_id)
+				return libbpf_err(-EINVAL);
+			if (!OPTS_ZEROED(opts, iter))
+				return libbpf_err(-EINVAL);
+		}
+	} else {
+		log_opts = OPTS_GET(opts, log_opts, (void *)0);
+	}
+
 	memset(&attr, 0, attr_sz);
 	attr.link_create.prog_fd = prog_fd;
 	attr.link_create.target_fd = target_fd;
@@ -970,7 +981,7 @@ int bpf_link_create(int prog_fd, int target_fd,
 			return libbpf_err(-EINVAL);
 		break;
 	default:
-		if (!OPTS_ZEROED(opts, iter_info_len))
+		if (!OPTS_ZEROED(opts, log_opts))
 			return libbpf_err(-EINVAL);
 		break;
 	}
diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
index fe3b7fd8512b..2ac143fd1102 100644
--- a/tools/lib/bpf/bpf.h
+++ b/tools/lib/bpf/bpf.h
@@ -422,6 +422,10 @@ union bpf_iter_link_info; /* defined in up-to-date linux/bpf.h */
 struct bpf_link_create_opts {
 	size_t sz; /* size of this struct for forward/backward compatibility */
 	__u32 flags;
+	/*
+	 * iter_info and iter_info_len are deprecated, use iter.info and
+	 * iter.len instead.
+	 */
 	union {
 		union bpf_iter_link_info *iter_info;
 		struct bpf_log_opts *log_opts;
@@ -478,6 +482,10 @@ struct bpf_link_create_opts {
 			const __u64 *cookies;
 			__u32 cnt;
 		} tracing_multi;
+		struct {
+			union bpf_iter_link_info *info;
+			__u32 len;
+		} iter;
 	};
 	size_t :0;
 };
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 1efc0dd37b2e..612eba0ff4f0 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -14813,8 +14813,9 @@ bpf_program__attach_iter(const struct bpf_program *prog,
 	if (!OPTS_VALID(opts, bpf_iter_attach_opts))
 		return libbpf_err_ptr(-EINVAL);
 
-	link_create_opts.iter_info = OPTS_GET(opts, link_info, (void *)0);
-	link_create_opts.iter_info_len = OPTS_GET(opts, link_info_len, 0);
+	link_create_opts.log_opts = OPTS_GET(opts, log_opts, (void *)0);
+	link_create_opts.iter.info = OPTS_GET(opts, link_info, (void *)0);
+	link_create_opts.iter.len = OPTS_GET(opts, link_info_len, 0);
 
 	prog_fd = bpf_program__fd(prog);
 	if (prog_fd < 0) {
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 49f1120f4021..56300be81016 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -1000,8 +1000,9 @@ struct bpf_iter_attach_opts {
 	size_t sz; /* size of this struct for forward/backward compatibility */
 	union bpf_iter_link_info *link_info;
 	__u32 link_info_len;
+	struct bpf_log_opts *log_opts;
 };
-#define bpf_iter_attach_opts__last_field link_info_len
+#define bpf_iter_attach_opts__last_field log_opts
 
 LIBBPF_API struct bpf_link *
 bpf_program__attach_iter(const struct bpf_program *prog,
-- 
2.55.0

