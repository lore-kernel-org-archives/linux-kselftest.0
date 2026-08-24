Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0AB3932D3
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787609031; cv=none; b=sdTUkdcwSYVIYuQOGvVrKlay1B+sj7ogI/MOQn74RWUE1fBgxH92GSupaWhzRrMdg8AeMWue+lxgFO5EblhEfnkjHUAaRIVvcq/F+SyXHL/TKZCT/wNvSF6CJrn1N/Ur1MupMjKY2G0I3zVe6A7V9M79YLhfVYOHLl4wKkJwlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787609031; c=relaxed/simple;
	bh=XUlYpvur5uBDwUWOp+VgOQbpBxzGWFt/Fy1ep+LAqUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEwrUXKzrPaaUawSyNrbfuSI9JMYWtgxLFqd+h8isUdmIY6iVY7Rba6+ObDVir0OIClIc7Q1DM8AIMNxpu/ShsO1bvohyR6MwjAHcNTomNVQqFJSasTLIKnypgJNpdng8ZIw4mpxQO6K3Rop8wExQkJFOJ+VEgl2nRhN8B9vSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gJhUjLaz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKniA9nC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJhUjLaz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKniA9nC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787609028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P6umSLzif7YwA3wBurX01NBnFBatASw3o1QKXhBN6wY=;
	b=gJhUjLazEm01Rhsj48P+ZmdpjUJMLIxyfzHpZC0+dCeH5ZP/I4kKeXOYkRlh80A8OrAUVS
	sGpZPSigzDAzk/jOD1JOjdOlFYqFpGOp8x2MOuFX+xQSigCsGoj5emChEq1tRKfUucGi5T
	+db3vU3BmqxcCZHGKsvcCdT+MQARidA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-kgeNp6tLOB-DkyOwZU2qYA-1; Mon, 24 Aug 2026 18:03:46 -0400
X-MC-Unique: kgeNp6tLOB-DkyOwZU2qYA-1
X-Mimecast-MFC-AGG-ID: kgeNp6tLOB-DkyOwZU2qYA_1787609025
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so2513331cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 15:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787609025; x=1788213825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P6umSLzif7YwA3wBurX01NBnFBatASw3o1QKXhBN6wY=;
        b=SKniA9nCCYTBx3P3sxWLmiIYGmJM6YH3JvyOpTC4CWVp0fgPq4ei2nIzHBHvR2Bz63
         +yTp0ONLi9X/CfnOCXVkUN1jovnK3vyeFdl9iwmNOlE8mgy7Tsgid386Z3/9J1Z35qIU
         riLX9HfWPqYdjTQBGtewflFrZ6jWEAZmjiBcELvpTpYMWgPoZfQqJ4lhR/G1V9szp80Y
         88eepWCaWE3axvzMSbP9B0FymOuan0/7a8awEp7K3tPIWB9OcDEVTwn9o5ocenz3rcjW
         xTm+y52t7HKy2988uQii+YAVnbO6A+auNxlmCqlCKBowCUEeWlCsWQI7NRXv+KK/51oW
         6ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787609025; x=1788213825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6umSLzif7YwA3wBurX01NBnFBatASw3o1QKXhBN6wY=;
        b=SKvWAM4DG2TysPaSK3XYBtqP7ucsW9zupxKRtnWrOq5+mvOym8tF97OdtaScAU9IMN
         OM8r8ZtwtLkLmWnf7ifsNCzrP+01ZmQJi4nO8m/jsRICpThxQ+WP+9act8HXfTc8OfcR
         +D4pBf4OQfp+yNZZ9Llq6ohmLMrIw1QtdvsYSkOFnqF7q8kxcvsmCrGUvN3O3f+6PBmL
         W1VoxzCkXaMsMMx1k74/e73aomb06gpZp/A92ovJFkDwaUCpLgMM/CC2ZIVBx9FAwgbS
         9aR55JyBEboFcVlWsxwTM3WJ/zlEHnBlPFjA9zHhim08uGV5dYsFJMTxzImeDdpCGvNM
         Dvww==
X-Forwarded-Encrypted: i=1; AHgh+RoJcu1rzptqoviVzH/EE6obYBKc2kgERqeIq5hxa1s5gI8kfGNn+gla0h4qKM25Ft29IlSrv4bT18MDDQhnLqM=@vger.kernel.org
X-Gm-Message-State: AFuF++m9rFihol/acNRoooJN0IlPexfiXRKxCi2jAISrAP/5Rcop4PM0
	jcrYyxjxcA0CDROOI80ecpwmAo/IpshLWZJWx1HKMcFKgtK6H2jIznPjbsSaV3W/FLsRbM1sSRF
	d5C+C4u/64w68B4qHmMvqJIX5NuEI9V9JpU+fDYM5x710hQLDJbxkNKQ+qZOSVCZLCUiWYg==
