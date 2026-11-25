Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634532;
	b=f0BvkBYFzM1FQBoZ5np7XHAkGuscy2EG7NT8U7Rs/dHU4l/dXyfBk7wFw2PF6Bf3N04p
	 yUIcij650SJORoszn9ZMzmye4E7g03fNW59hctppgp4kMuBD4B4cJ7LtMpLSRlja66kK1
	 BlhBszbKs5mdSr4LlEn0MpgNOP7qNFyFDHKyvykHduaVl5iOYRD6MvCZV7WckhpzyIbLr
	 +BOdKAtTvT7KrV43si4a7YCn0Pq1etr/9wLvLVKLwhrZZSX46BsjYGfci+wWaEgUAabN0
	 hmu/W8+ljsTJ8VL5kySdBcbaAUceQSVU2b2JjFcqC2R1TAIQL2l7D+NP0PhjGk71h1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634532;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=geUaQFRpqPAuDO4Vr6fh2zVBoMc3z8A44xPshriAfj4=;
	b=Ryxm5BaTy+5JVX/WIPTD+I8zpKVtNkAPHxenS9+N2UXjhw0FiD2E3mnXpE6Dc54yboa6
	 ZxN80+EMA8/XgC8tzNo0TbXYkIJqst3YYkm1mnQAVNVbWo6sjKjAF8kFS0/0POGJzB6nt
	 /eTXwyk6cm4cR7JmMt4dAmVB0CJa4ichccC7MgBtzeD9C+6dAlt9qQ9bWMu6DTLewFV65
	 narXf0YYmx5lIULmq+ux6GzobFjT9JmhjR56UmOD4q7Xq3jM1RTF7RWyElDVauSOOaLEC
	 gkk9hqgPlnoncEjcI5wbbb2mOp4IHiqRcos5I6VpKh4sr6PX/z1Bw59TheWTHANuLvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRyyqXV9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAD5606A31E;
	Wed, 25 Nov 2026 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRyyqXV9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D922B1F000CA;
	Wed, 25 Nov 2026 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795634532;
	bh=geUaQFRpqPAuDO4Vr6fh2zVBoMc3z8A44xPshriAfj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YRyyqXV9x9Xvg7+8xhsWMCN0aGHyznSxnBWJEB0LV9hpi15+oNNwLh6J3wLn6k7lG
	 AssHp+XUi+A0IBv25B4p9QHhxkkiF1lpnkaqyv6guVndevsowOqAvYFWYkUzgdDQTI
	 4mLln5QoPUqQ/ki9zpLs/d/IkO+Re/ulny8RVQCxpLCkJDE1Pc/lLRjmWVxoY8rPqB
	 aSBQYjhThQJ9ZkQN3InUDJib/ok0BU094ilaFSqxXFg3f2PqL+fnCk+n4mhEjidSP/
	 N2eyOSSpswQ2OiY75+iCoMnNtJV0Q63E8UjfF0iF8VzvuU+jNAl4OALAAK46OY88+T
	 BsGDrZdeYRX+w==
Message-ID: <d370321b-adbf-4d03-8dec-6644f191fe52@kernel.org>
Date: Wed, 25 Nov 2026 12:22:10 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/11] ipv6: validate cached dsts against the
 netns route generation
Content-Language: en-US
To: Ralf Lici <ralf@mandelbit.com>, David Ahern <dahern@nvidia.com>
Cc: netdev@vger.kernel.org, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20261125003554.54371-1-dahern@nvidia.com>
 <20261125080341.57521-1-ralf@mandelbit.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261125080341.57521-1-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 1:03 AM, Ralf Lici wrote:
> I'm not sure what happened here but it seems like you've sent this
> series with envelope sender dahern@KCJPDQ2QL4.localdomain. My server
> took it with a spam score of 12.9; lore says the message-ids are
> unknown, and patchwork doesn't have it (vger very likely rejected it).
> So, only the people on Cc have it, and patch 02/11 never reached even my
> mailbox.

sigh. botched attempt from the corporate laptop. will send the next
version from personal laptop. thanks for the heads up.

> 
> On Tue, 24 Nov 2026 17:35:39 -0700, David Ahern <dahern@nvidia.com> wrote:
>>    rebound under the global fnhe_lock (rt_bind_exception()). Narrowing
>>    the invalidation back to subtrees would bring back the cookie race
>>    the series removes. If the exception refresh shows up under churn, a
> 
> That's not the case: my v5 [1] keeps the per-node scope and closes the
> race by sampling the node's serial during the lookup. Invalidating the
> whole netns is a matter of preference, not a requirement.

That comment describes how IPv4 works. Your series is for IPv6; not sure
what you mean with your comment.

> 
> [1] https://lore.kernel.org/netdev/cover.1795537128.git.ralf@mandelbit.com/
> 
>> David Ahern (11):
>>   ipv6: allocate the exception entry before removing the one it replaces
>>   ipv6: keep a superseded pcpu dst working until its holders notice
>>   ipv6: don't insert a PMTU exception whose MTU could not be stored
>>   ipv6: invalidate the failing dst in ip6_link_failure()
>>   ipv6: tell route dumps about exception inserts with a table sequence
>>   ipv6: validate dsts against the netns route generation
>>   ipv6: make rt_genid_bump_ipv6() a plain counter increment
>>   nexthop: factor out nh_has_f6i()
>>   nexthop: bump the IPv6 route generation on group changes
>>   ipv6: stamp dsts with the generation sampled before the FIB lookup
>>   selftests: net: pmtu: check that a deleted cached exception stays
>>     deleted
>>
> 
> When you resend, please add Reported-by tags where the series fixes
> issues I reported in this thread: the reuse of a rebuilt pcpu dst
> (10/11), stale exceptions treated as misses (6/11), superseded pcpu dsts
> released with dst_dev_put (2/11) and, if the series addresses it, the
> bundle-child release.
> 

Done.
