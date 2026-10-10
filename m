Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA73914EE
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649472; cv=pass; b=lJ0vDYbrdP178pI1f6iHF6J1Iy3BDJbGUAGQL046A3q5Nes8nXf+qsQD8H7t7KMljXjj65uyr4oMPozAArzX0LWW2ZvAF05TSshomN3ijbmpufKwdXCuHAKoujz93g4oAzNFKhDDQZjkHTjAA6G3k95ficbBWf1Cm89gSkyoRFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649472; c=relaxed/simple;
	bh=twLfEwV6ObJQ/5FqVixRMsFK7uHd6mkaxdtnB+fAdKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YO43X0e9x/Hf6lnBczmzYuMgaNCzz+yWogsjxBALTLiK0wgC95Xx4Nb9y4RfJy9G2LRGLZdty2LruzJUvXfw2NLRVd7hJr/kX13zFAc6+EDgsUoWv2laTdRWZ/amrMNHjNg7fy0QWpdNlild5eBVb299yWH5VbNiG9R9J8XcNF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/EdPuDp; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/EdPuDp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so88600066b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 09:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791649469; cv=none;
        d=google.com; s=arc-20260327;
        b=NOWkNch5qSBCFSnRM5Uh+t/BDkSKXZb8de8CPloJTWxwDfddPSFx12ycG1uso6QTBJ
         tMqn5FgRwvpzXIUomjc561sW1TbuR3o6asvwDJRBd2leWRH1HnrjQgyXbuG440COIMTb
         YlK/7PJ4Zp4YXEUzwhepAvQuJWShU7uiORcEchhxjnibUs4U5l7oyeSQNNQq3ByYtMWy
         7N+RrXWRe3WBflHvARmcedhbRdbutU6kI13+hxB9IKK1S2Sh/YSQGNLHYEgWZyv3EJMP
         oqoh2NhqUfuq6Za7oq7nVMANaddsTAmSsGsZ6Ieq/6A6m0K6Pj9k3aQyCaJ/wiNC1Gh0
         KbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OaXanGBebs9+G2VzyCDD+GE40p6rSCcLN7l/Dz8kZY8=;
        fh=xwuAAvdX85gH49odU5PUS9w1Bzz3zFjnrz4Tp5d8hfU=;
        b=RBwVfwcd+mfUAk8loHFLI8rhlOO8/l0fZcnlqt2PKq81FHKqDGK+kNLz8MNT6KGpox
         T7dzGhdIhHr4VR8OvFigviXGY8JSyUZIoGLhT8VFeYTSttHsdyCcQOf0+1NV2kqk0OOx
         PWmCSzoBx5DVPN3vlGZEiWYF02aCMC23oaRvSzgRqfSpHemMvfbiWNNMB2/nPa6Hfx+W
         VJ1LzkFB0uJrkTJ1I95kpNy0cfFKq/6pj4u0sprj4lWqGR+j65WA+DKhYp4a3QAYPwyE
         6R5YNUgHJR9QYhYoi+lyp+Wy3dzE9pObYI95HiQWUBYikATB8i57oP8aRhDBYorbpVls
         yeVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791649469; x=1792254269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaXanGBebs9+G2VzyCDD+GE40p6rSCcLN7l/Dz8kZY8=;
        b=Q/EdPuDpsppIZsS08ciipGnVpR2ZcZK8ayh+kEPs5guBp8vGh7jdTZN240hhShAQvc
         jFEEt7sL/ZbqqSt+w2HKzYXyFVtm2Y9DrZsqXXLSWcFtNT0vBkdXRPzw0XVzhNrYECAJ
         z3Ua0KIwYEClYNnF01ejR++0ldf8x2EvzLW4lYa1IfgY6W2tlNHhe44M4xJqLV3Z2bVC
         PDerhAW/YMgZIwRrh62cBTxyjIivFBfU9iraiWifDXa85ty3YAst9GeFkxOzGGAgz1Nn
         mID0fQKo2SL1EH6XaRzpjVuMYgT2neB2V+j83voB8fFtDVOKx2GWG+I3Oz/PenEkA2L6
         DFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791649469; x=1792254269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaXanGBebs9+G2VzyCDD+GE40p6rSCcLN7l/Dz8kZY8=;
        b=xU70gyST+/GMbpRzoQCOP5AcVIDoCB9H/gCYwjWwQrtva+BwyrOC8/XxpT2+sgN3fv
         7Ojwk/Ad7v/Lrc0YpXUD364q+dmI7+WzCqboNpHqq0P7miUzw3fQsC5kg5zI9F6pcDw1
         dyL3pwyTYYIwVk3y3R2md4K5GPFvcmFWe4kHGszetJZfw2f5I0Cqm63iClnaKHzi2mmR
         x28jAEXY7gKWri20QxZDskH9MnH54rphplfp6cBBHLvraopjRF1my7IAe8/keLWUVcGK
         AqXx27xWKJura4R7Ac2PUF8FyG24uSXO4ArP0/x1mxDZoD0acoYlBHSNK0hRqNdztZ8Z
         wdPw==
