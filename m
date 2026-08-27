Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766B47277C
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837322; cv=none; b=eaCGL8vEeCHo66AzWzfgpxP96mke66mmTbt6q/3CrkMh/UQgfu0cKmr2vDF0XiZ6PBj2n1H+n2Nbuzp7H82nGPXZ1QoJXGiMAQxhrvCYLsgXH2Z+If002jg/oU7VmbEq0av3kZjeJuk2zLUvAwk4QwYr45RC0fuuIOdSS2HK1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837322; c=relaxed/simple;
	bh=faP9ygWQlSRIrFbk7BiUYjG/H8pEcJDzSB8VBBaM9e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ts9/LFBW1E31B6/TvFxTJsEVDcD4oNSX/TD6UORbq1y23wrPR7Fz6zVA/bDfz+35FPg1r3h11iBWAkKMU1SyS59usOY+eRShFG1nWP2MyXr7hEDNeA/gV6UsWkTdXzw62vURLk6KRmJAwxIHyUdtV74wEErXHsMO63PmlegV8nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFjx7W+N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WdmAbWsY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFjx7W+N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WdmAbWsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787837312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=faP9ygWQlSRIrFbk7BiUYjG/H8pEcJDzSB8VBBaM9e4=;
	b=UFjx7W+Nzgw+F9dQbWFlYTkPcd4FFBNj8MWDtnu34GOurf3299hPY7M2IhUSm6aC+uocjL
	x/eDYNPYHNflijudpD2FtJ/kvyjcyG1DBWmcZ/vy5prjklcnfphcDwf0Z7XUwNzEyTiGcF
	4xEJNpGcDrhxPj3tGBo19cmt5WiaZCk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Kgp3098nOSyZE1YhnwXMvg-1; Thu, 27 Aug 2026 09:28:28 -0400
X-MC-Unique: Kgp3098nOSyZE1YhnwXMvg-1
X-Mimecast-MFC-AGG-ID: Kgp3098nOSyZE1YhnwXMvg_1787837307
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f4bff865cso1052102f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787837307; x=1788442107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faP9ygWQlSRIrFbk7BiUYjG/H8pEcJDzSB8VBBaM9e4=;
        b=WdmAbWsYA9GBmKEovs2NOouKO5Ogd+yVS7DT81BhxNWkpV9CqFCIkEHDSewYENMjIw
         IY5OYnSrZP7YR/GOgoIJceJG9LQ9CElhIFcXoBzfRiBoMPGsmYNZIn9//jOHkzk9/h0e
         ikF7DGyLrpunJwO7zXBLgiunqbsOAhreY5KhWfeRNEAe7RL8+9h9J/Ar5LpqJFvD1tVW
         8SOXD2c4CuiL2C/gCGxpXasj8vlCcG4t6t3AsftLpABpujJanTCeGE5s9yZ2AF65LdVT
         hrCshIkU+gh7mygO20V4z46H+/AKBMk3juktoW1UUvWVozLW93SC/zLgvHhsbxSYgXjl
         v39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787837307; x=1788442107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faP9ygWQlSRIrFbk7BiUYjG/H8pEcJDzSB8VBBaM9e4=;
        b=Tq1h0Lz23GDjYP9K9wkMIa9agiQYIwzsGk08PzXOSvLza1o9jL7cNuynnvJNeyqWG3
         gGHRaZwFBtK3+OU7+9Z4gj56cxU5Yysjf4iZcNVIwjsfcSOJmvBh6XdZOFiF4nfLExq+
         EN4+W4+Y18AcBJ+c6Itk1EabNQn8fQfVXQAeXCcMIer+qFyry/oSPpoo2mFQ6F+o35a2
         DEOgwQ5e2IV/MJ9hbWN+qXTQzCDQ7p1MU6p8Rlj53bpUmXoMS3W91lj9nXKa8s3iaxY3
         AyVa9T85QLqZVsRq2qrH+m9VyKXWtZSKyR0CKSNoxZwXgjlpxt75J8vnp7GyTe+IzjHo
         GJWA==
