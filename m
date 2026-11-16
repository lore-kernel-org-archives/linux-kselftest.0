Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852645;
	b=IQEZExXzT5xdVj+qaKMX4aPSWq4585itAsQjrn+jYnO6ditufylaNcLY0Mt4oqc//YX+
	 EOKjsobbaULWMAR7d5Mc9s8xbm89zOVhyJy9LV4D7MUF4YFW2OxC8VNasPXYef700X8LQ
	 WDJrc9p0lW1sbymaIyIBjuQ/Mzgg5N0cg9Kg/C4ENp+SIRQ1iU+CMLiohfZUTP8T16vva
	 4Fxm105cbxjqYrw9trjHnJsLqjgj2uS8tA1C12hCzr/k0vBIJaH/APBga5RKbN852hZ0E
	 34xBBgq6FeQq8dONH3S6JnMRl09Kal0t63jPus9lQ3p6S511ukxODeqDJWCH1vUjujg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
	b=TTOi3xDt18ljsh1aqkJkUgZ5IS3d73WxfYo8mptPtxez7Jem1v+2dKBO1lHKsQMorRZj
	 lSFkpuQ/uomAZJYzEbnQQU2VN6jw01wjHbQDiXb0bZzw6YYpNHsv98dXdmGjCsN/+R1Yc
	 wW2Wa6tH28qqFbMR5lK+fjFdhZFmmbmdKkdGWqbbU1j3+UFO79E9VrdkNFT6nXjc+69wl
	 Xa84SSHw2W5tU5Remo36K45INnLsPPc6+A5NCxR4GzVsd3buHpwTrp/E4rzBrq52eH6Bs
	 f+9joVu0rVHHI1LQ41vZLtuxmkCoYBwJdrePu8xV4/tMri9jFEtv+FtMiFpe7GQJWTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0lt4j5h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D89606A32C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 18:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D89606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0lt4j5h
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso5242347a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 10:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852643; cv=none;
        d=google.com; s=arc-20260327;
        b=VhBSVND/P1oS1NJ3BEBL/Ws1G3D4ru8Z7azejGE3oCedYySO2w3Ldzy2GLBKcgmPea
         Uzjd9Z2Nvwu0TseZGT/uy0nXV/lnUrIn5RY8bX4ycOUK6V8ck93LeftjQdYQAcxUdtSu
         VNYfYo9MfCucoGH/wqxAkx5NKjs/5mRZj4S3L/StTXZukVzzTcEm4dgO50qwdf3dEgEv
         9E+cNeuGFMf5fPOAaGErThptwtvcBm8YwEu/L0+8RfJQ/ix/u4hwLox4o0c1iqlG7Dbo
         gvS1lRjkYdsHmPCxCvS/iKkMWofX0Du/tfvQLxqODRMEAl03muP7BD8K28UStC4Uaz3Z
         o9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        fh=UBjHl3llgSYeCYmSL1ZckNUeYPpBGdIzTZ4L/VXFzKg=;
        b=BqLYhWFwE3wQuU5LrXuX57Rq01TMkHVL2BVbp38DdGluQa+Q+pMqkGQh7DqNcoS0aD
         ncPmavPt8xYJnd0Fcd/2eNUKLVOfHF4SOM9a1/6ulZk141bi0rnH8dh9OFKTOACMY03N
         pKrHzIZ6BKvWrqyZqUvkKl/Mm74GL0fNhkBXyS5ma0bxjluChZgfDOn4iRHEhTK8SRVl
         3XBykMbfDLBVsoeS+iIA0jNpZZIE3Gj2mTvZ8tBuI/H3vuDHJagFHIKtl0d6QfG0g8tj
         ITX4AAy9EwNkdFzxcuvM8sr6hlnGmPuWwsrS6B+IatR4rIUcUmRk5FM2XL5yzBjMju/0
         BHFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852643; x=1795457443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=x0lt4j5h7o5ZOIupC6QpocZBfmv8wFzUHnqEUjT+qXXHs4fqM/212o+JPya3Ne+Seo
         tLIn+ce71Roeft17QbgYTLYZCJ0+SlsLtt4o2OLm95aLJ5VyGYDhMzriK8UdMTHsHNnj
         8mTqTlr5/Ax8I+pLOcrqBMRwU57PT7keOGJO4t4tmQGJKRYz/1wZ/uaK+JY6cLy80yx1
         pkobwBcMhURP6h4GfSR12sTX8GLQ2Qvn5juEllVfsWcYtDCP4X7X2kujH+BqvT2pv+Ny
         N7Wj9fipbTOHczIeVSeB+l1xH0/w8nez4g0GJUB68vMGCquO73GzeOY0af50BLWOXJ1z
         6RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852643; x=1795457443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=yapqexyhAUATmbXBwu3rtbTQKnAODD44SDDuL3E3876oWTaLTk+yFUe0i5HvAp5Iur
         PJHeGRIV8GooFNBEGiL8JIIAZlJkNvKkAIl24bH7Bn7RlT3yxnSVbUgdECjE/ZmRoSh8
         ujLXGnLZa0zQNME4MD0fkUvFemwfzGPBDvDzk28dy//F0QcjsO6wsZswyOdFrWMINNs/
         xcwugPf+TyXxgz5ILufXlWvyunr+D+sTwJ3NnwbmO54dS8l3j2FHLzUyaEnMH3A+1Bt2
         r4cXV99qcxQ84DLmoJi45Pd5jBrgHxSQfMpAUvSOjn6YzOhu97mRR5DcvaltDnGHOyP3
         4gBA==
