Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2547D40B0FE
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243780; cv=pass; b=rSgE+WE9wI5+aOtZXfkVNp/GyNixwRF7dMnCCeFE0VCdn8cFzMMQRAXgAy9a5Scw5yryFvRTtdrnLnbX+crNWO27rXyPnIb27BDT0HSMM0XXT2oEA0SL9eL3zdLf9AEOHL0m7TTQ5gPuu2UGrwhSDc+H4ZnrlzFw515oJ+sJWwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243780; c=relaxed/simple;
	bh=LBZZcNSVeHHRIpD1xuzWESX6CCgFGvOZ+4ZFnY2ewKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dy0KvZeyGUKx+cJdoxw5aDIsFkneZZboGz0thN5Zd//ZUrDXSdJX44DfHfq+Du1mxfIdEC59M97RW/tNgkkaTXv1RzNvdjtxJFHw/8wXgXhX6nUG7FwXxvtSxfpP0JOObpdFByGx6fIVgMWTDEDnKny8Ac6NZy441DQ+VFxEbes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JODW4//u; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JODW4//u"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb769ca17so14593501cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 02:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790243763; cv=none;
        d=google.com; s=arc-20260327;
        b=LP1rLpLS/3s8JNd9NBfFat0D96RpoDIfsXVdJBf8tFK85ITBKEfrWv04Lw8ZuujmrB
         i94CarE7xMfTwqksQokO79Tnm+1B/1uYElKqCQKDw3YYo43O5eeBsHyBMfUAGlu5wVme
         uDiN+FfYsFwiQCXcEvTX2tBOakMWvMnrGxuYR+mjeGtT70BDU4Y5/PMB694il8CCFUJD
         ZgtTfySIVEQZVw9sqCShK/bixfFwgg4Bm+L5HLCUKoEkc6+koTsG0Ramuzucqexa8Bze
         1oSKw3PwEh9NZX9to2TF5GWiOI6DIro3RypEmQG5+XId7sedmcstwkzdWQvPwwL1XQEu
         U0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rM8Pnb3OaTJqlPgDl5Nu230H8PB3TRPyBVd+A2AcpH4=;
        fh=zuQOUbWQUeinWy3SevSlEUD3OkkQJQqGjdYAM/ksIbY=;
        b=oM/pMHNBpyUgAs89ldr5cd2MOz3sfBLc5/NIXTC4PXOC+1/cj/eJLPgscfYP6Qu7l9
         aQczc85bYgxHFgKXMa/xKusgnZAjduelgediPwQ7roTGtE0fXKPQGdHnrOAD6mdKgf3r
         Kvbu6Ijs+URna5LVyBp9gmqx09ZwG7mHm3LHUyVKnOaSDHCI8SzOn2AILPJV0JftQMsH
         4f22G+DEg0BsOFeIoRj0B/eqBkuvSElx3uoNTw81b8QyefJT4dqg1FKJFnfCEdWFfu5g
         5mI0/5Y6Kw7TCct5zzWCwKy+1WZ+8KIz7fDt3VeoFSoSPWMyC9jCQFxzs+I59DTK6ABa
         Xwdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790243763; x=1790848563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rM8Pnb3OaTJqlPgDl5Nu230H8PB3TRPyBVd+A2AcpH4=;
        b=JODW4//u3KjtFnoafHckYjbn/WXha6Zo9QUiqtgARpc7DjBG0mhE0WWH+hSp6QxsNm
         RfYVeBrlMNaoigggDW6bLYZkB/uWJilNXDFvbdrL36dL+fm5HmpCEUZ60jPpRQYZCPAw
         C/PM4Ypr9TRp0aRT/iAXkY+ck9MM5VKEqtGOKkZwp7Pe0cuc2nCPFuoFVFFfi7IGy3Kt
         k5Fv+L7nfpY1z6MkPu1vtql9PBXlqQ8A130evougp8/k8OVH0GzSToEOXITzEzSv0+0O
         hCpLEC4ltGH4PCVCEyb0S5OvP3NAzgIqZsERBJifrjKchVfuLn2YBZKdazPT5ztVnquF
         CRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243763; x=1790848563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rM8Pnb3OaTJqlPgDl5Nu230H8PB3TRPyBVd+A2AcpH4=;
        b=wOFfP90oE1EYqTobpmzRUfE4QtaUM8NrC/+DjkP127rya+CHiPazfWzNwan/gQ/TAr
         PvG/YSbXI6KB9KOaJPUzcao1uqK8sApLg6DCWgapNyy9mzzd39lTKCKw7kVT0cQj6W/L
         jJ4nMBXB0PXGBcEYs4gDKieAZQktpkgQhj6y8NgSOtX5q9OK2VLEcC4BddrIkU2oTHPA
         hxqvYr0PW+Gc6rMLUyy5p4adTvoIWtP+uwzjVYP2dL6n0sruAshBhIOg4Q3KKrvqeC3C
         Ige0dh/O1e66JjdbW+p8iKiBFFX4amd1lFVyjRrCA2sauSSJ7ibxNIB89vTP9rgUEPtq
         wKsg==
