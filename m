Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB032D2382;
	Sun, 27 Sep 2026 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790472683; cv=none; b=t2zYoyoucHBullm5UqbeUco2qfeGKsIvsjWTO4k9jqaGw8yTUK170LnuXtTqKbsZ4rkFq2wfGi2SIY1XNB6RG//AzHV88BieKA/WoTTWgm+FNMocgqdgJKZsRIPf8pi2K5L1spAADUQYLKoiXLlL7vGFyGjy0JmMaFgpwIcS/Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790472683; c=relaxed/simple;
	bh=cs3jzOufafMrMEWHJR0rsK9nFyyWq1jzDVg/QzyxIzQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bTWqI3WuuuZ54j9c1nbT4AOK9Q6HtST0L+8zDjB4PYiCgjp5PmMPbEt0qyUPbSuvTFplgKVcatrPRN4RbKJ6LhKfW5qJopbMyOt7SCKV3z6j2FsTaz5COJZmiptyNSa99QNIDruO8CzL5fABW112Sxm7R7Nej3cLoXl5yGu2jL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCHZsW3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCHZsW3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FF11F0089A;
	Sun, 27 Sep 2026 01:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790472681;
	bh=GfZdCX9dUYPXEj0Dzj5rxda9E4S7O74Ve4Vuk+4TmfE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DCHZsW3HLAs9S7BEAEz4Of96/rhZRyDVpyDi4o3K95ZtBCB6lLGqy01P6RUNOO75k
	 y2pcJuilzVE/23d+oji9pWSJ7kqD0A/pZd84Y8vKwFD69Ma53ABtJ4GGT8ujQDRFSv
	 2lKGvrUrcYbliIqtfCnrdCZky7o6WJxMB1Vxy/AJO1cgL73vduIoE/A8nrBy7RIkuk
	 oiDUcAuB/caDb9QINnUajHyQb86ad028RiPxeNzmK6WhHIbyTzESC4DDwswrIJ29A6
	 yp6NKgBCP1lclzmZFGfRQGb6AwbjyKMUsRPENlm8Tl5RCSFANz277uwu4/LPQNq5Rk
	 GTWCiC8s8qxAg==
Subject: Re: [PATCH net-next 3/4] net: psp: drop psp assoc clear in sk_clone()
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 willemdebruijn.kernel@gmail.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, kuniyu@google.com,
 willemb@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date: Sun, 27 Sep 2026 01:31:20 +0000
Message-ID: <179047268000.2160803.15522145958120061132@kernel.org>
In-Reply-To: <20260925-psp-defeat-v1-3-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-3-9f0b430107aa@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] sk_clone() in net/core/sock.c (line 2499) no longer clears the
  psp_assoc pointer that sock_copy() copies raw into the child.

--

net: psp: drop psp assoc clear in sk_clone()

This patch reverts the unconditional NULL init of newsk->psp_assoc in
sk_clone() that 1d2929d0850f added. It replaces the init with a debug-only
warning. The commit message says listeners can no longer hold PSP
association state, because of 8cc3aef0cb19 and the earlier patch in this
series that limits association setup to established sockets.

> diff --git a/net/core/sock.c b/net/core/sock.c
> index 2948dffcc3e1b..d7ddd365abebb 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -2496,7 +2496,7 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
>  	RCU_INIT_POINTER(newsk->sk_bpf_storage, NULL);
>  #endif
>  #if IS_ENABLED(CONFIG_INET_PSP)
> -	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
> +	DEBUG_NET_WARN_ON_ONCE(rcu_access_pointer(sk->psp_assoc));

[Severity: Low]
Would it be worth keeping the RCU_INIT_POINTER() next to the new warning?

I could not find a path in the tree at the end of this series that reaches
this state. So this is about defense in depth, not a live bug.

psp_assoc sits past sk_dontcopy_end, so sock_copy() copies it raw into
newsk. With CONFIG_DEBUG_NET=n, DEBUG_NET_WARN_ON_ONCE() becomes
BUILD_BUG_ON_INVALID() and generates no code. With CONFIG_DEBUG_NET=y it
warns but still leaves the copied pointer in newsk.

If a parent ever did hold an association, each child would share the
pointer without taking a reference. Each child's destructor would then drop
a reference it never took:

inet_sock_destruct()
  psp_sk_assoc_free()
    rcu_assign_pointer(sk->psp_assoc, NULL);
    psp_assoc_put(pas);

This is the refcount underflow and use-after-free of struct psp_assoc that
1d2929d0850f fixed.

That protection now depends on two invariants in other files:

  - psp_sock_assoc_set_rx() and psp_sock_assoc_set_tx() rejecting sockets
    that are not TCP_ESTABLISHED
  - inet_hash() rejecting a non-LISTEN unhashed_state, which blocks
    established -> tcp_disconnect() -> listen()

tcp_disconnect() still leaves sk->psp_assoc set. If either check is relaxed
later, or this patch is backported without them, could the use-after-free
come back with nothing catching it on production builds? The earlier patch
in the series says the established-only restriction "can be reintroduced
when there is a use case".

sk_clone() is a slow path, so keeping the unconditional clear next to the
warning should cost very little. For example:

	DEBUG_NET_WARN_ON_ONCE(rcu_access_pointer(sk->psp_assoc));
	RCU_INIT_POINTER(newsk->psp_assoc, NULL);

Wrapping the clear in if (DEBUG_NET_WARN_ON_ONCE(...)) would not work,
because BUILD_BUG_ON_INVALID() is a void expression when
CONFIG_DEBUG_NET=n.

>  #endif
>  
>  	/* SANITY */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925-psp-defeat-v1-0-9f0b430107aa%40gmail.com
