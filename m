Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8597336492D
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 23:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774913251; cv=pass; b=KnnOIU2yXHXn/HuHL2nlSO2X35t6ERYaTiz4Xo0KkJzWJuNCOmY8V39sTi+afnD19eGBijZxr6vhNvXkt+YIhgKI21QytnctORB6Kjetm7Y3VzbMQlu3nVEABPww7ENbZlX5nnIUhrW/24l2FcLANuloiFdyHhYCP2Q8/AurbBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774913251; c=relaxed/simple;
	bh=JgZ5ODvWVLaWmasPVUDL4RPc/Bj5LTDUSgn7bToRISc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iS/n7oVQZ+Q5WSW19f6pJrOkCVPoHJZsqY97oVUfLVYN7ERJ9IcS3i2o0Mvjmk1MdSFglkh4jWyR/LMz1yKGKNxNLXOXQW8nKT2oFXec7TF1hIbHbgyxldnYzh9jEEeNkqFk0TJdrwwgtoWb9teTeiOPyc6UNEMx9eScqmhHlNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kWgbZ+X3; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kWgbZ+X3"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12a695044a4so1391316c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 16:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774913250; cv=none;
        d=google.com; s=arc-20240605;
        b=DOl4bENWLQGaPBjoqbSUw5oy+9NBzKC9uFv09Af/WJ8VbSghMGdPzRMfaluH+1fwL/
         Ru7apUTo6w34Uj9yP6FsZftAETgfqBce7xe9KWfULDeGPMLGxCPh0yD+Ux5QlisGmDur
         ovXF9kh4Sg9DbLF7iOdJhvt59MiDBnT/upX+FUr7kBC3c+D0vQEQ7iMhitlJnXvZ6qtx
         gxW4XqWAcILVZWdZHmYJPs7O/f6KJzmm6FBChnQGexXad2XgqkdfbuPDqPDOY2wGLBrd
         dMaQzqStCh1ADjohbKs9jBvi3MQZHnGYt0HdEDC6sfpXjbhajHnoLiJoczDLtM2J52wW
         0lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JgZ5ODvWVLaWmasPVUDL4RPc/Bj5LTDUSgn7bToRISc=;
        fh=lbuWJGGXmGslqMHXRUU5uC+3j0zE57YgNQmy0h8ged0=;
        b=NqI7c4+9uZGvvYiil9xGUtxZC2Vpm45+l+fV4mz1U34HWy2l+E8hUfXPBTdgdC8D4q
         kbNgWL9JIEdNSGBY+uotSknW4OPnQzWstQaiih9QqcSTYzX8295kpk3O6kaO+RyoKCEc
         YgEB5hCZrJEvLTN90akDYqAI2D7OBhiCRTp8wUC9EvzsTmjyNeMoTzbCzk0/eTnQlkPx
         yFKpnPwDBh29GUqqSI7ttPXjyJvq6QRZ1qB5nAV2RE/M0y6zmB9rngbVQBPGsYRRYcCb
         pHqxZ/JE3mq/QTXH1g02iSa+EzMLfBq+Z0tffGdASiXafBu7VbYKX6ZB11Lu+AIXQyHF
         QaJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774913250; x=1775518050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgZ5ODvWVLaWmasPVUDL4RPc/Bj5LTDUSgn7bToRISc=;
        b=kWgbZ+X3xbPAY68pfFKctbTIHJuIt6j1mpalAqslxB+AWQeBquJUWuzjkkEFpNu5mf
         S4sZ4nQHvGeMJ8H8qB/Hj5UxZpS6fpNzdYisaOO5gMxgPR3Eal1iEFNijTko9Q6pHOCp
         Iy6slvgBzxlFaEDG3e4nIsIRpl0NyMoY4FoVL8ArATUOa1A2/ji0ksUOgWFleciobk5a
         iJADRSlAr7kUBN6MR/fRiK/MgCKqfYbubwaupiel0Y7rjqByb6YqMfK0pnXtTNuIvj6V
         +GYAhmVWNYO1Lp12nv3NVXUzQAvfT7dzPgsVAifw54vbLdWqLvxPrm3X4QvLSrD9hu3t
         lwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774913250; x=1775518050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgZ5ODvWVLaWmasPVUDL4RPc/Bj5LTDUSgn7bToRISc=;
        b=D6euBwAq/LpX5rpCHRM4UuVs8Wd6iuHOdoC3f5Tl3UlSPzJRLDeeOz/MQ/qlZLSN0t
         6YzegcX58WgTVdAlFizGj4fV0FFxbFsIlqWVpDUs/P62KYIXSZC3QpNKVWdaokHKCJ1P
         2JGkJowyJg6zdpVGPIlsymaBL1M4OHqWFl6UynFmTGk+O2h+udKhZcr8N2gRC+RKCqry
         Da4dJ6I62VNptVPjScQd8Et3jnj5/Q7IMFS0MLD3S8jyzSWUgtAXE8O25vjWIxpUp/pV
         rHYyTLV5Yq6nKDLtNDP60MzxzgdEI3JsDk048MDSdt4uvZyB12HcrVjsR6gFiAMkFsXo
         pmzA==
