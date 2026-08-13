Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568FD42AF85;
	Thu, 13 Aug 2026 12:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622730; cv=none; b=lV+vldEbxehaZ93lAO5+WBDFJ2FNP09isXhz7RcojHXITJlE1WbefC325J3jZ2PO7zQlXA+0ONGIGXppm2yGQhvHbbj6j5Hbjv+UNSpsGQs/Hup3YNzRVf8dllIn8WFeXbhVM8hksBA9lxQLhHMPfB6O3xiO9SlfARyCd+tYsmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622730; c=relaxed/simple;
	bh=2J5Yz6RYUA0PIgXzaVDnH+9AaFH0mmDxGR5WtxNA2iI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=vA0ffIcEGLZcXtiYlFDOzsO22IeWusIT6WvjEfDRuLnE5Ltl2Tf+hLRe8GoMVJeadRHqM2JDDppIh3BbJ0vD3+ErzngiFDxzCuvY4Ia6NkJ/wY0hanMyWNOmM0DYvB65O2jtpXq5Hxry2HpPnZ9cKWQCSnCR3DuhvDGNsJDnU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=lk1rCDhW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LvKn0xNJ; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="lk1rCDhW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LvKn0xNJ"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.stl.internal (Postfix) with ESMTP id 061481D0011A;
	Thu, 13 Aug 2026 08:05:26 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Thu, 13 Aug 2026 08:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1786622726;
	 x=1786709126; bh=SJgajnndaI+dIuqJyf44vNpApc1V3qIagijVzs2M3gc=; b=
	lk1rCDhW7m+LsA5g+8JsUdJVW3om7Xs/AoPGgl2HXu4kawRlQEn7v/NJz1Jz9zCg
	ci2TbA4QPeUu4EsVNvEIKtL3dTCr/PN2N/z+RSPapFOqo0yNvCq+ONxDzSpHv37l
	D2bW+hhvgz6+xaccTPtmGoWsddhAPdjrIEneEqrg+60eoLfMhmww4epuG+2EDeAR
	c/fAvAXzM63HNUuxFJKq59mlgf/1oODuNGbW/VbdBy2uQ5IEwO7Ta8HlRH3LOklJ
	HP7pL0+2lYtEbj0XrrTZoWXpKOvl3za/KqngwUkPGcDG/OW6rKWB0BMZLhSx1ik1
	9GuyVj0skJmCo4dpafdT8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786622726; x=
	1786709126; bh=SJgajnndaI+dIuqJyf44vNpApc1V3qIagijVzs2M3gc=; b=L
	vKn0xNJmIPlMCpu1tDoWpHsMiAgsOMijhqdlGxrWToeIbVyFvN7ZoD91vsivzpQ7
	V1kbSNqqgxMRkabuaMI2wRyGxxEdHhUygaoyhkmSg//U2ecorHLU5rMsoESHb1gI
	EXGgDuZaBKkAkOg2hp5mvlCGmiQJU55YldBgViV81o9WCOq55OKkfKbfyZhox1GF
	F4lRZevtLrOEKGD4F9MZ+kVHgt9tHmEvo2A7cM9aBXoS4ZPqMj5R6qBJSUFfFnKg
	G4dvZ9w0h/fi0Av9eC1UI4MpXFRvrql1BQgDi5djSPNj15iPrFEfTz+K0TexYG+z
	Q7m6IVojJz86Udj4KE1lA==
X-ME-Sender: <xms:_7J9anK-mSj2g2X6RmifKr5vpnzYft1YLEgPLjXaUn_Uab02kGxi7w>
    <xme:_7J9al9WN7MmbjtDKov9R1GgLjDuX8enTKK7vWGb06AbVLhYKWuNtqCcc2JoTw7P8
    AfjyHM9-lsL3B4UNJBpRFpKJCUR373X5Bz95pXvG7iyTwCj8gEn_S3C>
