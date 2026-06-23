Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EA1DE4FB
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 21:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782250038; cv=pass; b=uvXNmcHWl5V+3rmM6pKtsh7YoL2XSM2XaT0Y6jl0/l6T/PChmDMEDdfLAzDsjxdL5W3qURAJr6bupqXAzm0oDXLPWzfAWGosBk+djMA1sSxrLPHyDtTMai1cYAvzKmZ84nVkHFt2GrOxaY2cuiBnuOxMK2qBmQGSV1wz2J0qVkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782250038; c=relaxed/simple;
	bh=NkWhHVyYaYcxz0LgXuoX+rLSkF88E2rtRRNG+L6YO7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXnM9CeH01G5NM/BUIMsOOK8xwhfL2n4/FARWcQgRzi+klsYDEwDECTpn0m7/imN2GJ9ZOxJAm0b2Va4Fch6WBeUzeBQBK0DyimKimJIzQdRHlv4JAqw7Pv8A7QLua8mLnTC5Vf1/MOqyscy7UXSWJOj4XmzvzcLOCA90nvk1hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jon0aSX4; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jon0aSX4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6d3851e09so1109655ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 14:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782250037; cv=none;
        d=google.com; s=arc-20240605;
        b=X4fpa3FUIcVM6oNW7ZFz8yWGfckhZi/j5bT8X8KHYScvd3h/kzlnNypwL4rC+yhLna
         b6Ud0ndoN8buMMWfjRxxjA/D8W0y+fZja9Aw7xkrfttBIXvyFO/TUEswLUpQ3Nfnre0o
         gsaEJW/8N3gsfC63qCKNejMlBIkUVPwRr0mxjGQ02hGZTEiQaO+Xg1wHjTWt9So6wWLc
         kYju2A6DkiYhp3cajlR2sFRwONmawb1VSfBW2KHGJ3IJvbd+nCCXoKojnZXoX3Q7YDra
         IHNZMOEb6QfhJVGRXGXuxaxrkO1iFm9gMChRRAYQy13k7Oo8EYm/tBO/+A9ep4e1ajEW
         oafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L8wo5u3B+ZdxxKhZHr6gjYHFiYr35jlEHlBTv44aLrA=;
        fh=SUWT9EuiKQnfXUfFddP9OJHBNaKsw2v4raQHTyr3gzc=;
        b=KZofc71qkRLI1+wovAoSdLraeu4mZQy7QAqANo0uh0xPSxgqPV3EvkKy3zTeokRCMx
         Xkn7+YQ5bmSiYhEqa1VpscFhGxYB+wsCwhvoLc0FbPhENK8TtdWYTIzWKUHqMDGs0BEf
         /znfu4WB3h+xcv7D94K2o6a7l8kc9JrCoRrhEmcqzibeVaAjQB7WyqD8CpvdYvV/Hv3x
         AsHYKtRTf+epWS5xZfZArC9kokFgo1ztgHHCbXSqGX5sby+5MO0UjYcAHZLvc0T5EBQ/
         1gMvr8IsPY+fZNrZnHwWSW/kX8yVKFd8eOq2P95PB1ftL98Qd3z0dSw3dBrQWDD9twOo
         HvsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782250037; x=1782854837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8wo5u3B+ZdxxKhZHr6gjYHFiYr35jlEHlBTv44aLrA=;
        b=Jon0aSX4317oa+4akZ5n0ZY/yW2mr0RveIqR6+bS4gnqJwqR9YtZ9H35zXGZzE2LZH
         8200yWtUcOQ/mS5Wi10DZbRvdbiPBB2Cche8spr74S4npBMzdXlUhYDO1ZpF1yo30Qhm
         j8vOvfT5jh8lKT2zbWyuih0Y8TfcozawyWzerBux9jgWm7HOYIURIp57Vt/NFo598+vk
         lY6PPvEMrkp9eEoeX2vYwO+Bpb1bKUYfpViQi/4dwpyBn2Xxk5TPQXPZLFfE5+v1v/Em
         qb2iGeEgvEipKyhJNf0eYtkf05qMEuH9zj4R+kGZ0K2kZ9udpeZNZGBQMPt5bVTrhkdN
         E3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782250037; x=1782854837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L8wo5u3B+ZdxxKhZHr6gjYHFiYr35jlEHlBTv44aLrA=;
        b=T3EWrWSAvtRhKEs6eZfh0Ujz6ikRXW1XsourtgYfywMTeZrRltdJG8qwe4orUJ7FHK
         W4uS37u0VhsBoNjDxGjLsWOeBwkiNO+b1OZ/SVL3B8MjDbXBg7bUkPR1QOrKZ3S+lTrG
         Nk7nBKzSVn7rVp3nBkKKGhV7yZW89dkhIsEPw00LJxD4qL6XM8I8ey4iO1/X4lRZh2z2
         6H0CYDZIpMAOAc7QivKIq+Eaoq6k2pdGwQLAc2yEgQViJya4qnmZ31pbu32G3MZiQ4i9
         Sk3AXmlAsd2bc2CZZSOF+ZUIdqFELdyKD2eYmaUJoMzhEcgr8nT77Nezujfog/JKBZsq
         xOew==
