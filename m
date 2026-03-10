Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD38E3E9290
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144046; cv=pass; b=SjAfbMeRcrVe7HX2GtOuXFtUHBE2MnQSwTPhdm3/N2RMm5QvXWwho6rtsXFgxqsKf2mdYeJC/s5lgaGDUbDZhmoT2jAnA5hec8tWQeI1Ut3hSXhiu1A/kqG2QopMnt1RQa/IO8JWTbFS4EpTTcikvO+7lK+QQkYQZPJgxjnWEn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144046; c=relaxed/simple;
	bh=tUzR/Nakid06crM4rvRZ4qf7nSgbgsUvkFMtzxj2kjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1SrqutDXIx61gHtY0OxFW4qslXPmBSp/7qevIN/MyqS28SEuPtiV9yKDemg2fqhzE8ZzndnUC7f51BRlyVgw/JHzNcMMceAob1lb0espaGm5kmydGb8yLoaJDidq1vVU0Pu1W5D4ZkyJIdVFD7pH08ZQh+PQix4YN108D5w/NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qwj+tuCL; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qwj+tuCL"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506362ac5f7so117246441cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 05:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773144044; cv=none;
        d=google.com; s=arc-20240605;
        b=J7ACle98mI8Gqv1qSH+21eBxYj3h+NobTpdD0LuFtN9hivzDN8WrnMxYoeSRj8XL/j
         jiN6UeloMoA14gLS1i6Sr88+B6Crsn6C97IbtwjJ4son26VwHqECQF77+diUY0h2Zf9/
         ugvCqb294ir/dDVDrbPNjdFameoJ49cqFkpKRj5VkD8g4IsorFOqNkC8PALKaJCeABiF
         jhDx//ykgezGTp/yUeAhsPm27MmgoiCFXKQ2p6VvJQy8bddeJh3IffWYg172PQK2YFck
         N1HMBElEbVdethUoCIzUzo0RRvcOUa7kk+mkdEpWQlI9bbexFlBf4DVW3R57F3vQtvPP
         wkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KiPLCC30cbrBmI3zXpnvU6YblX0b2+xRJJpwJf5O1Q=;
        fh=9mQmXajm3s72GE7+XSZzzSIryFJtB0nOcmOn0ZAjEpQ=;
        b=gse0+OyF/EkqtCvbTZtmgJ7WTbpay1biNtRBpfvH5SjYzecQl5cnJzebxJ8/m91Ele
         wuhQF2IeicknGX1rL7iDldIRHivOMIkTioG/qChZ6MANWaYalqQ/zLRw/5nC0bMd7dp/
         xbmddQk6obs9rithVtzRz+GkHmwEQOXK0bKPL7dfcmFT2d2ByotGhYEDZgWtK1v85uzU
         n9O3Br4iPUndLbUS8vHNut1s3WVYCAunRNyDzj9jw12GhmPzkjMXxiEU7CgzE334+6aO
         IKEs4Yyinsd6TiR4oGQ7Zd9ETtGyHgyBf/jmadIaqZYXFJCKaASBzaXzwEBqmn2Wvcc3
         8A0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773144044; x=1773748844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KiPLCC30cbrBmI3zXpnvU6YblX0b2+xRJJpwJf5O1Q=;
        b=Qwj+tuCLktJKd0NoRvrjoLMdfDN9uUn5J69tYo/ziS4U+8A9ezz8TvdBX2SWtr+1o0
         oVrumKUp0Zr06B6f07CBVqtxVIzVUHFpLnBrQ/iWqvCkNT/HPvlN1O8vOWrhEypQU8w4
         IWUQ4EpYm62MLVZun2Hqw7gFQSF06mk+wJoEu988bT3cb/S+/CkaYRoil786ZN+JHmfG
         nRdHS2JGd4v1x/ir5L/8ofnKCgwYyqtv769MzCapTxmDlXq5OoTHqgF06GbfTP5YpnZF
         tTtjQKbU9lAutMiUPerFYih1jbQIYxYNuOvmU25VyyIEIzuV6D1ua1CnW3jyDK41LJPm
         LpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773144044; x=1773748844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+KiPLCC30cbrBmI3zXpnvU6YblX0b2+xRJJpwJf5O1Q=;
        b=jC1ehHVvdNf6mRdmYTOM6iKVMuwn+rznV6uUpqmoJBM2EgJDzW5aZU+q4XOqnKkWKW
         dEzPBPiWCDZhX9UMdiSVHFKUGG1UPdBFKg0idMq0vAzfQXQyUt5NniTJDenQB6VUIQxT
         omZPIXSAXW0aPPZwFxzz7PxpOb0jJaXEpCaWPFRew53DBT6nIGKGaYLidNrCMs+hz++E
         ZvBvO4rFHo0OtMO1W4Ja6Fjttieup/EJcaPRwBCRE9bKkmYKHSpDxC/83ui382SABvWq
         0PqHDxrCIzO0eqsg06CNMaeOZ2HNECNjA2mGc2JFxZWOM7UeuJfsihlasCKAPuLUbWKp
         4xpg==