X-ME-Proxy-Cause: dmFkZTFEUdM179vh1yiK2dEOKajY9HMBRC8fL4k9OVUWy9MlHvEA+NoPAQlsYJxMBjvvNg
    Ntw5BJyjI6yNDIJmQyT1uuzYR2fGF9r/npKbS+V9EL3hgZB6MFKd9oZnW8WQWRDEmT0kO8
    FgjOfAf4bByXhdTCm/qHts/LBOIUalYc/GTzSmxFW3OwOa+7w95/sl0UkjREBpV5z3pzSN
    jexBJSIJPa4Ax4xhXrmntNqntgsLrET1MTRnvZtUnhwTIN9UHhHocU5Tqgywfba6sWLOBK
    X37vq+J5nF5xd1niAEgiL/Zc19QMUpCQ/zM2YX4qmjJoYvDoX1/FBr81ObIDqVrNQYBxYy
    uvssfQAQvP5jB9PYHCeiPAXr1SiMlK0V+lKU+h5sHU7P6Y6sTt6lseodfCWWz849Lx3ZF/
    ODoMmEfLfO/9KsIYQqHY1Nw7VjnK6TiSnwjijvLjNN+umOfjrwtElRz4/cVTlII3ny4aMw
    1kJYqLfWhJKVHbxAJWGbsewHRly1MkRJo6xfh03HdKpDewGOXfTtb+XaHI6jg+ZnaVg4nK
    z9t59/zXYSNhxt6RozkCCS5kr5pmr7IKfa40OoRRhYaYJKtU+SN5v3mUA71cjL+AkNEVcv
    DAQuh1yUksy/lChecwEwOpn4m0DFFl5h6gIAgLbQacyKQTUyhok49fo0rU3Q
X-ME-Proxy: <xmx:ArN9arZtW1BWFEUivPC3hySroH1_kMInA1HDO9MjsN_klibkXmdOkw>
    <xmx:ArN9amy6J5QXGSkW47AVd7DNiJiRWDRgU4IMG0B7fKKGv8sPXuczMQ>
    <xmx:ArN9aib5sox8CpLq0F6YDfWlZhHwDHvB5h-6FNk0KAAewF1XgGbSjQ>
    <xmx:ArN9avxNSd7c6AGVDAkg2sv_9f39UA_yG241Qa8J40IOeVoxFse9xw>
    <xmx:BrN9arWkPVyj1JsNrkDxY2PAowD1Np23ur6-cPUPIXOtz7P_iZRRw-T->
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DA0872F81645; Thu, 13 Aug 2026 08:05:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 15:04:59 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Alice Mikityanska" <alice@isovalent.com>,
 syzbot <syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com>,
 vadim.fedorenko@linux.dev
Message-Id: <a2c7a01e-407a-4f8f-9056-ec3c99c82251@app.fastmail.com>
In-Reply-To: <willemdebruijn.kernel.1472260eb7745@gmail.com>
References: <20260805205957.1652619-1-alice.kernel@fastmail.im>
 <willemdebruijn.kernel.220b53c78c5f4@gmail.com>
 <a2f88a4b-4105-40df-a46c-f1bc0f67af1f@app.fastmail.com>
 <willemdebruijn.kernel.1472260eb7745@gmail.com>
Subject: Re: [PATCH net-next 4/4] net: Fix UDP length overflow with PMTU discover and
 big MTU
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 6, 2026, at 18:06, Willem de Bruijn wrote:
> Alice Mikityanska wrote:
>> On Thu, Aug 6, 2026, at 06:26, Willem de Bruijn wrote:
>> > Alice Mikityanska wrote:
>> >> From: Alice Mikityanska <alice@isovalent.com>
>> >> 
>> >> This commit bounds cork->base.fragsize to IP(6)_MAX_MTU to avoid a
>> >> possible overflow of UDP length that triggers a WARN in
>> >> udp_set_len_short when setsockopt IP(V6)_MTU_DISCOVER is set to
>> >> IPV6_PMTUDISC_DO or IP(V6)_PMTUDISC_PROBE, and a large packet is sent
>> >> over a netdev with an unusually large MTU.
>> >> 
>> >> Steps to reproduce (included in the new selftest):
>> >> 
>> >> 1. Set device MTU bigger than IP6_MAX_MTU (or IP_MAX_MTU + 20).
>> >>    cork->base.fragsize will be set to that MTU in ip(6)_setup_cork.
>> >> 2. Set IP(V6)_MTU_DISCOVER to IP(V6)_PMTUDISC_PROBE or IPV6_PMTUDISC_DO.
>> >>    It lets maxnonfragsize be set to device MTU (cork->fragsize) in
>> >>    __ip(6)_append_data, rather than to IP(6)_MAX_MTU.
>
> In __ip6_append_data I only see
>
>         if (ip6_sk_ignore_df(sk))
>                 maxnonfragsize = sizeof(struct ipv6hdr) + IPV6_MAXPLEN;
>         else
>                 maxnonfragsize = mtu;

