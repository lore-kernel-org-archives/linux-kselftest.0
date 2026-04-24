Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17C2311968
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018690; cv=pass; b=rd6/4ch9eU/TkWF7dM9GjVrzATlT0Gfn1pv177VyPMkQYG/iCGBkFOuCifquTLCiGtAaK1rV8Zix9tlujzy7384HswelhcgVXzevKN4BrAoW+gU0oNqj02YqHiMJB1Qx3RZN5WoNFBXUqOevVkNDEAP0dCKKU4FxbCBPNTleN7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018690; c=relaxed/simple;
	bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUGLevtudSITYFcPsj8ps+Ozco+F2k5nIoVVVfafXyy5cLj0pwLPe0iKlr7f8KtFTAPlZ1qI+Ib+lY1pMwlidD42kXHqgip+eXVQowITPDapeeNQ5M+1G0RFdTVB9+H8uyR7H6Chq2zuClIYdRt2Y0UpJhjcyNAorIpIZM51jFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdGQ+rOk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFE09HNo; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdGQ+rOk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFE09HNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777018687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
	b=KdGQ+rOksMmtNSNpYp7CmknQkKu04JQoI2Szr5eK0qd/KR5uV3VyK9iHh8JC3BKLQll1FE
	0Zn8cyypmqzphga1c/ivjXe9nqDjDKH1VGOHQeSOrWlhGcEDfipOcJZlLkgPWiaCL3iAFf
	m06ieyw1d36sZ/X4AoO7R/a6JtHp1ME=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-mZP_WFe2OAqnaRLdxd6hjA-1; Fri, 24 Apr 2026 04:18:06 -0400
X-MC-Unique: mZP_WFe2OAqnaRLdxd6hjA-1
X-Mimecast-MFC-AGG-ID: mZP_WFe2OAqnaRLdxd6hjA_1777018685
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-794d80fea59so142485927b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 01:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018685; cv=none;
        d=google.com; s=arc-20240605;
        b=KAmZwGCAwcUjo6YDn4newb3o3hyluKBAr0/5BKus5B8faEQQDtVvFF6AhoDoqqZOlh
         5F5EPfA4ihjNdv+44ccpODJ9/nagNbnATS659yC5DDPdyFdQaIgarXLfsUrJrVQQ5iPB
         b/WKH4VOwjY7yOseFqFLELvjmmcDuxQrytyW1iQeCTO7Z9MkRUz8Ga422XodP/OIcI7i
         0pDTAvE5CCfVqCSZ6XQyTf3HG63fsQIeEAB4glWB1eaBF2Zhp0/2VPBhBLVc3LODm4Kz
         NbIzH6L4YjuJApKAH+rOpgmFQ5xHEVQpc1SiHUztpMalPo0hji1nNk4Vky1VoB0u7hMB
         pmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        fh=PS07UyCN199ThnRRTugtF6LMx49n73ChgdczfUzreNo=;
        b=EkMWMBWrjWhQLL5zntmId0e/jzrswmNvbI2gGLW6fkR5hs8p6y+HpephYxDGH+I2HV
         B9Wfl+sxQOtkR4oUuzPozsuBPgLIipHhZoSBXcEZsxIfLYRIN0AKUm/2kSOWpwJBaRAz
         uScMppYmWzWAPtqwFp0VfyrBKWROoLZM5Ls4tWO5TL3fYIBuMO81oYLsyWaYs7zadFgw
         9GcvWH1CLbHKy0UXDnlTqsdBsW/ye8Dokj4OCwLs6IUClxNPrK+JR9mbi0NH1/bM2BA9
         aPqkmB186/WhichU3w/D6whzuezQhwbpLkayTqulOGQ7nyfLsEB8I+UpnzWA0vCbel/z
         TZQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777018685; x=1777623485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        b=UFE09HNo4IGvA8BUZdlOUfb5zSlXe1AzSU3lpqk9eEWyX/ESq1QT64fOcmWUKlybCd
         sk5NholQlm5fwRG/RzNqL0i8tdBdEIDic3/1WfOqSGgmMTEWxaSwoUc/TjJj5Gigrl86
         fib5FKeNBDtEAEAdonFGPNDj2pxqVdFzZ0LI1RKkE0terFZzTLOHiWXVYo4y93Qmlpzn
         LPt9zxwWmz41MWYORXZmQZivzcPzn2Ti7pAmcudKpl0UzOZhuF8DLgB+CBFciUl7jeFi
         5MxiLj4PoNvKquSqbkIAxeMLTtrNAXtDvxXjLrhXdkL9B4qPdWGsemdSOD1rsyYqEdgY
         FRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018685; x=1777623485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        b=eS68+uy1w6jqbepWIURIjMgx95Du3VxMc4J+aMi0NuccM+B+EkHhlKo3ucGiGZafHZ
         PzrPaUxr3VHozqjE4y+Aw5ileuVbhFOBFvbCpnG+/7LP3F3noT3KbMNQPVqervPQwBHb
         j1RuWCVcoM1ukQBpE9KROKtiTM8ZDX9vwUs0xjqGuMwF9wminc67nLyfitnSzzF82fTn
         1CjpDjiAeMIxe5+lnrEqWNYYcQnQ2ZVurwy8eI+z7x+DGY4Bk8aoHhzWiRteM8vqchXo
         opi1PO2TNvfuiNvBZ8fl+hSBafPsxgxujz0+ZhP7obX5TTEeq750j6uxBIDHjtfHj3f5
         qYug==
