Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69E43F4C6
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238405; cv=pass; b=YSMQfOdReam2QJc4JVey5x2niv6/8O3+tS+VpvTVyaHoBFqseRF7EA7j45k5lcpvmHleppQ5wQ4G7RVBQqcQmHWNi5ZF4oT3Rt0rvYVwn4Mi8L12aMVjV+9JOqmipqVCbnrfVbqYed9MYvezAcwATTo1EFhIgVY7wK6LJ8WkrKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238405; c=relaxed/simple;
	bh=svx/lXpxbyRvC5hg9Mf7leQZBgztlGdMd/1meLurTMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b87Ru1Ws/Wkp7iHulekoNBbc45w6G3Tc6/sOECLVx8E/jgGEOieWiXtqmFKDmp6KmOIQkdu+9EoImUA6oOPVIoRwIHo3EdWzBSiKhM3B7mVu4CZI8u6/H7vW6IhjOnyn+b1yQI5BozuSYSprl/wuHw4CzvGC1rCSfpDzQzSG6j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GbaUbnw3; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbaUbnw3"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb767cc7fso16033171cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790238399; cv=none;
        d=google.com; s=arc-20260327;
        b=m9FMHhefonbFRYd9SA2VwCxFaGpkvO6jtgxXv8RLk2M4TerR7x4xryJjD97HsPg9va
         B5HfWNCU3twFF+fSgGdVrvQg4OFjnWetEH41EPi3qqWWBPNlrbOFvqvbh+glglbP53qP
         KQPlT7e78/9rKSbYdo/rAOjlDANOjPTavfH7o56NAKq1LhdJFUr2o2MQ1VF+chbGhHls
         QTdhg8Vi3aUevFXwwlrJsv1TlTsMC6uh+MD4RiSJerBS1itJq9vSlKx3mh6Uy1X7egmw
         xFfbMQO6ra0zZ6YzpZbZ1yHc3LmVh5XjR3tjfq6zxAGxdW/ttcvVe2R8TXpr3RVfUmjA
         hCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Djx86NYnyz/9RFz/5fi7+M66lo0Fi/FSUEqHr4nGVIo=;
        fh=hZ7cbaEL3aHVINKnPqeLhLC9Rq9YcBKeznrwt3VsTUU=;
        b=CSsiPfCzNXu4XvcemmLtYSCnOsCUNtbf6ftUeGlG5jD8I/kWCLL5s87oppZ8Ih+Apc
         +Cv9iyQ3gk5eteUxvrIiy4w8pM/0QrxmdX353ni41qXiQ7ExkvPtB3T79sl2FmOMGg9j
         KqVxROL8RkD5DZ9lVh30fyQfP53R1YtmvvCAcspe78Rv2/N6DqEB36i72abjBfqxL7ZJ
         IbNmiddIyDDx9s/oUXZj513/hh2at6xjvUVoSEOPfCPJtzfwOL1ttUyCXtcfz6+q7oKz
         0B+OqmHWwAAT2MljLrNDK4DGceOVjTfvrKUumzSVQE+1PvEyfMIvpD2WNMLznNsUROGN
         GNUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790238399; x=1790843199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Djx86NYnyz/9RFz/5fi7+M66lo0Fi/FSUEqHr4nGVIo=;
        b=GbaUbnw3MbE4686aB+MUIX/nDidDE5Z3rBo4OINjyQc5X+3lgamt4CS62TDWDKCzf4
         3YX0Zu/YXQveN+I17TTkN6ju8/1eSPhPaSW2cEdqgAfj0cfBPDVIXIwrFy/aY0F0wwgO
         VH27RZJnQx7wBVgFWGlJNReK97nLue5IdRNvUORFBBbNku6xLlOUNAckvX7mxVU/39Bl
         7/BmiqJtr97Sw1pr4pBxWv4fMGQuBDcxVSMncumxC4o/Hpz1jHnJ1aC5asLvz2+FVkxm
         bRLxuEOE1Lz80cbD16xla54/+5FPb3Dwle2zh+7Ncw3lP84bGtx+8pG9M5EyKrvDY9TN
         k4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238399; x=1790843199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djx86NYnyz/9RFz/5fi7+M66lo0Fi/FSUEqHr4nGVIo=;
        b=Y2rbAZ0zpcAm9PVYLhjowoqDjGKMyYbIaeBb6LD+l8oZIKq+/sZy7LOfBLYIaw1NgS
         o+jdVZvokIllbj+2NMaQnciuxAvfxYMBh8UXz/kNU7kKMWEwmanEizfkDr+zBNhD54jk
         O1wmZM3fbkr2VEADktBPDOJa9STSG7xjy4aDRatPt6b8MOQ4/fhPUVKVWQ/Ot6611hNG
         Ic4MhTka/OJYDQHEj+BdfPVNwtDR5PvDedQ7d276Q9iVR6oU389yJ2YpaoLXsm0K+Hwq
         XFaz9H7ik0/C0qEg4OsN9A7PAjX7Lw/QEtEDvIyE38pO8QgqXnwRNQx9ATvcW/L9FQ8C
         E5GA==
