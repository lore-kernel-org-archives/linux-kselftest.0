Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A3B2882D6
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 04:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773202634; cv=pass; b=d/z2H+PFSYDmFv/QD0Wc7lN3cfY3CB7MtxE1nIB8avTyRrIFCfwkGL1M3xHxMCgFdyPJtE1Le0Xu9Yucge1SuXtGGbpVR5RhfyzmdfpwnhLJBXqRmkEs9lQ80HVP+1iol0DUd2KPCFVh87AiezC260tGZsV4Qdp1pUnSSCux5k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773202634; c=relaxed/simple;
	bh=LYiHq7xvyxJ+Ss27zWLVJLl6BJmg3VSJZYbOUkB7Et8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ng77A5dlsCNYZgF6oX7qoK591i9g+Pr1PsnHFz6ztntRL51SIBCXiiU/GMiw0qQZglDH2Yy/QAe3R7Eoegioa3OPLR9yFmYjfMht+Mr6QcAOOBEnPHpIvHEGPZqr+b7VpRx+kA/G/7lpVWbOtUSG0lAevjXeik2PjjmQVpvw0B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=St1lINKd; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="St1lINKd"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12776bebe9fso807112c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 21:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773202633; cv=none;
        d=google.com; s=arc-20240605;
        b=F/Yy8XiJX5b4BoJUvRgaFURxWiOjIW6UBkz6OTxiq2yk/1uO09g2yLHzLLG1ykt7bU
         pea77ORdXy1TZsJsHM4RvTJsvJ2mYPA0gKD++Wk2zYdNWO4HULc1ZmefTUeDPCHQdg9y
         5qitHS2RU7k0Di7/N/52BFqex6qRQy+ZfzTlaGbMkA9q19U47kYe0ZcvtiLJROqZt5G2
         sYCwrCg8yOgWAMoG4qqFCbrN6ychkWOdrxb7ZIn3eayuvJD/t64G3moYmfimhKQ58+wg
         iR4/2CbCzcUC+Jvh0q8Dr/wZbgaz2VQ0kVW5jNyQhoFU0xWJbHISW9ZexQuHj48sirH2
         Hu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uENPJmAfC/lW/uop31YwmYzEuEawM2Qvzy11V2b8dlU=;
        fh=oYpUfFWwxULNDTBUu7Eug/RMlZNM805ikQLEaoTlRmo=;
        b=PoE6wBnEvEDf3FYGf67YS21HR6E4t0nGkz7cgrDKKacBWAg7ZHl2bFyvBCYF18CrwT
         sOgyMb1Yp1fn+X5oxUyD8r17LXwAkj1Ar3bds+kvPwfAYKYT8W/ucxpi9I+Nu9/c/AwB
         R/VGPyOb8stxTZ+vG+6d7+n5ghjj3Ugx3hihKRAQNX48oZNekJzMFf8DPSALrPhVphFd
         2de8PLv5WDpyDj554V0IYBBod7/vEm72/WGuSC1O6A7hAiT3MHBOiA6botNzccJjI5MN
         Dj/mHkZbXWi0iwCK+8cX2JL2xxQCCEyZ3/87SHEXY9yRT332f9i/+p/FSs9q+hS9pb81
         JKCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773202633; x=1773807433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uENPJmAfC/lW/uop31YwmYzEuEawM2Qvzy11V2b8dlU=;
        b=St1lINKdDSJZYtk2Y9L9OBdhziwtle/sccauwS+jUNpbp26T1ba/MHzgQrwkbFHXGK
         8IzBMMnWfMt54CSYMkjAslG/N6WKPa6s5n+kMoKCbE5sRkfgBolZ9ynBJOWALvbtcv2v
         nRd6ZHhoWTttgheJZgPnHqoDz7oMcfwBSQwxIHY2gaoI8D5ExYDewkusGzhcSSsOrgOR
         P5IazO9eOmAPy/TW5yV/EPhz44kVuHEDBAlSFpIk+Tpa4Ixmu2uUb+jYaJIt/p9XBQ0w
         NwgenN3ScQ0OhekW49XDCbV2SVQigzvF2h8a/zS6usEUw41UrxZ/+Lm1apm/+i6PMHb/
         59lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773202633; x=1773807433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uENPJmAfC/lW/uop31YwmYzEuEawM2Qvzy11V2b8dlU=;
        b=EkDpGB/nQnkuTrMy20MhDAmneG5FsajHQyM4OLpbi3K/j04EIJUCp7ICQVgYlbT3kO
         K25JLcmvGeEvPq+iLISXcEzhW0vNUB/gVDveCMiy/v5e8MwZVDVTMOprkWmtjJR8y1+d
         RQDRjkeBw53tQ6dUya0nKDdSRSpc6LSMSjUFySvgwssrJXDxwW1piBFdJ1E04k0dxt0+
         C3sakzSugqOuge7Rovz/A+dwl9VqdhMt1monG+NZhGWKBRiAQav8FAmpogtzgiR19WLh
         U6vLyTxYpJ23B/DhXgGiKUCHcq6R6p7TMqinr7JMKlSTAHN1aFXfCexrQ0GciR2W0yHl
         Otmg==
