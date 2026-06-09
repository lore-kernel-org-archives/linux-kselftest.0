Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78B3914F5
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017918; cv=none; b=jEpswz5YunilXyjKYSON4fdhGIjgVxinIsNoTxbTzf+b1am3shAZmxbDVO3JGUc3tOxuqKzbo4SQc83C3dYznSSfbpObNtgwF5sTBd5NRy/ouZPPHJxfHxv/C4P3YsZuAUm6pFFQTVdjeKc+OBsXj4hJQoY/ybeREvFqKSy+7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017918; c=relaxed/simple;
	bh=2N6jjPNXS8KHkA9ELWAn9DU9QeobkpuL9vsk9iqxtB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl8tyeWEd8yR7uLznNgpTBw7z2yXZppwF2ZsmvQeUAWOvXEsC8MzKulRHm4JYARHkmTAGfVNBP9vpz5iAIW+llFV5olZyqkbmZUKYxTso4t+etm84KTXSkJ73nmuqpk/tdIVfQKgWzhZrykTQyrO2lE1wU/cBVtGs/vsUWMr7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=oMeq8jxa; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="oMeq8jxa"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-91562bf6c12so692714185a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781017914; x=1781622714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JHWQ15ZRzqnNTI4yBH6/uoHMgLXFxEcxAiVyb8DKfs=;
        b=oMeq8jxaYTIDpX3677iVIffpL40PQNwhQC7oEKFTbUgV/TAGmjp+dKmA2i9Y1OEU+W
         +L5JoR7wHQANPUBf4lwWVMnVQ2ZQfmcoIkvi3LjOGsJmoXjzhjZDPgsqpou153P9dwr7
         s8sXGynBp+/1JTpDDk2vp+seRzQW3Jlu2NQcOKaUQTnKAwBHlNoRzUmIUDYjMKf3/SD2
         fGqigpEZNr2XHtbL3ta40r4OMWst3qoDJdJX0HEcGeHXEjgVWJQuaKS/UjKSBNR0xKn7
         DRyQLE36k1OG9Vo9eJ41OuCvtYV0yI4ESwHOGUL/aTY8AQo2CQIevQZQHitKSKxBA7+e
         Vwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017914; x=1781622714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JHWQ15ZRzqnNTI4yBH6/uoHMgLXFxEcxAiVyb8DKfs=;
        b=WWbgRqF3WVsg4ymq9qc4ynzRwUC2ZrSiLQbMiWoKw0VqReQ8n4FVYSTI920bEvo85x
         N4HihP//dDgJloORRikRcIYl2S8qSo6MjUbvOHo77Kisx2mzLwvCn05OyoC6gC8d+Qh3
         X/7mtHoC2BfNjckvjt2K26RyutNAHfjxwQwGPQMOwjzydmzmd67sL9Eh9zapgNbpgibA
         tLxd1fyX3nZWwzlj0p4hP20aVkBhVhluZMr3/vd2AfnvRBUjNYCDSv3FrgFSFlZFpw1S
         jR+OJvmnc0k2VRT+93hbYNK4wzQMzG85na9Y1vNy8rHovN2NIb9Zj0Bo0ddUD30Lr6J5
         ZiQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zf6WvYu5tSXBueq8SY3vcqqSmZ+bLH1PY9IB0gZHiE5vnHjb/bTIPbPyFarXCujmwnyzDFDVs4LJyMbYqq44=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUngTFNX/NCGvlrJsc0RTGfrT1wKKcTJNo8Wp7DQ3rkb+oqLAJ
	zZ0sTVJulW1oqjXVjUXmdj8ySwFYhbx32O/yWhIYUb9XKdPLi3Oeq0vJVURx1JxklUA=
X-Gm-Gg: Acq92OG5rJ7zbPrFJQiN4XPzbX7Z0LLzvoR/jkX/JRXnqc7cK7nJI0XiWQIWoPQGdJG
	P4icvoMU0qqM3suYBmmOi9W9Q44ci7s2oroDoQO4GGjwLxB4v+bIz4JKtxs+2JLgjjfQxnLtNEK
	yLA6fkgLB/oEE6AmzFaCNubzqctvN8FYsks+x0YNWEzgWDkyZ0X5u0N/ifCxASsZMMRaBZHMRDe
	qBivooTCPCBQrZ+2SvSecEaWEmLwSIr3RW4UkPUblYIj4vvba4SjhdvLfrKGOFhigBMQP66EDRz
	A34B1YB5zitLg0EJ0/N16knQ4+x1DujUanFE7VwDGLtD2kMW4+1+MbQlzAMvxlljOcG+LewbkPz
	uJz1SZhDgdDm61CsY7+oOxhp6NYOs6rsaqfmZMbTSK8nyAK+cMoYgP6BMK9gG7YQiAY5mLKDsgB
	OYjyAy6DogOG4BadGedpujVGfkgu9OXX/u7Zil3kjN6kxwbEfAaFC13CNt1FLMYc+PKdDSJJizC
	ngnZeIhAgBIhjZ2Qg==
X-Received: by 2002:a05:620a:4546:b0:915:cf88:1e3b with SMTP id af79cd13be357-915cf882096mr1578753385a.47.1781017914136;
        Tue, 09 Jun 2026 08:11:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a237330sm2207058485a.16.2026.06.09.08.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:11:53 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:11:51 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	linux-cxl@vger.kernel.org, linux-kselftest@vger.kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, osalvador@suse.de, shuah@kernel.org,
	alison.schofield@intel.com, Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com, apopple@nvidia.com
Subject: Re: [PATCH v4 3/9] mm/memory_hotplug: export
 mhp_get_default_online_type
Message-ID: <aigtN28XUvHyCSkG@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-1-gourry@gourry.net>
 <20260605211911.2160954-4-gourry@gourry.net>
 <eaea4aac-fcba-4f83-99dd-f8289e5556c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaea4aac-fcba-4f83-99dd-f8289e5556c0@kernel.org>

On Tue, Jun 09, 2026 at 11:52:21AM +0200, David Hildenbrand (Arm) wrote:
> On 6/5/26 23:19, Gregory Price wrote:
> > Drivers which may pass hotplug policy down to DAX need MMOP_ symbols
> > and the mhp_get_default_online_type function for hotplug use cases.
> > 
> > Some drivers (cxl) co-mingle their hotplug and devdax use-cases into
> > the same driver code, and chose the dax_kmem path as the default driver
> > path - making it difficult to require hotplug as a predicate to building
> > the overall driver (it may break other non-hotplug use-cases).
> > 
> > Export mhp_get_default_online_type function to allow these drivers to
> > build when hotplug is disabled and still use the DAX use case.
> > 
> > In the built-out case we simply return MMOP_OFFLINE as it's
> 
> Ah, you mean without CONFIG_MEMORY_HOTPLUG
> 

Yeah i'll update the commit message, thanks!

> > non-destructive.  The internal function can never return -1 either,
> > so we choose this to allow for defining the function with 'enum mmop'.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David
