Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440B17B506
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828084; cv=none; b=PEkG7Ge8HPXkq9o2zbmdCZ167fgMU4e0TNZRA0yI6hPQkXARBUM7lzmQpB7VXHbmOnlj80BcAIjXRe5zaAEww+6Mqjc2guVXy8ziLLfjGydaWpkn/GzCT4D7loGCpB9STfivgVYHZzdK/X3vO5DWa8GA+EcohG/jHg9N4Heowc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828084; c=relaxed/simple;
	bh=QF5ZIU+eSuGBSWH3Y7w253rOOR0PTkKglaTKtKLVVAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lxt5JicOnJgpKwirsGki8mAJXfAxhJMDuO1r+TR5IJhMK3NR+LXG1f/TLyJ4gvo0kNY14yd7Z50Tf07pHBjpvOSHTD4MeR5kRqkm0AQ17hBGM3truo0ncq7ajsa1sEFJjqjqVksRKuVVA4BcqEaO/pqnwx1LhzF7U4TGUBoGcxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QX5rhFas; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qwmym29C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QX5rhFas";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qwmym29C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782828082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vL1cQBm4V9bkdhZZPfpOnFBHfOM80jV2SOxmu4s9TC8=;
	b=QX5rhFasJEQNnxIOVKQ2mM/ixkop1ZkWQZ1ROt6fqtEfQPerUZtLPtRn2tAvUjabDc0oeV
	w9CwdYkm08v+rIbZfap5W9yODccG8b/Y4QaiQxgjIBjPM9dSM+tpQxX5+1HgHSFxzb8RNc
	e8VzFMc6GR8yCs65QhOI57USu8rr0VM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-gknCqE06OQ-p0HJuvQvRbg-1; Tue, 30 Jun 2026 10:01:19 -0400
X-MC-Unique: gknCqE06OQ-p0HJuvQvRbg-1
X-Mimecast-MFC-AGG-ID: gknCqE06OQ-p0HJuvQvRbg_1782828079
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49246459bc4so34958925e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782828079; x=1783432879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vL1cQBm4V9bkdhZZPfpOnFBHfOM80jV2SOxmu4s9TC8=;
        b=qwmym29CyP+h3fOQ8tIEup66dg01JUbrSru3fxr/duYo8bzCywfumNIoKkVHbD9oLC
         OzakTdGQiAprqrDuc8Tkv0mz6aWa0H222ZhZvxGPfygqBMkxxd8E29L7m99yewADVMxb
         v3tp8yl0cjaaKj/nTj1fDikyM+h0VxyTTToP7W7HaoaT45Kp+XU18R5QqXg/awqYRzwu
         lksCqdNtCmqQIQyqJrGOGR4kg1x6XO3NUKorKUBmu+R0w8lGER9MhqsjjSALLGMXK6Xg
         lEIF05KLWGWdSvaXA53qurjuDnVgak+HUfcSq4YClpjvdPxHip7vHt8UJVdMV9uscXgm
         cSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828079; x=1783432879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL1cQBm4V9bkdhZZPfpOnFBHfOM80jV2SOxmu4s9TC8=;
        b=jY2DJv7+PkBUmY7DAQ23uHJ+o9tcXlSthmuLzYDIqWBGZ/cZCqKv5VCEBcaaKzHrdI
         4RWJL3/y5Im+78bX7F58qRrBb9oKojfq0BgvOoUYocPzOlILq3cIT++PoHEr7hw2L4VV
         rP10Lpec7SxaP51gmm2lUtVsNObA7Q/iMd2F6Nnmb6ZBtslOW2xkwtvhhloKaGyvhOab
         e5j9uC2OQGzFiKcDfqtFz6/PQ1LclXVbcH6t1hZPL9ayLn3eeA5t7nWCdE9vjg+Xom/G
         FABfuJeHS1Cz0hMS38HsRL73aoySxvziliC45a4Y5tsnIXNSKd29TTNP536aKqsILYa2
         6zhw==