X-Forwarded-Encrypted: i=1; AKwUvByyWmfPWlzMuqVzL4relyvw4On+CPBQF9dhLodmT9UxzmksVw/rcf/s91OaKij8XRfSb9brXj+lkqD/qUhRWBk=@vger.kernel.org
X-Gm-Message-State: AFuF++kl/wpQxyHazfNCLznQWbHs6kMFqRUrHqN9DLdaYsuVf+TAyb/D
	mCIhrUQlH4GGgDN55vgL2KstvZ3Fkr+7wQ9ZAy2FlC0DCdwYB+iF1K/M4vvgANQrYOO9mgAzVMA
	pQpavm46nreMrrFdwobeZKsIDc4zQB6XP2Qvdwkwd
X-Gm-Gg: AYBFou1WEuRZRjAPWRSp93L0k15bN3i0pDNJ3X8PY9RkWM+XD6fQhrqXA6nH6mrNYUK
	DfvnerKQsjah732I2e2cpNFGE9Dhb6FhENMDJHF33/6ehF1mW/3XGe9wlO+7vlExSjwSe0GELem
	a/RYIqlAdupvNqULXryHOKmbxfRgHmK0DstAlsTBlhnzwJlpbCLAe6W5nMDkGoFqiuv5JJqmrKI
	pw8hbUVRqi6KFtuiQEewvEY4jMgrfUndpM+jhiu6A4McUf8+7aymT6sa9Hk/vuaPDXEB+DiPWD5
	1Wg2+XShiAJEuHZuDAImKrRVevQ4/YuwKHqFNUElYewDEiNAySMTmRUt5FLcwtMHzHjArsk53jx
	+XwIeugpsTCmp1hd2pAnOasjUkm8BjYXilWjpp5bgKUBvvWBG9nXe+DWWcntyly0anOUT
X-Received: by 2002:a05:622a:4185:b0:532:d0ab:f3cb with SMTP id
 d75a77b69052e-532feb52734mr11578341cf.59.1790238398107; Thu, 24 Sep 2026
 01:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924080219.1036588-1-caixinchen1@huawei.com>
In-Reply-To: <20260924080219.1036588-1-caixinchen1@huawei.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 24 Sep 2026 10:26:25 +0200
X-Gm-Features: AclHuK9XSbyZhfSiccnO7XKdYo-g6nGD7WSG7r9j6ZGeEHZyUxcT2PFsdbnfwn4
Message-ID: <CANn89iJVGmYwQerOixGurH6vw-GtvSAQq6u6zSNZoyZrcEx6Jw@mail.gmail.com>
Subject: Re: [PATCH RFC -next 0/5] net: charge socket memory budget to memcg upfront
To: Cai Xinchen <caixinchen1@huawei.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, kuniyu@google.com, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org, ncardwell@google.com, matttbe@kernel.org, 
	martineau@kernel.org, geliang@kernel.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 9:36=E2=80=AFAM Cai Xinchen <caixinchen1@huawei.com=
