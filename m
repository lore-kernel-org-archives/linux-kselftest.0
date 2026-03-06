Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D90369994
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 05:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772775861; cv=pass; b=DQ4fUmeenfWVbCN6d2S1nW8b9DNermZlCL21wl0S5GzJCPFxunQxXkFA566UwDUlQynpZmHzxcYT/V7A/NXw+E3OjOGqVIDbr46pgyAQmuz+QTXd1qTE1sz/GSogViSBdtbDJlQcJzxG6M1B2tZ3f4EP+Z0O1d1pt2kKu39PdvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772775861; c=relaxed/simple;
	bh=PSltAUW3Pbszw31Un6mmbj8jIMad2C1Y1xk6vP+XBsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8H//qNoFjB8lX8LCmoblkFddguy8nRJlnmUlNYFxYu/vcfxOq+DniFaVEnQRMh1w4R1fe6rnH9rQ9XvLYLfoffofcCay0ygP7Z8h49dOQoE8k//unhigPQpbAeEV1eC2TbqoVhYvrC/rBLBq5zSlNH4o3XNdrdtvF6cegcbsxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tJ64QPdN; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tJ64QPdN"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12776bebe9fso8578546c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 21:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772775859; cv=none;
        d=google.com; s=arc-20240605;
        b=J7tUClK49Q8NO5BkAk9wD1gUXJFtzOTnw1S03hj0H1n0L6G8+Cqgse9G/+LD4d95+0
         Oen3HfXfHCDqkrFyZlAstG2+zN/wmrHmMcxPBAQse6tJFF9VsbR9cD+GFUBWJKcQfEII
         KXsiT2rBjbZl2XHtSEW/3ZFD+4AxInoSII/ERz2qFdgQnJV4NfTSXxdVw6ndbgFTcju0
         jfgL1UGLr+08j0JH0NvthJ8eQcjdpEIiM1/QFr1x5mHEEtsuE0DZdyeRAV2Xtjd+9oFP
         O8WuZ/3ZhpAt0UreBeNXNPVHPaqsuXc43bPcG2ITOEew3XHu0QDPLp9qeQLRf0nsWw+P
         FOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tyBv9EeX3mFY/3tVDfQWJsxTKxsHkm5c9r8R+TELfok=;
        fh=CXQrGGRwzc1gx2MneUFikTUSaHCqDII4dN7pMShc5eU=;
        b=CUtnMTOf9B45JxbMcpmLAYtuJkKR6LaZs3Tlui4LJj+cjhNhGDGvXBXz4m1xNdH0Y6
         rqG9GO5dVSc9onPkEGPUrpX1jWrJbgOQVX4zImfUC6T2GP3BVzK9Jgrfn5HsYa2RbCrj
         c3V/t+EZa4AbXh4CvXXCZ4kZmXNSu+uYkXCe0knSAm/kk38SiD5LczJXzDktpoODXkXl
         lcFYodRFgia37Ggj4l7wU9EJ1Mwmp3VEvEz0MdsHz7PC6662vmty/xzdMMoloeDuMTSH
         Ll5KeqgKCMsapr5jwIBpXbr+WQ9Oxlec+cbiVLBlCKpCyhek+Z7iaZ6iWJChCsBil/vp
         0gzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772775859; x=1773380659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyBv9EeX3mFY/3tVDfQWJsxTKxsHkm5c9r8R+TELfok=;
        b=tJ64QPdNkYMrwF6kswOu29tm1VHNA77QBY/+JXz5SaKEWEitVwvvAVp5cvWhcawhIH
         O6NoTmEBJb+sck6Azjo33BI8JpNA8Ml7zmwUXrxb2PCS0quICCPmN2ZMgkjCSiGRg9j6
         9FJLF7iR59luWOqtdYK5cWG65V6P9/EpWFGEhBiJjQx5aBq3PvyXHNzrRcYbYxA1QsK8
         6wF1Y37Bi6dTpqpUZgrbSTj8O3ghTdhoIPvNMd5YIRWk79ildQK83VaNaNE6iU3vgxY9
         KtOM8FsaN08/FY+HkariIl6RVMHBH2MjBQFJdTmkVO2CXSEG4kcFPhS6CwKRMfQQJwL7
         gBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772775859; x=1773380659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tyBv9EeX3mFY/3tVDfQWJsxTKxsHkm5c9r8R+TELfok=;
        b=aSY0hPcsVocLwPA7QMpso3L4zdA4SfT+O68w5mTqV9C6YFWv5laNmx3CCE7kyLBVYQ
         ySJfATeTZZrQPPNG2+P9bR2tm7JXx4pqEXjC63syMcqojB19Yzdi0vVpuAHwq8PAyfDZ
         Ozw7SNa72Bc0670KtsdwAL5Ut74Yl2G2qqLgZehDTyZs27Uu+rFSJJAkD3JXURiX0833
         vm2a6UGr7ZjOPKY9ixFgQEsHiG68NAmsl1MhIwBnVC191ty7egLQdlars7JE1sC3tPk0
         yUjHumKn2JVK59SmP37eQFYGaY6vb5Hfr4rt5VAsHXrY+u7H6fUd4KiYfw729xYIzRKN
         bBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOp8EAVdWBB4GiYuDtQFOQ7O+IvXSi/XEb9MybbjQ5xXiB3YoxINGooOhBtwEqu1o4IdOE2+axAoVMMJcsv74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVL7354yjbZ/AwU+XlUtyLzkK421zc0CpAsbOsmceyBxMsfM0z
	I/3JyLqCH4nw7X2+CQTxAS+8FlXcdV67GtJ0m0uYKwx9Kj9GOVe3J84lFFqTK6z7pY58w3+Pvib
	EIs4ZhJF8tl+TYOF1DsALykdpCHMqHEIvw3CUmX3g
