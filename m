Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19637266F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624376; cv=none; b=s3Kd+2M/HHQQm5JrRMj7V4NyeCxbnJ0WuIdU6M5sprO05/dJtQ1BVXLGrd85QfRAcfSeD3QhyLt4LJ7pFrdm6EiOkiOX1rFm09ztIn3iXOL4Ee6HjdVKXKBbaTlTw0p+/5NOs2lWEEMAB7fyIkRmcM6aeM2qG/Izs61dOtxSBZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624376; c=relaxed/simple;
	bh=8mzUOx8N0E5IjlxYXmxJy0tvIKZOA/GRy3d8H58Qio8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8/9BGShgAh/gCNePEDvU20xRXEIxp1cxIA0KIrbu3QBx19p/NyXp+1LIrS1GQUR+CaWF09OLfPCW3UrMKrrIycFCl6DHW/Unp60ypw56kchloKBcL2AX8Fq1KA52JPF16eC0C5JT/Usg5/g57p4GWHi17fgJ0IncFfc/o3BBqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LG6mfys0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LG6mfys0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12055C2BCB5
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624376;
	bh=8mzUOx8N0E5IjlxYXmxJy0tvIKZOA/GRy3d8H58Qio8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LG6mfys0bNtMIhK3NTPP3OwDH+mcnV6Xmxpie1ZdWXTrJlr4PdilSFzemi8ECaGgS
	 KkREYV5lgMABO5qS+xy5ClMvQQi0VkePub74I+ISNXvlxAAso2cb4OHLZMv6a1eJvj
	 eHuFBdo8KDGl+PyUlNiXYOwBVHsinO9xxUzu55AzaGEoNwlNvd3J4QjXlVdfIVjP2C
	 0wZoJTHggAYCVSwXcb47TZj6oQMyOzwLnEbO7lE+n2R1o3MB23FGhwrT4w4DPQAsR0
	 FWs19EhMceqnBbPaOBW1Nb67f+1FBp3x7Iwqtkqshs79ZbwJ872q1IDpuRhVMvlgK4
	 MtF95FLEdq4RQ==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-899efe93d4eso44113376d6.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 03:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMEXg6eifDdjV86rgjWkNd5l5AZR1oONKiKKgTFR9Q+bLKmfM+Xs+iI1iocCGzPbmA8wZPzctaMgp7d4l1xxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTy7POvqL9vzejO23LWYzstxxrxSJ86r20aa0uZHUOeddgqufx
	/PLSsVsUqTcaxnpXkPsaJWyftytMvL2dUZEKKSAHezPJvf1G+HKfC4XXrNgHV2MwY8rFfg74TUp
	eWEnx5SukN3msqi4vBtdKND4/+cWqmNs=
X-Received: by 2002:a05:6214:3005:b0:89a:1575:e1d2 with SMTP id
 6a1803df08f44-89a19987474mr20563006d6.3.1772624375189; Wed, 04 Mar 2026
 03:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181535.2671734-1-bjorn@kernel.org> <20260303181535.2671734-3-bjorn@kernel.org>
 <20260303160524.3e07dbfd@kernel.org>
In-Reply-To: <20260303160524.3e07dbfd@kernel.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 4 Mar 2026 12:39:24 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNhY1GQfuT6JEekGvD6vWj5HcY5M8=_tbb=Ksz+_tPLwCA@mail.gmail.com>
X-Gm-Features: AaiRm50JtJDVvmc98gls92iat3f6xgjcDaccuw9Iyfn1egM8-Rj_KUdtuIm_f7E
Message-ID: <CAJ+HfNhY1GQfuT6JEekGvD6vWj5HcY5M8=_tbb=Ksz+_tPLwCA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/5] bnxt_en: Resize RSS contexts on channel
 count change
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Mar 2026 at 01:05, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue,  3 Mar 2026 19:15:30 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> > -     if (bnxt_get_nr_rss_ctxs(bp, req_rx_rings) !=3D
> > -         bnxt_get_nr_rss_ctxs(bp, bp->rx_nr_rings) &&
> > -         netif_is_rxfh_configured(dev)) {
> > -             netdev_warn(dev, "RSS table size change required, RSS tab=
le entries must be default to proceed\n");
> > -             return -EINVAL;
> > +     if (bnxt_get_nr_rss_ctxs(bp, req_rx_rings) !=3D bnxt_get_nr_rss_c=
txs(bp, bp->rx_nr_rings)) {
> > +             u32 new_size =3D bnxt_get_nr_rss_ctxs(bp, req_rx_rings) *=
 BNXT_RSS_TABLE_ENTRIES_P5;
> > +             u32 old_size =3D bnxt_get_rxfh_indir_size(dev);
> > +
> > +             /* Validate context 0 can be resized before mutating anyt=
hing */
> > +             if (netif_is_rxfh_configured(dev) &&
> > +                 ethtool_rxfh_indir_can_resize(bp->rss_indir_tbl, old_=
size, new_size)) {
> > +                     netdev_warn(dev, "RSS table size change not suppo=
rted with current indirection table\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             rc =3D ethtool_rxfh_contexts_resize_all(dev, new_size);
> > +             if (rc)
> > +                     return rc;
> > +
> > +             /* All validated; apply context 0 resize */
> > +             if (netif_is_rxfh_configured(dev))
> > +                     ethtool_rxfh_indir_resize(bp->rss_indir_tbl, old_=
size, new_size);
> >       }
> >
> >       rc =3D bnxt_check_rings(bp, req_tx_rings, req_rx_rings, sh, tcs, =
tx_xdp);
>
> You resize the tables even if something else fails later on.
> I think either this if () should only contain the validation checks,
> and the actual resizing has to happen later.
> Or you need to "un-resize" (which should never fail so it's fine).

Good point!
