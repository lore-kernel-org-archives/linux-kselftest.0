Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F253E92B9
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577540; cv=none; b=pYQjl1oWXzhDFp0ze14TPJtR3Ts52wBdk9megLY7K0uyTNMsdZ6za1ATTxSZCIFDsJGBLzF+601b5VaXNrje6o9Mo38/lPNZA5eSZ7eNYkbI+zOKWcptRjh9ZxqsTBwZrQxY3ejuAuIXT4+ginngxHaUpOyFTD8OpqJrtxT20YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577540; c=relaxed/simple;
	bh=8RHTXuRYUUKOJBcAw84Ji+ZmzZO1dHfvXXjiERNb6fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUYVFL5WVsF09wKZaeoXuvOUpMMHSA3qBEHeK1zU1w3eDkBrNeCul21LXe2eirrj3y8dff+ds21D3GK5H5JFY956J+VBGr86yFXtr/wUnMf9djoIHMDgFHu15MoZ1EQJP4KrcweGAAOMcZFZDcYyoraf5e+u73FzN0ARbUFQ6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HYA6NXXn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HYA6NXXn"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15e592da74so481103166b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787577537; x=1788182337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8RHTXuRYUUKOJBcAw84Ji+ZmzZO1dHfvXXjiERNb6fU=;
        b=HYA6NXXn3PEP73gl9xwOatTV4UNwR8HC3CjDK8MSZLjph6rsc73XvL1E+XYSzBcTHS
         Yrutpl70LJzJJx0PghEGd6IJQBNfRj+bJ/G+EnbKN9kWRR1mAA+mKWe3rPh1UDanYxTu
         ecaMIl9ehCR8ERg1UjQru/RzLHNX01/lMrfWR/Xx4v/UnaZr/RdsGrQGHroQly/aJ/hw
         cBYv0JcTyQbv62/s5ZOBlvHs4oca1S282N4U+AM4BftCtmb00B+3KFxBrvAnGmWCG+85
         eqR50CM74PHXanyzjiuywr8lI/5aOCB3Bqdk3pMFaly+oxbh6jycL0IL/FVgRsvGQgXe
         uyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577537; x=1788182337;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RHTXuRYUUKOJBcAw84Ji+ZmzZO1dHfvXXjiERNb6fU=;
        b=dg0ATiEz07sw8T8a8+afqx6JpPiZXUno1qcClVNmnmVrqhEN3QcNOPcaYRqMc4mCB/
         gWvR4Hvk4trLppdHLtRooOjs2Y50O9rwBlC/rNNzTLkoi5RCIjiDd53maBhCZF8kIH6X
         k7W9BziMvSansb0R+TksejL18EThm4jd4gErz/jlBgirRDi+dVPd2q8r6MVVwxkQ0Atk
         5mBrK+mW2lvXeIlraNAgmqq7Ff+Bm9+FQxoxYTw4+2RqiiW6mHQ/ZejA4Ndils0VsITC
         tioq/yWFYB8r2Xt1Bsex1myY3/37OVUNDVZVOTXwTqxgXsbkoIcoq7tMsipuFmAMhUyK
         lxFA==
X-Forwarded-Encrypted: i=1; AHgh+RpmmfLPE7GGmHMPuAnd+KH6gxswHpXEwU07EkYVKJnCoUU1d2Q6yi88ZXkdsMPKoKD9z4XDlTsS61nz3xB/Ehc=@vger.kernel.org
X-Gm-Message-State: AFuF++k8vT1vaMWiyaXasZbw/p6ydXN4qByEFGSfX6Os8K5ncJvYO3Jn
	IgwiomzPSmmd70fkecPEOqEYUlVq150j+iQibbDvym7dyKlwRhkHHbHPZeWs3+yv0+c=
X-Gm-Gg: AR+sD111zQSPlm0UWmrEqeQyEanLDR7LXKipHpAVinJnCNZ56VsvjM5kF8t7j931Qv5
	9A0OCAxv+CaVyfiGLlhd35qrYe3H8AW80Lvz4Ds4zadTVLf0pLh5IsLolNitYFEWD3Om9F40nVW
	bknF6H0UYoAVr01N6bS/lJwCUlicGyyd/4L4Xl11fT9bHntbbMaMuFGiNGMpQtFRC86ms3prQg3
	sSKBfYBBREuDEfHJrbjPkIyWoHZQB6DNVGzY1cOo0pC1rNBN2CvjEnK9BUJY0GXogT200oEbvfd
	Mj1s6ua5Xfo4j6adTq9eBZgPyNsg/gTqdcJDFvkqYIRXq11bp9O2sFoiv9YY7lxuwHXQ5rhhJ2s
	tznA5FyCDEWg+mQtHB3Zsa3Tekoh+2LdAU/sgVFC2qXWMHUKLLk/l/+27kyGisbZ04hmBSBm824
	WBEO7qk4uO/4cXWmX8k5lwoWBmIC3bhGsrgfEB0YA7tI3FexO4YciIiKLlRi0ppQs=
X-Received: by 2002:a17:907:72c3:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c249238c382mr2130827666b.2.1787577537181;
        Mon, 24 Aug 2026 06:18:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24dfd91dd4sm20165366b.16.2026.08.24.06.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:18:56 -0700 (PDT)
Date: Mon, 24 Aug 2026 15:18:54 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <aoxEGzZ1eVzIU8xH@localhost.localdomain>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4jd5dcmb4dfal7fx"
Content-Disposition: inline
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>


--4jd5dcmb4dfal7fx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
MIME-Version: 1.0

Hi Eric.

On Fri, Aug 21, 2026 at 02:56:52PM -0400, Eric Chanudet <echanude@redhat.com> wrote:
> Finally register the per-area usage counters in the cgroupfs. Each CMA
> area creates a memory.cma.<area>.{current,max} pair for reporting and
> limitation for each area.

These areas quite resemble dmem regions.
What is the relation to the previous dmem double-charging [1]?
(Successor, alternative,...)

Thanks,
Michal

--4jd5dcmb4dfal7fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaoxEuhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ai6WwEAt6IhJ1j5eKMrYIQuXx6H
vcVhIKJYy4uCLIiKXOf6/zMA/jVVm1UxH8BKR0Myu49nuRzoWqbLCU9ie1WLGOPG
nZIA
=+xTm
-----END PGP SIGNATURE-----

--4jd5dcmb4dfal7fx--
