Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D135E95A
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253029; cv=none; b=FL4Onl+K66kEeiuV6Jewz/OWNdLzDE6UwoLavJGfxDVb39rXPXa5EbnA9BnE/KhtuzaYMGJ6ESlp21ioydoVdoLyWzaq0uUcavWz3gWzIRxOUqYWh2zoU+/LcwJjZYgf+Nn1HeDalQ33emtKle8UFeDevmufN0aafPyjh4op+8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253029; c=relaxed/simple;
	bh=qTcgY9EoeEHxVXgfiEWeuxCxjc4a584z0cwmku5Yd9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPVzsq+Jgn+0Gd0xBNOuSxbKnwHq5wBmllosSRubbSUIsylztfdtqQ8yF6rprNBgjMuSU6srX6F5TbkXZOzAy1sc4JEIHGjX7jmnE9+VMdQJ8rhCu4/1x8Q9ZT9+JaOIFWodshmzPslsIZ0asf/7lKRVTqI6wphomPCGXBPXTF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UdDu2vPL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UdDu2vPL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b9320423cso44436875e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788253026; x=1788857826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xrf2I5rwuZTtUj0/BgFzlW7VpIjkJf+F8+X2M3EKpgI=;
        b=UdDu2vPL8ptLlQXDjEu0QIyl1qM2qWV8g6iTYXLlSAurDvDYxMEICyQcgoiTs3bBa+
         Zpm6/ZVHsLl4IYeZpJE6fSCAx27965xo2PDKDW9Jp3JjzVCMYrVBa0kIPbg99RbZuAwV
         FpFYmo5BcHUNwrtLcnoubFnpqinQ6vCgvCVhVomSnpjeaqjxBNNuK3rd1Gbde8ObP7sf
         y/j6Ne8+4j7IqG4EiMsv1v/d+VuJXDDT8UGTic2AlVT+ZArXleYP/tG/8rQE10AU3K6e
         tqxqhE5vOeUu3ZSI71cXaifgZgPxPqFJUWVU140301WhpbgqIIMfY3w2r22YsQciTWQR
         p3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253026; x=1788857826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xrf2I5rwuZTtUj0/BgFzlW7VpIjkJf+F8+X2M3EKpgI=;
        b=LjRU8WuDgZECKykwjD8nwItmaLdD8SIWTQ1MR5Yce90EiFXt/otuKYyxDHettN5ft4
         F1+ByuL2hvHk2PyWKP/j3Fhve+VtJZhxYjQnhlgp9/hDEmHVxJlRhWpf6/RTRz60K3V5
         ZvdL+zT5tmPnmD1bmnJTWSQ3yu67EEvJ/cJXW2QJWrPs9xm9Asig0hkHbig9oe8yLE3Q
         P6MJR6uO4ihAMi5I1eOmthJAVruh8cvdcGu6Z7FMATLGt3hOe6RGLsS8cd2VzVYmNDhT
         RQAAIv2pexCeqLnCSHtKvQzlp3U1/s+e7JbSZEr26WUcNljXJ43n/QCYmHN6ZMDnuiNd
         pzwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqsl1KiOkjZ5j2t45yssjkM9MahWicPI4Umt6OxES4iq4XQUXLERAN1G1RXHjVSpxUl90pk0uqNPC+B+/qLuts=@vger.kernel.org
X-Gm-Message-State: AFuF++nqNeRWNwiS9bKI4IruuJictT8MToIqG7GZoEVSd3tRRDwszTbS
	BVBP/Fpc7BE15C4YYdGkB05AVRo3HSCk5JIogGdkOUD9tIlZL+Y8MxlWJHnKOl9fDZQ=
