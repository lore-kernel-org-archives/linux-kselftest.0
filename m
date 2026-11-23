Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471461;
	b=vwlKtWXLJK2Jg47jruqxOyvS75k+FlzuBgf5Y791kLT+XusIf7C6IzMvmFiOv/uF/bem
	 CWRTPxgbXiker5hTqVBNnWYP3AT3t8xYmfI5A9SXml9S7IuJa1Q4Y2/qhZDEFbvUWYrHp
	 ChTd5Zh8QGT3G6/y30mdZwNwtZB2kOXZdCEBRqyfY98CbrIKK/bbpcXkUa3JIV2P/3MrR
	 mWva8LoL8odw1cUF4aCu5/BruUmzIRPXkaLIfJtKMSq/+/HVKIgWMDIrveG1qsBgIXKNC
	 2p1sPKH+VK7IjJ++1cdJnEQStJFGKfwFPRQpA0bC4kXtiBVASWKZkLkZup6cvEBnuew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2f3F7pReyCVh5ohj9DIUA9RqsDOv9jV9G6uqHApB7O0=;
	b=0oIHuGXb53UdSiUBdTLFHy50ZkfbibrcU8HdMuE+D1JONHl/Y8CgJd2RmJyXnBBHZiKH
	 EkZa/Nu9RUpDDBBAQ2qaYJgdwPdhUueF3rtwhRvghvBhd8+j9xOLm+b7/JSTNgRHfrWE0
	 dMJ+f9Ya9UasH+xGScTbVgOaoPbwvADt1t/KWct4Tz6QWxDYfDRQYkgNW0uK+QX4CM68o
	 Y/N8UZlpIaMgg25jBfTTEnmsIA/ex9FG1FlS8TwaUwZa6ynndagl/Zc5OXmESk+qCGElH
	 /0FGRp//lAuLfAZwbTdxb441IbElGqWg3T0AaCXSy5ZACAYgznNSI1WuxlCT9XrOQpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtVnmpzv;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB859606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 22:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB859606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtVnmpzv
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so25993755e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471459; x=1796076259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2f3F7pReyCVh5ohj9DIUA9RqsDOv9jV9G6uqHApB7O0=;
        b=wtVnmpzvYZCD0GaLZu5xfru9ELcjZM/X3gc10J+KIN5n8p5arnhGlxvdZtuiEyO+SF
         mXICRZeaJ2Yi+kfmmdhQdJJsugjTetjy6sSEz9ogL2VfZiBVbHasEkV22gWyrwSX/9iG
         gXP5KWXVdP09JEupsR0PUyqFKWnmmNcnY1K6WK4XNiptsVNjkbR83Oe++P10kA8oCycU
         syRoavExVO4TMq6Rf94nzquu91XYDe0jrE3mOWRkel5ldFIFYGjyxM9BnJB5iIqlQKty
         ZwnmN8MZDypLgKC1fNGIYoSh2uoC1c1DYQyWGPsAypQxJiD5h5LhoNSwIqSiXUZTNEJA
         rwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471459; x=1796076259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f3F7pReyCVh5ohj9DIUA9RqsDOv9jV9G6uqHApB7O0=;
        b=IZdlZzQ5Aq43JOu+H+GRJB/dpinU4Y1vr9Sgs3HoKKhK9vpyK4DYzCd37h9+KXQzWS
         RtRccrBEuotcLK15cMu2Xl5k1ucUpQFJ82n01MOuCKTmsqKytIZ6qhINds6OXXLqQzPh
         MXOoIeVkTDhHzKQrcNg3QOrsfNZYDIdFiZI0KD/C9o6Ej+xHLupuDgYjAnHdddjtDyM7
         hrBNaRuY62v4RMl6mo5hTV2r18Rt84u6G+/hKXTUps3PPkBuFGjxqBthasUjrPXuGyBe
         J/rBmoUKfY67No+n2Cy9NCqMKtJNzqq9suNzvPR0FXTjr+7/CZg+ad2MflH0AOqzxmTS
         z8RA==
X-Forwarded-Encrypted: i=1; AL+hErFQaGyjBsa/g/fdjEkkQd1SkVM8CE0RoXtWLrjCqWo0e0K8SsEAw+kLdSngW+SeIpXUpADYup0GMI1YFTw7yfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eOiQWkxyFqL935IH+iid+ravLSbMv6QBSok+U+FyoEl4yby+L
	0XEsW4zqgzvPgj+3fZbytHCN4vsEAYAJYgSqJYwgdy0tkrjRxVG0GpgV
