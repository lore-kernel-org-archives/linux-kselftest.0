Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001209;
	b=Io2MbJBR5zckdej6Mh4rFbtmHkE5qCawaux8u1mvr23fNQaMBMBLeLjd/IsumJSYGo9I
	 ehZzeNLpk9ZBbUHJa0wJZtJXAB9tV5uaeU6cgXTACpDwUj9lXG7g7s1lR3TULj6UmmW7q
	 P3tUJjOPtDTYnnSbW/cI+EuWqJy8V2+P9UvWhVBfPztWS1gySP5zAY1xQxjwnHIfkZQqF
	 9RXtilx39c2pFyC3+jBPTbxQQR/QSQNek+UCLZJECArodjR3H74iT5rQro8HYl44frdpN
	 KrbSv+ONzuCwPo5Rz656T0ehplPLwHbJ4DKjGH96FXNF677jMp6d6ud7BrWNj3eeY6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001209;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
	b=lOpgr2i6BAK3Un7FHyBhiF/2YNCYzN+cRT4EoX/fEQyUsi7Ej6RJE/DVccHfqa5Ncpon
	 v7UHORHqXUwnUbvuD3aG6QKiuvMxXiFs8/fbC6+wV3WVexlEe1Nrrn6vuvoh87oYTvlOg
	 fTu7Zlr+iVke/fRXUGtxHWRjBBuvfYzLCkhdaEXa+o3/iJzSg1UHHDEmD5+xIkGEbHWdz
	 8WOkgitn30W4knCY/3fb224EeS5Srk8VG2kGLu3uQnXCwToiarWsJbRy9yidG3BBgdMEe
	 Ecsjz91iDBkOpqfHEJdYYxIsGAv7lg+NEFzF45ISLqndMYiBe75YhC3C5yFXtZSwRoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MTSCO9KN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ldl0hQ71;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0560A2616
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 11:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A0560A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MTSCO9KN;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ldl0hQ71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795001208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
	b=MTSCO9KNWcHiY7wfpX0H9Di7lOMSsi28OWm3cotM7G3xoIOeF98RiUjWzm6TIRrqiP/7r3
	KUWQ6ihgyUBMfoqpXByi6EeqJeBgYQoNpWqDCzYxUQTKOAiFe9JVW61myXg4TBo5T7mO2D
	4f1o5u9Fl+gnh5e9syrfoBZy4vu+7hk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-ZYb7kaJpOrKBs3XjNC6w1Q-1; Wed, 18 Nov 2026 06:26:46 -0500
X-MC-Unique: ZYb7kaJpOrKBs3XjNC6w1Q-1
X-Mimecast-MFC-AGG-ID: ZYb7kaJpOrKBs3XjNC6w1Q_1795001206
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48df02b91f9so1116265f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795001206; x=1795606006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
        b=ldl0hQ71DHIdVq7HpWWFHFpHRtzn6igtDD/F2HIuoqcYe/H/DB7u8RQmjziUY0WyLL
         S9I1Cd8iLHjIJKfEPPGf/HoGVpuSqkelIVhCR6n92+lXpFUKil9nuyyl7Pf/GXvFOK82
         xjgbhGopkcyxS7WdE4ZOuV/p3XeBdkX5or/H9xjbbhrgMsNwlrT+KE/YzwZZYNvmcqRN
         ThslAYBt9tUXbgZqUkp1Tvp8MAYdvteJHFm27dS5VtPO+f2JAr0KywG0O0d9SUJx7iz6
         iLjsjefDNZ+hMi7wuOkL7B7CSpdIqNdADK/j/GrfRqmCUzDNcsCHV45qRRZFb1/aPekS
         rGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001206; x=1795606006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brXugAcDbaCylrm2Wl7ARVAM15xweZmcyeF8T+2xKUM=;
        b=QoNLgdfMC0BWc1zc6hfAFc5k+t1iePhc0tv/tI8JKoBiKrYGIlJmEN8H4Urs+Oe1f0
         XDoANS54GBRVMfhk2RwrsRlsefuYnnZs9ot+qmsWSW7+f9SaNo5g26ogC00LSeKK9AWo
         POfzwJAcJsWu2I5SHPZ8C6I26F4rAV0kkPCNbJDtmtPEQXaZ8v9RMC+7reSy0B5/9LOB
         pYMwFq8bXPouOMBqlwKSEDaQYZA2W4FgDB6gJaympa+HEkgE8zEqpUOvAKyVnovT2504
         eIxx+50QiF/7cjE6bnqZiS/ZJsfEDEDd85qJ0iVKHQsDlX5gVosRr2tV5LvXdjMDaJ/L
         X2hg==
