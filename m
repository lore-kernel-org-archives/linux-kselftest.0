Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CC2F7EF2
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780361107; cv=none; b=C+5WoNMGCYV8bp/CmXNzJxPYnto/GMG1lP2GkNsi5/NvnqUHRTz3EBN6go2TO/34S8IrzTnPOmW2xb8eh7Hsewkhp+A6G+rC1H5lNx1tCpwcifjmpDjfFoi8rWLUorcYWke0t4Xdfc1G12vhitaGRTcnJ8HNLSiMJJuqRJRLD2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780361107; c=relaxed/simple;
	bh=Eg3Sf5jtbOOaNhYf44G6lZBmpK3xwTpVVZA1xoYG/Ho=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iuEkha1IyVyz3cx+z9r13FuMZDM9VRxgHilzEOlaWDilSbJOJBbVscgMacFC5C0d/aEjJpI2crzuzPOLhsVv7Cy7L1z4b27/cgiecubI5ttUPPmjGcdxziZB6CdOq9rqVL7QugphZBNM4A3SVQT9LI+vLy94WKId9/Fy+CzuWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=sz+SsyI5; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="sz+SsyI5"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137335bc3caso9178297c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 17:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780361105; x=1780965905; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+bPqt2VFnGfSWYj8U3E7M7ga6i72nvLLb6jzjJnAdw=;
        b=sz+SsyI5zN6IIsfMkBRzEWaWWhGhQV80rbI9Z6Gvu4NnnhU4zo59rU+WbZyEW57cym
         73uLGk3Mn2f1JM/bYE/imYqvpiB0/iuep667iR2Qh4SEb0lhHZm6ICQ8ehJiCqIe32D6
         Eyc8oBSHnUJzdLgbQzpk1mM9oZTOVLiYdPd8axUVb+VRBkslFMwogQLJxx9fcODXMQgC
         OfVBM7m1lwSIoefbPfPt/xzDD00/TU+QfleIGnivQjyUxm+YsqeJHVrrKuayK/qqBMdZ
         5zAmBbvLu/dCIF4VCCE1nWTr+CVybXEe3xohV1EWOtV79gQpImY/zr1r0kUABn5lgAob
         fn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780361105; x=1780965905;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+bPqt2VFnGfSWYj8U3E7M7ga6i72nvLLb6jzjJnAdw=;
        b=BJzgvqVuXr/aIydMZmskJe5OKkALOwpIjYUQDJTjV0FVBY0tJE4SGYhTB/F/rp+OVn
         6MBWQ3FPW2E4EjTtkWLdMPbl3P8R7WjokKAjs9DszZ6Zjm+Eqx78njc+zdt+lyh9LT5T
         pVbe1BRMGUYHUlHnuVJxN3ngHL8nPW99Y6PsnrMDdU5yj6dmbtdWIvZS2bSinwOfJoR+
         uZzfmzePkHhy/5H/x8UfCi9bvIuuX2yNYBcytcz5ZNimZ6wNUjzLj7pC78tbdLb9mQe/
         oAKVNZB8PNMCVye0k7+A5R2i67soa0UqkNVdgfj1vhfufpy2quJncQITTyDBB/IJR/PA
         fxtg==
X-Forwarded-Encrypted: i=1; AFNElJ/gMykDVYbR181DF5ki5Mlz3GGSY33gW7lBOT3dcFT5i9CftCaSL597oWGJ+QkIEki15k5hLVgeOeuDdRiZ3eg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg1gHXyv//kCTYrLN2ekPm6h0aYKj/NslJuOIk0EFhxZLbfBju
	xsp/Bsrx+7qH/iZFotmxYDXUZDCFZWWIYjeZbbx+yqgygLvtf89bGRLSjvVjWMQ6M4o=
X-Gm-Gg: Acq92OHnYtWz3l4Autok03EG0PIsv14lCDs5LZNnN0Jl2MYo3n1kKWPzJ5O1i3CUEoL
	qkRoDbYs0TNI801WepYUNEOXW2ZqqlwdH4/knyHN5PIroBgDhhjvUtN/uLhs8YrsV7YeqllYXyu
	mqnyZO/hdTqGPnAuu0DdR2z/5mlW16wyUOnipAN5mZc8NtMxdo5JfTMQtblrSv0lyKbCZrYgUI6
	hW7vSXgqKJKZ7KstOwTO/6aERizKRqa/oE5MeiSKzyriJ7in0AsS4krg5b4E2MRI9susawIzK4Z
	ZMgRlJ/NuyMUrVQ7pBf72vz0CifwUrkzexB7Znvq1YyjGUX4ltypvHuO8gyhZq0VYiKARtcVhPL
	3IwqMshSOwtTAq5KV+X99tyfDzPYJIihM/fib2LhAIJ+6IW/rD8g+uDWgp9ZCpejSg84J4bdChV
	coO9aPCDglHmCBw88=
X-Received: by 2002:a05:7022:2528:b0:137:9399:fc59 with SMTP id a92af1059eb24-137d425fd46mr5259764c88.21.1780361104925;
        Mon, 01 Jun 2026 17:45:04 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::4f12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c7fd47sm8651123c88.14.2026.06.01.17.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 17:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 20:45:01 -0400
