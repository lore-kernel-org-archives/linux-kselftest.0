Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B9B2DECB2
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 23:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772148345; cv=pass; b=uRQTyHnTOWsv89L0mFtZ0z+M3WUocSKJ3KVKEmwoDmsT42Zq42NAEJgkoxDuLUGB1DZvgfoG4gYzdEPuV/RSuYaeiO60q8x7ljN19UTqglRGPLuV+9n5AM4T4+l8nseBVNCxHm/DTnRn7vIS+AJY3BaDCenEt3R2dYGKd8UkLag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772148345; c=relaxed/simple;
	bh=fKEN7m274g2FOvgWDmD5sdNxcW6bHpUV80grnqbWDQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ee9P0HtWkDaU0GswCBmQIC0njVKqapW+KpnJF/Zq150Saw+VchjLfsJzlKIPXkBj/wthN3StP0zxqZCTVXz4t0P688ft6d9S96W5p7AB0QrQlnKv2lX3oF/YFXydnX4sfKlmXwK6NveCAqg0tqFqWMbJqVck3N6+Dn15lSYtAx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eGEm9YrP; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eGEm9YrP"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79881805788so8095487b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 15:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772148342; cv=none;
        d=google.com; s=arc-20240605;
        b=OCRhFnYmkZ9ysnvsk9OFwXQmzPxCf9gebANfyb/HBJXoPoOZ5lxdlS9ZlwOByQuFva
         BxMEsZcw8XFy9C4H3s+lAzyeJcuFIpEY7isz0p6QXCvgg1eHyeo6qyhB6kARrOhpvfsd
         yiek5TkFvs4RyB0Q+G738DcYyfyK9QRTlTTNd3Wy4+v/Wj8MvJ5KxMku0+eKhfVlKgAb
         GLNEzOQZfpTGtEqj5bTrBujWCu0MiCYyz5GQQCdnySYN8RKn7ssw41Kf6O8FU3Pd62Gp
         ihqN+8Kr31r201ZAZAkXpVw1FXnwK6O7j/rs3AzzqeiflDr41GCE6VgCIBTpnbkmgTh9
         8yIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RA9ZhPtteEti8GBIEl7r2i+X0yhHEMSgTXlmvWuYNUM=;
        fh=7ipEnKjpRJ1alzwPN/0mVBhkKhHncvnwDcJJuUEPUos=;
        b=eqg3RRPe2z9bMf2ikJff8p8WCJNBY6JPuSuC8I/IDVSXTckrdjiu32Ds0cSTXtwnCO
         i0jnRKqvCWt512hrnGXmWGfo/q3PTZoNxsZ11TWcOfmm8x5lISTAZaA4xdeUtyIGcDej
         TAgOYgrAm1Pux2iKsm4On5o6vViaVgqwlvoOa1x7naB4mri6Rg7FTG0d4/WVQMwoFxMG
         +xeRYE049xWIDVkVUW4Qj9jUOY/qMJQqzrsCzddK6ThoISdhfeLqU6cElSmz5g7D8mM+
         +CtbJW2qmVeFOpdADp8/HcZsnoSy+IWvVFyaGnM/JqmsjowZRlBaEt6UjtB6oAstIPfc
         p/Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772148342; x=1772753142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA9ZhPtteEti8GBIEl7r2i+X0yhHEMSgTXlmvWuYNUM=;
        b=eGEm9YrPBH9UT4gKVrl8GfB7soAVA24EhWRqFQg1ow68GFbn2OlEBY5+KOHucUWCFj
         cQU4teBNyVmFMOT+8H7ks0D7d633c340hjFp4+VllwfWBNlAKvru1vW7iOFa9F5M6L4W
         /AG4jtWaWnCeT0cU/qiFfuRezO8z3MOaL/MnBKi8u4bsmDKqTqTZgrlfIdNWU2OBN0dF
         iuEB+1efiA8MHJDKxhxRJfpBFYxrjNVBP2oKjsxljnvETCehl4RbD381mVBZVnrdUpXw
         lM5+FQAkcSO1qylSco/t4OAEHGFxKNzd+OxNYkIeJ389Sg6Wo3sN6R3SPltJc9cRxazu
         CflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772148342; x=1772753142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RA9ZhPtteEti8GBIEl7r2i+X0yhHEMSgTXlmvWuYNUM=;
        b=uszwpcHTGUsN+TC/PAs01rdk7htjwJdoiMPFlXzerpFg6g2t9FL1MQaff955T8xdx6
         m29OjowCD5ZRN4Zu2li0dHq/6vijDy59ZnWt9lSK3HEJBCjHjZMMGUy8QFrh2VkDtImL
         gWc0xLc38wDgi2ftPOsSk2jiBdI7EWGZlNiAGAbar/JS8XqSGLIywHuWVZwimALV3b7B
         AiJBD4uRz64d36aCSl1XbOwD7JjEJxkGRVADhse2MAz4yjrQAiBwR0mDPD9eOQgFccdP
         vIthKcW4G2ZBXM/S9ps+ZIipawU56ji0h/MdZ/gut0mwgcx2m6H/qQWIsrY4LpI4BcdS
         VH2g==
