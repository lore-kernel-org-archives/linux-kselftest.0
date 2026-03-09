Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F24D3E0C69
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076065; cv=pass; b=JTNLQVWTlbyysmx3iWPiMYOfaiGPISuN1ZJEX9lrmjBWGytrFVBbRwouQBEqe/zAHsNA7zYrN0DPY1XykpBNQWrNOckp4SZV3dmSakE2KTcXIb0Mz/eyuFAopcjz4e+a92X33RILOTx40CDgbW9WskC8Jh5FtQ5HVsNny981GFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076065; c=relaxed/simple;
	bh=9Hl8AgvR48yvWlB7WWPD3Z0Gr1W7B+l/RJ1tuuzG//U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYunJ0tS8JQr5MA+EWe2JSuXsJO5Tt2ST3OQvDuiu3KIo0KSUbZQlN7nURHOGnyHDxasbMCFZk76fYGktQLZcViTc+ajBwPkpvoKuwuGOptA03TGeu9Wa4EqW6zTuPqpS8lY4ov8aMhX44S4GucV8btlGxi8ov/S21EoTOmgsCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB/xGRUL; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB/xGRUL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b94a19fdso7667749f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 10:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773076061; cv=none;
        d=google.com; s=arc-20240605;
        b=dGW95UaBV1o+vw/wYdPVHTwI+LlrA6FHaUxIuF0GP23hZ2qomEeURsIp5Pl/G1UIGI
         YI9uoglNqGWhvVCDvmAcT/GdmBA6cHOV+GmCo46kwCcUR0oM8SQek8WipTUKWFIYLZXS
         /ZPKIeJs9nTYuuCFIo7FitpfN/ABfibyjU5mWCb3yLtDytD7BfJoPBWYZEDCt8DW67zM
         HUwstZBr9mz+GuiYR9mTLcPgfzoTfS80XjDNAmWFQWzrhVaijlhy+aEw42BUkhqEvfKE
         4tpE5pjqomMvpuTFXGJnLyIdGSn4c/uNF4tBdtcxqIFisWQy41Q+8xDl11CwgNPXTSZ3
         Qn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FqE2fJ/X7neg7OD1Eo/n5dE4xe0NWQfY1wYD9sdi9Ag=;
        fh=LCjui0/TNl3mcQg/hxsnjK8oYBOorz+A2Z/Q4lboswM=;
        b=Xw6UezbWRl+MVvlChprcRd5aFu+HMrA053IVU23cYQgePBsKLdjN88V5Jnx7BF2A4T
         0KYJ8G4tX/9V2q/oV/ck7WtH5bLjv1GoRWiWrBgQhnaRw8+fcMZkc+5894r5WgJICMlf
         KXQMT9CcgXuWCYif1SvYK41H9PgI9VVE4A7geuJJhOJbxyVnjNHWN7dMMIzp/m8O+k+c
         MuI0TCf/bQGPPvoNTKad5y3J88yF19E+qFxpLVHNuTuFDMjnp1NrAUsQnch0a0TSg/hY
         Y47PFmon17VA8GrLcwuRrEJLBampajve6NytBQ+tRtNfcccHXTWdviZdHSymbaAdf3Kd
         P4gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773076061; x=1773680861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqE2fJ/X7neg7OD1Eo/n5dE4xe0NWQfY1wYD9sdi9Ag=;
        b=TB/xGRULj791N9nDLY74A3O1dz8uL1gdGk9CrQz6EPFj9aifeettMipmyML5kMNEqG
         1lBW8IXly6dfea7JcZwzyb/hm5EXHbw7krQMIrREG3EAH5aGTVnGWk15NsxESyXjidhS
         Rv1fan4DA3HCQiXqgrIgigNBef2Ittd2OTK4fZw2vXf2c8MemEc2aByLfOnGxBfegUDK
         avPeQF5eij5NZBi0yQXlRdIaKLGROgDSvPaU0iPzBQSONr2e2rxbmoS/fMzwD3AM/KjQ
         ilOvJ6GIBtdWJ+JiqAkrKlc/guSwd7UIa9qRX8lu3dDc3JULYgOMkq2SH/KkgqVeahSD
         q9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076061; x=1773680861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqE2fJ/X7neg7OD1Eo/n5dE4xe0NWQfY1wYD9sdi9Ag=;
        b=k6XjzF/xEAwwEZDeJYlax6ECjXD4y5Z+mBxTKZSi4uOXmBsfC/GFRnC0ZWWcHQELwr
         ah5qqXNbE+/KPYA11r+djJofmRPDnqLjy0TG7xi7jl+bWU2kcfG7tZqH2wOTBwE2Udx8
         fo2DoGFdZ2wL3BeS2tFcDef7P6Qc9MR2bI10YMlKniFLsdamPpLS+u/XpGJpaAh7Qdoi
         it2Jlo5ZFiuTOLU5Ff6rBFLZwj7ua0eBlDlzSOPGOyWsGzSuTjS+f5mh5kthKubFQFJe
         2ZnKgR633p4Ww+9KPwsX/E+E+tgOAnT1rGo2Zk90GO77zwNNU3wXmulco4JCKYZSVcCW
         tZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUADNhGti98DuS/N8H1we4+HaKZu8I6QVzXXCIWSV4uKtzSSkLx0b+LDOx6dRVmwjmWe5Z2GfcZQ8XC6HuDKXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB/phyOgfvKfJ+w4gWahhy5fjgo66cABN78ItolrjlNjv8ad9M
	KrwmzWNdH+w2zw1V3W8e1gUmN/JVp38Hfst/OJ9hsvOiCv4bpxt8JrYa5Z+uPUDpdGwvsiy4EYD
	h35QXAnw3UPWEsWYHErOJNQOVyffthH4=
