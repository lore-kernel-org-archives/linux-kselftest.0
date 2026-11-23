Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446564;
	b=uGaMRdshDJ+E3ZDvHuPgQylWKgeWmS/7v5VglCdCFhh8b3g2aSAlRVrca09LM0mHql5o
	 NdbqdogRS02/S7YUqxFzpRC8RO0GT/4d5MwArWoM4rI3cwd/em4xqNFNM9n3EMCbpO4Tc
	 XdKdqRS4Xmui6SSdYWmfov/tEW6n2LJWvoVwWgc494zhzAvaFlKO2q8gK7dMcZb1Je4T9
	 VPDaHaB+rSsvye9YiDDG/k9ewm13sUx4Pkjwkmm1XHVwQcPvQMG5wge09PDjULNmPYgWD
	 s/OePb5Z2eVTKqswuQo0fcBjHN1nRkq6oUDw2sMQKz3rVXHkBcpg3pMQ9yLNUASCq/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
	b=OyyODCJB2TOsxYOJ0VEpChMC/BQqAjttlx8ApqE1K4tq8lF56w6uWX+tvryzacjyVUfA
	 3CO0hxBFSEZAoA5PRE8HsJtfEewY7R5bAS2VJs3JQgwhpy/8OUTrPc/L2iYrfZpWhLZwa
	 I5WfaDbzv7BXnEvxLIuCbGSdx5rGkhKugPH9yDzRPf7oUr5Wrvht2OmDTxhJfzDg0OYzT
	 A+f02Rnn8McRnHxf7OVrdqWPkmWZMFa+SCTjWKs+1tvoFyfrB/4Ruqw8D0YApCu5lBqOg
	 TY3laUx3cGjssTXv5SjpcuwWulGTKUjY/WOTxWw5pHqKMWlMoKBwcwz7KUlcC5DlTKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QYfvIHm5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D26606A321
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00D26606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QYfvIHm5
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so16834a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446562; cv=none;
        d=google.com; s=arc-20260327;
        b=i6QCnyFfpNZ0ltVzg7xitDpGNgqNrJlGHm+PI3u51mU2BmEcRTsEDbUlhU41bLoGgU
         7rWnJSgWXKm4x2XLCMSRw8p3zTNbifTwZ65Fa0v1o0RJbNNb8zS9PPLa6yNWTk1wRPKa
         vq+iuVR6mLgTdpVqUwhO9ZPh2LijEQthEnljWqsv6tSQuhJ3voTWXdtxh5x0It+qwMXt
         JlGhk9mx7ndNPyuaFS+/gshjleMhIhvH+JDrLtdgzZdq0AU9M9gCQprn0Xu/4Jwbtra7
         ad1Yzqnk/eMl5OWU6gdN6MF76GbQDa0x34gl7bD4pKjbydnYo1DZVobGMqvhW9dM2D3Y
         2maQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
        fh=7yXNAMwoTTnt1dw7m3Fn5SG8dt4BjVihIy9li/qeHU0=;
        b=ZMvXZulDc/fW0Xm9U2vxkWpLne3lpBzYhD/kzAJ+LA74QslcPAIXaO7LBbXj1YpcIq
         2i9fQ7kPlmIxpaCUC6ZikpAtnI+WO1CmjZtYpY3BAW9RrBBCgYfwm5Ft4+RvzOsHSaxv
         VEagXt4666pdPWVfrXnU6SJc6iCMHeaM9z8m/o0hpQa9XSvger46dlYOjqOKkMBmwPZz
         TKnHaMfHd/u44um3cP6KoTc2agbDsEHswtz8K2tRrD0Q+BSKdhOAl5OeDazYzQW0YMbA
         /zlaLDd3BQTuR8JVwxuvy2yZYK+WsquoRKK36x7ygunCFh5j2RFt4zvYqDOKy3PLGdZ2
         TldQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795446562; x=1796051362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
        b=QYfvIHm51hQXR/eUaGZRXmA4issLNXn/O6pcRRxwPOiArg+TEDks2DdPx0ca6z6l7a
         vtvW+kbq/iaPK9tUDHoAV+ViEJTh0hTyCM/BAVoSMfQ3EK2DHlsAy3CFJPlTlgagkG9r
         z2LUP5xMVst9YHSSN8RrL9qrwWWFrunPYSjfnfmk2ANUwj0jSH4c883kVGz876fODsT5
         ZBDomhcPQwZcFC9yPcPU3UuCWbtkmKM0G/P5Ag4EKwboUw/DiTtjZpeBafC70GVHL9p7
         GG3XuNg7AuaLsq6q0AXdR5PrzselMImJYBDAIpgG7ULEskl8Vrh+rmOpxuHmd4KFEcMb
         4oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446562; x=1796051362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
        b=Mpm2e+aH6QvR9y2DEIpNabllTJ9/YvWmijz+vnBnwh3qZbIoDUWSSO2cvYxjido+7v
         BnYSpN1hHI0YQfurblJ0wDXxuSJsNGedto/NGIiWJKnk0Vr+CIH//cr6FseKFB6s40fo
         Ab+iheQzBdoO4HCak7gvegsJyPLfW4KMktW8KhI/q+OlsfF9sCR4i3RvMICGmwzFg5cs
         COzeU2ULd8N+FVvjlTpeicm/4Zx2G0ypWoUMBATrRvQb7r96nhhp0XKUy2EHUXj5hWep
         vGFE+0gFQWsF5wcXC8aPnyfuGs7RWDixDJDKXDtwiVI70+u1KDUC8f8z7i0FmVgRT+vF
         mnjg==