X-Forwarded-Encrypted: i=1; AKwUvBxnALgepXa49vV1pMi8WBk/E2GhovGMoa1bqpxEp8vDCfRKsXFmcjJiznebLXwLkfidAHcO/a2NHdaJjBxJD3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL18xGW+jnQ6coQWiZztzM9t6FCbWdp7YXMOtsXePUtWsQXsLEi
	W/jI0vC0+lgIbQsT7hBsLjBJnKJQP/XoJmtgUluWfHOVbaDRp1i+EuA3MGgzv0qymzVwCJBXHQ4
	O0NJXz6F2oHRxCpPkUtfE1Wc5rtq6jWc=
X-Gm-Gg: AYBFou2S04ePBICS1Z9QNV8jN+1UmMZFHbnp8I9umY55LALiVwJPDMVMLKE1my2GKn7
	LAIya1lpSVtFOoXWFxOZ2OWIwpUuaXgWWVKYzWMhTQhs49gN9OxxK6f7USSWiPDg2D4zIe7Lv0z
	m+tq+kAGc8fo/njs+znXWQsMybv8RJBs6eCelG9gqjokqeaOsoRQRxvHxgriPwEmK71L/rMYwgq
	PAG5DO0meBwIw5Rh0856Fy0iP4NAqREbS780VjAol+iA7vst+FKByOwvbAfJL3bryS3jU3V1Udh
	4VkG+EnXImDDJMw/rtatwSNoDrkxyjpTe9Gw/ytHmI7goIJatAbmJ0bVL25tVnBiGxtTbcSNOSV
	lEpOtxW3fAejTdA0BkqgPtDajrVXMTUhHJ0xgaHKX2y4=
X-Received: by 2002:a17:907:97c2:b0:c27:420b:7c79 with SMTP id
 a640c23a62f3a-c31aa0e3cd3mr536202066b.48.1791649468591; Sat, 10 Oct 2026
 09:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010134214.974565-1-linmag7@gmail.com>
