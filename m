Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630116;
	b=H3IonOkcMz6nmg+LsJYwwwJtSSLj5qTc0R7W1Z6FUtHg5e2akzgXH+gZN8NjXM5MsZa2
	 YSdQVsZcGXFl2e00eOKlEZxD7Ykq7LZhpkkMbdqYsO8ZREakSYdQ3TLDOsTelqi2qGlkn
	 GZ0DoozmekKB2UFyFt7Lmnq2OjD8/sMlFKcgWqThMwGFRjQ/rH4Xg8v2TPJaVafJfOaZq
	 HPczea8ZYTH9D8ToNGDNDnYF+beshZwO+X3MTNtVez2qgaQ0U/t3W7PIxg2FPcWgmbggK
	 VlpIQ8rwA7G7dKLnTvcWLU5uVdBHGYi2Eh+OMpLGSETcIwyBBPJeLm85dplYMwo9TXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630116;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eNx5ZwxwQF3pCAIZSJDgbBLvyG1xG91t2PRrZIJMuvY=;
	b=2LZDQ4FroWytD8A/AAIuBSx9g4z6NPoyMSCGPd10G8gWRVYLqXXJe1w9iFFrIiZEn3z2
	 FSAehcGsqjVKrKHkcvRLIqPZK2iZ1pJehZMSzcyakffX6NXpMFMLtMietXkKZ/191yOW9
	 oI63SIttMCDPpD9+Oz6tRmT3sVqckKIHMzRat4IjHKyks1SbY2iQQlNvkEajN6AksQt6T
	 HLhozVpPmNendFN1M9Qpje2dRoKnNEQJkInyXRj00YaPHwLGOavwq4/KasTDzhiqXZneR
	 P89VlGcVL687CofGHH16m80rxWFaoeGuSpFkE1I/qr/L779pRHyGEeD4+gPAImArXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz1BodnZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2AF606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz1BodnZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EA11F00A19
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630116;
	bh=eNx5ZwxwQF3pCAIZSJDgbBLvyG1xG91t2PRrZIJMuvY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hz1BodnZcBZT/KUwNGE15a/sxBOr1vuiHCkTfm7U6wkJkAQdx0ore508uH+2Dx2cx
	 YU6ThbEHy3L5YaWUAx1ZkYdNoqGrUskSAJKSsLpYfKR/ewNgQuQelvtdeWq+anG+tf
	 hux2kmccH24GanEaohs+3C8bKyd85w2TaippKDpmJLPYoe8o6vCBtighNFHySpYc/2
	 9rxxShcP+EpmowKq2i0l6jHMgeuarQlzPXHXtN3tDoj/ReAseB5Tyi8llFQ2q4Lb5o
	 Cn1apVqM9Ied3S1tfgh0b9UyremBYtzFylKEiEko+rBtW1FCZsepAENxuWxwQ95/ww
	 hH6qxEtD8gFSw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c15956ce07so5665917e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:08:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGu7bY7TRLlmYwBtBRJpVaGCfEoXeCMj/4epIjJnh1u4WKnqNY7xZNedBZCgpZYQdWEnbH82l4t7QQXgavbvIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VVNIUZvWEeK9yyQrO3VyAetYqqvsGDe/3fmo3ZtpSg+wR0zSZ
	Ji44APzBIOll+d8ya07a2zEa+xPcbou7V+dnbcC30/mL4cw5NHtr1UTIRUXrZhKFY1+OOvoAbn+
	tFZdF+bzJLsYgTtuoi9Nw+yAg2FxhudU=
X-Received: by 2002:a05:6512:85c6:10b0:5c3:182f:bac5 with SMTP id
 2adb3069b0e04-5c3182fbd1fmr1537008e87.0.1795630114620; Wed, 25 Nov 2026
 10:08:34 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111114225.3977243-1-ruanjinjie@huawei.com> <20261111114225.3977243-2-ruanjinjie@huawei.com>
In-Reply-To: <20261111114225.3977243-2-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:08:22 +0100
X-Gmail-Original-Message-ID: <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
X-Gm-Features: Aa3M54q6226d-LNf-pEP1kf8MunikGkNJM-jG6MXhZoLCqA1MQYdS9z2y0_SJt8
Message-ID: <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
Subject: Re: [PATCH v21 01/15] arm64: ptrace: Fix spurious pseudo-single-step
 for PTRACE_SYSEMU_SINGLESTEP
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	oleg@redhat.com, shuah@kernel.org, kees@kernel.org, luto@amacapital.net, 
	wad@chromium.org, peterz@infradead.org, ada.coupriediaz@arm.com, 
	kevin.brodsky@arm.com, anshuman.khandual@arm.com, thuth@redhat.com, 
	james.morse@arm.com, yeoreum.yun@arm.com, vladimir.murzin@arm.com, 
	broonie@kernel.org, ryan.roberts@arm.com, liqiang01@kylinos.cn, 
	mathieu.desnoyers@efficios.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:43=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
> Since commit ac2081cdc4d99 ("arm64: ptrace: Consistently use
> pseudo-singlestep exceptions"), syscall_trace_exit() injects a
> pseudo-single-step SIGTRAP (si_code SI_USER) whenever _TIF_SINGLESTEP is
> set, including for an emulated system call.
>
> That pseudo-step was added for PTRACE_SINGLESTEP: the system call runs,
> and the tracer must get a stop at the return address to inspect the
> result. An emulated system call does not run, and its syscall-enter-stop
> already reports the SVC, as the x86 implementation and generic entry
> (report_single_step()) both say. The extra stop is wrong:
>
> 1) Stepping armed before the SVC (the normal case). The SVC exception
>    leaves the step pending (SPSR_EL1.SS is 0, Arm ARM D2.11.5.1), so the
>    hardware step is taken at the return address anyway, and the tracer
>    now stops there twice without the tracee executing anything:
>
>         syscall-enter-stop  pc=3DL
>         pseudo-step         pc=3DL    si_code=3DSI_USER  <- added by that=
 commit
>         hardware step       pc=3DL    si_code=3DTRAP_TRACE
>         hardware step       pc=3DL+4
>
> 2) Stepping armed after the SVC, e.g. a tracer resuming a
>    PTRACE_EVENT_SECCOMP stop with PTRACE_SYSEMU_SINGLESTEP. The first
>    stop is the pseudo-step at L, so the instruction at L is not
>    executed before the step is reported. Before that commit, and on
>    x86, the first stop follows the instruction at L.
>
> Skip the pseudo-step when _TIF_SYSCALL_EMU is set, as generic entry
> does. The behaviour of PTRACE_SYSEMU_SINGLESTEP goes back to what it was
> before that commit. PTRACE_SINGLESTEP is unaffected and still gets the
> pseudo-step, so both problems fixed by that commit stay fixed.
>
> Only tracers using PTRACE_SYSEMU_SINGLESTEP see the difference. Measured
> in QEMU, L is the instruction after the SVC:
>
>   case          before that commit   v7.4-rc1      this patch
>   normal        L, L+4               L, L, L+4     L, L+4
>   after seccomp L+4                  L             L+4
>
> Fixes: ac2081cdc4d99 ("arm64: ptrace: Consistently use pseudo-singlestep =
exceptions")
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This patch looks like something that should be sent separately and
even considered
for stable.

Can you please send this patch separately to the arm64 maintainers as
a fix?

Yours,
Linus Walleij