X-Gm-Gg: ATEYQzzNtu7MkATfFsmmoiigs026iq5w/b3BwYErqouSC3dn0TLuXeQeXre2VLXEtPs
	i9f3EoAu+dHqh9+jN1Xtzn2rX+Pd5VNAq/yZqdYN/y0uW2oJq7Vvv3pj0QUyAdDflcq8yHe9ASa
	Nyabc9KdfvvybrJY+U99UctuaCclb/VLRQ4nuhWKXQ5BcL0KuLgjCXsZlluYUsZNJLB67hz9hZ4
	RSS6ZoSFj7BWaKLlSnMYrhZz5phHrzo7Mj9Z6OYAZODt788xx6yeDJoeaeran2B594rr1qneOIA
	FVSwcdlYGr2usVFbUOH23yVL6Uf8WMl4dCdGIjCrlVLuBucE9Cq+DqDbcZXsIfNzG+IxlzX7jn2
	5keFkOHE0qwGUrKriBP4ZNPVKJTl5jfLuKksX
X-Received: by 2002:a05:6000:3113:b0:439:ba75:7dab with SMTP id
 ffacd0b85a97d-439da65450fmr21237678f8f.9.1773076061011; Mon, 09 Mar 2026
 10:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303131453.328674-1-hbathini@linux.ibm.com>
In-Reply-To: <20260303131453.328674-1-hbathini@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 9 Mar 2026 10:07:30 -0700
X-Gm-Features: AaiRm51wrAKZg0huxnXoh83RAT7Tsq_qpgn4x24K3tzeY0JjOYfP8ZcwK34q5ms
Message-ID: <CAADnVQKuARvSirPjnTcSifLPunCiKC4Nenq0Mr61GpzbW5WxWg@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: improve test coverage for kfunc call
To: Hari Bathini <hbathini@linux.ibm.com>, Eduard <eddyz87@gmail.com>, 
	Vineet Gupta <vineet.gupta@linux.dev>, "Jose E. Marchesi" <jemarch@gnu.org>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 5:15=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.com=
> wrote:
>
>
> +SEC("tc")
> +int kfunc_call_test5(struct __sk_buff *skb)
> +{
> +       struct bpf_sock *sk =3D skb->sk;
> +       int ret;
> +       u32 val32;
> +       u16 val16;
> +       u8 val8;
> +
> +       if (!sk)
> +               return -1;
> +
> +       sk =3D bpf_sk_fullsock(sk);
> +       if (!sk)
> +               return -1;
> +
> +       ret =3D bpf_kfunc_call_test5(0xFF, 0xFFFF, 0xFFFFFFFF);

maybe add a comment with bpf asm to highlight what this is ?

Also 0xFFFFffffULL ?
8 "F"s in a row is harder on the eyes.
and ULL to make it explicit ?

> +       if (ret)
> +               return ret;
> +
> +       val32 =3D bpf_get_prandom_u32();
> +       val16 =3D val32 & 0xFFFF;
> +       val8 =3D val32 & 0xFF;
> +       ret =3D bpf_kfunc_call_test5(val8, val16, val32);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D bpf_kfunc_call_test5(val8 * 0xFF, val16 * 0xFFFF, val32 *=
 0xFFFFFFFF);

I'm struggling to decipher it. Pls add a comment with asm to explain.
I think the last multiplication is still done in 32-bit domain ?
or not? 0xFFFFFFFF is a 64-bit constant in C. I think...

Also we have 4 ISA versions. test_progs-no_alu32 and test_progs
compile it differently.
Maybe let's add another version of this test but fully in asm ?
Keep the C version too.

> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  SEC("tc")
>  int kfunc_call_test4(struct __sk_buff *skb)
>  {
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools=
/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index e62c6b78657f..de4897ddcff1 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -766,6 +766,33 @@ __bpf_kfunc long noinline bpf_kfunc_call_test4(signe=
d char a, short b, int c, lo
>         return (long)a + (long)b + (long)c + d;
>  }
>
> +__bpf_kfunc int bpf_kfunc_call_test5(u8 a, u16 b, u32 c)
> +{
> +       /* Make val as volatile to avoid compiler optimizations on the be=
low checks */
> +       volatile long val =3D a;

Pls add a comment that this is zero extended in C.

> +
> +       /* Check zero-extension */
> +       if (val !=3D (unsigned long)a)
> +               return 1;
> +       /* Check no sign-extension */
> +       if (val < 0)
> +               return 2;
> +
> +       val =3D b;
> +       if (val !=3D (unsigned long)b)
> +               return 3;
> +       if (val < 0)
> +               return 4;
> +
> +       val =3D c;
> +       if (val !=3D (unsigned long)c)
> +               return 5;
> +       if (val < 0)
> +               return 6;
> +
> +       return 0;
> +}

Overall this looks very useful.
I would expand with another test where a,b,c are s8,s16,s32.

Please resend with [PATCH bpf-next] in the subject, so that CIs
can pick it up correctly.

pw-bot: cr
