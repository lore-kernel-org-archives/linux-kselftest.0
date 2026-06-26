Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B033BBBA
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 20:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506716; cv=pass; b=cwbiO4fQD0N2avMOYe8iPKLxqM/DgZxREKqGLT8X8sZI1WaRHz58CZVxk3h6lS9dPNGe1kNbD3Yaxs7Bc5n8yA0g3gBkYszUTILK7JwfVag6gzueXnjVnnlv4/wtNtgl9Tr1ijEhHwYW4tpelBdfA0okhqkurEgH5kyDg0qD6/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506716; c=relaxed/simple;
	bh=HXwE5QE2AygpKQCNKUenfAe+L8jeFrlMx2EkQ7aQSiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xdngz29QRCfMS91oDJ5GhwAnt44kZGdl2ZBfOZcI9OKfgNThf8yBZTN0Dm00xNItY+JfQv1tqwXufD1srufg2f1jJGxQ/fYDLIMDESxtY39Rkw0X1wjYrlN7FCcW7Qv01dHgIXp44vDerUM4Hp9Sj/YVDayhxwQTL8zUXN/h04Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vgzm9yi6; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vgzm9yi6"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-139eea1aeb0so653854c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 13:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782506713; cv=none;
        d=google.com; s=arc-20260327;
        b=d52JLKJ/ym5q3wlI2BC248+/kMdwfwWxEJPVurU5LOKnZbk1Kgra4LVQEhIsff2VbD
         /kouNLITVHJJ5ko2sR6zvhbBIxUPl08PYO37mXkowqeUJUv+Tdl1RphNwGjYWvGJkF5r
         YAYbcEEMCygAjjTs3zYXHkhzYfYCZRIGyup71X6/3lpTtuSqwfaGyTVRpPiS+HrP/6oW
         l4SlzHdmMgzjbfBXSKrmt/FgFphRsB27aJluVyf+ZvbnLng8ielmUVjz6ABA+qlGx8HG
         Qg89DPodNHRAJSAztjb1cd9N/0c3b87t+un/NtKLukq3jgqsGBp0SgARqiUL9LJEpACl
         S9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I7hKSiMuJoFJUDE/f83Nn28oo6Runy3fp0E90qXAz6E=;
        fh=eqNhkzWF9xWX5TFCJcb6leoNHlfqLU4/N7jp4hgB3pQ=;
        b=KgOToGKxNwvedpQ+42VcuW5DX2shl0cPXljQGyb193agKenDEGvHdfovMLCNvjP3uQ
         OQIVWd4eDZ/xst7Jth0a5PsyX/30tndctJzVMxNsilNwUOrsLHkkqmoKNXs5LK7Vyqf2
         ZoFsdUHi8YN2u5zyPcvvy93iaqKvb2TtUAADuLSBRsoY7UPf1IDZdvuCSUYMh+kY04Er
         lJi1EnYGWFGhGKVlOqubQQjfrcCTLRdoBpAmAMbQuWxVPUBCN7GmGfIfy6CjtfemcapR
         /QZ4Ag397MMOT86QeT16R+9+i+2YKFiMJ9YChnzL3NjU7gHKXzEGTDhx8rke5nxQ8aol
         Nouw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782506713; x=1783111513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7hKSiMuJoFJUDE/f83Nn28oo6Runy3fp0E90qXAz6E=;
        b=Vgzm9yi645IYFY3FSgjzxuRZfiZlZ5yvyVT2Ix8SBGeoHRTY+e59da8NCcApRaGIVA
         DIgyCP0LKGxMjINreahD9gO4WoPDXLkYAvqD+/3xu9MR0lZ9FPcO5WKF+icH7Zadux4Q
         LG1hlRMJn1Ee/NudgV61xHXQHbvqaRRXmUJ+i2361joqbPdBr2WLzt0M43QwUCzUwPcb
         hbKLpPpSYoiblfw2Dh4A3mXFmlnpM/o4nEye44Md/wYXfcZptfMJAr4UyYBVLYym6UVB
         dYyl7CAldB6B6xYsDQ0iV6fAgTSe8YBFfOWFrzLC1k0IEebnu89bXivB7ouZx04xiPbE
         +zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506713; x=1783111513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7hKSiMuJoFJUDE/f83Nn28oo6Runy3fp0E90qXAz6E=;
        b=UjlB6YQyM+PVpNUDj5/vh1m9SAYwxRjb6JxuPrvW4/2MnfaKJHO/MTSLtOZY2toxmU
         8gWqyRnStZjxOKaFmHoO4QyvIDFi9Bje4CsuIh236rzHUiAPYdYAf3NdPqM+F17P2hPj
         y1jSXZQ1vz8icnLDUTSUzHzKX+n27P7tGadhA7M4a6KQFWUbwe/Gnfmk1U4L5IY068Gi
         Aj88etTujVPgjDHqPBJxNvuu9iazVEzkCW9nYjjWUzTw5EG+5uAUmns/FRYDAXBVlgCW
         1qznxJPUcAw20EIYCzD1dSmEL4AqR0gilE9UOiYBAUATRnOWWUb3mdVjZipdF8ZRBDqI
         MPOw==
