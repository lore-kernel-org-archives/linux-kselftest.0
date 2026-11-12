Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469824;
	b=Y3asN5yGxwO1t07LVvEr3gGif/DfAUI8qvFhk9x25C44Cfwu6zbcAmPGPKkaQIAAxOV8
	 lY3Yo5dbQD3rxfYud8U3nJPGrSXSgTZ1n8gqNqMtkZmIUUkeInR8oQGt4ivl9lJy8p8ai
	 msXMZh7/zHL/m1tDQrjJ65n7fEjfJeZnJTv5LCiIedvN5ZAIpqWrXiFm8I87LoRcxx178
	 KcWt6JR4wELdf85s35yj5XQ+5GnkI5NrUn6XkOVeu1UbV4thA4ypAqx3kF5rziRC0dOKQ
	 utMhoLYq7ixw/71gkKoo/9dgnqlmy2CK/vVjI9cRDbFp0wJWvouo3XYZZScMaeMpUEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469824;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
	b=uBroBTBxsjyq3PNy+NbzYlP49gyszgdsBZBoG129v9WS2cl1jm+YZQrcymzjWbxWgN/f
	 283lpMHXkhsFpb6LuJFS8uYrqClR4w430gB5movTrnypbpTRiS7fTrSbK5U5obLIOQ4ar
	 ofWWl4u5f86vlO/SVsHpTEnZSzyNnR54QQcalvApSRghNdXMavLF+F4Qj4BNBbL4pwygx
	 QF+cR2G/TCm/vYirbk8dD/nPKUO1E+4CsyshsAw5r+n/v+1FL+N8H/mmUpBIv6kNN8IoH
	 +bGL1tMrionPywnEet5+wKhMVEhc62xw6cGe3V2t7LIizDW6yJoAY3oeNOobLqnS5+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JKkq4OVS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qDwrBmcq;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE487606A32E
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 07:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE487606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JKkq4OVS;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qDwrBmcq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794469823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
	b=JKkq4OVSOwOVaENYQrVtTIOsishWT0KXHP8jq08Hg9gXbzl065PK3xFFnOvHlpqvIQRRVl
	c6Xnfb7CzxU3ZbPNbGvxNVgoVsUTQrlwPZow7kopw/O6EMSxkUj6cylzzxmWqcPBYIk2bV
	3YAgBmuklmCi+nNVHBGtToPnPPhoLTY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354--E6SakhdO9-fO7zl4o-JAg-1; Thu, 12 Nov 2026 02:50:20 -0500
X-MC-Unique: -E6SakhdO9-fO7zl4o-JAg-1
X-Mimecast-MFC-AGG-ID: -E6SakhdO9-fO7zl4o-JAg_1794469819
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso33172035e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 23:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794469819; x=1795074619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
        b=qDwrBmcqbdfv6sjXk1rqxfTgCtqUKuKT1+J9Hh/rhnouIzDHTT66xrCcbFw09I5gzH
         shdWuZZgpiY7326zbMZC217ZWyMWsiJlHJUuwt6QWR9XgsdW032CaJPDjngjN1lHNWNu
         pdDlSf22mdcd9DHpYvFdT3oWmDnGz0PxNtRtVnWqIicChUtPmY1lzcN+QWv2sBRAUyCr
         n+7mdMjMeq5ADnfe/XQBPNgfgjwjdTWWikxeP7FFO1nmpQijKjghDM6B78PoLBDKSop5
         DHjNxtHQtaLc9kYWDgH/EBIy6TA6zxY1msISa4pPKoJt906w9hOvsl0CSD3o/9/jFse+
         MgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469819; x=1795074619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
        b=ohWOr8C4Zv9+ploeGjL6Xk1Iy3yLGO+Rehp98Z/6zHnFhxX48Mimt2a8FFcqkttfSu
         pDGAYPDpJ4nRIOeWkS+G3lWU4uRhuikU90CScYMCF0xSnY81Xe6fhRJalUBH/wC/T8lS
         qxx2UQpdDUD0OQDh2DK1q90/YdN58ogBUjwYJTC5Gtd5bPbAgGd39e/XdkP5l30UCVkf
         tUiTGB+8GJ4UYJqpCt85DjZDyGavN2b+oDQh5oW27hEyzMQOAyGd+mvE/++umDel9Xyr
         FziefWAGmisU5CFDj9TAT2ToBSSdMvtGdUEDIWqV4iSwouzUcSRmtBWzX5HTXSoOWN1c
         mFaQ==
X-Forwarded-Encrypted: i=1; AL+hErGoSm33A+1BgDMuT8/aA+b3p8VvXPrfECIir96Mskq1ONdg0VEAnxPtXYXKIK/+98mlmknvsOGPFzJcag5TaoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2auZqUvJnI2vNYhojuE3DKRjqtosgYdO7LDxjLTAUwAmxj6/8
	j39W0YD/lr+EoK9IPRy1+zuhKmG3WfQ58csdpx6ZFUhWU69NAJprd8X2L/qB8atLoXwd8c7q5lP
	ObJQFxdNgwcSmprhq368+GB59qB1NvPsP9/ByoOwp2hZBA+4fjuugZWigFGn/bwPu1rEwmA==
