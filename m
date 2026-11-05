Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874008;
	b=ScBZcxD3eBAVnx7WoZ29xUTLJSXEae75mi2z2XGtJ16LsyANEolHwW8XMXQYeRGr/CSa
	 n2A9/w4yE2Gb/qO0KeN7w6q3aE0H/NYOR3rBAeLX78c1UP+IySEALgnWO0jP10mDfnQdA
	 aq7dNo/ZiJrvvlXA2U26tiNhGSUNjr1ZIsst/enDnb1OWBfK9ZEAged5wJisRYofDv1UQ
	 Wr/YhB6bz4boXdgtQXRZQf+KkUrc4fhiaiJuxDM2bdtv2HaG3OviUSfv6AVbPYDN1Xdt7
	 /7iIb0MRZ/AUl8RznU/R2mGPVIwRSnW+TiTx8ruaI5xlp70wEu6qVlEmuhs5rXkG+mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874008;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
	b=V6n8AfXiDyxqtuczF7B8UvQaM8eHsnUdY5npIq1Hy9s8nApySsKln1C9f+uTi7jrfkKP
	 oKk2/990sorEun6PV4sTTLUjU/XDtl6Ucg0FeXjShZS9tInCD1AelMOc/+DyonomSEKUW
	 n28YnQlcz/82L6aAEk57CqN2Pdak/Hb8R7oBe4BCITzYQLrG0+Q5W76PeN2P5Tvb9BMSm
	 zdFiI7Tx/5+Lf+JCuexJSmXj/P9sKs7ve2qxsA7Tp8ys0WYT0iez8kG+/ZxVi7qT1glOx
	 AigD5T+ZXU5OsDrwjAmzd/+zd4t5dAhgWclXk5EmUG8tKTAWTNG/cZMgp4/pQ547Y1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RVMizxq3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="XmGn3o/S";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2F606D80A
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 10:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E2F606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RVMizxq3;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XmGn3o/S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793874006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
	b=RVMizxq3WA7yB5gxR9RywZOUc3uWFvZMx5B0vK/JhZtgxTuEjXE+fKptotsbguxLlYxq7/
	fl+/w0wsP4dqs6E0x6o2oAi0CQXaMsCGNNuDmhtWkFO6njOqUogwE9DmmdJtTZyb+/RgQO
	K1ANUyxjlPKvEnlQ6iiiam6Dj5UEmmY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-kI8MTKjZPCaevpnfJnvc1w-1; Thu, 05 Nov 2026 05:20:05 -0500
X-MC-Unique: kI8MTKjZPCaevpnfJnvc1w-1
X-Mimecast-MFC-AGG-ID: kI8MTKjZPCaevpnfJnvc1w_1793874004
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so1482671f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 02:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793874004; x=1794478804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
        b=XmGn3o/SRsBJRZkpXs1pyJ4yDOw6yxczQjG1FFlMbs6lL8/iZaeRMfizV8RMim/rV5
         s+aRRe9P/2IAouXwNl5QYZo4vQ3/LpTFP4aGNQ5oSoi5TXNL7Yv7bwQiWG3tv7mQr+Ch
         DwC16ZjbZCSQusLXy+yjphl/zUMZigoR6smKaiT1hlRkT4YxL4Fn0C8e+Q0St0KZGgrV
         914t2FPRRr5FVNyBxkxh1zkT1axHaHO6H2Ggdtu9zgdc4SVsePPnakHUEnqsnZMRmS4a
         4ct5HntOJxV08+E8hy0xJohgCOS5ZivZhfDML46SCkioc5TLMZEJsYjwm03u3hxyAm+Q
         cGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874004; x=1794478804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
        b=zaWGrkQeRQz/T+zJtkiCUl/tTOfOib6qhxn+i6CT94u2+qWoiL8qXWjcNQtilcy2w5
         yh7JMdvCpWe+lNeGhzSbkOtZ2d+2GfW361UgpSX/FwiWolqf7UwJ3Hx7CFDMVenMoH1x
         LMJ1Wie7fgDZ+GpScQEvjy68LD3Rc9/+b4OTybBpHZy6AfXAnu0n/P9YSVuuLx0AJ1Ga
         Eeme26sDt8Du9BreqKaa/vCkqKvBDlNNKCLUhRTLONc6kqDfUv+3BKtdQlQX8iCSc/sh
         9RW/Tq7rehJbzRcyfN9c4FDXdd0fQOif6mH1g26WGi4MNarVom7LhozsD0I2htNAdgEZ
         T42A==
