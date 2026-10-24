Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868941;
	b=b74ZQ7eRAd/eqfFD1bS/w5rS5VdYEXqujhQTRzO0ti+Ttp1giM9g2Gs4Mkw7L023iGpI
	 4/4ubzxIYZAjpZtBAa3zl0zgMgqUJxq0WKS6R2OIHDox3O1GKxLmDWIOt3/MvNzm5++ao
	 Ucq2i/uBcRj4LAeqr1Cb/XxqOTCl6x8yIAQxXinPvaPK5qxDYAICAGd+fk9BADkTaWu7S
	 FjbY1bL+1N0ffFTmAcHAcay0dCrP/+u+L9exBeUYbab3UJYeiUPHfCM4j69zemXeqCew5
	 ydppDO+enZN3CkjzL/GkPjLFLcmdJesmo00fyuTNFop5eYOhymCWP4C1kX8EU45yrZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=b1KmGtfkzCXHo4XGQE9aXZCjXYpjChENBSuESrEsEx4=;
	b=PEtVNZLDEe1IRd9+rNG5lD/AraQ7t6lA9wv8hVDgDpM7yiZJ8iSpsTke93GfOxyrUiKr
	 Qtwrmeuk/Im7L1AVPuydgwAgl21LbiX6z1nw2U40kfSpPisQKBs4eXnRSK+Tvm5v4dZLk
	 tUzsCPugFWPLfggVH+Z+/AnNAcTEHI0IGtcMf1nbihzp3fb5P953Tsc3kQMpskBvPcqsR
	 z1LZZc5DjbBZpFxYKPFmvGPkQ+Rs/z8uJQAwcyHNzbQDvkenHNNn+zbHUe21CpHgWI3wa
	 OIljqRh4MDYj32zdVrGPuy/uZ5/SPJWBaRskF/5NSQJ1pmPBWTCrX8S1hq4acZyfneA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XPl1gc9v;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB54606A31D
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 19:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB54606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XPl1gc9v
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1174238a91.2
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792868940; x=1793473740; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1KmGtfkzCXHo4XGQE9aXZCjXYpjChENBSuESrEsEx4=;
        b=XPl1gc9vhSN8FIBnPFVPZxrqB1ycuNmB+ckeO620h5+u2agZWc4EcYJ+aFRB3kH4aO
         0ODza75WLQpzfmF2w0aXasgzT8QPUIV8s/YyKtCF7tjI5NW2xvJOgKZv1KekMZVvtQ9V
         Fb7EXO2JaROBMEyXVrytolyKRK+HuwB9IuVF0atgNK7Qdz0uhOC7CEzMhmzU32N0bk+z
         arIXBh7Pl7xHzghwfGSSTDGUFixnqb9nxWdGRaNm2KnZQ8w19AZn2RSKnc79JTqQ5Mh4
         LHWh6UbZ+tVnJ3opMUwNl55j75tGktX2hlqWN+9iDE4nPMSAbTzslD0H6npJzqTIwdbk
         wI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792868940; x=1793473740;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1KmGtfkzCXHo4XGQE9aXZCjXYpjChENBSuESrEsEx4=;
        b=BipwS/s9Tqf04ue4T+nK3yrtTGW1u0pCjQpqTZxg8+jGbKi2LRy1H0JOxSLhbwj5Pw
         Dg84zGj/Fjdb1HB17wDNH9y35l6llewdy5dfyOAxUOP5VUOtp65csusM5VU/UNVOSFJk
         rJMmoZQ+qNfx2iuWPgp7ToR7gjHObeiveQbORNnqsvkuiWKLpu3feVbXTl7MvyGXIKyk
         JProyXzT/nzd6wiAnkma3S+KJPDZVfNSYlmZUIiUVCOg36yuJMLmFSDn9mA0SLcO9egv
         AE0h6AiM6i2UPa7SP4GlFzGru7NfC1CaqIJ/GqaJ3WPMUZpvsgkauULEv8eign0My2R2
         ge5g==
X-Forwarded-Encrypted: i=1; AKwUvBx0FMkKAMfwpFK+4yeAUTt2ty7N1YpK8y34pbsXDGreq+9/v2J0rD/ofUU8Fna+7HYFlFoq8tLKj7PmBGYDBts=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKInFf37hd+tsDUQLxfTAh/YBsgfY7WjK9lLqHajmIVZ4r2I7Q
	DvdOMkFcRVfQorLWIEoYG+ekwr1OBW5jax75Uqh9cJ4RKwQSISkj7X60