X-Forwarded-Encrypted: i=1; AKwUvBzSrqA1JPK1LXfIuZ04YmQw/uep00+bC9xI7MlC5KXbn7tNiVi5qrCiK0BQoPx2l122tokqH23iTtOsjPUYI7U=@vger.kernel.org
X-Gm-Message-State: AFuF++m2+27xOLyh1AJkAtPDC6r1fBzd0c4hxqclOTtvCiC8dRwy7P0T
	Hqy+RbnqsUEADuhJhh2QmuyJqtI7d8CJvvQkXFuL89g+wDjIDm4iECW+ZSvqqIsqHD7tKPJEu/m
	cFBkXxjDCDpU0sXJhPFnGkIIP8pmd7ZOwBDVIXlkk
X-Gm-Gg: AYBFou1Ze3T+zxIlhkl5daahHSYXjbVnarSPZkYUARbxn0q9Ru6zt/4/5yLyQ5JQpLl
	BhHvoSb/LEscI9iYdxYT2smZPWf73cEClquGwav3BtWkpd6PyutrxsQyNRbYR9pHgCxqOx7WPX6
	uhQYKM3T+L3Sj3myyhOLTe698S1a5jHfCn/+SSBaKHWiHKx3GkblgckxZFd+EdMVIHra97XJCRJ
	sX+6Q0iJYLzxoCFnK8kYCwibjs9x+T0ccOjL6dKt73eEZEbpqOyp7bmwHZpSmLMZmlh7jGcbMSR
	yyHhCZyk2t7a+mRScdyMvbztYPJNXRDnlCZSb1FFKgAg4lKOY5BOTreRu1hJ8wq14v8Ur9dW6B7
	NlOc7VuQGLRz0CYrFdFOTGGoxIbY0+YzkI6w84atR2/HMZso+fMn2+m2Dlt2LbIUxkEkV
X-Received: by 2002:a05:622a:5a0f:b0:532:8f15:2744 with SMTP id
 d75a77b69052e-532fea4d150mr14339051cf.20.1790243762050; Thu, 24 Sep 2026
 02:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924080219.1036588-1-caixinchen1@huawei.com>
 <CANn89iJVGmYwQerOixGurH6vw-GtvSAQq6u6zSNZoyZrcEx6Jw@mail.gmail.com> <d8c12b4e-4ff2-4c62-a40d-d67bb4680a0d@huawei.com>
In-Reply-To: <d8c12b4e-4ff2-4c62-a40d-d67bb4680a0d@huawei.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 24 Sep 2026 11:55:50 +0200
X-Gm-Features: AclHuK_LOWvzBhJczhAfbtW30YiVgV1gD1vN5_bi3qPOiAKB6UaaHqyDAfOb9kg
Message-ID: <CANn89iLA55e6evpx__7AUQF45uYAbUHxRtz4rVT=vsKpqBRWkA@mail.gmail.com>
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

