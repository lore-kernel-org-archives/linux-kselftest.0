Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316382;
	b=FZ/Z+tq+BHZ1SmQiFqO9r8hAXzbb6QMJr3XikirmCjAazpKBh6mJu6sMLL8zA/fHyPFJ
	 9T432cj73slwUyeXAX04sn3UbKg6KYzscwso70YEfGJSS+A3TuZHCL96cuvFaknwwKR85
	 8CzNYF92JDKK2TB2lsXw+rPzeLlw4nx8U/yCoa/dUkimmNaMN2N3kZr1CQDi5uOhk5gel
	 Pp+UyRUSrqqMdYe0nju1NLtp+ez4EM/p/yqKHkxt3FBXA12XUzAShi/nQ6+BO3oZvxexI
	 K8g3NExLQXC5FMVMYuQDeq5WEwsWJffoOovLEcUfnMwEpFNaD77rwda+sNdrz1qiwSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
	b=ziCmnxi6iWFwN6YQTr24d2mWRJTa0Evs1GearNM4QMN4EzctlCHtvzS0BtpqXMtXI4Rr
	 cyNLSTM4I+lfxhG5AV9gqpTtQY2+uFy/A9ZoQbp7YqIDcJ42c5fGazizpUqhnE2vi/JPC
	 +J1kdKdN790hMyPXmQnRekN337cuT7xgowOTo1KUvtffeBdn4Ua29BU7t1vmspUniKIZ5
	 5WdIDaF+FnS+FC0br7+uXnLdUjCY1bugSmpxJL20Oyua0ODYwZyUpFGjXwHAdOFVE6ovq
	 6l+Hpm7UptMrtdkXuo0lxHsD4J5Hrz+xUdvRXmHdARQbrK+W9WpzHzONIesZWttRGZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sdwbhu2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED12606BFE4
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED12606BFE4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sdwbhu2K
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so3001597d50.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 05:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794316381; cv=none;
        d=google.com; s=arc-20260327;
        b=VS4RBpPi1gPtX7VI65x5bMuYSFz3NbkG4vFZcTgnv+FwG19Dob0LgwUZWS+vH4q8C7
         Q9eUKX92Gr7ZtbTeEQQL0gElGv9I1Pfr/B+x5/7VLlIxab60zmH2vOdXY4ciNz8YGpgq
         De+64H5obeLYNY6AIoVBMt9WvtMjdbEWtyrqkX8J3z1i0x4uiYq8R9+H8tU77OMj2FDM
         vEdYRnxo5KWXa3zxB/pq86PiAn4Ry6x4URFVhysdZ2v6cq3mmWbNVZofcFirUGD+XonD
         s+cEDoyhq/eVVHvEC3dYmat7F0De8klfHjrgPFHGCy1iuRwroULROcBoGEVtxX0QF0nT
         qJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
        fh=OIz4rcUqcifuh5cgMt2a6wQhP+ZprjwTqlexIKAPVUY=;
        b=WjK2QGmeWpJOeYxFhzsb2PvRPc0BCIqZ/PYa38xcyS/I9SX6zEl6et0mKeh419bSuh
         EW9Xgs7aQnMXiYgUY04wJXGT3GWM69A1qPTH9zwUVkoT9z69FB1hqoDUmcWb6xa7M9NJ
         e5pRl0md4xv4ZwnKGqvn3mXhW+IVf2knbkj5xWhEAFFnc3bTXeYUJZl9dngWIrr/VUcV
         tdNctF73Lb+qIR8RAw5znBHhAw6kypI+KEsVGf+S6LsYP8MT/0iS/FIItFX/FkkLTOsa
         N21QQnSvTS6Ru+G4VtSExWwcM2VZ4pEFf423NhdF1+yv1eRnldJxT5Ei5vsUd6ndKUdX
         a4/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316381; x=1794921181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
        b=Sdwbhu2KpgwFLfVlfH6iDlq+dRJGSCxir2demi1cxoaqTT17leKdGKQlndYEKtYU5c
         4CmjBWzYktFmk9hfzFAmZ1VoHanX2QcIdUGdKqTV5oC+C8BP+g4INWFSWYNKyCfLqt3X
         tUcd3BGcEHlP5W4vaDqhhHjHeb5wnrSczCmCQGbzZ3ZHU/IySdOzvic3w8LMH7sL+mwn
         V7+6WUxXTfMZH0o1cPClzyFGoiTHwiQWRleDmjIiztc8DYMf568wzkX3CAUQAh57tOPJ
         tWrRaurKK4islFO7DwFl7kfIUnB1VXryOTOUJvrOa0eEUhqKjP4XdCoLIjoqDcDxUazt
         dS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316381; x=1794921181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j9MOCzNF55rZGGpluezeQ+vnoNPiPbJ5pnRhrnmo5Bc=;
        b=aCc9ngHYE76IKH2Xy85pSl74xKrFP/PfmQb3eKn/xI4NhSVSQ2wy4lz6ea3QbeRmm+
         lPE5IDIwhsdSKS/9+aCGO2kQsPiH+Gif3OkcUOpOjqaBrInnvN12uDV9+Dn2njKRFHmB
         ud41Kk/ylJukorsaZdXEV6mnZXUmMz5JLeT1/BCatnlDhrSu7dPTnIrDSjMJNvrx6XZn
         1ULylbEhuDLZqC97Ak/v4MKdCfRvEGoRa+/v41oOrJNQJRG5pbHt/2CVgZm4o7uKrq6L
         rxXHs/sPwHFCmh7oUIG/LyoW2Oa1NbfkUIsmRN0jYcSrL9+RZbgih0lBDxLMYFooQcYW
         5SUA==