Message-Id: <DIY5C759S2C7.MLK4G59NRVJ7@etsalapatis.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: ignore call depth accounting
 for retbleed in verifier tests
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>, "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260528-fix_tests_for_retbleed_stuff-v1-1-c2022a1f3bee@bootlin.com>
In-Reply-To: <20260528-fix_tests_for_retbleed_stuff-v1-1-c2022a1f3bee@bootlin.com>

On Thu May 28, 2026 at 9:27 AM EDT, Alexis Lothor=C3=A9 (eBPF Foundation) w=
rote:
> When running the selftests on a retbleed-affected platform (eg:
> Skylake), with call depth accounting enabled
> (CONFIG_CALL_DEPTH_TRACKING=3Dy) _and_ with retbleed=3Dstuff, some verifi=
er
> selftests fail to validate the jited instructions. For example:
>
>   MATCHED    SUBSTR: '	endbr64'
>   MATCHED    SUBSTR: '	nopl	(%rax,%rax)'
>   MATCHED    SUBSTR: '	xorq	%rax, %rax'
>   MATCHED    SUBSTR: '	pushq	%rbp'
>   MATCHED    SUBSTR: '	movq	%rsp, %rbp'
>   MATCHED    SUBSTR: '	endbr64'
>   MATCHED    SUBSTR: '	cmpq	$0x21, %rax'
>   MATCHED    SUBSTR: '	ja	L0'
>   MATCHED    SUBSTR: '	pushq	%rax'
>   MATCHED    SUBSTR: '	movq	%rsp, %rax'
>   MATCHED    SUBSTR: '	jmp	L1'
>   MATCHED    SUBSTR: 'L0:	pushq	%rax'
>   MATCHED    SUBSTR: 'L1:	pushq	%rax'
>   MATCHED    SUBSTR: '	movq	-0x10(%rbp), %rax'
>   WRONG LINE  REGEX: '	callq	0x{{.*}}'
>
> Those affected selftests allways fail on some call instruction: this
> failure is due to the JIT compiler emitting call depth accounting for
> retbleed mitigation (see x86_call_depth_emit_accounting calls in
> bpf_jit_comp.c), resulting in an additional instruction being inserted
> in front of every call instruction, similar to this one:
>
>   sarq    $0x5, %gs:-0x39882741(%rip)
>
> Fix those selftests by allowing them to ignore this possibly present
> call depth accounting instruction.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>

Makes sense.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/testing/selftests/bpf/progs/verifier_private_stack.c | 5 +++++
>  tools/testing/selftests/bpf/progs/verifier_tailcall_jit.c  | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/verifier_private_stack.c b=
/tools/testing/selftests/bpf/progs/verifier_private_stack.c
> index 046f7445a458..bb8206e10880 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_private_stack.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
> @@ -94,6 +94,7 @@ __jited("	addq	%gs:{{.*}}, %r9")
>  __jited("	movl	$0x2a, %edi")
>  __jited("	movq	%rdi, -0x200(%r9)")
>  __jited("	pushq	%r9")
> +__jited("...")
>  __jited("	callq	0x{{.*}}")
>  __jited("	popq	%r9")
>  __jited("	xorl	%eax, %eax")
> @@ -153,11 +154,13 @@ __jited("	endbr64")
>  __jited("	movabsq	$0x{{.*}}, %r9")
>  __jited("	addq	%gs:{{.*}}, %r9")
>  __jited("	pushq	%r9")
> +__jited("...")
>  __jited("	callq")
>  __jited("	popq	%r9")
>  __jited("	movl	$0x2a, %edi")
>  __jited("	movq	%rdi, -0x200(%r9)")
>  __jited("	pushq	%r9")
> +__jited("...")
>  __jited("	callq")
>  __jited("	popq	%r9")
>  __arch_arm64
> @@ -199,6 +202,7 @@ __description("Private stack, exception in main prog"=
)
>  __success __retval(0)
>  __arch_x86_64
>  __jited("	pushq	%r9")
> +__jited("...")
>  __jited("	callq")
>  __jited("	popq	%r9")
>  __arch_arm64
> @@ -246,6 +250,7 @@ __success __retval(0)
>  __arch_x86_64
>  __jited("	movq	%rdi, -0x200(%r9)")
>  __jited("	pushq	%r9")
> +__jited("...")
>  __jited("	callq")
>  __jited("	popq	%r9")
>  __arch_arm64
> diff --git a/tools/testing/selftests/bpf/progs/verifier_tailcall_jit.c b/=
tools/testing/selftests/bpf/progs/verifier_tailcall_jit.c
> index 8d60c634a114..48fa34d2959f 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_tailcall_jit.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_tailcall_jit.c
> @@ -56,6 +56,7 @@ __jited("L1:	pushq	%rax")			/* rbp[-16] =3D rax        =
 */
>   * (cause original rax might be clobbered by this point)
>   */
>  __jited("	movq	-0x10(%rbp), %rax")
> +__jited("...")
>  __jited("	callq	0x{{.*}}")		/* call to sub()          */
>  __jited("	xorl	%eax, %eax")
>  __jited("	leave")
>
> ---
> base-commit: 4a8eaccfdd6f4ae4b0e8735664e9d3e5ce826329
> change-id: 20260528-fix_tests_for_retbleed_stuff-c3c89b738e70
>
> Best regards,
> -- =20
> Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.com>