X-Forwarded-Encrypted: i=1; AL+hErHPiLdFOyfxTUNeoResIB9iziYVmlWMX35nA85tNPoSB6lR2nvroyxIQQQS6k0raKNul0aXvmC0nDwLpFDH3k0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96Bjyf1rbQ4fYdCYEXCkaYYoRmUkqme/c+ptTBUSVV3I/RlbZG
	mpD6TGMIKTi2e5YwmMmQlGjHieaA/n7HtjiJGi9XOWCgLL5k92JrbBqFarki99Jna8ckCMWQtak
	uQbdeyg7nNVcL/O/x+l+QliNXlM+ADZGZLHkhPnOv2NPkxwrWnfFjKykx
X-Gm-Gg: AZFdTZfK6dzFARqf8o1391XU0+/IecBNyvccMMk38Y8TbPwvFctxl1469ku5KpQ7GfI
	HtT6bsDILDefPQQ8/LFApg5tOJx32c2HP8Wu9bRur6tPQIhtV3PXySC7ICnw/oUrSJx9kQIh27h
	YeGPIkWLj6kDFs4S4d111747517NGrO+fRCmSG7HFvwOdWJIeMh5zcrvE+wLZIboVC2bxDRl9So
	W2kAdbJELhNg5kFCzIhQyhHq/cJ0rneCbPPZEoFkW2taiarqYDh45NCVaCPoF7BV1/3PHvBfrsi
	lKts/eUkxlGKxK1t+Emc31MdSmmpoxX0rdYJUvw5Mikjs/tRYDphyXbDP+7ByLdEOeCSD+G61dM
	hU5C+QjXbjznKYtDsdhdRQ7aPqwoE5/TWlVo=
X-Received: by 2002:aa7:c0c8:0:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6ba65a847bbmr156680a12.2.1795446561840; Mon, 23 Nov 2026
 07:09:21 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120045918.1239746-6-almasrymina@google.com> <179540996620.3135.3612533688050456273@kernel.org>
In-Reply-To: <179540996620.3135.3612533688050456273@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 23 Nov 2026 07:09:10 -0800
X-Gm-Features: Aa3M54qGzgsg7LGdQaLFwL502JFh5W00x6CdU2_DLyJYa834Njv81crjgh4M-NU
Message-ID: <CAHS8izOptCEaijuhQxtgj-3WAjKQxchNn2Pe62r8ihgdF9b0=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/7] net: devmem: always populate bind_dev and
 detach both devices on unregister
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com, 
	bobbyeshleman@meta.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 8:59=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Undisclosed user-visible behaviour change for leased TX
