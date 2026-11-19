Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083643;
	b=zDnDnLwJUmI1gu5JOC5xfPZWqQQ304maY2aLTCxA2SPjYOoz9ydcHku/D/L5YDV7Y3LW
	 V/kdNYk3KI6URIZm9MgILn2/EA/iOUgMOFyJpzhabogtcTFmzuZLdyMx/t3FMq8xHBye5
	 PED7/DxlWg18I3s/S76BC2SrRVvVEZAkL8g7CnFiQJ6xk9dGgJoR+JDlkFXbYWmaj2T1u
	 rMPzyKnu4+bjSJNXvVrpVQJg28ip/pYCzTdjLXNd9CPL99eBirZrYifkyLwvQ3mOhCdSY
	 0+bEByyAhLpXtROv4Zy1oXTOl6rr9O8eabCbxGQEFcAaYGt0lfcoeLxdgOozIREkj2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083643;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BhMldp/vd/3xPeYieMpRCN6PVD+GGJcYfaPHMFtkt6g=;
	b=tugJH9WGdR79SISW6bj+Vwq4nPxrFMMyEe86icdVwaZaLlMP/T5+4mqiao2AgI4QcFyD
	 fhc+GR8vETZja8kMSIleVSTRMG4Jyu6RKkRyDNeRjKP5O/Ir0TONBhSUMzwzZ5jOXNMT5
	 I+oWaocjcV72NB05Pw7A3OZfzv/f9k/uhmYcmMmfEfzi4C8+mJ4njVpQsa53apfknU4j7
	 ML8V4IuAznPKxsGokBGqNKYaIQZo+0GhPE1oaKbNxIpjFJWK0Rjq5TUVdqz2fxnGmcUvu
	 DdRZs0ghImUFYqBHOF56uyT8m/o+BC2iGP9qvDhlHJOU8ShCXRrTPCng7tZSJkr1ZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJjKcIAP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=f1hmI4Sc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7741A606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7741A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJjKcIAP;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=f1hmI4Sc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795083641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BhMldp/vd/3xPeYieMpRCN6PVD+GGJcYfaPHMFtkt6g=;
	b=ZJjKcIAPDD/yQ65jf0mFAYZwb/LjWSOdF+4hzLUZOfGETFmP9M/KxxYhW4HaIFTAJF8AUL
	pt89I0sqUCzwk7qK1Yyfv5pa0qnb93Q25zciKKx+5yAH9Qxyr8Ih/6AzEIPmyH5lWA2lNu
	p9bx62r2EKmtVA9gPE+yOOlw7fVfr30=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-B_xMw8rtOmK1taoicPw2Lg-1; Thu, 19 Nov 2026 05:20:40 -0500
X-MC-Unique: B_xMw8rtOmK1taoicPw2Lg-1
X-Mimecast-MFC-AGG-ID: B_xMw8rtOmK1taoicPw2Lg_1795083639
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso11956635e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 02:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795083639; x=1795688439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhMldp/vd/3xPeYieMpRCN6PVD+GGJcYfaPHMFtkt6g=;
        b=f1hmI4ScajTFU6GbpU8sXup0ewKM/uV8y6MP2vb6N3uIQwjA0IW5IlaK1TZdTrb8xj
         T1RpV/D22ixGyGfh0q2h0MCNQyhkt3A6o+3WiLfL+ELiDjQC8Mx0MKsTdGfqukJKUNYI
         YvlSxXHP0gcfX2tJgf1LhUNQSMkJjQvvOQ5wgZCuoIIi549FXtcZ1IC1DBIsD7sVnYgq
         oZdgyYxUv8Khl8wl5WB73NZk6cptbCssyiUrKoNbpF1qaXgxMHg2RTPKlFFcV3JpgtgD
         gALxJU4E+5PPeOpycwb82seH0sgznn84UV5ExW4HuTCsokPSCIeW3ZzrPLRJCkItzS5l
         sD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083639; x=1795688439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhMldp/vd/3xPeYieMpRCN6PVD+GGJcYfaPHMFtkt6g=;
        b=ILpPnhGhxldBPRfFCBTlhkG266MUmAEOpTb7mQGqUMsQ35WOe6EJcU3MFVKZFHqs3R
         SCJ4spHhmMOm7yw8q9/1cDvPW2kOEHdMtUtW+WESWjoj09ct6MJweylC/6HAlz+5G5sI
         TRG/lt7zUZYSFZrklofYooiNyJ1TOwpjDTLiAKaPcynxd5ne79NLpBIKbprj2eB7+JBa
         j2Wat0vxBjffwqBFLIILkRzSxiX779LoYHbqn4AxWpMl33rW9wBHZ0GfIHpXzITUklGv
         uhZvKHt2Gae6x8QqRPe6KHcJNI9R1BjD5rdhCrmPV45US6mFWuNZAuiUelDzb4OnDs2X
         h9NA==