X-Forwarded-Encrypted: i=1; AJvYcCVPQbyDPtpOLjapDYPhWUCB1mFY9lN4PaqEdSa0s8UBlsH9UvFtuo2N5WHDnGuVd/FX0pWwxaCyG0VgtZiDKOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybkEInlpu3tnYs5UwV1o3kWTDG92FXZZBPI/WRqHW4L25AbuUx
	onPv9OBatQlZGOAdAbMR1r80NcKN5m5YTPGVMmNK2o9a4KkqK/FB0jLxNXvu4y0Y7hx8kaokmuH
	y1aq04ECSSmA51bri6KdPuF88MSVipPTaFnzXnNYP
X-Gm-Gg: ATEYQzyI62+JBHtOJciQ2AZx2QA24rSiDi5xVopsG9YU4psP+BeKjMZw6nFqVk9YyEm
	LPYtMI51PyhX+DnnzKZpBUHniDQY5tq3x7wtKr6xckEaA5zSsOqUIkzgIVZ7mMv7XhTEZX9M5RP
	qRGVHuvpfA26lXften1Aauz11vlolNwDUcOJnco0efDU4eyYn4n8ianWcBncVyrISZFdlRs/M15
	u/DrhLOp/5455uwyif+2dV5x3KxkS9J/UC8Ct73IVN8fGC2OxjTUqOfnV2qcrNcHenB60UzhPOx
	7P0iaHyKS3dn3pgvdDjcGyZUzSQiyuPyhL2NhUl5dWQuUyQbKV+/yH21TUGSFKF6sw7nb9Y=
X-Received: by 2002:a05:7022:6098:b0:124:9acd:328d with SMTP id
 a92af1059eb24-128e780fa81mr554744c88.22.1773202631872; Tue, 10 Mar 2026
 21:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-unix-proto-update-null-ptr-deref-v3-0-2f0c7410c523@rbox.co>
 <20260306-unix-proto-update-null-ptr-deref-v3-2-2f0c7410c523@rbox.co>
 <CAAVpQUCdzpwbu=fOrwCnaCFuD3U5SL73PB2nroqgUB4QdJ69og@mail.gmail.com> <3bf84a79-7335-483c-b629-2437e360387d@rbox.co>
In-Reply-To: <3bf84a79-7335-483c-b629-2437e360387d@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 10 Mar 2026 21:17:00 -0700
X-Gm-Features: AaiRm50MuWsI0wVYgHjWFEMgL9Nc1lx7e73JLHzLZPG4BRs6YGGTA8FHDUMRMq4
Message-ID: <CAAVpQUB8fvyKSQ8UjBs4=FHmz0iME4SO=3CviS_dCzLNTLkjHQ@mail.gmail.com>
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

