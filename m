Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DC233E34C
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769129639; cv=pass; b=o9iEEg8uofGRYel6AYhTc7SXjzpGhwLGfGUTGvs+3CH4VyFdmRYWmONptvNlSITGnVX1FOaqECs5sAiZO54DeKYy7GzOMjygp7St3kGX1O9sHRnxwjnn6i2ZiTP+DvQCjVwMHtebe86B2Pl1P61gZRyOEuF4PSb9fnyUWe/RkxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769129639; c=relaxed/simple;
	bh=yBMXOwcpjCZoufdlj1pFQsMJaO1vK6MgX5cAbS0lKxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vp+wNhp2ooXoxOzctqdro9bI0vHlfim7+VA4DzzyuqQ9lHLyWoWk5KRCxYebxw0NuJTs2szxFo3hqcpcLP75ls8Zpgti+3IQCzP/qTXuNY854YvF5gzeEh35sp6UhyXRysR+/1pQfdxIeUVmrUxjgAlbdV23hPo2PW0sBHDx+0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn0kQ2YS; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn0kQ2YS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0c09bb78cso11266595ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 16:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769129628; cv=none;
        d=google.com; s=arc-20240605;
        b=JaVaOxyLOY7zo3JFe2py7RdRhATe3VjUuv7bxL2gx3Lt3yxG481hbWVV+7jRKK+bLd
         Iqo9ecDqANXvBZhzRrKQn5ZjQsUvgh7sYh3Zlsa82f6h3T9a0HMC7ztrVIcPTKtGTcPw
         NBx8749in4HlAka9okJII24Ro1gl/JnoB5M++7P4IA0o2ZkroVdiI21Cn8KDvlixA3qj
         601k0096u5JxMBY7pbvA0xNg7fUcY1HbciHNgDzffJgTnFmpgkSCXfPiqDh591xYSbyk
         LrC55uguiFAQ+BjoerZQwvFArCvY+l/QYP2+3QLiAeiaYHLB8Lqi/kd7A3uu5evfgq0x
         54VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0udLKwql0iZ1SIidaCEnZjm9GhWInp/dfA55RalANy8=;
        fh=FhYzC06rbldmCZl5jD7OU4329DI14eeR2km1GRDE26k=;
        b=AyYu5JzSXXb9NruwVptvsY4IiJd/xkKUfnHUaHCIJjs7lZgH0FitQKDkLw0kEuwv0c
         P41neE0CXlSZZLu8WIqmvc862cSBpsr8IV/D/qYtCXKDVmYUqnd69ji0yrv9fhpD7rO2
         p50EWwbsL3gF9IThf9/a2kQBd41VP46V9S1ZmKP2xSWzxJrQT/fr5KZuXPEmc/8Qt2Hp
         nm/jsolNJfoCxJCkI0pVLh0vpVykkYziHyu+QdTSS1k30fYeAcb864U+utA51coX4+6l
         pZ1/E3kUBXbg19gH6NSvJm6tGv3Mpn8kf7eDvnUMiYebyDKGLeM520jKsZrDfSJjaEK4
         iD8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769129628; x=1769734428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0udLKwql0iZ1SIidaCEnZjm9GhWInp/dfA55RalANy8=;
        b=Mn0kQ2YSe+Cnxf4NF5MddlWv1GorlD3WUAVEN2eT8o9DjsAFWLEMladCbDtKpMkKjE
         aXe2OOaOlK6H3G/vdqmWwevrjzgZmsYyUQXIamHW+xtMFt5R14gBOdOOokd4OTL0gbL4
         pDf2/+tKC8LDVU8IlVPRf/IWMAx+HMqLPn5QkUXXwtOYn0PWh4MRL2P8wzINscIwjweK
         SZg8cOBhXa2UTCkXgsgzZEtKy8H9EZF4oGUaTxlrsguWlMyscc8U8lzuybAKr6weNLiK
         WaufEs8h9KlAlopbrv/wGvltSd/MwK4ICnIw96tP3NQeEAzfkQKI5KC3aHk9qDAu4K//
         QNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769129628; x=1769734428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0udLKwql0iZ1SIidaCEnZjm9GhWInp/dfA55RalANy8=;
        b=AQiUNWRMn7h7vCZdPwVulDXjmkzZo6XG5XEmdTy7ujwdfO+/KlYxxHpiorMLL0ce4O
         lN8AaXlEKpmflRopY+7p+x0eaisDWCSC0AeTVRvYnQvadGXtwkR74bPtkg2yOM6Gq2EI
         xoogw+pZWGYgjX/7Hd5YlPI6PkJaiwphGSUEdLWSoBH/esYuONMQWwz6zpTWhFR3Le/d
         XXOWB/OBPRGQ9ciWa84jW0MEhPjm7prd3+bBfO5wHY3wGsWQxZjFR3OeJVYAlDGGo9mX
         XCxDXvx/3XsBoL2mnOWvDz4UzT/p7cxXc140unWp2m3Z5rB9JlWSy605y/pkTg5OchbB
         7mWA==
