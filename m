Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479773;
	b=2ZVmqYO0Lf7zOG6X2CcD86VycYnmKInZ16//FBHQdogsCVEj11Rc5CqCEIdlbrmzztGz
	 DrHNCFNQOwGxTxci3zL+ivQtdJxHriL6A5KQFw9kvgPz4lnW+5qMmWzFEKcbtBurJV6xh
	 KuHXK3Nmd+lsrDDJLZRK8GJQDSA5XrIv2j9DMrCbvhcgpKCat6G0swIDchEMccso7Z2/2
	 502gV30gDrkLsqVgSEQE+KBrc+qLkki4OcxMnij7k3sjsQoNBnNwas0LPnGtmJpRL/jAP
	 vEW3+ApYVDp7jA70+vDn5r+ZAm2TFACqzzqJsolwpjDyTG/5MP+6Wg5/Q0MKuBjCY0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479773;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ogwz7ul59oD/hj3UG/Yij9D+/c4RWMPymBINXQ6+9Bk=;
	b=XAxzfnuGLsHhNfDHHYXUd+CAINfvPKPA7h0We2W46Ht1WpNUKBt1IBtXMuHycDaxbcUr
	 Zm+FXtrBvdTnwxE1FP1xW/XAjvM7F+LrmOflaqyLAMTHrMAh4yZCGdNnjnbytmO2CDisA
	 itpW4eG5XOq0HNErfM7mH1CeOQ2U63Rkrj5HeEoG3OtywCkx+QD+wklyDOxVQZKBULcH4
	 FbiSv1L115aRWx5C263U/g9bDTBSz0Y96yI6wYpwaTvedan6apeCugPB+/7BPyOjX4unK
	 hhnZXub2gfVLx/OfCl/cQWWvatmrkiKDEJaUkqzdVDTdvfktCHn8BhxHemz+nlbo8jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6OaBErl;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lPkq+kCJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB87606A887
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 10:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB87606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6OaBErl;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lPkq+kCJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794479771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ogwz7ul59oD/hj3UG/Yij9D+/c4RWMPymBINXQ6+9Bk=;
	b=U6OaBErlYMSHobbPrJAoJTPY3fslh246DBRqobmFAs8roRgp/0Fx6LTp0i9vQ+u0hwCsFa
	gPJzRGAI+QvuLXpM4wBPJILFXz9dI41hN1RCwuzCNf6fkRdxvlkoDzuTDI0jYVR377TB6j
	WYdrqMuFfCWqHWmOSmTqeZHgqz07OEM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-envdqSWAM0SAFQhb3GrRQw-1; Thu, 12 Nov 2026 05:36:10 -0500
X-MC-Unique: envdqSWAM0SAFQhb3GrRQw-1
X-Mimecast-MFC-AGG-ID: envdqSWAM0SAFQhb3GrRQw_1794479769
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so6180465e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 02:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794479769; x=1795084569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ogwz7ul59oD/hj3UG/Yij9D+/c4RWMPymBINXQ6+9Bk=;
        b=lPkq+kCJM2Ukg4Zws6fskES5U7k09H78lXinl0DlX74ddFDmHzPoI2tle74/yBu5QT
         KmdGpfCaUUduZ611q1IBDRvn0whTReefWjNQ+JejQMGX5ys0WOCZEtaImQLznHxcc88n
         c9keFcTrhU6XgoCsOZaXXSXu1STQ7smK8H3Tb3SDJMjH86TB8W4EKLpqEpAlECxslsGb
         nPCDrkBZjKceLlOg3gSjJe/VsievNDtwa8UhUKjklSuRpcTFhvoVCmvka8/7GmPNqQ9B
         HFGO2yw2BTSnRmACKW9KQLE6ibOMdmhZqf0zZETh2o9YABo16mPyySOsTXPDOTW5G5zb
         vLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479769; x=1795084569;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ogwz7ul59oD/hj3UG/Yij9D+/c4RWMPymBINXQ6+9Bk=;
        b=Go3YTnp635dyAmXdG645bmJ4RO8xL1MRIVxuoCBSO4BqsauSqu7y6ex47/kElahRzI
         yisHDWztn3PEzgNsXn98kc7ae6EQTeAv5p+xqHz4xDqPu3EUJfq3aX3DP4aDQSdivit6
         zrXccuJ6rguonIR0lzbWHU5TT++8xlg+pmebBbBYotWlaqzNuzIy+tpNz6X6d4CzRVnl
         dsXWAUD5leUxJD1Xh9/CwWgNr0PXHCvzpizo907nfanF+BY6xARkn5LivlThbENgbKuB
         15PoBwTiToZVyq2WSSQMXR7sESYRZCtmXK5gxuz3yciJDZYQ/UqKL4/W508TZAhbyDiH
         R+Yw==
