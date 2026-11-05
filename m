Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896625;
	b=m3CXMwQnjlVckEkO/z1ZaQpnr5W/iHnfzQ2XgR6nZt2aIQR/e4DPp/zQ/iBmLz7WZSzu
	 +F2+/cTrpsXkw5z7+fsoWQvKGWRWzH3CJrP310BoSc8YRRjcT6KDUsJ8IHZpTHd/eJpUj
	 Q8HsqODHvD4gzMUhpXwJm/EOtc1rtPpvZysHPainsZzJB2HTmSOyNu7TY80+aKHtRT6Ra
	 oXbGVISDnzAOjgDj1KdlT/MzOPlQZd5rg/INDjvMBBSOL7edpZPUKHq7nxWKzlVjjRLRk
	 srfpOBs9AYZFva1y2n8oZLF6wHA2Cq6XnOwU98Ed7j5Z6FV9nMZk7Mu9cCkAXts95OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
	b=t2G4eyy+2J9z8o5YuimZE8ZrLhBaDdcSEqiponAtRatpMC7VivAxaN57aKfNthsRkrtp
	 fH6SVTrHkGvjnMZoZgHVlMsv7fJz1hxep07DjYGJsxHMbj2pjnZAy7qc/NUmTlXCADpKe
	 9YqU2X/+Np9IsF7qyHG6fCIul+Z7QJc3oibk5S0dxgBohzubDuM3hOjN++5l7GSjO9UGP
	 PX60j1rDCn//b8hM+SBfh/N1wUbKHkPOLNqHqWLw1k7oglGFqPS5hb3KfP7J8MiJ7C6X3
	 Cw+lFLT1tk0gPgoLQEWEj6gFQaPMiDI0TU7q1/7KWWeXqr9jN9X81vXm/nH3OGTL9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h43CPja3;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95895606B3D9
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95895606B3D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h43CPja3
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so239220a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896624; x=1794501424; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
        b=h43CPja397Wxk7BuUAKdbooVEpDaqJLuGmG3AT5/791iKKS5eiAU6lh7u1JbE0Mq78
         +9oRSianhKPO/HA1gBL2vrU3w6lIR7qSraYBEdVYl2uPJ65ncsS1I9I2leOVuGrcv/bt
         sAy/aUnI4dnTLwPZC2bvNsTsU3icEgBMF6UpzeBqy/b0rCnmZGuF2bDQzCh8XbcZgzR7
         yKsxt1bp1lX5qfOUdhfexth16YT+tHLrRTx2oVdFuCI2YzD+TdredLDDH/ZKAC+4wHi7
         EB/KRd04cjwrwGzxsPxdGWxuJHdoqObrQeSF2bNgnOpZueQPe7OyekDD96xtrxdjvPtR
         59nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896624; x=1794501424;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
        b=PMgMf9u9qwGGm46QT90NM+SyHQtpDltM+26toSOR8mWy4eZRyjrxqi5KnCtnYjJpkg
         dnBoF/a2y6JrWaLIagC+5GKOG8vjiYoGgYpQi/gXFrdtBEq96BU0yfbNJbjAZ0ELwzJm
         nEGupJnBIklZt7C+2umky+ibwSOEQz5Whe7KeEGJAA6Pl6lVJpKLGl2Ky8rhLzxdXr7E
         JyDzyEUBFrbZWUpgWyFpNm25ljSLaf6TKWfEqRd5z2GQbcKJ9hgpq3uquoDVeJvK/2fz
         CWL7ZU9AJH8nTgsPc/mbkGXDJG/m7Y48sqwwcA/nzWDxWrY9aV2MnEn1RXdwVkEnC4LL
         2KOA==
X-Forwarded-Encrypted: i=1; AKwUvBy7PS6AHnLqbnDf3ctqsuo4cNbNiQDfA+AFse5ueRod/g/9SkhtvWwoY/RQQJw9udAAx9+Xw7ull2kjpjfBrFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J56USEiqgF9Y/ALOZUut/KkvZ6qfVvkK4fqjAB77oiCqMeu4Q
	Dn6Ot8bco3jwGN3SQwcrXQ5MXfHEnFoXSnZj3fJSSE/LPJA0JRGrPC5J
