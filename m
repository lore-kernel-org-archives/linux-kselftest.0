Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6862405C4B;
	Mon, 18 May 2026 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134905; cv=none; b=WWLJ9yAOdhzyH7gqLSlO+yhJYNtj3+Gecu33MjbzcQFmuJeVjBfNYyO6L5oxUpZk282m6iu5Gjocb1Km5VFBSJdRBxDY6B3q8/ULdCzMWGGV6yd9w2lfr4RWk2Grk8CWKrovx7aUDeKCKu8Xdrv8PeAkA2SqX6oklcK3WyTyvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134905; c=relaxed/simple;
	bh=LBjgJsXIGbZM5w2GUzxKJldAI723FEpT19Mr+HRKvuo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdoGrBmJE5kz9kOkgmvx9Vw5ICsoDlP0+HJxoL1rzCzm/X7BRH+MwNbMB4bu2Qzj8rlMsXH4uHc37Y7IEaie5oEsRyJEjEIvPkiQZMuJvshMDHar1SL4tM3KOPMqX2IoXICU0SO1Knx11wvAsFN2Lj5BimcSihqeTHIJ2ESYlGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlMoAUxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlMoAUxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0320CC2BCB7;
	Mon, 18 May 2026 20:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779134905;
	bh=LBjgJsXIGbZM5w2GUzxKJldAI723FEpT19Mr+HRKvuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FlMoAUxsm9astcIK0DyduY0a9NwBtvAIJe4VYHzcEhD59YJ30o1NUk/rzUgNBLKo0
	 APCRD4Fp7PSFol58ZHnBNqe4RAWdzxBmA0qzWgXWqYZGF5JIKwVvcYFM9SVuJVWQNO
	 afmm1BczCj8jcjOFQF6beYANagEg5vfjydDG3DHXsAYgvjwavglJ0flP4dOR8FvQmU
	 z/XRpvW8PoocZYqx5jpBaTEJg21tyQGRbQREM7Q0GszY4OjjFREBSf3xePoA25pGdw
	 0BTkqRUkfQMZKx1DODC9cnoWih9NACDkG1cBioAq430nSECAU19zH5C+MITULoURc8
	 k2hePFzGmfxUQ==
Date: Mon, 18 May 2026 13:08:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Neil Spring <ntspring@meta.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, dsahern@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/2] tcp: rehash onto different local ECMP
 path on retransmit timeout
Message-ID: <20260518130824.2fe952ea@kernel.org>
In-Reply-To: <20260517174522.2232057-1-ntspring@meta.com>
References: <20260517174522.2232057-1-ntspring@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 17 May 2026 10:45:20 -0700 Neil Spring wrote:
> Currently sk_rethink_txhash() re-rolls the socket's txhash on RTO,
> PLB, and spurious-retransmission events, but the new hash is not
> propagated into the IPv6 ECMP path selection logic.  The cached
> route is reused and fib6_select_path() is never re-invoked, so
> the connection stays on the same ECMP path.
> 
> This series adds the two missing pieces:
> 
> 1. __sk_dst_reset() alongside sk_rethink_txhash() so the cached dst
>    is invalidated and the next transmit triggers a fresh route lookup.
> 
> 2. fl6->mp_hash set from sk_txhash before each route lookup so
>    fib6_select_path() picks a path based on the (potentially re-rolled)
>    hash.  This is conditioned on fib_multipath_hash_policy == 0 (L3)
>    because policies 1-3 compute a deterministic hash from the flow
>    keys which must not be overridden.
> 
> Patch 1 is the kernel change; patch 2 adds selftests covering SYN
> rehash, SYN/ACK rehash, midstream RTO rehash, midstream ACK rehash
> (spurious retransmission), PLB rehash, a policy 1 negative test,
> a flowlabel leak regression test, and two dst rebuild consistency
> tests (normal and syncookie) verifying that natural route
> invalidation does not cause unintended path changes.

Still flakes:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net/results/652122/44-ecmp-rehash-sh/stdout

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-dbg/results/652122/34-ecmp-rehash-sh/stdout
-- 
pw-bot: cr