X-Forwarded-Encrypted: i=1; AL+hErF0BT1LtCgKzB8DR3aMnfrFBU7G0vyPAJC0ZP2LQevFeQ7v5kCppXeGnTGEoy4Xc4dRsGwuKyJ8RVxdYck8+jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CRl8vpdUo6fqQxLeK9eTfYc5kaPbTjTqZVTRMJueMXIK7PEWr
	8CG9nxZtyINfrvw2g7RMhQxFiZUl2ojt2yLPSmlKPwjJzFfhOAoyO8+Ty4xkO80VBRITRwuahWo
	DRq3RcDpQ2oBKLmjb7l9I6DMBFhDEF0fuhwtPh59MHt8XVXLfIgw/juZT4x3g7igukEioMw==
X-Gm-Gg: AYBFou1NENN9WoAwC64QAByvA0GHOC3sOcozNW7x6raxT4IiyZe0EjdKf050UbCHhVO
	EXOTX0szHthTcEaQK86UGKxeAiwWTfjuPYx1qF1ARtlgc0ftqwh+vgP168pcZFNxNfqmRSIkMdJ
	/xOjmp+hdRuKZlO4Kb+vg6Iqn4IX88A/RGxl86YZbYg0Kn7Gl9Wn6qmHTzKrrzKk6cKYaNwBRXE
	XHALQ38Li5wynNhLPYA+/GUdo1E5dCqiNqpeiowWL96S7/xQWNEb+FPVQl4YDZ0+GxomZhyu7LZ
	ZpLE6an92dS5Tpwr0xdK8PnUCnrjPeSqFn25Yi7wkSjKpUjndEtw4nAHlwfzeFGQZo4SvmuG7QQ
	lP6QIjkRJbkmYjDNpraQvoeMp4KLwjqW8L+kgtkMkBlJR4r+K1BHsI3os4x+YRDUrtUF+n+tu+6
	hEZ5g=
X-Received: by 2002:a05:600c:8b57:b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4bb4e283efamr44875075e9.8.1794479768799;
        Thu, 12 Nov 2026 02:36:08 -0800 (PST)
X-Received: by 2002:a05:600c:8b57:b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4bb4e283efamr44874665e9.8.1794479768472;
        Thu, 12 Nov 2026 02:36:08 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e27a8b0sm60917155e9.15.2026.11.12.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:36:06 -0800 (PST)
Date: Thu, 12 Nov 2026 11:36:04 +0100
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
Subject: Re: [PATCH v5 26/29] sched/debug: Show the deadline bandwidth of
 each runqueue
Message-ID: <avWWlEGGqVPYkuZw@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-27-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-27-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:54, Mathieu Desnoyers wrote:
> For each CPU, sched_debug prints the deadline bandwidth of its root
> domain. It does not print the two sums of its runqueue. this_bw is the
> bandwidth of the deadline tasks assigned to the CPU. running_bw is the
> part of it that belongs to active tasks.
> 
> GRUB reclaiming depends on both sums. grub_reclaim() takes this_bw -
> running_bw as the inactive bandwidth of the CPU. The more inactive
> bandwidth, the slower a reclaiming task uses up its runtime.
> 
> The kernel warns when a sum wraps around, and when running_bw exceeds
> this_bw. Bandwidth left behind in this_bw triggers no warning.
> 
> Print both sums. The deadline_bw_test selftest added later in this
> series reads this_bw in its params_waking and random_mix cases. It
> checks that this_bw is back to its first value once their tasks are
> gone.
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/debug.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index e0d6cd3bd607..3dbe1d7d2d77 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1174,6 +1174,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl_rq *dl_rq)
>  	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(dl_rq->x))
>  
>  	PU(dl_nr_running);
> +	PU(running_bw);
> +	PU(this_bw);

OK, but we will still not printing additional useful information like
extra_bw, etc. Not sure if you are aware of tools/sched/dl_bw_dump.py
drgn script; maybe that is already useful for the needed additional
debugging information?

Thanks,
Juri