X-Forwarded-Encrypted: i=1; AHgh+RpHlVr92gnAAOaoVZJgoVxwFiY0C1Rok/RysNrD/nSBgpJIlgDtkjEDAZOLYAICdVB2Mlww64GliRQklxC3FXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/OLnGYXXNZj8OnVcLpcCZ1E3JftBj0x0Q5uvPGbEUSm1hkr/
	Z0HMYGP6T7dvCOmKCeTSiLZHjjl0lQHp+OovrS5i8tH/UnwCZGpkisEXjRUKeAQTkJanIO1bCJL
	UagIgVvWtFmfOU6nMu+WpJsxk3bun7Bc=
X-Gm-Gg: AfdE7cmyt5Vz0CENO1dSPEvkzqeal9lw9oNqDM50gyW1ScbEy4iIAuYZxRdyIjEbmYS
	KUy31ZjDXrzulG/GKwO6ESTiPDBSAcutvjULOPZFFZO6TA4VEp66fPzMgPzOyrzOsMbOcE6F6lj
	Ri596M16OobepMDvUHfoKS65vMDwGnUnkciZfra6Eu9g5i3y7FgbFMwPIXwx4HSlvpLEYZAAfw9
	eEUm0CvwTWzgXeICWPqM7tAopvhWGUCv1TGBpM9m18Fm+jkQ5HywMnPpCjotNFJcYzuDfhCHqvW
	9HFZWIg1mmx4TIUy4f99TPL7/8yQlZhp0ElpwiWCDIZBuojs3E/1fDa5S0sa1PObFtcTCA==
X-Received: by 2002:a17:903:2f4e:b0:2c0:bcff:e191 with SMTP id
 d9443c01a7336-2c7e155da25mr6288945ad.36.1782250036987; Tue, 23 Jun 2026
 14:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-f01-09-rdonly-cast-dynptr-lifetime-v1-0-2dd0a369e153@mails.tsinghua.edu.cn>
 <20260615-f01-09-rdonly-cast-dynptr-lifetime-v1-1-2dd0a369e153@mails.tsinghua.edu.cn>
In-Reply-To: <20260615-f01-09-rdonly-cast-dynptr-lifetime-v1-1-2dd0a369e153@mails.tsinghua.edu.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 14:27:02 -0700
X-Gm-Features: AVVi8CfkdaeGRdVzm1GoBC0ms0FotRchPzMTLAMKpfLmVhtWsC_AuyITHsOw_FI
Message-ID: <CAEf4BzZONoJz3TYdPz_b9K=bZm=+Hyvrayv=4OHU15fqmPu7yA@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Preserve dynptr slice lifetime across rdonly_cast
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 1:57=E2=80=AFAM Nuoqi Gui <gnq25@mails.tsinghua.edu=
.cn> wrote:
>
> bpf_rdonly_cast() is an identity operation at runtime and is also fixed
> up to a register move by the verifier. Its verifier return-state setup
> must preserve lifetime metadata that belongs to the source pointer.
>
> On this verifier model, dynptr-slice kfunc returns carry dynptr_id, while
> refcounted dynptr release invalidates aliases by ref_obj_id. Attach the
> ref_obj_id to bpf_dynptr_slice() and bpf_dynptr_slice_rdwr() returns.
> Propagate source id and release metadata through bpf_rdonly_cast().
> For typed rdonly_cast() aliases, keep the source dynptr_id in reg id so
> stack-overwrite invalidation can distinguish the originating dynptr when =
a
> clone keeps the ref alive.
>
> Otherwise, a cast alias can survive bpf_ringbuf_discard_dynptr() and
> remain readable after the dynptr release.
>
> Fixes: 66e3a13e7c2c ("bpf: Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr=
")
> Fixes: a35b9af4ec2c ("bpf: Add a kfunc for generic type cast")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
>  include/linux/bpf_verifier.h |  5 +++++
>  kernel/bpf/verifier.c        | 36 ++++++++++++++++++++++++++++--------
>  2 files changed, 33 insertions(+), 8 deletions(-)
>

bpf_rdonly_cast() takes *any value*, garbage or not, and returns a
BTF-typed pointer that verifier and BPF JIT generated code makes sure
can never do any harm (it will return zero, if the address is wrong,
etc). There is no issue here and we should not invalidate the result
of bpf_rdonly_cast() just because some dynptr was destroyed.

> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 185b2aa43a420..0bc4b40e76bd0 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -1366,6 +1366,11 @@ struct bpf_kfunc_call_arg_meta {
>                 u32 id;
>                 u32 ref_obj_id;
>         } initialized_dynptr;
> +       struct {
> +               u32 id;
> +               u32 dynptr_id;
> +               u32 ref_obj_id;
> +       } rdonly_cast_src;
>         struct {
>                 u8 spi;
>                 u8 frameno;

[...]
