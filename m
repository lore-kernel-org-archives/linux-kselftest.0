Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDE83F23CC
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991427; cv=none; b=UJdEb6EdbFMCFBLO4pa6+vc1jC95Hvv7C98brUdtqyGUuzyjeX0E9SoutQlXVRYBAxR+SIAWQF9iu+xiiwCO/99kTDaXTyFY8pmMLZMZ/6lu+GabUWvZO81A9N0cUr2tEyRaEnP33iFVsXXEhbOZAw7CO2+r2h2GZY/EcRpezdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991427; c=relaxed/simple;
	bh=V3QDfpUCHD3J70aYAoaXsLi0BbOWK1sx1MtxsffsVYI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cCJR9KIWJUf/VYZM4z3k+byQhoO1mRbmyBybGgF/1ItCRi2En3TI8kS5Ha1MXZfQjUJbReKlDY0v8dh9BcKfeQBM6bRWeoTOg88AkI38CmArhxK5DroJbuwBpfFFEoUOgVRAa4wgSbM0lbipHyRHs3e+IhaJCV+J4nUFU5fxfLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BF7FOLzz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kpiCmpvU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BF7FOLzz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kpiCmpvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774991425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YlJ7p+iVljF4/jt/mLpXPYGwW4amrNrMTIm4YNtSvJc=;
	b=BF7FOLzzenqhGziolIPWlEfPd4nYlkotMsZ+IQEGD9mKY1FGWFgfz+H9x9GN1SXZsLTMNL
	hhHkhBL6aoSIA4It/YnOmG+GxMNDhd/SKkHqq8R1yolKz/+QzpPZgXsJmZ1c6Cop+Z6U9v
	gXlT8J+6A8WLbHn9NXxjpFifDk9DvQw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-1CDt8AJGM_e2pdEQcBx96w-1; Tue, 31 Mar 2026 17:10:23 -0400
X-MC-Unique: 1CDt8AJGM_e2pdEQcBx96w-1
X-Mimecast-MFC-AGG-ID: 1CDt8AJGM_e2pdEQcBx96w_1774991423
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d39dd9a24so3784176e0c.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 14:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774991423; x=1775596223; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YlJ7p+iVljF4/jt/mLpXPYGwW4amrNrMTIm4YNtSvJc=;
        b=kpiCmpvU+r7iCYwdzRoBEDDuIPT6p8wOeAdLW0hokQyhO/zbLUDGrXCd4/B01VqsEt
         IybKBnriS8E9QLdUApn3iQQOB4dnwPcFe40S17tdpNh+jnIIXuCJPdy+XTmchEK26v5l
         ExI9gVK240sV5lEE73GZrvb+nBGD+4zTwXwvEieLDwlCWjhB2X6840+ggEe8btZRO7NT
         XW2KpqszwVqyUHk57CI6JuSE9AH6rwkmELJlYCXyg7BhWkNH5hwNX+TqK2DWHQxXwkTE
         LEy/CRNki3fF144loyWtdH0LpLdGiClDcKq8BXFj5FdcpoUx8kopnfjxcgTN4zpYsCTk
         oF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991423; x=1775596223;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlJ7p+iVljF4/jt/mLpXPYGwW4amrNrMTIm4YNtSvJc=;
        b=jAA5jJRbjEulEdJoyQf5JSRjklBKLQEBLNyxECHZxM/h4dWZSysEj16DblMRpqop2G
         7fcQX9HsT0tNFd0nzQDlaniUWaw4MO72loSQDPhjL1bKzlK5kSCYsi7Xk2hw9RXWo523
         x5Iw/20DcCaW3uJOeH1UUdaG4kQZKB9/sq2NTPKcy30IOE+UCNPjIbsTmIpSPELab0pS
         f8sHnuxlRHE2Uc8bkpvkUV16vT1X4hu1a+jlwC3lH1JVO+2Sz+GahYMbDxvceYIsgF9m
         67VkhKN1sC8jR/m3OsU5VfFVmEubt7kqzSWzvXf1cMsMEbyg6X8BrgYHatTLXWzDBN7g
         onlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXao8ju9jkT7u7XPeiB7yQJIsombhpcLP5C02jKrM873I/EZQr4IvQoPZdhEV4YtmD2eDYmSddfCwQ6u5znEuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXIhz5J0Vu2ok1lMz0k2YlDJFJCF4sCOwGU3lPjFKPQMfur6C9
	pFi5+dI5x3JwQM3fPBc6XjDpY8bdm9kfhQpWLjMXB6iNJHrAwJtjZGHJSOMrCiubcYY2bxYqVHd
	rOXHCJ9S3yn8/vaXQcwNd1p5amQQ5Q6KhWzwKuai8wyfvT39OsNBDMU8mVoegh5MeazjitApW92
	vqnqX2
