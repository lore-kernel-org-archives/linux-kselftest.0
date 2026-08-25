Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8F448381A
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669677; cv=none; b=bD91TEtk3H8KtwaY/Rid3L4nmXeSLAOH9jyT4JgBK3xncCzKhHJ3zbaBYZTNNV199jFX08B1VpPnoK+kFklpPwalPbZ2LtytLfncLgHo0VakHm5ieyAin5UQJSoUKa6IMRR8XSEVEzJ7KsqFiJulgJVOZOqAU75dXMQJXMKv8V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669677; c=relaxed/simple;
	bh=zwUVJRPwaRqENGbYEecI9EZN1Ls2VD+gRIwnQhAVUYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDQ2M/dKvs9oVjdh6n8tU0n4IHU8jFSt0+8LjfpFsAREGoGSBxNYOotgHJhEYTLLfwWvLYnJ9C2Vpke4tCUhbnTmbIAI9WfQbPDBt4ic2HKxS/GXW1qroy0DZbA7KJMbtSSBa95B9dF9KwxU8TC/VI0XkMqPCGiuhDe+HfiQB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQ1zw6pC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o91fCOG3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQ1zw6pC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o91fCOG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787669670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2GckowvKcKSZKNqS6mM8Rx6dNZPUZzNliQME9DsHgsg=;
	b=BQ1zw6pCFF/cPq0HS56lnLknJWOMdAImS2r6HZhJSvY/ZqxXP4sC5DOP/y+79AM37dNZyJ
	S5S2ZbZfefu2i7YiV3KAgZzaHu4vfGhzub33tsKCitXzGMMLc/bDI2CoNBa5vzc+SteXRB
	DAo10R7vFq9goWVGER/AUQlbu7QKuYg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-2vLaA4gPPyuMWAZEutkH8A-1; Tue, 25 Aug 2026 10:54:27 -0400
X-MC-Unique: 2vLaA4gPPyuMWAZEutkH8A-1
X-Mimecast-MFC-AGG-ID: 2vLaA4gPPyuMWAZEutkH8A_1787669667
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cc2675ae5so3558606d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787669667; x=1788274467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GckowvKcKSZKNqS6mM8Rx6dNZPUZzNliQME9DsHgsg=;
        b=o91fCOG3kJFbBAD564MDlenbKozQD3/VX9LsYdwCX6bSbJHxEYDzTQgfEMqBQIEism
         kv6MVxcLap7hVn8d6XlTv5MvWWMoCz+3nKn7LwQeu52wP8ohwuxaqhOD9UdTrEuAJp15
         mFq/ztI+4CE/HrE/LCcO7rgdFHLazgkjLsQIPlCBCVaNHAIJWyaqqT6yYWFbhZI8il+T
         QTURnzVB4jIny840BSolVdta2e15vR5F+dOEmZ13zARPmrQIpBRv9Jih6Xw7LmW8Os2/
         E3zX8VWzsJWrxCSWpmIl1NTNqdRLBi+vIrwf4VcrvrmsAvljIFKstzPeob+TYhExHh2r
         g6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669667; x=1788274467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2GckowvKcKSZKNqS6mM8Rx6dNZPUZzNliQME9DsHgsg=;
        b=GrXoJ4+oN8xd0ag/7SbROFevrtr/VhC+Di2zy7TmVGffNjpQogqWZN3CKdZNpB9/xT
         91WFUAaHr1Znl3VJY5LySlCIoL1uvlcw2WmCL35O3uwJjr8Wke9lwuGtc6dku4FIewuj
         pMQcYi/U56bEer+VujfQUF3/HWJxUujX3DAbifr9tVp2PkvHkX914d6b1mRYhePH9KPz
         9anFZkevj+iSq08XTNzh61F2AYOty6pJlaDOau9IfXDE7IPSfCzP8AGb42lfz8ZjyLrR
         R9hLkeU2DsnRocw/brMFCTOb6GCxEB43w6C7JxXUwrPVpJnqEgZnxOY3rlLNgzERgZBv
         g+3g==
X-Forwarded-Encrypted: i=1; AHgh+RoSDlu47R/8GpmrqJvLdS70BxB7RMWyOMZu60yfGWQ/Q0unxfoYC7bjmQ5BRmSZzR3m4OA1mN0ZeCPdW9OTr4g=@vger.kernel.org
X-Gm-Message-State: AFuF++koUc2NCnX/Ot7ELlE5KRbixKNXX+hmuX3KoD2AVCQAO4PNFdUU
	pS5l4Gv3JItCENVOTamkqmuaUQWRKm21d72NkJi1aRGI9A5dhYyDRpjCMPX99CU9zDCd16y1iL7
	lIp7BZuRe50iHEOMFrBFlWdzyZdPvWd0TXb0a/2KqOapd40gX/wCsERB4e3PZXX37ayza4g==
X-Gm-Gg: AR+sD10BAWpIgNjduV3yHQB/xnKVki1QKJAyu/zwr4hbkS4Ni1CgtIsIkuqMOmRMEYV
	Wwg93fn1L/wKMrOOtGSD23pkOuiNU/lIjsk2xjy3G9TbT0FFsNYs0jTeJP90y6e9sfBPKpz1aFZ
	UhYwtK5E0muThHmef17WanpHky57MWCA9c+wdq306stqlQ+OSe7COVjsxhdCNqOWDz8CGqQ6U6P
	zRivR2xEgEDoJZEkvg10DvLzuvpA2W0v8o/AwR6fCPD1te7AFiUpzwZaffvkiIiJ6OMbbvlI/cJ
	JR1h3aV+MY1KgANkx08XNDyWG2PVqJpt37aeKaZHVnqQ/AEvuXAKIzZzoblR+IFKcxED6QqTJjL
	9K3ISTifJhVbIVIbduTCmTIZ5M2I+q0/U+/RkOb30mm8t
X-Received: by 2002:a05:6214:4304:b0:908:7fce:f111 with SMTP id 6a1803df08f44-90c80c13e25mr416128606d6.6.1787669667116;
        Tue, 25 Aug 2026 07:54:27 -0700 (PDT)
X-Received: by 2002:a05:6214:4304:b0:908:7fce:f111 with SMTP id 6a1803df08f44-90c80c13e25mr416127656d6.6.1787669666433;
        Tue, 25 Aug 2026 07:54:26 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc63e8d21sm592276d6.13.2026.08.25.07.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:54:25 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:54:24 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
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
Message-ID: <ao2rHli8HUCJ8h8Q@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aoxEGzZ1eVzIU8xH@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoxEGzZ1eVzIU8xH@localhost.localdomain>

On Mon, Aug 24, 2026 at 03:18:54PM +0200, Michal Koutný wrote:
> Hi Eric.
> 
> On Fri, Aug 21, 2026 at 02:56:52PM -0400, Eric Chanudet <echanude@redhat.com> wrote:
> > Finally register the per-area usage counters in the cgroupfs. Each CMA
> > area creates a memory.cma.<area>.{current,max} pair for reporting and
> > limitation for each area.
> 
> These areas quite resemble dmem regions.
> What is the relation to the previous dmem double-charging [1]?
> (Successor, alternative,...)

They are, although I did not make it clear in the cover letter, my bad.

This is a CMA centric alternative to the other series that tried to
issue the memcg charge through dmem[1]. CMA seemed to better fit under
memcg directly as I couldn't find a solution on how to correctly charge
memcg once in dmem where it was determined to double-charge or not.

[1] https://lore.kernel.org/all/20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com/

> 
> Thanks,
> Michal



-- 
Eric Chanudet

