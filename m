Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A83AA1BB
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705273; cv=none; b=PeNO3uQGX927A8B8Pr7pZP0dgJByMRluar3FadNTprs4xFskLYawpNEL+TCy57AzenCu9R47mfo8rIPMDTLV4N7c8FliFT56aFm1arSV+d56wciGcCke7LpxC10wY3cRj/LWOGmEoNLhhBUEtAkUzjq5ZiUUUbutCCxZZYcgwng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705273; c=relaxed/simple;
	bh=HgVChyUTOcyzNCJwiIdYVGsxrb9H5tsBkHG9/o032Ug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VQfnfE9qIVMvjD9N5h+O5wOFnx2aJ+mKBkVtOOIQ9pMIvoZhEjpEHzRJYVBln3Em7WN3xw/V73D9OisAQ+FplDE5JYhg0mNvHDVxqrDF/hzoL3M788B20Kk33fgVErbWcm+zi/J8QefAkDzXl0ZkNaWYRzH2n9H80PJ1eLVwx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rFF1wZq+; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rFF1wZq+"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so724364a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 21:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789705271; x=1790310071; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUGgKz+5IFwH2YryveMVo1XtdCg84f8FM+ky5NHRSuI=;
        b=rFF1wZq+KDghNBSpohUmaU7OByFEy8a67nK+0lVUXTjHsJPX60nvuog6AUa0uhohnQ
         D5Uv/LA6nWkd+TlxDGYUY5qE6fJZJt7wn3KBNASREAXdyouNfA6QkSZX8+dGUVk5iPlr
         U9IU3SKuDyQAwt83Ai4+KnNTKPNutcG9lUxBGDYKurTyNEt3yyLVm8a6u7XFU/uhkdfD
         N9mH9HYwcmYddokx4+HNnfc71MQWxlq5HjLeJsCNbYFVYhiXkaUBNIaUX9JGVkuMXCs5
         0gjWJhdYzNhoFLMYg6ypW0k6ppz41B3ky6DdXu1jcKzlecxu3CjmFhWsCYMVErbMhH8v
         2QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705271; x=1790310071;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUGgKz+5IFwH2YryveMVo1XtdCg84f8FM+ky5NHRSuI=;
        b=rB5QCNaIKRuUapuEZct8ulkqEVckq9bZFTWFLPMoIM8qva+NE8Lpi2pdeJfMvFfkkf
         m+PbQkGzbl6qqkLglolcOxOeZS26/rMFzPXllCsQLVNsk40NmlggtdJ9F1/aFPJe7Td3
         yQAOmTo+w8ph1lUKWUbzSvQyy6DtN1NmPBxRcfwVjRl+FkhdJ7nfeh/GQnhqN6IOxyB7
         J2FAiTZShF1Z/fGaz25l0qadVomaognPosfwGCMzD1wyp0Eo8y6PwqhC0R4IqjzXoO1z
         oVmFYPQOCrPNIIPPgeBEHb/ugl6T3lmHl98aQGt3UQstVEik1KgtNwy3bB1qB5DTyrGS
         mQdw==
X-Forwarded-Encrypted: i=1; AKwUvBzI3cCbaLcXI/tnACurnBTyOh6t6HxvseRS2reh9fze4afjtszu0+8dvGhEOwPS9I/fv6pa3c888gz46ljsu9M=@vger.kernel.org
X-Gm-Message-State: AFuF++kDO4wI/7/o1RL5FGHpXqXxNciz6ieuE/HKUxV2CVtQnWQOtUym
	CFd98htnjN4xUqjtq9WdTA1Ngzjvy5yvY07FQ4fd8xO04El/9b29kIfK68W1uQHfPFFTjGMNJxc
	tRGhXaA==
X-Received: from pjut11.prod.google.com ([2002:a17:90a:d50b:b0:39b:7adc:45e1])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d410:b0:39d:f024:c7e2
 with SMTP id 98e67ed59e1d1-39e54cb099bmr2855960a91.4.1789705271176; Thu, 17
 Sep 2026 21:21:11 -0700 (PDT)
