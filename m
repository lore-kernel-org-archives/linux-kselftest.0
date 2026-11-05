Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862889;
	b=ibDrFzsRTUrXUMOZ2M6pDdBh2GX6jdAyteQbTSCXfCRTLsOgXkE2nOR9hkIwDSJ5KQhz
	 N72fiHzWHXyPhPalI2QmuGglznenXHt8i22puWn71uSzZCL1spZriExz99VeR8UdxUw1B
	 9hFkq4DRCL0Jzj9c9l0xKaBjgwNS0BrnmIwP1a0nTwXjojZZLUBXfaKetoRvCAN4LvmDV
	 LspPD3Q0w3CKnvO2mRVZAaYG4SBz4LwlTR/TsGbRCinda44SkqgJDHXMIOILD/p+iggIF
	 Hegu7inWx9sGo3FwYkD1bDSIvg2J+YIl0zS4s71SEk+5lscIQvjvX5VgkuC1TwptcNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862889;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
	b=Geclz6gEEPIQwS0N0RrOExD74oCULmcw/WWtpq1bGlnOQSMBQ+3DiKQkZIlazIX1CHcR
	 3lrbXoVt47TDThtXH+pG4vVJc/EeyDmK+C/Hp0uePtL/EYOsyFqoLTBYsUi4XlTuEWVM2
	 p4TE6LqBOoAjH8UBEYe/vW2CZNZPa6dELlcn6Nd2p5saOMWveayvV6SqEdkTZlGgU+WbB
	 pdBS/c6+gIvwma6nmyn7mfnRt6DwvcndhKBFphxXLp/cPTSxL23yUNMZvNLmJCnsWeAXt
	 YgLKqvvxyf0YhkNnO81F5xZGK3y2rHdzOVLktZjf9ra6boRR1zbnfAClOrWnxH1ZAxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAAtYU2R;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XumuW6oi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56343606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 07:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56343606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAAtYU2R;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XumuW6oi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793862887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
	b=VAAtYU2RgYH6pQzcks5y24LAZUYSV56hDWarr8l094ODjAnp8V1cuOURn6ywczROCOympa
	WveQ1JOJ8guwZ7ZDZMWMN0FKJCg4DOZ5Os5d85+LeIDPq9/IND3IAx3owZjauqdLiyj1m1
	bGpdYFf8bCLQ10xsqShdxjoYOqmGyMw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-tqs4srmpP2ex-WJvlY8Y7A-1; Thu, 05 Nov 2026 02:14:45 -0500
X-MC-Unique: tqs4srmpP2ex-WJvlY8Y7A-1
X-Mimecast-MFC-AGG-ID: tqs4srmpP2ex-WJvlY8Y7A_1793862885
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so18645795e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 23:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793862885; x=1794467685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
        b=XumuW6oiQTXigEVxC3UHVAwrKCYL1EEn7E32m48Ko4QP2cFWCAPjnLrKEFWy1rwBuB
         ilv43E/3WOJglVkTMZ8l9v9liW8tY3OlgCmZ29DVHm03/IHV1oIW8hkl1b8HvgOpvWXh
         KFaHEgQS+si5j4Uy596RWbLGsBamCmT8NpgDPcpow6JCsAqObeoeni1PM6AaOvJ/xc+D
         kTVcKRqvjzgn0dK1GmLzCBxvkbB6/35y7Cd0SmiSHSVaIIv72nnu/acXSa8NrpciVV2E
         6Rr/CtKL5wxX06v/SeZxJ+Wsmb79j55O3RF9Lm6iJ56+6kDGPokO95FXaR2OvXPGglU9
         OBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862885; x=1794467685;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
        b=SwMbe7N9lwyCn5kBKY50n2zoiKgCAEI9nhrM1UGRBYkYuUz/CBkNjK5B+2pO6iK5eP
         K7rsKBsKZ6nOZeHtY5dGnL9bMva+3iuQq3uKx3Asyd+vBYExgrf3hz3KviJyW9hAIOIv
         HAD8ndI+MrVV5vOsMAI/cfKl2mkDbZw4bvP0XmWPYQhubYrLIqlOHHKLzyVRLg/Jucor
         XTszOpFmz5PSh+tzLP7GgaTNpSicTFAisYs5MXrUntPoXBNU6bx2JZigO1mPWW8dOw3A
         OaXC2PwmFHPdpu9APR0C7KNeD2Wu1aXgQLunbs3Z1fGSjTY0zi0l37yqa6RvyYDOHHIj
         W0qA==
