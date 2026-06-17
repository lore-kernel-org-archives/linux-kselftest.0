Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435C3F54C6
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699122; cv=none; b=P3deSvFBr9TyOqMaXi9bYNX988dcs5pyYq2f48WmjzCczHc3gS4MeFWPhs/WGweLGuaxDJGWbdhmUU34ner+7G8ANmK7t4iNrXSFuiGmJbDFXQr9e4W2v4eIMvLWifdBBr44C495z50zbNMPn87OkdX0dK02jxUpbDEvMpx1rUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699122; c=relaxed/simple;
	bh=1yJxZq3tkF0bDvOTRpsnisysrPdGXlXB3E4O1ntJTHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfRQt1QWnx9g8MT9WMmO5VYuK1f5dwuLZKJ+AJEFQigfXE/FISG63YN7e1OHcgUnvLgg9AXV/wl0ZkSaNLvIKhcKcmM+1bfrRQwTkeM4bg4nQMUBzlpjGySAvUezPmsV1F5k0IFDCJkD4KHUR22wgln9h8LxJuq8Pffio+IsFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=al3ub1Aa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="al3ub1Aa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so48488005e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781699118; x=1782303918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yJxZq3tkF0bDvOTRpsnisysrPdGXlXB3E4O1ntJTHg=;
        b=al3ub1Aa+DrvVM6gEt0RcABwn0dqsOPQ81H94gI0H3nh9GyialPhTFd5qEOsHPTU74
         JZmfLGrLJId7/F6PaUqLQsYMvvDNOAFxc1WEsHIgjSebRtKiTN0Scfw0Sn+9EM6WIB0E
         LQkQt5nVWCa5gPYxoC/ydL597UQHpBGfB138pdRMJZpPKh3l4zwaqprm3n9aXRxYkH+T
         4toaU5y3NsvTO8nte6GpVestg4GkoVJOvxrFGQ+Ymwshgx7euPt1pIez3OShMK0r+kto
         j8zFGVxW986Vd43ctXl7JdQ+TPrTg7LGkpVXEPwMGKJ18Nb4bE61GZNqPjlKP8IkWlGz
         o/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699118; x=1782303918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yJxZq3tkF0bDvOTRpsnisysrPdGXlXB3E4O1ntJTHg=;
        b=WAdQ74iZg4+wn6JIk3JQ8XZpHkZq1x999+qhAVsLgloVFA2soiLLNEjyGxw9RYnqTa
         g7BFgTFQNbEaFoAPFdxi2Es+jbgAeDToawiRHA5pkF0sr7j342KeFC7sApxSxfxL9r+0
         uliVmpybNQAZl5eVjbiaD/EQLP++xp8WeODGE8bbEWXhf3H7224KZTrzD7JhyH8SUjRa
         9Le0GmYLcdEqVXxIXLgXSe80JpR1C8WfxsauKY8CXGG9rBnbc24UrDZCQxGEKHJOruGi
         howPxzSjsG2xVpUX4/F+Pj78cXlgCfGrisZucblrai7RjvtjqExtbb6vgwa63yPe11MB
         DWEQ==
X-Forwarded-Encrypted: i=1; AFNElJ97qKMOejAdSCDHXkYa6JagQJ1De5Q4CQU79kZG7T/ROppO8OfQUN93jtWczBkUEk3koZA9y7X5K5QfpfSU+PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh1U/Ynq92kKhdUWan/EW45vyGLE2FHfhIBL6H5Toi2U5osskY
	iV2a5HNBvnljo4hxAHnxlWu1DyiIwRzXPQg8rln1OWaexk+PS8kXEGPB69eK1ZUhRR4=
X-Gm-Gg: Acq92OFKtshC3fb45FEgRsZQP1Z7slzbNBpBpFWMSZO2au1SeIQELeOoiSqqUF9Klaj
	j8ngpxUzfRYUbFJsrglwdcsyDcASTSCTb/BMx6Z7cIEyb95DH20hgfviOlPLFWmBLaMMBmvfqVN
	ckc9iMcQ8QPFzP32pxKpZl5lGo8ywFWssl3SbN4yOoLXBD04u/A32Gv/0dp8DstYgxcerz8/sG5
	ZWRA9vivVlsG3njbq0boygUfNyFiZkP9sO3qRL62IqpZfEkUYkiBeh/J+PscDg8w9T+9wEpRJi1
	bW5FhroQnx9QiyDX+wKB4vDXS+Bsah8mi/gJMnXiHXNjX92CAxPcDqf/9WXHaPIvNq22l9fiOln
	dwKXXQfi1WajV2ruDpxUdZfSUKWgsJdgAm86OY1puUuuXtGb7zstgMqDqWOVF8TOp/2gRutKEh4
	dvu2mnNPF8/lB4DDtRng==
X-Received: by 2002:a05:600c:c0d2:10b0:490:e5c1:b8c6 with SMTP id 5b1f17b1804b1-492333a16c3mr51513355e9.8.1781699117684;
        Wed, 17 Jun 2026 05:25:17 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9a399sm140088385e9.14.2026.06.17.05.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:25:16 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:25:14 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <li.wang@linux.dev>
Cc: akpm@linux-foundation.org, tj@kernel.org, longman@redhat.com, 
	roman.gushchin@linux.dev, hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, shuah@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v7 3/8] selftests/cgroup: use runtime page size for
 zswpin check
Message-ID: <ajJwNecLWRvX_7Tw@localhost.localdomain>
References: <20260424040059.12940-1-li.wang@linux.dev>
 <20260424040059.12940-4-li.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fw3psxfcciuimhrk"
Content-Disposition: inline
In-Reply-To: <20260424040059.12940-4-li.wang@linux.dev>


--fw3psxfcciuimhrk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 3/8] selftests/cgroup: use runtime page size for
 zswpin check
MIME-Version: 1.0

On Fri, Apr 24, 2026 at 12:00:54PM +0800, Li Wang <li.wang@linux.dev> wrote:
> test_zswapin compares memory.stat:zswpin (counted in pages) against a
> byte threshold converted with PAGE_SIZE. In cgroup selftests, PAGE_SIZE
> is hardcoded to 4096, which makes the conversion wrong on systems with
> non-4K base pages (e.g. 64K).
>=20
> As a result, the test requires too many pages to pass and fails
> spuriously even when zswap is working.
>=20
> Use sysconf(_SC_PAGESIZE) for the zswpin threshold conversion so the
> check matches the actual system page size.
>=20
> Signed-off-by: Li Wang <li.wang@linux.dev>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=FD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Yosry Ahmed <yosry@kernel.org>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
>
Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--fw3psxfcciuimhrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajKSJBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AifigEAsoKP16b+0Ymtb3KGVhyI
va7ay0/8bjusHJQkcZqNicIA/1Wml5S9Nn0nE+3XPCz+4d6nCaUqIpGdRKFGT56w
XSAD
=y8NZ
-----END PGP SIGNATURE-----

--fw3psxfcciuimhrk--