X-Forwarded-Encrypted: i=1; AHgh+Rrp9uMyba/HICuGBdiRdw51blWIM6n2FozvLaHV9UsJYJYiMOQgT/vzTPFr0G6xyD0jswbRHdZr58TLu6qOHOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nI5KlDIL+xN0GN6rTvP9JjOhCDbFTr2rUwDht0m6retYSEyfcI
	YJGdmpS4CHjEYGcScEvHPgip13sLsWr9zZ+mkTTF1f58Lp1ogjZ/5Mk5NoCYEYs2lAGaOER4O1v
	tXYoVBs4aVjdcNJN/RumEbul4JDiR3vdpuKdhV39d6VQWnrNDVNVAOXtMKtSLW80FcNZtMQ==
X-Gm-Gg: AR+sD12Ha+J4ch47UIEyt87TWvw9nAKHA9+7BLlW5ufOfQrUBxM03Cdk8aVKfxqT+vA
	TukULvfyUWqteaphtsQTOe6cIZLFINnPukj2BFVPxX+f3fuZrm+IDiR20MlpWczSpJm87m1cJXX
	Kf0U0/D5x4SZLsSr7ApUrlMlDcw0vt0shg889/JLZuoZJYQE3+yYfulXheA4ARTbOOUpWi0RJb4
	bmKEa3/nkBuMo5jD+EtUf58QjyvN2WGBDy9kn4rOWz+1bDN/zihECq/OUO/PJ3EYnRmQrKTlcnt
	ySxYL3UMkCUkXT8rZDhpf6rA+jTBK7f5ga39+Xkr5RUst0I78DIf6D78w7rLgUaG4Grn2YdG7A=
	=
X-Received: by 2002:a05:6000:29ce:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482e26c3ff0mr15609411f8f.17.1787837306970;
        Thu, 27 Aug 2026 06:28:26 -0700 (PDT)
X-Received: by 2002:a05:6000:29ce:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482e26c3ff0mr15609319f8f.17.1787837306492;
        Thu, 27 Aug 2026 06:28:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:ca7f:54ff:fe01:374c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb1csm9177838f8f.4.2026.08.27.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:28:25 -0700 (PDT)
Date: Thu, 27 Aug 2026 15:28:23 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <20260826-brave-nyala-of-elevation-d23aea@houat>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao2t6HP-Zt5KDg30@tiehlicka>
 <ao3UKM5SbxBmxuR0@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao3quaSze8YjPjxZ@tiehlicka>
 <ao3tFg4JLNlbylTR@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao6eC2SUIGVz3Qct@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yiahqkhps5b233tk"
Content-Disposition: inline
In-Reply-To: <ao6eC2SUIGVz3Qct@tiehlicka>


--yiahqkhps5b233tk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
MIME-Version: 1.0

On Wed, Aug 26, 2026 at 10:04:27AM +0200, Michal Hocko wrote:
> > > You cannot really assume usecase, requirements, lifetime etc. for an
> > > arbitrary cma area. I do not think this is a viable way forward. Focus
> > > on your real usecase, which seems to be dmabufs.
> >=20
> > While dmabufs are indeed my main use case, they are quite generic and
> > may not always have system memory backing them (device memory). Working
> > at the CMA allocator alleviated these disparities.
> >=20
> > > Explain what do you want to achieve and then we can think whether mem=
cg
> > > is the right model for that usecase
> >=20
> > Hopefully I expressed this in a better way by now. In short, enforce
> > usage limits for concurrent CMA users using shared CMA resources.
>=20
> Thanks. Yes this is more clear now. And it resembles hugetlb situation
> more than memcg. You simply need a memory pool specific access and usage
> control. Dispersing that to a global memcg limit seems rather coarse and=
=20
> I would say impractical. So it really calls for a per pool control with
> an understanding of how the specific pool really works.

I'm not entirely sure what you meant there, but I think we also need to
have it account in a "global" limit somewhere. Which CMA pool is backing
a CMA device allocation is pretty unpredictable and unstable across
boots, so if userspace wants to put meaningful limits somewhat
generically, we'll need some kind of catchall limit.

Maxime

--yiahqkhps5b233tk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCapA7cgAKCRAnX84Zoj2+
di1+AYCIo8KLWPYOzEwBgbqOdUgA/zgdVT/joCROq5h9TbzGRbFQcxXH7KRg+7fJ
IKAwfJkBf0pN5A/Vo2FO2QoLXkGlaXcWUBJakY9boX9YnDyDdS+4c88lV2EjJudO
EXr1S+1vDw==
=t0iU
-----END PGP SIGNATURE-----

--yiahqkhps5b233tk--

