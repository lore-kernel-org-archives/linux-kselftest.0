Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABEA340280
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780678609; cv=none; b=HQWL/dVJ3XiK9FUr0VpijFMO6EFl3hGUvQ5wd2ShJrJJLylbJHY/oveRcxrwCZGlRkKZikxT0savRoq5kQ5LVou3xyHtUI7HIZPq3/Pv/TmioYT6wwzozYIn45Igdhb9/jJ/08OhXaZa+d8aMSE+uSBSurFX9+QCxlMDL1pUuiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780678609; c=relaxed/simple;
	bh=d/cDT0ruaR9THqHE7wAti4oD73K1oJCeBXScG3umFvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aucD/oum0GCberjv69lndMYMcFCHLLzev95ui0g0wUdx7dEht89VATWKmgCHJ8HdvL06iX6mVwf9j8O4HMHbJlVRyVgKFnXXWpWzyyjYdCzTl60w0P10ClkYeK6PZwgZ1O+QQL6FhDVWnIJdTL8diDDo6zqdt54+ccqu937+Ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGLnEzMC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGLnEzMC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so18330055ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780678608; x=1781283408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07Z9+e3inJcySCaf9Ls4BTaFTWY0Pppf5c+tjALyKsk=;
        b=DGLnEzMC0aA6oOMptcEqzyZGTbXMRFHkBubeM86BkxJdQ3QjAn59LPR6sejHjDA+BE
         2bkksarvA2u5f2zgXovnmh7dKC7soSa0BzsVLnR4qMm68vxDdIhbFhOAH+ggECP40Do9
         H1jeeg1OLn9sxt+4CRpoPd+zmoUGGnH63VzW7pR8A5IzFbQyoV5hVvyb356x/jqiMJQz
         LLwKwTgSNyDqMkpgDVidpeCPhRMkJFmkkoqakgs9cVndCuUKKK1V+roF+kdC1ck3OXNf
         rv7v/HLtKRwqbBtyLS6GyGgdwSa8d5VbgDoZLTBCnsNWCSCPZYLMc8DcixxEq1IuNNG8
         2/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678608; x=1781283408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07Z9+e3inJcySCaf9Ls4BTaFTWY0Pppf5c+tjALyKsk=;
        b=D7Vmoc41Zt7p5G3ycIRRgd7LpMOYNRUJHdIyY0wK9ZGCyCV72qdv70kHV+KUlgfUtZ
         E1J2TRZOmnSWKUYoHVT0glm/r0NmD4DgTXcgKdXQAB4uvRnIh8JuwVZbRoABnZBSPM55
         /OUAwLna0JK/8cE+76o4EQq9+bVL4nlksyNdd6CXb69tLib+SzrUCxDYVkc19x/XQevd
         QwlE+o2zP3NyvJr0bqTb7n6/7jiN9hlX2eOMyOyvBuZ2rH1wsxPXMokm06XR9uSFfLGo
         rvoDHqptwusIcIqfliIUqmgkGIuIxsKRpdesJn2m3xEtmIF+Ifb3WeJd3s/nEeCdB0Mk
         fPXw==
X-Forwarded-Encrypted: i=1; AFNElJ+D1OmecOr62sYV+uSAFlVudQ0vKIKcIdg4W3FTzdq/6kXNvXPne/JE1rvS9rREP85TzLeLaGXp2unSMVzk80M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9PhR6D4YC5R3+fK3iW7urSi8GK7+Oylejt6DEVU6dMJN5GMo
	VhcjVqyqNk4bHy6GiFi3ZUgbd7sqoYA3fi9EGNxnrTYHTlxQsnM3Ie5T
X-Gm-Gg: Acq92OEY/sTzzM0A5URGvrNF5r62f0bCcYKdq/XW+NshRrwn4CQ1iipFopHmA1C511f
	DdE6/pov1o9ygnFTEtML6wECW3pcsac18OinFfo62cdrxHv7rTDZJDwxhQgSUPo0CF1FE5QM3/L
	GT0/GTfBVwXDr8cySkhNYOdWstw0SZudI1aCmvFJ/uwAzyL5J3yo//YchVmJMX4v02VSIK+VLCZ
	jIs7/JSZJXKquFrg9VUuhm7tqjyWyr93G4Tcx7HxFn3ZO8CfDWSfGCQHKVFUSeAFNsIMoBbS2Og
	s89Qz1YVrzU9BUp0/k186/y5IZ/l0RUD+eHC2XRnbB2khU+Ljj1Ah4hoqEktz/p1du6r9Kbfkie
	s8rLZZeiF0Yx4J2fZ6fpkvEQOGtAU/zX+krzyEqKausaLWPokPGdL8mW0Y145nqgLHKX4j4rmU3
	YI5LaGkZ3Z3NB9oJ4AXf/k+rAQ0hAc9grhHkYRfw1aHZiF89WNRGXSW0w=
X-Received: by 2002:a17:902:e790:b0:2bf:379b:53ed with SMTP id d9443c01a7336-2c1e821e5e8mr49794665ad.27.1780678608079;
        Fri, 05 Jun 2026 09:56:48 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6dc92sm89653455ad.13.2026.06.05.09.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 09:56:47 -0700 (PDT)
Date: Fri, 5 Jun 2026 09:56:45 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 3/4] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
Message-ID: <aiL/zQe7Ku7bKIJ6@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-3-f37a4ac6726c@meta.com>
 <aiLsegSEGviNluv1@devvm7509.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLsegSEGviNluv1@devvm7509.cco0.facebook.com>

On Fri, Jun 05, 2026 at 08:35:25AM -0700, Stanislav Fomichev wrote:
> On 06/03, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Add -b <bytes> to request a non-default niov size via
> > NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> > udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> > hugepage produces one naturally-aligned sg entry.
> > 
> > Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> > 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> > per-sg length/alignment check.
> > 
> > Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> > reachable in the CI kernels built for these tests.
> 
> I vaguely remember there was also some kernel cmdline argument to
> reserve these? Do we need to also do something to NIPA to reserve 2MB
> pages for this test? Or was it for 1GB pages?

Good call, my little runner script when prototyping this adds these
pages at runtime and I forgot to move it into the patch, we can have the
py runner do this setup.

Best,
Bobby
