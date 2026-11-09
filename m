Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236960;
	b=t96t2BXuve1TVMr+HuU16YAWfAT1yvNtkOn/3ForEw4Y1NPSwR9dLiNqE78MMkufH/Pe
	 eFWOjzLk3EAu/n1tXVoj94T+dqb35vL0Kr4kEjZ5hWeYb56UNwqsxiH5pyJzG6HN0Eali
	 P7CsxOtcXsoj0Ob8QAqxkwVtrgRdB2unFkQ/RIsP2IGi69XXv8b3g7pFBLekzCrh8J6xn
	 kYMo75MPB6nzGLDizuUUT+rL84GOeAZBUw3eEA8FW9TH2GqKpAtFiYoTvJfbZW2qJToOM
	 et+lH+/55V/SvZ17qssp5jVZs5KFtwfupKsfiDyeh5yosQoNDDjlh9bxX2FCy61DZKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236960;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ehk/Gi0k4ynJUIsecQ39iaSJWX96HxZZqDpEX10WpqA=;
	b=fHaxW2U0RxlzpOxAE2m81XtErAfioxdiCcjDQP9zst2+lNFTUl1S4XchTbMgGiJaS9jG
	 IkyZr9tlnFrn/0BR41LkQFB2ACI2epGYIKFLYtXFGUuYIPNWAkr2ZbKRMkrfhiYLSCaLu
	 nrxmDn8LlHpDglDvMMic51SK3I0T0Cfx8u6/lD6Cr9ZNfWUlXdfESzMAsR7HfVge27zNG
	 L8cCFpVVsM4ZAEEn946g8VV+JRaAnGQIPgZVYyIyhaExkNpaJWWql/gxi4W9zHy49vFgl
	 npKVvy2puJSkaE6W0mq+BXiO1IEFZ2hafRqiJovFUN42EJb6bkQLOevrS7rRXWdHfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NBPytV81;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LTIsuBLa;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA41606A322
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 15:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA41606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NBPytV81;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LTIsuBLa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794236958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ehk/Gi0k4ynJUIsecQ39iaSJWX96HxZZqDpEX10WpqA=;
	b=NBPytV81+7IQ1bsURrkG9p3gBWD4pBjXPu9W1Zpig2qF91IchzVeWY2UaFkJ5ZYL17VDcL
	wa7qbofyx6q56Epg4YDYYC88bo1P9d2EurOueQ0Ie9CTj4+si1qdoXJJ/RE9MGsiWUt8ut
	YS6EcLvqonfgwrKtcrKGXAyADl4coHM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-El6ZYx6MPYuRrnCZTjVj_g-1; Mon, 09 Nov 2026 10:09:17 -0500
X-MC-Unique: El6ZYx6MPYuRrnCZTjVj_g-1
X-Mimecast-MFC-AGG-ID: El6ZYx6MPYuRrnCZTjVj_g_1794236956
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso5805405e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 07:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794236956; x=1794841756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehk/Gi0k4ynJUIsecQ39iaSJWX96HxZZqDpEX10WpqA=;
        b=LTIsuBLaTJuFbm754tSh3DeL+OrbAxHo5FnRP/90ZuKvbnEDj7v8rOVgTVoP9+/9c8
         CQPD2ixbWQqhUKx/pDu4v6PA/pMkf1xzvIUn/bez4yFIkpU8JnNoULhad5PSW/2DGP1L
         FKiNt9gOjCE2HOGezsfk3wZnGVm3JdxxSurhkZNUbmdTbL57/knVw7gvuEcmp/xyfq76
         4OCeBZPwWgTINF0Vpr0y6QgI1eUSkJfPivCYwlt4AgEAmtR6vPZR4no3b5R30BzYkdI0
         nVrDG9rmcrdpPzOLAgziSE4torSay4ZfeVzjGKJAjFYJ8yCI7ABuD4Y6MsOBGO2W0Q1Q
         l13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236956; x=1794841756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehk/Gi0k4ynJUIsecQ39iaSJWX96HxZZqDpEX10WpqA=;
        b=HKu9UhGGfE+xizkjm4lJb5xt0cFygZUVzkmhKXUyYLZbaF22lFvJ0BtTQZDBdxyMa8
         DUk5pLY+Gby5kGkv6L2D2VwJRToYklB+ZD6iNd4WoooXsp51AmWOxvkLfWyj1cGyKETz
         P3Sc48R9pztu2w+VnFzqmxUR3C9y4JG2VGcq8qBZ1VzkC8ZsAsMpAd3C696R2mLQNZ9D
         EiYtSBWVFD+CRKGXCuOFZfrirhQiiYDk8E5hzNL8LxiOYq/28vr/L/f467HuCBhCOdmL
         SfXja52VZ84RwQXzk95s/RSFrfU9x2gnKnUbkhtDgU12lPID00p2sXR1mhSkGaS9zeAP
         jYGA==
