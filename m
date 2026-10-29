Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793290985;
	b=bwRzBPn+lTnDikbI9GNL4Rq1gsTFn8xZ6I23l8awqvA3Erb+zjBUAfag8PCF7utYDj2c
	 nioHDHPG51XYHwefLqg7cI9cpd9Qcd8C3hIZInjyW9L5nPQwa8lqKbwyLkWCPzd3hJ5nK
	 mClXuGCbPoogl0GXdcAgCJ1PKFSz6MxJqlU91I3FLqPLN0KzTBUN9ckoCnenpLaq3ilJ4
	 BlEPhX5OCAwxZ+I6/yrv4sQtJWICaNvE4OsjVke+6AxgI+vfhxuwbij0QVHU5Vqnkqe+V
	 EUy0Noc2Wb93fkl44vNSuaqhRo+btpFF8YX/UoB34XXekQsbDWjV09rohEuf7le78gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
	b=1A7OKTCrkQrsTsEmDpSjAj2rXcpPtBvjLt8bKEJN1c2h0S8vjsykG+guDyCLg8CQRFYR
	 SVXBNZs0kBmJ0DVcug3pJuINh/b2I5pUfZtHpGbaZR65rKAjuUDmphm6MwNnz9iPZrDgU
	 zaanhOLH39E28bFd3nebp4PF+m/ctaXs8IOTmBR9WeR3EPsASxrCTUy45YfyWLUV2pMQt
	 QqC4ZedcNIAHspqIojTUYmTnKhFo1bK8L2Tp3Ncl+FPRsf7O+hS03PtlgMSP+/epmEdGC
	 TnthW2f72ZUeeqqRYUi4+MGStQWYc017F9DZn/V5QZ0/C+jlZMxYtXrZtkTX/gMBk6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vl6h3FxT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58B560A263C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 16:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58B560A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vl6h3FxT
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40f29667e6so320992066b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793290983; cv=none;
        d=google.com; s=arc-20260327;
        b=DaWrIHcDdgSCfafZ2NcS5qSp2BWJfYxPRagNunf7cZTTxWMgQ9AjyETZjkUfzRZz0z
         7r/IGqCNBuUQXevkrPJcltLW//Bvczmva9vZmt7dAWfSb3+tj0DqQMbvBczff0AHNafc
         rWJ1EYrGWUp5/FyfywVZAvjVVloRRzj0+tw8e1xqY/yy011d82BOpMe1RYOR1m2QRNw+
         QRv4WKts/gCJ7Va+/0sPOPvHp0EH3NUDLhWmOEMbtfSmKYfpVaObz23Dn4DeeJOJp3wd
         F+rL+ExcZFkjae84iboISvHfNjU8Eafmr8xdkH4XLR8m1EnYSPMiSCeFqn7Mt8PozwQP
         E6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
        fh=C/nemVwfXyKofH+W73hWwp3g7D4YPfUFIygHetPvCHg=;
        b=IEJZxR741AKGDBxEWtrXvJcJle1mmts+yg23GNiTFSVsbuC5eNHa6KiGzo/vTdSit8
         TJQRRESjhZeXYBNmRGYJMIsY8b6GoQSr7Sq2MDOccqc5r9QAHYfLc+L79368JTHmE3nd
         jqdijd50BBJAoVky8LUf+DMzgDbj5y8q3PKNarEOS/Rvsjs3OYhEVLEhDnstVIolZFm7
         KJiTNpoI0weFI3ThBtVDoKBDpSkdmYIlX63zK33ZdPxhw4pFJxnuBA69WagPrhnuqRgB
         PQXFZjVo6CBGA7yn7+43EUhA2yQULIBfiu2WBii9E5L/87JduU/XQyYeAGNIQyhxH1em
         KklA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290983; x=1793895783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
        b=vl6h3FxTysc9yet6D3Q0d2GO8gweert+j49hx6iOwi7wFPNTUWfuBL7fsyyfVvnyvZ
         +Z1/kzcfRHuriJXExOiQjIZH32FZIEYk36Du+K2Qp+xNd/zW+Vw7+cZ+3sHCdKppJ5o8
         eatU0GNm4EFgoeUQ+hg+aufwcL0fsR0bxtDwsqwYPSmTHeXFmK4DaWOmC6SqnWgBoZ3w
         PCxuGBUd4CKVgczgjA3vYepQkhpbhYZnVWmJ7nhg0H7W7tE5tOgms8p4YL8rZwXyG2iI
         Zc2yNh+LlvzPXc6XiXnDpdY/AAXfxq39EqGeUq5qFxEMHK/EKYejffUV2/LJ4wO5JK9I
         JZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290983; x=1793895783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
        b=vmtP6zEY1QvwoS7dXnVI5b0mRu0wiKp0ssLZ+gWENTnzr3B3cPyLWjJ6EZH8+dqN83
         aQNXLfeC38wJIdVbpXs/vjjGzv7uJ+Hc/GwIVMYIdIYgomI9tLg/6mvwynIyviZslRGH
         eIKVPRmh/NpyvxQg/aHp1XjJV+5LXbQ8FTspgc/b77xJOy5b1hR4Ii6b2uNr83hkwrlk
         GPxeOEDD+TLrNTV/6pfy+lKpiDz32Yn/yhwuKBDn5ip4rFlXUlADN6l/B7wj0G8FLxdc
         C3Bi1Do6z+8QjujXp1UA9Pj4uQD+S9Uc+8mHGc20fzQdexWaQ3V79hX65VpKYXGElQnl
         pPBA==
