Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407052;
	b=ZOWOCPG6iZxXsBUvxbwFZuxfI98O1nXJdjU/w1EDfBvY6cWXIea2UKNwCifWQyTUsuSj
	 jhuA5FZaWJCjpQuxymNh54ZtsY/sz30G3E4pmrJZTbzVRv6bkSouGvdqzGQzxfrD3BNiD
	 rj6Q0oOmUF9vl4lRdW28VXALmaLboS9Cu3VKbuk9334Y38Cg35GyxXpkiau/NUbbsPru6
	 3F0hLbpNwFlU8ulYK5KAX7OwfrlGebNyqQxk4jAxMHGCDesuPb26eiwMU8+JQkxXUJuD1
	 G42mMsZp9SWO+gpzfzJcQnSamDtHjqm1uBfHOdPiRIu2mZo02XQNrIsBPoQ0fIraV3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407052;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Npgvb84M0kJgdnmAsSFiguDvaupmEXtt/RUSJRF0Wy0=;
	b=2LbOcHrzi2uYeLfxd7RFf+bcWMDJFmCovlVwbhUnMpQ8WMiDzfojCOgOkFNZNnTKcENE
	 MK4MJnwgmFgJ6lSc/7tSMy0jE8YlzOjsQ1MONUtabE8UYdQZ69KXj2/qYfMKCJDOVmy93
	 8NEBUaXR+R15mssqM4Ix9J72vrH5PjpHFIoioajpChEWcithgyztWvqTzTfdn1jFdbFMk
	 gqb+qndu6ogKV5U4MOwXUxkM32bwgpiLOvu5gOixfcC5L9Ol3vJvfOnbXm8nCOC0MsIVR
	 gS9GeqF7GQUG62p4SnhCHlWfiFdPakJ6w+HZab4Py3Tgv1NKUU98Dr10O8M5Xd9G/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eVzWKmBG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FarBWl8t;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA20606A339
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA20606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eVzWKmBG;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FarBWl8t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794407051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Npgvb84M0kJgdnmAsSFiguDvaupmEXtt/RUSJRF0Wy0=;
	b=eVzWKmBGewX8fRDmN1htbG78LXSREfinw3WIfGRjv9KpxYzn9SOnbV+yz4gSfGotV/l3k5
	8J58EGnplioh0JYSDxUb6YtocE+xJjj4SQjTcZ71DiFTHzsX/fLIlfw/vDk7Dfz01IMaxQ
	q7s559663/DJ8L1aPfsAQZcvLrjrsh0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-H9wO4F63OlSZpLL-UK-aqA-1; Wed, 11 Nov 2026 09:24:09 -0500
X-MC-Unique: H9wO4F63OlSZpLL-UK-aqA-1
X-Mimecast-MFC-AGG-ID: H9wO4F63OlSZpLL-UK-aqA_1794407048
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso24991155e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794407048; x=1795011848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Npgvb84M0kJgdnmAsSFiguDvaupmEXtt/RUSJRF0Wy0=;
        b=FarBWl8tvXi1UumnOLvjKyNUvGVvqKHBHvz0IwXEUMy0YT8wcU2U17ezae3ntnt0H4
         NiODWSEc9if6AOUfpL35fVd4CzqFkaozQ6YVSAENATtvpcLg3i67R53enj5BOlj1mpH4
         SE8hiV47ncV0WTfVymNUbic40PN9LqQtxQDDvq6nANt6LVGwNAkwFSkOuQir4G+Zd+6g
         QY3q3q3sKHA8SNJPgHv2Xlh0/TO+hRNmN1mzrZvcu/7GYGpViozASL5Mjisa7zEGif/W
         Xxl0TdYB+vfxfpvpI2la/V3DB9P8oPxsZpiVnR8G/Jo998aGOc8elIXyRsLYdwTS7+85
         ig/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407048; x=1795011848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Npgvb84M0kJgdnmAsSFiguDvaupmEXtt/RUSJRF0Wy0=;
        b=pwUtaqscOYI/ua7E37gqc5tkPI9i70Sf5ok6YT10UjgpcpdHs6bfnofoxOYkyGJEhR
         i7Ftztmg9ygmrgRo5YG//bjfhC8YZ8cKW5updCBlQGx1tdUKVMW4YFyNT8NcqsdNNMEZ
         kpaAisrNELO2kQBPT0cNdRjZAtm5jzcrK9ZzhLDpYknOcMvGHLryJ0sctyvSgQIGStSn
         35ZGSB8gWVcxnJsQvvEWdWfAj8j8Cuy1575Zxzam+HfeaEca1vIEmHex02I25pR3Mv6F
         s8m+4P/yjWQly8vHFpGI+aZO2TkAtRYPbij43iJJgOwOsXfifQUDLcnA8znzxONCi7Z5
         NlCQ==
