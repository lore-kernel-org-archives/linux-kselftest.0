Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908722F2914
	for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786831123; cv=none; b=a1ucRcHKS1fvyeYkNBIwuEWxUmcRzX3vYJMEMt4KH1wEvnkbqp2TJ9WASOip1F9qcHEtu1fWlPZnXX22Ko6pCBNNzPaNQpfjzovV0gH2iiSRS4rdiT5VYEbcE5Dt2+OIHJuPIGBSl/GNVjnp9umG+2h8uddQ61WgVpPbRngbYoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786831123; c=relaxed/simple;
	bh=Rjz0DpjJn8J9g6GQmnyL3p1tXajFrJBEcKU1BTx1AKA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KEbsef5xnrSryVUV9RSrhuS6bIxrHpQYXXPRooCVTt4mmu9YgAoIlNY3L49g2tuG/LXOBzkIMN3Q97ixk08TtZcv/Yev+FOwHS7lPpu0N4UpW6qJwrptx1pVOXftiwlCGnSLpNYDTJ7Aj7XeF+Mkd9Mp3BaVvfuzK0yjZqZuYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSXT8L8B; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSXT8L8B"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3811f512167so3133693a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786831122; x=1787435922; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=31zdeqcy5sPeYzke8us34mex98HuBd1sdQEvsQlannI=;
        b=MSXT8L8BK4J45nYF9esnzhoMHYwh+4agiIVbH9lHgLrgdASje7l+bHPhH9MTyiw79i
         l1pPMkzaZECc7G44gWsKXF6CGOes143UB12tRbMyh6IsW8Xjw8M2L5xqMd1aorBQF7il
         e2+pFLD4kK3szzFXCyNo4vlyRAORNkVZDyMdK1mgJDbsqPakwp9EDHE+AbgI/NAU3ESV
         zZO/kBudiaIIPwvaHXGapcqgf87/dvZyadRBTldm26pbyL7cBuNZS2RBrdBfFL3OJ7Yf
         xz4dUnlfufS2Vx3pmPQJT6gCH7gScpIgnkGzvbPbEpAiGE+XvjhZvIlEN5r5I6hBseeB
         XCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786831122; x=1787435922;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=31zdeqcy5sPeYzke8us34mex98HuBd1sdQEvsQlannI=;
        b=ffaTUwY7oKj/yNddktAZF+oWUZKOLNx2Tl0Aua5PoJRDbUENI2NTPEYVPRJezWSaqY
         Z9io2Zgl8/u9LLbAk+/o10M1PjbDzhfycuQ0QRlpH+/dCi7Tr80gwuiKIG1N4Wrd7mqq
         nO7TIl0eaZY1A2kf4eppfEsXm2sM3s3qtuIhsXztckLoR6UGL2k4D5xoBNgkHM6leq+r
         WZf3bFcQFTNhan9TLvRsmgYFxjtFUGfPCR1D2t9e60TYaqcxIDR8ZQ8iKUgq/An6fEvL
         KgHm9eWarH7on8ZH2WkschS/4dtoJ04MmE5cEpqL2+cRhWNCILjPU2PSyue1ZkZmh9xr
         5uJQ==
X-Forwarded-Encrypted: i=1; AHgh+RreFxKgFb9Z7VSy9gHs5U5V+Vaaq5a3r2/OyVsCx/bz8QsI/7OvdTZU2bng9DuKiK+aV1whd0vwo8r8Wpe8jsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0JrhawPQUh2F2ukSQJrv9mS96zkw1IkQlCjrW4dtzsD2HCai
	eq36Li4RPQ/4rK/+jXd//minxA5y6Cx5cu2Iyyt5LQHgFB9Pgxs94IFf
