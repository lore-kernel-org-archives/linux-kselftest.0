Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6534756A3
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792015148; cv=none; b=SwRG6WdGCujFiMkczknhkQOzl+g7qfS+dWW36LvZT63slAUMhY+lyPBBQXwN49XkVi/HAUVog02Aa3i1SJY/GZRHzheoJTQoeqSkEeSzOpt7ofNK4NmllRgO29Hqevi6hlrPs/XxmrAd1H5zEXDIpaXMPyyEMoNkmakAgrDbiMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792015148; c=relaxed/simple;
	bh=lVVVSYdqUQHEhiWkMmwbDnl8vMUmQFMlde93Alzh5Uk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5M9fhn9+X4TkBM3WFjJXAy8DmD2WL00xpbei/V4nVU8pBsU8tRMwbzmwkd4O6q4iqrCIgSc2G+Jk5GoZZllFJu5YXagWtVOip3e8Kf21X35kMb10p2OuRmPg1F9Igkq6GE8Un0Bb0P7UU56bMR9DVJsILUrsMKrepX6bXOyDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEFzft3C; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEFzft3C"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso6454755e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792015145; x=1792619945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ti2mUXDOBJkgxGD4GenKqWSBX8JAxIFlYVCE3uNCcx0=;
        b=CEFzft3CbjBh1vQH2RxGCr8zN/+KtCzpchOJJf+SXJ6NSo8/r0unKNsed4OVKigw0Y
         TOlke2jVS/hjiybj7PPkrnQdWPJ3gb0ijJOBmfLDvBzWN00E04z58bm940ATZfxE/ZZ4
         HpQt0+ZYocHQA4TWH2JGD+thzPmROvTshNI5yq1UrDUpvZG0UNNgDrP71Uf7jfuGRktG
         Gkm5bHyrPW8OQdpoeNPL1E58nJOA7A9GiYXdtKlkMfiQKhUbMiFn/V+V/BC+a9Ss5jMD
         wmTwTd0EHfTQ0Xpfnbzr0V5WFWKGiTe1ihNSRbCTfmZa2w1fwteUAeRe36tZ2sgKrAWJ
         uOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792015145; x=1792619945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ti2mUXDOBJkgxGD4GenKqWSBX8JAxIFlYVCE3uNCcx0=;
        b=CLbpc64uR0XgYErvt9/WuSjfNYdxBi37PJNoVVeV9fZ49Oj9dZFeGQlWpxMfRlm9XX
         DfjlZtgC0qcQwqfiJ0+lkPcTw2sexIo8Qh18uCnxh5cenmldCzBxBRef5OdZ6Hfg7Pf1
         fMifNM4sSYKADymH9XKaiUMiLFD5bXRyF7/nPlZa7IMrA+jZbwb5wtR3OghEzHdkyP3s
         RlEZeeEhFOIDMXcpv4KBqS0XMQZbkOWwiFRivQRP4uvZbgEvVJmqtXnITz5CufWBcQCG
         poHwsMrDiJkt/B1Q2PkWiodiOgZUnlvEu5JGjV66cYMdN+pFcSDI+JhokArQtpoq77+i
         KB9w==
X-Forwarded-Encrypted: i=1; AKwUvBxpPtHOYK07jlDiZBTbvOQuCvmBA44OVkaxpCvr52wxohUXdSafNbAcih8MrRQWK1WPj+d5FG3jH6J0s+sSoUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkl1afZMycN9RuOQc0Z9wDeURCPrL0xPujmK8jqkwq/ZAvlaS7
	efYl7LqrSqT8+cCQ5H5waySCctEkkzqBO+62p+FBVRs64R6FnTmiYSkU
X-Gm-Gg: AYBFou2zjKSQ3WKu4OcVAN0gnfOXUo1/7CwISaUm4wh4RAW9tpJ5Eil+Iskds/nG3cX
	5U2g0Lo8iposP8/nyjj63A8314/+HvZ3UbQfx99z9fML9lE31Lm51SXd/SLHilTG4bzGYkmVxdO
	nIrdvcqLHZKRYjd15U0prqvWwlA1/P+5NDtNbcAh5P31RXMqbFJGmVqHNphrRciY8wilQpEmeST
	l/3D6bbDn9f9xleviAHH25h6RZci5GyDDQLShhGAPfgGj7xUhSOc4P7QjoNngqHYj1QvwTWZg/V
	f8NPkpBqhNU30NmZBjK2A5MbbKVWw+VelzVUPxQi/+as/ES5N0DaQJsrpYhPsDAjLXZf0PocIjA
	h0u4QNsRUQa8915SdkvyVp8sWDSn1FQNEVCiNNLy+kJc3UkiVl6LcrgTclOworsqpWHGSPbhMOh
	fuXmKn7AEztnuNq3MYapt9HNnnXvioKkUGeg5kdkgI2FPqEmH5EI5WqEtRlQ==
X-Received: by 2002:a05:600c:4e89:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a18e4ac77amr380628185e9.30.1792015144752;
        Wed, 14 Oct 2026 14:59:04 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993f34sm22742055e9.11.2026.10.14.14.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:59:04 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Oct 2026 23:59:02 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Avinash Duduskar <avinash.duduskar@gmail.com>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>,
	Rong Tao <rongtao@cestc.cn>, Eyal Birger <eyal.birger@gmail.com>,
	Pu Lehui <pulehui@huawei.com>, Jingguo Tan <tanjingguo@huawei.com>,
	Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 00/21] bpf: Add tracing_multi link support
 for bpf progs
Message-ID: <as_7Jgy_sdTE9M5O@krava>
References: <20261012154024.29423-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154024.29423-1-leon.hwang@linux.dev>

On Mon, Oct 12, 2026 at 11:40:02PM +0800, Leon Hwang wrote:
> Similar to the tracing_multi link support for kernel functions [1], add
> support for bpf progs.
> 
> With this support, I'll be able to enhance the function-graph feature of
> bpfsnoop [2]. It will trace all bpf progs, including their subprogs, to
> draw a full function call graph including bpf prog call sites.
> 
> The attachment could speed-up when there are hundreds of targets. For
> example, on high CPU core count servers, it probably runs 200 tc-bpf
> progs as Kubernetes CNI, and each tc-bpf prog might have 4 subprogs.
> Hence, there will be 1000 targets to trace for bpfsnoop's function-graph
> feature.
> 
> With tracing_multi link support for bpf progs, bpfsnoop will be able to
> attach to all targets quickly.
> 
> When attaching to 1000 targets, fentry.multi is much faster than fentry
> on a 16c16g QEMU VM on an AMD EPYC 9745 server.
> 
> ./bench tracing-multi-attach-progs
> Setting up benchmark 'tracing-multi-attach-progs'...
> tracing-multi-attach-progs: prepared 1000 identical BPF program targets
> tracing-multi-attach-progs: fentry created and attached 1000 programs/links in 338.171ms
> tracing-multi-attach-progs: fentry.multi created one program and attached one 1000-target link in 47.345ms
> tracing-multi-attach-progs: fentry.multi creation/attachment speedup is 7.14x

it's faster, but the original attachment is under 1s,
so not really a problem imo

I guess the api is better for your use case, like having
less file descriptors open ?

jirka