X-Gm-Gg: AR+sD10CfHwWiSYeI2pqDIwQQJ8yIQ15Xa3rsbpXta4YnKlLTs0z8aXtKBjsEUXjg+t
	HvOFfw36xF6ET1E/JRvC25PSiAjn3Nm+u3kCUZCLYX8ScJHkZPqhbtwZx/O+c5W5JlJwunV9z6t
	nAr096+bn7ntvbKgxrwdg+C07L+oREmixt7CJpG+VPn2n1l1P/etiEIlI8n8jwgDqEtcvBLQWIt
	FKJcymAGy1QjX+8t7R/yhNLzaMHeCo3ehjzAP0NZMgcotzPC6UDWd0WwaVNHuEbgf5rX4QVIGT9
	SMr7CGO4yCC8QRy6X0rheATt8LTtqr4Hbv2D5jAOQViTKtGtBwdOcMZAYrvnyPHonJasJlVn1Hc
	koodG630TFPyUcP/cBqbwPytVWHqzI/BZS82/DGIius78l37Y3F0nmvCTZzxGudbQTygHTtqFHw
	dnB3LN72ww+UTGz90JaU8lo/z7+id4IcpUb8VsAwpMxwvYlprEzfBT8XtM79fkXDU=
X-Received: by 2002:a05:600c:64c6:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49cdc558470mr121172455e9.11.1788253026345;
        Tue, 01 Sep 2026 01:57:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c4259esm3313283f8f.7.2026.09.01.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:57:05 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:57:03 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] selftests/cgroup: test_zswap: fix implicit
 unsigned promotion bug in test_no_kmem_bypass
Message-ID: <apaO1OHVQWJCuJDE@localhost.localdomain>
References: <20260901052250.154532-1-wfelipe@google.com>
 <20260901052250.154532-3-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nuwu7tagmytj5izv"
Content-Disposition: inline
In-Reply-To: <20260901052250.154532-3-wfelipe@google.com>


--nuwu7tagmytj5izv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] selftests/cgroup: test_zswap: fix implicit
 unsigned promotion bug in test_no_kmem_bypass
MIME-Version: 1.0

On Tue, Sep 01, 2026 at 05:22:28AM +0000, Wilson Felipe Pereira <wfelipe@go=
ogle.com> wrote:
> In test_no_kmem_bypass(), delta (stored_pages * page_size - zswapped) is
> checked against stored_pages * page_size / 4 to verify that the pages
> pushed to zswap belong to the test memory cgroup.
>=20
> Due to slight stat update timing differences, delta can evaluate to a sma=
ll
> negative number (e.g. -5MB out of 1GB). Because delta is declared as a
> signed int and stored_pages is an unsigned size_t, C's usual arithmetic
> conversions implicitly promote a negative delta to a large unsigned 64-bit
> integer, causing `delta < stored_pages * page_size / 4` to falsely evalua=
te
> to 0 and fail the test.
>=20
> Fix this by declaring zswapped and delta as signed long long and comparing
> against a signed threshold, ensuring negative deltas correctly evaluate
> to true.
>=20
> Fixes: a549f9f31561a ("selftests: cgroup: add test_zswap with no kmem byp=
ass test")
> Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
> Acked-by: Michal Koutn=FD <mkoutny@suse.com>

(The long long helper is a non-trivial change, so the ack should be
stripped on this version (unless you can convince me ;-).)

I'm afraid this bitness propagated too broadly.

The long vs long long difference is only relevant on 32b, right?
And the bit-width issue only appears because of the product, not the
values read from memory.stat [1].

I'd consider three ways forward:
a) Consolidate the helpers into one cg_read_key_s64() (same explicit size
   regardless of arch),
b) keep single arch-dependent helper and tackle product(s) only,
c) do not bother with 32b in these selftests (I have a hunch that
   they're not so relevant on such archs).

WDYT?

Michal


[1] At least the values derived from available memory, memory events
    could grow indefinitely. It's true that kernel uses explicit u64 for
    all of the entries.

--nuwu7tagmytj5izv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCapaTXBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ag6rAD9F+z0oXfuQAC+NJQ52/69
Wy9h9jBokjfFxG+tYku4HusA/A3LjZsf4+90ciLSyVy6BFPvXQx3uN958bN5VesH
mjUK
=8Zx/
-----END PGP SIGNATURE-----

--nuwu7tagmytj5izv--
