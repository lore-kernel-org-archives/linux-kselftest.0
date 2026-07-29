Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A2B4756A3
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325992; cv=none; b=YJVMY8gWstpEkhGWm+LbHWI4SailrNnjlnpKJBO5OmIjpAdMbXmt4kxeneu5YxsCQRv4HCLi1vHAtrViqnguZDMgCI0ptCNeqzDhHrfmAqDMnRRETe5MlO4QePrQBDj92ZDAUZoWtrxbLO9v4SviLOVEuBVNnqPhV1q4EQrGb0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325992; c=relaxed/simple;
	bh=xn0A3G+imlHjwbqfECgVG5w3y8DU5IaW0X0jzxdqVrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lrd1sXKTUDpIzOIbBzFcYlsoNLbxgjI5yOZx1WeLyeFAd7VCL7+fiDZvbiGYtNPIP1DqZk2BCXPdq55jdYFQtD/byzM0zU7zgJwdVQjIVKGQj+z9A4WYWbpvSdPGDkSHEW9INByYqEFpByO3EXCgPKzfhe2XabT5VSeYLwmo3Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YzAB7CkW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YzAB7CkW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f752b3423so550774f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 04:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785325989; x=1785930789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn0A3G+imlHjwbqfECgVG5w3y8DU5IaW0X0jzxdqVrI=;
        b=YzAB7CkW391OXrZ5+bJrfWkj9d/BD97KmWpGFWSiQdd1dtnLaLSTd/JJzqwip2l7VE
         yJhOA+PZ5lPEERw8pRQDG++qEjVRE/ToWJY3EkdmxGpI89akSpNo/kLob0nQkAcH99lm
         3hqPPrVaIbmaRCt5YM31hg5ML2tO+ZOH4xdUaMtD7TMUiAlMCe0xIfrLMe7JItYE3Yt8
         ta9TlVI+U9jxl9Y6MnD15Hz1npIQhQlLHk6P4H0F79zbn7BmmQEViRctW/3/d1HjetkE
         DpoCGW/i8QKHaQxT/qNO/h0ltVopVeGpGwiaT+5txdcjQt3gLlbz/uXIxtQfUDjBJsA6
         gNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325989; x=1785930789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn0A3G+imlHjwbqfECgVG5w3y8DU5IaW0X0jzxdqVrI=;
        b=YdUmlJWgGfc6hb3+GNULTsxnIkI2rsPcoNamDsN5jAUzyt1PnRIw2O7jtUl9AtPUJm
         VcLPXeugH2n8w5d+Od/CDH0UK0ls9Q7OomL2kxUJUEqLu3/fuyQAAwcrikQlzpDalhIa
         gaebOWwXtV0rZlHLvO8ZyDQiqBn3fs+fASOTRI4YAd6kmD2582rTBWnqdionJ4o8jxh6
         qX3edZEmfB3VRUo9PI00NCzjEaM0pCyACob8JTp32Ztahujss2XEOSDNC37nB2qnlo/j
         YhNKKRXETXDUCWHaNg7hHoQKE0TlXcsv5equXQHs9DOMqlJDiUO+EA1GNaihyhFxE0LF
         ppLg==
X-Forwarded-Encrypted: i=1; AHgh+RoB1uSXfol/roz4Bb2FSIFDwDETkUmLHc6o+lk8KRi3FpE6ZAqLR6vEAG9jxOboE7Xljokb5zFtf5itmeXA0BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrzBCeq8XcmkUrYfUCMarjM2/Lo8XaDWfS2rtwg0DE3aqh/HmH
	29niJIxKoeQddVfMR2gNfQZEPvgp1ipVEpt1ql8oNqJ9u30IQsZuMjQaB7by4dl92PU=
X-Gm-Gg: AR+sD12q72epnUGdWAA13GCiz9Xqym3rzlKqF4z6qKuQwiH/IOJYQPs0YSnWeiT3URw
	fdqcjR7nsG0ST//B9da/nMf7LWF3tII+gcsoa8frHn17BGQps/rA/kKAgFb54fVuMP6WKaY4z/R
	f6F+ovj2RTDfvPc44QoOQ9bO899zS9mtGvxWgK395Pz9pq9clNIhu1tnybt5aq9jrMjijimxSRq
	rt2Kh69c/Pau3+uMUy/CyRgoPEnYdctd5SuPwzu1kxWf2uvGe/iO9pNujEQzfLC917dwuElQ9qf
	OfKkATXUARVuNEPoFDl/GtshnZPpScB0NFJYINRqSN2fBHaCU3jdrGIgKKSyHSKUkz9W6QhVc7M
	pBXnQWx1Jcg5L42sl/a3x5v1Rc7gD+d8sPUkXupe+ftX1Di/kUJF34xGtJNKc2JHuKTQpn+c6Eu
	AylDSREyebgXsF6CynoLnb+a82/G9V01Zjb94F17hGSF8CA7HZcoUYi3/xRemojszQ
X-Received: by 2002:a05:6000:4716:b0:462:e086:35f with SMTP id ffacd0b85a97d-47fb1ed8339mr7235562f8f.21.1785325988938;
        Wed, 29 Jul 2026 04:53:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b19653sm7730772f8f.30.2026.07.29.04.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:53:08 -0700 (PDT)
Date: Wed, 29 Jul 2026 13:53:06 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shaojie Sun <sunshaojie@kylinos.cn>
Cc: tj@kernel.org, hannes@cmpxchg.org, shuah@kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/cgroup: write explicit period to cpu.max
 in max tests
Message-ID: <amnocemHk8WMUnyi@localhost.localdomain>
References: <20260729100451.689458-1-sunshaojie@kylinos.cn>
 <20260729100451.689458-3-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="piybutfk75vjrsrz"
Content-Disposition: inline
In-Reply-To: <20260729100451.689458-3-sunshaojie@kylinos.cn>


--piybutfk75vjrsrz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] selftests/cgroup: write explicit period to cpu.max
 in max tests
MIME-Version: 1.0

Hi.

Here I cannot appreciate the changes.

On Wed, Jul 29, 2026 at 06:04:51PM +0800, Shaojie Sun <sunshaojie@kylinos.cn> wrote:
> The cpu.max interface accepts "quota period" as two values, but
> test_cpucg_max and test_cpucg_max_nested only wrote the quota,
> relying on the kernel default period of 100ms.

Yes. Is that a problem?

> Write both values explicitly so that the period can be easily
> adjusted for testing purposes and the remainder logic becomes
> genuinely useful.

I have yet to see a system where the default period is modified.
Therefore, I wouldn't open that box with non-default periods
unnecessarily.

Thanks,
Michal

--piybutfk75vjrsrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCamnpnhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ail5gD/fGsAYBJwbk2uztBZqwSE
MMwWF6gfM7FfiSKb+4t7vcgBALL32jYxI+iP0Qwr9ps5a9eA/iQFxErZIKHCIWeF
r4sG
=8BAZ
-----END PGP SIGNATURE-----

--piybutfk75vjrsrz--
