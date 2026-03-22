Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C6752F8B
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774148908; cv=none; b=OgRdKg4O5MCKVcJBpuwIbsomrZEotz1uQ7BpbmJ535SgLrskGlvLVKOyywsuTW0KnTXd+BToou/XpD96IPTB03gaNaq9QQ3JoWkUmNE1r8lbnPXk6ThmdsLrW85u/hb7jOJAL2jM3v0eh5Lg7I8ryeGj9xOthKZ+vqwiDIFcegc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774148908; c=relaxed/simple;
	bh=T9uG2e66egssCJaArUODs8UN0bWL7XGy8UlGtEUtsd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEilHOwM7rbp7jJIXRNcO5gD9V1OstsLJY7aqrsa5uXlvLOXfJKtxxn8dOahzjGAmvhZyXjjF+C7Bs1xc0IvabqzEg49uMqdeM/4xGHh10DP9qzvDIy0a81mHkLHAFAF2zAw0fa0HKAyaxHfigMOZjtDSr3T6uvMX8Vf9vWEQ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H1+uBwRG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NMYXiBRc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H1+uBwRG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NMYXiBRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774148905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=to1VE5KCZRkEhvhMb90xNxfk6LIxqdvQwXLJtGlmLy0=;
	b=H1+uBwRGkpfDSpcuLPIVon0M71zN3e5W32UKF314QStmxYHUXvOm3j90bGfPknJOurWUiA
	JeXEwID9M6SYotuNjKT25ifK/QzJjsjBvzYvTx216basmmP3ytz9oYVPnPkAU+rVsRdpyF
	cnw+PJF5ouIhdebzWlugk+FRKlLLN/8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-Nr305tRXM_u4nUKCZV3klw-1; Sat, 21 Mar 2026 23:08:24 -0400
X-MC-Unique: Nr305tRXM_u4nUKCZV3klw-1
X-Mimecast-MFC-AGG-ID: Nr305tRXM_u4nUKCZV3klw_1774148903
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso2678370a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 20:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774148903; x=1774753703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=to1VE5KCZRkEhvhMb90xNxfk6LIxqdvQwXLJtGlmLy0=;
        b=NMYXiBRcfH385qFOrSBSsF/5EIl15UhU+z9iWmxIUu7rIit3BkN5U02O6UBGIWTna2
         TYTvzX7UfZVaGBIF5GMGjrL/KjToWntFYGd/K47fz6Q1RXbm5x4kK4yK6zq6Nk67xN6q
         ZOiLG5zk8meh4VfK5HDI0mUVty3g55H4/AzAp2KOMVVneQwYuVVlRqWkuqi2Hzlz/7J4
         vS1xDD6Q8jGQDHY+Ul6aQtzMPPy3qNP3HWWAOANabJ00emh2Hycy4Hv5j2iQjnWEe0GZ
         TbaqBkExAhtL5CuYZhMj+IKDYh+Q9gqUzeoSpkLUEKHeLDlKxRq7qiUNG9QNGB9h0esS
         VjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774148903; x=1774753703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=to1VE5KCZRkEhvhMb90xNxfk6LIxqdvQwXLJtGlmLy0=;
        b=SoIOyRw1j8rukzkGVfAJM+gcFIAKdAgtubYkTRC502/KSILgi4+ReoouPd9UasCiBZ
         gdh8hH8Op4W4F3b4xvHZdctHB19k1zM49EnUlM8QuqJXelWXbfl9jQEG00oUzy8Gtip/
         4Kw9tmPIuBsMEj3NznBZdLT9EL0o8rL7BTD8ZpOjSUAtrozo7UnzBlmY+GfAKvUu5V5l
         iCebLdd7DOc2m41aBTee5UYiJw2BbrbCTT3GuNUh3OiozSG0trpTn6JzAqsusrjUndM9
         QUD55SevE4G++9g7lijTwV6U/0KWE1j0e8uCahvOyIuKs1D7+lp7EypIp3YLgTF3vJNw
         b/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvUauGpIM8wzBmMurSkDVVM0Zohe4zVwKWD6HC7AN/UF/verEOFrAYM7t6jI/LOAueBX8b9pWC6Ooa/tsy+to=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4MD9M40hE926hbKrreaS/kjA8gNrN6VguX0VuFLZd2/kjIKB
	J8vkPK6Yofk5mFitZBKdL4UFzWd+3VKID4/F7aFqaQcVEDr7oqvf09XjfPAqxX0fwrsijEupezm
	91BUtoQdf44G9Q6PTuAOWCmUXvRaMIdpgJmq8+gzg8W8dtUJTkJNZeimgimsZmr6//X919A==
X-Gm-Gg: ATEYQzy2b4lPN9J2ueiyNS0anNC+Py3yqNqgyYGt0V47nSwfHNcMfkqpun7jPwNFz8a
	V2fJOtQNA7rJ75qMv4nodltTtflwKS+4GCvaFO6PtB7aWwVEKKlLVLla8wcLi5Dq0giSZSineu8
	pUdP0ce0bAbeBSA7GIjd0+zjDylptHoXjKj9wMKj0SGzPrzmYovfUmM1rE6k/qZP3DexJW5RlWL
	RK7kG2hlORN/OGsL3BRPeDwnMNznFv+PFfwo2ATCSAH9PMuvnYGAIWKVWqXNTS12udoZfNMlm3Z
	xnHu8NcpJtyrqQuIXo8Ery4fgGXS5zjzHcJbwomFzo7RHYMrGDIFuJQZ8mROsxLeuJ5XCQ00i+W
	rA5dk3bhcucc+Ea09Og==