X-Forwarded-Encrypted: i=1; AL+hErHo0F41FdOotPB6GeQY3H4H3LgvQPeG3ndF1spDdAb+NE/GEXO+AU+eWFd2GIh44IQieeN41Sm+eMB5wwaEp2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TxkuMJxXOrkBgnY1xdL39TNM+Ddhjaz2cghVTwqZdkADr/b3q
	jNieMyI3MiLkaCDCXPgskXHgpUfgnyLKTiMFATPerneWb/EzazOKN59NkqIEzSNzvN0/XD1sFzV
	od1XnzbGhA63VoAtzE0WRcMb4GA13M9Y=
X-Gm-Gg: AYBFou3Mg6wKpYBLlaATVhZ+RbidTtyF1D9/6By5SXSliClnlOxgGd1RY3NsojLSn6y
	w7flLMENfd13oIUg5W+Cxhtq8oD8JmzGYrOkEMthnFrFPd0w45FdHsTsZj7ssloJl/BB2wgogwm
	kEvAMutl13rWaIOGLhJObW9tmBRFe0PIjXwa2V+ET1GubS4XVslpA4LllTaaliuVtB1JLqrxViI
	7TTquwhXVsupPugCOHpZUKG1PZcwiHVt5NAbfgVgdX8ieHloxSAmdeXDOrHEgbbPPOzbgw+NYzk
	8GtaIxEPO3wuhCaY+BKZE3Lc/+8roRD7EWVTjeHUwOiLMx+6MHq/8rhAn+y0KcWTRJDHVeX2QYJ
	Gtsf8HNBYSbYk9IRAyuMDkAASKQ9lm4H3hRf63Uwjg0giUlmoJelIPFGq89Ll5uA3XcPABW3XK0
	lkhewDE2Xnj9ed7I6eO3PlHhSDGxyK8HhQC5+0dAvSHTdP
X-Received: by 2002:aa7:c4cc:0:b0:6b4:1037:2bb1 with SMTP id
 4fb4d7f45d1cf-6b7c0bc27a9mr6612692a12.22.1794852642773; Mon, 16 Nov 2026
 10:10:42 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114184720.373178-1-renzo@cs.unibo.it> <20261114184720.373178-2-renzo@cs.unibo.it>
In-Reply-To: <20261114184720.373178-2-renzo@cs.unibo.it>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Nov 2026 19:10:30 +0100
X-Gm-Features: AclHuK-3zf0u-_tVqqSwOuwnlXe0JuQIB0eE-s6YSpQo7rK-ZYPGihb4jDlFOAE
Message-ID: <CA+=Fv5QPMYffznpkrEhZ3pMWtpHwNUUa3OaHxLexu8S47a7tRQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] asm/ptrace.h: add instruction_pointer_set
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Eugene Syromyatnikov <evgsyr@gmail.com>, Davide Berardi <berardi.dav@gmail.com>, 
	"Dmitry V . Levin" <ldv@strace.io>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, strace-devel@lists.strace.io, 
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Renzo,