X-Forwarded-Encrypted: i=1; AL+hErE9wvJgwQ6yho8f7HMyVL/U2WkuPtq3dp2rJ2hmPVyxNlrUfS/qyKIdCiEEcpYrNbquhvpnfuSeHXpedP6/JXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZIPjYlYZyKT84hxPGKwbSzktVirgPL+aT1+Y0gGvN0eO9O8g+
	DqCZoH0Q078EhgPXTkN5GB8OTmuWh7sj6uWDb8xZUZA6q3cPh7oGs9gOvkok0l19dJu6w1BVl/V
	wZB7vVDJ/z7d0c8ZnziM0tp+uaMpC/O0Bx+0OpxpAt1m/t/BAroIja+uJWkhGbiy2FMuFTA==
X-Gm-Gg: AYBFou2JveL5bohAIS8o4Eh+JRFvrD+e2f0lC065auv/LVBB7tIFa1av2u1zrY5f+5R
	O0iXRv9Q0nO880FSaYIzHJMb6+PI5ibgs5LoCYdyKnQInmnB8lEzLfD3aZPKf56g4kUCkPZf/9M
	dhvxN7oo0K8nn2/b8eKoyUd4if6ng4wD26gty1UIaoyEORTUkz36EgYh1hikntbc0Bzk+7JHO9B
	If5wJ70hcs5f+0+1VLA2qWrAJ+hfGC2RZVS4wMeIQw7zI53mx+AklX1xbiTyfrYWYNIrspJPQtz
	4qsWJ5UfCPET+vbF2KxuNGtSsd7LUvwEI7jzf6EIplAt2VeaBFc5tUNbXghgICATX8R6VfnPhEN
	g3Cd6jJXtr2lEzfYiQskJpsAgXWCXHN0993pgW20BkWUB6N5AYZJaYeOzdMm+PuXzHyyyeB7dCA
	xr1Q==
X-Received: by 2002:a05:600d:82ea:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4b943f76d81mr96595385e9.0.1794236956023;
        Mon, 09 Nov 2026 07:09:16 -0800 (PST)
X-Received: by 2002:a05:600d:82ea:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4b943f76d81mr96594555e9.0.1794236955393;
        Mon, 09 Nov 2026 07:09:15 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm255269375e9.5.2026.11.09.07.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:09:14 -0800 (PST)
Date: Mon, 9 Nov 2026 16:09:12 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 05/29] sched/deadline: Do not divide by zero active
 CPUs of a root domain
Message-ID: <avHiGH_4WBizEaBJ@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-6-mathieu.desnoyers@efficios.com>
 <avHY7oNeuvjsLT4I@jlelli-thinkpadt14gen4.remote.csb>
 <3e6677a8-b972-4081-a080-e925fe1df3b0@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e6677a8-b972-4081-a080-e925fe1df3b0@efficios.com>

On 09/11/26 09:57, Mathieu Desnoyers wrote:
> On 2026-11-09 09:30, Juri Lelli wrote:
> [...]
> > This 2nd hunk complements and tightens 4043f54984161 ("sched/deadline:
> > Reject debugfs dl_server writes for offline CPUs") which has Fixes:
> > d741f297bcea ("sched/fair: Fair server interface"). Do we need both
> > fixes (if that is allowed) or maybe we need to split this change in two
> > (as this second part won't apply to old kernels w/o dl-servers)?
> 
> Good point. I will split it in two in the next version:
> 
> - __dl_sub() and __dl_add() skip the division when the root domain has
>   no active CPU. Fixes: daec57983670. This alone removes the divide
>   error, on the debugfs path too.
> - The debugfs write is refused while the runqueue is offline. Fixes:
>   4043f5498416, which it completes for the hotplug windows. It only
>   applies where that commit is.

Hummm, I'm not sure we can say it fixes 4043f5498416, which was a
correct, but only incomplete, fix for d741f297bcea (which the second
hunk fixes properly).