X-Gm-Gg: AZFdTZd/hS9qwY4XCokZ3AhkHJs2oVu8BbZrIFnJ/0i2u3fDQthAhw71pR9FFJ0Rgtq
	fAIRTTEmVatA3wsBVZiw3lgJcuE/QGc4Ys548Yh+fi+sQN7r9bGRfVVQsNuJFwRGKMv2JVQWXQh
	TLocu0vu7BSPc+peFc3kJjLTxiOSePCqQ9Q2Pcxus7lKmCKnYC0iQuH6B5jFduRUH6vrmk11N8j
	UQ+vWGkYE76PoBTpqhgKnzGqKw8g96MbNTIpMixlTDrMkM6MbAb9eMMvNASFBhOk5Kfx0lIlxz2
	s3CZR3xg64y0wVMtgbzT5J6e2FW10rweQTje3YxrQjXJMLiji3sX+gsLZ2m3e0JAVduDXARFBqU
	jfHLgToN4zqD99UFB2qAUurA7d1fxIyIwRYmkr+K1jxvEfjKzRRxfIRlgh0WCkDAB/bc3QghfBn
	C5hgMY5+6LtQQw+APBxVY5Y+OKEGy9WDW+5QJTv3CtcnH5JOFQqTbRTHaPYcWObB7lTMvkXLG61
	TKR+X8W99qHH1toT4F8ZaC+LaymRZGBr4uhdKLLiFrqTZteKpAgCl9h318/scwKtOZ9voMqvnbm
	KOLVJ5NNWa2gr8Bo
X-Received: by 2002:a05:600c:1c0e:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb88824f38mr302199135e9.15.1795471458927;
        Mon, 23 Nov 2026 14:04:18 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm324214035e9.9.2026.11.23.14.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:04:18 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 23 Nov 2026 23:04:16 +0100
To: bot+bpf-ci@kernel.org
Cc: leon.hwang@linux.dev, bpf@vger.kernel.org, ast@kernel.org,
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, kpsingh@kernel.org,
	matt@bobrowski.net, shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 7/9] selftests/bpf: Test tracing_multi
 link_create logs
Message-ID: <awS4YG9LyfxIbE-m@krava>
References: <20261123152743.19629-8-leon.hwang@linux.dev>
 <d3920bd7ae0cc6a941895e00534e8f8818402a673351894d0bf98639272f7d7e@mail.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3920bd7ae0cc6a941895e00534e8f8818402a673351894d0bf98639272f7d7e@mail.kernel.org>

On Mon, Nov 23, 2026 at 04:04:41PM +0000, bot+bpf-ci@kernel.org wrote:
> > selftests/bpf: Test tracing_multi link_create logs
> 
> TL;DR: Test issue: the migrate_disable denylist subtest's skip may not trigger
> on !CONFIG_SMP kernels, since the function still exists in BTF, so it could
> fail instead of skipping.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_link.c b/tools/testing/selftests/bpf/prog_tests/tracing_link.c
> > --- a/tools/testing/selftests/bpf/prog_tests/tracing_link.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/tracing_link.c
> [ ... ]
> > +static void test_multi_log_denylist(void)
> > +{
> > +	const char *msg = "Cannot attach to denylist btf id %u.\n";
> > +	const char *target = "migrate_disable";
> > +	struct btf *btf;
> > +
> > +	btf = btf__load_vmlinux_btf();
> > +	if (!ASSERT_OK_PTR(btf, "btf__load_vmlinux_btf"))
> > +		return;
> > +
> > +	/* migrate_disable is only in the denylist on SMP kernels. */
> > +	if (btf__find_by_name_kind(btf, target, BTF_KIND_FUNC) == -ENOENT)
> > +		test__skip();
> > +	else
> > +		test_multi_log_target(btf, "fentry", target, -EINVAL, msg);
> 
> Is this skip reachable on a !CONFIG_SMP kernel?
> 
> kernel/sched/core.c always builds an out-of-line, exported
> migrate_disable() with no CONFIG_SMP guard:
> 
>     void migrate_disable(void)
>     {
>             __migrate_disable();
>     }
>     EXPORT_SYMBOL_GPL(migrate_disable);
> 
> while the denylist in kernel/bpf/verifier.c adds it only under
> CONFIG_SMP:
> 
>     BTF_SET_START(btf_id_deny)
>     BTF_ID_UNUSED
>     #ifdef CONFIG_SMP
>     BTF_ID(func, ___migrate_enable)
>     BTF_ID(func, migrate_disable)
>     BTF_ID(func, migrate_enable)
>     #endif
> 
> So btf__find_by_name_kind() should find migrate_disable even when
> CONFIG_SMP=n, and test__skip() would never run.
> 
> On such an x86_64 kernel, bpf_check_attach_btf_id_multi() would not deny
> the id, the link would be created, and the subtest would fail at
> ASSERT_LT(fd, 0, "bpf_link_create") instead of skipping.
> 
> Should the skip check the kernel's SMP configuration directly, for
> example through a __kconfig extern, or should the comment and skip be
> dropped?

I don't think we care, but if we do perhaps we could use __rcu_read_lock instead

jirka
