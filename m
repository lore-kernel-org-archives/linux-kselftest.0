Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F393446B0
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491583; cv=pass; b=o/GNGAFw0mrF1B5/ym8C3oroZ62sK72lSM138Wm/JgyjnCcGD1vhraz2NaAlW5OFZ02bUIUf2DYgF9EAR9A3n1ci9tupuXZwiK8t62wpFW+qjOc4Z7T8OuAKuxPpxj5uenuZS+av2slGdjVRogN/X7AnZJl3TwuDqVBvWLKmfEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491583; c=relaxed/simple;
	bh=1Ao81rLLMJ9T3ZhPayNjrIz+C2kFvFVa1w9KQcaOTbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNKj6HzukWW0SZVoPxyQsBOJTytRU+q2EUGgGAy+9c/2b3DmEG9deF0qZrdcnAN0qPoHyXHLmF+swQRD3Ul0pH23S5WSk1y5Zw9p1LmsRGjGG6kz/U7NVwunzjvBTrV1CAGvcHSc1m0LFSd4uNugWssJPm/lTMkWox0CskFv6Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcrVEnSB; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcrVEnSB"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64eaf8aa893so3376467d50.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775491580; cv=none;
        d=google.com; s=arc-20240605;
        b=hVWD4iZV1xtehnq4NUWpAdoExTR15iL/uQVqltkdHcdl/LxuJW3eICO/TQOmZG/hYk
         dXWgECwIH3F6BGS9smttrabvI94feOC8vBU+e8Rgj5vUzco3P2QVcVnEQ+nFr6xVcZRx
         C4KOfFJxoraNoSPkBLgeH2OEbtTvNUvqv9HPaFb/Pcj2cxB/7MgcrcxmG2fC/y8SzAMr
         6+6IygjvJHOoIQZ1W6FOCBprHxCIDPcHT4HJJ3C8zSED301jKIfDfhD/cGJBgG4PXfwE
         1ji53t6YXp5fgejw+HVcSgi11bo/juL0vOcxFsCbzuYeGP1wSomvcnaJGDLUs2LcQpsb
         prmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r4k6iOIVi59Lg0iTaZk1dsAN/oP6YbMRjWJFQdPXIOs=;
        fh=k+izrRQxNbC6IPRjrzKb+XHNdQBtX4fL+lVVKTP2/OQ=;
        b=RzOdvVTVYiwEr5/o2kTK5dWTiceSBpAxIjFoHMHPRM9pzq6xXlejRoZyNbPGaWO8d1
         HBVCzsNbMWTj1ad++QalUqN4ACzQSU/uWgnkYYH5AgDSEYp6yk/7RSa9V8+lf1c4M4vf
         SLoXradqquGZAdOPpLnkYDW5ZIdWCiOEYwehoL9tkG/L76eFM4sVE5zPe1hgRTbsXskz
         lcGYgg93+6IYh2RVIgSMoBzw7Usx5rjmSTy9g4/Yn3nP8ylvqdF3HbUadHdxJfksP0xQ
         LFfXDuR7jITNjXuP6/a79IJCSV4IA5gk6F62KmkzkijpcVznmSTRUFSPBB/IDMvrYaLq
         SQDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775491580; x=1776096380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4k6iOIVi59Lg0iTaZk1dsAN/oP6YbMRjWJFQdPXIOs=;
        b=XcrVEnSBzqObcxdel+GHkgInMaZKgb3qUAZaCNqoARA3InJt/2N/OC5rL6XKpYm30H
         i4YjqyZTeAMeo4dMFr7uqDKq4cNp5CqMNBRf3d07RJONWe4xqXuyJhkH6DZiAEaztuDo
         9DyW4Otfiv2xAv2T571/F3hVwN4iWYnL5zJof1XJgf2E7s27OLCozFIeJ4VHNyQ6uXIM
         XLIWxCvaKhE3OFnCM4ZLO59m+Rv6rylnv7j1YOeFyuOFFJDtxVgrpQ431EDpzTOfdjmc
         0jQs2XdHPp/6GxV947NB9N0x5dS3oGCkR9kZnyKPLcNh53mbSKg5CauAouJJEruZJjDw
         /MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491580; x=1776096380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r4k6iOIVi59Lg0iTaZk1dsAN/oP6YbMRjWJFQdPXIOs=;
        b=TC+U/5QlTD0cRgqpUAlIVboVh7IuXAEXyrBpAILtjt9cz6wJGbkqoIx9nY1viWybUC
         8Jcf/zubIjslTW3jQke4qL/jOsTqGLkbULQ2KRqApvEf9ckr5fzl7iJhspPxQU5+sh86
         B2EyKxNyL69DEhMs7uYt8Jwmjgxz2Jgif6Eys7Le/DGIy6XfcGupbZlqsPfoobwDf1m8
         g1E49VptwG9bTbGIAt+rSEvM4xsz1g+/eXBHHxLgkkEQG5EPPA4wOZvHBGpMSC7jkUc/
         74FGSby4hwDShomNbygYayK5fUWcAjmOmJBzNn3RQqFUjC0teNbzgcUxYOuXyKN+nY62
         8Yqw==