X-Forwarded-Encrypted: i=1; AL+hErH9+EFcsndASEWFc8uf5cKLUHiTpqn/sjOp7bk+Lj3JrEP62EKQkTc+1uNKpPMt2qHEmquUTrI9KCTLuq8ahNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ab4rvef/dOx/rBuKt+5AVwmwm+vB5PFK/1joMjkBczq13c84s
	tCNYUFOoiZeqRJrRnhNtLtr7xye02nPzekqwYa/63mMjBi6JXhwMawa50jNfNnZenoi/GdU4XZz
	zYvR0I8nBTCE4LJH4s5Cf7eQ9qGK+NxFYewCXqLdkH7hBPbnOabXlp/UtdQcPDJj7mTGyOQ==
X-Gm-Gg: AYBFou2w5T+h3Pw/o/pUijl/2SyRhiPxyBw4W9/OqojZTP/LBxMg2uMkbnu9Cqy4yz+
	l3MdE7+vUf5xQRejilPJheqMjIpTt2i0ReqczCh1bkZwDsxrbmfrDgJdJbdAZI2NoW96G7UxBw2
	B4YbbzneCWu2pyz5mJNvlADgbFMHld49YcHhw6+rDdJ/CjUOwQKqiFEDn8/Mr+eyro1NFZf5ZU1
	u/UTenRI2DOZced8agbEuSFo3FzFSfQYWLx321JuXnNoMD/BNj4Dsasz6V4y4YbGpOoh4fZ3WWT
	y6VUUoERUqdrQW4iBwKa9EQulS8edyEtkgtnErdsGUKEyylZqhbgjIoyMPAMPJsxERKzSVSgk52
	zXucTFEJZoXT046zwsN4ORqqGONiJbcA4hnL0DQ0x8dYEGL7EaBeJXwSzgg3baf/rIacig2pTT8
	dY+TM=
X-Received: by 2002:a05:600c:4e45:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb7da267bamr95705485e9.22.1795083638705;
        Thu, 19 Nov 2026 02:20:38 -0800 (PST)
X-Received: by 2002:a05:600c:4e45:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb7da267bamr95704865e9.22.1795083638277;
        Thu, 19 Nov 2026 02:20:38 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm37226425e9.13.2026.11.19.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:20:37 -0800 (PST)
Date: Thu, 19 Nov 2026 11:20:34 +0100
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
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 00/16] sched/deadline: first bandwidth accounting
 fixes and selftests
Message-ID: <av7NchMg0wnyzjcd@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1795037078.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <cover.1795037078.git.mathieu.desnoyers@efficios.com>

Hello,

On 18/11/26 16:24, Mathieu Desnoyers wrote:
> Hi Ingo, Juri,
> 
> This series fixes 13 bugs of SCHED_DEADLINE. Then it shows the deadline
> bandwidth of each runqueue in sched_debug, and adds two selftests. The
> fixes come first, so that stable can take patches 1 to 13.

Thanks for splitting this out. I ran v2 in 8-CPU guests with lockdep and
proxy exec on. deadline_switch_test passes 5/5 (sysrq cases included),
and deadline_bw_test passes 45/46 (move_cancelled skips without
RT_GROUP_SCHED). There were no splats. Reverting patch 10 brings back
asleep_round_trip, stopped_switched_out and overrun_caught, as claimed.
cgroup's test_cpuset_prs.sh also passes, as on rc2.

I also covered two of the "not tested" items:

- cgroup v1 cpusets (two exclusive cpusets, root load balancing off):
  admission, affinity, refused moves and hotplug all behave as on v2.
  On both v1 and v2, moving a task A -> B -> A leaves its bandwidth
  in B, so A is under-counted once the task dies. The leak is on rc2
  too and the full v7 fixes it, so it is not a regression.

- sched_ext: the in-tree sched_ext selftests pass on v2, total_bw
  included (dsp_local_on needs IKCONFIG_PROC for its __kconfig extern).
  With scx_simple loaded, deadline_switch_test passes. The server cases
  of deadline_bw_test fail, because they configure fair_server, which is
  detached while ext is enabled. Pointed at ext_server, server_params,
  server_rebuilds, server_states and server_reclaim pass. hotplug_server
  still fails there, as scx_simple gets ejected when the CPU goes
  offline (I haven't dug further). Could the test pick the server that
  is active?

...

> Patch 10 clears the parameters of a task that leaves the class asleep.
> On v7.4-rc2, such a task kept them. That hid a bug of the rtmutex chain
> walk

Please move this into the changelog of patch 10 itself, as the cover
won't end up in git. IIUC, the owner then sits in the patch 8 bail-out
with a deadline of "now" until it unlocks. Other deadline tasks keep
their bandwidth, but lose latency, and RT/fair tasks on that CPU get
possibly starved.

Doesn't your separate "Fix an overflow of the 0-lag time with long
periods" also fits here, right before patch 10, which adds a caller of
that computation?

Patch 5: yes, keep my Reviewed-by on the version with the cpu_active()
check.

Thanks!
Juri

