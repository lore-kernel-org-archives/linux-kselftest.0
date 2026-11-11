Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380113;
	b=d7bgdcpNvIQZvqxKpTO2svaW5b3Z7TzUC9BAD1PQgRwOb6iHt/dlPcixoMRWnz3By1NW
	 PsV5tnmvpLJOTvwRBQ7m3mWk6hsYDwnM48OSs/NcIGqLOLON8nRF/yK/fm+AHGgkbRcFE
	 YgsQ6TiOmXI26YlHbyavUbIzEm3QoRuUPy4xMBxPdRoqSx9P/6p7CR8xlCPM+J22vtEHk
	 b9wTMWU96LhqFkd/aETyBbtZrZJktyH+iiaIV9xTA3mLGT+rmaX7Pk81Vrg3j0tvJiXOe
	 jPJw+pVCNHYtpgxSHGTn5ej4HZIaKC3S7kCPOEIKnk+8zRX72rc8LIQ0XJCykSK7nGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380113;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yk7uCCWqva6Cz5l1wMiNcrGG28MVu58wttnXuq3Zst4=;
	b=soclBwiVplc+yrxpp5EabUG4eQlq5D5sSrL9C95txuVFVcap/sj16xT7aXeaFxMLmHAX
	 eDhdVvV7S7fV5J2sDellUs4en2wAz3GPu07vtF+wPRTS6eiTHDgFrtDd6ofMQn7XhB1yx
	 YmYytV3sm6sHJ5H1yY3neoJ1VYmbB0KS1i4RgM7K4xSYsdpF70992h3uALfFK8T6gJFr3
	 vt0DRI+suS7tHhhXDo1YyoNAxVS2qQZ4mV5gnGEkjmn9BYFClo/XIQQ12PrpzDA/9Bz/B
	 xA91bG46c2kuZGbXrqofYnHFpG5QmA+ObOU0F+F5gb1fOLWJaeF6ZgeFlgNKGWCwtgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q8ytxZJl;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="UyX3yv/Y";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D80606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D80606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q8ytxZJl;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UyX3yv/Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794380111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yk7uCCWqva6Cz5l1wMiNcrGG28MVu58wttnXuq3Zst4=;
	b=Q8ytxZJliyqx8KAEE2UjXU77OB1fQ2bn4K+A3H/cyLxscxslyCOgRauNIYUZGQUN5nPCcG
	FQs/uKXQVjt9oa42NFXtbza+DJTi0eRdcMdGJUCoUPtwYgLhAsbx5//Pn/MaaxjhsuuAax
	b+SW2oVBqMPUuiy3f2dpBxDgyCWjTzU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-ix6h6jJHPiunQreEluWpJg-1; Wed, 11 Nov 2026 01:55:09 -0500
X-MC-Unique: ix6h6jJHPiunQreEluWpJg-1
X-Mimecast-MFC-AGG-ID: ix6h6jJHPiunQreEluWpJg_1794380109
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso20311885e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794380108; x=1794984908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yk7uCCWqva6Cz5l1wMiNcrGG28MVu58wttnXuq3Zst4=;
        b=UyX3yv/YQ2i4wO9frSBnspnz7bdpT+z6pnNbaQpExynrIgYcp9KJZcoGuMDXqchZaZ
         RDhT2aTINacelsVBg375+O/TDH7rJpXFhJIB4NLq4UY3bkjFgOgzZIcIIRC3dByh0lPX
         mKXiVyOWazCba43QiTmI/jskbCAF4UW0Zd9ATL2ehHs+CnxAF7uY6xbUnx9BcR8WbPj0
         fsTuQXEuwZJXhRYFlNe3K3TUO0AP0YhCQKcwXvafUblk0aM4zZmQqnJqDjWQpFHOS1eJ
         8eoBqQgAsdQMYZjhFt0QAsBwsmvstJ5woGI2ERwiE5j4hlUOwT/+Iwr+m8mTbY5FNJBI
         cMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380108; x=1794984908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yk7uCCWqva6Cz5l1wMiNcrGG28MVu58wttnXuq3Zst4=;
        b=oE72GVPfEeGrfgt3CB9B0o0bEe44TsSdcU4NAYuvDEAfWlQVhvqs6lsJeEXVKhbfzb
         5x1nTjGZUQ+/u4nCMA6CGy3ruPuSgPTuqC6NxQ44kQzgaQS15QcE7U88uDzjfS7nCXMb
         VexVnaQkYfwW8p3kVLLgYsH+XH8Xy/R58NvCsTXD7KzuQLNSdDvMEFxDvaa4pKJFHA76
         hIh6BiBgxqyxiT8l/r0YQ4dmWvZPzori9kHRvhAsaLL5AVToD+TZHhEzPnz6T+sHoRKF
         iRFEvBZ23JbVe4M/q2LrxLzW5uBESh+PC7AOpje2g5OS1F0w5IMR+FRyR3Zo0qACFMLO
         BhrA==
