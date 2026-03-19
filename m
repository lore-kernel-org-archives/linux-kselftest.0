Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DDA1E832A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773881484; cv=pass; b=MLhvrqPa87B79pER81f45l1vE0gShSnrFC6ywljP5owzmlzdRxY9izTblgkrzMW2CJmlZ+W3Pih00esSaJ5AdLqYpuQ/GCQYArCYnVYBC4pH4TwKkzROVMeBQT0yzV8mVDpzvZVc/gTJ2b8rMIu5Fo3GSUn+X7guMTnjJEQXjkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773881484; c=relaxed/simple;
	bh=FYquantrsslVPILiINBNEthKiXHN+4BdvURHe2B9LgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkGYLFbSuV5F6Z9LhUlAEw6GXFgQvCxPFZpVpMkSjUpHyXtpkeqZjePhJFtWZTTw20YALJPlFhPacH6Wgh/Zx3LVj2VzCwhlyOk1o5ULZD989NPVwPLaWX9/Ut6r/AIhHC4+2UoceiiqdBFSRZ1YMBfLhCcvbAti3bDe3ix3Nt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F4iiQdF2; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F4iiQdF2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b04fc8851cso3601845ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 17:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773881483; cv=none;
        d=google.com; s=arc-20240605;
        b=Dheu2hVDNlgPImNjnTASXYVH2lT2khk9uP/URejZ2+PFcYw7smllLuPgjXH6KTKpLa
         65VLWoctvYX8l0d45eHDa3AO6sjwzNkg+dwOZzHZu4Vt5FF/Yh1vGj4jNX7Pp857KyX+
         HXFi7OKbs6+Pyi/sJY2kozOnLiFjpVkGqaFp96WTlUC1dQELetVf35bdLL6LhyJvMnA4
         qvz0SkLwD7dGpP6ktXNba8F1tJ31aS4hu9PXhaN9ntmrFP2+oEwQvlAwrhQsq64x48xs
         dFhPvxNulyzXG9sKFqqZqikjHENrAbciJ/B/VvLoeGGltr2rG/o8+4soURS7WBKUVDBH
         InnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FYquantrsslVPILiINBNEthKiXHN+4BdvURHe2B9LgM=;
        fh=F8eKMuKiczz5VT7XUAJipgVYHulr4zc90z5mMFrpvh4=;
        b=IsYPFdkZthxUXDYW4fvpx892GDPwPc7IH5dMy9iw7HggEu2jGvW5ni6Td/C4qrpFB2
         jB987ybCrabv5P+kvsD/PRuAawv7jkarXy1+/Arnm+SAr6KDOYozEp8sBscsb8VxYRqe
         BF0ilXj1J8MjgZ7ps8pQwkUDIPZxjhzcN4rC9BbQokeG/pI2kxZ35Wl+fs2PChDJNSYX
         WyHafBsY6csnl5N7yac9xwZiTxkmYXEI8rVZ8kq4fSfkFPMHlZqveerzwWc8jPILs3nT
         heksimu1THC/k2zpbw2ZPi7/1ypiIny5WVJZnVa2u2PDjdatFSL/tDJdy0DHx0I8eiIj
         LtqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773881483; x=1774486283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYquantrsslVPILiINBNEthKiXHN+4BdvURHe2B9LgM=;
        b=F4iiQdF2vSso65jsARLFgMarEVzw3gXw4PYgvquMXi55c/PhWzTuPg5WKi8d0E0bsD
         B6WvMpMSvNTVDB1bHUCi18tGW6Pk9ZcJTADnZV9411/JEh/1fkblol1f77+VmI3b4OjO
         16HOkq8phfPx5cLumKE3CbSC8g1pCiKf3fFyyZiT+zjRPpdubcSh+d9vfRmY2yurzcAF
         R4Dq0xFyMQYE+yi3lQv5n4RuQd7NVtlU9f6JnoUS7LApsARV8Yryd9Uc4jmnV1IzUzTd
         eoOxM7K+b78EPRQlZmkmkjkolyvkvvjl7zhOn08dJryRglO+oGY3XW4AgXD5uqCdnjbR
         vcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773881483; x=1774486283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FYquantrsslVPILiINBNEthKiXHN+4BdvURHe2B9LgM=;
        b=ddjAHlWy68Jrum2FS62OFwxBm/MHcp9z5RrIOj2fhxhkSYQdQ+iacx14fzk4mB0RZX
         3+GfUZ/sIQWmBLI21FDrcpfCA3pWSpo53+yn8/w/RDR35QI0/FqRMhnu223y5DHTsmBk
         625Sc8IJJVRnyRr9zEqgD/6okqzfemN6SXBwbrE5fImvrYDrPQTS07s4mBoYVuxnQu4y
         QYLUMjvor+R4t541aFteecP3lsvG2Q5GOx8yH5ChlJPtYBSdgcP9xr3rth6CDayjKG6F
         ++C9W5g+RIT16uA5DsMBnwyQlOn0I8jEGegAU9aqA7deHNgz+BDQNDuUrD+wptWoYzBe
         mJjg==
