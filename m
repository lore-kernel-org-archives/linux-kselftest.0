Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0779F36AB56
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514897; cv=pass; b=JAR3rwMaw22C1oUHcveR3W13XaibaRsLPf1jpgnqtb72qDTFrIp004NVO7Cj1Ij2bWPBqvFESwQxwB0JwZnaBn1Te2aWQLRHJVnd36icK2ZXlfCiRJR53bemS5ni+LxzjqNkAROD4tZKEkoDUc7QG5RvHfFRL7ZY2mQolMBS7Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514897; c=relaxed/simple;
	bh=Qv6p33Ms7lJZNhDoMpL46zV2EdNVYCWJ4HAmnz49Hbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CB+uFItOlNDXGvIjwnvqfDKLv8xKx5WT1CSqc+L3xj3x42XhnV46egDAwrTzgun4g6EZgEdCzdvpkPF5RpnGWAnAfYSS746zUXAjS3IeyOEkcnignUNqvsztLmyIhfp+UGTFkb7+80u78q2HWISGCO9LhbaxtyBWKnY7mlDhNKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCo7hwM6; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCo7hwM6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4798bea72f9so437300f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 05:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514894; cv=none;
        d=google.com; s=arc-20260327;
        b=d7REyq/Fh/Au6DzNkFJjM02Fx1pXL8BmAulBh8nuole6jhL8/KwVLWSdRRB3XVULKf
         2cI+sd7leiJtiPxDppRD66I+UjphiIRALwC33vvJ7V31jHPQ4QVlyhYlg3RSej6yAA2i
         YKVhpLWvaNkrKSJSmBhu5q0ZyHC9YOxMScVZMbetX74BTS+umpiRFxJVsYYfMwuxQ5wR
         oHnwG8qGO768ee1fNonnySfOok1t4bhOgNAQpp2jL+WvgwVUf7PhpObO8xbUfoZNbPQk
         +zvLirwy7YKX7ZMyEosMgxOu0COKJHBfgA6CVMBkRct9cfSIxBpsnj2/V3Js9tnPkbll
         jWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oM6cgiCUs2LYUfxBySpkCDnF3AdZ7CElaEXYvjTJo6I=;
        fh=0h2TSN+IG7GIpRf5L4yFCv0lIx2k9rh+WEYbudpmwws=;
        b=qpxtndnhBRKiqHIMCKb/a6Xi2KXC6CfrJAmmYSIgW006R8M4pP9MnkI2ZTqna0DBue
         BG25Bunq3c+df5vv7/xThtVQ4q7y6dK/CKQ/hEPZdo3sdjMqepkDF5BSrTpnQdU9LJY4
         TLQYS4QLReBArc/2fUW55//dnK4Isd9JGVKMWqV70w9yYYa9UmvZd0vSkxntZQBdMlVE
         0yx+iXKXWvuY8vflVrVOfMZguV+UVbeCCCdgXDI1AxqnnhktfHODbCRU4wdASFMPeU9o
         5N3iBcvZ5NY9nt/3NCxFLsetmVZOyuCws3tYemke5rFmGwk1i/cIvmSSutJ9ICJ/Tio5
         NmiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514894; x=1784119694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM6cgiCUs2LYUfxBySpkCDnF3AdZ7CElaEXYvjTJo6I=;
        b=FCo7hwM691FMRO4KcjWPYfQk0oXREgyCTygmI/HzVPL7JnQoPUuiSgcIic+GEiAP6S
         iojMeBOHBpcVHi2+lfbBdp9auiXly6azMHlRXsODihN10jTudtBl36vIGVv5l9gNEEq8
         iUGW8j8GjgvfxNbMHZIvbZwtiAduBt7y1+VDkBieQuivVCMIOAM3xaAiJ1TE0SooHjvV
         NTsMhGANbC6bMF+sck6B701Ea8OxemuORdG3BW6H1nj/3AiQm2C2ivgvJgZQ2NNPZMBH
         nn8MWCiugnb8M0ATHuseUyek/se2ZnYHdg4SPuRLilHkGyaVq8VNz0cV4NBSAWoDftEy
         gBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514894; x=1784119694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oM6cgiCUs2LYUfxBySpkCDnF3AdZ7CElaEXYvjTJo6I=;
        b=UbIyDjNihg2w1jnFSSGZLbH4HtFkUlNxtyWS6G44Y5g9nuiU/GptSgO9gFKw944bLH
         w5UKKdmnzrxDptz8r6+X3QtpmfR9xTDQPQcGGxc3vt93IKVNU7f3NJLgRTMgbRDn80A/
         P+B2b5Xpi6Hb9+dB44ByJYO8HfXQLADtChtroOWQVScTLCxQV3Qjk2t+Yk3EIuppQawX
         1zllT6war6T1OiGiYgkDfQaNm9+7sJe+k1f1uMDQmzwrfp97nHZ4mCR3NNrkLMOcL+Cf
         BUdjGihtRC3GT7YpLF/e45aw3zsmOs8V7JHIYm/9xopmxQjYhGOs6kK3DE/S5/1hX+M9
         JiRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rowu45P/i9J0PIwWMbI1fvAnzh3O0s4TK0WCzOvfKV15Bd7O7/j7HgAvSYcUooldRSG8zmX6cKwr9KuBBA+SKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvERGgjTkDhI5dJkW80wjYgnLvDg5nZQQs+tIbHthiY3IZbHq0
	hzKYu+EDUfy3iKjG3SAJeRPhk+swuKPgOXpJnoweSUfsKEbSH+T4aP2+87Vda/RpWJfsDAMU1c0
	bORzuUw7WIaT3fHp6IQn20/fxX04LVmk=