X-Forwarded-Encrypted: i=1; AL+hErHqMH1Ov45q4CtA4ltGzJSc8U22jvrq4pQfK8HH4vfU1MRyR/gWhmFDmVybVsFpax2+6Cv0lu/IaynKGBHAPlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3oDUCPrd3s1J+g92JzWZj4ohUrKV2xH/QzFwBTZX3py80OaKC
	3+i+8jbqoKtlkTZWz8iI9HUiLdm1q8vb5ySAwQnqWfjt2wYs+hpzowNmlak1bUO5RSg4nn4/Ixi
	vvXj8iZb1iUH77q1Nb28dEdGy77q7PlAfn1vIBv0qbfSOyYhIpzE8hE+9gJQYzPtDlzDB1Q==
X-Gm-Gg: AYBFou0JBrV2UhgKmjlxQfEYFSYTzpOhQoZLnUZTFuNQhoZCx36hWU7Y9BE0PPfV5k7
	c3Jh0gPWiPsrQ5Wd2SomC892BgHXHAz+qdh0ugKu1X34OyB3M7yPilA6L8mwi9fyynjbETzBMht
	zDfRarT0ftZBfWMaGuaQo2XxALK7SRDAvsaU3R7i5fjxelfPhV7BUNqgiMvcy5xrLHppkq0hE6h
	QOPV5zkUvC8+DilPFFlEPc/wZL+9PFKLkqRX/j0bNHw6GvpslYA4LWnSgq8JfyQQy/cO2nuJo+A
	TAcIIVDi1ynmngxDFpSMY5qJCT5/5HtkGHjFhGjLuFMDb7adFsRiUfse3e1qrxBiIaRfpFtY18B
	ozaNbWBGacC40A1eSDN0AMeoTB4E5O61kqb/VvYmEJtn0AH+9fswKXEpnJ5EJNjyyRb833D3Gay
	a46ow=
X-Received: by 2002:a05:600c:4f55:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ba0938197dmr25955085e9.28.1794380108608;
        Tue, 10 Nov 2026 22:55:08 -0800 (PST)
X-Received: by 2002:a05:600c:4f55:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ba0938197dmr25954715e9.28.1794380108281;
        Tue, 10 Nov 2026 22:55:08 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09517bc7sm24307235e9.3.2026.11.10.22.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:55:07 -0800 (PST)
Date: Wed, 11 Nov 2026 07:55:05 +0100
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
Subject: Re: [PATCH v5 12/29] sched/deadline: Reject SCHED_DEADLINE on exited
 tasks
Message-ID: <avQRSdb-dRzzsmc4@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-13-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-13-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> From: Juri Lelli <juri.lelli@redhat.com>
> 
> sched_setattr(SCHED_DEADLINE) on a zombie task succeeds and charges
> total_bw via sched_dl_overflow(), but the task has already done its
> final schedule() and will never run again. Nothing releases the reserved
> bandwidth. Repeating this fills total_bw to the admission cap, after
> which sched_setattr(SCHED_DEADLINE) and CPU offline fail with -EBUSY.
> 
> Reject sched_setattr(SCHED_DEADLINE) on exited tasks with -ESRCH.
> 
> A task of the class that exited, switched to another policy, runs
> switched_from_dl(), which decrements the count of deadline tasks of its
> cpuset that cgroup_task_dead() decremented already: at 0 with a deadline
> task left in it, the cpuset is skipped by the next rebuild of the root
> domains' accounting, and that task's bandwidth with it. Reject that as
> well. The deadline_bw_test selftest added later in this series has the
> case, death_zombie_switched: on v7.4-rc1 the switch is accepted, and
> the one-CPU partition root the zombie ran in admits 9 tasks of 10% after
> a rebuild, with a task of 30% still in it, where 6 are due.
> 
> Fixes: 332ac17ef5bf ("sched/deadline: Add bandwidth management for SCHED_DEADLINE tasks")
> Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
> Closes: https://lore.kernel.org/all/3f6e6c87-645b-45fd-8fc6-8da5bc5b82d8@gmail.com/
> Link: https://lore.kernel.org/all/20261103-b4-sched-dl-bw-fixes-v1-4-dd761fe005b4@redhat.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> [mathieu: reject a task of the class leaving it too, found by the
>  Sashiko AI review of the patch]
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Looks good to me, thanks!

Best,
Juri

