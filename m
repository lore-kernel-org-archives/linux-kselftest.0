Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6460735F160
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624344; cv=none; b=pkZO0VgeoHn3uoaFFxR7wijN9Xm4pHZlRFREUj7FGkaLAPAsQKcBYpUmV57hjuy1q+MJeX3ujO/qaGd4i448KQOTpJ3KdZXPB/SAN1sidWbF1eT2mvQcWu6bUFpNlzF12sIl2q9vHLjQHOZwK9SYded/1UL2hW39GWX5a/b6mac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624344; c=relaxed/simple;
	bh=/W1U5zeur/0ufH75N7lqmuD45LKpVE5zEZ+ljI9yLz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckfBtPMWdBFKw1uOARWOmuqU2SUu6FlPqQO+Q8Jb4qg3F/UEcuxgEyWMjIeIT8Ply3n27qiUjHSaEDb8E6Fi5pOS7eLxFMbFcNglyfQ+Ubzi9Cbk4IldU5wVD7iJenZH2Z6jvd6NBh7YWNsxsDDy9PNepcHml3dFIAU+oJ31bdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gq4jQPVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gq4jQPVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D69EC4AF0B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624344;
	bh=/W1U5zeur/0ufH75N7lqmuD45LKpVE5zEZ+ljI9yLz4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gq4jQPVv6t4rBJspux1nzEK7EDnMBm3zR3hP6mIzhYu6OQc+vWolRSChMCyj/lhtu
	 oaYlGn8VFUuF2bI2UpVcVUzBZZMVtAxCCXIZvhJic4wMVM2ev6WMdnTScQk4vr6ctT
	 /tSs6f6ESwnrK5UpT4QAKFX/RZ2VR/jelthgBk0PLyy/usc6VgscJ4AoBiixbYEKiL
	 RKRzGrd3Ix3yDMK6wZwA0FiKkvEsapLN7INtmLdkQ+vJH0GEdAG3HEREgytJJ1QVi8
	 bxnxtN89JaY2tWH9rI4WRDlyZL8HUKrR/SedEZXmfmR1NJpurUSO/07xNWutcADN4Z
	 VHuZtiJtJD9ag==
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-899ee87355dso46506836d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 03:39:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+ic0vm67Qt7v9SQYwHNpXkPp30kTkKOcFX81TBb3o57xx/UL1USXB8nNyQnE6WQnBj9PVjWNHhpTlt3Je9Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoeaGgk5iIQnMDJ1/kfdz5qeyKupABrxwSrqk2jj4n+jXuyBs
	PbH0WVBYsXbruuHq+QsguXjiGNL7ADrABM+DIIcUqaJwY64uwSaj0mWD7MfRbD+n0Eic895a0Wn
	RVUYY5UBEdI+0yp9j17+Tq/a6c77pBS8=
X-Received: by 2002:a05:6214:246b:b0:89a:1031:3835 with SMTP id
 6a1803df08f44-89a199a918amr19476096d6.22.1772624343240; Wed, 04 Mar 2026
 03:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181535.2671734-1-bjorn@kernel.org> <20260303181535.2671734-3-bjorn@kernel.org>
 <CACKFLimMxnahfcGgWqknzEcyDjFLPo0zqYL6OBTDZT8AHOGe=g@mail.gmail.com>
In-Reply-To: <CACKFLimMxnahfcGgWqknzEcyDjFLPo0zqYL6OBTDZT8AHOGe=g@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 4 Mar 2026 12:38:52 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNhpAZQvrZVTMzeTD9oiF2CkVs6-79WyJU5-FDPnu-2rMg@mail.gmail.com>
X-Gm-Features: AaiRm51-m9FY7IFNZ9U3rMrgtbDlFknctU7Yt-CfHEzq-qgIOHiH2tMIcXRCwXY
Message-ID: <CAJ+HfNhpAZQvrZVTMzeTD9oiF2CkVs6-79WyJU5-FDPnu-2rMg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/5] bnxt_en: Resize RSS contexts on channel
 count change
To: Michael Chan <michael.chan@broadcom.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Mar 2026 at 20:20, Michael Chan <michael.chan@broadcom.com> wrote=
:
>
> On Tue, Mar 3, 2026 at 10:15=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kern=
el.org> wrote:
> >
> > bnxt_set_channels() rejects channel changes that alter the RSS table
> > size when IFF_RXFH_CONFIGURED is set, because non-default context
> > sizes were locked at creation.
>
> Thanks for the patch.  I want to point out that when running newer FW,
> the RSS table size will not change when the channel count changes.  If
> FW supports it, we'll always use the largest RSS table size for better
> traffic balance.  A few more comments below.

Ok! Is there a changelog somewhere, what FW version that fixes this issue?

> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/driver=
s/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> > index 26fcd52c8a61..7608e5d95630 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
> > @@ -977,11 +977,24 @@ static int bnxt_set_channels(struct net_device *d=
ev,
> >                 tx_xdp =3D req_rx_rings;
> >         }
> >
> > -       if (bnxt_get_nr_rss_ctxs(bp, req_rx_rings) !=3D
> > -           bnxt_get_nr_rss_ctxs(bp, bp->rx_nr_rings) &&
> > -           netif_is_rxfh_configured(dev)) {
> > -               netdev_warn(dev, "RSS table size change required, RSS t=
able entries must be default to proceed\n");
> > -               return -EINVAL;
> > +       if (bnxt_get_nr_rss_ctxs(bp, req_rx_rings) !=3D bnxt_get_nr_rss=
_ctxs(bp, bp->rx_nr_rings)) {
> > +               u32 new_size =3D bnxt_get_nr_rss_ctxs(bp, req_rx_rings)=
 * BNXT_RSS_TABLE_ENTRIES_P5;
>
> If the table size changes, it must be a P5 chip (and running older
> FW).  Addng a comment for this will be useful.
>
> Also, this if statement should be moved below the bnxt_check_rings()
> call.  We don't want to change the RSS table unless it is confirmed
> that we have enough rings to satisfy the new channels count.

Will fix! Thanks for having a look!