In-Reply-To: <20261010134214.974565-1-linmag7@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 18:24:16 +0200
X-Gm-Features: AclHuK8E16LmFWC8Rwocxl7k5fzsA-InTEpONC_qPKrw8IjRgNUYjmtwqIv4ayQ
Message-ID: <CA+=Fv5R0fiZuzDLPOZcZt6p1CtSnATELgvns_nKA1qwemKHvWA@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/seccomp: add Alpha support to seccomp_bpf
To: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, wad@chromium.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, Oct 10, 2026 at 3:42=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Enable the seccomp BPF selftests on Alpha with a fallback seccomp syscall
> number and architecture-specific syscall register accessors.
>
> Use the NT_PRSTATUS register layout rather than struct pt_regs. The
> register set contains r0-r30 followed by pc and unique. Read and update
> the syscall number in r1, and set both r0 and the r19/a3 error flag when
> synthesizing syscall results.
>
> At syscall entry, r19 still contains the fourth syscall argument, so
> callers setting a synthetic return value must also set the syscall
> number to -1 to skip execution.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Reviewed-by: Matt Turner <mattst88@gmail.com>
> ---
> Changes in v3:
> - Drop the /proc/self/syscall availability check and its commit-message
>   paragraph. Alpha selects HAVE_ARCH_TRACEHOOK.
> - Document that setting r19/a3 at syscall entry requires callers to also
>   set the syscall number to -1.
> - Add Matt Turner's Reviewed-by after addressing his review comments.
>
> Changes in v2:
> - Use the NT_PRSTATUS layout for PTRACE_GETREGSET/PTRACE_SETREGSET.
> - Set the Alpha return value and error flag together.
> - Check for /proc/self/syscall at runtime (removed in v3).
>
> Validation on AlphaServer ES40, GCC 15.2.1, running
> 7.3.0-rc1-es40-tsunami-v5a+:
> - Standard v3 and the original baseline binary both report 98 pass,
>   1 fail, 12 skip. The common failure is the 30-second timeout in
>   user_notification_wait_killable_after_reply.
> - A separate diagnostic build extending only that test's timeout to
>   180 seconds completes it in 34.938 seconds. The full diagnostic run
>   reports 99 pass, 0 fail, 12 skip. No timeout change is in this patch.
>
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testin=
g/selftests/seccomp/seccomp_bpf.c
> index 0622bc2..79e8eb3 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -136,6 +136,8 @@ struct seccomp_data {
>  #  define __NR_seccomp 354
>  # elif defined(__x86_64__)
>  #  define __NR_seccomp 317
> +# elif defined(__alpha__)
> +#  define __NR_seccomp 514
>  # elif defined(__arm__)
>  #  define __NR_seccomp 383
>  # elif defined(__aarch64__)
> @@ -1754,6 +1756,30 @@ TEST_F(TRACE_poke, getpid_runs_normally)
>  # define ARCH_REGS             struct user_regs_struct
>  # define SYSCALL_NUM(_regs)    (_regs).orig_eax
>  # define SYSCALL_RET(_regs)    (_regs).eax
> +#elif defined(__alpha__)
> +/* NT_PRSTATUS contains r0-r30, pc and unique, not struct pt_regs. */
> +struct alpha_regs {
> +       unsigned long regs[33];
> +};
> +
> +# define ARCH_REGS             struct alpha_regs
> +/* The kernel keeps the mutable syscall number in r1. */
> +# define SYSCALL_NUM(_regs)    ((_regs).regs[1])
> +# define SYSCALL_RET(_regs)    ((_regs).regs[0])
> +/*
> + * Alpha returns positive errno in r0 with the r19/a3 error flag set.
> + * At a syscall-entry stop, r19 is still the fourth syscall argument.
> + * Callers must also set the syscall number to -1 to skip the syscall
> + * before replacing r19 with the error flag.
> + */
> +# define SYSCALL_RET_SET(_regs, _val)                          \
> +       do {                                                    \
> +               struct alpha_regs *__regs =3D &(_regs);           \
> +               long __ret =3D (_val);                            \
> +                                                               \
> +               __regs->regs[0] =3D __ret < 0 ? -__ret : __ret;   \
> +               __regs->regs[19] =3D __ret < 0;                   \
> +       } while (0)
>  #elif defined(__arm__)
>  # define ARCH_REGS             struct pt_regs
>  # define SYSCALL_NUM(_regs)    (_regs).ARM_r7
> --
> 2.43.0
>

Kees,
Would you be OK with me taking this patch through my Alpha tree?
The Alpha kernel support is already upstream.

v3 carries Matt's Reviewed-by. On my ES40, it matches the baseline:
98 passes, 12 skips and one timeout. Extending that timeout gives
99 passes and 12 skips; that adjustment is not part of the patch.

Link:
https://lore.kernel.org/linux-alpha/20261010134214.974565-1-linmag7@gmail.c=
om/

Thanks,
Magnus
