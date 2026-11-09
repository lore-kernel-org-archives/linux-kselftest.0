Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231495;
	b=iuRICjz0leYa/7OQ+8EPiG5XWd3IyW2SX0ffwJANmk++QXpsdtH8k16tlAjKIVNop/Ok
	 qK6iDrhxHtaCrkGuDzWE1sWcxBywyGhFchtngYm88jweVArzPNiQwKI/xAbFOTwP2Ch1u
	 cdT+Nzr2BqTz6wRaVy2Fn0oaSZz8g+RQzFThcA2dW1IKx2hHJdgIDVZAGJt2ris938qnt
	 UxcGSy8ZhXVN7eIlSOxrWEL28it2hZOgNDkAJuXx0n34A8+TgNss6e+V+DvbOBb0kmD4H
	 Q31l+sgwu/GGWMdEjVlw57+zs4S34CqcSn86DFTZTfdKpWSfh+LZcFOi8cxbwH0Aoxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231495;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BGYsCV+6ghrjpGJ3qQugEb8Y0kCPQvn96f3QlByPPhE=;
	b=Z/LFzFBRaHCSlHETR8Trfvac1+qovKWiaJ8IfdpqvkarI9mD8j+8vupBbntOQYuogNWa
	 xLCQV4J4GcV+YIy6ddEMQbE6S+hEQ3LX3diagom6hWswOA7tIc5gTEDOM0/gJZrg7PnyY
	 nISTN7jw52D69OKkNaDRrUwj+dqHGk1lDycfUvfpFKWbhK+b6VQ4Odh3WOCGP7dITHhlu
	 reDtUiwbFxZyuIb13rKZRAUrrKjQLPuEE/3f0xm5+Nhh37U71PMRK0kW+JV4yosZzExAU
	 qrK0AufknhV7vrcQ8RRW0vzWz3nVKLu4PmrrG2gltOkblZBShofkhm1m7IZLN18+nyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VUtCOFoi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HEIAIx1m;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6700606A32A
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 13:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6700606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VUtCOFoi;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HEIAIx1m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794231493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGYsCV+6ghrjpGJ3qQugEb8Y0kCPQvn96f3QlByPPhE=;
	b=VUtCOFoin3YsnZlHv1bGq3yzV7qv02AZiKSQEwCqxciMjpsbtAYhunQCGP+3TJqorp8+7s
	XHva+KGu7ZSpUVy+QsQTGaGCv+s3xM3wiDikmYx+0gUM8sL7j5BEVbS58Ap38Ws2v8NlWY
	aPRNxjHsXiCuAMXedfUcgPN2MLoOSMU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-ERfYdL_ZPjeSZUvWtR3-Jg-1; Mon, 09 Nov 2026 08:38:11 -0500
X-MC-Unique: ERfYdL_ZPjeSZUvWtR3-Jg-1
X-Mimecast-MFC-AGG-ID: ERfYdL_ZPjeSZUvWtR3-Jg_1794231491
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48df02b91f9so545267f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 05:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794231491; x=1794836291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BGYsCV+6ghrjpGJ3qQugEb8Y0kCPQvn96f3QlByPPhE=;
        b=HEIAIx1myBNl8RKtNU2XaCgpu79yU/cswIopgOKAAckX76fZaPPdUZz80jomxlLDwO
         TKpL5uzkNnDfJql6smhnFjeHPj5toVH6EOsjjQvyTt2TTDk6jGYXTmWBMqt5oJ+OISXZ
         bNk3+uKL9NKgignHq9zvMKt/kEK8wxGyRNU2KW7txfTsNUrLo2Scc0aQESVh0r4NWCvZ
         JV+zF0NG9GxdWyiozHCOGj0s/PT/Uj8ExGGkdMxibWPUuFofVzD18pC5GlVDGIqE1EzS
         VbALQvoq1rBNznrl6Krqrwsni8JvywssTcTmdCSNFkjO7HhJndbap36p2vQswKUuf5GZ
         bPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231491; x=1794836291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGYsCV+6ghrjpGJ3qQugEb8Y0kCPQvn96f3QlByPPhE=;
        b=yRpidrvIn17ehh4z+UipWm+o/t+mmWAGrNca5E6BF0k4HD9Q3pbZqRYFyIdJDwi/Da
         uYEdeAL0fBeOzXr28mB1ISP0ONSopoOFOqgz8uHpEU/FUYp5gS3VqPTtVv3RzFzvPQeo
         /2gUfeL9d/AyvMtN9lmdn9GRC4lwBRMA1d5nNVtzzZ7UeYJyXRtCS2QhzlPFeOipBKUe
         u1GCVuCq56EoqySRRpTn97hPNkxdJqClgZEv/eCidx8yFQzJJylrISqGYJz7WnEvLYjn
         K3fJRNgIwRb6jMJ2202L4Id9INZsKy6cr/CyVr5ZoAfr1beji8IRQlahcLIxf7uzOzl9
         XOqQ==
