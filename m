Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009979;
	b=ynbpxhyXKA9L/JjaoK/8ld2ih2jxGRKLhjEarMMUtcYJIgPYpoPt0j15+FeoIJ9i0gjW
	 g7I1QmXF0iO2I8U5SihAR4kb3yDN4NrbARkbiltCxH5601Jlakpo8jIeGmYL9fwyvh0tz
	 GbIPRIsrYHW7EAuFiPBrATxthHpNx3KuPwoVBqiuBAnO2nz5Y75aFOy2iF1UI32nqj/WJ
	 6yEurxY50R4ZfwywrdmjTLxmBJbcPi5pwQzL1mCUND3/V0GISNybugEyGuQEDwjQsd5Hw
	 rsP31nQ+F7JD/9vvnl7jIixBR6J8mgiEsHJcACAd+ei6HskYSk2RiQBWMLwq2DmZYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009979;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3a1f6P0nUJPV8v2Ost8sV89xef4PFS12JMbTJ7+96as=;
	b=o6TzMr7qYZgA9wC1MAGolVy4JFmryCusAMaCURn9bUte5i+fZ35NdRXk9Q2dHirqGznV
	 C9D7cn3WhRltlHFFt/zaJ8iPNsoxVltktMVK2W/RX+gqpfjQMFvNstnxkrW+uFYOdqvm5
	 nKTvnUFanNfDnKwV8CorD+MbonUyiXoQaLRM7wfCwZ3HdOIJJLyZadgJmlAQ/YvvZR0wn
	 ayX837veP5wmOAOeLnndT5TcM35sYE3+wa8syuMz7NBzCVnGirJPbe4+xQigcVfDVXebx
	 rlsY1sFJA/zKo9csZCx/m2xWPp4j1MY+3bkGl3bKBhmFcCC0GDgwE4Uin5BoP7h9zXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=U+NKX1cS;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C32E606A31C;
	Wed, 18 Nov 2026 13:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C32E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=U+NKX1cS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3a1f6P0nUJPV8v2Ost8sV89xef4PFS12JMbTJ7+96as=; b=U+NKX1cSlsmBMSsES7i/w3N3p2
	iuK9WszPO1Cc5v9WRTpiAr329oDrf4Q/Hwcqf3r/AHL+/adNakK7/mzbRNRCSNktVknzs/GSQ1uIy
	lcUaMY8j5qmsdHBE+QUMIX90z2SrARX7R9fhdFz1J62B2qvDdIddzaq66d5w3AzuAmxPyHlRLvkqS
	VCdpxcaKKezaznZXs+4ERMhYh6HNYnc/zj+gwOca9OJQ3m3kJDYXTGzcmOTkqP5dpxyIvi6lX4Mhy
	28vXzwhzx83LL+1kBVsKtridA0UXSm7S3lg0Ox8WhiIPVOrZ0leBaHX3+xj2z3Nn1RYtf3irq5yPB
	w+Nvvo5g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg5i-0000000DvWn-2owT;
	Wed, 18 Nov 2026 13:52:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 93A1F3005AF; Wed, 18 Nov 2026 14:52:49 +0100 (CET)
Date: Wed, 18 Nov 2026 14:52:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Fernand Sieber <sieberf@amazon.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, nh-open-source@amazon.com,
	Fahad Mubeen <fmubeen@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Misha Karataiev <karataev@amazon.com>,
	Hendrik Borghorst <hborghor@amazon.de>,
	Ibrahim Elshahed <lshahed@amazon.de>
Subject: Re: [PATCH 3/5] sched/core: Rank DL server picks as deadline in the
 core-wide pick
Message-ID: <20261118135249.GY1779021@noisy.programming.kicks-ass.net>
References: <20261112161548.78189-1-sieberf@amazon.com>
 <20261112161548.78189-4-sieberf@amazon.com>
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
In-Reply-To: <20261112161548.78189-4-sieberf@amazon.com>

On Thu, Nov 12, 2026 at 06:15:46PM +0200, Fernand Sieber wrote:
> Commit 4b26cfdd3956 ("sched/core: Fix priority checking for DL server
> picks") made the core-wide selection rank a task picked through a DL
> server as deadline, so that a fair task competing with RT tasks under
> core scheduling still gets its server's bandwidth. It keys on
> p->dl_server, which pick_task() used to set.
> 
> Since commit bd9bbc96e835 ("sched: Rework dl_server"), pick_task()
> records the server in rq->dl_server and p->dl_server is only set once
> the task is switched in. The core-wide selection still ranks each
> sibling's pick with prio_less(), so a task the sibling's server has
> just picked ranks as a plain fair or ext task and loses to an RT task
> on another sibling. The server's CPU then runs a task with the RT
> task's cookie or is forced idle, and the fair task gets none of the
> server's bandwidth for as long as the RT task runs.
> 
> Rank each sibling's pick by the server it came through, rq_i->dl_server.
> prio_less() keeps using p->dl_server for the core tree, whose tasks are
> not being picked.
> 

I don't love this, but I don't see another way either, so yes.