On Sat, Nov 14, 2026 at 7:47=E2=80=AFPM Renzo Davoli <renzo@cs.unibo.it> wr=
ote:
>
> Add an instruction_pointer_set function for architectures that do
> not currently provide one.
>
> Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
> ---
>  arch/alpha/include/asm/ptrace.h      | 6 ++++++
>  arch/hexagon/include/asm/ptrace.h    | 6 ++++++
>  arch/m68k/include/asm/ptrace.h       | 6 ++++++
>  arch/microblaze/include/asm/ptrace.h | 6 ++++++
>  arch/nios2/include/asm/ptrace.h      | 6 ++++++
>  arch/um/include/asm/ptrace-generic.h | 6 ++++++
>  arch/xtensa/include/asm/ptrace.h     | 6 ++++++
>  7 files changed, 42 insertions(+)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 45d1229344b6..1a6f073e892e 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -33,6 +33,12 @@ static __always_inline bool regs_irqs_disabled(struct =
pt_regs *regs)
>         return arch_irqs_disabled_flags(regs->ps);
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  /* Syscall emulation defines */
>  #define PTRACE_SYSEMU                  0x1d
>  #define PTRACE_SYSEMU_SINGLESTEP       0x1e
> diff --git a/arch/hexagon/include/asm/ptrace.h b/arch/hexagon/include/asm=
/ptrace.h
> index ed35da1ee685..0a121f6e3bfc 100644
> --- a/arch/hexagon/include/asm/ptrace.h
> +++ b/arch/hexagon/include/asm/ptrace.h
> @@ -18,6 +18,12 @@ extern const char *regs_query_register_name(unsigned i=
nt offset);
>         ((struct pt_regs *) \
>          ((unsigned long)current_thread_info() + THREAD_SIZE) - 1)
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #if CONFIG_HEXAGON_ARCH_VERSION >=3D 4
>  #define arch_has_single_step() (1)
>  #endif
> diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrac=
e.h
> index bc86ce012025..6e8a8f0daee8 100644
> --- a/arch/m68k/include/asm/ptrace.h
> +++ b/arch/m68k/include/asm/ptrace.h
> @@ -18,6 +18,12 @@
>         (struct pt_regs *)((char *)current_thread_info() + THREAD_SIZE) -=
 1
>  #define current_user_stack_pointer() rdusp()
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define arch_has_single_step() (1)
>
>  #ifdef CONFIG_MMU
> diff --git a/arch/microblaze/include/asm/ptrace.h b/arch/microblaze/inclu=
de/asm/ptrace.h
> index 17982292a64f..69e10658d7a9 100644
> --- a/arch/microblaze/include/asm/ptrace.h
> +++ b/arch/microblaze/include/asm/ptrace.h
> @@ -20,5 +20,11 @@ static inline long regs_return_value(struct pt_regs *r=
egs)
>         return regs->r3;
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #endif /* __ASSEMBLER__ */
>  #endif /* _ASM_MICROBLAZE_PTRACE_H */
> diff --git a/arch/nios2/include/asm/ptrace.h b/arch/nios2/include/asm/ptr=
ace.h
> index 96cbcd40c7ce..d120d8ecb187 100644
> --- a/arch/nios2/include/asm/ptrace.h
> +++ b/arch/nios2/include/asm/ptrace.h
> @@ -70,6 +70,12 @@ struct switch_stack {
>  #define user_stack_pointer(regs)       ((regs)->sp)
>  extern void show_regs(struct pt_regs *);
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define current_pt_regs() \
>         ((struct pt_regs *)((unsigned long)current_thread_info() + THREAD=
_SIZE)\
>                 - 1)
> diff --git a/arch/um/include/asm/ptrace-generic.h b/arch/um/include/asm/p=
trace-generic.h
> index 62e9916078ec..632d4ce3334d 100644
> --- a/arch/um/include/asm/ptrace-generic.h
> +++ b/arch/um/include/asm/ptrace-generic.h
> @@ -29,6 +29,12 @@ struct pt_regs {
>
>  #define PTRACE_OLDSETOPTIONS 21
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>  #define PTRACE_GETFDPIC                31
>  #define PTRACE_GETFDPIC_EXEC   0
> diff --git a/arch/xtensa/include/asm/ptrace.h b/arch/xtensa/include/asm/p=
trace.h
> index d0568ff6d349..97b14418955e 100644
> --- a/arch/xtensa/include/asm/ptrace.h
> +++ b/arch/xtensa/include/asm/ptrace.h
> @@ -103,6 +103,12 @@ static inline unsigned long regs_return_value(struct=
 pt_regs *regs)
>         return regs->areg[2];
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  int do_syscall_trace_enter(struct pt_regs *regs);
>  void do_syscall_trace_leave(struct pt_regs *regs);
>
> --
> 2.47.3
>

The Alpha change looks good and applies cleanly on my for-next,
including the generic-entry fixes.

Tested both series together on my AlphaServer ES40. The ptrace
selftests passed on all three CPUs, including syscall skipping
and instruction-pointer modification.

For the Alpha part:

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
