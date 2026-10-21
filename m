Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545645;
	b=PwAl2NEKVJVqMZrdIXaCGCPgCAwA+6eMZ81x/ysKxcWvkrUbo144wh72toNWMIZyQdBe
	 2LNxyeiGntla8aigp3vdX8o/sm+YSLdYCT/BG+CcpSTAZT8rdYx4HRuO/y4bcdW2FDMBM
	 Ss/GaFMbE2VfUPriGvd/i0WdSbm1JR0U61o+GVYnFmQ5t7NBBEAJFjiXIp5pOIcOdrhth
	 Jm2U1pAxiFpkwYN3jXYKNEg0mGH3Ea09Hgv6d1S4rnQAVCdHL88xebGO6o9wwAeU3orVu
	 A2q/1EcQncPpvilF8dALyfkt8F5ZnnociZID70c0YcRHeoBZc+03c1O4YYRPtymbrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545645;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y8K6h3c2W1891Dy16+/NGD/NBVfIeHRHvnejW7iH4m8=;
	b=va4w1hotv6BJKDmBHvnf3uodSbMtn11k9WdsiP8/UCuhIF4K6Xm4it95llsoniUiQizG
	 sAp3prdLySdFFf/BTGBp7yiseTuWX69r+/LdRLsRB8VYvP0qWo2tmtPAmJFqotrS1TSQm
	 5+gPBEJnjY8Wkz3rzvE4pKVB90MEXjCqYfu3jQ+mqCG8n12DS+7N9IvFpPhpXoxEcc493
	 yZDVBnFRjGck9oep9Pdl0VJT6IrB+DSmBZFHegvI3+61UHQK2EURmK99jC17+stB4Rtg9
	 nw2o9g1jPmZ42eHXFXrE2b561ABpJQUQXeITq4j9xtzb726IjciZEuIHLpoCnAH6y1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buzeQ591;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F24606A319;
	Wed, 21 Oct 2026 01:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buzeQ591
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B47A1F000C9;
	Wed, 21 Oct 2026 01:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792545644;
	bh=Y8K6h3c2W1891Dy16+/NGD/NBVfIeHRHvnejW7iH4m8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=buzeQ591Xxk1VSUAF/qr7f7EWTEuDqUpWdL3dAoG6uQqNcleiAk8ssBP0t+yOa5e7
	 hN5gKI0RI9Jpo1+ERNIliqwXeCwXFKKRfVaO6J9ox5Scc0vrGaGeLUByNJEGh8cD6H
	 8+Ckhpiaj/HFGvYvOOgqkeTlLvuTBbi+WAtdfh9Jq/F23TlCOdEe3xARfRLgA3AZ1T
	 y16Su+E4++NrJutP9WPQr9DAe9V4F5wKV7rW3iFjG2y8NiXs+hlX4jAwIpSXtDFG5N
	 PO+ytlPTEPAgJMLBKW0REfotttN3jSpIoky8g78z46IQF1286pdSGp4PRNxWqidf+b
	 /NPQpXiCEWtTA==
Date: Tue, 20 Oct 2026 18:20:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Octavian Purdila <tavip@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell
 <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, "David S .
 Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Wei Wang <weiwan@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
Message-ID: <20261020182043.4bad43c4@kernel.org>
In-Reply-To: <20261020163835.4076594-3-tavip@google.com>
References: <20261020163835.4076594-1-tavip@google.com>
	<20261020163835.4076594-3-tavip@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 16:38:35 +0000 Octavian Purdila wrote:
> Add a packetdrill test that drives sk->sk_forward_alloc negative via
> tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
> sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
> under TCP memory pressure fails with EAGAIN rather than returning a
> negative copy length from tcp_wmem_schedule() and failing with EFAULT.

This is failing in our CI, it doesn't need any packetdrill updates,
right?


Here's the AI report about the failure:

The new packetdrill test tcp_wmem_schedule_negative_fwd_alloc.pkt is
failing in our CI (both the regular and debug kernel configs, all three
address-family sub-tests: ipv4, ipv6, ipv4-mapped-ipv6):

  tcp_wmem_schedule_negative_fwd_alloc.pkt:105: runtime error in write call:
  Expected result -1 but got 3680 with errno 22 (Invalid argument)

Instead of the non-blocking write() failing with EAGAIN as the test
expects, it succeeds and returns 3680 bytes. The kernel log for the run
also shows the test's memory cgroup repeatedly entering the OOM-killer
path (try_charge_memcg() -> mem_cgroup_out_of_memory(), "Out of memory
and no killable processes...") from inside tcp_wmem_schedule(), rather
than the write() being throttled and returning -EAGAIN as intended.

This suggests the test's reproduction recipe (tcp_collapse() driving
sk_forward_alloc negative while sk_wmem_queued exceeds
sysctl_tcp_wmem[0]) isn't landing the socket in the TCP memory-pressure
path in our test environment, but instead in the memcg hard-limit/OOM
path, which the companion fix (clamping tcp_wmem_schedule()'s return
value) does not need to handle the same way.

Could you take a look at why the test's preconditions (buffer sizes,
cgroup memory limit, write() size) aren't reliably reproducing the
negative-forward-alloc + EAGAIN scenario in our VM environment? It's
possible the memory cgroup limit used by the test is too tight relative
to the data pushed through write(), causing it to hit the generic memcg
OOM path before/instead of the TCP memory-pressure check.
