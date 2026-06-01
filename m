Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD69338944E
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302546; cv=pass; b=crvH8CprwRRm9nbSLmAPLvKo55pgO/ay31BnyPgayj1Q2HpoxXPRLhGnYPZXaPbbS7wDqACK5Qgct/lGJyyIw6hZrRoixf5kp8mrAzWOiue8Al2AY5Q3809MV3yk20QjIYstZf98wH7k5g9+S/UZ615MLnN4H8ehRQZHt7lobKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302546; c=relaxed/simple;
	bh=+USH/4WFsR6fksFeSwEsjAe8sgtqFR1LKqN+uWh81GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjjQAJoxL6cY1OWbNs64545ysqfqu0qAUUpmrykQxvAF4QWP87mmJPH66eGbFIe8n93WHkuioFmZAI1eS3eR9MoaQgOZvqUDIs0+56zwI9fdAwCVOL+1mYtDKfJLhZR2dfcTcqqMQsBp86ydH31h0gmCxn9XlwrISNTma515KDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=G9ofhXkM; arc=pass smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="G9ofhXkM"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-69e2c792289so189841eaf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302544; cv=none;
        d=google.com; s=arc-20240605;
        b=LgBKJeEn2sxsaVj2dVmGGmmZuXoMIkNLug1MTjnETWSslJrx1XqGkK5Eynel39Dlpv
         2E0VbFznJKkmWUngz+YAskQR3exs9cjVa07AvqADKCEa+QAYGj498B2oWHRJdXAcOBcY
         JGtkYesWTOrIcIv/jNSB/2+SfbpBlkSzMIAX3yDQI2VZ7/Dlfenr6MH7de4q+HkmCewQ
         Pjm2kM/B8eOy4pXPr1Qr3hXvUafRmhLaFqBlXwSBCWbOTbADpM6Lfzu7V1BqTZJyIQYN
         OkpslstIYKERT1pfy8qAYfkD3tvsdMCZPUS1tL4v4Ho1j9gns4cM/PnvL58sLnIbpumB
         Ro6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T4uERWVbCtCe0m5H8gTjxpfOhUH2UbpUvtNnS13RKH0=;
        fh=G9RZfHBPkjKKXS1kkK4+mD8+wfaRX9hGLMkf2t+7bs0=;
        b=Jd+MnPJhM7oBg01Yk1PkZH7Mv0qaKmerekqaoPqpGPxN4NS7Ji0qXSObjvUQOa13Ef
         d5tiqlz4isuhoUDUwuXvJr04sMGrifZmtLplq921A3wZcROpO+qrO40yrhMyS1N0lHLS
         xhOxR/B7N+mxizFubJI0VtO/E+ccU1ctyxNo7LOEjX2uO2+n/fz+kKpTTRKL8R1j5QMB
         XZfhgpZ0OWYi8MqSi/CqoawZaKwiW4d4KewB7P+1myzoIY0LYo2YYCWYTXRoX8A750q8
         H83FJoVdCX+gAipUmR0TzL0LPLhVpTPpDV6Q8tMzS+yg7C/eS09aKMs+TL0s3lpnZpOj
         VQ5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780302544; x=1780907344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4uERWVbCtCe0m5H8gTjxpfOhUH2UbpUvtNnS13RKH0=;
        b=G9ofhXkMlDm9BE10WHBMvv9BghBmLOhCM8IcepTxyuBG5R9TQmm2PGZnWS+0Kt6Jte
         FzTKikwLauh3UpLX7GQPRfoD99w7Lz3PI8IELtrO4bfPEXpV4zYMBsqSsf7i1bMsdUfw
         7G8AJmSeu5vdodmW0adSXd+dzxLQJO6SGpqbdVUzuvhJxPmP+ka2n7YtCn7Gg07R+UMU
         FTN8iZ0z1o8LgaFzuPgLy86B2042B+QvC5cpq6LfOwhzDEd5IF/tfZrrYqFVUh0NCUeg
         K2rDTqvKQ8mW8o4wOfbHOGvDBmh+MJKxwhlyO/BwWSqUN43CmYmd3HghWQF1FerZNohH
         Y7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302544; x=1780907344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T4uERWVbCtCe0m5H8gTjxpfOhUH2UbpUvtNnS13RKH0=;
        b=PqBLY13HMryhii900FX2PoHkipHuHKD9Iv7sEURUUwHXIh+AnptNkmyXPmj3iIM3fx
         3pFagn6n3uSjsk9oKy2qosdSzVUjeQ5ed8Tix4Yz4sCFGq7ZWRDK4Clypg5sijM55XoS
         8PQdcOPo8TN4t8SPvXH0FvG866szqDzynzZN5Mh9r6TIzlm9FpT1x+/PyRRfo3C6luEK
         xB7BQ1Asksx7kcLhrUQ8APyyV8iIcaG097ouPZPAjPgczXLEqwvSbdX77eGsVkCNo79v
         KaGeoNmUpwABdntxVHkw2mkrkoEIy2akD0aLQ+bYL14ZVX3UiNcOO/i5d5EZmj7r+LCo
         nIsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/w1tnlPfLGRLOZPrXt6dmrxvIKzT2I6LZG191/vB46Hdbs9gkX6+VDyGcqz3jdzVgy93DhJtxzPr/8Za1befQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJ3RTMI93uYKkJEg4JhPc9yUtYfjpXuUemlq8XKaopD5om876
	gyHzXKZTqGtpesBvx1xrbvl4Syo0GXEblnLwvLQe9xCBPrbdkFObv7sVF0tz9p7x4nCNoRTUHUu
	RX46U8nrm5tzjeZhT9CSKkX5QjyopRMoFoAC61y1OsA==
