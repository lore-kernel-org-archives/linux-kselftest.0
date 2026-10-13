Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF83F5BE6
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887170; cv=pass; b=qeMmKiSDjS+BAzMb+9VcNYHys0zBT9vpv54M1GJeA97bARSmsE3LB9D2i7NZGUUuHqzWwQZDVJe8Vt8Gp/64ScYVl+0gfjwHSPgkihZdQek0xvp1QXw+OFsIhyTuq1kmQJzh+aBXuAcJRjyJvOFxgER14JUoTA+qgjcbWAXGKac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887170; c=relaxed/simple;
	bh=30/nByOcJLdjUUYb6QfrK3u4hDpBRdXaw3vsv0P1mN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqn8wWcH+j9uIbFeTxHiS/WdZCFHw9oJYdrOIz5COrhb+7vL2d2jw2n2n2U9pfebh4qN3pM2zfCZO7i+wf8kTq3k/wU5Hn5kLa2Ki+qqygZJqDpDHwFNcxsVTrg62ZzqvGAKutZTdtkb2dnNISYfOfCyIFudbkc4o/d9ulKRGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlvUzVj3; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlvUzVj3"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso20000871fa.1
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887167; cv=none;
        d=google.com; s=arc-20260327;
        b=FNaQBZBnaaw4w9KYaXyvZsshA3x4Waay1tKbiabRKf4kibQBZvFDb17hexOdiHxWAo
         3ECxdL0M2g9Dhlw7sCxMZAHXEwbYh7voEtbHE48YA9mMplwn+vSt34UCiNnxBg/dCxQA
         IpJGv0wVOVJ39lUBi5bd2eXOLEIKIswFdmwZbVDfj+i/kqRtXr7RTW92QpjSmoLtikpm
         hd4FxKkCrCzOv4Om3gwiaq7bb+fgi4ue/wkzHvOyupbO0FFeOvDjZDvNsaHoRBsXICO6
         e6Y/yJ+uQryPZ7t5oQ6oNaSI0+jk1o3szeiEsbk/aQgP6NRWe8+jsD0H2g+IP2JB3CF6
         GyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2iGlLnN9AnwU82QnbvfehXlTLjFdwbOP6w5F5kIy7w=;
        fh=4LkgJQli0rGEbD8sKf0+qC3nNGmwHlN9pgGNWdWGaWI=;
        b=L88t71vsvu1f1euWj4mhxv1wHMZUnEEt89QcjhJSfNBV7oJRx7fXF8XnS3UAQrvrnm
         zEl+fhBonYzofn5/7VMoLBmu45SIxaH9j0KUmNnKXKsqGpXzaI1ZRFyxK45h5ZIis97m
         rlnuCUaNsgvy3LhTR6Ky5NPIafIt6B2BZcSPe1jky5LEF5ODJvFqK5Zfqr7KtMXEZv+Q
         kxlByvREcZT2T50yBkT5Hf2HBqJJQmzKdQn6qixLinA71M7mF4vuNomCBfE2v2w2kgiJ
         zCzTGayV7ldcxs/G+KmGwBkWEWTecH8FeCfBN/31oHkZiutkqNes0/3UNLnXKRl/zJdv
         vNgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887167; x=1792491967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2iGlLnN9AnwU82QnbvfehXlTLjFdwbOP6w5F5kIy7w=;
        b=FlvUzVj3Hmts5PuHrpcKAJF9XR5pb0xq02Y804/4zuNTa65wn9HSIbWFmeVewetFdx
         JTqgqgiWGCweUr/fZCAinXjH4ZB/I9mtVem5TjUg2ihxvLDxAjZStYu7v6rQdsd0rJT0
         nYfrQRQne8y/u+OzJjLRTHAyfsfb2WQxuKoDOKQD6oklP23jsEz4jHzS5ood7tUlmviB
         nkgCEWtvpTMcE3Nqxlh6nz3no3u+tungwiX2xfP4uUUzi8vGbnNmoMVoBMDuHanIXFYb
         fAM5i9azUb1PVo1DNwih2DjHNYdwwL34LhjDOyJmedlg3U1DyWll6zw7FupdCChojSe1
         M0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887167; x=1792491967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2iGlLnN9AnwU82QnbvfehXlTLjFdwbOP6w5F5kIy7w=;
        b=NHPhsQAim38DD4O//dgV9mNCC8E+XHEA7rp8SOUCbLxcZ2AJFA9fHrHZm2y7KvpNeF
         8/tGQ0KzOLo7yiFRnk97VnZtVT9xdZYC7BYbPrb/qf0481F+//CUqYROgmsmt6vompgp
         jBm8OMB7b+ZPYRZAedFtOPBLlhHBHsbO1fwFAHKMF+IC+O0lDKiuhMHYTtBiy9NI3wZN
         Hu2oHwazZwBo1q/RXFxkX+Os3t/wZQRq+l5ULRu6EFGI2Olc1MeGEmDjKi6EzR4ENXh0
         9ZApvLeMhBa5IMkU1AlRZw6AnXKgl17PCjRoYQJZSBc5B3zogU3VlwjG7MyqEOg/LfYP
         3TOA==