X-Forwarded-Encrypted: i=1; AKwUvBwSQS10C4I4GXlpl3WqTsreMr1uUkvd68ilvDVD/KhsvZRpxOmmLNf9yOS9S/yCddh7fkiKw2Ln/YNKZe5hmwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKArcp+g4aG6upu2fTpvyOV/deWsI7O5hAtTWGAASSV9OPEW+Rr
	RkdVAY3ItLGkRTsMj/BizvdyVw/OA6tsVCbvML7QvjiRZg69/Myk3EnLJ8qvhlXnc5/uwhKZsA+
	07TVyru9u10adBzSNvaNf5hhqXVPUcvk=
X-Gm-Gg: AYBFou3IDH36f8Cg3/kUWUVe//p4Nd8sybzCMEMtllN0DrToKgKa/HPZnX8BL8N5Kyp
	WgxY5lQeEv12DhYADRQ3+QvcSOpJB7MNS98L514Za1QuRGnHIac347O2ewmOktWWktVhV1sDhs9
	AnrwBsWGuIasYzGZgdnWaWi4N0T03D51IqjxgGe/BsxB6/B8IdIgzWy0s3MvjgswaSnWVyWSyTA
	DpYvx0mfsbWpfAPyN4m59lBqzuI5uurh5pI36wx4D1tikcOEkYuWRx1F/EIbBQjDA6+xEoQwfvu
	8BOeACzwJcJMb6RqA8gO5PlJXFQsA9NRsQ3BCG5CxnZ3p9vBoBzfx8cmua/K5PaZn/wPXePRLCA
	SGiUnDL6+lge+k9awe8neKE0VmdU+4+CTUsFNEO9MEDNNbHXg8y8MUlGpxC/8Mego+Adl/fzhvH
	quYO9/vYN37RhMkF7A1J7C2FsmYyFo9TLcelU60vb309Bfdhtr/7/BUT8=
X-Received: by 2002:a17:907:2d10:b0:c31:91f9:60b7 with SMTP id
 a640c23a62f3a-c49bdf43869mr561025466b.34.1793290982774; Thu, 29 Oct 2026
 09:23:02 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026154948.99408-1-leon.hwang@linux.dev> <20261026154948.99408-6-leon.hwang@linux.dev>