X-Forwarded-Encrypted: i=1; AFNElJ+hcBpP5GED96pNrfveRDk+XcICC+PFqlcvJynPPgQYuWCu3awAVdReKkKb2MalhRUmF7sjCHF13Q7EcwW/DBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywst52IolCslcxuzV8dplx+uAKAYiIvx8CZyM93A12rtwK4UhPQ
	p+1mHw6a6khwCJa4w0lI4hQeKNMmr+ieulKxwZ8ZM7G0p1CKtONGc49Vd+h3h1UsMKmmoTVeMMk
	Cz6leupqwF+IqEpG8INrgWb0Dq2cPpMVIjPA4P7m6/0eQGjwkMxJJ/vU9QXZp3OqqNhyXTw==
X-Gm-Gg: AfdE7ck+F2thg3OZ7L7L80L1h3yjZz6rsYn3colHsWOaLVVBgO8cBtixOWP/6HGjIPa
	vHBJH0ZZspacWhouVFPLyTMjFj8mn0FHv1EQy8quiBCAG2cpmbhaHerEfQ9MP/32486D4LSF7PT
	oXvOIe5tXFdMCghaQXijEbnEdEgKM0Kg4nMu02KdOUTvpQCGYZLT8bj/NqsmyU/oL4D5/bKBbLj
	uPeBaml8lCNCcXqv7qmZ8LF3CtdrC8naYTPxsw7MWzItT2UePwMrLY/Mk9d9yN/oY5mLybJOojz
	JS2x1qoTCY1xWZjnbv8/wAHbzV5bYymQmAaZvHDeJKBXKJ2kslW1NheEGK+CQVE4rOgrEQLG+S7
	CGg0r+MS0HvPY18X9Xh4psxxtjkRgVIJUbMc6NGvTRw==
X-Received: by 2002:a05:600c:a317:b0:493:ae5d:8c40 with SMTP id 5b1f17b1804b1-493b82b63c2mr55410565e9.27.1782828078332;
        Tue, 30 Jun 2026 07:01:18 -0700 (PDT)
X-Received: by 2002:a05:600c:a317:b0:493:ae5d:8c40 with SMTP id 5b1f17b1804b1-493b82b63c2mr55407775e9.27.1782828076370;
        Tue, 30 Jun 2026 07:01:16 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.133.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d0afacsm79749845e9.12.2026.06.30.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:01:15 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:01:13 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Aaron Tomlin <atomlin@atomlin.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>
Subject: Re: [PATCH-next v9 01/11] cgroup/cpuset: Make nr_deadline_tasks an
 atomic_t
Message-ID: <akPMKXppWM74-m9a@jlelli-thinkpadt14gen4.remote.csb>
References: <20260630033344.352702-1-longman@redhat.com>
 <20260630033344.352702-2-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630033344.352702-2-longman@redhat.com>

Hi Waiman,

On 29/06/26 23:33, Waiman Long wrote:
> The nr_deadline_tasks variable in the cpuset structure was introduced by
> commit 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task
> in cpusets"). It is reported by sashiko [1] that nr_deadline_tasks
> can currently be modified by inc_dl_tasks_cs() under rq->lock and
> by cpuset_attach() under cpuset_mutex. So if both updates happen
> simultaneously, the nr_deadline_tasks variable can be corrupted leading
> to incorrect operations down the road.
> 
> Fix that by changing its type to atomic_t so that nr_deadline_tasks are
> always atomically updated.
> 
> [1] https://sashiko.dev/#/patchset/20260626181923.133658-1-longman%40redhat.comk
> 
> Fixes: 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---

Looks like Sashiko is yet not completely happy with this:

https://sashiko.dev/#/patchset/20260630033344.352702-1-longman%40redhat.com

I actually wondered the same and couldn't convince myself we don't
actually have that problem with the window between sched_setscheduler()
and cpuset_attach(). If issue is confirmed, not sure if wait_attach_
done_lock() could help here as well? It's kind of a big lock for the
scheduler, but maybe only affecting DEADLINE tasks and if migrations
are ongoing.

Thanks,
Juri

