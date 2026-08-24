Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C46394785
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561904; cv=none; b=XGaNcFsMLFOajjv9npjpSxHTN8e+TMNdDN55bGkhM2xnGSF/Hw0F3unytQFqNHNTYqIjgSfxRCMUkqrlgjxQscaTb2rkJCN5chzr3FsNru7JMqIe9DAxJcZ4ogBfwpc0SesTEjeqhpVJpOVDhOUfCbMekjswNLvJZkQj5DfM7pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561904; c=relaxed/simple;
	bh=k52Sj14Jj+NVrAXLRzqT3/I8Ww3yjqE9TM1mqYo0HcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kER0GjxNYc+KaWUafhWTVh/FM4alVs+ASKA/NCcIpEh3qGj4lcX0sViZxS5ucon/vJEt0EdIONNxWyPusPUIftGfGkMphrXZ26ElQSNhopYaJiDUpCKlLBfcpby0tl1y4W+LvqrLLalUaNnlSuZifAJcuIYapMcVAFrhUn1s8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gNcLNJxF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gNcLNJxF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so5478494a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787561901; x=1788166701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qn4kqe1cwjM1TB4a/1ctVx91SSia6iTv/sEyLh8sQjg=;
        b=gNcLNJxF+vPOU87prp5xTBI3gZ5Ki9Bvka9JSdrQV8a4QAagPtULIl0+Iv19AQsy2V
         lcC+WM4JDQUPWxZ7OXMRe/SPgI6Hd/ZOXsQFi0DL6eqUnTobjo4T7dUn0jsVakoaD1N6
         BrwUE9Qhre4FqJRlTOdAPwIxivBOY2PtRD2YV+VGCE3d5V9iWZ8STdVXuvYnMUKO+xbS
         1KntjIM8t2kbPQyvZKqL6NsnOkqh+Aevs8RLO2p65cXWqoTAbF5uOklFNGFSDCmS6/P0
         a4MxTRaR9R9nodO3FOX3pbUq31eyJ41zVIkvyo8ES8XAo5JlGBFWWRXyU8dFlJEaPfPd
         ZQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561901; x=1788166701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qn4kqe1cwjM1TB4a/1ctVx91SSia6iTv/sEyLh8sQjg=;
        b=UKMtrHAbiSpLBF7SObxwsF1gJzdrQdiOlSGoe9nlWAUSfNsB+Jitro/sSYYV51VrsG
         LMnbucug9rsu651uNz7UM2K38NGgqmO9HpWGEkC4lYd2nyKt/Mr0HFJsrwHRHH92Eygo
         SeykUxfWXMJaKcMYoHeGbdypS2qbRa+gtJxBELX7A7CWd+JiVGdeTN8Gjr7+CTuyMNBe
         3kxwO3q6zo5ktNufJ7Mw9zmR6OZER7yawHVcC4WNVEq/zT/RJG5aOgudgjOWtNHcjdVY
         CEC0I0cNci54q/2qu4Ehyv79l/cm+3PLDkAVTIX8Cmp7/3OqxWwtclE6IQ7zb9AuXvvd
         bSIA==
X-Forwarded-Encrypted: i=1; AHgh+RqNTbZGIWaq2+k1TRxcHkY3K+o0Wli062qmv9AaGhQLE2Cyc1ybHG2MLtc/Cpoqv6OSxmL33gXsjvMG+rvQwkE=@vger.kernel.org
X-Gm-Message-State: AFuF++km7sWPLvs9jZMmWUSdESSUuKjFfYh1YT8QeHFgI7IgKgjFF8ms
	ckBzUwOhVkkz7XPP6emXAIAoWVRfVktHc0nT2pbJQ7bfQBORrGUNNlPYZVCXBWqK+xY=
X-Gm-Gg: AR+sD12P8AYj66XpPOy6Yg6wL/8C2Sf3EcNqiPFblLCGQAPHDCTCwJB5pkGJ0AcNT2G
	hNHVUfFYj9tY6Bsj/NeCLOkMIKyX5RSxmKDA3a4KhHUlnPg3LhDEeTV6rhLqa5iYgbmBZtWZfrQ
	TcalYTgmE6hkkK4d4uDNxSaYK/ez2VwJUhugHHQLCe/ih2imLdwQPcWmKRLyDspxjzuzXh6ITOw
	4sGHo2OAlg9w6bvm5CTF68rSPp8MzQrcBCB+VTnVIu7RouzyBjXF7a6Kkh5XdwBBd28RHSFPE/A
	vgWhXaQ7KmxqwS+zD3aioxzbmYwj8+4d9hNlyU0ARiX2lnCYzEjyldlM7Fxoud9UpVUjofqdBz6
	lTq+peeDyg1cxpTyip/If7h4w+ZPsX1AXxrLYExQXUQJfDCYHYHkJFR0rFFArjbJyDENS+xdUfW
	rOBP9tF90F3a1Zxju8ifNQLjzprlZOJEuvvLej7j8BKF6nIZSUsmuSYYPpII4TR0+sR1cOhxDXh
	XCYX+cVcB+C
X-Received: by 2002:a05:6402:2187:b0:6a3:905b:3c40 with SMTP id 4fb4d7f45d1cf-6a42f1d0649mr28255228a12.8.1787561901277;
        Mon, 24 Aug 2026 01:58:21 -0700 (PDT)
Received: from localhost (109-81-81-112.rct.o2.cz. [109.81.81.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e02a8fbsm10819638a12.13.2026.08.24.01.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:58:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:58:18 +0200
From: Michal Hocko <mhocko@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <aowHqqaqK7TeexQH@tiehlicka>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>

On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> CMA allocations are currently unaccounted for by cgroup memory
> controllers. As system resources, they should fall under memcg, but CMA
> areas partition the available space for different purposes and memcg
> doesn't have a good representation for that.

Which CMA usecases are covered by this work? It would be also great to
spend more time describing usecases.
-- 
Michal Hocko
SUSE Labs