X-Gm-Gg: AYBFou26nHGZK7sP4S0+zynQuv6uUq9Ulgp5PPkF06ScTbDiCDLv0UFfl1BhiKLtGQ1
	g8rPMmDzdt1VEzBYEDU5ypHjJjx5eJegY0jqvAgsjTtAba5/sFs2LYHp/lZN7F9CSoxfvRblk50
	ABKgUC+2vqOv+b3Cwwan3+p02V5C6f9l9BtI1POA83Gs3Kd+/xoYjVBGFEMPVjumbyC5j/ep9tZ
	DGdu6yr6WI17EuoWU9NEnIgi9faUitg61gOrVbuz+32Y8hyxLwFuCiUzQMiNO9dDfyxJJkjWuju
	xuJI6SLJr999sVpaN3xJNa6bzzk5j2WL+46LkMmk2fi7iG7igCFRuoDdXkAIZAqqKpXZykJ2WUQ
	LK4d1/KE8YwhfQqFaLAJYwvol03ZuDEPrpuyzSw/iUR5ZLjXqG4lR+5SRATq3fjAct8XRW77JV6
	wCGDWuoDKwapNQP9DMUdX6LR4pqAsQad2QDfJShF5lQ6XiceFYchDQDnL4kdRFJhAaHgnn/ytLY
	Mw6l0QejwMUATdnPZ3q1C4zFTwHpIT8nIgYyxpivdshnZBKrhwVKe5ZLgqjpKTmrCz+C76AR90H
	93lNw59hEAug7SWAa3eXWGa5GV1hRyDIC7B5jNtra4n6TNXkytAjjGwEbE9svS1fvy/kspVnCed
	yfwoTRD/Sf53Jq6Lf6ArzCCFPE7yvo5Xr0Q==
X-Received: by 2002:a17:90b:4d85:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b0a378049cmr4183905a91.22.1793896623555;
        Thu, 05 Nov 2026 08:37:03 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm4692625a91.6.2026.11.05.08.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:37:02 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 16:37:02 +0000
Message-Id: <DMNFA3D0M816.2K02S8LB47QM4@gmail.com>
Cc: <eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <pulehui@huawei.com>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <luke.r.nels@gmail.com>, <xi.wang@gmail.com>, <shuah@kernel.org>,
 <rgbi3307@gmail.com>, <guoren@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 bpf-next 3/3] selftests/bpf: Add a runtime test for
 private stack and stack arguments
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Chen Pei" <cp0613@linux.alibaba.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <memxor@gmail.com>, <bjorn@kernel.org>,
 <puranjay@kernel.org>
In-Reply-To: <20261104100411.997-4-cp0613@linux.alibaba.com>
References: <20261104100411.997-1-cp0613@linux.alibaba.com> <20261104100411.997-4-cp0613@linux.alibaba.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:04 AM Chen Pei <cp0613@linux.alibaba.com> wrote:
>  .../selftests/bpf/private_stack_runtime.h     |  12 ++
>  .../bpf/prog_tests/private_stack_runtime.c    |  84 +++++++++++
>  .../bpf/progs/private_stack_runtime.c         | 140 ++++++++++++++++++
>  3 files changed, 236 insertions(+)

bpf ci is right in the other email.

pw-bot: cr

Also, the test runs on riscv64 only. BPF CI runs arm64 and not riscv64.
arm64 has the same combination and no test for it.
The run time part has nothing specific to riscv64.
The __jited patterns pin the frame sizes that clang picks for C code.
zero_stack doesn't use the private stack.
It's the only reason for serial_.

Two asm progs in verifier_stack_arg.c are enough.
BPF_PROG_TEST_RUN runs a raw_tp prog. No need to attach it.
The test runs on x86-64, arm64 and riscv64.
On x86-64 both frames stay on the kernel stack.

Like (not even compile tested):

diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
index abf319c..9423048 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
@@ -667,6 +667,53 @@ __naked void stack_arg_precision_fallback(void)
 	);
 }

+/* Writes both ends of its frame, then reads args 9, 10 and the frame of the caller. */
+__naked __noinline __used
+static long priv_stack_10args(long a, long b, long c, long d, long e, long f, long g, long h,
+			      long i, long *j)
+{
+	asm volatile (
+		"r1 = 0;"
+		"*(u64 *)(r10 - 8) = r1;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r0 = *(u64 *)(r11 + 32);"
+		"r1 = *(u64 *)(r11 + 40);"
+		"r1 = *(u64 *)(r1 + 0);"
+		"r0 += r1;"
+		"exit;"
+	);
+}
+
+/*
+ * A frame of 64 bytes in a raw_tp prog goes to the private stack.
+ * arm64 and riscv64 pass args 9 and 10 on the kernel stack.
+ */
+SEC("raw_tp")
+__description("stack_arg: private stack in the caller and in the callee")
+__success __retval(890)
+__naked void stack_arg_priv_stack(void)
+{
+	asm volatile (
+		"r1 = 800;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r1 = r10;"
+		"r1 += -64;"
+		"*(u64 *)(r11 - 40) = r1;"
+		"*(u64 *)(r11 - 32) = 90;"
+		"*(u64 *)(r11 - 24) = 8;"
+		"*(u64 *)(r11 - 16) = 7;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"call priv_stack_10args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
 #else

 SEC("socket")