X-Gm-Gg: AYBFou1mm8gq6V7Vt4OGe1myjeTZJweWLbaH8417BAWMQiS7GzR7lHU2ma8Mpljaw5/
	5tvzMR/GwVp0UgIedpKG0GSVYjRAQeF/mBxu7nYaAzXtaL4yM3AyJ/mFAgC3sWTgC3LeXfd1yhD
	Qts01IgmbcwpAflhq4h7KsbPb5ucIPuEqgKF5dT5p2u7Fu/RZqTtLT2/GR7l2zPJlFuoA2CFxCu
	qab/ffwm/vhAUBbEi2Vtm82TfcY7fgAsLxa82TzTdp/pM5f2TpRIZsfTuoQgd2+w1sauF40Cmsz
	vwTRj81TQIjTkxB+q0+ztwwdyM5fB6HW+sJEe9+v7j6lA4MCkJRxUVk4ojjrlhw+Ehdr4qAtsL0
	bSGT/9HL6D2nSE2zblm3T2Vy9uHaETUoR4tt8Z9A8a8u2eyeBm9EYWJDncxRzemRGy1si692Z3e
	hxdvs=
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ba09376d2dmr82685385e9.11.1794469819071;
        Wed, 11 Nov 2026 23:50:19 -0800 (PST)
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ba09376d2dmr82684805e9.11.1794469818478;
        Wed, 11 Nov 2026 23:50:18 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm52359655e9.6.2026.11.11.23.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:50:17 -0800 (PST)
Date: Thu, 12 Nov 2026 08:50:15 +0100
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
Subject: Re: [PATCH v5 19/29] cgroup/cpuset: Wait for an attach before
 rebuilding the sched domains
Message-ID: <avVvt8wlKqW4LqTa@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-20-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-20-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> cpuset_can_attach() reserves the bandwidth of the deadline tasks it
> moves in the destination root domain. cpuset_attach() moves their
> bandwidth later, on the strength of that reservation.
> 
> Commit 75f7a25ec6bb ("cgroup/cpuset: Prevent race between task attach
> and cpuset state change") lets cpuset_attach() rely on what
> cpuset_can_attach() set up. The writes of cpus, mems and cpus.partition
> wait for an attach in progress, in wait_attach_done_lock(). CPU hotplug
> cannot run in between either: it takes cpus_write_lock, and the attach
> holds cpus_read_lock throughout.
> 
> But a rebuild of the sched domains does not wait. A write of
> sched_rt_runtime_us and the energy model rebuild them through
> rebuild_sched_domains(). The cgroup v1 writes of sched_load_balance and
> sched_relax_domain_level, and hk_sd_workfn(), use cpuset_full_lock().
> 
> In this example, a rebuild drops the reservation. T is a deadline task
> asleep in root domain R. Thread A moves T to a partition root P, which
> has a root domain of its own. Thread B writes sched_rt_runtime_us:
> 
>   A                                      B
> 
>   cpuset_can_attach()
>     takes cpuset_mutex
>     cpuset_reserve_dl_bw()
>       P's total_bw += T's bandwidth
>     drops cpuset_mutex
>                                          rebuild_sched_domains()
>                                            takes cpuset_mutex
>                                            dl_rebuild_rd_accounting()
>                                              clears R's and P's total_bw
>                                              counts T in R (not moved yet)
>                                            drops cpuset_mutex
>   cpuset_attach()
>     takes cpuset_mutex
>     cpuset_attach_task(T)
>       set_cpus_allowed_dl(T)
>         R's total_bw -= T's bandwidth
>         records a CPU of P
> 
> P now lacks the bandwidth of T, and admits deadline tasks beyond its
> capacity. When T leaves P, P's total_bw underflows. In testing, the
> race left a destination admitting 3 tasks of 10% too many, or P
> admitting no task at all.
> 
> Fix this by waiting for an attach in progress in
> rebuild_sched_domains_cpuslocked() and in cpuset_full_lock(). The
> latter then takes its locks in the order of the writes of cpus and
> cpus.partition. A rebuild from CPU hotplug finds no attach in progress.
> The online, offline and kill of a cpuset never wait: they hold
> cgroup_mutex, which the attach holds throughout.
> 
> The move_vs_rebuild case of deadline_bw_test, added later in this
> series, tests this race. Without this patch, it fails in 5 of 8 VMs with
> 8 CPUs. With it, the case passes in 8 of 8. The next patch needs this
> wait too: without it, it would give back a reservation that a rebuild
> dropped already.
> 
> Found by the Sashiko AI reviews of v2 (the race) and v3 (the cgroup v1
> writes) of this series.
> 
> Fixes: 2ef269ef1ac0 ("cgroup/cpuset: Free DL BW in case can_attach() fails")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

This looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

BTW, this and other patches are actually cgroup/cpuset domain, so we
will need to ping Tejun, Waiman and others at some point (if they are
not looking at this already :).

Thanks,
Juri