X-Forwarded-Encrypted: i=1; AJvYcCUei+iplZw7qeBbN4toh90MB+/Vo+8tCrUskFr6v0jVFoE/BtconZJ0U6XcEFIGg9df9k/p5ijuFitfYh46idM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy6HGrdAr7p05yScKtZW2Nn8oidlVpUiu+u3jL6/y8eVrtP08/
	gj2YC5Jl65gOLOkscotaIUaybnTULDo8/xgKaoNhGAN8w4pH2c0dXjQSO+hOf9TYWfCucR7jfHz
	636XX5hJbdL2q3BBhsgL/5UNvmLQeZm0=
X-Gm-Gg: AeBDieujbn3TMCm38QifkSmeejyJJ9mVijNfKTj3nu2A5e/Vg5Z9HLOBX5aeh4H8WFQ
	z9jeAVFsIELIDYgT5DaVYUc9R8Kk6uTeg++Bi0XrHMT7FN7/ggNmaTyUR74i1hRSscX5CjFvbM9
	HxEWO57MD/Qsfy/0o3M8bpAv0snvAfRn6K59XAB5sduXJ3vDyI/p5uywz7yRriIs3aTs9KLk20z
	1MLpOW+/UvrIf0le+jf5iwiP/eWroN2MmTxaH1rwPJXloPCsvyDm0q37QbI6Z4TqkU68U+McKKt
	lGMD1NlPyz16medFdmEXYOitaoC8pBm+3x736gNYMaPuLVm3eWM=
X-Received: by 2002:a05:690e:4853:b0:650:39d6:69a1 with SMTP id
 956f58d0204a3-650486f2bedmr9450184d50.4.1775491579797; Mon, 06 Apr 2026
 09:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406031330.187630-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260406031330.187630-1-jiayuan.chen@linux.dev>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 7 Apr 2026 00:06:07 +0800
X-Gm-Features: AQROBzDlDluK28vEL2sKAYGrEn54l6_RzgjNnCFfO8DMO8cybYxLjy0EB75dedU
Message-ID: <CABFUUZHFHFy8E11QVPxgkpdS16-f8ieTmHzJmEU-6pLUy2hWjw@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/2] bpf: Fix same-register dst/src OOB read and
 pointer leak in sock_ops
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Quan Sun <2022090917019@std.uestc.edu.cn>, 
	Yinhao Hu <dddddd@hust.edu.cn>, Kaiyan Mei <M202472210@hust.edu.cn>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 11:14=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> When a BPF sock_ops program accesses ctx fields with dst_reg =3D=3D src_r=