X-Gm-Gg: ATEYQzz10loKnf6ya6vvS0vaRhPZd+ryKXBzLcCBF3a43Gx2oedj7cp47TwOouCmfzF
	0mlZ/OIJxn1nSkNtw3hEX6Ll/GomR1d+RDnS7w1Gy0+RgMiypgs++ZjVW9l7uxS2R58SG5QKhsA
	9H7oyzRwbZR4ljNrDxho3fVz+WqYX8RvlKLDwargjZT+iMkgqJvBpLD72ziTSqxheXRhr6e42Fu
	XW/dbdzzZsNtPbZvRFL0PzCtcmQ7J9Ew33zGHp1VS/OeQBYS4mXkTByqXIkp36SZp1pB0yRifxQ
	wbAQcXn0H+USuMwBKQnUUnoh1Ou1Kd9Pxt8HcCPcARoDz53+jaDZnmR8vym7YA9uvo9B5dHQpjZ
	XvA45Q9DWmvMLnkQ=
X-Received: by 2002:a05:6122:469a:b0:56b:95a5:da18 with SMTP id 71dfb90a1353d-56d8a905828mr579906e0c.10.1774991422911;
        Tue, 31 Mar 2026 14:10:22 -0700 (PDT)
X-Received: by 2002:a05:6122:469a:b0:56b:95a5:da18 with SMTP id 71dfb90a1353d-56d8a905828mr579891e0c.10.1774991422440;
        Tue, 31 Mar 2026 14:10:22 -0700 (PDT)
Received: from localhost ([143.54.48.116])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a333c9sm13810366e0c.13.2026.03.31.14.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c254c86e525b2971ae8a9abacaab64ab5088645da2db68accb1dda6b2953;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 31 Mar 2026 18:10:16 -0300
Message-Id: <DHH9XZULMJOP.VB88ZIPXYI4J@redhat.com>
Cc: "Petr Mladek" <pmladek@suse.com>, "Pablo Hugen" <phugen@redhat.com>,
 <live-patching@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <jpoimboe@kernel.org>, <jikos@kernel.org>,
 <shuah@kernel.org>
Subject: Re: [PATCH] selftests/livepatch: add test for module function
 patching
From: "Pablo Hugen" <phugen@redhat.com>
To: "Miroslav Benes" <mbenes@suse.cz>, "Joe Lawrence"
 <joe.lawrence@redhat.com>
References: <20260320201135.1203992-1-phugen@redhat.com>
 <acVD_NPu4JVRoaVK@pathway.suse.cz> <acWZ3r2CoSDy_NLf@redhat.com>
 <alpine.LSU.2.21.2603271143310.31210@pobox.suse.cz>
In-Reply-To: <alpine.LSU.2.21.2603271143310.31210@pobox.suse.cz>

--c254c86e525b2971ae8a9abacaab64ab5088645da2db68accb1dda6b2953
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> > Summary:
> >
> > IMHO, this patch is perfectly fine as is if we accept that it will get
> > eventually obsoleted by my patchset (hopefully in a year or two).
> >
> > On the other hand, this patch would deserve some clean up,
> > (helper functions, don't die in the middle of the test) if
> > you planned to work on more tests. It would help to maintain
> > the tests.

> Right, I think this was a good intro patch for Pablo and that the
> revised execution flow would be a great follow on series, if he is
> interested.  How about that?

Sure, will take a stab at revising the cleanup flow. And thanks for the ide=
as.

> > This code is repeated several times. It might be worth creating a
> > helper function in tools/testing/selftests/livepatch/functions.sh.

Makes sense. Will include in the follow-up.

Thanks for the reviews everyone, and thanks Petr for picking it up.

Pablo

--c254c86e525b2971ae8a9abacaab64ab5088645da2db68accb1dda6b2953
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQMP+tqh8XWgfhXItgg/MNYDx+9egUCacw4PQAKCRAg/MNYDx+9
eqxiAQCGcnxyRstJp79GbB3BASfV3LTj9euCgFXlSYXqa41t+AEAmxNRxcKnhSIF
0sCDcIbb48AIFhU59jPUrvFU91tdXQY=
=6YsZ
-----END PGP SIGNATURE-----

--c254c86e525b2971ae8a9abacaab64ab5088645da2db68accb1dda6b2953--

