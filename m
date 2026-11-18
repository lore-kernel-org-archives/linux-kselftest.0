Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016028;
	b=CMVhIWarsecmGLIRKTOz5uFPsZVY9knlwFnRlgWCp0qa0lc9L/OSOx/gPD3DYjFdT8H8
	 F0qRRJSxGdfx6vQAXxZyPtG7EdFD78kHgjzfURe60vtnCuFxQcV7RNEM3zKWMybjoelul
	 YVOGGLQl0TQJxhzDzW7fzIv7JpLpYexiP/QqPB47ZXRpyEvwJGC47pO84HeBGu7V53Ruq
	 IAvfNImmvVYkXIwVv8+xvuFJVicNix4IDmkEhhVWG5n4IaoxyQ6rRS8DvDqprZXjX3cbK
	 dMsUZ9Deu5R0x7Def/Dkenl0UjQ/nfYJjJvo/X8CrGbrSl+KyRe0tUyRiN0YLZc9ZZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016028;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=x85cpobaf638Fe9w3ZW1Zro4FQs+4uIPwl9i5atMIvg=;
	b=rxeVTj8abcidzecGcND4xvpocOcQ8kAspZmMtZL89Wzia1mS9huz+OakSpEYH6D0zqjt
	 PvBSUTWIG/icJMyh0nkBNwi/gC0ZFGbnQRHLAJZCcOK3KmXpHZSuZjLuk01yEPFIsoTzR
	 x3IQ01ITmYxGMIWtGTKb3BfQMOJdTRyH/Pi87JnClo7uiGJZMXFMuebcgG/ALC70Erdqc
	 4dQ8zzCqWc1bRUA2viM4w3l3+1iKRU+sqN+faaRDEnO8M+TxwP6okelT/rc6msR2I8/0s
	 FnfsXcFc/8xGGSWgE49/tTS1EMjb50Ja58mqpsA64v2jHpU/5/0rPbXPcOcXJ4jY0/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SMHVdGhq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hjapHfa9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A234606A325
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 15:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A234606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SMHVdGhq;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hjapHfa9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795016026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x85cpobaf638Fe9w3ZW1Zro4FQs+4uIPwl9i5atMIvg=;
	b=SMHVdGhqsrOTmOb/h7yyl7JinrKAkC/2HQEylbpLDrEdToSemJkq0rZnXh/1bc3keuw82u
	Tm4M+YIsPV5AYYtZqxRkIqD6Vt1WP8b0VAfz38mPiC9liNh0AeenirvzdaxvuK9XwOunVR
	JGUCx1kCMnj9XixnhrH1Mh5pUo5GOAY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-nRAjkd80PX6laab7ZlcYww-1; Wed, 18 Nov 2026 10:33:45 -0500
X-MC-Unique: nRAjkd80PX6laab7ZlcYww-1
X-Mimecast-MFC-AGG-ID: nRAjkd80PX6laab7ZlcYww_1795016024
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb67b2c00cso11492145e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795016024; x=1795620824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x85cpobaf638Fe9w3ZW1Zro4FQs+4uIPwl9i5atMIvg=;
        b=hjapHfa9Gh3Zmy9e0Dd9POv2CixHjjA6fXGunjIJ1xJ1iLutSfN3J26cEelLg5++1s
         aybMZHXUIPLNRvWSWyhJiy/LqnvrE8LIUVyHrM6gJKVkEAuHl6KHOhdUW//uGfE7oO+b
         N8th80yZMR1lm3M0MtWxQ+/wjcTW/6SGrGFkJ8Euu1CzQf4xmmIUYhczo40kdeufkohy
         1iv+6emM7lalwYFFhqy9d9C1VXmgGIEel5Ie3rXEUGDEkhTFUHnhc8ozAp3cRDc3ojYU
         jzsuQ0poAUXPz0V3Jkgsr31wy0pnbjcKgCmJluwtndAp5fcJlFgxAgdcdvlv9dsjIqR7
         Bi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016024; x=1795620824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x85cpobaf638Fe9w3ZW1Zro4FQs+4uIPwl9i5atMIvg=;
        b=JbnuDN9U4BguE3AhXdwz5erX033F547iZMGC305ksVKAl41PPkbfSwTym4e29VkhQw
         9W4+3e+KrM1wabITysQcnkOrd8p7zqCTXd0YyJbMwh6uSMVvB91wToh4I7GqaP3OONPm
         uNzYR63j3YEQGBqbNcPq33Ctb9enMg5cKqblbs4k0436UrIrcXhqDJ5hXGxuMAkQ34/n
         gt2OWBq4r9e8Mms9nM1nFLOCnH6/HKe+RftePYq0dUOKIRrsE3DrNYCORpAnS4s5WukO
         rdkDLIk+4OcGFk3YIDceJExPdUsEhWeRfrzp2JuZ1bPVyAq21koS+L98sywHQ5izS4VR
         /XCw==
