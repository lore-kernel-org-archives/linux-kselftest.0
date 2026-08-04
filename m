Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BC543551F
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886802; cv=pass; b=sCIxTb1eXpw7JW9ckLsJd50Aim/3YbXDTkdF4Voix5LGPrdK2dKPCan7NdAAliFAc1WgI4UA5t0HOWcubgzb8H/H5sOn7LcuTwAHnJf21ud6xADM6QNt6/IHVeTAPB0RwCwH4ksZXgRRKG2a1SKjHQyO7/8luTEqx8T6T4YLEeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886802; c=relaxed/simple;
	bh=uoWCewIAZ9hyxMRAN9wvtPH2p06arJIF2GepBNWFaiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFRDWECXBlidoQd4z3Oa5or0mSBXCdnsvri8/kwQgp+6B+HF10hxxDhPA+o02TJtW1sY5EZ6imfUAIg+D6rVxIzxtWpuxPWlsDRhVkzL6HaHCiMtmsU1OajouWIEucjzSuRcIVe0NslQXQQqj1VB84QZAaCL0xChvQLs35k9N/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgN4ihYa; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgN4ihYa"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so4860235ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 16:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785886800; cv=none;
        d=google.com; s=arc-20260327;
        b=SwutQIKmmRSozL7y1NnQ2pBWMyDaggVjNtWvI22mWoouHoY/ZRkOlmPBtTfUaPmBtL
         mD1pdsvWSsdayFvu6nLMOfB2EDDE4lDeKDaQFjgBYLa/Ohq0TjIiBxJPodJNW25bbWK+
         1JF+CTpvwVibVndxWLjR0XqsW++1Z0WzKM93zN67NLAGZ1qByYOgRBS3B0/JkDkCwU6x
         TRr08PFw16gGrPBn2qZptnYRoKZmz2pttkWAF3erlrQOpoOGwli8kPSNL3/sRL0UO9jN
         SDljD4zBgCuyohOt3EoQliTCv2shB1ZvCGeZF0g2QyeMPriw/6joyvzSdrMfO+GK1OOD
         VVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PRVM8hQUlMTlXsPIs4erLL1+dRInZl3+7seIzd4uNV8=;
        fh=7frZMliWPy4wahkqxILc4hHW/WSU+1IlQNssIc/UayM=;
        b=GQdWhkDFlwJsMKqQJt3hNvyw3yTPekh29rrbN//xwQriUQFqS2PEzAqpIPz0OW9Swu
         NFLPQhOHgSAeJ2iotJmE7zM/GUmAuAqV4iXAM0q20xogThp0S3HhkQb8aNlmgdOrpH+p
         x7e9a394d8fQ5u1AJ8ADDo9GH8Tuj/jq31SQz6jt/Wl162ORqI43veU+mDNkug0EL7/u
         Am5j2793GvgtDb5uMEkisjV6vilqkScdgplvXTpPOuuNfyN97pST4mNprOwJP6gQp1Cp
         iLYmYFvCg11c3nfok69xUkD0iTxE4rIoPycCZYUCIKHYsp4y+o+/gwme9gyQ33oc5S1N
         gO5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785886800; x=1786491600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRVM8hQUlMTlXsPIs4erLL1+dRInZl3+7seIzd4uNV8=;
        b=sgN4ihYagqnkBGz0+ICStRp9gi+GUDtvg3F5Mbo/cdEZAGr09gLesahGSo/2aLxznP
         kEYFia/Ce7Qit49nangIUnpdB0VJLRhLc78wY4NCnPzPYpucQyHk92Uhh+U6Uxx4r21y
         Q5ezAhEwQlFk0NthXkB7u2OLLr10uzKP5ZZeeELTfuIOPcnF2WLaCnFKiuUTdXCduTfi
         jfJHOFBEap/OLh078EkucT5UV6YAeQymxtybebZJhdrP04MlxZAr5aKqWIi7NVweUJVo
         w1qvVI03rhIgMfflygEyc7lG0W28Rw9w8+4dD4xwj5ZkEGx0BYRmaRaUw6ipWyN3/4vU
         q0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785886800; x=1786491600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRVM8hQUlMTlXsPIs4erLL1+dRInZl3+7seIzd4uNV8=;
        b=ZQWynsOdaCiCfYuCzAeRBXXXDI/Sv81d872ZnwaObZ+BE+pGgOFHY5cxIvYlUiQTmW
         ukSsD92bT+468qxW5ZFm9lpoy+8xBolC44t+L2OU/o8KsGskqhAci+bCzRvTB9u7fJ1/
         MiJu8Q0kTk0oepbjKWupZssiyWkohnjyWeQYhotnQGACpxpnru+gSAnDktfFbqbgP1Ha
         TTBs7WO1QRPhY02QAPL5tLB38kAU/Jc2jKn1ZWlUwlnVqy0WBOqUMO6IpXrUCU20EW1Z
         Wr0/0qtIf61VrUy+YMeCSb/NWHye/3rpTk6HJc1oWGu+MDY7rO36a9AA91oF39FmyfK8
         +ldA==
