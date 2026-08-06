Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5A40A942
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005202; cv=none; b=RGjD0X9kIzEJDxNGlzcNv8DUgzce8MeVgjG0U6TSGwsIxL/wPoWAouajI+CdNU3oiRolwgt1be0obDHMfsah3D7YU7LOvL91hEoqBVTXG4+p50TKqLMZmV53I/MhWBI3E15KAEW7MDy5aFYv37UjNEPeqfDa+k2cVygPAjY1IME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005202; c=relaxed/simple;
	bh=t9Gl+KvbLP+Re9xfzY/QhaWSjt8UCM1wwMDQL1wGKFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEiaH8j1WlYBaAQ+Hp4JYhfusq3zKP4cR9pX+P9ndgu58qAU4nhXDU2zGWLkIhDvLX2vjgFMrrn3ati1Dydj/1zRRwcxi8J4PgD5dWJeGLjfjyQ8w19FfGB0oskioAOnRhSPcdxx5RSAfWbcGjmNwmu7anXLbTVldOKz9IHYEJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OhPjyoWH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OhPjyoWH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso12612205e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786005194; x=1786609994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kbwwwq24L3XnIIcYVbUsKDAVnxBveSW3by8s7kuBsxU=;
        b=OhPjyoWHS/0Wwb06Lc4goVLBj/42f39ti2gAJ0m0epf2OJOIVRKromw+YYRrjJH7y6
         7kyWeG5WpInyKusp7UuQecU9TvfAixM3JcQ5yXRAtzWkr0/rCaFy6V74NXmtroThjlsa
         Yy8+lns0FmXc1+TFX64kOEPAknFkL2NgbOd3CAdTWr7kdcHWGm7TQXEH/pzYbZc3FJjZ
         /mXYCEGCUF+tKgRJKL/cF6j9o6RbaPKwOME2FYw6d9Akfz9EAVMVPv1AY/Yr47037MVA
         hJnCLg8eaLdFJkF/zSjg0wUvaTweHRHN1aL2rOmUhChZR/Z5xHF43covoprYmizRrHfk
         V7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005194; x=1786609994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbwwwq24L3XnIIcYVbUsKDAVnxBveSW3by8s7kuBsxU=;
        b=WiMrQW6s1P6D4rQlc93qUeHF9tFce62nrJBNbVSWuemeL/G8jf3SLuSfzbbtTHDbDY
         Vm+lDeGmSc4yubnMUONX/Xd2obokS5m0oKOIcVg291Kb7VJJ6LQYDuIeGRdAUdxDCCFA
         WOOLgRHjVU2BgWlfMN8oanRw/rGUsYoOYe0qPINoEX5iaO6zPCIAlkOQxpDEoBReprhj
         i5XQbAjnSERWff0Er83TM+M/B6IbuKkeff3HFlCLPIxJ59c4HeVFq5N+PfLBDqHgvhAH
         D79jb/rUAf8Q/UvplVmcJNIt123CkKknPB5Y93dVRoR0BkNdhPSg76wyuPZxZ225DkzK
         7YGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/ya4sWVxhigEODBeeqJ8J6gXxlLtDwvYWLic6HKd1tprr8KWu73bd4vTgC5hGJGtXbEf8LLvw7wItCC6+BNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjmHlhmxAJIhb+J2iEKME2je7zEWvaMgdOkToHdZSsWt4W8I9
	dbSQdacSnBWcrWZHuS9PF6GQAHtu2x2qs76HKLirikEHS9Ly02AJ87N5AH67TfrQDMs=