X-Gm-Gg: AYBFou0psLn9sk/7Y+JhqjpU6joNfo7RJbTOBFRvtdVYhFGlvLL4TA28fKL0ajibrqt
	3c6dnsPs4senrg9IlRO5CyGmmB1VYsBZGbS3SiSfVT3aUEMg5i198yfLP8s7YPEA5w9iL9um5RO
	GZtT/ws13dJI3ZPOU4/LPo/B2+IUakiGloMAbHMn/EX6CA8kBqTEaqhb5Xrfu+y3lfWg5NLoCVE
	CWlYCp/+ris5usYbvB2jSbuwFO4DXZot1RiM0eI++cQ13kkHcgWAhVCjGuZm3/DOAUCSveJUgTm
	vKJe7LOPh+iV4EifU1uI3L/WSgK+wliwmCkPMOXfQr7t2oVXR+YiXTIdbfDF03pZ//wavqpXaVl
	IYItfBHuUhawSiwAIut30ULALHi1Q7RW8ZbVeqJZhrnkq3sSNcfoWllyG33RdylmdN38KAaaTpT
	SV6LgcbHcbneC2Wk5N8mXxQlIGwDnpvsYvplUP/izGRGJoTNJbAnkcXQLMGGTrriQUERoou6vxN
	pHof96PRQy2Ltu6q4wdpfAsCRTZS9rRjzfiqrXoT+CRbMTw6bdyCOgsVoTtT7344TKFOSTjD96G
	PPTP6x91iWevniqjW5p9YpyVtz/U0aPnT+nEVt4AhtoObrZ6CdtMBs1FnLUm
X-Received: by 2002:a17:90b:55cd:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3adea1a76b8mr2258311a91.6.1792868940394;
        Sat, 24 Oct 2026 12:09:00 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm3785610a91.2.2026.10.24.12.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 12:08:59 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Oct 2026 19:08:59 +0000
Message-Id: <DMDAZW82I9LT.3FNX2WI80GNE2@gmail.com>
To: "zhen.ni" <zhen.ni@easystack.cn>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <akpm@linux-foundation.org>, <vbabka@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <brendan.jackman@linux.dev>, <hannes@cmpxchg.org>,
 <ziy@nvidia.com>, <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] mm/page_owner: add bpf_iter and kfuncs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <06925440-8df8-4f2e-aea0-ede1a98435fa@easystack.cn>
References: <20261021112437.1799213-1-zhen.ni@easystack.cn> <DMAURQCKK6CG.10CZ7MFXGJO3V@gmail.com> <d39db4fb-e511-440e-9065-72c34a1a295a@easystack.cn> <DMCCBEPCIWH0.2JEDKE64WPJRQ@gmail.com> <06925440-8df8-4f2e-aea0-ede1a98435fa@easystack.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
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

On Sat, Oct 24, 2026 at 10:19 AM zhen.ni <zhen.ni@easystack.cn> wrote:
> For this one node alone, about 97% of spanned is holes. With
> bpf_for(pfn, start, end) plus a bpf_page_owner_read() per iteration,
> that is at least 16,712,944 kfunc calls, and bpf_for has no scheduling
> point inside, and all of them are wasted work. The gap grows with memory

Right. spanned includes the holes. So don't pass them.
/sys/devices/system/memory/ has memoryN only for present blocks.
/sys/devices/system/node/nodeN/ links to the blocks of that node.
/proc/iomem has "System RAM" ranges.
523024 pages in a 32G node looks like 64K pages.
Then the whole 256G box is 4M pfns.
When a hole is passed anyway the call ends at !online_section() in
pfn_to_online_page(). /proc/kpageflags does that plus put_user()
for every pfn, holes included.
Syscall progs run under migrate_disable() only.

> front. The spanned of this node is already 17.23M, so a single bpf_for
> cannot cover it; you have to split it into N chunks and poll, with the
> chunking state kept in a prog map, i.e. a loop nested in a loop.

The loop over chunks is in user space. One bpf_prog_test_run_opts()
per range with start and nr in ctx_in. No map, no nested loop.

> for 52-bit PA. A 32-bit PFN range will overflow here.

The snippet was:
  bpf_for(i, 0, ctx->nr) {
          pfn = ctx->start + i;
i is an offset within the chunk. start and pfn are 64-bit.

> Solving all of this requires yet another, more complex kfunc—and it
> looks increasingly like bpf iter. So why not just use the iter?

Nothing of the above needs kernel code.
v3 is +474 -83 lines on the kernel side. The diff I sent is +55 -1
and it doesn't touch the debugfs path.