X-Forwarded-Encrypted: i=1; AKwUvBznUC1Pd/pIsr9STU0rIt6CIVRQ7LGquMAKhXTrxeyxZB2jldfRK3uJXZxCfvwjVTdDUnc9kiYSbAfcLPa1AoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P8pHNEMQrKGpepD+YuOMBO6cuFtT+BM5QK3hPqX/fCbL0SBJk
	GNeNmMrnsHF6OxBEUQiKT4L2Mu3Q+B145pzotJLlnio/I3YjenSRWggchmJPOI6CtzMAw1thcIm
	OC0JNQzi7KahKTnmDGg55nO4hee/67Q7T9bHJ/L1/Ph+zfBDNFpfDV1a2oepSAIHUKUjsDw==
X-Gm-Gg: AYBFou0r4wlgWLDUzX3VZr/ie9ahA0e4HTmULzpmw1u5G6bLkTiyCQHMOXjsqoTfjUR
	v4w15QPEudW7QXQoEFy2DdE7+0qOQhs90E07GwLKvZWrV2HUh10QnaBbyZNNw6KsR5EreMKU8tR
	b9/o8dG7CRh2+8e7NFrcxvo41RPOOMkY3aQ7FxySwRm/qKEJCxJ0kdFWdS4P3u2B5uEqnF/eoyA
	MABdyQk0EvxzJ70DbbnVBzv2Oy3ByxB5R+4gbVVrus1b33WngdHnzMexIWwzgZitClYjtLpjtBx
	N7aYb/McrIQyjjJWZ9xI4/bqs5n38kMQv4e0h9bS5zPCjNwsMv3SUF5mwDULP0qYyoJb9lE4T0u
	yQ8Wr4jqhcpfR1L1LRoLhR2NFH+Qt3ogkWGc41ct7aoaPq9RNtu2l7pQ8/b8BTVi6/wsdqgG7Bs
	2/yQ==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr400160365e9.17.1793862884829;
        Wed, 04 Nov 2026 23:14:44 -0800 (PST)
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr400159945e9.17.1793862884464;
        Wed, 04 Nov 2026 23:14:44 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm39679165e9.10.2026.11.04.23.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:14:43 -0800 (PST)
Date: Thu, 5 Nov 2026 08:14:41 +0100
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
Subject: Re: [PATCH v2 01/21] sched: Reject SCHED_FLAG_KEEP_PARAMS before
 reserving deadline bandwidth
Message-ID: <auws4cpKvQnmNM4f@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-2-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-2-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> __sched_setscheduler() returns -EINVAL for a SCHED_FLAG_KEEP_PARAMS
> request that would change scheduling class, after sched_dl_overflow()
> has reserved the bandwidth of the request, and nothing gives it back.
> Switching a SCHED_OTHER task to SCHED_DEADLINE that way fails and leaks
> the runtime that sched_setattr() filled in from the task's slice, up to
> 100ms with a custom one, into the root domain's total_bw. Repeated, it
> makes the root domain refuse every deadline task, and refuse to offline
> its last CPU.
> 
> Reserve the bandwidth after that check, last of the checks. A refused
> request also leaves sched_reset_on_fork as it was again.
> 
> Fixes: 8a70415351ba ("sched: Reject SCHED_FLAG_KEEP_PARAMS when it would change scheduling class")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Makes sense to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