On Thu, Sep 24, 2026 at 11:25=E2=80=AFAM Cai Xinchen <caixinchen1@huawei.co=
m> wrote:
>
> Hi,
>
> Thank you for the review.
>
> We found that sk_forward_alloc is a plain int updated by a non-atomic
> RMW (sk_forward_alloc_add(), where even the read side is not
> READ_ONCE), and its writers span three unrelated lock domains:
>
>    - socket lock, process context: SO_RESERVE_MEM and TX grants
>       (__sk_mem_schedule(), sk_forced_mem_schedule());
>
>    - receive-queue lock, softirq: UDP RX charges and the
>       udp_rmem_release() fold;
>
>    - no lock at all: sk_mem_charge()/sk_mem_uncharge() from
>       skb_set_owner_r() and skb destructors, and the sk_mem_reclaim()
>       fold itself.
>
> Any cross-domain pair loses an update.  A lost charge is still
> returned in full by the matching skb free, so it resurfaces as a
> phantom surplus in sk_forward_alloc, and the next fold hands it back
> to the memcg via __sk_mem_reduce_allocated() ->
> mem_cgroup_sk_uncharge() - an uncharge with no matching charge.
>
> We first tried to fix it with locks, and hit three walls:
>
>    - the socket lock cannot be used: its holders free skbs (e.g.
>       tcp_recvmsg()), and the destructor's sk_mem_uncharge() would
>       need to re-acquire it - recursion.  That is why these helpers
>       are lockless in the first place;
>
>    - a new per-socket spinlock serializes the RMWs but not the bug:
>       __sk_mem_schedule() publishes the grant before the memcg charge,
>       and the charge may sleep (GFP_KERNEL, memcg reclaim/OOM), so no
>       spinlock can cover both steps; a fold in that window can still
>       refund pages whose charge afterwards fails;
>
>    - such a lock would also sit on the per-packet charge/uncharge
>       paths, exactly the hot path the cacheline layout around
>       sk_forward_alloc was tuned to keep cheap.
>
> Are there any good solutions to solve this problem?

Perfect, you now gave us what we need.

UDP is broken, it should be easy to fix without breaking TCP.

I am surprised your LLM went to a completelly broken path.

sk_forward_alloc is never supposed to be updated locklessly across
multiple lock domains:

- For TCP, sk_forward_alloc is strictly serialized by the socket lock
  (lock_sock / bh_lock_sock). TCP does not use sock_rfree() as an skb
  destructor (sk_mem_uncharge() is called under the socket lock in
  tcp_eat_recv_skb() and sk_wmem_free_skb(), while TX destructors
  sock_wfree() / tcp_wfree() only touch sk_wmem_alloc).

- For UDP, sk_forward_alloc is serialized by sk->sk_receive_queue.lock
  (in __udp_enqueue_schedule_skb() and udp_rmem_release()).

Your reproducer and analysis point to two specific places that violate
these locking rules:

1. SO_RESERVE_MEM on UDP sockets:
   SO_RESERVE_MEM (commit 2bb2f5fb21b0, "net: add new socket option
   SO_RESERVE_MEM") was designed for TCP, where sk_forward_alloc is
   protected by lock_sock(sk) and sk_mem_reclaim() checks
   sk_unused_reserved_mem(sk).

   However, sock_reserve_memory() only checks sk_has_account(sk), which
   also matches UDP. UDP does not support SO_RESERVE_MEM:
   udp_rmem_release() does not check sk_unused_reserved_mem(sk) (so the
   first recv() reclaims the reserved pages from sk_forward_alloc), and
   setsockopt(SO_RESERVE_MEM) only holds lock_sock(sk) instead of
   sk->sk_receive_queue.lock, racing with __udp_enqueue_schedule_skb()
   and udp_rmem_release().

   We can fix this directly in sock_reserve_memory():
diff --git a/net/core/sock.c b/net/core/sock.c
index 1d5927cd49a1..763c2017d9ef 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1034,7 +1034,7 @@ static int sock_reserve_memory(struct sock *sk, int b=
ytes)
  bool charged;
  int pages;

- if (!mem_cgroup_sk_enabled(sk) || !sk_has_account(sk))
+ if (!mem_cgroup_sk_enabled(sk) || !sk_is_tcp(sk))
  return -EOPNOTSUPP;

2. BPF sockmap (net/core/skmsg.c):
   As you noted in the reproducer comments, sk_psock_skb_ingress() and
   sk_psock_skb_ingress_self() call sk_rmem_schedule() and
   skb_set_owner_r() (which installs sock_rfree() as skb->destructor)
   from sk_psock_backlog() or after dropping sk_receive_queue.lock in
   udp_read_skb(). Calling skb_set_owner_r() / sock_rfree() without the
   socket lock (or sk_receive_queue.lock for UDP) on protocols with
   sk_has_account(sk) is a bug in net/core/skmsg.c and should be fixed
   there.