X-Forwarded-Encrypted: i=1; AJvYcCW0rSjx14cwBdcOQyV8rjE86VlyaPBFNs0FoBPrGWXPl5bS22E3EyojyQxCIDGU3DKil+QLlcqDAwyitj67QVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVf/X2zX7VJEUqOl/HPpzNpHfFNA8cuh+mg4+iQp830GrRvcU
	Xk4/FlvU5iYf4Hj4Q4ZzhU9YNA2+MaiIYrkDvRWqy79z9LPmDos2fygMEt6zydfDrIAfJNZ2Was
	EtuWSYtPDq9dj58r0Zezez8fEQasMQ31KvVujVSIY
X-Gm-Gg: ATEYQzwAkvWzW3bereKm6DGqlnsU8roRBQTUQe+WEk8JWonkoaBwKPGk0PLSLA1n4EM
	VpNY9okaCsSd7rjiWAADX2GFqGWzrhxNd2OUoTTCS7mCoZ9mBod2Zidn99tebssoW7Slk7KbO70
	EfQOJV/n1mEbidPu9Hxd8E5AZHyNtpJHO3lMZVdk98z2oE9Q6VnnygQi/Z+WtwQeieGmklQsih8
	qP7K/ZIMxbpnhHGbzWcIyoZuN6ODgrzDJqki/9IiwsYrLv6rwPGEZR66a9V76Rbz+MIFDPwFAv2
	55y0gBN4FWbhEMhyDrXs3uo82Bm7EIsCa/ChzPbv
X-Received: by 2002:a05:690c:d83:b0:796:3977:9f28 with SMTP id
 00721157ae682-798855da97bmr10368887b3.51.1772148341487; Thu, 26 Feb 2026
 15:25:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226213454.85586-1-achender@kernel.org>
In-Reply-To: <20260226213454.85586-1-achender@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 27 Feb 2026 00:25:29 +0100
X-Gm-Features: AaiRm503t44yYtqzVG2hHOZcr0Eczfg-LoG2ToaT51Z1g1hmiCtsxqgH8nuFLs4
Message-ID: <CANn89iLGtL+Mka4dww-y+vZpqggMhsNzp5XJbo3RB6RG7=Tgbw@mail.gmail.com>
Subject: Re: [PATCH net-next] net/rds: Fix circular locking dependency in rds_tcp_tune
To: Allison Henderson <achender@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, pabeni@redhat.com, 
	rds-devel@oss.oracle.com, kuba@kernel.org, horms@kernel.org, 
	linux-rdma@vger.kernel.org, allison.henderson@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 10:34=E2=80=AFPM Allison Henderson <achender@kernel=
.org> wrote:
>
> syzbot reported a circular locking dependency in rds_tcp_tune() where
> sk_net_refcnt_upgrade() is called while holding the socket lock:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> ------------------------------------------------------
> kworker/u10:8/15040 is trying to acquire lock:
> ffffffff8e9aaf80 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc_cache_noprof+0x4=
b/0x6f0
>
> but task is already holding lock:
> ffff88805a3c1ce0 (k-sk_lock-AF_INET6){+.+.}-{0:0}, at: rds_tcp_tune+0xd7/=
0x930
>
> The issue occurs because sk_net_refcnt_upgrade() performs memory allocati=
on
> (via get_net_track() -> ref_tracker_alloc()) while the socket lock is hel=
d,
> creating a circular dependency with fs_reclaim.
>
> Fix this by moving sk_net_refcnt_upgrade() outside the socket lock critic=
al
> section. Since the fresh socket is not yet exposed to other threads, no
> locks are needed at this time.
>
> Reported-by: syzbot+2e2cf5331207053b8106@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D2e2cf5331207053b8106
> Fixes: 5c70eb5c593d ("net: better track kernel sockets lifetime")

Are you sure this is the right Fixes: tag ?

Before this patch we had a GFP_KERNEL allocation already ?

This might instead come from

commit 3a58f13a881ed351198ffab4cf9953cf19d2ab3a
    net: rds: acquire refcount on TCP sockets

> Signed-off-by: Allison Henderson <achender@kernel.org>
> ---
>  net/rds/tcp.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/net/rds/tcp.c b/net/rds/tcp.c
> index 04f310255692..da22b3dfdbf0 100644
> --- a/net/rds/tcp.c
> +++ b/net/rds/tcp.c
> @@ -490,18 +490,24 @@ bool rds_tcp_tune(struct socket *sock)
>         struct rds_tcp_net *rtn;
>
>         tcp_sock_set_nodelay(sock->sk);
> -       lock_sock(sk);
>         /* TCP timer functions might access net namespace even after
>          * a process which created this net namespace terminated.
>          */
>         if (!sk->sk_net_refcnt) {
> -               if (!maybe_get_net(net)) {
> -                       release_sock(sk);
> +               if (!maybe_get_net(net))
>                         return false;
> -               }
> +               /*
> +                * We call sk_net_refcnt_upgrade before the lock_sock sin=
ce it is
> +                * not yet shared, no lock is needed at this time.  Furth=
er,
> +                * because sk_net_refcnt_upgrade does a GFP_KERNEL alloca=
tion,
> +                * this can trigger an fs_reclaim in other systems which =
creates
> +                * a circular lock dependancy.  Avoid this by upgrading t=
he
> +                * refcnt before the locking the socket.
> +                */
>                 sk_net_refcnt_upgrade(sk);
>                 put_net(net);
>         }
> +       lock_sock(sk);
>         rtn =3D net_generic(net, rds_tcp_netid);
>         if (rtn->sndbuf_size > 0) {
>                 sk->sk_sndbuf =3D rtn->sndbuf_size;
> --
> 2.43.0
>
