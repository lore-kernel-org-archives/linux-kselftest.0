Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240328;
	b=Nyv2df3xh0FZhhpGuCziuo117XGBYQM9H0Hf20Y4f0Bf+tEr6EJAEKddHtEMoBx46Lhv
	 wDRnf81ZretRDljWt0KfL9fJZhnjWNJr+5JB+dUhjYsdMBFsO4t8yF7DBzFhUm1qI5kAv
	 kG8E3jUriuOBl+Z2eBf4dRvob+uxRGeJzh2fZ0SfhbYpB1fS7cHe8S6TMOuakxfK9Vn8U
	 tAclpkU3Gny/yIngn16Dnqx9T0KllVoIZO5BBMXX698UbgyVbRWDBVw0MnyGi6xyK2NbI
	 ja5fv2oMAtHZDzhkQxztsYWXnRvVB2M5+ale1hfEDaYGFyzJzm1F07Y1e98QEjvLTTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240328;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
	b=0SZKH8exENRS+7+VMni8gcxGtgtcXfjZrOodQ9cCKR2EHlTNgnQ9YeXNWWnsxBH/L/Md
	 SN9TzjoyoPR02NgsUiAB9VVXX0qiPGfHd8IRQSQbdpc7LbF7AQRoM2wlrWasvtIaRX0mB
	 NAPYEz94VITrHyjQba1zaawZC1/rLpf4YkNkw+FGYRfhtrR/H12ucIp1wVKyh/FUitQua
	 Rks0HE1p+daHPKoc60W/giq1F0CTLGC1UqXulv/hhZjFx1Czf90Rxm/AnWllIYL5wVrUJ
	 XiT5M6ZVH3n427FYGirq6roxMug79ZMkL/+RnxObeSYsiW6BAM3w6XT1nsr+kI/SWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dTNjyTE6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B5PWwWw6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E3606A339
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 16:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F3E3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dTNjyTE6;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B5PWwWw6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794240326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
	b=dTNjyTE6gbys4+kdkc+zDljpEm9IqAra6drLe7r7REOn7TCp10HjjXJKj8VfbrusYbzpvW
	NQJH3DaSqYxtV8iXFEI2TnyFroSSPkIVChF+KukEUm5Wrj96aEh2Fgbov/++7/XfQE8JK4
	ZV8v5SutxWsxP43PKa5XP4ufopeRgZ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-qZelQqLBNFG_Q03aDJjD6w-1; Mon, 09 Nov 2026 11:05:25 -0500
X-MC-Unique: qZelQqLBNFG_Q03aDJjD6w-1
X-Mimecast-MFC-AGG-ID: qZelQqLBNFG_Q03aDJjD6w_1794240324
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so8524905e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 08:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794240324; x=1794845124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
        b=B5PWwWw63AqQGP6aPZuN8Tk25j8UkVRJXzAcbq4ejEdJlT1oifD32CJOy1gJvaz13K
         8817mPy03rcCWGq7VwovwuuKF67xQtmMS8MQtE5mC0Yfsh1W7I8iYLXbMx4l5VhQGYkB
         uVE3eCtNB14iJTb6A7+asAuMxlcqIONlNuwc8CMbDxDYC+qpbWfzVCdbx7Pb/UYtij82
         ccZUl9jUoqhToyYrvizq+mv3hGYId4R6dpky4rWNzpZ1D3rHYVSqXkc1RlSfqTFareBB
         /esnPeNbcN/CsmeypyYAnPx9gHrhEOcu7H2eziDMV2vJM/NBr3+09rUgLDCQswDF2wjj
         DsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240324; x=1794845124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
        b=bBz4DswbigPm0NpvDAqfbCcUQ2KJwfrMkRR4vtjUXWo1KaTapXnSeQ+nQCqGDLu/rc
         4L0Z/je2BcUPA7eOMUaqsbgG1ObId2SMKWq7PdqdBFYzVavUiC2kJNOkbdGn0esQreLF
         M8GwM/qU2wx5dHoNPKHw6HL9U28DXQ8a0FS1+qkp9bSWYNUjqMFKDj3BgCXghNMmxUjW
         hxvDcL3qa37meaiPvayRLR/JLSMe3OX/6QTuLAye6VKbXnPM8OXHIMeuBPrU8F8MmqzI
         xk+27YRIj4FS0HGy3Eo+mg7QQrsEM6tvs1KscR/cew81LVw5OfDkO0X9II4DDP203xa5
         SUdQ==