X-Forwarded-Encrypted: i=1; AJvYcCVzBTZwMAnDH50Fr2X0N/sa/QLBbZ5IFFrOYpr9NZR7fA55M64j6Hy8eSDQVV86If/tJKjEQJ4awmbBUg3jaTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAf9GRyUB3ff05OG7t9HFuaYd/JtxZvUa+RLVDyI8fWDHDHIfM
	uU42vYyIYoaEivIWZ5F2H4FQCtCPAmYUqUAKdvL1gPsahJUcmX8VALeq5fB5mn8xMKl4AntBYOj
	uu/P1M5gwS9I4dxQrgeC98uAUTYBUbzySBhDsma1v
X-Gm-Gg: ATEYQzzFZnTTtYTy6+fVqQou0esZ41AkCkSOMENZuktcpKYAaySZk0em7aYiwVfNGir
	cd2fIE0SAF+g/05deCNAT0EUeS3xh1s7loSozKQFdzKY7EYEiOPOeqiA6G6zpM5XPewodaOyd0S
	blaAL/LldFHYb85+0K9WklFr9xGDcvNe+xj3F2n4VXG4lmd4/JJMEab7YbLzKF4k5n1hWH3ULQC
	5yceSmzzb6njcMzpwJmbk4MQ3cw1QNPenprU8HhonGd7kczoT23AjuJ73QhfwGdMTJSh2FyfmDb
	MvOCeas=
X-Received: by 2002:a05:622a:1a9d:b0:509:22ac:99ca with SMTP id
 d75a77b69052e-50922aca02amr50931071cf.36.1773144042675; Tue, 10 Mar 2026
 05:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309030702.128520-1-jiayuan.chen@linux.dev>
 <20260309030702.128520-2-jiayuan.chen@linux.dev> <abAFRbJNinhN3O5v@penguin>
In-Reply-To: <abAFRbJNinhN3O5v@penguin>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 13:00:30 +0100
X-Gm-Features: AaiRm509jDZ3zVYhIbanKsEufYLYkGg_h_Pmpop0SOjPwGN3a_7GxccBpHV9Ooo
Message-ID: <CANn89i+5yOzdiBTWm4ekc0UvMxQp=mhXbz0rU5WnfxEu3NrAhg@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] bonding: fix null-ptr-deref in bond_rr_gen_slave_id()
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, jiayuan.chen@shopee.com, 
	syzbot+80e046b8da2820b6ba73@syzkaller.appspotmail.com, 
	Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jussi Maki <joamaki@gmail.com>, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 12:49=E2=80=AFPM Nikolay Aleksandrov
<razor@blackwall.org> wrote:
>
> On Mon, Mar 09, 2026 at 11:06:58AM +0800, Jiayuan Chen wrote:
> > From: Jiayuan Chen <jiayuan.chen@shopee.com>
> >
> > bond_rr_gen_slave_id() dereferences bond->rr_tx_counter without a NULL
> > check. rr_tx_counter is a per-CPU counter only allocated in bond_open()
> > when the bond mode is round-robin. If the bond device was never brought
> > up, rr_tx_counter remains NULL, causing a null-ptr-deref.
> >
> > The XDP redirect path can reach this code even when the bond is not up:
> > bpf_master_redirect_enabled_key is a global static key, so when any bon=
d
> > device has native XDP attached, the XDP_TX -> xdp_master_redirect()
> > interception is enabled for all bond slaves system-wide. This allows th=
e
> > path xdp_master_redirect() -> bond_xdp_get_xmit_slave() ->
> > bond_xdp_xmit_roundrobin_slave_get() -> bond_rr_gen_slave_id() to be
> > reached on a bond that was never opened.
> >
> > Fix this by adding a NULL check with unlikely() in bond_rr_gen_slave_id=
()
> > before dereferencing rr_tx_counter. When rr_tx_counter is NULL (bond wa=
s
> > never opened), fall back to get_random_u32() for slave selection. The
> > allocation in bond_open() is kept, with WRITE_ONCE() added to safely
> > publish the pointer to the XDP read side. A plain read suffices for the
> > !bond->rr_tx_counter guard in bond_open() itself, as bond_open() runs
> > under RTNL lock and is the only writer of rr_tx_counter.
> >
> > Fixes: 879af96ffd72 ("net, core: Add support for XDP redirection to sla=
ve device")
> > Reported-by: syzbot+80e046b8da2820b6ba73@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/698f84c6.a70a0220.2c38d7.00cc.GAE@g=
oogle.com/T/
> > Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> > ---
> >  drivers/net/bonding/bond_main.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
>
> This is Jay's patch + the unlikely change, looks good to me.
> Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

Orthogonal to this patch  :

 get_random_u32() typical cost is around 10 to 20 ns, I really wonder
if this makes sense
for the packets_per_slave =3D=3D 0 or 1 case to haves this kind of
randomness in the first place.

Perhaps we could use a

static DEFINE_PER_CPU(u32, rr_tx_counter)

And :
 slave_id =3D this_cpu_inc_return(rr_tx_counter);
