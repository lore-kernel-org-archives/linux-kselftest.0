Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B537266F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624462; cv=none; b=n6zLri0+S5Lf/M5wxeleTI6wFpPIKuSrgwzsjBJ5SXBgBpD6vXKEwafaJ11kCBrCmRnAcqY9dol5D2hB5jf6aDzrRWF1hZ8WF7JmKkLM31xw5ZrC4QoiJmhq/yUGRV33GIMWAToIdFxLYkvbNtgH2emWDO9EFbL2weV33dEObIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624462; c=relaxed/simple;
	bh=WRgNurh9d4raALmFbgQ6JVwasMYB0ng7g4KjD2nF+EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGtSksdiH/gqwXDUCEx6JABEY7nkkndGHqncGnrqJfXBuYLXgYq5fBWYrWB2vrlqungJd7zEozc+tuoe0FKh3UJrr8SSv9mVRCYnTD1zDegnlv+4q5fNy8alYuHRGGYDL7QCl6grCoPOHfCIs48uLh0keKA22GnoSmv6UvS+KIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c224TlaZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c224TlaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E117EC2BCB2
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624461;
	bh=WRgNurh9d4raALmFbgQ6JVwasMYB0ng7g4KjD2nF+EE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c224TlaZ/5hx6t9Z1L25KdqOD42VOLYle4qgPIeIkuA5YT9iZj2CTe/R4rtWh4d87
	 2jU1NM4MgpdjUsVW3fgM7dc4yg464tB6aTlfnWu6BDGUNLAd3ZjpU+uS+CqGGxmQg7
	 AnzBB/DU98/HtIo7R3TO9t8gSHdZ5dOp/qpfqXR1ttHZSnsuteqzOalXgkB2M3nnD9
	 W+9UirIS+olApIlKiPwY/Nu9nnFv1hPN1W4SlIeLjCuV71nBUNlwMNfbZ+z2rygHql
	 2/vB6g/ZNyNQNvnBJ8SG2YM51VbRYSv0+eRMPDLUX5mW3qEQiApBSt2ric3Eore3ra
	 TTFgWt87HxVqQ==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb420f7500so643116285a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 03:41:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnLKY3xR0LyJhGfSH1Vtm46r72mqZkF6Y9QWayh1tH9wAaAqES1rAbsAIDJc972nAuT8T93sJKbIkmcvjvT1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPH+RFj6LYTvxwIeRzXMg14VEZn72J4FX9sk6MumrpXBH2nJL
	Vx0c2wRrPJ1YUVSS1+R0GFWQRbJLg4NIio8i/YrjP+8WyXndv83Z1xKubdYScI2DE9p0WzAtzeP
	UGkKQiKvR2PYxuTC6wUFDs3DhvEPIPCs=
X-Received: by 2002:a05:620a:2989:b0:8cb:4289:6c3a with SMTP id
 af79cd13be357-8cd5afc36b7mr183453885a.74.1772624460901; Wed, 04 Mar 2026
 03:41:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181535.2671734-1-bjorn@kernel.org> <20260303181535.2671734-4-bjorn@kernel.org>
 <20260303160702.7d28437f@kernel.org>
In-Reply-To: <20260303160702.7d28437f@kernel.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 4 Mar 2026 12:40:50 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNjApuhyangTTvY7w4xLheCw7QWgdwVqSyO3BKKYBb8x9g@mail.gmail.com>
X-Gm-Features: AaiRm53fCn8AAvf1xySGmOPvEJhbNjix-wbM-5Wtt1iHWHTXVWGQPbM3BJLoGFI
Message-ID: <CAJ+HfNjApuhyangTTvY7w4xLheCw7QWgdwVqSyO3BKKYBb8x9g@mail.gmail.com>
Subject: Re: [PATCH net-next 3/5] netdevsim: Add RSS context support with
 dynamic table sizing
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Mar 2026 at 01:07, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue,  3 Mar 2026 19:15:31 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> > Add RSS indirection table, hash key, and non-default RSS context
> > support to netdevsim. The create/modify/remove context callbacks are
> > no-ops; the core manages context state in its xarray.
> >
> > The table size is dynamic: roundup_pow_of_two(channels) * 16, capped
> > at NSIM_RSS_INDIR_MAX (128). This mimics drivers like bnxt where the
> > table size changes with the queue count.
> >
> > nsim_set_channels() uses the core resize helpers to fold/unfold tables
> > on channel count changes, exercising the full resize path.
>
> Let's not bother with netdevsim support?
> Let the HW tests cover this?
> netdevsim was usual when we didn't have HW tests.

Fair enough!