X-Forwarded-Encrypted: i=1; AKwUvByqripyFMCedAAlw+o71TehGdcqqEllNby9RRBXRzuLkxXnQ0mIiVO695NIJhRljrcLxO7RBJzEhnolEenJFwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ErJCO+LS/QqKVf5DzzWGtLB4A4Vz/CX++ewaUloOwq81Lb065
	hMBeijZazf5eEsVMj1It3EIytg41CkaEBT+rLxOVMBhZQkJnDx4OsNw1YJAU7ckYZ0jCCkjhRDY
	DOlcsn7ebW9HBNYIpClH4SXt1ReZnuxuQoa4kaKXex1uyk7zBPtImgRj1BQzGYcMV4gI9fA==
X-Gm-Gg: AYBFou2vxjgzD5lTk8HMqsAjkf2NlP7cN2YIRpMnA6i0pUO5fz+zU/gQo6V47vEbe2Y
	47pPD38IO3raGDTe0mfCUCMwz/eZgqJlee6AZI8vVKRE6NwjNj7nLo3ggUeOQ18UQc+8OggSrkW
	fAFE7RFjyj54/ttt1fKdM/+WWOCaz8N2daoI8Ft0puexJzD9cxEZIg7kgi0r7F0MWuvklp+vZns
	fPDtXl1aE5rr6XG3UxEDK+dEdz57BEtgk8Y+4eQk7ocJXNV+pI1J9ZqvRN2Dn5XmVTcdSezK5kQ
	8TjjnKeJtb8Kh5TsOwCrT842PHTh1ztmik0L+ngNq3jPw6Nyonl/TN2I127PEUP6fJHY2Kdytsx
	6gIT0i/sHoooOSBHUSl9qvDvQXzBHIEVRCVv5jY83vrtci2EFAtizEh1flhx9ie/nbOKKXNLFZo
	Q98A==
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr39671588f8f.18.1793874004497;
        Thu, 05 Nov 2026 02:20:04 -0800 (PST)
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr39671524f8f.18.1793874004043;
        Thu, 05 Nov 2026 02:20:04 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180ee1sm10646770f8f.4.2026.11.05.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:03 -0800 (PST)
Date: Thu, 5 Nov 2026 11:20:01 +0100
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
Subject: Re: [PATCH v2 03/21] sched/deadline: Do not admit bandwidth for
 parameters that are kept
Message-ID: <auxYUb0-GSpZjhd5@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-4-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-4-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> sys_sched_setattr() fills a SCHED_FLAG_KEEP_PARAMS request in from the
> task itself (get_params()), with no lock held, and
> __sched_setscheduler() then skips __setscheduler_params(): the task
> keeps the parameters it has, and its dl_bw with them.
> sched_dl_overflow() runs all the same.
> 
> A parameter change of the task's own that lands in between leaves the
> request stale, and dl_param_changed() takes it for a change: total_bw of
> the root domain, and this_bw and running_bw of its runqueue through
> dl_change_utilization(), then hold a bandwidth the task does not have,
> and the release at its 0-lag time, which takes the task's own dl_bw,
> leaves the difference behind.
> 
> There is nothing to admit for parameters that are kept: skip the check.
> 
> Found by reading, after the Sashiko AI review of the first posting of
> this series raised the case the previous patch refuses. Not reproduced:
> it needs a parameter change of a deadline task to land inside the window
> of a SCHED_FLAG_KEEP_PARAMS request on the same task.
> 
> Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