X-Forwarded-Encrypted: i=1; AHgh+RoQwPYLnl+nJq4qDOYwuFNL8Aflm5QqDUV2/UN3DxRAW8pP9xBgFoz5OCzUyBRISHfC1UOkjNwvmiSWFlZ01bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWvro608qoU+dHWUuXSaHjrXVouJn97vVLcibrHr9SUirqMhd
	4Y+Z/1Z/gWKgRSRgPmlKKG5xbkjx03BLJgCYICweu84ShtlMGL071B9ifuecE36kj+vLxaqoWab
	10pEgNq0A8S/CWbke3K1bwfq9OxRhbLg=
X-Gm-Gg: AR+sD12dM28y4OlU8k1e77v56DeHM2NZ5vJ5e+dJts7lNThlf0yY+DAn2ITM3vLeH6m
	Lmhp2jpidkr7WBrnvPenwYD54uhEWpw3OShOYUSw/lV8WEhSqyImFD5DvUFrGsWFIlxmUW0tGKK
	q4nBnudDCHUA/AXtw1nNEhI/b36LS/C1uNFfVbwAVSdJHRNtI7QkOpg7rbcMuF8byL95GMrnZAw
	NbB14NOO+9pgGTejo9jxaVfHrt43T8V1rwoTXADb9gmQMqudxXTUajKPIMNuLsmOjPHZ+dEd2SD
	WBFe1wxinZ8tz0d+gya0IW/7bnBfEiHyE0ypevHiUUPkxNZ2Hnzox9evh5P1ahejJc/a7hKUuAt
	l32IVdVn8S4emf1+stjXcPYEC89XOm5jr7HHQsezZ9nUaClENeuYA
X-Received: by 2002:a05:6a20:c79a:b0:3c3:af85:85e7 with SMTP id
 adf61e73a8af0-3cb860767d6mr2645020637.34.1785886799943; Tue, 04 Aug 2026
 16:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804145710.43062-1-leon.hwang@linux.dev> <20260804145710.43062-2-leon.hwang@linux.dev>
In-Reply-To: <20260804145710.43062-2-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 4 Aug 2026 16:39:43 -0700
X-Gm-Features: AUfX_mww-a-GnHSPAMD6NdZrovu5pLCa3Uv6H92muVbZPcm4_2Im8TywcmphJxE
Message-ID: <CAEf4BzY0=ZL5MD9j-tLewfuLhRVMipAYnRJ2CD5Biji9iiZG7Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Fix sleepable check for tracing prog
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Sechang Lim <rhkrqnwk98@gmail.com>, 
	Varun R Mallya <varunrmallya@gmail.com>, Viktor Malik <vmalik@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 7:57=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> When CONFIG_FUNCTION_ERROR_INJECTION is disabled, a sleepable tracing pro=
g
> is allowed to attach to '__x64_'-alike prefix symbols.
>
> It is because the verifier does not verify whether the symbol is a kernel
> function or a bpf prog. That said, a sleepable tracing prog is allowed to
> attach to a bpf prog target whose name has '__x64_'-alike prefix.
>
> For example, a sleepable fentry prog attaches to a '__x64_sys_nop' XDP
> prog, and copies buffer from a user pointer with bpf_copy_from_user()
> helper. After attaching the XDP prog to lo interface, the kernel BUG
> could be triggered by 'ping -c 1 -W 1 127.0.0.1':
>
> [    3.460756] BUG: sleeping function called from invalid context at kern=
el/bpf/trampoline.c:1324
>
> Fix it by disallowing sleepable tracing prog always when its target btf
> is not kernel's btf.
>
> Fixes: 16d9c5660692 ("bpf: Always allow sleepable programs on syscalls")
> Acked-by: Viktor Malik <vmalik@redhat.com>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/bpf/verifier.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index b274004fccfd..7bb541e343b2 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -19019,6 +19019,9 @@ static int btf_id_allow_sleepable(u32 btf_id, uns=
igned long addr, const struct b
>
>         switch (prog->type) {
>         case BPF_PROG_TYPE_TRACING:
> +               if (!btf_is_kernel(btf))
> +                       return -EINVAL;
> +

see sashiko reply, just move it outside of switch and disallow
sleepable for anything that is not kernel/module BTF, regardless of
program type

pw-bot: cr


>                 t =3D btf_type_by_id(btf, btf_id);
>                 if (!t)
>                         return -EINVAL;
> --
> 2.55.0
>