X-Forwarded-Encrypted: i=1; AJvYcCU970waj/43r6CPaperdxfNGz8Yw1fo/cfjha9zNXjNC2+u4HgmBYJ0d2srSI+vUepUCKNkRJ5zKVja3FSFHPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32Iq44QxPpn/p7ZeAgOAsn+JHtQHm4CJCWt5/U3+InwwF4uxv
	ljF74yu/x45CLILNsHU/VWlg+l+2xDemWv7yl9PvkMypIXqOrcZ99JuUiQUF+pzGkciS121EgsS
	XkGBFqOYZrn1kWp2jxY1IA4MnPKb+L0/N4p3POkQd
X-Gm-Gg: ATEYQzzY8d1xvV31zYgV8sLTpQPZ1mt5Fgw8rF0lh1dsQh7DH2sCVFowe6LLmpbmELH
	pRpvei7niNsWRpq6nnVip8cTfSLEEJrL3jNtClEN547CHih8fAqeIZ4a6tvEt2vf/HbDU4FC1Wu
	271YO8i1xdIBiXnFhx2JCAvSud63KPCeQWxJZ4orXKDB3xn3hJuZ0Sdgbtx7TQXzEMVg/nzg+hV
	d8HUjlvMGBzaKDXJNm13i0wLuojQkiIs3Wbow4ieKYZmgWHvonu1uEgnbLbu09GFUb3aXZrdAOO
	mY9O/ksFZcsBgTzosjKixNZ5ZCPtfc5dAbdsDiFj8KZ60eQA
X-Received: by 2002:a17:903:11cf:b0:2ae:cda1:1d2b with SMTP id
 d9443c01a7336-2b06e3cd2d5mr52678835ad.29.1773881482504; Wed, 18 Mar 2026
 17:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318010325.2003395-1-treapking@google.com> <20260318172802.46c1fef1@kernel.org>
In-Reply-To: <20260318172802.46c1fef1@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Wed, 18 Mar 2026 17:51:11 -0700
X-Gm-Features: AaiRm50AqrKVto5QacwTd7u2kWs_qo700uM6KuW3VUeb1WpqW1K_kfLdV6UoweY
Message-ID: <CAHwYsirHq7PRWg-jeGz=+Yrn2Td=o3vBSXrjfPos57V0VQL6gA@mail.gmail.com>
Subject: Re: [PATCH net] selftests: drv-net: ping: Wait for carrier after
 toggling offloads
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Taehee Yoo <ap420073@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

Thanks for the review.

On Wed, Mar 18, 2026 at 5:28=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 17 Mar 2026 18:01:17 -0700 Pin-yen Lin wrote:
> > Toggling checksum offload (or HW-GRO via feature dependencies) can caus=
e
> > certain physical interfaces to undergo a reset or a temporary link-down
> > state. In the ping.py test, this leads to immediate test failures if th=
e
> > ping is attempted before the carrier is restored.
> >
> > This is observed when running the test with GVE driver when HW-GRO is
> > enabled. When checksum offload is toggled, HW-GRO is toggled as well
> > because of the feature dependency. This leads to an interface reset,
> > causing the subsequent ping to fail.
> >
> > Add a sleep period after changing these features to allow the link to
> > stabilize.
>
> Sounds like the test found a legitimate problem. The configuration
> should not return to user space until the operation has completed.
> User should not have to sleep 10sec each time they touch NIC
> configuration.

To clarify, the configuration operation itself completes before
returning to userspace. However, the short link-down during the
configuration triggers asynchronous systemd events. These userspace
operations affect the subsequent pings. Sorry for not making this
clear in the commit message.

Regarding the 10s delay: I agree it is long. In my environment, the
interface stabilizes in under 1s. I chose 10s only to maintain
consistency with existing delays in this test script. I'm happy to
reduce this to a smaller value (say, 3s) in v2.

Regards,
Pin-yen

>
> --
> pw-bot: reject