X-Forwarded-Encrypted: i=1; AJvYcCXffveeGUTgy778+d+9LA2U1ttmohQrNk9Xjr0dp3hA/moUfQtj11UfNd+5LDd00Wq2AYwsbEXH3k7HB504+GY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHAG009Nc0F8r4xA+wXztk8CPPXZ/XtxeTo8mn2gVcK4SC43n1
	JIJO7VBsoYxUePcXW+BXdDLc+cskdGSyeqxTXt2nxLSIzYfpQNhTJee6X80vgV2yXc39/Y9whJ6
	nOjpZv5oT89EbbBoBkrmOyIrLeOjfKq7TKixYcM5H
X-Gm-Gg: ATEYQzwv2xy2R+vaczkqUdnGDvfO63yrJCiyTkoJ2EWWaRKRf1N3vcOHdL3vg+aagDi
	ODoxt3Hmdhes+OhFUomdbwCGrfJFSrAEYwdgnENxsPAKnji/NFrNcxTEHh6M3FdGU+/JxOYDIeg
	EhghY/VerHFIOZOlnhd+rL8wQydnhjckwSLSyeTWAfw69SBoE+tKBLwohSuofYNQgmYMHVHJlOA
	Q89U8wCxUD8iqmF1mablcLeaN37KliFXxocKld3Fzi45z439xyDnFca7ITYJ1k+BhXP/wKocceN
	J2dMtNPStLduJBjCxAd89dhdZ7yNMHbLigPJ1spiVsq4Acpvfu/UFk6x3ZU+OVN4NRJ8jA==
X-Received: by 2002:a05:7022:4388:b0:128:d0df:a66b with SMTP id
 a92af1059eb24-12ab28d8ac0mr8933270c88.26.1774913248833; Mon, 30 Mar 2026
 16:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-unix-proto-update-null-ptr-deref-v3-0-2f0c7410c523@rbox.co>
 <20260306-unix-proto-update-null-ptr-deref-v3-5-2f0c7410c523@rbox.co>
 <2192e9ef-894f-4826-b296-4f90e973a31b@163.com> <b9a956dd-ebb2-47ca-8b49-ccbba6ff9b26@rbox.co>
 <b21fac4e-891b-481c-9734-e95290e49097@linux.dev> <fa818820-c0c9-48dc-8ebc-661cb3349935@rbox.co>
 <dd043c69-4d03-46fe-8325-8f97101435cf@linux.dev> <27fa6e91-02a5-46cd-8c95-b75fd2c5fa08@rbox.co>
In-Reply-To: <27fa6e91-02a5-46cd-8c95-b75fd2c5fa08@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 30 Mar 2026 16:27:17 -0700
X-Gm-Features: AQROBzAkhh6Y9s4L1mXgxWRFDG45HwU7v2d7VbOquHM07Ta_Nm7VqgaccYrFf7k
Message-ID: <CAAVpQUAtF29CPDAdEUchYOP=oy8D2-B3GH3fWs2pwTmnYoTu=w@mail.gmail.com>
Subject: Re: [PATCH bpf v3 5/5] bpf, sockmap: Adapt for af_unix-specific lock
To: Michal Luczaj <mhal@rbox.co>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Jiayuan Chen <mrpre@163.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Cong Wang <cong.wang@bytedance.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 4:04=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> On 3/26/26 07:26, Martin KaFai Lau wrote:
> > On 3/15/26 4:58 PM, Michal Luczaj wrote:
> >>> Beside, from looking at the may_update_sockmap(), I don't know if it =
is
> >>> even doable (or useful) to bpf_map_update_elem(unix_sk) in
> >>> tc/flow_dissector/xdp. One possible path is the SOCK_FILTER when look=
ing
> >>> at unix_dgram_sendmsg() =3D> sk_filter(). It was not the original use=
 case
> >>> when the bpf_map_update_elem(sockmap) support was added iirc.
> >>
> >> What about a situation when unix_sk is stored in a sockmap, then tc pr=
og
> >> looks it up and invokes bpf_map_update_elem(unix_sk)? I'm not sure it'=
s
> >> useful, but seems doable.
> >
> > [ Sorry for the late reply ]
> >
> > It is a bummer that the bpf_map_update_elem(unix_sk) path is possible
> > from tc :(
> >
> > Then unix_state_lock() in its current form cannot be safely acquired in
> > sock_map_update_elem(). It is currently a spin_lock() instead of
> > spin_lock_bh().
>
> Is there a specific deadlock you have in your mind?

lockdep would complain if we used the same lock from
different contexts.

e.g.)
Process context holding unix_state_lock() with the normal spin_lock()
-> BH interrupt
-> tc prog trying to hold the same lock with spin_lock(). (_bh())
-> deadlock


