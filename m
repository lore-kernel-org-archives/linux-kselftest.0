Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190E485CD9
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669288; cv=none; b=lMjrIrVJmdQ60RgWOAIyetl6Km8ToTempci0QKh8u9baVd804+D7sreQqNm9wFwOFmjSNnDFAnZm4WWjZ6+m47sePVvPC6C70o1N4CPbIZ1Pkh8mkei82FWjIjg5feeUeHI151vYSrKb1Ld1yyGfn34cjSHUl/oadmo0oZfFPCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669288; c=relaxed/simple;
	bh=pzHvhf/kcUn1uGQQoMmmsZdAbSQgFg/DB45H52WF0/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IruUT+YQyhJ/xoOJp1Kt51SnnlAWh3GUvzSQBYa/It9WcVjRW7U6IlQfgn78vvyd96pdWYmg6eLkU5pVoUZAo1v3bfP5bG0SEVJQ1pcLqV6e4x+w7YNJri4eotZmAJrreM7Vvgj20zEW4dNQ3D7fxGtqsJsrQzmJQzmOS8+fvks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QZxxNM14; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qZsXYCQg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QZxxNM14";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qZsXYCQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787669277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6s1XusrMHrXnvzwU6UboxiHzAtGjQbneiTvP5eiCfbQ=;
	b=QZxxNM14PlXY3erNql86FCv3plRA3wi1X40oGzVVXDKGtys8SlgwbggGTlGMcAd48r8Pnv
	9hcCmWpQAq5cpNShll4q/iwA14OmhPTcAS+pEUnyMpk7WK4e+fuu/fczxzsI1YGwWV2BrS
	bLHq0bIDDBeAtn3LtSYuILYuygajLq0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-XTINgUL1NdGBJhykPe0_gw-1; Tue, 25 Aug 2026 10:47:56 -0400
X-MC-Unique: XTINgUL1NdGBJhykPe0_gw-1
X-Mimecast-MFC-AGG-ID: XTINgUL1NdGBJhykPe0_gw_1787669275
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9077b4c35c5so87259836d6.2
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787669275; x=1788274075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6s1XusrMHrXnvzwU6UboxiHzAtGjQbneiTvP5eiCfbQ=;
        b=qZsXYCQg0NcRrl7FoyWeU9aVLadAaFI5eoIdcamwsj3oq/aHNZllmiigvELzLiCzpL
         K0TjfSf/+Fdlo5+wkJc2dXQIyFKRWLta9hlLN7GLmaR77QVOoouajeRg6SWDKVNIYnWO
         dKTdm76ZRaIWWwmP1ccSTiJFapcI3SQZRzQmHx48G3XLkChevTDvHes81cPP9EUkkjs4
         2aSyZjHysL0+zJS6OgCcKF1VBRN30520Nzws+AVKQZNwOk+hvtEXPUmh/+fJhZP6gFBf
         e7MIOGBuNCwjBSAM/GQNdwz+bGT1d8WCj1ER6nLmXBDNK0bXBaoMozUalybvFbfLuQML
         pHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669275; x=1788274075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6s1XusrMHrXnvzwU6UboxiHzAtGjQbneiTvP5eiCfbQ=;
        b=QaYlgVutCLha4fYq/ik65/1/OZRPdGk1Ssq9ZUTIjt89sYs5EWqPTi6kbLn8qIV39V
         VMt4+2rlR/NeSyNZ9zoSqL1ePqOxbghMTkwiQNQWPkqPYgqDCyQ+U26Am9Hdec4+M+6M
         vzwWKJkEDt+RABHF5ZMDQqsmRLmLHxhZIafD+X7Nq56EWCyKo6OIx2E1/erqBikrfXcK
         aTjdr2wzsD8N0bJiZ2DMnJGpQh+rgty4E7WCLnDPi8o5xxm5+R6/OJXcdCWug4CnVVLL
         y1qkmxEi3Y1ZWuTu09Rx3MkisSkjLEFxhE12z+A1SiG09FFYt6BJGgssphcayz0llBVi
         l03w==
