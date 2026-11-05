Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862953;
	b=J+w9klNSBnyT4l9jgY11fHojC01K01BywfDqv9JAIcS15pjcUmdBDj5AxdSydbZWoPMP
	 aOqDJ2UaeDv8sB7SgGW99dbwhnRQz3WI9+4JkPncMAzyh3ZCRqXNrAFaKMusJQ8EoNPvF
	 byqwXDUInjhHaHl8m42u+VMn+KQiZsIrNSeu/X6LQjFi/pY8fSDmhMz0wMFCIYHn7YVxt
	 M12Z+ZV7ioGNx90De9b+08jSn9tUIPXTV5BDPh2wxD2X5W9h6yMwcLo3fYetPaeTbEHVr
	 frUvD93NQ22KbxtQ8qzPfltZ4KHVBR8VzIdujSFlhBMDR4iAzon5WoWJVuy4ziJpmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862953;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
	b=DBM/yDlqhGZkhpQBtwEma/eFLaAlPWr78QcEtN3Jg2c3jT8N3QUl3ilduIdRuESQKJt6
	 5wSQsJ+oL+LDXx67d+0/GuyJpwomoNuULIz7Qabk7XTC4Ra1TkCLOKbYD9IJqijTiKefe
	 /8CSOHz5hW55TJF9N9cyENbXaadx1vOC7yUJJtY+0HjMPSI4fvUDA3um06VHJRpl1iNiW
	 Fok5MUrwazTa1e19xJnsvXJfbxJ9N8B2oD64a+n7s6Scnvdal737n4I4JoWmaVXUFwFFp
	 Ed453hFLY09jgUYWyOyOgLR2SVjpROZgbK9LS+ZwEzRTc9fHFqziCtskrJ6WSdBtWIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UpCupRSt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a0Uz7Pmf;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254FA606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 07:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UpCupRSt;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a0Uz7Pmf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793862952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
	b=UpCupRStGTKdg7B7YlB41BNskmU1W/sNMsDCUS2glDMpU3+XjxxGt8C031tAkmswQZaKbI
	m+waC29h34dcg2+DdVUcPms7xie7OY4yL9GY3II7wfqfoY43Xw9uHoUHocIs2NVXhZTT4Q
	9DWW0vUH777z0EJw5C1cLeH8X4ZlzyE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-3z758PMuODWMR-SrUD-gjg-1; Thu, 05 Nov 2026 02:15:50 -0500
X-MC-Unique: 3z758PMuODWMR-SrUD-gjg-1
X-Mimecast-MFC-AGG-ID: 3z758PMuODWMR-SrUD-gjg_1793862950
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso13339845e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 23:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793862949; x=1794467749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
        b=a0Uz7Pmfw5rB2Dl//vtHdDkxjvTW9BtBgxiqYA8xC1Mgi3tG1/RsPaBEb68FlyG859
         gxHaDGcvdB9pvZDgAkaoj3ZBcEyrH46ozJIzoqq2dsyC3W3jQlPOgElgmFTuns9WZXKn
         9fUo2YADkCkV/Ec9R2CtGAxBGawhpsz3Qv1nG5LP/6FGfuvnRjNV46XGF5HnfPb1PYZJ
         XeB5ifgjoSo2qkCiKFy0IeDLskO8rd/L+/ys7bfsVO7ygR9ML1r2v1pnRPwDqykVXY3Z
         dRM1Q4ED+Gi4lxvJxpA5sXWXOfVMQzFUcj7MU/IKqppwo4MG8dHDzkHrgmFtFQHpMQVA
         DGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862949; x=1794467749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
        b=RI+pCqk/iiBGgqcZzT+hXQciU4nw9jIF8jlwIcb/AfhWMKNw3GY9CAS3Byuv+q4Apg
         IWJqUhCOJx14xDJ9VyxmEPzErlNuXDZzOnwNrLEhhqlmPFs5f/iVGAsEIrCT0Y1lMVQy
         A4syKyq6TeB3hVHhpIoLXVmk5ehASV5IMmAd+7mfvc4ZIGlJBoOxynxnSepELxUugHrN
         4wFbL80gC2nU/MRg4V9YplPTm9m/cOoT029SUoCIZM/7w/FB5Ojmn/jz1INjOcicuG7n
         13qH2x32aAqr5WYqK/e6c2L218ur+5JeCd+0h//8tTP+0MiDatYV0DVyVBQwB8HXlj9g
         +n0Q==
