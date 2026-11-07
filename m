Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074383;
	b=SIEuKauc5XoGr+v8Nk69GQiNLx83ZAqyLVbPt+2ETyLO7M+jkuHiXpGlkOadtrWmWE9P
	 8XhNjHsZL9aC/hvMrd6JaPxEJPECf3/ojpPyS9XPCS17A2XWrDSjnblgipvvryoN7Y/Mc
	 /bU5Tr4KMq4H/a51d2fEUK+zMo1SrNuQ1Z+JBTrgvAeLFYjWdvxYII839DKkUsFXspnwx
	 d+7mZZT5qc95zN9ck/4QKbm+Bq9E2eQkPSDGLVZIDBekhSPZu8KkeLNivZ3Ia4xv6A7NX
	 7VmfAjyJbydhskvnor7NJwurh8M+/sclFW02FQOgSrncKFnBCacVqK+d9k++arBfa5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074383;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZddAGYbDrtSr+CZdnQE/HLJuPzfHd++uOjWgRuABxX0=;
	b=D2JcurXxD1TPt+3r/mzJIfy0T7uub/bkcbBv2lp0MJ4F+rLVhZDVyjmNyrS5HIJWZyfv
	 tKwyI3zrNRowWJqP0R1P+4nXt2Gs/EtCrtc/rV1Fzo3izlQK33NR/FVf9FrO4mWRrDS6b
	 U2Z0zlrL5MkTYW3opaY9efuE7rw/aU6ggX38q4ECnt8jl7VOL+cFpLZeCkqNbwSFT79hJ
	 4bzmRpW6TIi5RqWEZ2nhTSPzahXLpyJNSiPeiEnQMZx7w++9NgXv6jz4ByR8tB+G1rL87
	 PMr9n8NIZ4lgWKW0QQvvIGk8k7khqs81zofGf925eUbfAepGIIjxQHtK5i+nAnN0dFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rbox.co;
	spf=pass smtp.mailfrom=rbox.co;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24E6606A32D;
	Sat,  7 Nov 2026 17:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24E6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xPkhN-007j5s-Lz; Sat, 07 Nov 2026 18:59:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From;
	bh=ZddAGYbDrtSr+CZdnQE/HLJuPzfHd++uOjWgRuABxX0=; b=XSqh9EilYmJJTJX9/aMObcVdwM
	Lbb6L5s5cCzVXLwEWNOSm3cYJ8Lm1c/4oDiCVTgBvPiPmlHHUWqouBfDa0n3OJXoIQuWwMxb5nrfe
	GXOGUFjr6boTr3DdcRSqb36LVX6OX/LcK55eTMgPITwflp9Ps4jo8+wK+6mAubfTxPNUWIX/uxkeR
	m3DrwkaNpb5dGqs0VwqZqnPSclxfGjjJVV4OvTDZcuBcuyAo2qIOviPwf/MBxkY9r+UL8Gpr8Ktym
	FxDp1+5FaevypkLqjEYZXYwubCjAy8jj0ksnOIxPndvwo+8g2HIFQIUqbIc3PwqoEZTltZ/sfTYuC
	o7IVq1Qw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xPkhD-0006b3-0W; Sat, 07 Nov 2026 18:59:19 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xPkh0-007LnK-Dn;
	Sat, 07 Nov 2026 18:59:06 +0100
From: Michal Luczaj <mhal@rbox.co>
Date: Sat, 07 Nov 2026 18:58:23 +0100
Subject: [PATCH bpf-next v3 1/8] selftests/bpf: Remove sockmap update from
 bpf_iter_unix
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-sockmap-update-limit-iter-v3-1-7c0bad1ad036@rbox.co>
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Jakub Sitnicki <jakub@cloudflare.com>, 
 Jiayuan Chen <jiayuan.chen@linux.dev>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Stanislav Fomichev <sdf@fomichev.me>
Cc: Michal Luczaj <mhal@rbox.co>, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

BPF iterator programs that can update sockmaps will be limited to
iter/sockmap. Remove the update from the unix selftest.

This reverts commit 997b8483d44c ("selftests/bpf: Extend bpf_iter_unix to
attempt deadlocking").

Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
 tools/testing/selftests/bpf/progs/bpf_iter_unix.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_unix.c b/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
index 3061b148f338..90beada0386d 100644
--- a/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
+++ b/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
@@ -7,13 +7,6 @@
 
 char _license[] SEC("license") = "GPL";
 
-SEC(".maps") struct {
-	__uint(type, BPF_MAP_TYPE_SOCKMAP);
-	__uint(max_entries, 1);
-	__type(key, __u32);
-	__type(value, __u64);
-} sockmap;
-
 static long sock_i_ino(const struct sock *sk)
 {
 	const struct socket *sk_socket = sk->sk_socket;
@@ -82,8 +75,5 @@ int dump_unix(struct bpf_iter__unix *ctx)
 
 	BPF_SEQ_PRINTF(seq, "\n");
 
-	/* Test for deadlock. */
-	bpf_map_update_elem(&sockmap, &(int){0}, sk, 0);
-
 	return 0;
 }

-- 
2.56.0

