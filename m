Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074383;
	b=gHCGNpYyLGcrWFUWbss1GVIoE6e8rgiqGdjTPRNZzT0VLxOUjyS7hlFDqK54RHgx1CBU
	 zYNWIGg9oAkUd8PlVYbEoERHvL8Rwsra+BX5E1i59KgPSurIy63B6gXL1He9zfpSKKDa3
	 lMz5G1Fo0HM33u+vKdgKIlcyJAkkhl3jfCDjcCRp2xcRVBvYTTav4TF8AOqbuAB3SlI5e
	 SWrz5k2+9fl/wl9jqHTcGydZ4V8eHqob3PzF3oy8w3yVjTNxjAyQ+v2qDPXlsYsaf79sk
	 EI4tcE4K2jrclxERcv3az+YFpYFmbUnATVOXLI9nNDVhLmhq2tiCTa2BInwxPMe2/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074383;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mYH1R7Aw1iVn3adjIX8WOzgpUmMHsc4YqOxn33DMKdI=;
	b=MIDryXG6lTLVSpFKCObd7tJ8GvlxTuPOUJdRCtkNlvgxSkdNktXsBKsNF1VfvvWlROSw
	 TQViU+9aaHdv9DW7lT0UMVANikOlPtfhdlW3I9KoIsEQUcSaLtoxmLK43J/e6q639F36t
	 UQXBYGZmCvs1J/Az1iU9dG60iPG982T/H22tYqTZCtOBF4myY61fqIEHyIuVRvan/x5Vy
	 CshvmDBTok4NXYDrkyHLU5XWHZ9JWH7QRMdD4TaGwbhGo1JjWUpDE/9E10Iy0En2AFuY1
	 C8D1txlP10MyuADCHSRQcvVHiheuxpwUYhQr4WyZQMTfQe8O3tY0Lfb9YGbfLjMACFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rbox.co;
	spf=pass smtp.mailfrom=rbox.co;
	dkim=pass header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=ApioPmNb;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26BE606A32F;
	Sat,  7 Nov 2026 17:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=ApioPmNb
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xPkhN-007j5j-AS; Sat, 07 Nov 2026 18:59:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From;
	bh=mYH1R7Aw1iVn3adjIX8WOzgpUmMHsc4YqOxn33DMKdI=; b=ApioPmNb4g0URfQcNo+bHmOHqK
	lTCpz72XYQOXsE8r37ukCxxZ4ct+0WxzIa4l00p+FMV/HJL8SiVqkyr/c/Fhwg6MoDLA8xmdJgHqs
	CX2Z7ubgIt1YCHwDT2M+n5A19z2aLGCnBS3FG0OhL/t68ExBOyWnq/tFFhBey0b298x39vlMdFml9
	3VxLa23xI+dNwM9Vjboi9zM1sy+ZJYFp0v3ZYCD5kjRnaGn5TBWZ/Uq6F90pJT+bxFEZW/l3cGHtp
	5i4D+qUGhYfc0qz03AFQUrrk6KZ3iFHcRIZGqic9cWP8Da+UVZzyQ9U4MbuRzJxTyKmwsPDlak+3J
	KmWPG5TA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xPkhB-0006ar-Ri; Sat, 07 Nov 2026 18:59:18 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xPkh9-007LnK-Hh;
	Sat, 07 Nov 2026 18:59:15 +0100
From: Michal Luczaj <mhal@rbox.co>
Date: Sat, 07 Nov 2026 18:58:29 +0100
Subject: [PATCH bpf-next v3 7/8] selftests/bpf: Add iter/sockmap
 bpf_sock_destroy() negative test
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
Message-Id: <20261107-sockmap-update-limit-iter-v3-7-7c0bad1ad036@rbox.co>
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

bpf_sock_destroy() is restricted to socket-locked iters, TCP and UDP.
Fail attempting it from iter/sockmap.

Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
 tools/testing/selftests/bpf/progs/sock_destroy_prog_fail.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/sock_destroy_prog_fail.c b/tools/testing/selftests/bpf/progs/sock_destroy_prog_fail.c
index dd6850b58e25..7b9f5779a184 100644
--- a/tools/testing/selftests/bpf/progs/sock_destroy_prog_fail.c
+++ b/tools/testing/selftests/bpf/progs/sock_destroy_prog_fail.c
@@ -20,3 +20,14 @@ int BPF_PROG(trace_tcp_destroy_sock, struct sock *sk)
 	return 0;
 }
 
+SEC("iter/sockmap")
+__failure __msg("calling kernel function bpf_sock_destroy is not allowed")
+int iter_sockmap_destroy(struct bpf_iter__sockmap *ctx)
+{
+	struct sock *sk = ctx->sk;
+
+	if (sk)
+		bpf_sock_destroy((struct sock_common *)sk);
+
+	return 0;
+}

-- 
2.56.0