X-Gm-Gg: AR+sD13Zc4nS5qqvowtk07du7kmAPEn6OrZ1DTs/iJ0L1pli/U3YsE3tXRPSOuvtNp+
	BkCfvh9i/287P61w6YPERYR8SzsgZSLGvavQeTl9ljJcog3DShJAhC2A+68RRYQqHWH0+hdULEk
	ZRNr1g7JW+TKAfWVUuDeuVHwW+BsKDHhfmavNF32sDmlMd8l7rf8sdc/TVfn/PpEY7sjUmOuHjU
	Jq0tvNsBxsiXP52btrfos5bf2iuK2w6phlD6hbVsccVhamsxmQYS/FqqeKgNDJ9dlF61fa3onJo
	b794Nnbwz9GFlKe17n5Pt7D2yqhA/m9AJLYXR/4VPgrIeHPM2KaN6alpqLBW2EjuklNycyTUzvC
	bA+QNxN4iUKv+JLCs0BJNmzZF26P0hrI2Y3pUxRzPSjfuqFCbF5Vmqa/k+Dfd0gdQN00zPC+x6U
	cdpIcIJ6XTDZo78ehvPxUeKicKSVrc6AZ7Kr/2HpzhjvhD/raL+r7PA9fFwEri1dwn9wO18WMa2
	/CmsniR0FrdbGkq2DuRCRNrYA6AdZfONh0WCi3AQvV/IiTYYuggOZBUTMszbQM2un4+Zvh9Sp/q
	bGA9Gw==
X-Received: by 2002:a17:90b:5606:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-3933b7fae6amr16351451a91.5.1786831121788;
        Sat, 15 Aug 2026 14:58:41 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9722fbsm7233622a91.3.2026.08.15.14.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:58:39 -0700 (PDT)
Date: Sun, 16 Aug 2026 06:58:36 +0900
Message-ID: <m2tsovoxkj.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: broonie@kernel.org
Cc: ljs@kernel.org,
	linux-mm@kvack.org,
	geert@linux-m68k.org,
	daniel@thingy.jp,
	shuah@kernel.org,
	kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	jackmanb@google.com,
	liuhangbin@gmail.com,
	rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 5/6] selftests: run tests on nommu architecture
In-Reply-To: <4355a510-2e00-41f7-9bb3-8f6b2d95503b@sirena.org.uk>
References: <20260813063401.1786548-1-thehajime@gmail.com>
	<20260813063401.1786548-6-thehajime@gmail.com>
	<an8MlE22U3586R42@lucifer>
	<4355a510-2e00-41f7-9bb3-8f6b2d95503b@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello Mark,

thank you for your time to review the patch !

On Fri, 14 Aug 2026 23:34:15 +0900,
Mark Brown wrote:
> 
> [1  <text/plain; us-ascii (quoted-printable)>]
> On Fri, Aug 14, 2026 at 01:50:50PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> > So at this point you're not really running much of the selftests at all,
> > and are only happening to run those that don't do the very basic stuff
> > nommu can't deal with.
> 
> > I think an audit of existing tests to figure out what works with nommu vs
> > what doesn't is really unreasonable again, given nobody tests or seemingly
> > uses these arches.
> 
> > So this patch might beget more nommu carve outs and exceptions and
> > therefore nommu workload and maintenance, which isn't really sustainable.
> 
> > I know I complain about lack of testing on nommu, but at the same time I
> > don't think running arbitrary tests that happen to work on it and who knows
> > if they are valid asserts anyway really fixes things.
> 
> > And given nobody really is doing testing, it's not really a great RoI
> > here...
> 
> Perhaps a good first step here is to start off with getting some public
> CI set up, then build up to getting things running cleanly.  That way
> there'll be visible ongoing coverage which will help motivate getting
> whatever changes integrated, and if the changes are done bit by bit
> there should be clearer explanations for why they make sense on nommu.

thanks,

I'm currently running tests on my personal CI (gh actions) but try to
find a public one to be more visible to others.

> You could perhaps use a skiplist to ignore tests that don't work yet so
> the CI starts off clean?

thanks, that would indeed make nommu tests more cleaner to integrate
as a first step.

-- Hajime