X-Gm-Gg: Acq92OFH0Jk7jUiJTl0mTCjkTOqTLw48EJJIFPUqtwhid9hRuLJ1sdEB3l56+Rb2ff+
	6YivDJHG95tqhOrSnt0XgPkQv2cuxkqWusBjSAoEur/7WmpSPHVFlZhVqWNhHcv8gNUxB916m7m
	LQuu+grhKTsg/VbEqB5nH3YM4kvICeDK/griQW6uQq7TmKS8nU7dD3ndR1/sCfVUhbRixTo1jMR
	bC2FUIuqV+jhEj9IW6jKxHPAtdvQldzCeNg6iRMVCnz9RhkYszsoeKa85zEQ7zW1nO1zUdokQZx
	Q4GXYGC1Hkybx9ucJL53IxGviGQ08v+Lt37vb8uy5BHYfDFWqj1ciZ8KwHQzJHn1RVIeKcCPxTG
	yryB8pASHdLOiChJWyySoM9nYA+6adtTJB1uo2A==
X-Received: by 2002:a05:6820:812:b0:699:b131:d597 with SMTP id
 006d021491bc7-69e102b1845mr5081053eaf.6.1780302543533; Mon, 01 Jun 2026
 01:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com> <20260511-rva23u64-hwprobe-v2-v2-3-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-3-21c5a544f1dc@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 13:58:51 +0530
X-Gm-Features: AVHnY4J1GWaIVQKgCjbs8yN38J-g4wxDak7kSB1h-MokIhPcmqYhp9wP8gA_jbI
Message-ID: <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] riscv: Standardize extension capitalization
To: Paul Walmsley <pjw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Deepak Gupta <debug@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Christian Brauner <brauner@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
	Guodong Xu <guodong@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 7:06=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
>
> From: Charlie Jenkins <charlie@rivosinc.com>
>
> The base extensions are often lowercase and were written as lowercase in
> hwcap, but other references to these extensions in the kernel are
> uppercase. Standardize the case to make it easier to handle macro
> expansion.
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> [Apply KVM_ISA_EXT_ARR(), fixup all KVM use.]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

LGTM.

Acked-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Anup Patel <anup@brainfault.org>

@Paul, This patch is independent of other changes
in this series. If you are okay then I can take this single
patch through KVM RISC-V tree.

Regards,
Anup