That's right; ip6_sk_ignore_df is false in DO and PROBE modes, and mtu
comes from cork->fragsize above:

mtu = cork->gso_size ? IP6_MAX_MTU : cork->fragsize;

>> >> 3. Send 65528 bytes of payload (+8 bytes of UDP header, +20/40 bytes of
>> >>    IPv4/IPv6 header). Device MTU allows it (it's only one byte bigger
>> >>    than IP6_MAX_MTU or IP_MAX_MTU + IPv4 header, and the device MTU is
>> >>    bigger than that).
>> >> 4. The UDP length in the built packet is 65536, which overflows the
>> >>    16-bit length field and triggers the WARN in udp_set_len_short.
>> >
>> > This is discovered thanks to udp_set_len_short, but is this a
>> > preexisting bug and the fix go to net with a Fixes tag?
>> 
>> You're right, it's preexisting, it can go to net.
>> 
>> For the Fixes tag, I'm not sure about the first occurrence of this bug.
>> It could even be as old as 1470ddf7f8ce ("inet: Remove explicit write
>> references to sk/inet in ip_append_data"), but I can't compile this
>> kernel with modern tools and check myself, unless I bring up some VM
>> with an ancient distro from 2011. And I guess, it could be even older,
>> as corking existed before. At the same time, something else might have
>> prevented this bug back then.
>> 
>> If needed, I can try to do this archaeology.
>
> I also suspect that this has been present for a long time, given that
> your repro does not exercise anything particularly new.
>
> Definitely no need to try to reproduce on an ancient system. We can
> estimate the introduction based on code analysis.
>
> In practice, most important is that the Fixes correcty identifies all
> relevant active stable branches that could use the fix. If helpful, I
> can also take a look.

I found the first commit where it reproduces, will resubmit to
net shortly.

> Aside: I was not even aware that devices allow setting a device MTU
> beyond ETH_MAX_MTU. But loopback indeed has no dev->max_mtu and
> accepts up to INT32_MAX.

Yeah, at least dummy and loopback allow that. I agree it's unlikely to
happen in real-world environments, but syzbot still found it.

>> >> Note: IP_PMTUDISC_DO with IPv4 is safe, because ip_dst_mtu_maybe_forward
>> >> always clamps at IP_MAX_MTU, unlike ip6_dst_mtu_maybe_forward.
>> >
>> > That was introduced in commit 14972cbd34ff ("net: lwtunnel: Handle
>> > fragmentation"), the message of which includes "This includes .. some
>> > mtu fixes" without elaborating on those.
>> >
>> > That introduced the same clamp in ip6_mtu. Which was removed in
>> > commit 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
>> 
>> Looks like it could be by accident, it's a refactoring commit. The
>> similar change for IPv4 in commit ac6627a28dbf ("net: ipv4: Consolidate
>> ipv4_mtu and ip_dst_mtu_maybe_forward") preserves the clamp.
>> 
>> > Tangential to this fix, but maybe that should be reinstated. I don't
>> > immediately see why the two would diverge on this point.
>> 
>> I agree; even though the output case should be fixed by my patch, it
>> might still be relevant for forwarding. Let's see if Vadim has any
>> comment on the history of the above.
>> 
>> >> Reported-by: syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
>> >> Closes: https://lore.kernel.org/netdev/6a6a966c.86abc875.e5c3d.0054.GAE@google.com/
>> >> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
>> >> Assisted-by: Claude:claude-sonnet-4.6
>> >> Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
>> >
>> > I only see this patch 4/4. Is there more that did not make it to the list?
>> 
>> Sorry, I sent it like this by accident, this is an only patch in this
>> submission.
>
> That explains. No worries.