On Fri, Mar 6, 2026 at 6:05=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> On 3/6/26 06:44, Kuniyuki Iwashima wrote:
> > On Thu, Mar 5, 2026 at 3:32=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wro=
te:
> >>
> >> Instead of repeating the same (un)locking pattern, reuse
> >> sock_map_sk_{acquire,release}(). This centralizes the code and makes i=
t
> >> easier to adapt sockmap to af_unix-specific locking.
> >>
> >> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> >> ---
> >>  net/core/sock_map.c | 21 +++++++--------------
> >>  1 file changed, 7 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/net/core/sock_map.c b/net/core/sock_map.c
> >> index 02a68be3002a..7ba6a7f24ccd 100644
> >> --- a/net/core/sock_map.c
> >> +++ b/net/core/sock_map.c
> >> @@ -353,11 +353,9 @@ static void sock_map_free(struct bpf_map *map)
> >>                 sk =3D xchg(psk, NULL);
> >>                 if (sk) {
> >>                         sock_hold(sk);
> >> -                       lock_sock(sk);
> >> -                       rcu_read_lock();
> >> +                       sock_map_sk_acquire(sk);
> >>                         sock_map_unref(sk, psk);
> >> -                       rcu_read_unlock();
> >> -                       release_sock(sk);
> >> +                       sock_map_sk_release(sk);
> >>                         sock_put(sk);
> >>                 }
> >>         }
> >> @@ -1176,11 +1174,9 @@ static void sock_hash_free(struct bpf_map *map)
> >>                  */
> >>                 hlist_for_each_entry_safe(elem, node, &unlink_list, no=
de) {
> >>                         hlist_del(&elem->node);
> >> -                       lock_sock(elem->sk);
> >> -                       rcu_read_lock();
> >> +                       sock_map_sk_acquire(elem->sk);
> >>                         sock_map_unref(elem->sk, elem);
> >> -                       rcu_read_unlock();
> >> -                       release_sock(elem->sk);
> >> +                       sock_map_sk_release(elem->sk);
> >>                         sock_put(elem->sk);
> >>                         sock_hash_free_elem(htab, elem);
> >>                 }
> >> @@ -1676,8 +1672,7 @@ void sock_map_close(struct sock *sk, long timeou=
t)
> >>         void (*saved_close)(struct sock *sk, long timeout);
> >>         struct sk_psock *psock;
> >>
> >> -       lock_sock(sk);
> >> -       rcu_read_lock();
> >> +       sock_map_sk_acquire(sk);
> >>         psock =3D sk_psock(sk);
> >>         if (likely(psock)) {
> >>                 saved_close =3D psock->saved_close;
> >> @@ -1685,16 +1680,14 @@ void sock_map_close(struct sock *sk, long time=
out)
> >>                 psock =3D sk_psock_get(sk);
> >>                 if (unlikely(!psock))
> >>                         goto no_psock;
> >> -               rcu_read_unlock();
> >>                 sk_psock_stop(psock);
> >> -               release_sock(sk);
> >> +               sock_map_sk_release(sk);
> >
> > I think sk_psock_stop() was intentionally put outside
> > of rcu_read_lock() to not extend the grace period
> > unnecessarily. e.g. while + __sk_msg_free().
> >
> > Maybe add __sock_map_sk_release() without
> > rcu_read_unlock() ?
>
> How about dropping this patch completely? The more I stare at it, I see n=
o
> reason why af_unix state lock would matter in any of these places.

I agree.  Actually, once it's held, it can be released right away.
The lock is only to ensure that peer is set after checking
TCP_ESTABLISHED, but it continues holding unix_state_lock()
unnecessarily long.

Honestly I prefer Martin's idea, using unix_peer_get() in
unix_stream_bpf_update_proto().