X-Gm-Gg: AfdE7clU7NtVo15bpYsIuY8k7cF471pIcY+kMQlkLzitfDuZqu7BHN5lraMsx+htNc6
	V+olRWxa3QjhrC9kpZkj12hszyimBm5mv3gRJDwFJ00a5dHADsbXjL4QaaAzKwNA2iStkReZrc/
	nZVxQt7bZyPWcvygykqXwyVnTtRUOLLtIIO1ivEZgEeZuTMAgvgnYUc+F7LstPqeOgzfnlKRAPy
	StHeLcVRFkNAyedRpyBv4/SASW7BzoX88rXY3r7teGhDyYaorswyFERklvWbkxVbbE+fqZdRYt7
	qyLbxdEajnd3y8sef+Dmi0TAmm1EO2s=
X-Received: by 2002:a05:6000:2510:b0:46f:f12b:e453 with SMTP id
 ffacd0b85a97d-47df075e3d3mr2403687f8f.28.1783514894199; Wed, 08 Jul 2026
 05:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-kasan-v4-0-d5c177ab8227@bootlin.com> <20260708-kasan-v4-3-d5c177ab8227@bootlin.com>
In-Reply-To: <20260708-kasan-v4-3-d5c177ab8227@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 8 Jul 2026 14:48:02 +0200
X-Gm-Features: AVVi8Ce28NN5OLVzXOb8-dZK-ndefrPCpQQGxxaCTFUnm6OWPadXfj-wXhMK9LA
Message-ID: <CA+fCnZcOPADt=dkhApCQwD40EB1WWP45PvdBtJ=hk1u1DAMUiQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 03/10] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	ebpf@linuxfoundation.org, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 10:02=E2=80=AFAM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> Add a new Kconfig option CONFIG_BPF_JIT_KASAN that automatically enables
> generic KASAN (Kernel Address SANitizer) memory access checks for
> JIT-compiled BPF programs as well, when both KASAN (and more
> specifically, generic KASAN with KASAN_VMALLOC) and JIT compiler are
> enabled. This new Kconfig is not a user selectable one: it is either
> automatically enabled if KASAN is enabled on a compatible platform. When
> enabled, the JIT compiler will emit shadow memory checks before memory
> loads and stores to detect use-after-free or out-of-bounds accesses at
> runtime. The option is gated behind HAVE_EBPF_JIT_KASAN, as it needs
> proper arch-specific implementation.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
> Changes in v4:
> - reorganize dependencies (Andrey)
> - drop VMAP_STACK dependency
>
> Changes in v2:
> - add dependency on kasan for vmalloc and vmalloc'ed stack
> ---
>  kernel/bpf/Kconfig | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index eb3de35734f0..e1f3850d2f5a 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig
> @@ -17,6 +17,10 @@ config HAVE_CBPF_JIT
>  config HAVE_EBPF_JIT
>         bool
>
> +# KASAN support for JIT compiler
> +config HAVE_EBPF_JIT_KASAN
> +       bool
> +
>  # Used by archs to tell that they want the BPF JIT compiler enabled by
>  # default for kernels that were compiled with BPF JIT support.
>  config ARCH_WANT_DEFAULT_BPF_JIT
> @@ -101,4 +105,17 @@ config BPF_LSM
>
>           If you are unsure how to answer this question, answer N.
>
> +config BPF_JIT_KASAN
> +       bool
> +       depends on HAVE_EBPF_JIT_KASAN
> +       depends on KASAN_GENERIC
> +       depends on KASAN_VMALLOC
> +       depends on BPF_JIT
> +       default y if KASAN
> +       help
> +         Makes JIT compiler insert generic outline KASAN checks in BPF
> +         programs when they are inserted in the kernel. This feature is
> +         automatically enabled if the needed set of KASAN and BPF
> +         configuration options is enabled.
> +
>  endmenu # "BPF subsystem"
>
> --
> 2.54.0
>

Acked-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks!