X-Received: by 2002:a17:90b:4cc9:b0:35a:329:73c6 with SMTP id 98e67ed59e1d1-35bd2b97774mr6439627a91.3.1774148903267;
        Sat, 21 Mar 2026 20:08:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc9:b0:35a:329:73c6 with SMTP id 98e67ed59e1d1-35bd2b97774mr6439609a91.3.1774148902855;
        Sat, 21 Mar 2026 20:08:22 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc610c232sm8435153a91.13.2026.03.21.20.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:08:22 -0700 (PDT)
Date: Sun, 22 Mar 2026 11:08:19 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yosry Ahmed <yosry@kernel.org>, yosryahmed@google.com,
	nphamcs@gmail.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v3 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-ID: <ab9dIzALKPQLb-SX@redhat.com>
References: <20260313043532.103987-1-liwang@redhat.com>
 <CAO9r8zMsbVHKnCzfQcdtomRMWTNFgTGY4XALxwm+i9m1SUPPvg@mail.gmail.com>
 <abPEALhYmtBnEULi@redhat.com>
 <CAO9r8zMciNGa1ei-pSvx+ndrCJtZguGj12R3sa8PkDHYwsvGzw@mail.gmail.com>
 <CAEemH2cQSoTEVb+8NxZpc=qQVrd5DBhj7HmJA5o9GZFke3zj0Q@mail.gmail.com>
 <20260320123520.616900ef63996ba448bcd91f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320123520.616900ef63996ba448bcd91f@linux-foundation.org>

Andrew Morton wrote:

> Meanwhile, AI review has a lot of things to say:
> 	https://sashiko.dev/#/patchset/20260313043532.103987-1-liwang@redhat.com

> [Sashiko comment in patch 2/7]
> ...
> Could this diagnostic message be updated to print the expected swap amount
> in KB or bytes to avoid confusion?

Yes, good point, will modify it in v4.

> [Sashiko comments in patch 4/7]
> ...
> Is this description accurate?
> Looking at tools/testing/selftests/cgroup/test_memcontrol.c, the macro is
> also used as a memory stride to trigger page faults:
>     for (ptr = buf; ptr < buf + size; ptr += BUF_SIZE)
>         *ptr = 0;
> Could renaming this to BUF_SIZE obscure the original intent of touching
> each memory page once to force it to be resident?

Well, maybe yes, we can use page_size for this one.

> Could this lead to truncation of /proc/self/mounts on architectures like
> arm64?
> Since BUF_SIZE is strictly 4096, this reduces the buffer size from 640KB
> (when PAGE_SIZE was 64K from system headers) to 40KB. If the mounts file
> exceeds this limit, the buffer is cleanly null-terminated but the last line
> is truncated.
> Later in this function, strtok() extracts tokens without checking for NULL:
>     type = strtok(NULL, delim);
>     options = strtok(NULL, delim);
>     ...
>     if (strcmp(type, "cgroup") == 0) {
>         if (!controller || !strstr(options, controller))
> Will passing a NULL type or options pointer directly to string comparison
> functions cause a segmentation fault?

Theoretically, you're right. But in real situation we haven't observe such
failure so we can just add NULL checks on the strtok() return values.

    options = strtok(NULL, delim);
    if (!type || !options)
        continue;

> Does this code evaluate its exit condition correctly when waiting for a
> cgroup to become empty?
> When test code wants to wait for a cgroup to become empty by passing count
> = 0 (e.g., in test_cgfreezer_forkbomb()), the loop exit condition is:
>     if (nr >= count)
>         return 0;
> Doesn't nr >= 0 evaluate to true on the very first iteration, returning
> immediately and bypassing the intended wait intervals? Could this cause
> subsequent cg_destroy() calls to fail with EBUSY because the processes have
> not yet fully terminated?

Okay, this smeems a problem, but not blong to this patchset.
I would sugguest fixing it in another series.

> Is it safe to ignore the return value of read() here?
> If the read() fails, the loop will continue incrementing the offset without
> instantiating the data into the page cache:
>     for (i = 0; i < size; i += sizeof(buf))
>         read(fd, buf, sizeof(buf));
> Can this silently fail to establish the required memory conditions for the
> tests?

This also can be improved in another series. Shouldn't resolve in
this one.

> Can this dereference a NULL pointer under memory pressure?

Theoretically, you're right. But I think NULL pointer checks can
be added in another series.

> [Sashiko comments in patch 5/7]
> ...
> If malloc() fails and returns NULL, does this loop dereference a NULL pointer
> when writing to control_allocation[i]? Other allocations in this file seem to
> check for NULL before proceeding.

Theoretically, you're right. But I think NULL pointer checks can
be added in another series.

> [Sashiko comment in patch 6/7]
> ...
> Does this larger allocation size require a NULL check on the malloc return
> value later in this function?

Theoretically, you're right. But I think NULL pointer checks can
be added in another series.

>> +	snprintf(zswap_max_buf, sizeof(zswap_max_buf), "%ld", pagesize);
> This isn't a bug, but since pagesize is a size_t, should this use the %zu
> format specifier instead of %ld to avoid compiler warnings on 32-bit
> platforms where size_t is an unsigned int?

Good point, let's use %zu in patch v4.

> Will this new limit consistently trigger zswap writeback on systems with
> efficient memory compression?

At least based on my testing, (whether on 4k or 64k systems), everything
runs smoothly; this change has indeed reduced instances of false failures
in real-world.

-- 
Regards,
Li Wang