X-Forwarded-Encrypted: i=1; AL+hErGLl9UF8/1P+QsBTZ2na3eLCJAtg/vmGSrkucNnMsRHftAlkOolgqd5RIVL+PVgEXo7ztgm7RrCLeew0vrYib4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sqKCg3KZdn7BFQlCKhpYL6rXGlASY4eXKo49n+60LnDzqhPlG
	GNCtg/jUnQ7yCCM7ykwcEVhpY73Esr411xdWdyLLK+0bKBz7nbtHdG3D4MZ0Rt4PyoTLj6Ib2e6
	x+Qj2oRl6mgdDEaOw8j5xes/dztDQvwEsYRlZ6rrLnn3xMuoiQ8zKwacJwwWNPyCv7ef63w==
X-Gm-Gg: AYBFou24CMyRc38xc+sKgKAvpmaIFC1A8zT5iT00OKH2CzD1kxg/Ie0RDnYKBHacuvI
	XxvdSzCRz0e364AMh35ytH0nvAmsf21RCcweZMaPtkfgurCPWQptaYsh5ob+qW9VStagUZB9CH8
	Ms1DZa+SLNzjuVsNIs2gboIcObqlsNnqLzUcvtyNh+NWrgH8H4+ZhAQsyFHIaOA7u/6V9Nry46W
	4cU3IgBWda4ufO4mk/+E8eKgddmZqYewOVL0rIIoxPds2brXX0OJe9lBw5xWncBqLI3MIazHoHr
	nGB85Eu6uvyRBnCIdnayhP4og4eoioHaiTXb0aavOylBgXH0rFhhGmrb4uOmYBKJemsM5QAn4fs
	E65BMTn4oSEUSCMygGu91C4gj3zgiyLZdHjC7IAqeHTNeGCdzDPl2eehs3UQ8vNyxCPnUm6faet
	Zkzg==
X-Received: by 2002:a05:600c:19d3:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4b9633cf337mr86690885e9.9.1794240323568;
        Mon, 09 Nov 2026 08:05:23 -0800 (PST)
X-Received: by 2002:a05:600c:19d3:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4b9633cf337mr86690105e9.9.1794240323029;
        Mon, 09 Nov 2026 08:05:23 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596acf465sm12474800f8f.21.2026.11.09.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:05:21 -0800 (PST)
Date: Mon, 9 Nov 2026 17:05:18 +0100
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
Subject: Re: [PATCH v5 07/29] sched/deadline: Do not lose a throttled task
 switched out and back
Message-ID: <avHvPjz4dL0zNyGb@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-8-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-8-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> A SCHED_DEADLINE task can be throttled, switched to another policy, and
> switched back before its 0-lag time. It may then never run again, not
> even to die of a fatal signal.
> 
> A task that leaves SCHED_DEADLINE keeps its parameters until its 0-lag
> time, so that leaving and coming back gains nothing. Commit 209a0cbda7a0
> ("sched/deadline: Improve the tracking of active utilization") moved
> their reset from the replenishment timer to the inactive timer, which
> switched_to_dl() cancels.
> 
> This misses a task that was throttled when it left. An overrun can put
> its 0-lag time after its replenishment timer. That timer fires while
> the task is out of the class, and does nothing. On the return of the
> task, enqueue_dl_entity() leaves it to that timer, which has fired. The
> task is then on no dl_rq, with no timer pending, until it leaves
> SCHED_DEADLINE again.
> 
> Fix this by replenishing the task when the timer finds it out of the
> class, as for a throttled task that is not queued. Its return then
> enqueues it.
> 
> Clearing dl_throttled alone would not do. It would forgive the overrun.
> A yield left set, or the old deadline of a constrained task, would
> throttle the task again. The Sashiko AI review of the first posting
> found this in the first version of this patch.
> 
> A cgroup selftest under development hung on this bug about once in
> 1350 runs. The throttled_round_trip case of deadline_switch_test, added
> later in this series, fails 8 times out of 8 on v7.3 and v7.4-rc1. It
> passes with this patch.
> 
> Fixes: 209a0cbda7a0 ("sched/deadline: Improve the tracking of active utilization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

this still fixes the hang, so my v2 comment stands: take it, and keep
working the potential additional re-entry corners separately.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Still have to review them properly, but between 09/29 and 24/29 I
believe every return at or after the 0-lag time is now covered, that was
the bulk of what I was "seeing more of" in my v2 review.

What I think is still open is the other half: a return before the 0-lag
time, with different parameters, where the budget carried over from the
old reservation is never validated against the new one. IIUC that can
only buy a task one instance past its new admission (it converges at the
next replenishment), so it should not block this series and we can
discuss separately/later on. Just mentioning here so that I hopefully
don't forget.

Thanks,
Juri

