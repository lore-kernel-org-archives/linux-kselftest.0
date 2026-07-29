Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0023B389E
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326179; cv=none; b=qeALaxgJGaB7ulPv+jzQ0/vk/ipaEhwSjOeW7t5PWEDBmx/UTs2kT//hmu4gkpijILecDGk2A+PtCz9pBsBx2dr0Z2J1ASa59T1bfBpNF7ZpeiRp0WmNM9kHLjScmexz/LfuIAOvGsIxsj1aVuGejzj+e4InipDbpkLP16j73Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326179; c=relaxed/simple;
	bh=dtkEE7sRF9pw6kru2FtkcfOc9pr2W80RbCzLfaIZzy4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVs2aMPgHlqHs8+OlR0u1j/1+hFFMb0l5xB6I7FW8OYpJhFB0iGoTK/O9u13cgfRrF6W6/0QcSs7k0A6xrSJ11h8Epacy54yt+siCjI+EVm02VWTrRFxAUljrcqxlb9enlIyi5cHt5ob/1sR5XOumviB85tz0eJac4Qiw27L61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6aTgR9U; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6aTgR9U"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4728c12ba97so575907f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326176; x=1785930976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xxSPeR/qOCWC5IaIobtTnOVkK5MQEeMxfQBafeblzVU=;
        b=r6aTgR9UR3N8KBJq3/67IB103kjazuUHwsqfrnWjf60q0b7/B8oD80WTv6zuJfxd58
         OKaziHFS4bQshjUonHdBFnYlTr5Rv5/zS6E+gfyGnzGQyjx969c62yHvo48BIvuel3Aq
         WP1Ztda+EygDSS9SDSVkx5t6sgHiXEIMcZM9Vx8fhlJkcotNpCcDdjX7njrU0pXHr8UP
         4eHNB3//7Tpas7eTd6H0U8Ysiw2Ni/3ewzmc/egrw9jGiV7vHK8OcUebcL4ZNhFojTSQ
         lzhPCQkmOuubFNDoVBie8kHnZJ7/QosBTaJ1EJIc73Qnf9ySnXEyOX0p0hCEvgwqE9xZ
         6/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326176; x=1785930976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxSPeR/qOCWC5IaIobtTnOVkK5MQEeMxfQBafeblzVU=;
        b=mphCFotb/+wKIobV3qclLANvJRVvX9ThxkXCaNdjv8SPrc+Wpa5qzono+IPk7YE/Mz
         ky+okJVhgRvjXgp9y9IbcDxabRryXn6qNXZkw040QXxJmxRhij5+iA4ePdUHL5lBnv9j
         WF75k+rYJsAuMliGH4fbge9XGaLDZQ5X74z8b0HqLtE23rtDVr7SF04Xprz33Glsad3Y
         QDy9cSf/0xNxc+Mv4+cKQ+gAqGLMRSnLZlpPzVaM5JZDGukJOzEFevn3JTC0XZzvzY9Q
         9yBq+i5ItE+TfkIySvPoHsY1F4r7V7jIsKf4q3zwSjgR6qZuFOuLQyLKjMkd2UyGWXrP
         oyZw==
X-Forwarded-Encrypted: i=1; AHgh+RobuTd0RARr3PuUqNM+gRW+w1GjJVSnbV8qzkHj6U9lGx/1YKB8Hul30keUAwOAryWQQdyxGj4PUHfoRF9bXlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4xICe2lR25JwM9YNXzUQQiqVK8k3X4LKMVznP3fTsF2LLAIZ
	JY4x6sAs1BLVCzrysx20vxICxHbNln5EMIYReGZ7b/k2nqJP7Gld6klX
X-Gm-Gg: AR+sD13d959T+9JZjG8Jc1tOcR87SxPj/MjQAi7BuRzJEJqilnkoddV69AYMnJxG4LH
	FSkAPvfQU7fa2GIK8cUPPfM3D5H8JmX65n4JHfUTgtFuEJpKL628NGy/MSEE0xtcWLbhB1QFbv5
	rZji8a6g3JKfq9IL1Xg9WECBC5zI6t0SYSaHqRi7tm3SR9Y/uFCWKI5G1H3pZ2m+uXscNyNb5a1
	ZeHjtnKzsFmcSGciQTScQk7Eh5RXogX2/B4y6M9IUckB1QFC7n27N2S/78FEXsIIGQksyf8Dpjt
	HwER+1GAh1zQO4mAUXLfNyYI1Pn+Bm9jpvirw5j27ns1Pgmj4r4hucZNo+Rb45i97md+7Wl4IjH
	AtDgz6pMxqdVidy7bxUXtAkYL+6ZynpyVUnErOUUxyYB5+NB7BbdxlcABZllZh+xe4cutlzzv/G
	P0n9QNgnSXJBmj2uzM+qhJKMKbO0zaLky2FXA=
X-Received: by 2002:a5d:584c:0:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47fb1ecaf73mr7057660f8f.3.1785326176317;
        Wed, 29 Jul 2026 04:56:16 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::dd7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm7531659f8f.8.2026.07.29.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:56:15 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 29 Jul 2026 13:56:13 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
Message-ID: <amnqXeC6D4mjcAe_@krava>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727142844.21212-2-leon.hwang@linux.dev>

On Mon, Jul 27, 2026 at 10:28:43PM +0800, Leon Hwang wrote:
> The BPF tracing multi link updates several direct-call sites through one
> ftrace_ops. Its implementation is therefore gated by
> HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> 
> Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
> direct calls. This enables BPF tracing multi links on arm64. Also
> generalize the unreachable-trampoline comment because the single-ops path
> does not use ops->direct_call.

hi,
iirc arm needs ops->direct_call for trampolines to work properly,
that's the reason we enabled single ftrace_ops on x86 only:

  424f6a361096 bpf,x86: Use single ftrace_ops for direct calls

I don't understand the arm usage of op->direct_call, but it looks like
(codex thinks) that the fast path won't always work without op->direct_call
being set

from arch/arm64/kernel/entry-ftrace.S:

	#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
		/*
		 * If the op has a direct call, handle it immediately without
		 * saving/restoring registers.
		 */
		ldr     x17, [x11, #FTRACE_OPS_DIRECT_CALL]             // op->direct_call
		cbnz    x17, ftrace_caller_direct
	#endif
	#endif

jirka