X-Forwarded-Encrypted: i=1; AL+hErFURw+aQwSuL8uZQP+frwGN065GEletJASq4WlNQBCeHdKErT5xub6pwM3pEx7FRk1JyPwzUicJeAiyzs1kdjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wL2Fh2oDxLHM0NzNvL65IisfYGTgvb2w844kirAMIPQtQ/SO/
	lAoeOXYqIs2HhRhfKDf4k8c3bYGDOZ0qpQYKvAirAp0JMyaW1P9uEJwIhz7KeLf48BWc1q/f2m3
	nh/juvaNIkRfyFTFDeA4u/pH6dJ0U8yMVzjSqdSUyK9FjUtEK8rZ13U708hnVL3Q/dniWwg==
X-Gm-Gg: AYBFou3xuR6dBaXRDCef9svO7t4uJzU2xoU8HkjQB4GlmzQ2tI9Xk3+4l2/2jol3aTd
	R/5g/36ffDMCej8EyAG0BCTtpgCkJfyYgo9Ncs4Rb13oFVJ0nbKUJ1ybbTiOWBj91TSciueYrE9
	T0VyWGQNgOG7sPgFH0z517lBY6YF022+oI8ZhQlz3R3OF3CyntKkUHTdw7z/l8zvqmP9ykrlT9s
	7JagySYMfvmcZQsxDUPZHTJQPJtXKb14uaDMg5RqBwIGcTL98+9wxHSuWGKcxwLawL4Oh+jGx+S
	dF4ZmqZqsXzc9SosQY3vr4D1JHxP2FZplXQC0aoF+gqJ8cGrftIKB6fSxq6ge5IKtP5vhLQnsmT
	JVEJd7eX5YP0dtLRz9szYBwNieG9Iv9SL2m03PkhJwUKyJ/EYr6X/O7uYA81+d4i8yDjKJIeHZD
	AGyzM=
X-Received: by 2002:a05:600c:840c:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4ba09377dbfmr46939855e9.24.1794407048237;
        Wed, 11 Nov 2026 06:24:08 -0800 (PST)
X-Received: by 2002:a05:600c:840c:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4ba09377dbfmr46938695e9.24.1794407047403;
        Wed, 11 Nov 2026 06:24:07 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5c4sm9579508f8f.17.2026.11.11.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:24:06 -0800 (PST)
Date: Wed, 11 Nov 2026 15:24:03 +0100
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
	stable@vger.kernel.org, Qais Yousef <qyousef@google.com>
Subject: Re: [PATCH v5 15/29] sched/deadline: Rebuild the root domains'
 accounting from the task list
Message-ID: <avR6g-ndjl8Xdo1y@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-16-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-16-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> A rebuild of the root domains, as on CPU hotplug, clears their deadline
> accounting. dl_rebuild_rd_accounting() then adds back the deadline tasks
> of each cpuset. Without CONFIG_CPUSETS, it is a stub. So the first
> hotplug drops every deadline task's bandwidth, and their releases wrap
> total_bw around. In testing, a root domain admitted 9 tasks of 10ms
> every 100ms before a hotplug with deadline sleepers, and none after.
> 
> With cpusets, the rebuild skips a cpuset whose nr_deadline_tasks is 0.
> This count spares suspend and resume a costly walk of all tasks. An
> attach moves it by a tally taken in cpuset_can_attach(). A task that
> leaves the class between the tally and the move is taken off the old
> cpuset twice. Its count can then reach 0 with a deadline task in it.
> Every rebuild would then drop that task's bandwidth.
> 
> Fix both by walking the task list, with or without cpusets. The walk
> finds every deadline task, so the count and its hooks go. It holds
> tasklist_lock for reading, so fork and exit wait meanwhile. It locks
> only deadline tasks, where the walk that the count avoided took the
> pi_lock of every task. It leaves out an exited task with a dl_bw of 0.
> It also leaves out a zombie whose bandwidth an earlier rebuild dropped,
> as dl_clear_root_domains() does.
> 
> Without cpusets, a new dl_accounting_mutex keeps admissions out of a
> rebuild, as cpuset_mutex does with them.
> 
> Three hotplug cases of deadline_bw_test, added later in this series,
> fail without cpusets. With this patch, its five hotplug cases pass, in 4
> VMs. Its death_zombie_hotplug case tests the zombie. The Sashiko AI
> reviews of v3, and of v4 before posting, found the drift and the exited
> tasks. Its review of v4 found the zombie.
> 
> Fixes: f9a25f776d78 ("cpusets: Rebuild root domain deadline accounting information")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

As you most probably know, the count this removes was added because Qais
reported 10-20ms suspend/resume regressions from the old walk on
Android, and the merged fix was validated only as "delay no longer
noticeable" on zero-DL systems. Added him in Cc.

The new walk drops the per-task pi_lock that dominated the old cost, so
the approach might be OK, but since this is Cc: stable and will
eventually reach Android, maybe someone from there can confirm before we
pull the trigger?

Alternatively, a single global "any deadline task exist" bail would keep
suspend/resume free for the no-DL case without reintroducing any
per-cpuset bookkeeping to drift?

Thanks,
Juri

