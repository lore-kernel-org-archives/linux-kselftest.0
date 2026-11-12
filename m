Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476286;
	b=padNbIB5OZ31dOT7uTomjP9lx380ITZvzsTJk0ghYV5yNANHuEYcb3G7rwYmjNzOxSYR
	 ku7KBcAUjl6bi+TtT5K6pcdgKrqghV3gZ//hPqXtEYQ5EceqnYYWU6qdx+uxSMzjTfDRs
	 MtQRBw/W/X3XYFJ/Hh2gKmVLEDKCpBXFcZuulp2dUT+ZRWl2x0PRMy3LuEPlJnC/XiEDs
	 Ga+wdUv2pICyIWy7nR2YGWHBI1QCMOoF5FOmOsEpsSmeZPWsIkh+bIg5EBFqA/Q+wywYr
	 NQz6wgs9jlKU87DV2GsuT687+CMkdua8maNbqd62UqIwGq1HQYQIAJvxk4pV/UP/Yeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476286;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2Q2wLBAvQA7zhI3hvi4k1wNI9CYCQNcNSH4dFF1LSMs=;
	b=pUc6+41dECfiT9yNo+oOUdYZXlhr5a7yLvq1Q4RjaOC3wjF9FF0p+o/Wk+jzY6u7l8c4
	 +VdCLQDu7gJ6mWYfyDuJ0ksEGMsBWwnf9K4GrUjMUbK6F4yjPUYuEuf6RqgEW7ol2i44c
	 gZ07UTsBPMLuCSdNNZZwlOQArKymp12d7QwSlouPMuU+NGGcXsZDOomaXbkFJf/Mo7xf0
	 hUoMWBxrj8XmGMxAEAqI/ksjsUBb7C9hn14Cwtc45Ai3Kms+8X2H0529duEOfT7kPp7R0
	 QFmKYANjlySXdDlOujx1UjAxDujfWIYkCq40VYkiXOm+tbDVSyDGyUh6hTCvfCnajUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MUz+cl08;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BBSmUs+g;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F4606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 09:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9F4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MUz+cl08;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BBSmUs+g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794476284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q2wLBAvQA7zhI3hvi4k1wNI9CYCQNcNSH4dFF1LSMs=;
	b=MUz+cl08ak+OfTibrMm7X6gZQ0AW5YqWpKn5A0JOj3zqrn0Hl3dDc/ewJTok31/vOeIh8N
	v2bwYL/MXLD5OX+hLfacoIcrmZW6U1obqh8qZRVz/B1XD2a/06dYzyMV0TmZ0Zc9ORmTQU
	GXNNdb00bfIxE5XJACUHeazlfu4d5ug=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-XP50aGgrOlOenmfNEUVUTQ-1; Thu, 12 Nov 2026 04:38:02 -0500
X-MC-Unique: XP50aGgrOlOenmfNEUVUTQ-1
X-Mimecast-MFC-AGG-ID: XP50aGgrOlOenmfNEUVUTQ_1794476282
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso29728325e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794476281; x=1795081081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Q2wLBAvQA7zhI3hvi4k1wNI9CYCQNcNSH4dFF1LSMs=;
        b=BBSmUs+gQM2O89srxVufMBVcWy9YYrey4WVZRAoYSAu9kYgPlwBEtLHPZnJpC+OQoz
         3oudl8gdExAQQCPU7MSvc5QyYaQGqiF/EeGvlaWu7SfkbtUogXG3ke+iZ7s37gZr55ZC
         ayWWkvHgkZS8NHsQGrX4V2pKMH/7iEAx7+/tmKV9L89yWO+Ndq17+R6ma10h1IZj89iB
         GSbdo8aFKJygrbrCnQqvX7ZbFzH4EDpKrspAK2+MN7CH135pswjunxJoC+YnDL2isd29
         rzPt6Mks5ht+01fHo0y+wjViWs8F3Yn3wtYONSYRJJmfRftVpG6X6RCkdzmNuA8VrZ9b
         ulZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476281; x=1795081081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Q2wLBAvQA7zhI3hvi4k1wNI9CYCQNcNSH4dFF1LSMs=;
        b=2F0vCbiH3SppSPJDv1pHd1JfqE9g/a11qS6uELkBC4fdGkOydzXW3uoFMJy9QI+Wq0
         TmpQFqhZHgwgf+EpFBYbH0irRZffVypExfOjDHJKt0L02CPoI5Qtf2INn5V4+ObEV77q
         DjdJSLqFezZ3bt2y+2n/Jn/YAY45Hoyl3DXOcw3vyCHBsrP6wROAqmFW12M1QkrZUkj2
         VL2GVRHd+lsoCBFqx2Ezi+ZZylTOEDJmvGLztsYr5pcZuGZlkvZFT+hbkPp571zrGy8H
         q2XRl4WKOEHm4nV6Okiqt0M4ZUucnRFLgehoV3jY9WDeV2Q9zDEjOccC/R2V2ImoHgog
         LLUQ==