X-Forwarded-Encrypted: i=1; AKwUvBzobWUw0c3xkDyWXVFy4Lfx6YDSLDggbhA0GgE/8k1fSsrUGC37u/yRNifMGFZvpdbeqnqkKbU2J06fEdrq3EA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAcnz7XYXV9RAXH/ybT6x063cIimA/H0oXDJHlxB7R+OeimBTp
	fRUYNPacuU1cgApDhoD2pwf3bylL6INBiSeL3j/35fFi3kjUetcdT7ZEq0IEbuoxU6+IG/BWL/8
	qGJmF+1M2vUuDqnOiIy0z9MpTbrLOSws=
X-Gm-Gg: AYBFou2316vdgjIsR1xR5/2fTxpOX9ulIb1yQvbKRF9wb9aIeEeSYz0EEOHvWqM+nw+
	nZYK+oK1D9Ybmfpo8Nou3p92z5/F/VDuKl1TRUkOzntpZ4ij9uJs0M55HItGb/zpqgQlQh5OUZe
	yCMtccVpCKYdrFrJ1y6Oc202tHphNA4PdnbA55C6ov23tSn+m67WURvNm03L38J9Mh/38ae2WS1
	FefZtoXQsTWYD66aSXwi92N1esfM/7Cip6MbjcSIr4/XUhDG1Jqy/K2PFTpDECwAp82T6rIyPll
	8toi3YjLmcT2AiyLL0BQXlfTeQ+vVjU8rilyL0WRGGz9MtaW+hGT1Noo0fDUr4QFIoNQ4qRonqI
	qRjd5w7CoTYQuDszEGDhOZg==
X-Received: by 2002:a2e:bc23:0:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3a9c5384f54mr25409041fa.16.1791887167208; Tue, 13 Oct 2026
 03:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
In-Reply-To: <179185709988.434549.15422498299449004512@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 13 Oct 2026 19:25:56 +0900
X-Gm-Features: AclHuK9xbgdrkpalW9mtMclsWr4HeA1zLw1yC-dAP0vRwaQkMlm23OayOZqQ2Hw
Message-ID: <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Low] The commit message misdescribes the precedent it copies.

Looks like a nit, will adjust it if need new revision.

> - [Low] The patch adds an 8-byte 'struct net_device *mc_dev' to every
>   struct netdev_hw_addr_list (include/linux/netdevice.h:253), but only=E2=
=80=A6

It seems to me this issue by itself doesn't deserve a revision. Will
fix it if new revision is required.

> - [Low] __hw_addr_changed() (net/core/dev_addr_lists.c:22-26) reads the
>   device netns with plain dev_net(list->mc_dev).

This was raised on earlier versions. Every dev->mc writer already
reads dev_net() under only the address lock, so this adds no new race.