>
> ---
> v2:
> - Rebased onto v7.1-rc2.
> - KVM_ISA_EXT_ARR() consolidation moved to its new upstream location
>   (kvm/isa.c); host-side checks now use kvm_riscv_isa_check_host().
> ---
>  arch/riscv/include/asm/hwcap.h     | 18 +++++++++---------
>  arch/riscv/include/asm/switch_to.h |  4 ++--
>  arch/riscv/kernel/cpufeature.c     | 32 ++++++++++++++++----------------
>  arch/riscv/kernel/sys_hwprobe.c    |  4 ++--
>  arch/riscv/kvm/isa.c               | 16 ++++++++--------
>  arch/riscv/kvm/main.c              |  2 +-
>  arch/riscv/kvm/vcpu_fp.c           | 20 ++++++++++----------
>  arch/riscv/kvm/vcpu_onereg.c       |  6 +++---
>  arch/riscv/kvm/vcpu_vector.c       | 10 +++++-----
>  9 files changed, 56 insertions(+), 56 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 7ef8e5f55c8dc..44bf8c7d8acc5 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -10,15 +10,15 @@
>
>  #include <uapi/asm/hwcap.h>
>
> -#define RISCV_ISA_EXT_a                ('a' - 'a')
> -#define RISCV_ISA_EXT_c                ('c' - 'a')
> -#define RISCV_ISA_EXT_d                ('d' - 'a')
> -#define RISCV_ISA_EXT_f                ('f' - 'a')
> -#define RISCV_ISA_EXT_h                ('h' - 'a')
> -#define RISCV_ISA_EXT_i                ('i' - 'a')
> -#define RISCV_ISA_EXT_m                ('m' - 'a')
> -#define RISCV_ISA_EXT_q                ('q' - 'a')
> -#define RISCV_ISA_EXT_v                ('v' - 'a')
> +#define RISCV_ISA_EXT_A                ('a' - 'a')
> +#define RISCV_ISA_EXT_C                ('c' - 'a')
> +#define RISCV_ISA_EXT_D                ('d' - 'a')
> +#define RISCV_ISA_EXT_F                ('f' - 'a')
> +#define RISCV_ISA_EXT_H                ('h' - 'a')
> +#define RISCV_ISA_EXT_I                ('i' - 'a')
> +#define RISCV_ISA_EXT_M                ('m' - 'a')
> +#define RISCV_ISA_EXT_Q                ('q' - 'a')
> +#define RISCV_ISA_EXT_V                ('v' - 'a')
>
>  /*
>   * These macros represent the logical IDs of each multi-letter RISC-V IS=
A
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 0e71eb82f920c..ff35a4d04f85a 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *=
prev,
>
>  static __always_inline bool has_fpu(void)
>  {
> -       return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> -               riscv_has_extension_likely(RISCV_ISA_EXT_d);
> +       return riscv_has_extension_likely(RISCV_ISA_EXT_F) ||
> +               riscv_has_extension_likely(RISCV_ISA_EXT_D);
>  }
>  #else
>  static __always_inline bool has_fpu(void) { return false; }
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 1734f9a4c2fd7..5cf463570229d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -84,7 +84,7 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
>                                const unsigned long *isa_bitmap)
>  {
> -       if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> +       if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
>                 return 0;
>
>         return -EPROBE_DEFER;
> @@ -146,7 +146,7 @@ static int riscv_ext_f_validate(const struct riscv_is=
a_ext_data *data,
>          * Due to extension ordering, d is checked before f, so no deferr=
al
>          * is required.
>          */
> -       if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)=
) {
> +       if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D)=
) {
>                 pr_warn_once("This kernel does not support systems with F=
 but not D\n");
>                 return -EINVAL;
>         }
> @@ -189,7 +189,7 @@ static int riscv_ext_vector_float_validate(const stru=
ct riscv_isa_ext_data *data
>          * Since this function validates vector only, and v/Zve* are prob=
ed
>          * after f/d, there's no need for a deferral here.
>          */
> -       if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)=
)
> +       if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D)=
)
>                 return -EINVAL;
>
>         return 0;
> @@ -224,7 +224,7 @@ static int riscv_ext_zcd_validate(const struct riscv_=
isa_ext_data *data,
>                                   const unsigned long *isa_bitmap)
>  {
>         if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA=
) &&
> -           __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
> +           __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D))
>                 return 0;
>
>         return -EPROBE_DEFER;
> @@ -237,7 +237,7 @@ static int riscv_ext_zcf_validate(const struct riscv_=
isa_ext_data *data,
>                 return -EINVAL;
>
>         if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA=
) &&
> -           __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> +           __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
>                 return 0;
>
>         return -EPROBE_DEFER;
> @@ -490,15 +490,15 @@ static const unsigned int riscv_c_exts[] =3D {
>   * New entries to this struct should follow the ordering rules described=
 above.
>   */
>  const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
> -       __RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
> -       __RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
> -       __RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_a, riscv_a_exts),
> -       __RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_val=
idate),
> -       __RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_val=
idate),
> -       __RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> -       __RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> -       __RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_ext=
s, riscv_ext_vector_float_validate),
> -       __RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> +       __RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_I),
> +       __RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_M),
> +       __RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_A, riscv_a_exts),
> +       __RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_F, riscv_ext_f_val=
idate),
> +       __RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_val=
idate),
> +       __RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
> +       __RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
> +       __RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_ext=
s, riscv_ext_vector_float_validate),
> +       __RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>         __RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv=
_ext_zicbop_validate),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> @@ -897,8 +897,8 @@ static void __init riscv_fill_hwcap_from_isa_string(u=
nsigned long *isa2hwcap)
>                  * marchid.
>                  */
>                 if (acpi_disabled && boot_vendorid =3D=3D THEAD_VENDOR_ID=
 && boot_archid =3D=3D 0x0) {
> -                       this_hwcap &=3D ~isa2hwcap[RISCV_ISA_EXT_v];
> -                       clear_bit(RISCV_ISA_EXT_v, source_isa);
> +                       this_hwcap &=3D ~isa2hwcap[RISCV_ISA_EXT_V];
> +                       clear_bit(RISCV_ISA_EXT_V, source_isa);
>                 }
>
>                 riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, =
isa2hwcap);
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 1659d31fd288f..f8f68ba781b45 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -88,10 +88,10 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>         if (has_fpu())
>                 pair->value |=3D RISCV_HWPROBE_IMA_FD;
>
> -       if (riscv_isa_extension_available(NULL, c))
> +       if (riscv_isa_extension_available(NULL, C))
>                 pair->value |=3D RISCV_HWPROBE_IMA_C;
>
> -       if (has_vector() && riscv_isa_extension_available(NULL, v))
> +       if (has_vector() && riscv_isa_extension_available(NULL, V))
>                 pair->value |=3D RISCV_HWPROBE_IMA_V;
>
>         /*
> diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
> index 1132d909cc25c..94077117d1136 100644
> --- a/arch/riscv/kvm/isa.c
> +++ b/arch/riscv/kvm/isa.c
> @@ -17,14 +17,14 @@
>  /* Mapping between KVM ISA Extension ID & guest ISA extension ID */
>  static const unsigned long kvm_isa_ext_arr[] =3D {
>         /* Single letter extensions (alphabetically sorted) */
> -       [KVM_RISCV_ISA_EXT_A] =3D RISCV_ISA_EXT_a,
> -       [KVM_RISCV_ISA_EXT_C] =3D RISCV_ISA_EXT_c,
> -       [KVM_RISCV_ISA_EXT_D] =3D RISCV_ISA_EXT_d,
> -       [KVM_RISCV_ISA_EXT_F] =3D RISCV_ISA_EXT_f,
> -       [KVM_RISCV_ISA_EXT_H] =3D RISCV_ISA_EXT_h,
> -       [KVM_RISCV_ISA_EXT_I] =3D RISCV_ISA_EXT_i,
> -       [KVM_RISCV_ISA_EXT_M] =3D RISCV_ISA_EXT_m,
> -       [KVM_RISCV_ISA_EXT_V] =3D RISCV_ISA_EXT_v,
> +       KVM_ISA_EXT_ARR(A),
> +       KVM_ISA_EXT_ARR(C),
> +       KVM_ISA_EXT_ARR(D),
> +       KVM_ISA_EXT_ARR(F),
> +       KVM_ISA_EXT_ARR(H),
> +       KVM_ISA_EXT_ARR(I),
> +       KVM_ISA_EXT_ARR(M),
> +       KVM_ISA_EXT_ARR(V),
>         /* Multi letter extensions (alphabetically sorted) */
>         KVM_ISA_EXT_ARR(SMNPM),
>         KVM_ISA_EXT_ARR(SMSTATEEN),
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index cb8a65273c1f0..70640701310c8 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -85,7 +85,7 @@ static int __init riscv_kvm_init(void)
>         char slist[64];
>         const char *str;
>
> -       if (!riscv_isa_extension_available(NULL, h)) {
> +       if (!riscv_isa_extension_available(NULL, H)) {
>                 kvm_info("hypervisor extension not available\n");
>                 return -ENODEV;
>         }
> diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
> index 6ad6df26a2fd4..bb11e6757d349 100644
> --- a/arch/riscv/kvm/vcpu_fp.c
> +++ b/arch/riscv/kvm/vcpu_fp.c
> @@ -21,8 +21,8 @@ void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
>         struct kvm_cpu_context *cntx =3D &vcpu->arch.guest_context;
>
>         cntx->sstatus &=3D ~SR_FS;
> -       if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
> -           riscv_isa_extension_available(vcpu->arch.isa, d))
> +       if (riscv_isa_extension_available(vcpu->arch.isa, F) ||
> +           riscv_isa_extension_available(vcpu->arch.isa, D))
>                 cntx->sstatus |=3D SR_FS_INITIAL;
>         else
>                 cntx->sstatus |=3D SR_FS_OFF;
> @@ -38,9 +38,9 @@ void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_contex=
t *cntx,
>                                   const unsigned long *isa)
>  {
>         if ((cntx->sstatus & SR_FS) =3D=3D SR_FS_DIRTY) {
> -               if (riscv_isa_extension_available(isa, d))
> +               if (riscv_isa_extension_available(isa, D))
>                         __kvm_riscv_fp_d_save(cntx);
> -               else if (riscv_isa_extension_available(isa, f))
> +               else if (riscv_isa_extension_available(isa, F))
>                         __kvm_riscv_fp_f_save(cntx);
>                 kvm_riscv_vcpu_fp_clean(cntx);
>         }
> @@ -50,9 +50,9 @@ void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_con=
text *cntx,
>                                      const unsigned long *isa)
>  {
>         if ((cntx->sstatus & SR_FS) !=3D SR_FS_OFF) {
> -               if (riscv_isa_extension_available(isa, d))
> +               if (riscv_isa_extension_available(isa, D))
>                         __kvm_riscv_fp_d_restore(cntx);
> -               else if (riscv_isa_extension_available(isa, f))
> +               else if (riscv_isa_extension_available(isa, F))
>                         __kvm_riscv_fp_f_restore(cntx);
>                 kvm_riscv_vcpu_fp_clean(cntx);
>         }
> @@ -89,7 +89,7 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
>         void *reg_val;
>
>         if ((rtype =3D=3D KVM_REG_RISCV_FP_F) &&
> -           riscv_isa_extension_available(vcpu->arch.isa, f)) {
> +           riscv_isa_extension_available(vcpu->arch.isa, F)) {
>                 if (KVM_REG_SIZE(reg->id) !=3D sizeof(u32))
>                         return -EINVAL;
>                 if (reg_num =3D=3D KVM_REG_RISCV_FP_F_REG(fcsr))
> @@ -102,7 +102,7 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
>                 } else
>                         return -ENOENT;
>         } else if ((rtype =3D=3D KVM_REG_RISCV_FP_D) &&
> -                  riscv_isa_extension_available(vcpu->arch.isa, d)) {
> +                  riscv_isa_extension_available(vcpu->arch.isa, D)) {
>                 if (reg_num =3D=3D KVM_REG_RISCV_FP_D_REG(fcsr)) {
>                         if (KVM_REG_SIZE(reg->id) !=3D sizeof(u32))
>                                 return -EINVAL;
> @@ -138,7 +138,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
>         void *reg_val;
>
>         if ((rtype =3D=3D KVM_REG_RISCV_FP_F) &&
> -           riscv_isa_extension_available(vcpu->arch.isa, f)) {
> +           riscv_isa_extension_available(vcpu->arch.isa, F)) {
>                 if (KVM_REG_SIZE(reg->id) !=3D sizeof(u32))
>                         return -EINVAL;
>                 if (reg_num =3D=3D KVM_REG_RISCV_FP_F_REG(fcsr))
> @@ -151,7 +151,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
>                 } else
>                         return -ENOENT;
>         } else if ((rtype =3D=3D KVM_REG_RISCV_FP_D) &&
> -                  riscv_isa_extension_available(vcpu->arch.isa, d)) {
> +                  riscv_isa_extension_available(vcpu->arch.isa, D)) {
>                 if (reg_num =3D=3D KVM_REG_RISCV_FP_D_REG(fcsr)) {
>                         if (KVM_REG_SIZE(reg->id) !=3D sizeof(u32))
>                                 return -EINVAL;
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index bb920e8923c93..5cc7ddd4aa276 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -770,7 +770,7 @@ static inline unsigned long num_fp_f_regs(const struc=
t kvm_vcpu *vcpu)
>  {
>         const struct kvm_cpu_context *cntx =3D &vcpu->arch.guest_context;
>
> -       if (riscv_isa_extension_available(vcpu->arch.isa, f))
> +       if (riscv_isa_extension_available(vcpu->arch.isa, F))
>                 return sizeof(cntx->fp.f) / sizeof(u32);
>         else
>                 return 0;
> @@ -799,7 +799,7 @@ static inline unsigned long num_fp_d_regs(const struc=
t kvm_vcpu *vcpu)
>  {
>         const struct kvm_cpu_context *cntx =3D &vcpu->arch.guest_context;
>
> -       if (riscv_isa_extension_available(vcpu->arch.isa, d))
> +       if (riscv_isa_extension_available(vcpu->arch.isa, D))
>                 return sizeof(cntx->fp.d.f) / sizeof(u64) + 1;
>         else
>                 return 0;
> @@ -878,7 +878,7 @@ static inline unsigned long num_sbi_regs(struct kvm_v=
cpu *vcpu)
>
>  static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
>  {
> -       if (!riscv_isa_extension_available(vcpu->arch.isa, v))
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, V))
>                 return 0;
>
>         /* vstart, vl, vtype, vcsr, vlenb and 32 vector regs */
> diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
> index 62d2fb77bb9b9..f26108a4e601e 100644
> --- a/arch/riscv/kvm/vcpu_vector.c
> +++ b/arch/riscv/kvm/vcpu_vector.c
> @@ -26,7 +26,7 @@ void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>
>         cntx->vector.vlenb =3D riscv_v_vsize / 32;
>
> -       if (riscv_isa_extension_available(isa, v)) {
> +       if (riscv_isa_extension_available(isa, V)) {
>                 cntx->sstatus |=3D SR_VS_INITIAL;
>                 WARN_ON(!cntx->vector.datap);
>                 memset(cntx->vector.datap, 0, riscv_v_vsize);
> @@ -45,7 +45,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_co=
ntext *cntx,
>                                       unsigned long *isa)
>  {
>         if ((cntx->sstatus & SR_VS) =3D=3D SR_VS_DIRTY) {
> -               if (riscv_isa_extension_available(isa, v))
> +               if (riscv_isa_extension_available(isa, V))
>                         __kvm_riscv_vector_save(cntx);
>                 kvm_riscv_vcpu_vector_clean(cntx);
>         }
> @@ -55,7 +55,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu=
_context *cntx,
>                                          unsigned long *isa)
>  {
>         if ((cntx->sstatus & SR_VS) !=3D SR_VS_OFF) {
> -               if (riscv_isa_extension_available(isa, v))
> +               if (riscv_isa_extension_available(isa, V))
>                         __kvm_riscv_vector_restore(cntx);
>                 kvm_riscv_vcpu_vector_clean(cntx);
>         }
> @@ -154,7 +154,7 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vc=
pu,
>         void *reg_addr;
>         int rc;
>
> -       if (!riscv_isa_extension_available(isa, v))
> +       if (!riscv_isa_extension_available(isa, V))
>                 return -ENOENT;
>
>         rc =3D kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_add=
r);
> @@ -180,7 +180,7 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vc=
pu,
>         void *reg_addr;
>         int rc;
>
> -       if (!riscv_isa_extension_available(isa, v))
> +       if (!riscv_isa_extension_available(isa, V))
>                 return -ENOENT;
>
>         if (reg_num =3D=3D KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)) {
>
> --
> 2.43.0
>
