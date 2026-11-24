Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497646;
	b=edGWo5saIsMoTJgiAR+GUKRyIBSHI+TI/TkKhPrR4zXL8mzyleA97ZGYAdxArZ0kdU7m
	 fje/H+7hx7i4kQDg/2PdgL2RwKAW3m7wEbcPgAFP0oUxcqxwym10b7/v9w8QhbucwimcT
	 XKNwT29/pGXy5IMDYFAcQPSpzbzeUWcTOGpJ7RRoS2nlgfFjdebc/lj3UrbNRQlIRzuXj
	 X9s4QKyewi1TthIESa04osB8qJ+9lN1wfc5uvvJBnAM1dF+cTTSqy8d9vlkGr9puYwOfF
	 bzgkmfKwpPKF20ITt8o7fmLBT3j+w3a7EArm0oR2LDJOrN9p/CYd3lL2F6d3u1wdX4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497646;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HHEfeb/HG/M+BRVHRw4kn8MAzbxsATW49wX/1og7PUs=;
	b=ojvC4c5IKXY6TCwtKQOHZOfHzRpTh9A9dFoLtLmbgXLf3bixyMvJYMkM6AYuLfvfpNwr
	 lhQrCR4n9B5obvc7+gdNnIiyxKPxaWaHdKLnvkIlZ3OmVgPce9tWJ3byX4OOxJYqy62vD
	 09BGOa4GTSnN5eXjPSIJpzaTHMJCNlAyAEUfRTzlXwizxzbfJq22dmnM1u1DHPG4cD0qO
	 a28FsLqS9wZQGlbDOtV6YqNlQr38FsB+RXvvc2oTnfURDIKKpsWpLC80As5+ng72RoGYh
	 /6/i3dh9iWvV7itNT5vsO0CXFC2Hb5NvB2mNeWFeFiklVmo+qFAZ0/Te4Bsy6/S3xbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PsJkKPTH;
	arc=none smtp.remote-ip=91.218.175.138
Received: from mta0.migadu.com (out-138.mta0.migadu.com [91.218.175.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27D606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 05:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B27D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PsJkKPTH
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/FLpDUQaN5zSNJauElzR553aGFbKTy0m62Qa9BEG34w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795497644; v=1; x=1796102444;
 b=PsJkKPTH7oTCW1wmCW4uRkE/h5HX+Z/oMjXGD8MlvNB0mB6c3jIxta5gVTrYx6DBfNgP2O0B
 ol8eNLmqWwwHt7GKP19R/6oVm7RHivu7wF1fkuquZO6JuAcqlKsA6p5Z/y4SDRoCBs8NaM/n0xV
 ijJConrDx0Bwu7tHVJm758oU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d2e7a79f004113c;
	Tue, 24 Nov 2026 05:20:36 +0000
X-Mizu-Trace-ID: 0d2e7a79f004113c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 21:20:29 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Waiman Long <longman@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH bpf-next v2] cgroup/rstat: disable preemption in
 css_rstat_updated()
Message-ID: <20261124052001.GB555944@shakeel.butt@linux.dev>
References: <20261124031642.40616-1-kmehltretter@gmail.com>
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
In-Reply-To: <20261124031642.40616-1-kmehltretter@gmail.com>

On Tue, Nov 24, 2026 at 04:16:42AM +0100, Karl Mehltretter wrote:
> BPF programs can call css_rstat_updated() with preemption enabled.
> The kfunc calls __css_rstat_updated(), which requires preemption to
> be disabled while it queues an rstat update. A cgroup iterator can
> hit the lockdep assertion on both RT and non-RT kernels. The
> cgroup_hierarchical_stats selftest can also hit it on PREEMPT_RT:
> spin_lock_irqsave() on trace_cgroup_path_lock leaves preemption and
> interrupts enabled there.
> 
> Disable preemption in the BPF wrapper after validating the CPU and
> before calling __css_rstat_updated().
> 
> Fixes: 36df6e3dbd7e ("cgroup: make css_rstat_updated nmi safe")
> Reported-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Closes: https://lore.kernel.org/r/20251119111402.153727-1-jiayuan.chen@linux.dev/
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