>
> >>> The only path left is bpf_iter, which I believe was the primary use c=
ase
> >>> when adding bpf_map_update_elem(sockmap) support [1]. It would be nic=
e
> >>> to avoid bh_lock_sock() when calling from all bpf_iter (tcp/udp/unix)
> >>> where lock_sock() has already been done. It is more for
> >>> reading-correctness though. This just came to my mind.
> >>> has_current_bpf_ctx() can be used to check this. sockopt_lock_sock() =
has
> >>> been using it to conditionally take lock_sock() or not.
> >>
> >> [ One clarification: bh_lock_sock() is a sock_map_update_elem() thing,
> >> which can only be called by a bpf prog. IOW, has_current_bpf_ctx() is
> >> always `true` in sock_map_update_elem(), right? ]
> >
> > For all the bpf prog types allowed by may_update_sockmap() to do
> > bpf_map_update_elem(sockmap), only BPF_TRACE_ITER should have
> > has_current_bpf_ctx() =3D=3D true. The tc prog (and others allowed in
> > may_update_sockmap()) will have has_current_bpf_ctx() =3D=3D false when
> > calling sock_map_update_elem().
>
> OK, so let's take test_sockmap_update.c:copy_sock_map(). It is a tc prog
> and it calls bpf_map_update_elem() -> sock_map_update_elem(), right? But
> running `test_progs -t "sockmap_basic/sockmap update"` shows (pr_warn() i=
n
> sock_map_update_elem()) that has_current_bpf_ctx() =3D=3D true. That's ex=
pected
> and has_current_bpf_ctx() would be false if sock_map_update_elem() was ra=
n
> via a hook?
>
> > The tc case of bpf_map_update_elem(unix_sk) is unfortunate and requires
> > going back to the drawing board. I think checking unix_peer(sk) for NUL=
L
> > without acquiring unix_state_lock() is needed for the
> > sock_map_update_elem() path, since changing unix_state_lock() for this
> > unknown use case seems overkill.
> >
> > Whether sock_map_update_elem_"sys"() needs unix_state_lock() is up for
> > debate.
>
> All right, I'll re-spin the series reverting back to v1.

Sounds good.


>
> > For bpf_iter_unix_seq_show(), one thought is to add unix_state_lock()
> > there before running the bpf iter prog. iiuc, it is what Kuniyuki has i=
n
> > mind also to allow bpf iter prog having a stable view of unix_sock. Thi=
s
> > could be a followup.
> > [fwiw, it was why I first thought of has_current_bpf_ctx() to avoid
> > sock_map_update_elem() taking unix_state_lock() again if
> > bpf_iter_unix_seq_show() acquires unix_state_lock() earlier. I later
> > concluded (but proved to be incorrect) that tc cannot call
> > bpf_map_update_elem(unix_sk).]
> >
> >>
> >> Let me know if I'm correctly rephrasing your idea: assume all bpf-cont=
ext
> >> callers hold the socket locked or keep it "stable" (meaning: "sk won't
> >> surprise sockmap update by some breaking state change coming from anot=
her
> >> thread"). As you said, most bpf iters already take the sock_lock(), an=
d I
> >
> > Right, all bpf iter (udp, tcp, unix) has acquired the lock_sock() befor=
e
> > running the bpf iter prog. afaik, the only exception is netlink bpf ite=
r
> > but it cannot be added to sock_map afaik.
>
> And sock_{map,hash}_seq_show() (being a part of bpf iter machinery) needs
> to take lock_sock() just as well? Would that require a special-casing
> (unix_state_lock()) for af_unix?

Right, lock_sock() + unix_state_lock() + SOCK_DEAD check
should be best.


>
> >> have a patch that fixes sock_{map,hash}_seq_show(). Then we could try
> >> dropping that bh_lock_sock().
> >>
> >>> [ I would still keep patch 3 though. ]
> >>
> >> Right.
> >>
> >>> [1]: https://lore.kernel.org/bpf/20200821102948.21918-1-lmb@cloudflar=
e.com/
> >>>
> >>>>
> >>>> In a parallel thread I've asked Kuniyuki if it might be better to
> >>>> completely drop patch 2/5, which would change how we interact with
> >>>> sock_map_close(). Lets see how it goes.
> >>>>
> >>>
> >>> If patch 2 is dropped, lock_sock() is always needed for unix_sk?
> >>
> >> For sock_map_update_elem_sys() I wanted to lock_sock()+unix_state_lock=
()
> >> following Kuniyuki's suggestion to keep locking pattern/order (that re=
peats
> >> when unix bpf iter prog invokes bpf_map_update_elem() ->
> >> sock_map_update_elem()). For sock_map_update_elem() not, we can't slee=
p there.
> >
>
