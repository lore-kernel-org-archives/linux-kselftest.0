Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908760;
	b=vo4oheZ272+g/CBpJD48qqpwaB2js05MThhWEjAQNr4tG+aBiCirb+HxFARZNVy6mLkG
	 m+iqUplODww78uRcbXVVq3znboQYdaVG6ECLwGNJ97XlPyxsgIOa40FMHZdngeIUwh33i
	 m13NgxVOPZetT8KD73MZaDy0v1/bl8UEV/xtwpIZqqpPW0ur6yUex1dz16eJkol9SuUl6
	 F1tUPU2fRrfXqHg5ZyKhwuT0hIbtYKiUM3SYnjqahjPizLbsS6DVTTOmLCxKbDcjqtn/w
	 3ahBXlI1eO8c/xaC4Pr+XGuXJaT971h3f4sDaWXllJhzGSqao7Y+/6Q1JQR4q8BDtQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908760;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AQAqYl2tn6009DL8HqBJOMfPKmQERaYIFx8LZttnag8=;
	b=wJc9d9BE8I2rPYDc20bvoeIu2tckjW9NwFW1d8uqsy819dm22dcX5lwfDL7LpzJgguex
	 Wwk+VOcxNgg5AFyZ/DPSvae/ieMuZ+kFZQM/TECH9ki5t4YTfWSexORkhSLkdFB0xIRwX
	 XBjXibqEpSJXv0NRDe1ZzrGB6gyjQilrl96N3HtMP4UILQl/nC5IWBFBU+W+M9Lw8iJ3J
	 fxWTefEHSI/G9czCVmLWgDgdtKSmpZ2EjaPOL2+0ylG02j/QWae4f4DzZke8Boz9cBZD/
	 +TwEGARsmHVYIuTt7jnpjUKz/4aauzZUNcLxa+mznTXezJXX0vPy51VPHik8VIapRqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sK++JJdW;
	arc=none smtp.remote-ip=95.215.58.214
Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA0606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 09:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9EA0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sK++JJdW
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eNKitI6OumQU1ILYmuf2OVKQGpBdNX+qex8fxTVDt9Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794908758; v=1; x=1795513558;
 b=sK++JJdWVLVl0CCpvK0ISou9FM6hepE/mJvPI1cJ0sZhOfrLeOEwH7mqYVDW1w4oevDhrxNe
 E31HXe1kSDO5PtBNsO6aW1okDo/009j7UnzjMM6wT1D+u3+m0MUTtph+ZIFLDZuHLJToIbvgtzT
 lDtVeq/ezpYzoBFYU9cmRV4I=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dac5996b5fb42819;
	Tue, 17 Nov 2026 09:45:57 +0000
X-Mizu-Trace-ID: dac5996b5fb42819
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
	John Fastabend <john.fastabend@gmail.com>,
	Michal Luczaj <mhal@rbox.co>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf v1] selftests/bpf: Fix CO-RE relocation of anonymous unions for bpf-gcc
Date: Tue, 17 Nov 2026 17:45:38 +0800
Message-ID: <20261117094544.148437-1-jiayuan.chen@linux.dev>
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
("0:0:0"), and libbpf rejects the relocation. Mark the unions too.

Fixes: e16c83fa764f ("selftests/bpf: Add negative test for sockmap update from non-sockmap iter")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
index 1516fe1524bb..68b1a5323470 100644
--- a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
+++ b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
@@ -16,13 +16,13 @@ struct sock {
 struct bpf_iter__sockmap {
 	union {
 		struct sock *sk;
-	};
+	} __attribute__((preserve_access_index));
 } __attribute__((preserve_access_index));
 
 struct bpf_iter__unix {
 	union {
 		struct sock *unix_sk;
-	};
+	} __attribute__((preserve_access_index));
 } __attribute__((preserve_access_index));
 
 struct {
-- 
2.43.0