X-Forwarded-Encrypted: i=1; AL+hErGrdDpwXR4lJhNHNeVHTMYDQ8wAwcomTP4JNCRdQDQihRjaf8og+xyZ+IJ/uzT1LkXl0j0xdSz5o5CfXWNEYN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HfUpb5ezRcxd+yIuymiQSJima3FCX8t4FXyyg7Ga+nDRCcc5i
	Ag3IkTyOiJ9GFWnZu2FKJ/wBA93VpBtWbGW4p5YQ/Y6zSQRrioDaA8QAMnSQ52bHQVYIeUlx0X8
	kjnT/ro8geDqYSbJFv5FTjyoReffyN4o=
X-Gm-Gg: AYBFou129Q/eDnc/wYLNGqkY27BRrqjTt+lqMSnn50+ENo9SOdFvcC/lMhNgwglqGbU
	fJxJIlF1lZ6/XV8yKHWWihzkT3ANeNBOuhHThsjTGTLU9yqOvg1YP3Y5GHFaGepV5hD3GmS+apV
	xAqga0TFctZZMoV4twEIMMHT9Wljz5vRu1i4dIQ8ncSCPKQmyWQ80sSDKAzAZwbZ2g4vP0A6AZf
	kFyw4kRsJ6o4shPB99Q6zJaVrmsz6ndUelXjoX3MBKGx+5XTgH8XwBzVvPi/1rwivEbxg+zj/Uz
	YJf1MwK72z8kg8YjjEAodKYTV+z6ILIzu5VSg8gV0tYrycXRT/G6K1y/Z8x9amJSJgFuAG7qtW+
	NEkKUSUJ6nbZS+CUHHMsANdI6aJR8XjeEZTz9qA==
X-Received: by 2002:a05:690e:1386:b0:67b:eb7a:e62a with SMTP id
 956f58d0204a3-67c56265785mr1829765d50.0.1794316380667; Tue, 10 Nov 2026
 05:13:00 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
 <f5a22a46-0fd8-4739-bf11-a20e0b3a443b@linux.dev> <DMR088J2OR6L.9TOD4IDBHTZ8@gmail.com>
In-Reply-To: <DMR088J2OR6L.9TOD4IDBHTZ8@gmail.com>
From: Anton Protopopov <aspsk2@gmail.com>
Date: Tue, 10 Nov 2026 14:12:50 +0100
X-Gm-Features: AclHuK-z3hLVWTJeTumw2Ph2v5vhN9G_65U0kCrk8Fj0jgmTxAiCTqvVd4CkNag
Message-ID: <CAGn_ityW5Z+JEcTL9wKnQOgLXhjXxC357Q=h95AgR9xP+pcmjA@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/7] bpf: Support struct_ops in light skeletons
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Siddharth Nayyar <sidnayyar@google.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Neill Kapron <nkapron@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:40=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Nov 09, 2026 at 11:46 AM Ihor Solodrai <ihor.solodrai@linux.dev> =
wrote:
>
> > Andrii, Alexei, wdyt? Any other ideas?
>
> The loader asks the kernel for ids, sizes and offsets only to pass them
> back in the next three commands:
>
>   the loader asks                   and passes it back in
>   --------------------------------  ------------------------------------
>   id, size of bpf_struct_ops_<t>    BPF_MAP_CREATE
>   id of <t>, index of the member    BPF_PROG_LOAD
>   offset of data, of every member   BPF_MAP_UPDATE_ELEM
>
> the kernel can match by name instead.
>
> The kernel has both BTFs. BPF_MAP_CREATE of a struct_ops map demands
> btf_fd of the object already, and bpf_struct_ops.c doesn't use it.
> The kernel can find its struct_ops and the members by name,
> like btf_parse_kptr() finds the type of a kptr.
> Then the loader passes what bpftool knows when it generates
> the skeleton:
>
>   command              the loader passes
>   -------------------  --------------------------------------------------=
-
>   BPF_MAP_CREATE       btf_fd, btf_value_type_id and value_size of the
>                        struct in the BTF of the object
>   BPF_PROG_LOAD        attach_btf_obj_fd =3D btf_fd, attach_btf_id =3D th=
at
>                        struct, expected_attach_type =3D index of its memb=
er
>   BPF_MAP_UPDATE_ELEM  that struct with the prog fds in it
>
> The kernel rejects such BPF_MAP_CREATE and BPF_PROG_LOAD today.
> Nothing changes for existing users.
> The BTF of the object is in the blob, so the signature covers the names.
>
> Then no need for a helper or a kfunc. The 4k buffer, the fds of module
> BTF and the offsets at run time go away.
> map->def.value_size, prog->attach_btf_id and prog->expected_attach_type
> don't hold offsets into the blob.
>
> The diff below replaces patches 1-5. Patches 6 and 7 stay.

I like Alexei's approach here, it fits with shirudo. I also have tested it.
(Patches 6,7 weren't tested, shirudo uses libbpf without bpftool.)

>
> [...]
>
