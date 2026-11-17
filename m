Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918272;
	b=jukLKAutq5zu0WfvcAAs339eMX15KxbKbPcN0tNffIAFtIDaYhQFgwSknpDmoW3gFAKk
	 O+d8ksqDmkTublor5KysVLcM6p01AMFV9XQVGHQwxZ8uC0U0TjPOSbaViILR/3JJSKJzD
	 Vk9BiWGyxIzUFNHJdKNdBXRA1hmPEE1D8cz/958nbE+KpSBlrq/vPTjP1mrQjgkAnHDsm
	 sgNuF2XkAGjxHr6BKFGViK0XPOUerOj3xqnjk414Q4lnmu25zOw60+oCjzRoToEcW5Xll
	 zUg27zY0jWBKaK/JYR/4Uih7rYwkxwXNmKGsew10pq2WjHkcXxfO9BcssG90BBiaXSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918272;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DCpu+Hq5xQeJszgIeoHmZoIg86kcDoEMxUxHmN2abjs=;
	b=3EfFGi8L166UGrocQvNUqSZ1Q08FJMoELrxz0lgDqaSxa1NoLq8juorcqc+1Z6Vvcjqe
	 VwEVGT04w1xNbVBtueZDNj4rx9OZymPULgUIQzSd1Z+2AuSx89tcqiqtrR/toNakN8Pf6
	 bWHrDoFOv9XWMypIFjYp7oTyAre1WOqZy6TL8F+1mah4AmrS4PsVYVsF/+kXjiD2RcFzF
	 x/MMx2Oq/j+K7lrvm18OmCQ9EpZFLYqDLbADhbBiLsxcJJ5RSwsDixfdYhy0yFJiLz1bD
	 Bx49vXncrrrOXufrqtzsF5kxgEc9V41mkYD8yvKRvNHGvVpt3TfAGBDnLkHUhjQ2qgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ugVJQVtE;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB20606A329
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 12:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB20606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ugVJQVtE
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3vM0O1dJswiN9N8gqBgAgWRmPD44k2JkjuKN6dhc+5s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794918269; v=1; x=1795523069;
 b=ugVJQVtEFegxsdAPplHrLvIIMoLGDHtWyhnX6a7Ry7Hl/47jxjo4G8h/ItdzXkqbEhhLYSdZ
 hzWVSncUUtM4pm8ye0UyxQHwIO9gf8cNXyJ15GxFKsxjg98MT6DWzuN+WmmRAyA6VtvZ6gAvp6u
 hBEY7xESuScRyr/ZvKW4Aw8E=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 953c64e80f13473e;
	Tue, 17 Nov 2026 12:24:29 +0000
X-Mizu-Trace-ID: 953c64e80f13473e
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	ast@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
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
	Shuah Khan <shuah@kernel.org>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Michal Luczaj <mhal@rbox.co>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf v2] selftests/bpf: Fix bpf-gcc CO-RE relocation in verifier_sockmap_mutate
Date: Tue, 17 Nov 2026 20:24:13 +0800
Message-ID: <20261117122417.340562-1-jiayuan.chen@linux.dev>
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

bpf-gcc fails to load test_trace_iter_unix:

  Error: #766/6 verifier_sockmap_mutate/test_trace_iter_unix
  libbpf: elf: skipping section(3) .data (size 0)
  libbpf: elf: skipping unrecognized data section(18) .comment
  run_subtest:PASS:obj_open_mem 0 nsec
  libbpf: prog 'test_trace_iter_unix': relo #0: insn #0 (LDX/ST/STX) accesses field incorrectly. ...
  libbpf: prog 'test_trace_iter_unix': BPF program load failed: -EINVAL
  libbpf: prog 'test_trace_iter_unix': failed to load: -EINVAL
  libbpf: failed to load object 'verifier_sockmap_mutate'
  run_subtest:PASS:unexpected_load_success 0 nsec
  validate_msgs:FAIL:1014 expect_msg
  VERIFIER LOG:
  =============
  0: R1=ctx() R10=fp0
  ;  @ verifier_sockmap_mutate.c:124
  0: <invalid CO-RE relocation>
  failed to resolve CO-RE relocation <byte_off> [4] struct bpf_iter__unix (0:0 @ offset 0)
  processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
  =============
  EXPECTED   SUBSTR: 'cannot update sockmap in this context'

GCC only applies preserve_access_index to types that carry the attribute
themselves. The anonymous union holding the sock pointer doesn't, so the
CO-RE access stops at the union ("0:0") instead of reaching the pointer
("0:0:0"), and libbpf rejects the relocation.

Fixes: e16c83fa764f ("selftests/bpf: Add negative test for sockmap update from non-sockmap iter")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v1 : https://lore.kernel.org/bpf/20261117094544.148437-1-jiayuan.chen@linux.dev/
---
 .../selftests/bpf/progs/verifier_sockmap_mutate.c     | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
index 1516fe1524bb..0dbbc5ad1de9 100644
--- a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
+++ b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
@@ -10,19 +10,12 @@
 
 char _license[] SEC("license") = "GPL";
 
-struct sock {
-} __attribute__((preserve_access_index));
-
 struct bpf_iter__sockmap {
-	union {
-		struct sock *sk;
-	};
+	struct sock *sk;
 } __attribute__((preserve_access_index));
 
 struct bpf_iter__unix {
-	union {
-		struct sock *unix_sk;
-	};
+	struct sock *unix_sk;
 } __attribute__((preserve_access_index));
 
 struct {
-- 
2.43.0