X-Forwarded-Encrypted: i=1; AKwUvBysUV/+m/bMFucbskJsEenmzSxSX1OlXtEr59mrE2kGaaeqwz2eBisTQLc3dzjvYsRd8qqhDgwoBgnfkOt3+zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PkoHGp0DPpJbVg/XoYFNpSh7vV4QUnzjgFhwpnVCjBfJCcotw
	8vyFc5T267W33mU/kh+H40vKIg0KOSpEzhJaIhpaO2xXzLMqRg7VMhPRdcb6F8kD3HUg8nfcHJ0
	2WaOmKPaxVO1Y5vtCz5YhSPsS66eX5HxaB0bSKV1AmCloXtdQ6K7KRHdp62QIs4Q1SExsNQ==
X-Gm-Gg: AYBFou0X66YUH877oSemcEjItUq7Gra2zYyeI1s0gk7MVNXqDHTnSnsiNzccFkt65JS
	sisgTY3qJGiERwd4FWA4hppPaSes7csS+UVp36HL7wO9T/7pZQE5cBODjsiyOuYvxg0Xg74Kl1/
	3IL2LXhec4VlLEWSvBTfpYxJ7iN2Jr6Yyyfhsy8U6M5tndn9PGUqMhDFdxffhCcZLjUbjK7FZtA
	lm3Q5/1cWFWkMp6+v90ohIIWZXUl17o47PGjNljvOga+d1ZSEpV4yZaO9bYbI4IUuRahqmLAbyo
	U3aPhZ2NfZE1QIbe9BaO4UsLI30p46kA46wDmHnUbBHH8nQJ34F8wDhtC2OSZ896ZyPERNXc08n
	T9CQHD6RPoAYPeoDZI49tDIECXcGBLiTw7LiSs6S6NvHPBcAlINvrRHd7foJd1inI6a6kkiEQ89
	ERCA==
X-Received: by 2002:a05:600c:1f8d:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4ac177539f6mr393038765e9.17.1793862949730;
        Wed, 04 Nov 2026 23:15:49 -0800 (PST)
X-Received: by 2002:a05:600c:1f8d:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4ac177539f6mr393038455e9.17.1793862949360;
        Wed, 04 Nov 2026 23:15:49 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65c8sm42015295e9.12.2026.11.04.23.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:15:48 -0800 (PST)
Date: Thu, 5 Nov 2026 08:15:46 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 02/21] sched: Refuse SCHED_FLAG_KEEP_PARAMS that would
 change the policy
Message-ID: <auwtIqa4H4Fqjq6V@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-3-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-3-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> SCHED_FLAG_KEEP_PARAMS keeps the parameters of a task: it skips
> __setscheduler_params(), which is what sets p->policy. A request that
> asks for another policy is then carried out by half, and succeeds:
> SCHED_OTHER to SCHED_BATCH with SCHED_FLAG_KEEP_PARAMS returns 0 and
> leaves the task where it was.
> 
> For SCHED_DEADLINE it costs bandwidth. A task that priority inheritance
> boosted into the deadline class is of that class already, so
> prev_class == next_class and the class check of
> commit 8a70415351ba ("sched: Reject SCHED_FLAG_KEEP_PARAMS when it would
> change scheduling class") lets the request through: sched_dl_overflow()
> admits it and adds
> its bandwidth, which the skipped __setscheduler_params() never gives to
> the task. It keeps SCHED_NORMAL and a dl_bw of 0, so nothing releases
> that bandwidth, and total_bw of the root domain holds it for good.
> 
> Refuse a policy change as well, where the class change was refused
> alone.
> 
> A SCHED_OTHER owner of a PTHREAD_PRIO_INHERIT mutex with a slice of
> 40ms, boosted by a deadline waiter blocked on it, leaves 0.4 of a CPU
> behind at every such call: total_bw 419424 -> 838854 and there to stay,
> in 8-CPU VMs of v7.4-rc1 with the four deadline fixes of sched/urgent,
> and of this series up to here. With this change the call is refused and
> total_bw is as it was. The selftest added later in this series has the
> case, params_keep_boosted.
> 
> Found by the Sashiko AI review of the first posting of this series.
> 
> Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Makes sense to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