> wrote:
>
> The memcg socket accounting currently charges pages to the memory
> cgroup per grant (__sk_mem_schedule() publishing forward allocation)
> and refunds them later from skb destructors.  The refund side folds
> per-skb "was this charged" snapshots back into the socket balance
> under concurrent lockless RMW, and races there can drive the memcg
> socket balance negative, ending with:
>
>     page_counter underflow
>     WARNING: ... mm/page_counter.c ... page_counter_cancel()
>
> This series flips the model: a socket is charged its whole memory
> budget (sk_sndbuf + sk_rcvbuf + sk_reserved_mem) to its memcg when the
> budget is established or grows, and refunded when the budget shrinks
> or the socket dies.  Grants and per-skb charge/uncharge stop touching
> the memcg entirely, so the racy refund pairing has no code left to go
> wrong: refunds can never exceed charges and the balance cannot
> underflow by construction.
>
> Tested: full arm64 build with 0 warnings; each intermediate state
> compiles (bisectable); tools/testing/selftests/cgroup builds clean.
> Runtime validation on the workload that used to trigger the underflow
> is pending.
>


Charging sk_sndbuf + sk_rcvbuf upfront to memory.current is not
viable, especially for servers handling large numbers of connections
(e.g. 1 million TCP sockets):

We specifically went in the exact opposite direction in commit
4890b686f408 ("net: keep sk->sk_forward_alloc as small as possible")
to make sure idle sockets hold zero forward-allocated memory and
non-idle sockets hold less than one page (4 KB) in sk_forward_alloc.


1. Massive phantom memory charges and false OOMs:
   With default sysctl_tcp_wmem[1] (16 KB) and sysctl_tcp_rmem[1]
   (128 KB), 1 million completely idle TCP sockets immediately charge
   144 GB to the cgroup's memory.current while holding 0 bytes of
   actual packet buffers.
   Worse, once TCP autotuning grows sk_rcvbuf / sk_sndbuf during a
   short burst (up to tcp_rmem[2] =3D 6 MB and tcp_wmem[2] =3D 4 MB by
   default), TCP does not shrink sk_rcvbuf or sk_sndbuf when the queues
   drain and the connection becomes idle again. 1 million long-lived,
   mostly-idle connections would permanently pin hundreds of GBs (up to
   several TBs) of non-existent memory in memory.current, forcing the
   memcg into constant reclaim thrashing of real page cache/anon pages
   and triggering premature memcg OOM kills.

2. Overcommitted caps vs. physical reservations:
   sk_sndbuf and sk_rcvbuf are per-socket upper bounds that are heavily
   overcommitted across sockets, not reservations (unlike SO_RESERVE_MEM).
   Comparing this to vm_committed_as is flawed: vm_committed_as tracks
   virtual address space overcommit globally and is never charged to
   memcg's memory.current for the exact same reason.

3. Broken memcg limit enforcement (memory.max bypass):
   __sk_mem_raise_allocated() drops mem_cgroup_sk_charge() completely,
   while sk_memcg_budget_sync() ignores charge failures ("the new budget
   is used uncharged"). When a cgroup reaches memory.max,
   sk_memcg_budget_sync() fails in sock_init_data_uid(), tcp_init_sock(),
   setsockopt(SO_SNDBUF/SO_RCVBUF), or autotuning, yet sk_sndbuf and
   sk_rcvbuf are still raised. Subsequent skb allocations in
   __sk_mem_schedule() will then allocate real physical memory without
   charging the memcg at all.

4. Unnecessary struct sock bloat and hot-path overhead:
   - Adds 8 bytes (sk_memcg_budget + sk_memcg_budget_lock) to struct sock
     (even when !CONFIG_MEMCG).
   - Acquires spin_lock_bh(&sk->sk_memcg_budget_lock) inside
     sk_mem_reclaim().
   - Every TCP socket creation charges rmem_default + wmem_default
     (416 KB) in sock_init_data_uid() and immediately uncharges 272 KB
     in tcp_init_sock().

If you are hitting a page_counter underflow race in socket memcg
accounting, please share the exact race / stack trace and fix the
underlying accounting bug rather than charging uncommitted buffer limits.