>   bindings.
> - [Low] The commit message presents this patch as fixing 'issues' found
>   by AI review of the earlier devmem unregister series, 'confirmed by=E2=
=80=A6
>
> --
>
> net: devmem: always populate bind_dev and detach both devices on unregist=
er
>
> This patch always sets binding->bind_dev to the device that bind-rx or
> bind-tx was called on. Socket teardown, queue close and queue uninstall
> now use bind_dev, and net_devmem_dev_unregister() handles bind_dev and
> map_dev separately, calling synchronize_net() before unmapping when
> map_dev unregisters. net_devmem_get_binding() also now requires map_dev
> to be non-NULL.
>
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 6f85b90950f8b..80c3e149cd762 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
>
> [ ... ]
>
> > @@ -252,20 +255,33 @@ void net_devmem_dev_unregister(struct net_device =
*dev)
> >
> >       xa_lock(&net_devmem_dmabuf_bindings);
> >       xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> > -             if (binding->direction =3D=3D DMA_FROM_DEVICE) {
> > -                     if (READ_ONCE(binding->map_dev) !=3D dev ||
> > -                         xa_get_mark(&net_devmem_dmabuf_bindings, xa_i=
dx,
> > -                                     NET_DEVMEM_BINDING_LIVE))
> > -                             continue;
> > -             } else {
> > -                     if (READ_ONCE(binding->bind_dev) =3D=3D dev)
> > +             if (READ_ONCE(binding->bind_dev) =3D=3D dev) {
> > +                     __xa_clear_mark(&net_devmem_dmabuf_bindings, xa_i=
dx,
> > +                                     NET_DEVMEM_BINDING_LIVE);
> > +                     if (xa_empty(&binding->bound_rxqs) ||
> > +                         !netif_is_queue_leasee(dev))
> >                               WRITE_ONCE(binding->bind_dev, NULL);
> > -                     if (READ_ONCE(binding->map_dev) !=3D dev)
> > -                             continue;
> > -                     WRITE_ONCE(binding->bind_dev, NULL);
> > +             }
>
> [Severity: Medium]
> Does this change what happens to leased TX bindings when only the virtual
> device goes away?
>
> If bind-tx is called on a netkit device, netdev_find_netmem_tx_dev()
> picks the physical NIC as map_dev, and bind_dev is now the netkit device.
> When the netkit device is deleted and the physical NIC stays registered,
> this first walk matches bind_dev =3D=3D dev and clears
> NET_DEVMEM_BINDING_LIVE.
>
> After that, net_devmem_get_binding() fails here:
>
>         binding =3D xa_find(&net_devmem_dmabuf_bindings, &xa_idx, dmabuf_=
id,
>                           NET_DEVMEM_BINDING_LIVE);
>
> So every later devmem sendmsg with that dmabuf id returns -EINVAL, even
> when dst_dev =3D=3D map_dev.
>
> Before this patch, the code from ede1618064a9 ("net: devmem: detach TX
> bindings on NETDEV_UNREGISTER") only cleared the virtual device pointer i=
n
> this case and left the binding live. That commit gave its reason as "only
> clear binding->vdev so no new TX sends match the virtual device while
> allowing in-flight TX packets on binding->dev to finish DMA safely".
>
> TX bindings have an empty bound_rxqs, so bind_dev is cleared here anyway.
> net_devmem_get_binding() would then only match map_dev. Does correctness
> need the LIVE mark to be cleared in this case?
>
> If the change is intended, could the commit message say that it reverses
> the earlier design, and why? Right now it only says "first walk the
> bindings to clear NET_DEVMEM_BINDING_LIVE to stop new lookups".
>
> The same goes for the synchronize_net() added further down for the
> map_dev case. ede1618064a9 said a grace period was not needed there.
>
> This behaviour is still the same at the end of the series. The selftest
> added later in the series (devmem_lease_bind_tx_unregister_check with
> remove_virt_first) only checks the dmabuf attach count. It does not check
> whether sends through the physical device still work.
>

This seems like some kind of hallucination? AFAICT after this patch
we're making the binding not live anymore, so we don't match it
against new TX, but in validate_xmit we're checking against map_dev,
not bind_dev, so in-flight packets should be fine as long as the
map_dev is in tact.

Also, I'm not sure we care so much about what happens exactly to the
in-flight TX packets when the binding is being unregistered. The
application is probably ending tx anyway.

Also with so many life cycle bugs in the lease case, I'm worried
someone can reproduce a consistent way to crash some setups with these
issues.

--=20
Thanks,
Mina
