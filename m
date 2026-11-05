Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890855;
	b=IOpF5yTLeF/G7dgiHi3ZtSnBSelUPxej/Vq5UUB6FVzpUDiz8B2WN4yhYpl3px6kC/T3
	 Y2xfeNcje8ffIA+XgC77pt3jQMtBUa4mR1al7hoa3FzI30TUs2UyNC5pN8WcfZgkz9n6/
	 1Ahhrq35a4zw2I6yuUnf32MykwgziC5FgeDrpq9G0Xju3v9188LKWt0fNj+Y/BngA2jUI
	 YlYbtN7oMeLgaKxpCDKB12lu0ZQL78d7ATWeyvduns+lfQKe6eTS1cBwKB121VjixReys
	 7tf1ePchnjMQQmmnbr74d9eXtNbZWXpQRqQP7SgOvrsFrzOzylpiv+6oJ3iTpKJ2/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890855;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=leAQgaahqk6ie+8K1Enx+eS2rtZduvQyWhwKq33EErA=;
	b=W/HrnGynro8Day7julnSr0W0vmT6ntPE/gEMmK/BglxTCDk2+lrHlUJkc0wdQSUeS28G
	 G3Cw8Xdg3hwr/7pDhGQ81JQRr7Oxsm5b7rnyd4qFh8JIqRxgGPEJX/H7Sfr9WoQvLsz/A
	 XL2ZHKdluD60nhd5EZRBf0aaNHf6O6EJeNliTDJ+F6XJhcdRwGPV8T4FvcA9JaA5EwZkx
	 FZKi8OPPZ3hH1b0z2NHbOeC+IQJi+lbo44o/fqyNDBFKQi8GDPIgpoqTRcfvFAWRJsHWY
	 0ezPvVy6p5FxFGH7Ew5CCp+7M2JuX/E73cOycFBL/hgA5yp6IZ7ZrrBZVUQKYFSj4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cX+4UnMn;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="bkHvQS/j";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26C606A333
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B26C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cX+4UnMn;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bkHvQS/j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793890854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=leAQgaahqk6ie+8K1Enx+eS2rtZduvQyWhwKq33EErA=;
	b=cX+4UnMnrVyBAq4AazkUqBaYAkBZ3DjkVbYELumwk1ir4sLK+18et3tVQkDU2roQ9MdUcg
	+5ur5FvdrhExkbwHCJRh2N77eC9qW3HgrgikyU+1k/LJ1eJTlB2B3utvDKX3YOkTi5U7Uq
	/0/kBxvB7i7ThN14TNgcB5tum5M3qIo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-4QfBMylRNAGILYNA887ntA-1; Thu, 05 Nov 2026 10:00:52 -0500
X-MC-Unique: 4QfBMylRNAGILYNA887ntA-1
X-Mimecast-MFC-AGG-ID: 4QfBMylRNAGILYNA887ntA_1793890851
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so11153905e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 07:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793890851; x=1794495651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leAQgaahqk6ie+8K1Enx+eS2rtZduvQyWhwKq33EErA=;
        b=bkHvQS/jmWNzi4FaAFkEKmaIvLRSj7SaRjHeBoWdFSvhe0OfjchrKSLTuhekhh+1e/
         0f3GoFOBYPLwcsTQw4Eaj5WJJofXIrbWndVQnMUi4x+fBMyh0GJ6rMLRpuSmGr1/Phl/
         0u15TgEY/F/gOLKRxFZpEfiIf1f6xrbJX9rmZ4RQsw0eMjubk7Jgm0FGvKibSYFhl7t/
         MV+u2fgPDwwJMFTXwgDiChnDArfPZn3Tl4nyaPy3RHB3Qcf+BinOHNGIGihlLLESlIl6
         prLepj9a2BcLV5utOuGHZVd32mugRcarbtSt6QYtDFuKDimJQLXY2/ZWWHjGZI0MGORC
         shNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890851; x=1794495651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leAQgaahqk6ie+8K1Enx+eS2rtZduvQyWhwKq33EErA=;
        b=gSlts9MBr/VWV1yXacZ8Yp04v3uBS9lbmPwrtIof8fvplQYMr0+NfbxZ4CngIp2N6s
         sKT59ltFUz6t+3zknXwsPtWQTsRzY9CkMKvB8HrGqB2C6/9ZuQL8PBuPDT9sTRBcQ/P6
         3+6j0EoyJU2icKKDo9qt1mq5Ik90qCHsVZYnWgQkM+EAuPSSh6hjbvIdIUOivV+2rwyk
         lQQS8PDOHFgq1fQaCFD4H/xBleLotUrzAVLfO9euEZcaTnLQwAO7GNecRPMPG2dAmk2q
         +VlESjJSio50EHhSILKHVjKxbxh0Jyk4Yhkd7BMk1Roim+fUOMcM0c0v8qRp+JNtFPSG
         4T+Q==