X-Forwarded-Encrypted: i=1; AL+hErFlOnYb89MeUT+lQCpb0a+jEFBkRsFVcM4iCYlfB/CruoVoO6XYMYG+3wwQkw4t3lzkleeeYx9HeS5BJZ9vZGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5liFJIP+6f8tfN0dk2r1a8SM+LJqHfAoKaiwH5sZtGSqcVm5C
	/8UU+21mFXzfdw2B4mTisbbLEZHk/WfpVmI9drfIctUnc+QlhH1eIT7cBw2YhdO624s9FPAyiuq
	qgH9jKhItreq/iVoq4KmpQC2E2sW+NIyRXNNOm+2vm8elxiWPcaITfSs1P0sSO47/5sALmA==
X-Gm-Gg: AYBFou3HbiUiglCBckqwBDcVjtuZEaWg7mBNWDynId3mTs4nrZH9Bec7SbGFy++fEEt
	MM/CGB2VHJKiJNxglQKf8r/NgoDPp07LtJdQcWrvSlelG8u5pMLpRk7yiib60kOw6fGZNym5/n1
	A/zrOUKVGelHIcJC/lmEkyUFkw3MJKdUsr2pDHaCHci0P/vLiJaCW8RqbfMjJd9aNQ0wfxhBXqz
	tsvHNg8141m/nvpQ0cM30L303gNnSx8gOmVyPqENSQ4Z5aalQ8gcJ/NZDiyC/4r3LL4NQbC4Hj4
	BERG+T/dQcvdb8iMcEgFSTyEc1p8kwUui16QXhjmFrYrPnHq1T17YDmiHSmTI7zglbS/t9qrs+k
	VnihlNJLkwpen/R73jeoCwWd3xFI/LrN6crk22VvblRNjbWrKKmpAQWoCACAu4xLiDKxc8RpJCF
	9EATE=
X-Received: by 2002:a05:600c:37c3:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb7d6cd4ffmr53090085e9.2.1795016024125;
        Wed, 18 Nov 2026 07:33:44 -0800 (PST)
X-Received: by 2002:a05:600c:37c3:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb7d6cd4ffmr53089605e9.2.1795016023651;
        Wed, 18 Nov 2026 07:33:43 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e50e992sm37379485e9.0.2026.11.18.07.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:33:43 -0800 (PST)
Date: Wed, 18 Nov 2026 16:33:40 +0100
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
Subject: Re: [PATCH v7 13/40] sched/deadline: Release the bandwidth of a task
 that leaves the class asleep
Message-ID: <av3FVDh4PX-5gWSW@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <a809425266acca7cfadd2e8187a7b5a815ba32cb.1794922146.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <a809425266acca7cfadd2e8187a7b5a815ba32cb.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:
> A task that leaves SCHED_DEADLINE while it is not queued can keep its
> bandwidth in total_bw until the next rebuild of the root domains.
> Repeated, this fills total_bw up to the admission limit. Then
> sched_setattr(SCHED_DEADLINE) and CPU offlining fail with EBUSY.
> 
> A task that leaves the class keeps its bandwidth until its 0-lag time.
> Releasing it earlier would allow temporary overloads. For a queued task,
> switched_from_dl() calls task_non_contending(). It releases the
> bandwidth if the 0-lag time is past. Otherwise it arms the inactive
> timer, which releases it then. For a task that is not queued,
> switched_from_dl() relies on the timer armed when the task blocked.
> 
> But the timer is not always pending when the task leaves the class:
> - The task blocked after its 0-lag time. The timer was not armed.
> - The timer fired while the task was still in the class. It only
>   removed running_bw.
> - The task was woken up on another CPU and is not enqueued there yet.
>   The wakeup cancelled the timer.
> - The task came back to the class asleep. switched_to_dl() cancelled
>   the timer.
> 
> Then nothing releases total_bw.
> 
> Fix this in switched_from_dl(). For a task that is not queued and has
> no timer pending, call task_non_contending(), as for a queued task. It
> arms the timer if the 0-lag time is ahead. Otherwise it releases the
> bandwidth now and clears the parameters, as inactive_task_timer() does.
> 
> Clearing the parameters keeps later paths from releasing the bandwidth
> again:
> - A timer handler that already started finds a dl_bw of 0.
> - The deboost of a later priority inheritance boost finds no
>   parameters.
> 
> An owner that the task boosts as a waiter can find the parameters
> cleared too. "sched/deadline: Do not replenish a boost from cleared
> parameters" handles this, so a backport needs it first. Without it, the
> owner's CPU can lock up as soon as the waiter leaves the class.
> 
> Juri Lelli's first fix, since dropped from tip, released the bandwidth
> here without clearing dl_bw. The bandwidth of a boosted task was then
> released twice.
> 
> Juri Lelli suggested the call to task_non_contending() in review.
> 
> The Sashiko AI review of the third posting found the two cases with the
> 0-lag time ahead. deadline_bw_test, added later in this series, tests
> this in pi_former_owner_asleep and deboost_released_resets_period.
> 
> Fixes: 209a0cbda7a0 ("sched/deadline: Improve the tracking of active utilization")
> Reported-by: Tejun Heo <tj@kernel.org>
> Closes: https://lore.kernel.org/all/2b5fb3f22bca6aa383be8f4781923392@kernel.org/
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20261103-b4-sched-dl-bw-fixes-v1-2-dd761fe005b4@redhat.com/
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