X-Forwarded-Encrypted: i=1; AHgh+RoTfY9NoytpXIEBexxw88JS0wR5Yv0qVQRVBxshU5XW+TK1xuYYMCX6jTAYno2289kr5FCcllT+1d3dVbl6q4w=@vger.kernel.org
X-Gm-Message-State: AFuF++lyM8q7voMKe4LV34XIgo6S+JPiiX43v7e498qxvDZFw33weNPX
	lePWnruFMA0PVDq3MngYDuhbi2Awm4kFbf/YPSzAquSkcUswcgCjcCjeXAqQtcNWZtrjiDarouB
	asWO35GP03JqxYBcMLHc3t87z8T0JixN3HEkHyPn+9wApYQT3kw52Ysk6wSoq63+KzS3MVA==
X-Gm-Gg: AR+sD10LwlF6OhBsChEmC3cwNAt3qXK2Z2KcwIKCs82MRMIDx+iHOnfQ05I7VKcSmzk
	+VbpvvsBecnja0MayZiNk0HLGXE7tq/JPLJgQsYKnNSM1GjMIG6tLBeiprRh/Y4lIKgOYzPD/y9
	keQ+L4Cky8cXo4iFvQ5aExc4duZUN5xsfCFI0F0zopm0xc0parv1MesS3Vu0N80LrEhDJ6ioEFQ
	23ZyidZV0a2G4QztZrBuaHHW/G/4cxBT3h/wGAmztHKFLUf3fHux7BnTU5lPnm/Ikxc8S8vdITF
	N4h+4yUN0/bZjqMlMv/i87EJmqLgV05Wiz/OZT+oAMUjAGlIH7/QhZSJm2FLxuUClu3jJJiRcJC
	BaBrV5CkMxGm0wVFmj35d1ms0B7gNJGT5Jdi11D+YDNOS
X-Received: by 2002:a05:620a:a413:10b0:936:d35d:204 with SMTP id af79cd13be357-937468b3248mr1928936385a.13.1787669275434;
        Tue, 25 Aug 2026 07:47:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a413:10b0:936:d35d:204 with SMTP id af79cd13be357-937468b3248mr1928929085a.13.1787669274849;
        Tue, 25 Aug 2026 07:47:54 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abeba9sm745605585a.3.2026.08.25.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:47:54 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:47:53 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aowHqqaqK7TeexQH@tiehlicka>

On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > CMA allocations are currently unaccounted for by cgroup memory
> > controllers. As system resources, they should fall under memcg, but CMA
> > areas partition the available space for different purposes and memcg
> > doesn't have a good representation for that.
> 
> Which CMA usecases are covered by this work? It would be also great to
> spend more time describing usecases.

We would like to offer some usage guaranties to userspace processes
ending up doing allocations in CMA.

For example, a shared CMA area is described in device-tree for an ARM64
platforms. Userspace components could then, for example, allocate from
it through the dmabuf heap, or a device or framework-specific ioctl for
that matter, to use the buffer with sensors. The dtb may have other CMA
areas described additionally that may or may not be used by that
component. In this context, we would like the ability to limit one of
the userspace component to over-allocate and choke the other(s). memcg
looked like a good fit to achieve this, albeit handling the areas, so a
cgroup has a quota in a given CMA resource.

This trails from an earlier post where we tried doing this using
dmem[1], but I was unable to reconcile the requirement for memcg
accounting[2] since from dmem I didn't have memory objects to charge nor
the guaranty there was one. Given CMA is always system memory, it looked
like a better fit to try something without dmem.

Best,

[1] https://lore.kernel.org/all/20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com/
[2] https://lore.kernel.org/all/ahB7pCu_G4vuswc0@linux.dev/

> -- 
> Michal Hocko
> SUSE Labs
> 

-- 
Eric Chanudet