X-Forwarded-Encrypted: i=1; AL+hErEJOSO9WTY9FEgTAZ46PNdibssyAzoV5waAV+74BbCYx8/TElAYc7/Usyfs1kUukjYiH8rkoLUOYr07MBulUJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6LFI8pHo3lOTIUOCM1tU3/7bPyT5k6Evl0WZir3rj77MD+0gk
	z5xB+yfEhQsJ+m4owlxNcWkWD2EQVvlr4B/1JFDuVEGlnTVfAZ09woH8N0cJg83KYaulQStS7yZ
	bRo2RvOVS097xnCmlLNlNye/17HBtDYdG/F9TlhzYWG3feQPF+VSye6eZ5FgsF3itTEE0kNpI+9
	HUx2aK
X-Gm-Gg: AYBFou2R+HXTiEBS5kEZ+Vubbwjn3wxi1UOCubR3MwWiex7EP5ri5QWZ/Jzvq2qv+YK
	ZEpf+2KDPdummN+f7/iVNQlXW29b9/bPHE+UXBXM+vRpi3lFpbu9r/rtYDHPieb6+gwTcrI4Hk1
	AmQ1MuN2ozzALBZ8PrEo1Ic2axpE9CpxklL2z3x1jJMC7MPqlvNZS4+8NRcHuyAs1/Hjeu65mEy
	sOONtmTGs+zEZJKRsrNl4W95Xyha3qG8M8VRyUNQCQpA007TU1BKFuZLzm0b1z6kfN7Cwtu6tX4
	tsHIZMLluDFa14+q6iRlHIcViryhYupYxhH+w1uG4sikjoVJ9yx7Qy2gUW0NEoiHTrpGPWI95UM
	Koqm/KYlaLTc1bVarFmOUS80e0A5oqauzJtdI8bsSiYp0K/hMTWNME+SVJVWX6gFkwCkl0W9wpR
	p0NA==
X-Received: by 2002:a05:6000:240f:b0:48d:f160:efad with SMTP id ffacd0b85a97d-49425566d13mr15141585f8f.30.1794231490545;
        Mon, 09 Nov 2026 05:38:10 -0800 (PST)
X-Received: by 2002:a05:6000:240f:b0:48d:f160:efad with SMTP id ffacd0b85a97d-49425566d13mr15141537f8f.30.1794231490148;
        Mon, 09 Nov 2026 05:38:10 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10965139f8f.39.2026.11.09.05.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:38:09 -0800 (PST)
Date: Mon, 9 Nov 2026 14:38:06 +0100
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
Subject: Re: [PATCH v5 04/29] sched: Let a task boosted by a deadline waiter
 change its policy
Message-ID: <avHMvpJonTciAtx_@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-5-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-5-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> A SCHED_OTHER or SCHED_FIFO task that holds an rt_mutex can be boosted
> into the deadline class by a deadline waiter. Then a sched_setattr() or
> sched_setscheduler() call on it fails with EBUSY, unless it asks for
> SCHED_DEADLINE. sysrq-n would not reset it either.
> 
> The admission test runs "if setscheduling to SCHED_DEADLINE (or
> changing the parameters of a SCHED_DEADLINE task)", as its comment
> says. sched_dl_overflow() then handles three cases, by the task's
> policy: the task enters, leaves or stays in SCHED_DEADLINE. But the
> call site tests dl_task(p). That tests the priority, so a boosted task
> passes it. For such a task and another policy, sched_dl_overflow()
> matches no case and returns -1.
> 
> Fix this by testing the policy, with task_has_dl_policy(). A boosted
> task has no bandwidth of its own to admit or release.
> 
> Now sysrq-n can take a boosted task out of the class.
> normalize_rt_tasks() calls __sched_setscheduler() without pi, so the
> task gets its normal priority. Nothing then drops the boost. At the
> unlock, rt_mutex_setprio() sees no change of priority. The pi_se of the
> task would keep pointing to the waiter, which can exit. So also drop the
> boost in __setscheduler_dl_pi() when the task leaves the class, as
> rt_mutex_setprio() does.
> 
> The boosted_owner_policy case of deadline_bw_test, added later in this
> series, fails with EBUSY on v7.4-rc1. It passes with this series. The
> sysrq_boosted_owner case of deadline_switch_test tests the sysrq-n path.
> 
> Fixes: 332ac17ef5bf ("sched/deadline: Add bandwidth management for SCHED_DEADLINE tasks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

