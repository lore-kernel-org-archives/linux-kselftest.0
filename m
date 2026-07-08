Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B92029B764
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 19:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537263; cv=none; b=NN9kArF3/6z1pxDR85x79bYDgYfaFocIDzSrvIw/NoD0+Ftzl0mh6ZNGWvpyzTdxBdz+xU+eeRW/8zPK+U4GzU5c/yEHDPcixZwq8tpWXLZ18aVjV333DdgA0dzGWVGGqy2QRD8HZ9eLKKL4STgPd6bpnMkNvg8wFrEyzVf/UMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537263; c=relaxed/simple;
	bh=k3eMYQ2fgWM9eul1MhvdVNq2qZnIJPst3WSiSXllEgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuiuLg2kVYUre9jq4JSkz4aIbPc0Xszb+ZFGYKCPPlT1U/COq1gncL62SAFRqmHZTU/Lwq5gjmlY6xNCbmyv6tzDuIDdixr4DrHF4lsDtZBGYooyJerl/JAQ3lEQOtn2iwET2mmPiViZ2OQseKOOmSGdx7r39rU+7CopwhopOK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Oo3BT/bv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Oo3BT/bv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c7902f47so8114815e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 12:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783537256; x=1784142056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k3eMYQ2fgWM9eul1MhvdVNq2qZnIJPst3WSiSXllEgI=;
        b=Oo3BT/bvj/qIG5mtfWfiQM3aeUvzunXLkokRypDNrXYrVFgWl8KpL9+zFOpdo0dPYT
         yI7/mUEWcuc7Chk0NvyyCZXcXQ9CtL9Jd0xmjgogqapx71ybuogyUFCypb+y8w7z5wkt
         UaXwwTxZ+EZnKS18+rVzyQXsX0fiJqo9Vyn1Ov/rn3ZTH1JlorNCzErGIQ3NF6NnJisd
         h2o1t4ZBr+8HdQVwVlLmmVBWRatxoUzUzQWETcrwYKIOA9luh+R393ozJjoW6dS+n73d
         YUKU0DSM6He72hA8nEmp3/cZl3vtu547tA0K1lDuC+j3/4P5hbnf/sgV70j2ZLZ1NEli
         hBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783537256; x=1784142056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3eMYQ2fgWM9eul1MhvdVNq2qZnIJPst3WSiSXllEgI=;
        b=hR+3sHst1ar2LhZhXnCAqIFxBHKz33CkpPBUC+NNcNsE4yZEzQyINjVIzrMA/4N+6c
         fXC4UTa8axEs3oAC24SbSYJ8UJNKfweP2zFC+m56rSLUwLMdN9vfTFqhoJ6runWdJ8VA
         GUNgZbrpT4x22M3s4Wm4MR+5J8pg7mnPU/9mh4w/oj5rZrZcPTrh8AJ1ST+jXI4ItR2X
         qIRDNxzHyvb3GoLNbDP4dCYHgIKB8zEYBUsMGKCL1T9fPedOuJ8FR5gtnpIolodiGa16
         eBBlXPOWF9lkad0wwVXP58go3q6xzcphp6pWftbXQY8C1BQR+Jx8MdASJXY+Fi1TFblI
         g56g==
X-Forwarded-Encrypted: i=1; AHgh+RpbdYVqYOKUwBNMEp5hKgnT5l7WxKhQTiG1AFTl25Ybxs8L42CZITPBmwUbjiwd6Obp1oh6NjMnJkk4CewCLm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZAbGqokp9M731b7mh96gGKRH17uyvEpWWyaW5LsVr7zylDgyA
	cUSp9kiZ77aW2ji9jR7WGqYYrwyTSPD7zmWJ7xCGlNbYFeC5Il0jQ+zUL21eRMOyydY=