X-Forwarded-Encrypted: i=1; AJvYcCUNRG1Lc0Y8dnAaDeZe6LxaLUQ1GhNn1k9Z3G/+D5sPyhcMRhzyaNBfZks5u6HKyzKowKg7ElcGW6pQV0CEBvU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DDGG+lg9bxUlfKGhKAp9m12WuoLbNgwIg9en6dgVRTw6CUOd
	M/XKDeCGKpInrGTEkJw1k6gEeW/MKZhk5npsHuJIs1vIJI+kyZ23nu1czo57MFg6ORF+pmOpo74
	9vplipnxLTMHSCm3MryBqYZuBwpNrIg0=
X-Gm-Gg: AZuq6aLqOzr0C+fE8kgFtlk8Ue0/pFEVLa4gfMRk2Rlro5CYFuswqHVslHB/dwYUxnC
	sADDiphe6amckjXb5WEZXxe2tiXJ9Kd+NwzoGqT1fDlsVUeSuQX00uT+hwJqknfYVZp4O7xYqV5
	Va4lnvHy2iAvFWxS01NryXqOcBZENGgsUnVxD65YKGDI44f4ocPnHQdKF07K6l+snPAkpuwiNly
	uaV2LRysl1sQTcs48smzkjgodZGT30CihRZ3sB5BzY1dLjRZ1kgd32aa/0k+O4qkgBughN47VRR
	Eqc/8yFBGv8=
X-Received: by 2002:a17:903:f8e:b0:2a7:9163:8e60 with SMTP id
 d9443c01a7336-2a7fe80fddfmr9079865ad.23.1769129627880; Thu, 22 Jan 2026
 16:53:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120152424.40766-1-leon.hwang@linux.dev> <20260120152424.40766-3-leon.hwang@linux.dev>