Date: Fri, 18 Sep 2026 04:19:34 +0000
In-Reply-To: <aqyIEE5bRoxRyrFZ@20HS2G4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aqyIEE5bRoxRyrFZ@20HS2G4>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918042110.2581679-1-kuniyu@google.com>
Subject: Re: [PATCH net-next v3 0/3] net: hash uncached route lists by device
From: Kuniyuki Iwashima <kuniyu@google.com>
To: carges@cloudflare.com
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, idosch@nvidia.com, kernel-team@cloudflare.com, 
	kuba@kernel.org, kuniyu@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Chris Arges <carges@cloudflare.com>
Date: Thu, 17 Sep 2026 19:38:40 -0500
> On 2026-09-17 22:10:22, Kuniyuki Iwashima wrote:
> > From: Chris J Arges <carges@cloudflare.com>
> > Date: Thu, 17 Sep 2026 14:38:21 -0500
> > > We have observed hung tasks blocked on rtnl_mutex while network namespaces
> > > were being removed. The namespaces contained many network devices, and the
> > > host had accumulated a large population of entries on the global per-CPU
> > > uncached route lists. A perf profile collected during one incident
> > > attributed most of the cleanup worker's samples to rt_flush_dev():
> > > 
> > > ```
> > > 99.92% kworker/u384:3-  worker_thread
> > >   `-88.71% process_one_work
> > >       `-81.02% cleanup_net
> > >           `-81.00% unregister_netdevice_many_notify
> > >               `-79.42% notifier_call_chain
> > >                   `-78.05% fib_netdev_event
> > >                       `-77.92% rt_flush_dev
> > > ```
> > > 
> > > For each device, rt_flush_dev() visits every possible CPU and scans the
> > > global uncached route population while its caller holds rtnl_mutex. If N is
> > > the number of devices, C the number of possible CPUs, and R the number of
> > > uncached routes, the cost is O(N * (C + R)).
> > > 
> > > During namespace cleanup, other processes that issue RTNETLINK operations
> > > requiring the RTNL lock can stall until cleanup releases the lock.
> > > 
> > > A minimal reproducer is available here:
> > > https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-storm
> > > 
> > > This series replaces each per-CPU uncached route list with a hash table
> > > using the network device as its key. Each table uses 64 buckets.
> > 
> > This sounds a bit overkill.  Also, this series still leaves
> > O(N * C) loops.
> > 
> > Given unregistering a single device is less common than
> > destroying netns, I think the right approach should be to
> > make the route flush once in cleanup_net() + outside RTNL.
> > 
> > Could you try this change ? (only compile-tested)
> > 
> Excellent, I'll test this and report back.

I found a pre-existing issue, which affects the previous
diff, so on top of it, please apply this patch

  https://lore.kernel.org/netdev/20260918041439.2575935-1-kuniyu@google.com/T/#u

and this diff :

---8<---
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d35b66b33bbc..c12e20e07749 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -1567,12 +1567,13 @@ void rt_add_uncached_list(struct rtable *rt)
 {
 	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
 
+	rt->dst.rt_uncached_list = ul;
+
 	spin_lock_bh(&ul->lock);
 
 	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
 		rt_replace_uncached_list(rt);
 	} else {
-		rt->dst.rt_uncached_list = ul;
 		list_add_tail(&rt->dst.rt_uncached, &ul->head);
 	}
 
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 6cffe8440b44..f22793abbbb8 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -155,12 +155,13 @@ void rt6_uncached_list_add(struct rt6_info *rt)
 {
 	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
 
+	rt->dst.rt_uncached_list = ul;
+
 	spin_lock_bh(&ul->lock);
 
 	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
 		rt6_uncached_list_replace(rt);
 	} else {
-		rt->dst.rt_uncached_list = ul;
 		list_add_tail(&rt->dst.rt_uncached, &ul->head);
 	}
 
---8<---

Thanks !