X-Forwarded-Encrypted: i=1; AL+hErH/ZzCytbN3l2orces2+RANWIEBnAKZk9KsrSjwmetHOE6syf2Cq4xpayDZxfA/y7Iy56d6MC5GaWVrdgjsQBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EB48RTVSgXx2W1bypCcoUaQ5m0oF1k6NcNkve2D5Tf/ha7kS2
	PMJcD1t+d8f+j/gKuc/4domv3fP4D7I5BIs/R5Q9g0NULqqB90en4dNPzjRTmYPQpQ2fTbfewMr
	VMhjVLHiELSFY9LDaEdRzpI7BfxQ9onQsdVdLnfW7Pk7Vi6lfIGDRYKDvZyh+zOPfK8oQ/g==
X-Gm-Gg: AYBFou3BOHVmPKatVM5Uq5FvBfepkRd9RGx3vB4w1ASgofN9H2AQyJI+24R4sD8+4Y2
	z8Duu7LfGE8jUOxpq39q7VwGxYrV2cf9mEsQnJL9tF4TTsOh+JSCWlxTfRJ5kk/32cFjhD4EvkM
	noRZaz66FWryxto1Cic0bxuqTUjy/jgqi/QyXXgFsVSn9p95lPnfgtMh2gJg0gq3tlMcmVliidL
	0qBYdXXHlZFtEesS86CQRNQ1ySKVvSBhWo9/dpmLkjWqISZFsa26xLPfk2qcP4+3VDQTX6E+Y7O
	PI0/sXaO8Lu1CXk5w4k4Jz0bT7TkkTLocchZZuBbR0scxXn2i6jdilqDtasWnl5paHQ7C+lzu9J
	RF1uEWzcdYiUkutlabc5tzL23UAu7Izny5dZv2qinIR3wzLOYvAb8SDtua7BNHlom3AnVy30/TB
	Mffm8=
X-Received: by 2002:a05:600c:1d8e:b0:4b9:f90b:1c4d with SMTP id 5b1f17b1804b1-4bb783aec42mr139593245e9.5.1795001205696;
        Wed, 18 Nov 2026 03:26:45 -0800 (PST)
X-Received: by 2002:a05:600c:1d8e:b0:4b9:f90b:1c4d with SMTP id 5b1f17b1804b1-4bb783aec42mr139592495e9.5.1795001205361;
        Wed, 18 Nov 2026 03:26:45 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b2a1sm4049093f8f.32.2026.11.18.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:26:44 -0800 (PST)
Date: Wed, 18 Nov 2026 12:26:41 +0100
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
Subject: Re: [PATCH v7 05/40] sched/deadline: Refuse dl_server debugfs writes
 while the rq is offline
Message-ID: <av2LcczdGk37WJLm@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <2bee6a143319301f082855a15274f0563e99b8a5.1794922146.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <2bee6a143319301f082855a15274f0563e99b8a5.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:
> Commit 4043f5498416 ("sched/deadline: Reject debugfs dl_server writes
> for offline CPUs") refuses a write to a dl_server's runtime or period
> on an offline CPU. Its message says that such a write has no meaningful
> semantics.
> 
> It tests cpu_online(). But during hotplug the CPU is still online while
> it sits in the default root domain. This lasts from the rebuild in
> sched_cpu_deactivate() to the offline, and from the online to
> sched_cpu_activate(). That root domain does not count the server's
> bandwidth. A write in the window still goes through admission. With
> admission control off, it changes total_bw there. On v7.4-rc2, a write
> of the current value divides by zero in that window. The previous patch
> removes the division, not the write.
> 
> Fix this by testing rq->online instead. It is set under the runqueue
> lock when the CPU joins a root domain that counts it, after
> cpu_active() is set.
> 
> A write now fails with EBUSY while the CPU goes offline or comes
> online, as a write on an offline CPU already does. Writes at any other
> time are unchanged.
> 
> Applied without the previous patch, this patch alone also stops the
> oops. The reproducer survives 20 rounds with no warning, in 3 VMs of 3.
> 
> Fixes: d741f297bcea ("sched/fair: Fair server interface")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: stable@vger.kernel.org
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