In-Reply-To: <20260120152424.40766-3-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 22 Jan 2026 16:53:34 -0800
X-Gm-Features: AZwV_QhVQ3_tmlZbyi2JgIuf-ozS36BC6ziWbq4VPwpzBkySzzimkp-0gd_aROE
Message-ID: <CAEf4BzYuZsFC-DPhhzLcyFTahucHP59+6kAc0sooY2g+SqgrEA@mail.gmail.com>
Subject: Re: [RESEND PATCH bpf-next v6 2/9] libbpf: Add support for extended
 bpf syscall
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 7:26=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> To support the extended BPF syscall introduced in the previous commit,
> introduce the following internal APIs:
>
> * 'sys_bpf_ext()'
> * 'sys_bpf_ext_fd()'
>   They wrap the raw 'syscall()' interface to support passing extended
>   attributes.
> * 'probe_sys_bpf_ext()'
>   Check whether current kernel supports the BPF syscall common attributes=
.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf.c             | 32 ++++++++++++++++++++++++++++++++
>  tools/lib/bpf/features.c        |  8 ++++++++
>  tools/lib/bpf/libbpf_internal.h |  3 +++
>  3 files changed, 43 insertions(+)
>
> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> index 21b57a629916..ed9c6eaeb656 100644
> --- a/tools/lib/bpf/bpf.c
> +++ b/tools/lib/bpf/bpf.c
> @@ -69,6 +69,38 @@ static inline __u64 ptr_to_u64(const void *ptr)
>         return (__u64) (unsigned long) ptr;
>  }
>
> +static inline int sys_bpf_ext(enum bpf_cmd cmd, union bpf_attr *attr,
> +                             unsigned int size,
> +                             struct bpf_common_attr *attr_common,
> +                             unsigned int size_common)
> +{
> +       cmd =3D attr_common ? (cmd | BPF_COMMON_ATTRS) : (cmd & ~BPF_COMM=
ON_ATTRS);
> +       return syscall(__NR_bpf, cmd, attr, size, attr_common, size_commo=
n);
> +}
> +
> +static inline int sys_bpf_ext_fd(enum bpf_cmd cmd, union bpf_attr *attr,
> +                                unsigned int size,
> +                                struct bpf_common_attr *attr_common,
> +                                unsigned int size_common)
> +{
> +       int fd;
> +
> +       fd =3D sys_bpf_ext(cmd, attr, size, attr_common, size_common);
> +       return ensure_good_fd(fd);
> +}
> +
> +int probe_sys_bpf_ext(void)
> +{
> +       const size_t attr_sz =3D offsetofend(union bpf_attr, prog_token_f=
d);
> +       union bpf_attr attr;
> +
> +       memset(&attr, 0, attr_sz);
> +       /* This syscall() will return error always. */

I'll cite myself from the last review:

> But fd should really not be >=3D 0, and if it is -- it's some problem,
> so I'd return an error in that case to keep us aware, which is why I'm
> saying I'd just return inside if (fd >=3D 0) { }

I didn't say let's just ignore syscall return with (void) cast and
happily check errno no matter what, did I? Drop the comment, and
handle fd >=3D 0 case explicitly, please.

pw-bot: cr

> +       (void) syscall(__NR_bpf, BPF_PROG_LOAD | BPF_COMMON_ATTRS, &attr,=
 attr_sz, NULL,
> +                      sizeof(struct bpf_common_attr));
> +       return errno =3D=3D EFAULT;
> +}
> +
>  static inline int sys_bpf(enum bpf_cmd cmd, union bpf_attr *attr,
>                           unsigned int size)
>  {
> diff --git a/tools/lib/bpf/features.c b/tools/lib/bpf/features.c
> index b842b83e2480..e0d646a9e233 100644
> --- a/tools/lib/bpf/features.c
> +++ b/tools/lib/bpf/features.c
> @@ -506,6 +506,11 @@ static int probe_kern_arg_ctx_tag(int token_fd)
>         return probe_fd(prog_fd);
>  }
>
> +static int probe_bpf_syscall_common_attrs(int token_fd)
> +{
> +       return probe_sys_bpf_ext();
> +}
> +
>  typedef int (*feature_probe_fn)(int /* token_fd */);
>
>  static struct kern_feature_cache feature_cache;
> @@ -581,6 +586,9 @@ static struct kern_feature_desc {
>         [FEAT_BTF_QMARK_DATASEC] =3D {
>                 "BTF DATASEC names starting from '?'", probe_kern_btf_qma=
rk_datasec,
>         },
> +       [FEAT_BPF_SYSCALL_COMMON_ATTRS] =3D {
> +               "BPF syscall common attributes support", probe_bpf_syscal=
l_common_attrs,
> +       },
>  };
>
>  bool feat_supported(struct kern_feature_cache *cache, enum kern_feature_=
id feat_id)
> diff --git a/tools/lib/bpf/libbpf_internal.h b/tools/lib/bpf/libbpf_inter=
nal.h
> index fc59b21b51b5..aa16be869c4f 100644
> --- a/tools/lib/bpf/libbpf_internal.h
> +++ b/tools/lib/bpf/libbpf_internal.h
> @@ -392,6 +392,8 @@ enum kern_feature_id {
>         FEAT_ARG_CTX_TAG,
>         /* Kernel supports '?' at the front of datasec names */
>         FEAT_BTF_QMARK_DATASEC,
> +       /* Kernel supports BPF syscall common attributes */
> +       FEAT_BPF_SYSCALL_COMMON_ATTRS,
>         __FEAT_CNT,
>  };
>
> @@ -757,4 +759,5 @@ int probe_fd(int fd);
>  #define SHA256_DWORD_SIZE SHA256_DIGEST_LENGTH / sizeof(__u64)
>
>  void libbpf_sha256(const void *data, size_t len, __u8 out[SHA256_DIGEST_=
LENGTH]);
> +int probe_sys_bpf_ext(void);
>  #endif /* __LIBBPF_LIBBPF_INTERNAL_H */
> --
> 2.52.0
>
