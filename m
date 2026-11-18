Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009864;
	b=sDt35tPd0Yz46LpcQ7bfA0zX39puQZRNAt7j1m8zTrAkE/h/dZPA4K3+8VYGmb0hEkY8
	 vltxbLbA489yXAvcDbw4udN4WxZcai2DdoTlbr6PYbnFGFKni3MblQnJ+7Pn3+XCa302A
	 nUW4G7fqH2a6Fuf5gy5SKIN4fczFwbO64mIJOE/JlseZne2ZXuW8Rg6DxXC9fMwgApmaX
	 MjxUGB1FMd4A5wFQ1y1SVBnWK7PC/iYOjy3jzyJp2RwfzpE1r4FqK4EThjjndsd/nu8oU
	 DbKjnZLzodthIdwhDee1s5ozsq2NzBxjZYby+XyNCbhdnUQrotOVY5GdoI1bvjb0HKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009864;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Xv6ZLSbP6n9Fqjz3yHGKwGABvgK8NbihdmkMj0RD7OU=;
	b=VeGf3tRFo9IlCdN5zprXb5leZueZZ6E7MgWMxUQ2N5CVAiduumWWag8+pxqsT32kkPFf
	 0BuanA0vZR0GlDyUhQ0DaS7U7RKUaJQHvpdqOzmRtjKGdb9pngjRWNdrcn3nriCTpu2If
	 xmMXpo2U3G1/I81HHLtJdrhDeKSCFjRxwZ4v1kuD8c8FZMO5kmyKOu1TKLntyXCU4nWqZ
	 SJXDb7Ueqo1ReeZxvftCdB48+sReNq7QcfygvibTK2lqoIUn8U/bd1BFJKGQGwDHMd7zO
	 3q8EcMRRIHOcFvtYJtdWNd6N4+Dr8AHflnju0XgTcXEjNe4XVkZCa/AZc8WTtdEm46w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lSWxA4eB;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DAE606A31C;
	Wed, 18 Nov 2026 13:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lSWxA4eB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xv6ZLSbP6n9Fqjz3yHGKwGABvgK8NbihdmkMj0RD7OU=; b=lSWxA4eB5bPX/y/32M3w5C7/M0
	2eVPLLtSf/Y8ZLm7VJAFzm97q/ieD+h5+g62xiaSU5XTHv5YxiDJaS/qpHSdUdYCA8mQnWx/KbSPI
	VGqdhMuGDvs8b8oK2ziJB7l/qN8JlloMbIvpbaIJAbYI3fsdfCGai3JJw4MMJQRtNAyO9oCapLN/x
	rMZLyVJNBjcvihA2UDune6ANtdrgjlyArvxX1pBsOOnzxeEgI6alJYNr2RX6hMA5oU5OOsG/q5QOm
	lC9ficajCKBuQE/kLerGwfqIIkA8Bh+qubJsFRtn9gwOZr+Rsj5z/odxFkLTwDmfusdzR4Yf8L2jW
	9kzAjV5g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg3q-0000000G61F-0eLq;
	Wed, 18 Nov 2026 13:50:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 736E630057F; Wed, 18 Nov 2026 14:50:52 +0100 (CET)
Date: Wed, 18 Nov 2026 14:50:52 +0100
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
Subject: Re: [PATCH 2/5] sched/core: Keep a sibling's DL server link in the
 core-wide pick
Message-ID: <20261118135052.GX1779021@noisy.programming.kicks-ass.net>
References: <20261112161548.78189-1-sieberf@amazon.com>
 <20261112161548.78189-3-sieberf@amazon.com>
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
In-Reply-To: <20261112161548.78189-3-sieberf@amazon.com>

On Thu, Nov 12, 2026 at 06:15:45PM +0200, Fernand Sieber wrote:
> The core-wide selection records in rq_i->core_dl_server the DL server
> each sibling's pick came through, then clears it for every sibling in
> the cookie matching loop, including when the pick is kept. The sibling
> takes the fast path, which sets rq->dl_server from rq->core_dl_server,
> and runs the task its server picked with p->dl_server NULL. Only the
> selecting CPU keeps the link, as its pick goes through rq->dl_server.
> 
> A running task is ranked for core scheduling by p->dl_server. While
> such a task runs on a sibling, each following core-wide selection
> ranks it as a plain fair or ext task rather than by its server's
> deadline, so a higher class task on another sibling takes the core
> back before the server's runtime is used. The RV nomiss monitor, which
> follows the server through next->dl_server at sched_switch, does not
> see the server run either.
> 
> Keep the server that pick_task() left in rq_i->dl_server. With the
> previous patch it is NULL when the class pick was replaced. Drop the
> assignment in the first loop, which the matching loop always
> overwrites.
> 
> Fixes: bd9bbc96e835 ("sched: Rework dl_server")
> Signed-off-by: Fernand Sieber <sieberf@amazon.com>
> ---
>  kernel/sched/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f7ac13186ee59..61d4e6e990bba 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6431,7 +6431,6 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
>  		}
>  
>  		rq_i->core_pick = p;
> -		rq_i->core_dl_server = rq_i->dl_server;
>  
>  		if (!max || prio_less(max, p, fi_before))
>  			max = p;
> @@ -6462,7 +6461,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
>  		}
>  
>  		rq_i->core_pick = p;
> -		rq_i->core_dl_server = NULL;
> +		rq_i->core_dl_server = rq_i->dl_server;
>  
>  		if (p == rq_i->idle) {
>  			if (rq_i->nr_running) {

Isn't this broken in the face of a rq->lock drop through pick_task() ?

Consider this does:

  SMT0: pick_task()
  SMT1: pick_task()
          drop rq->lock
	    newidle

  SMT0: rq_0->core_dl_server = rq_0->dl_server;


I am reworking all of that somewhere, but delaying saving rq->dl_server
like this feels fragile.

Can't we fold the first two patches into something like so?

---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 175b52a7ea79..68b980ddf88f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6453,10 +6453,16 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 				p = sched_core_find(rq_i, cookie);
 			if (!p)
 				p = idle_sched_class.pick_task(rq_i, rf);
+
+			/*
+			 * Neither a core tree pick nor idle comes through a
+			 * DL server; drop the one the replaced pick left.
+			 */
+			rq_i->dl_server = NULL;
 		}
 
 		rq_i->core_pick = p;
-		rq_i->core_dl_server = NULL;
+		rq_i->core_dl_server = rq_i->dl_server;
 
 		if (p == rq_i->idle) {
 			if (rq_i->nr_running) {