X-Gm-Gg: ATEYQzyKyZ7ZNkMxwKUzxBQ6+Ahec/cHbl0lA8r8ptS0LlKdBZ3b1x2GExWGLrBZUUM
	tfGK/7/DQMOR+da2WCvkJsAQGSsZzC91KZjsHhyfP7E4Uc+vKYTVWm+DPd/8PpGWiv+aaIRbZwg
	yFpet9CSyWwjfBXco/JuJaW/0PcMp/Ovf2Y/AOis1v02ixSl58sdi7ElcE3WHGRudUbyTF2XD+d
	CpwPaS5QH+JYpXLSn9fSZQ16nl4fQniu2i22wOI8Z0p6CZPY/IZG+eEzIM6VrHdh0zjkyl0X83N
	JL8Aax7j+hjn2NZo8+MtoeQrWu2X6UnG03o22AT8/IfeA3zTm61wSAVWtnGQ8/9Eb1HCkg+wM3O
	AbBIrJXc=
X-Received: by 2002:a05:7022:105:b0:123:2c98:f65d with SMTP id
 a92af1059eb24-128c2dc0787mr413515c88.13.1772775858405; Thu, 05 Mar 2026
 21:44:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-unix-proto-update-null-ptr-deref-v3-0-2f0c7410c523@rbox.co>
 <20260306-unix-proto-update-null-ptr-deref-v3-2-2f0c7410c523@rbox.co>
In-Reply-To: <20260306-unix-proto-update-null-ptr-deref-v3-2-2f0c7410c523@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 5 Mar 2026 21:44:07 -0800
X-Gm-Features: AaiRm51r32W8zss6RR5Iwx5AUfeklGwhcZVJvjzKbkwk8LxQ9Tbtfu8f2GRTyJQ
Message-ID: <CAAVpQUCdzpwbu=fOrwCnaCFuD3U5SL73PB2nroqgUB4QdJ69og@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/5] bpf, sockmap: Use sock_map_sk_{acquire,release}()
 where open-coded
To: Michal Luczaj <mhal@rbox.co>
Cc: John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Cong Wang <cong.wang@bytedance.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:32=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> Instead of repeating the same (un)locking pattern, reuse
> sock_map_sk_{acquire,release}(). This centralizes the code and makes it
> easier to adapt sockmap to af_unix-specific locking.
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
>  net/core/sock_map.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/net/core/sock_map.c b/net/core/sock_map.c
> index 02a68be3002a..7ba6a7f24ccd 100644
> --- a/net/core/sock_map.c
> +++ b/net/core/sock_map.c
> @@ -353,11 +353,9 @@ static void sock_map_free(struct bpf_map *map)
>                 sk =3D xchg(psk, NULL);
>                 if (sk) {
>                         sock_hold(sk);
> -                       lock_sock(sk);
> -                       rcu_read_lock();
> +                       sock_map_sk_acquire(sk);
>                         sock_map_unref(sk, psk);
> -                       rcu_read_unlock();
> -                       release_sock(sk);
> +                       sock_map_sk_release(sk);
>                         sock_put(sk);
>                 }
>         }
> @@ -1176,11 +1174,9 @@ static void sock_hash_free(struct bpf_map *map)
>                  */
>                 hlist_for_each_entry_safe(elem, node, &unlink_list, node)=
 {
>                         hlist_del(&elem->node);
> -                       lock_sock(elem->sk);
> -                       rcu_read_lock();
> +                       sock_map_sk_acquire(elem->sk);
>                         sock_map_unref(elem->sk, elem);
> -                       rcu_read_unlock();
> -                       release_sock(elem->sk);
> +                       sock_map_sk_release(elem->sk);
>                         sock_put(elem->sk);
>                         sock_hash_free_elem(htab, elem);
>                 }
> @@ -1676,8 +1672,7 @@ void sock_map_close(struct sock *sk, long timeout)
>         void (*saved_close)(struct sock *sk, long timeout);
>         struct sk_psock *psock;
>
> -       lock_sock(sk);
> -       rcu_read_lock();
> +       sock_map_sk_acquire(sk);
>         psock =3D sk_psock(sk);
>         if (likely(psock)) {
>                 saved_close =3D psock->saved_close;
> @@ -1685,16 +1680,14 @@ void sock_map_close(struct sock *sk, long timeout=
)
>                 psock =3D sk_psock_get(sk);
>                 if (unlikely(!psock))
>                         goto no_psock;
> -               rcu_read_unlock();
>                 sk_psock_stop(psock);
> -               release_sock(sk);
> +               sock_map_sk_release(sk);

I think sk_psock_stop() was intentionally put outside
of rcu_read_lock() to not extend the grace period
unnecessarily. e.g. while + __sk_msg_free().

Maybe add __sock_map_sk_release() without
rcu_read_unlock() ?



>                 cancel_delayed_work_sync(&psock->work);
>                 sk_psock_put(sk, psock);
>         } else {
>                 saved_close =3D READ_ONCE(sk->sk_prot)->close;
>  no_psock:
> -               rcu_read_unlock();
> -               release_sock(sk);
> +               sock_map_sk_release(sk);
>         }
>
>         /* Make sure we do not recurse. This is a bug.
>
> --
> 2.52.0
>