X-Forwarded-Encrypted: i=1; AFNElJ/z9cxykcK6OW0IIw65rsIQUzIvx6LOPbkaN4b1gwZmL07XsLVfW9zz43FW3iJ8SWbFjy5VHmMp9XS0FCHUxsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8VysRwUV3Ap6YiHORlVibWFBuPByLyyYdRNzY/OvjmxzSOALv
	fIoT1SGfUFJDKa0G7Ae3ciY3GPdp/tza4yoizDJSd8/R3mHfo8+Ln6iRv/ve2yh2ADgF0hy8u3t
	LbV6MyuhCZ53czIpnI+lFySpgicAmxbi5psS5DBgj
X-Gm-Gg: AfdE7cmqgfydO0xBFgQkVZN2d/mrkZwHC6VtuJwVzpMYKuXEXFmcvw0kGyuK2g0jBKV
	A+fMz0ymZh0RRPXQyQBZsbzcFlG9HMiSRC31unuqY3VgEgwZqr1DRrScV8jvZjGYGONUoqNbpio
	4vyOz4dfMGJ05zq3g0zuQ4tmz+oLnV/YPO2teOEEFbOk6nBB8TyKwg7e+h7/tLB0Vl3qGrFnFM7
	RNEOw95uAVhzc3DHQKY5LUXtXuq02nUuV5Jn3ELXEIR+vs1YzAe52C1twhUpY1qEgIxFX6OkMnF
	ViUMtFUbE88nD5uoeUFwyQNrc4uJnma/KZ5A4sOeXE7jBBOBu7gmc0L3ttEjLHyLWJ88ZjcF4Ad
	4SuLx3Nr1zJCP3r6VzggMnGsRcnVBc5DZbf+Cczk=
X-Received: by 2002:a05:7022:41a0:b0:139:b977:9bc5 with SMTP id
 a92af1059eb24-139dbb2ea4cmr7763842c88.17.1782506712014; Fri, 26 Jun 2026
 13:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co> <20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
In-Reply-To: <20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 26 Jun 2026 13:45:00 -0700
X-Gm-Features: AVVi8Cf-y03bJ43WYYvw9v-GEe05G2Y8Afs3h_aEIlBR5CD6DchBEBYz4DVEdgo
Message-ID: <CAAVpQUB-hMuVpT0dcTcDDsSeDLXgBmNuMF4HTniHhJhVuxbFqA@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/4] bpf, sockmap: Reject unhashed UDP sockets on
 sockmap update
To: Michal Luczaj <mhal@rbox.co>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Cong Wang <cong.wang@bytedance.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:37=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> UDP sockets get SOCK_RCU_FREE set when (auto-)bound. This means
> sk_is_refcounted(unbound) =3D true, while sk_is_refcounted(bound) =3D fal=
se.
>
> Because sockmap accepts unbound UDP sockets, a BPF program can increment =
a
> socket's refcount via lookup. If the socket is subsequently bound, the
> transition from unbound to bound causes bpf_sk_release() to skip the
> decrement of the refcount, causing a memory leak.
>
> unreferenced object 0xffff88810bc2eb40 (size 1984):
>   comm "test_progs", pid 2451, jiffies 4295320596
>   hex dump (first 32 bytes):
>     7f 00 00 01 7f 00 00 01 d2 04 1b b7 04 d2 00 00  ................
>     02 00 01 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
>   backtrace (crc bdee079d):
>     kmem_cache_alloc_noprof+0x557/0x660
>     sk_prot_alloc+0x69/0x240
>     sk_alloc+0x30/0x460
>     inet_create+0x2ce/0xf80
>     __sock_create+0x25b/0x5c0
>     __sys_socket+0x119/0x1d0
>     __x64_sys_socket+0x72/0xd0
>     do_syscall_64+0xa1/0x5f0
>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Instead of special-casing for refcounted sockets, reject unhashed UDP
> sockets during sockmap updates, as there is no benefit to supporting thos=
e.
> This effectively reverts the commit under Fixes, with two exceptions:
>
> 1. sock_map_sk_state_allowed() maintains a fall-through `return true`.
> 2. In the spirit of commit b8b8315e39ff ("bpf, sockmap: Remove unhash
>    handler for BPF sockmap usage"), the proto::unhash BPF handler is not
>    reintroduced.
>
> Historical note: this issue is related to commit 67312adc96b5 ("bpf: reje=
ct
> unhashed sockets in bpf_sk_assign").
>
> Fixes: 0c48eefae712 ("sock_map: Lift socket state restriction for datagra=
m sockets")
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Looks good, thanks !

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
