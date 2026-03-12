Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345F37C902
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 02:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283011; cv=none; b=q6p312DnslB4mflrDezGsGN3MhGGmHPA9wVTMKqwpFr6kNpuPT802wk7thhccn/wDTMJiFj+FS/y6O/riRxNo1t4uZMSk7NamGvAVgtow6GvnEiFQ31PKJ/f8/Fs5+xMl5TSquqDlu44Q8fulqN0a3NXDuogfWNZk7XBSTcHA1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283011; c=relaxed/simple;
	bh=xOZkHZMR6QQnAaBr9QGDIUjy3synkq82j7TMMzNo9Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnJOqneGGMUZ20wL0I8foY1A/jKC+B8GQCb3KGRQhhVy+lNF19RXNR3xD5mDrw8Q09l7wqbFcfIndDsTAtteIGsM9GovLV0UypPbaxtTbPUh9T2gpLSvjyZmW1gQje06QGzCdSwkqVq+lnrnSEHeQBxkXzbl48n0WxXlIzSoNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SZg0kA7j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mwuw92/M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SZg0kA7j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mwuw92/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773283008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wxpaP38REZKn8sAfBgNx6uVwSxgYAk4BmPTQGaPc8k=;
	b=SZg0kA7j8iPyzHOpJDqZglJxVRXV6p5c4JrQSrnb0DtrDHBpenPokHreXxVQKs+moF7ZvT
	mk2Nzq4Oz0hZIEsDzhb+AbO29vo2+xw+N5so9uk9yGnZuGBWVIFWQneTCOL7ZxIRRVBq7D
	IEL7yCopVjIQlItENtmSfr8ilB9NuWY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-RpQ852XkPb6uzD0leGB57A-1; Wed, 11 Mar 2026 22:36:46 -0400
X-MC-Unique: RpQ852XkPb6uzD0leGB57A-1
X-Mimecast-MFC-AGG-ID: RpQ852XkPb6uzD0leGB57A_1773283005
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so381628a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 19:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773283005; x=1773887805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wxpaP38REZKn8sAfBgNx6uVwSxgYAk4BmPTQGaPc8k=;
        b=mwuw92/MRFYNWpYxkafQouQZy81enag1YJ1b0EUldEOA2v+J8xK281iWguymWNCcMp
         tUgFFIEmdi9HMa1NK4QY+VsrMg99Wmi2UB7fcxwIV+D92c4LO9Bu/8WNkQplQFb0D6LX
         B3JsLulZOdco5SiYK25fT1B5Eaq8h3MuNKao8RySJK/hAyU+3BTcZ4/pFAE0JITaUEEi
         1iR2fiC6ZGkNjVZASWJBEHofss6FXq0H7M1BTEgbqgLVnYe7C3VaICNqAFcBfMBIwq27
         44hvnUefLSLID6154FOGaeMj6x0qhWrodYEVfzagpal/jS1KhASEZbzKqzBpVLJOOqsC
         7veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283005; x=1773887805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wxpaP38REZKn8sAfBgNx6uVwSxgYAk4BmPTQGaPc8k=;
        b=OOUI1DgmWkxHqJLrvBmEom0PVxA3BElD3YM+RQUN2EOyDykEi9btpIrv2VUveI3Rhm
         avhwtX1hor+R3Kn2k9uKcUAIrHPRjE9/FmydkCZ6j+snjrYoh86u2RlXnARsHbn7eFoY
         PTkDCGk49cTDngn83qb2qN03rACFqyMUDwF/r8VBL1CmpIJYU69Lmg+m70CJmA4Ux7SZ
         WdsdVpd+B9Uj9ztw1jBeEa4wZhEEsDDl6gFS0OIR1sQNT2TatIOQtDwMo/KpiKRaaTvH
         lzWjXz99JDVZnw+IaSrTnL/HBYx/4fhN5ijNHcZXxhzFg07rR+okJEoATidLt2bywYw9
         1lww==
X-Gm-Message-State: AOJu0YyV5U0emgS5rHLIpJg4ycUImxYd2rx/dOEhcoOfTLqmJAahwsxx
	2Yb0J6W6TwqTXw72iG3gQWQ9061xWHs658jZk/BbcdgUp+9l2/eD3estbXNtXh8EibAetWSmdzM
	J6Tiyv/Am7Sfl9XXys2SnkYe3JSNqK6FMQcFHsEqdEMr3+Q4LhT9UwnNEGkETLNjJKEqWiQ==
X-Gm-Gg: ATEYQzwA9h+nxwhxF6hWW+L5Ri8B/4Y6jAOuzdl2er414NL1L8uZ7YfHSx9m+tBr265
	hPkHOe02oz6Kv4MbziswiWqafOQahvbiBnIhOh8p/4EMHgrwmvO3lscSrwUZBrjQ+dCS3qK3jZA
	tsGQ+M5Tn1zf3U0Xpq8t2VOXeBWiIfuA5cOQF7l7ybuUyQmVJNxGfv9m2Nld1m0Tc9vFY7RsHvy
	v5mjmeCdpqnVghVWHa7c5t0jxjtOxKiBBhKwEgjoG3uYY29z2lRtifBibzCfxBOnW3YZVP2rLSj
	MVY7UyxSDsPE+6Z+Xi4nEAyxJDZSoU1ykyTGFlrnweZEB9/ISEOFY391igILAI0gakeuN7nD1z0
	5LIptJMlN04xVY+Xsmw==
X-Received: by 2002:a17:90a:fc45:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-35a012aeb09mr3974023a91.9.1773283005163;
        Wed, 11 Mar 2026 19:36:45 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-35a012aeb09mr3974005a91.9.1773283004733;
        Wed, 11 Mar 2026 19:36:44 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e7a2edsm3687683a91.7.2026.03.11.19.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:36:44 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:36:42 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH 4/5] selftest/cgroup: fix zswap
 test_no_invasive_cgroup_shrink on 64K pagesize system
Message-ID: <abImuvCrv9uDXVc-@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
 <20260311110523.26624-4-liwang@redhat.com>
 <CAJD7tkawFFwiV72S5eJfmqaH63k+kisMNLPrc8-u-9taGRanCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkawFFwiV72S5eJfmqaH63k+kisMNLPrc8-u-9taGRanCQ@mail.gmail.com>

On Wed, Mar 11, 2026 at 12:01:24PM -0700, Yosry Ahmed wrote:
> On Wed, Mar 11, 2026 at 4:06 AM Li Wang <liwang@redhat.com> wrote:
> >
> > The test_no_invasive_cgroup_shrink and allocate_bytes use a hardcoded
> > stride of 4095 bytes when touching allocated pages. On systems with 64K
> > page size, this results in writing to the same page multiple times
> > instead of touching all pages, leading to insufficient memory pressure.
> >
> > Additionally, the original memory limits and allocation sizes are too
> > small for 64K page size systems. With only 1M memory.max, there are
> > very few pages available, and a zswap.max of 10K may not provide enough
> > room to store even a single compressed page. This can cause OOM kills
> > or false positives due to insufficient zswap writeback being triggered.
> >
> > Fix these issues by:
> > - Using sysconf(_SC_PAGESIZE) instead of the hardcoded 4095 stride in
> >   both allocate_bytes() and test_no_invasive_cgroup_shrink().
> 
> AFAICT there are other instances of hardcoded 4095 and 4096 values in
> the test, do you mind having a separate patch that updates all of them
> to the runtime value?

Good point, I will achive it in patch V2. Thanks!

-- 
Regards,
Li Wang