X-Gm-Gg: AR+sD13xaM6aE9da6rQxC6w76LA8Qos1+yA/ThanBqxY+KoSvtCtWFlpmSZVkWhsP7P
	xlHg/Vf/fG0z8Vc5tWvMTpvR2RUptYCoFF0s5Bp6SEy3lkA9MF2yAFty6Rk0Oa2ehij38VyyA59
	hlRujBpKU6nCl5WKbcqRuU5pDvzoH0N1RxNYHoRzVTcQYl2N6O3qPT7TvDZLzDw3ezw+y1H0tE5
	1IXbOEb6NXUDuzBYqDp21FwpqsMwklKhv9XefTRkMXbNubq4NbJvinS7RY6y4IpBqKjtmiGLc9X
	Rm7Qp581ete766IPEcx/siy2B/Pyd8od9+t/f9rtQOaa9fPcW+4UkK0jz85i6iaBj4bV/6604+/
	FZFDODXQsX1YrkK+Q8pCbjkfgRIUZyGCOjkGenGaiQz80
X-Received: by 2002:ac8:59d1:0:b0:52e:125b:9444 with SMTP id d75a77b69052e-52e2ed0710dmr27174961cf.17.1787609025456;
        Mon, 24 Aug 2026 15:03:45 -0700 (PDT)
X-Received: by 2002:ac8:59d1:0:b0:52e:125b:9444 with SMTP id d75a77b69052e-52e2ed0710dmr27173851cf.17.1787609024921;
        Mon, 24 Aug 2026 15:03:44 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a81392sm71344616d6.42.2026.08.24.15.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 15:03:43 -0700 (PDT)
Date: Mon, 24 Aug 2026 18:03:43 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 03/11] cgroup: add memory_cma_accounting mount option
Message-ID: <aoy5n82tN7PynPVf@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <20260821-cma-memcg-regions-v1-3-d21b165b8440@redhat.com>
 <20260824-poised-meaty-shellfish-9a09d2@houat>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-poised-meaty-shellfish-9a09d2@houat>

On Mon, Aug 24, 2026 at 09:02:30AM +0200, Maxime Ripard wrote:
> On Fri, Aug 21, 2026 at 02:56:55PM -0400, Eric Chanudet wrote:
> > Add a cgroup v2 mount option that will be used later in this series to
> > enable CMA memory accounting under memcg.
> > 
> > The option is made opt-in as it will charge allocations to the cgroup's
> > overall memory usage, which changes existing expectations.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  Documentation/admin-guide/cgroup-v2.rst | 20 ++++++++++++++++++++
> >  include/linux/cgroup-defs.h             |  5 +++++
> >  kernel/cgroup/cgroup.c                  | 15 ++++++++++++++-
> >  3 files changed, 39 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> > index aed195a71cbf..3dfc13f31a0c 100644
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > @@ -246,6 +246,26 @@ cgroup v2 currently supports the following mount options.
> >            will not be tracked by the memory controller (even if cgroup
> >            v2 is remounted later on).
> >  
> > +  memory_cma_accounting
> > +        Count CMA memory usage towards the cgroup's overall memory usage for
> > +        the memory controller, and expose per-CMA-area usage counters. This
> > +        behavior is opt-in, so as to not cause regression on existing setups.
> > +
> > +        A few caveats to keep in mind:
> > +
> > +        * CMA areas are reserved at boot time, memory is only charged to a
> > +          cgroup when a CMA allocation is performed on its behalf.
> > +        * CMA pages allocated while this option is not enabled will not be
> > +          tracked by the memory controller, even if cgroup v2 is remounted
> > +          later on with this option. Charges happen at allocation.
> 
> And what would happen if it's the other way around, ie mounted with this
> option enabled, then remounted with the option disabled?

I meant for it to have no more charge issued until remounted with the
option enabled. Pages that have been charged are uncharged when
released, even if memory_cma_accounting is disabled after the charge is
issued. In this version, it is broken[1].

I extended the documentation line with the fix for a potential v2.

[1]https://lore.kernel.org/sashiko-reviews/aoi_OHVZjsY9a9VV@echanude-thinkpadx1carbongen13.rmtusma.csb/

-- 
Eric Chanudet