X-Gm-Gg: AfdE7cm/gvKMN5ppfs161meFDRodF/XmFRO7fSIZWG+aQR5IyupWrrdZvJn1DPIw8bs
	Km4qqSzxGo42X0/F+TjSOQNVi4Uy7VsTHI9ozQVfa0QItoXEMDaopSfq1vxSHF8gpvcWhzyzyq9
	yraYQce5Okm3pypV6skmoavCyTgayG4EDdntP2uH5rP6Ix3EdVjOyOHK4bZlXTFUMv7Tq3XoSjQ
	3Xw5ZQOvr56lXm75EQExDkPdbFTspGGcItOu+yNX5fgJxwvi505J7iV1/Hgm54KayoMLv5gTEQ1
	/fxA9bSeJoDtndrLaMjVgp3YDc5wNT4vuV0VoUgiY3guuwCh/9yD3nKNPudfamUxDUFMOSRykbu
	6gF+GBpWMnK2Mc2cZm1Y08srrYIPN0A/IGckRb40TEZlrAS1m4yxbyemfrjmezZO1bv1m1MWb4R
	Fa2Lcd/mYnusVH42pzG0xTIlgRy+R5216gYgj3ow==
X-Received: by 2002:a05:600c:6091:b0:493:c83b:50d7 with SMTP id 5b1f17b1804b1-493e6831575mr37343485e9.6.1783537256247;
        Wed, 08 Jul 2026 12:00:56 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm51255578f8f.17.2026.07.08.12.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 12:00:55 -0700 (PDT)
Date: Wed, 8 Jul 2026 21:00:54 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Zenghui Yu <zenghui.yu@linux.dev>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, hannes@cmpxchg.org, chengming.zhou@linux.dev, tj@kernel.org, 
	Shuah Khan <shuah@kernel.org>, mhocko@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
Message-ID: <ak6c2TaOlcGxZ2Ih@localhost.localdomain>
References: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
 <CAO9r8zNJh65SZzdW8Cc8_8N5Wr+ORuRtU3kuaAX_DhLaESFYTA@mail.gmail.com>
 <CAKEwX=MMXdq7KTzcEgXfNt2L-eTmAVa+nijdyiujVOAhXQsHSg@mail.gmail.com>
 <CAO9r8zO-nAys0PJfXVRwLgAzwJLa9KxpMXKQKXJR7cnYKgmhRQ@mail.gmail.com>
 <CAKEwX=M7axSs2FJDq0KF3GBDpd6G0J=gP_2boUJraNf8M2n3Bw@mail.gmail.com>
 <CAO9r8zM8qk9g6+B6GiCV3oytjViMTEhbr0KjrccU+bF4+PMfTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="65f7eg5vudklrash"
Content-Disposition: inline
In-Reply-To: <CAO9r8zM8qk9g6+B6GiCV3oytjViMTEhbr0KjrccU+bF4+PMfTA@mail.gmail.com>


--65f7eg5vudklrash
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
MIME-Version: 1.0

On Tue, Jul 07, 2026 at 02:49:56PM -0700, Yosry Ahmed <yosry@kernel.org> wr=
ote:
> I would honestly rather use more memory. I think there might be cases
> where the flusher is delayed. The flush being slightly delayed is not
> technically a bug that we want to see a failure for, but if a large
> stats change is not visible that's a user-noticeable behavior that we
> want a failure for.
>=20
> WDYT?

There's already the (recent) page size-based scaling, so the idea with
nr_cpus scaling could make the selftest useful on wider range of setups
(even page size can be considered as a slight implementation detail
leak, thus the justification of nr_cpus dependency).

Also, I still think that internally the threshold should be changed to
the "harmonic" formula [1] but the selftest can go with the linear
dependency for more pronounced effects.

Thanks,
Michal

[1] https://lore.kernel.org/lkml/n6mhkjsxsami3qmczkdh57eep4lmcgbtyl7ox3ajzv=
eke44yf6@m4bjevvsr47k/

--65f7eg5vudklrash
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCak6eYRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjWUgD+NXLAQPqFouL0lAEWSdLH
Q1TGxjtThGe45suKK7NoiLIBAM7klcnhnOTcn3O4JeLz/eHwfK1JWXaF9nVzAX65
8KEK
=2aDV
-----END PGP SIGNATURE-----

--65f7eg5vudklrash--