X-Forwarded-Encrypted: i=1; AKwUvByGXbCoCOcRkli7Jp122onA/jWRzVLqeSt7OvsTT6MuvDHeplDpR6cVDGXrsvkmpYAYrCiF0ApjcGWj0nWzCGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JRlTt5dDkMzbu0rNxKYLqlNZoBlOnwnfHGnLIkP9wkd05F3F3
	cO3/U4y7UBCSBCuS8JEGnPpOPP32cbe+cbY+joTIyrzuiSj8Iu87U+ODIIAOdDGZnBalBBqtSFA
	26ZKe3gnZgNyej6mA7ctN9ZS7DGfRZqOI/fp0KNk4uGl4yuzlbQmjBfxMusfktqbugYNU7A==
X-Gm-Gg: AYBFou2Fku64OJxt0Gfp7wn9N/q0Po7d0VzAm0UALbwl5H4ZBz29AWkWbdAyyECcFOD
	4UNSNp3NPypqmbGHXGUvIUQxajUp3CPlKURER9l1q895xkzOMwHJXjM6BGDW0htjEa7ECbUl2Gx
	kXTI9r568EjU14kmSbK7BPRrC5wLFpWuDvL5DkixdFI0oD0fQnCMAFtFt7qVg8xKR2/DTpB/xTN
	VDHH0QGs44UXnc0APAOyzZ8ZI8cbnpE+zt2PnBUmgpqaNo+RgdIpHyz9tQTO37aqexrLiHX4DoM
	Ki/pUtveHczBvzfx9zxe2brjGvZKZ0H0Ht3Cwv7zbnUWsqyvWhbkxdj095HW9FdIZR/0qm9Tcks
	I5RF3WarqaewPS4+3oU3Tz/kXJMKOQ9kMTUSb5jJnO9XEWB34AOYsbae5GLNgHbUH+mfhQdhtf3
	NwGg==
X-Received: by 2002:a05:600d:82e2:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b55d7d7a2amr55606745e9.10.1793890850736;
        Thu, 05 Nov 2026 07:00:50 -0800 (PST)
X-Received: by 2002:a05:600d:82e2:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b55d7d7a2amr55605885e9.10.1793890850041;
        Thu, 05 Nov 2026 07:00:50 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b452eb99b1sm108926575e9.3.2026.11.05.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:00:48 -0800 (PST)
Date: Thu, 5 Nov 2026 16:00:46 +0100
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
Subject: Re: [PATCH v2 08/21] selftests/sched: Add a test of SCHED_DEADLINE
 policy round trips
Message-ID: <auyaHi0W_R_LLXUE@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-9-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-9-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> Add deadline_switch_test, with a case for the fix two patches back and
> one for commit 41a7968022ca ("sched/deadline: Fix total_bw leak when
> switching away from SCHED_DEADLINE while !queued"):
> 
>  - throttled_round_trip: a task with a runtime of 10ms per 2s period
>    spins, so that each replenishment throttles it again at once. Right
>    after a throttle it is switched to SCHED_OTHER, and back 200us after
>    its deadline: past its replenishment timer, and before its 0-lag
>    time, which the overrun scaled by 200 puts later. It must run again
>    within a period and a half. Three attempts;
>  - asleep_round_trip: a task of 9ms every 10ms, running 0.2ms and
>    sleeping 50ms, is switched to SCHED_OTHER and back while it sleeps
>    past its 0-lag time, enough times that a leak of its bandwidth at
>    each round trip fills the root domain: sched_setattr() then fails
>    with EBUSY. Skipped without admission control (sched_rt_runtime_us
>    at -1). A kernel that leaks is left without SCHED_DEADLINE bandwidth
>    until a reboot, so this case runs last.
> 
> In 8 VMs of 8 vCPUs each, v7.3 fails both cases, and v7.4-rc1 with the
> four deadline fixes of sched/urgent fails the first; with the two
> previous patches as well both pass; every time.
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Thanks for the selftests! Very useful.

FWIW I did propose some already in the past, but then didn't get time/
tokens for a follow up:

https://lore.kernel.org/all/20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com/

We can probably re-start the effort with yours and keep adding as
needed.

Do we want to have per-policy subdirs under sched?

Thanks,
Juri