In-Reply-To: <20261026154948.99408-6-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 29 Oct 2026 09:22:44 -0700
X-Gm-Features: AclHuK8UvOBWlBbj0vfMh3zLVN3mKm1giM1eECBMPqUpu-79pHcpcFNIaDEnC_I
Message-ID: <CAEf4BzbW4zwL-9j8e2B6KNXVNwsfWyMSAo_RsGCqv-nu_yGhTg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 5/6] libbpf: Add log_opts support for bpf_link_create
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, Masashi Honma <masashi.honma@gmail.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 8:51=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Since the iter_info and iter_info_len in struct bpf_link_create_opts are
> legacy, reuse the slot of iter_info to place log_opts.
>
> When adding log_opts support for iter link_create in the future, we will
> move the iter_info and iter_info_len to the last union, see below. And,
> keep the backward compatibility meanwhile, that uses iter_info if
> iter_info_len is set.
>
> struct bpf_link_create_opts {
>         /* ... */
>         union {
>                 /* ... */
>                 strut {
>                         struct bpf_iter_link_info *info;
>                         __u32 len;
>                 } iter;
>         };
> };
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf.c | 20 +++++++++++++++++---
>  tools/lib/bpf/bpf.h |  5 ++++-
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> index aea534764dfe..38dcb31e8c0e 100644
> --- a/tools/lib/bpf/bpf.c
> +++ b/tools/lib/bpf/bpf.c
> @@ -794,6 +794,8 @@ int bpf_link_create(int prog_fd, int target_fd,
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, link_create)=
;
>         __u32 target_btf_id, iter_info_len, relative_id;
> +       union bpf_iter_link_info *iter_info =3D NULL;
> +       struct bpf_log_opts *log_opts =3D NULL;
>         int fd, err, relative_fd;
>         union bpf_attr attr;
>
> @@ -803,6 +805,14 @@ int bpf_link_create(int prog_fd, int target_fd,
>         iter_info_len =3D OPTS_GET(opts, iter_info_len, 0);
>         target_btf_id =3D OPTS_GET(opts, target_btf_id, 0);
>
> +       if (iter_info_len && attach_type !=3D BPF_TRACE_ITER)
> +               return libbpf_err(-EINVAL);
> +
> +       if (iter_info_len)
> +               iter_info =3D OPTS_GET(opts, iter_info, (void *)0);
> +       else
> +               log_opts =3D OPTS_GET(opts, log_opts, (void *)0);
> +
>         /* validate we don't have unexpected combinations of non-zero fie=
lds */
>         if (iter_info_len || target_btf_id) {
>                 if (iter_info_len && target_btf_id)
> @@ -824,7 +834,7 @@ int bpf_link_create(int prog_fd, int target_fd,
>
>         switch (attach_type) {
>         case BPF_TRACE_ITER:
> -               attr.link_create.iter_info =3D ptr_to_u64(OPTS_GET(opts, =
iter_info, (void *)0));
> +               attr.link_create.iter_info =3D ptr_to_u64(iter_info);
>                 attr.link_create.iter_info_len =3D iter_info_len;
>                 break;
>         case BPF_PERF_EVENT:
> @@ -960,12 +970,12 @@ int bpf_link_create(int prog_fd, int target_fd,
>                         return libbpf_err(-EINVAL);
>                 break;
>         default:
> -               if (!OPTS_ZEROED(opts, flags))
> +               if (!OPTS_ZEROED(opts, iter_info_len))

semantically cleaner would be to use log_opts here instead of
iter_info_len, send in a follow up?

>                         return libbpf_err(-EINVAL);
>                 break;
>         }
>  proceed:
> -       fd =3D sys_bpf_fd(BPF_LINK_CREATE, &attr, attr_sz);
> +       fd =3D __sys_bpf_fd(BPF_LINK_CREATE, &attr, attr_sz, log_opts);
>         if (fd >=3D 0)
>                 return fd;
>         /* we'll get EINVAL if LINK_CREATE doesn't support attaching fent=
ry
> @@ -975,6 +985,10 @@ int bpf_link_create(int prog_fd, int target_fd,
>         if (err !=3D -EINVAL)
>                 return libbpf_err(err);
>
> +       /* bpf_raw_tracepoint_open() does not support log_opts */
> +       if (log_opts)
> +               return libbpf_err(err);
> +
>         /* if user used features not supported by
>          * BPF_RAW_TRACEPOINT_OPEN command, then just give up immediately
>          */
> diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
> index 826d9cc9ab65..fe3b7fd8512b 100644
> --- a/tools/lib/bpf/bpf.h
> +++ b/tools/lib/bpf/bpf.h
> @@ -422,7 +422,10 @@ union bpf_iter_link_info; /* defined in up-to-date l=
inux/bpf.h */
>  struct bpf_link_create_opts {
>         size_t sz; /* size of this struct for forward/backward compatibil=
ity */
>         __u32 flags;
> -       union bpf_iter_link_info *iter_info;
> +       union {
> +               union bpf_iter_link_info *iter_info;
> +               struct bpf_log_opts *log_opts;
> +       };
>         __u32 iter_info_len;

in a follow up, let's add comment next to iter_info above and
iter_info_len here that these are deprecated and that iter.info and
iter.info_len should be used instead

applied series to bpf-next, thank you!


>         __u32 target_btf_id;
>         union {
> --
> 2.55.0
>