eg,
> the SOCK_OPS_GET_SK() and SOCK_OPS_GET_FIELD() macros fail to zero the
> destination register in the !fullsock / !locked_tcp_sock path.
>
> Both macros borrow a temporary register to check is_fullsock /
> is_locked_tcp_sock when dst_reg =3D=3D src_reg, because dst_reg holds the
> ctx pointer. When the check is false (e.g., TCP_NEW_SYN_RECV state with
> a request_sock), dst_reg should be zeroed but is not, leaving the stale
> ctx pointer:
>
>  - SOCK_OPS_GET_SK: dst_reg retains the ctx pointer, passes NULL checks
>    as PTR_TO_SOCKET_OR_NULL, and can be used as a bogus socket pointer,
>    leading to stack-out-of-bounds access in helpers like
>    bpf_skc_to_tcp6_sock().
>
>  - SOCK_OPS_GET_FIELD: dst_reg retains the ctx pointer which the
>    verifier believes is a SCALAR_VALUE, leaking a kernel pointer.
>
> Fix both macros by:
>  - Changing JMP_A(1) to JMP_A(2) in the fullsock path to skip the
>    added instruction.
>  - Adding BPF_MOV64_IMM(si->dst_reg, 0) after the temp register
>    restore in the !fullsock path, placed after the restore because
>    dst_reg =3D=3D src_reg means we need src_reg intact to read ctx->temp.
>
> Fixes: 84f44df664e9 ("bpf: sock_ops sk access may stomp registers when ds=
t_reg =3D src_reg")
> Reported-by: Quan Sun <2022090917019@std.uestc.edu.cn>
> Reported-by: Yinhao Hu <dddddd@hust.edu.cn>
> Reported-by: Kaiyan Mei <M202472210@hust.edu.cn>
> Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
> Closes: https://lore.kernel.org/bpf/6fe1243e-149b-4d3b-99c7-fcc9e2f75787@=
std.uestc.edu.cn/T/#u
> Suggested-by: Emil Tsalapatis <emil@etsalapatis.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
> ---
>  net/core/filter.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 78b548158fb05..53ce06ed4a88e 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -10581,10 +10581,11 @@ static u32 sock_ops_convert_ctx_access(enum bpf=
_access_type type,
>                                       si->dst_reg, si->dst_reg,          =
     \
>                                       offsetof(OBJ, OBJ_FIELD));         =
     \
>                 if (si->dst_reg =3D=3D si->src_reg) {                    =
         \
> -                       *insn++ =3D BPF_JMP_A(1);                        =
       \
> +                       *insn++ =3D BPF_JMP_A(2);                        =
       \
>                         *insn++ =3D BPF_LDX_MEM(BPF_DW, reg, si->src_reg,=
       \
>                                       offsetof(struct bpf_sock_ops_kern, =
     \
>                                       temp));                            =
     \
> +                       *insn++ =3D BPF_MOV64_IMM(si->dst_reg, 0);       =
       \
>                 }                                                        =
     \
>         } while (0)
>
> @@ -10618,10 +10619,11 @@ static u32 sock_ops_convert_ctx_access(enum bpf=
_access_type type,
>                                       si->dst_reg, si->src_reg,          =
     \
>                                       offsetof(struct bpf_sock_ops_kern, =
sk));\
>                 if (si->dst_reg =3D=3D si->src_reg) {                    =
         \
> -                       *insn++ =3D BPF_JMP_A(1);                        =
       \
> +                       *insn++ =3D BPF_JMP_A(2);                        =
       \
>                         *insn++ =3D BPF_LDX_MEM(BPF_DW, reg, si->src_reg,=
       \
>                                       offsetof(struct bpf_sock_ops_kern, =
     \
>                                       temp));                            =
     \
> +                       *insn++ =3D BPF_MOV64_IMM(si->dst_reg, 0);       =
       \
>                 }                                                        =
     \
>         } while (0)
>
> --
> 2.43.0
>
>
Reviewed-by Sun Jian <sun.jian.kdev@gmail.com>
