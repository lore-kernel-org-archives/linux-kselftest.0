Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424214;
	b=RJeHl+/XtWbEWUlrqIJfjDiJTxVdoH+y0+uumSOBfvWiVJ+0y6agVEaWZhCEI1Ss5I+3
	 1mZkcZdM/+KK14Wnfs5jWjtvH4qMeXrh2tsJaWPAoNRqTrXPEvZzYnNpdEOAi3IE4TFDc
	 LXWNA609KaIpMxobCGpN6pDdLvfZq2t+g2OnC97qPLMaloFm8OT1qztIEjKmxtCV6pV6O
	 0giFZjtidfYamcoeZHuDmkOatMcJB0gI3DplILqPdnSKQv37L6h5Lz8P9xgKfgP6i0mk7
	 977rKp+r1BVM3qhjzgT3ZP8DkH6XC+4xplkHfXey0W/r8m7Adax2beROBEg3vv31dmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424214;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2TOlM7Zam8iCSrF5TlyT56N7qaCsZjpz1FbBQjhXWZU=;
	b=IOCR1YyeSUm3C06EA0XJRw4JfwCJf9LIBKuDw3ZO9Ed7jA0xHab1EYzSMhXBvdbFyanV
	 YSHXrPbswPuuxq0HJN3O/EO+lALyByxFQhKQYatI10YmfjqqXHCGarVfHTqwIu3BURr+q
	 BM7cTzhBQj25Qfm6l/RIXQtwrj9w79lWRxTuSyD6FHHIR6/w8De/ZE2apjn80y0NPd0i2
	 IZY28aJn7x4XnNJYZDH7jcYDzlHaVODO9I7KTXy6OW2IGN4m56yKPxnWbxcWNNWcwrcs2
	 NXSgdOCxbLHX0sbs1MqsHFMK+TiGCjCWcdHHOyAXC2G6NUEvAECBTMWkB0K/k6uDdPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IQxD8w01;
	arc=none smtp.remote-ip=95.215.58.46
Received: from mta1.migadu.com (out-46.mta1.migadu.com [95.215.58.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF2607BF3C
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 15:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FF2607BF3C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IQxD8w01
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z8sn3Jb9Rx9etHR8e9J4eaey47nS/rKz0BkiJpGOQT0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792424211; v=1; x=1793029011;
 b=IQxD8w01S6enPkLaeXQ1RGk9GmQPZAqiMugPEsluQnkScXqfJVVOULxjso+aJdOod0UlS6RW
 xjc5Eo721Lhy8pvnlw1w2IusTWNGfTbBtPB51eodMgOg475H01Tko6ne8YN8GCOH+E4YiEcff/f
 lQ4W+0csWSmQp6fB9mAG/ksQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 785057b007789682;
	Mon, 19 Oct 2026 15:36:50 +0000
X-Mizu-Trace-ID: 785057b007789682
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
Subject: [PATCH bpf-next v2 1/6] bpf: Add syscall common attrs support for link_create
Date: Mon, 19 Oct 2026 23:36:23 +0800
Message-ID: <20261019153628.15912-2-leon.hwang@linux.dev>
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

Similar to the syscall common attrs support for map_create [1], add the
syscall common attrs support for link_create.

Create and finalize the internal verifier log instance.

Then, report the error messages for invalid prog fd, invalid attach type,
and invalid prog type.

Links:
[1] https://lore.kernel.org/bpf/20260514004634.3DA09C19425@smtp.kernel.org/

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 include/linux/bpf_verifier.h |  1 +
 kernel/bpf/log.c             | 19 +++++++++++-------
 kernel/bpf/syscall.c         | 39 ++++++++++++++++++++++++++++++------
 3 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 951a90458d18..de9845526ce0 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -896,6 +896,7 @@ struct bpf_verifier_log *bpf_log_attr_create_vlog(struct bpf_log_attr *attr_log,
 						  struct bpf_common_attr *common, bpfptr_t uattr,
 						  u32 size);
 int bpf_log_attr_finalize(struct bpf_log_attr *attr, struct bpf_verifier_log *log);
+int bpf_log_attr_report_size(struct bpf_log_attr *attr, u32 size);
 
 #define BPF_MAX_SUBPROGS 256
 
diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
index 5432c0fc442b..2bcd62d9ad88 100644
--- a/kernel/bpf/log.c
+++ b/kernel/bpf/log.c
@@ -884,17 +884,22 @@ struct bpf_verifier_log *bpf_log_attr_create_vlog(struct bpf_log_attr *attr_log,
 	return log;
 }
 
+int bpf_log_attr_report_size(struct bpf_log_attr *attr, u32 size)
+{
+	if (attr->offsetof_true_size &&
+	    copy_to_bpfptr_offset(attr->uattr, attr->offsetof_true_size, &size, sizeof(size)))
+		return -EFAULT;
+
+	return 0;
+}
+
 int bpf_log_attr_finalize(struct bpf_log_attr *attr, struct bpf_verifier_log *log)
 {
 	u32 log_true_size;
-	int err;
+	int err, ret;
 
 	err = bpf_vlog_finalize(log, &log_true_size);
 
-	if (attr->offsetof_true_size &&
-	    copy_to_bpfptr_offset(attr->uattr, attr->offsetof_true_size, &log_true_size,
-				  sizeof(log_true_size)))
-		return -EFAULT;
-
-	return err;
+	ret = bpf_log_attr_report_size(attr, log_true_size);
+	return ret ? ret : err;
 }
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 849bc9136299..201658b75ab7 100644
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
 
@@ -5867,14 +5870,28 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
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
+
+	ret = bpf_log_attr_report_size(&attr_log, 0);
+	if (ret)
+		goto put_prog;
 
 	switch (prog->type) {
 	case BPF_PROG_TYPE_CGROUP_SKB:
@@ -5953,12 +5970,22 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
 			ret = bpf_uprobe_multi_link_attach(attr, prog);
 		break;
 	default:
+		bpf_log(log, "Invalid prog type.\n");
 		ret = -EINVAL;
 	}
 
 out:
-	if (ret < 0)
+	if (ret < 0) {
+		int err = bpf_log_attr_finalize(&attr_log, log);
+
+		ret = err ? err : ret;
+	}
+
+put_prog:
+	if (ret < 0 && prog)
 		bpf_prog_put(prog);
+
+	kfree(log);
 	return ret;
 }
 
@@ -6530,7 +6557,7 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int size,
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

