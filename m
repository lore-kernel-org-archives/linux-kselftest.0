Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FCB3655E4
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 03:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790826200; cv=none; b=sprJICwCmuGhbtTXZbwOWIBX6UIiBPKpNrvBeBBjMdHzS2RwQJRNEgvDsZx4S7MWw0QffuvoL21lFWKltIixmaYudvvbV7DfcRCjg66XlT1+fweYt58KwBFxOPwP16pmukIXUBxeqUmv+dEOtAUek3uIRFOOiHVByZeKJYsUgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790826200; c=relaxed/simple;
	bh=+TdbYnoQjaY4VdUDOON5Er0hmJ0yt/DSv+vRdqw2PJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3WQJGS4YnnTEipLkJSIyLoAguYPiXpGmpJbOR/mtmaPjj4DJsGzPK1YEps4mO9YPnNZQCoXPv4j+KogxY6Ccujyvl1/pkqU9pRrY7R47g5RXzNnT4XHa8UABWItWkkE9PVweJrzER0/Mdt6Gw7MbUlH3ARzQPEDgplxe+6TjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIpAkXDo; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIpAkXDo"
Received: by mail-vs2-f36.google.com with SMTP id 71dfb90a1353d-5d5945ecbadso927375e0c.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 20:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790826198; x=1791430998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sm7+Zf2VCuadsmAKKNiaor5/4aKK90L0b1pzxff1AIY=;
        b=XIpAkXDoi/qzgTTS5+5+tcW7bvluSHHsR0/u94GVscamahYx1Xj80h/ObOYD3zZot8
         Hw3xgeU2AmP7GMUKmLj2hSSlqXH/1WwKUU9fQqbH4UY4vLCL9EFtEpetVPF1jemKyQQR
         05/JP3IKsIHDWU8aGr3ti2toxb+mykS6835u6I/xPG1bxnX3ax0LlpGIgUaYfmGM/3Ld
         ksxmLbI/A+9hLKvWtqMvH1/ko+bcfkUkG49sw4jIFm4wgvYHCGdmEJfQ09V2IiCGY+qZ
         YAiCIHwbNdr457lnmyhgn4tbvV7l/wW/dZUwhNgb4uUNmI9GjkCIkCqFCXZM/zsRvPZs
         RCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790826198; x=1791430998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sm7+Zf2VCuadsmAKKNiaor5/4aKK90L0b1pzxff1AIY=;
        b=ibcZ5FbJ2akLRGToKdfU1xTDglXQj60m7oANgLn4k7TXY3UVOCe7ymYgkajRa563mz
         eHyoJ8hsEKayhuYYuS+xmKTMQYozR9DMmdVRyRvQH8HLpphXm1tRP9u4Fnw2HiXndkXm
         ZvlQqext1iXzYNRSCA+e9UAT1PAitxDeoZmxDs/3llw3OXGQX5UmMdtpSlAUSlyVKrpE
         qSVUcSJNzx3r5BSOxkFm6sL8EbeFyTF0UGAT+riVxtweir5SpR0stFhzYPtqEu1g1qAe
         IT1yBauYe0qHdQNyYve6GAVGAKt9DLLLzSxx1xHYgwTWx29hglD4MG0Qz9TTQWsUQdDw
         KzmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXr2bAOgo4UUEjvvdOJYBcel8GbF/3BHWiek1DjRRu5StOqjEpSdg3lGjufNSxHcJnBnnCzWw2bcRhy/96TCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQPtPZgSw70adMSBCJ0f/vWurOWRqDh9bKPxPh6g+JA0HmKXNQ
	DpJ7Du2wdKPH50xuUNP22p9odluLhqUKR8WsSqs5BGk/zhwD+dUgMuty
