Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A49800
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775088022; cv=none; b=LmnUbeIar80PxK1FK3geb/09qDSg4klsSGhoMzFcMunFFZQyvs4JBXw8A7z0QZMeYqLMB41qtENWgr8sTFfJLNLNloV1rBqdKrTNgPNL+zBuguMy/bdPPzJ+IjIa1FSsKip4Y2R+tEzMx5oyyAy0QSZZ3RlBFxSt6NtO6aWTH2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775088022; c=relaxed/simple;
	bh=h73udEWJgauBRuG1S9wkDO0gSb/ZY3nVPD/13Alq+SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEF/USuiJRXSijZMTzbNhcM5gA13+ezHBPIt1jN8iXqu1Uq993+nsJ9dmcznqoxddwUsEF80jkhC1+NmowtR9XuX++JQxOBg9NWtRl56Sj/GOm1J4fwZmpwpOWpGMAwwNPz935nEzqErdGyHQFY+LQLIY4RygWdQyU8yeD8lZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=CXbMBptB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="CXbMBptB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82c68339cf0so938116b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1775088020; x=1775692820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2FBTSJSTehrL8OM2HW/3pwKtQw2cCSkPwH3JEpsgMw=;
        b=CXbMBptBSKeYZBOt5chF3t0n2sTVgRqSx8ufjkL8RzYEeeqyG41mQb58xJVpvuetIj
         NhFNhVpV7xsfD3AI0HFZ+j91/oTouVHm8RW8zrlVHk4HH9qyzI7Htv2YMZgXmC7EHo0i
         r6K3sF7CPsyTHVy7xmDQDcWDIe8l8K/b+gsrgl6FntjX8WXey+5NzYV93ZBeHwcYxQxE
         4EQOLTz7UJNvVPrM0HMCavXlpTinmYwWs0ht+h8uriNHFocK5BVoBgxWzufGq5kyWvTa
         DWG4QlG5LwiEP7rFsy46xIND3vCPKK9D6Vwj646GCIN0kxtrHm9K3jrEai9+erpe25Ac
         lnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088020; x=1775692820;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2FBTSJSTehrL8OM2HW/3pwKtQw2cCSkPwH3JEpsgMw=;
        b=QCtw7Jgl37tEj99uh3bfyVxhSbciuVeey+q4WuIKrvv25sCfVaQdHnqd+YSqWePLhg
         X+mm2XPyFyHMk99YK6NtIUegPFJ2hvSUSKf5YsjWJOGqONDkFpWkfYoNjWwgr4gTX7KI
         tf9ZSvv7V97pGzQho/32QK9x/I57S4As+txCOiIu5IJ3LDeVvaMD/gNIT2KPSWngqyOw
         1joPPTJCEehO+P0/a3rd4UePg+lmopoZsZFKi5x4U6EnuNfgOJ7RPaFIP63WmUAwWE6O
         Xl5nTFDuFnRC+BbgaCpRPf/SU+5wpqiLIHH2xD5ATG2/s+5NEUamCqThHiiaQ8PG7U5u
         npIg==
X-Forwarded-Encrypted: i=1; AJvYcCXnosL040CslAd9ydcHIilCkILpF7P+fPSAskmR3kNReuTVJblLHtGgZYPfCN4rSdO+5Bhvkk3QHLjAsPnO/18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzguKgt4Sc+mdKbKoSOsFoZuuKMktGdEi2ZKpzT4x8lCXyVkiT
	dlDN8jSp3c6dTkAJo/R3CV+gqA8s5IxrMeRaLitD14Pm0Eo18fwMjvOR4v0AdXvuDrI=
X-Gm-Gg: ATEYQzx3MkKGo6tMbI9N8z1dIK8N+2b8ZshF0FeWo4cPKrdmyEkF8mYlTYYNRiVrZh+
	SQQ3SNw59hRCqJ+hXRDIu6SZ7Q9cBULAmN+1+bA1ImFB6PJN+lA9MD6KMQDj1/2Ln+PZBUsZIGr
	VUO3grj8IZyGNfQ/l18MW/PY92Aj4LG4euhQ+LNO+/N1sx1w+oImcDIw92uCREVfESpvu2uv6X0
	a7CIIOGAcQxRkXTsv7o7iQe5wmzFGWvLh6YQu/SpR3q2J1JGHR4cfwGmTPR6gfXpNfzo7SY6Z4b
	TNSNBQ7S9eGEXnzgNwc/P6ENxzv5vIJy81Cc1Uzuloy6qAh8jiBy22tubawmDkVvPt2UImVK0Rw
	qXDECAMiWpyeHJzXms+RybN6LF1bCZEtBDPKvE1nvUx8oYWkN0fg6iBuOdKgYMBJfSlWSwrVo/K
	YchVge
X-Received: by 2002:a05:6a00:c90:b0:82c:2104:ccb3 with SMTP id d2e1a72fcca58-82d0031f927mr301951b3a.17.1775088016738;
        Wed, 01 Apr 2026 17:00:16 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm1381526b3a.51.2026.04.01.17.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:00:16 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:00:15 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, petrm@nvidia.com, willemb@google.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: py: color the basics in the
 output
Message-ID: <ac2xjwO8Jv24itVc@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
	petrm@nvidia.com, willemb@google.com,
	linux-kselftest@vger.kernel.org
References: <20260401183309.378671-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401183309.378671-1-kuba@kernel.org>

On Wed, Apr 01, 2026 at 11:33:09AM -0700, Jakub Kicinski wrote:
> Sometimes it's hard to spot the ok / not ok lines in the output.
> This is especially true for the GRO tests which retries a lot
> so there's a wall of non-fatal output printed.
> 
> Try to color the crucial lines green / red / yellow when running
> in a terminal.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> This is a bit of RFC, I'm not super convinced this is worth
> carrying in the tree? Please Ack/Review I'll apply if we get
> 3 supporting tags.
> ---
> CC: shuah@kernel.org
> CC: petrm@nvidia.com
> CC: willemb@google.com
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/net/lib/py/ksft.py | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Colorized output is nice.

Acked-by: Joe Damato <joe@dama.to>