X-Gm-Gg: AR+sD11NZEvXg4q8cwqot+250ZZb28rQTMA1+JutOdk0HSGqus++SVK8Xz8SKyP44VB
	DPV3I/NaKxQ7TYQJD3GUeVe99xG46OiY8RJj5GDbWLSRUidbl9cEJf1az0yRukY+sLiUZjq6I/x
	lLPHAcDcZd2KUm+if3yYgvGHs7l9Yhu2jLqPbl3h/FnwvwCrv07R2WOsHRSJP/n4Rih09aVQJdu
	92moiiagWN2DjxjIT4Wxw1GcxeQuR5ra67X52HgWpxK0+z+VAH0dtVQYcqCxD24BT9+pWwHS9dJ
	WoAplZ02BngFmmFazfk+7geNDMM8u5ouNgmUTOIhONwi9wHA9B2Xr1xhFVvVlCyhaKKZPpi3xD6
	vXzJ5rHppQXzPk86KDfUly39DM4USN41Z0DkCqCBDd4XixcalT+1K+sjFVDPBJUxLmJ1taRG4rn
	x9n5OneU235hMKmyzXP1nnfxaLlSjw7M3Tu4mHgJdTLV2zR8vHeDSaOVoFQPonmf1NXHlRAO/ZX
	zs=
X-Received: by 2002:a05:600c:4688:b0:495:6bc9:62b0 with SMTP id 5b1f17b1804b1-4994e7d1487mr163017845e9.17.1786005194371;
        Thu, 06 Aug 2026 01:33:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542858b2sm48595955e9.14.2026.08.06.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:33:13 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:33:12 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Wilson Felipe Pereira <wfelipe@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/cgroup: test_zswap: retry subtree_control
 write on EBUSY in test_zswap_writeback
Message-ID: <anRBETN6znndbjyr@localhost.localdomain>
References: <20260804042053.56940-1-wfelipe@google.com>
 <20260804042053.56940-2-wfelipe@google.com>
 <CAO9r8zM9H8iMOE2FE-H47CMUAExf3VcCf04anT=_Ja=m=sbr4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nas2iww3rivojx2z"
Content-Disposition: inline
In-Reply-To: <CAO9r8zM9H8iMOE2FE-H47CMUAExf3VcCf04anT=_Ja=m=sbr4g@mail.gmail.com>


--nas2iww3rivojx2z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] selftests/cgroup: test_zswap: retry subtree_control
 write on EBUSY in test_zswap_writeback
MIME-Version: 1.0

On Mon, Aug 03, 2026 at 11:39:14PM -0700, Yosry Ahmed <yosry@kernel.org> wr=
ote:
> > diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testin=
g/selftests/cgroup/test_zswap.c
> > index 49b36ee791606..312d51887a1d8 100644
> > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > @@ -407,8 +407,11 @@ static int test_zswap_writeback(const char *root, =
bool wb)
> >          * Thus, the parent's setting shall be what's in effect. */
> >         if (cg_write(test_group, "memory.zswap.max", "max"))
> >                 goto out;
> > -       if (cg_write(test_group, "cgroup.subtree_control", "+memory"))
> > -               goto out;
> > +       while (cg_write(test_group, "cgroup.subtree_control", "+memory"=
)) {
> > +               if (errno !=3D EBUSY)
> > +                       goto out;
> > +               usleep(1000);
> > +       }
>=20
> I would honestly rather create a new cgroup here instead of reusing
> the leaf cgroup as a parent, to avoid any subtleties like this in the
> future, or even split test_zswap_writeback() into two test cases. I
> don't feel strongly though if others think the simple wait here is
> enough.

I somewhat agree, I'm not sure whether the recycling brings any signal
to the test.

In the case, the recycling and (re-)enablement is needed, I'd suggest an
explicit check for emptiness, the best of utils arsenal seems:
	cg_read_strcmp_wait(test_cgroup, "cgroup.events", "populated 0\n")

Thanks,
Michal

--nas2iww3rivojx2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCanRGxBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgPAAEAnkONm5a6/QU81n89rmaO
gX8APeieENGJZExlGWvR9vIBAIX33lBPb1rWjVE6b1pdC7aLDpHTt2AoQfLJFbmA
yzkN
=sJQx
-----END PGP SIGNATURE-----

--nas2iww3rivojx2z--