X-Gm-Gg: AYBFou2GL1gfpypcvhXiWvVXzDSmkGhrTknHfWIuR5tzlw9SNHvB2szo6qMiPeGl1Iw
	dJf9Ss7q0RNVVlZ2JnjBVSnZvnGXc2GAT5OgDUg5NXBK0LH6mAXW4N9AYk6b0yE7dk+H8UG/vPL
	bOiqcVI0TNt5j7uIaQCLcwznVYT1v3trAsC25kuQeu/QCJQBZihJXkgL9sVvamfBaiOCPgWoyn3
	LqQy/7NP21dF53x0Y6q+Qd6QuOXsSRAtaW/mHSUJcd8WPEwvGgTUxa7y9strhXCWTldLugN9MKA
	aqGPl0+QFDVJGcGPZojd9Jgu4o9lE6DeBaEw5rzzCUQSvA8XQOgrYmvoYkhsVnyDulQ5Q6UpAkO
	K+8L7Wi1tC6amRUas2lUXkAbg1ys9pfbf/DEZqmucMsj22FSKlwaaZXM5ElEXrMjU7KCM2cxtWH
	UvM1PdajxtIHJQf2b73KRAfB6TlbvC/sgCFtrcgYgdC5Suh3qV8yWCV52yvADaf1z6eA98+X2VV
	fA=
X-Received: by 2002:a05:6122:6c17:b0:5d8:4aa0:7f6c with SMTP id 71dfb90a1353d-5d84aafd1efmr312839e0c.8.1790826198122;
        Wed, 30 Sep 2026 20:43:18 -0700 (PDT)
Received: from [127.0.1.1] ([201.162.73.164])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d7fa499396sm1789926e0c.3.2026.09.30.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:43:17 -0700 (PDT)
From: Luis Vieira <luisflavieira@gmail.com>
Date: Thu, 01 Oct 2026 00:42:59 -0300
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Add regression test for BTF
 dump zero detection
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-libbpf-btf-enodata-fix-v2-2-89f6e8a0240e@gmail.com>
References: <20261001-libbpf-btf-enodata-fix-v2-0-89f6e8a0240e@gmail.com>
In-Reply-To: <20261001-libbpf-btf-enodata-fix-v2-0-89f6e8a0240e@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Luis Vieira <luisflavieira@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790826180; l=1595;
 i=luisflavieira@gmail.com; s=20260913; h=from:subject:message-id;
 bh=+TdbYnoQjaY4VdUDOON5Er0hmJ0yt/DSv+vRdqw2PJg=;
 b=tvfPGEeTxlGbKrxeJqa3cGqw8HGVbBuInj0jUju9hReekx8a6ss1kY2gH1vEExxh9Ovrgzmlv
 w3COn8NNw6FDrSE9D6pGqUvZ76Pi/vnsSKDQrd+SkHoQgBeHw9usoM/
X-Developer-Key: i=luisflavieira@gmail.com; a=ed25519;
 pk=98MeC/NdrC6ah7zYpPnkWiQIoyj62iUP/rNuV3esCW4=

Add a regression test for a nested struct whose first member is zero
and second member is non-zero.

This verifies that struct and union zero detection continues checking
later members instead of treating the entire nested value as zero.

Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index 17fa44cb9c91..5a5ee001ac8b 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -1146,6 +1146,11 @@ static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
 			   "(union bpf_iter_link_info){.map = (struct){.map_fd = (__u32)1,},.cgroup = (struct){.order = (enum bpf_cgroup_iter_order)BPF_CGROUP_ITER_SELF_ONLY,.cgroup_fd = (__u32)1,},.task = (struct){.tid = (__u32)1,.pid = (__u32)1,},}",
 			   { .cgroup = { .order = 1, .cgroup_fd = 1, }});
 
+	/* nested structs with zero first member and non-zero second member */
+	TEST_BTF_DUMP_DATA(btf, d, "union", str, union bpf_iter_link_info, BTF_F_COMPACT,
+			   "(union bpf_iter_link_info){.cgroup = (struct){.cgroup_fd = (__u32)1,},.task = (struct){.pid = (__u32)1,},}",
+			   { .cgroup = { .cgroup_fd = 1 }});
+
 	/* struct skb with nested structs/unions; because type output is so
 	 * complex, we don't do a string comparison, just verify we return
 	 * the type size as the amount of data displayed.

-- 
2.43.0