X-Forwarded-Encrypted: i=1; AFNElJ/wmLznh+i95JaRelzWvwrqwN/4LLUTycxWj7jdQ9ExdFJWTZD5CRcV0L56FbYmDvLDHK/hhjfovSy6/Y8p5VU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPf1shtIRhF6YJacAyG4C5SjtxrBRJWrCA7ZWrY1rBSipXodr
	cv0U810LLZFJ8cQApE2kVYuQbBl87pWjEkwhloFLZS4ewRHuKIuRI1HE6+IC9l5iKyDy9uYtAzx
	xAz5K/Qzt4LYIouCpqM/Thlpntot+puvK4Db6VgeBFj8GOUjctvLGIcDvVNOpxC0KSyHBEuqld9
	aYS5AHTe1SqntZNKBkQREhJ+Gg2ppdaNUVrrmOM31pFCk8
X-Gm-Gg: AeBDievEkIOcDni/J+KS82iOsq7Jvamu8ikQMqiqXqqDoxkdrL9R11i0QkCmUDvP8PD
	iFFLsVsU3ZWnDg4sy0OECWuF52OVDQzLFNo8iZ+luZiPg7mFj2ig1zpY3fqwwPhog7Aj7LRpoxL
	zTaVToXC/LMaRTkl8/i19HXmS2RGF4ST7FVZT7CpVu36gqqBoHu2oBie8oeUgfUVEHEPasnb5Kf
	MuVKmVxb0vhlRpy
X-Received: by 2002:a05:690c:d95:b0:79e:8299:751d with SMTP id 00721157ae682-7b9ecebaa2dmr304556977b3.11.1777018684917;
        Fri, 24 Apr 2026 01:18:04 -0700 (PDT)
X-Received: by 2002:a05:690c:d95:b0:79e:8299:751d with SMTP id
 00721157ae682-7b9ecebaa2dmr304556787b3.11.1777018684469; Fri, 24 Apr 2026
 01:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-2-e8bc6e0f70de@redhat.com> <a1ddabac-8e50-4730-b936-4ddef949487e@davidgow.net>
In-Reply-To: <a1ddabac-8e50-4730-b936-4ddef949487e@davidgow.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 10:17:53 +0200
X-Gm-Features: AQROBzCPgKA61g5jTjlSE5A3sG-gDo7X0r4wi6SlVdjlUQQBr3gtOcBVPcG2A_U
Message-ID: <CADSE00La5sN18OqEmSE7NHwHnS02k5C1Gn2+o9hy4S4zLgC7dg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] bug/kunit: Reduce runtime impact of warning
 backtrace suppression
To: David Gow <david@davidgow.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, peterz@infradead.org, 
	Alessandro Carminati <acarmina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:21=E2=80=AFPM David Gow <david@davidgow.net> wrot=
e:
>
> Le 20/04/2026 =C3=A0 8:28 PM, Albert Esteve a =C3=A9crit :
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > KUnit support is not consistently present across distributions, some
> > include it in their stock kernels, while others do not.
> > While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
> > features, the fact that some distros ship with KUnit enabled means it's
> > important to minimize the runtime impact of this patch.
> >
> > To that end, this patch adds an atomic counter that tracks the number
> > of active suppressions. __kunit_is_suppressed_warning() checks this
> > counter first and returns immediately when no suppressions are active,
> > avoiding RCU-protected list traversal in the common case.
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> I'm not sure how much of an improvement this is.
>
> It might be worth putting things behind the kunit_running static branch.
>
> You could even add a new kunit_has_suppressed_warnings static branch,
> though I doubt anyone's too worried about the runtime performance of
> WARN() during testing, but with no suppressions, so it's likely not
> worth it.
>
> Have a look at, e.g., kunit_fail_current_test() in
> include/kunit/test-bug.h, which uses the existing hooks implementation
> and static branch to reduce the overhead as much as I'd expect we need.
> That'd also potentially let you move the backtrace suppression code into
> the kunit.ko module, so you're not even paying more than ~a pointer's
> worth of memory if no tests are even loaded.

Agreed. This patch can be removed entirely once I integrate it into
the hooks infrastructure as discussed. The kunit_running static branch
is indeed a better fast-path than the counter, and leverages existing
architecture.

>
> Cheers,
> -- David
>