X-Forwarded-Encrypted: i=1; AL+hErHCpT+htVpBSTZ/H0rOo80Suyri8vSFUidBijMW+meXAotxiB6RzR4Jv6gaTiEalSzveMFgN1mHTLjHSF/R1pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T359QjRbQN4QnKVduZv+DjGAQH+23fi9UJDpTh0aZN3I6MgE3
	VgH/UWdBNGJ/GUhD5jee6cTFWBDnjeQ4LnKCHz11dXeyTHconWDaehKF41kC4Rwziewijqm59p3
	KCQdhzQ2I7rm6rVyjPZ+Hkc/3bhvR9eLEaAOICiirEOuWXkz0fvoLYawZXa7/VjtGLATZQw==
X-Gm-Gg: AYBFou3cMwPaYIzKLg7tXV+tpRu9a+ngc7Y/wVDpGeE0MAcQ0eVLTC/9u7H6lMVcfNl
	cADHTrW64DIXkCr86TRG6dTk8Mv/lPgjlbfYKl0l80KXEjAbVN6GMODdBDd7uigdrMudeDpxtFl
	Y3oVkk8Mo0ZzuTUHCgLmE582hd6p3rG7+GCnpEs4LcMvEPmR8oH7uXnNLl5Vy6irF/c+qikXZsh
	8JSLemdYdaWXpZu2zdaVmLmFGkiZC/Uyw0cloWDY8UZ1j0+W4E7/EDkFQsNWfFMnMPCzRfK45sz
	SMXhbCFcInAhT1lcSbJOfbHuDZ5BxU5Au3wCAlir2GW9N68vEJBRJ8YSOsreoxJij4zgKnvEOs3
	9OfyXICGY21k6+uzP6clP6oDh5BZYQAi/psjj0NCBKfHtvuJqQNJArTPE9HBUEeJdjm6cGYml4G
	PlNno=
X-Received: by 2002:a05:600c:8b31:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ba0938af50mr81189105e9.25.1794476281606;
        Thu, 12 Nov 2026 01:38:01 -0800 (PST)
X-Received: by 2002:a05:600c:8b31:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ba0938af50mr81188685e9.25.1794476281207;
        Thu, 12 Nov 2026 01:38:01 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm103301585e9.1.2026.11.12.01.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:38:00 -0800 (PST)
Date: Thu, 12 Nov 2026 10:37:57 +0100
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
Subject: Re: [PATCH v5 24/29] sched/deadline: Cancel the replenishment timer
 with the parameters
Message-ID: <avWI9aAp46J0ezI6@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-25-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-25-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:54, Mathieu Desnoyers wrote:
> A task that leaves SCHED_DEADLINE has its parameters cleared at its
> 0-lag time. Its replenishment timer can still be armed then. If the
> task comes back and throttles before that timer fires, start_dl_timer()
> does not restart it, since it is queued. The replenishment would then
> come at the period of the reservation the task left. Too early, it would
> give the task runtime it has not earned. Too late, it would delay the
> task by up to a period.
> 
> Commit a649f237db18 ("sched,dl: Fix sched class hopping CBS hole") armed
> the replenishment timer when a task leaves the class. The timer then
> reset the task if it was still out. Commit 209a0cbda7a0
> ("sched/deadline: Improve the tracking of active utilization") moved
> that reset to the inactive timer, at the 0-lag time. Nothing cancels
> the replenishment timer there.
> 
> The timer of a throttled task fires at its next period, which can come
> after the 0-lag time:
> - A task that yielded is throttled with runtime left. Its 0-lag time
>   comes before its deadline.
> - A constrained-deadline task that overran by little reaches its 0-lag
>   time before the end of its period.
> 
> Fix this by cancelling the timer where the parameters are cleared. This
> includes switched_from_dl(), when it releases the bandwidth of a task
> that leaves asleep past its 0-lag time. A constrained task that overran
> as it blocked has the timer armed there too.
> 
> The Sashiko AI review of the first posting of this series found this.
> It has no reproducer.
> 
> Fixes: 209a0cbda7a0 ("sched/deadline: Improve the tracking of active utilization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

