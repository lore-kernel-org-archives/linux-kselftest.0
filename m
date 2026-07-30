Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3825F408614
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409113; cv=none; b=V72gGR141uPgXP8RSx1KXewsAIJdbH1DeVb+41U8fOoHr0v5u0lbdvtXVjhGQVD1J+luYuBd+0GH4BBHnZGlPFs1pvGRBoj24Yl+SY8AZLY/IBSUnqDGBUUhhvACjiE/I6f+orDaMiZxl4Eqs4qPAKSXmiac1G0owDKrvhZaX1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409113; c=relaxed/simple;
	bh=OUZJe9ibUbTY3/iskfpej3snXo+kezysiy+SxHFR7w4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nqb+aDE9xnzRME5DCr9mjOcuo4WSo1bhzdHV+FDsPDtJQ302c//0pAlaAl8m5pobWXIPH2tN/ZT10nVAEkrRCzIRr109yYZrYY0tk+nwbi2Dry3aOltJNTtma1kS0OFPH1VtBWkZBk0x+iZsRHqkREVYuLMmr61nnpdueqcSLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0mjHqGu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0mjHqGu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69ffbd2a277so3237712a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 03:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785409110; x=1786013910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BtmEW6LmpN3hbmzYM7Cf4iCPw5cw70uOQWik1DIJVKg=;
        b=p0mjHqGuHmE4rHDrfSwM/V0o+jJpbKJ7EJO6fvpk+LTEC1E/PoFtOUISPW/6oQIWxp
         CszJci8hAV4UeJeSWR9WG2mJ77RujcSGRnrgVYLbFNjCHBiYmQNM9CTO+si5Vs9M9YRI
         JqJBktYIKXYOQBl82moIa0O6XBc8w1X95iloT2zFsb7oe2gdkMNDw5skKO+kpbIQ8x0I
         ATSktbcUXeQdRajCoLvE5G3Kqb13U3EKsReQRc7PxFqF08BUfIJ8+qQQNQctKCIPfDzw
         9PMceRqdnZoVj3E6xXO37Zm1aqbaYgrMxG26zUDPTa23Mv/+k2oB2TYx2RpwY2havJ/e
         vV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409110; x=1786013910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtmEW6LmpN3hbmzYM7Cf4iCPw5cw70uOQWik1DIJVKg=;
        b=T9h5gJMLUid+T2C0n7EUBLaetDGjetYIV7/vE+5nXVQW8CWE/defGEMasLkNGYlFQW
         PNO6ngFhFDsJCarUc+cztiBTdD2wyGUxnYQ0Glv+k8N39ttujc0CJMpGmsm1LsFmXpuJ
         jwrGaLZ2H9CsyT8tFhlqqQFlf3xX7zrTM1E2jtM/wSFEZbdR1xHgw5jWGVNHDjEthGBw
         BrH3H4tavnSBVUgMiwb2amV/oVS2EKI/oBqsLlJFte//ayFEZ06rQezYLvJciiOgPu/1
         s2vnBAxEDB2ribfTT3o4Ll0BxrMWOWvCKBtx5LtZU04D7ZbH8mHSFF51zNk0Hz9gGyfL
         uR1w==
X-Forwarded-Encrypted: i=1; AHgh+RoE/WPyaw7m2Ub4rxG7QVKTbfjUKxDWsgzzkztdcsYvPEbuHkkcBB+9P2FTmVUHih92sxorWfiH33gSt9Xw8tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFlWXPR1afgesGC9LADCsOhM1+MHjsfhsbUnl8CeDaULlc4Xt
	L8//UJVeqpddFsdrjUBYEQSWJpTKcVE6r6FO0KqEuBbh/tLQPpyDgRhK
X-Gm-Gg: AR+sD13laZULAagV23DGnrB+OFV21h8tBgjM1CqB5hai/CnCBGC8cDVMF5ZNJJHjNLm
	FK3KEGRTlTloQxldIryJjUM/pvqvA6Ur7AicZ3Nn04DiUEhJIb3nxZFU8XQNP9HlZUoEhKTBsgN
	pJvX0TJwi7fIgSuRuRB1ZN9jhuErZI+FsnX3EFyDubHg3h4n8yA8dBcesKjtt+jGoneJSRLfE47
	fLfZINotQFLXZTankjow/RAjzSvjl3MUiwtaaZvW+8+MZa57IbufoXzxCZMoR6kVXHz/AzqrbG1
	FfN2Cig0GHbZPixXxLVrMJLkKx29ZtGbCvkPKGs4tjOkWuxtpPWCx2E1kLKSZP9DJSEinkwP9J4
	RVOPWtYB/fo26tdCAN6BTpuLlEkQ7qtaBjsjYjnoTbFiTkGhF580oQsL/rs3P8v194XUw22SZPA
	4dXJVR96LWmBmojb+CihBRz7aALAhACv/NYpXycTy/6vALK8E=
X-Received: by 2002:a17:907:9443:b0:c1c:4afd:8d8c with SMTP id a640c23a62f3a-c1fa558e48emr104613966b.14.1785409110114;
        Thu, 30 Jul 2026 03:58:30 -0700 (PDT)
Received: from krava ([173.38.220.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8578015sm55934266b.18.2026.07.30.03.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:58:29 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 30 Jul 2026 12:58:27 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <amsuU7eXuoziObdh@krava>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <amnqXeC6D4mjcAe_@krava>
 <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>

On Thu, Jul 30, 2026 at 11:05:42AM +0800, Leon Hwang wrote:
> On 29/7/26 19:56, Jiri Olsa wrote:
> > On Mon, Jul 27, 2026 at 10:28:43PM +0800, Leon Hwang wrote:
> >> The BPF tracing multi link updates several direct-call sites through one
> >> ftrace_ops. Its implementation is therefore gated by
> >> HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
> >> DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> >>
> >> Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
> >> direct calls. This enables BPF tracing multi links on arm64. Also
> >> generalize the unreachable-trampoline comment because the single-ops path
> >> does not use ops->direct_call.
> > 
> > hi,
> > iirc arm needs ops->direct_call for trampolines to work properly,
> > that's the reason we enabled single ftrace_ops on x86 only:
> > 
> >   424f6a361096 bpf,x86: Use single ftrace_ops for direct calls
> > 
> > I don't understand the arm usage of op->direct_call, but it looks like
> > (codex thinks) that the fast path won't always work without op->direct_call
> > being set
> 
> 
> In theory, op->direct_call is the fallback for the case:
> HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS=y, out-of-range target, and non-BPF
> direct ops. This is what Codex thinks about.
> 
> However, after searching the call sites of
> register_ftrace_direct()/__modify_ftrace_direct() in kernel, which would
> set ops->direct_call, the actual callers are in bpf/trampoline.c, which
> have been gated with HAVE_SINGLE_FTRACE_DIRECT_OPS. That said, for
> normal usage of HAVE_SINGLE_FTRACE_DIRECT_OPS=y, op->direct_call is unused.
> 
> If someone uses register_ftrace_direct() or
> modify_ftrace_direct/_nolock() outside BPF in the future,
> op->direct_call will be used.

so any 2nd user on the same function triggers the slow path,
and that's fine, the single_ops handles slow path correctly

but IIUC the out-of-range target will now always go through slow path,
which in current code it doesn't, right?

jirka
