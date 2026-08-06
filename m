Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE73F1AD9;
	Thu,  6 Aug 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009616; cv=none; b=skfopT64K5HAaxYkFsz6SVKrqlCweqFaGuT0Ny6XmjTeN8q0qTA7d3fyYFP5+ypFvMvdtR0reGNyGUzS4DkAW/JqDNafUYKktUnr1auCkwDi8f7iQ0s7Fli/ZJzZWD91SKEzYfFtsE1CdR3yOywcHcIvdAparvP3nHnyIKHN+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009616; c=relaxed/simple;
	bh=WGjpApM1QS/+/4gE7zGSR2fGxkMnAOBbZ+dzB3diWFA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lqFzft8BjjqtuscZ3A6RyAAOYg/6L7E5tzhrBoMVOdeWlLWdQihj+Pvx3TdgLcc15ZGHcWL7qJ4ELgEhwpidaTUlAWvrLC93XA0hm0kOh6xaMc6q0gQNWCgc8YTJbiY+a4TBxod353iApkXmM1dVqz7IKJ2jDieaP87rOxIamPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=v+VzKLjK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TU1Q2fmD; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="v+VzKLjK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TU1Q2fmD"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.phl.internal (Postfix) with ESMTP id 64C81EC0181;
	Thu,  6 Aug 2026 05:46:51 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Thu, 06 Aug 2026 05:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1786009610;
	 x=1786096010; bh=3Cwml3kDGqwN88ArLgRyqqKml7+F2SCPibDeasxjiYw=; b=
	v+VzKLjKVOy22eBHGJXNBvrIr/zc3v5CLvuDAhSTSP77ZXbemoQj6+bpvsSWJWh6
	LmzXVmz2/nIgUtO2MgjFnMv4wY7362I9AOWBV5Hr8NhPyNTIFH+2aPfhmc5wu9XF
	hN678tMGLiR1YS5T+qQ67YptlH8OBdtD1hTHDsPq/NB3FjhHjrYQZDgYIArrzez4
	DI0unrVLLN1ogQf4IDfixtZAPAAOyiyU4t7ktOrkGpFFPSjW4V61XSS5B6fDRJOr
	JGEVzSZRdKuA3KLpixTpeo2I8uDQsvPjsm/IKjF5zVnPFtsm988mcY7Xrv1h4xC1
	/66QqjpU5fikKoN9MIuLVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786009610; x=
	1786096010; bh=3Cwml3kDGqwN88ArLgRyqqKml7+F2SCPibDeasxjiYw=; b=T
	U1Q2fmDLYXVFUMTuhZCafl5I3bGQ8uVso7Kk6P3Dr5xt4hBacKmPz/nJ1DOilgvH
	BfyKdDZcu+JZgEcJ5VwqlgSKF4WtVVjtnxSVcDxx5dmRgdBMZV6rmeDLDjc6QQl3
	xgvpxRaTRhezPh7lpEoaAhAoKWha/EQe6fGFPVwIxGBHOWzE+xPSBOdoEnj4Pphu
	cEE6c1JRlifnuEO81lk9V+nPrJuliJ69iXNqS61KcmAcQ5eAOyuUL8pl4eyvIG5L
	RVwvjRmDdgPKXH90ZQO2v+1pyx9/1Nb75OEdj1/HFPPJem0MjC8h/8WK40LyiM8L
	KhXK9OMXiH1A0REV5VTjQ==
X-ME-Sender: <xms:BVh0ajbpLpBvHs0m4DoABwM9jgQExhduzs9-PttP5tTw6hSUmDqrGw>
    <xme:BVh0atOj1jbTkSnZFQFBQ1Cn84KMqtaSbpPA3tOIn7vBBXyui6adObju1-jJRggL-
    X60KhLjl1D_8hg41JdtbW3uitmk4Wrvd0_k213_WV4lkQmKyYI9uc7s>
X-ME-Proxy-Cause: dmFkZTFg/vNmH/Q80/GJjeUrMBYJLwYbgipZTRdWmtBPfVXulLWEQqrlyyfTKliylbiUJH
    w93/c93TEioXIwS3GFJMQVzZs9jTO6CTXbhWrWOyr8bsLe7QU3FmaLJULLCrz0+LX6XTXm
    FtHBvA70lH8IqwJpi+EpC0Lu7uaZVTw8bbGBF+Wo1Ur5FF0mh2HYqXV9L+ABEiWKt0Ww4Z
    xwKJ7vM2e/DSNq1Oh63tak03vIQ8dwvsu0+MgIKO98RSP53GJbpSwENTnX2nkwiNDnfAFM
    t8QFfUwbAwA/nVSe5IzAVsry8MVWr/flj7XrJ+8v83AXNQ+agCYuTFzE23puZ7YzhCiKKF
    lP1Yx40JYauQE6/NhRblXjZRWuvTKW6KD24pIhneyjIqKvGKC97hBv4HIkw5INL3d67lmY
    u+45Uy8nCTzqnTlDIImPZJRIWC4mvOoNd8KwDCr/dCV3mBZm+7MFpBvLcAAJ3i3uFLi3Ou
    pbnH2JSoTYZVAISzBrJyaXHsHGY30BL4B4TLlcDvV5AxALOPAuODqMpN7lb4dTuZs12vFy
    yy+RmwR8Ca2oOuVzonxfZ9ueVBUw+LL2VCFnEg0OpLHTc5EiNd/fhs0qZ8ZqbpCtK4W3rh
    GXT71zshg8ei5VyF4qj75AnI6wNw0k+cnmdVplVzIEeW8faYipEl/T9+vzUg
X-ME-Proxy: <xmx:CFh0ajrqmHGpfnvUhLBNxgnmjW4QNQWQRclVEcWZ8VDazmJH82KqdQ>
    <xmx:CFh0aqBW5DpoQHSsC9085bTOp2FmTxoOvuzK7UsdTidXFBvNptT_yg>
    <xmx:CFh0akozSBdIZzjYGkoPhAHoLjGcOqq29VyU2QrCgBa0YnCx-IQ-ow>
    <xmx:CFh0alBnP8PzCtSQJIKXM4b78WrAhkoykvokhUbuk6f7ByoWrjbbIQ>
    <xmx:Clh0asnjvnrhLXHnUd5YY5OnQrciQXHauB70fo5d9nnnRVwF3YEEkDDI>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6D0542F81644; Thu,  6 Aug 2026 05:46:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 06 Aug 2026 12:45:52 +0300
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
Message-Id: <a2f88a4b-4105-40df-a46c-f1bc0f67af1f@app.fastmail.com>
In-Reply-To: <willemdebruijn.kernel.220b53c78c5f4@gmail.com>
References: <20260805205957.1652619-1-alice.kernel@fastmail.im>
 <willemdebruijn.kernel.220b53c78c5f4@gmail.com>
Subject: Re: [PATCH net-next 4/4] net: Fix UDP length overflow with PMTU discover and
 big MTU
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 6, 2026, at 06:26, Willem de Bruijn wrote:
> Alice Mikityanska wrote:
>> From: Alice Mikityanska <alice@isovalent.com>
>> 
>> This commit bounds cork->base.fragsize to IP(6)_MAX_MTU to avoid a
>> possible overflow of UDP length that triggers a WARN in
>> udp_set_len_short when setsockopt IP(V6)_MTU_DISCOVER is set to
>> IPV6_PMTUDISC_DO or IP(V6)_PMTUDISC_PROBE, and a large packet is sent
>> over a netdev with an unusually large MTU.
>> 
>> Steps to reproduce (included in the new selftest):
>> 
>> 1. Set device MTU bigger than IP6_MAX_MTU (or IP_MAX_MTU + 20).
>>    cork->base.fragsize will be set to that MTU in ip(6)_setup_cork.
>> 2. Set IP(V6)_MTU_DISCOVER to IP(V6)_PMTUDISC_PROBE or IPV6_PMTUDISC_DO.
>>    It lets maxnonfragsize be set to device MTU (cork->fragsize) in
>>    __ip(6)_append_data, rather than to IP(6)_MAX_MTU.
>> 3. Send 65528 bytes of payload (+8 bytes of UDP header, +20/40 bytes of
>>    IPv4/IPv6 header). Device MTU allows it (it's only one byte bigger
>>    than IP6_MAX_MTU or IP_MAX_MTU + IPv4 header, and the device MTU is
>>    bigger than that).
>> 4. The UDP length in the built packet is 65536, which overflows the
>>    16-bit length field and triggers the WARN in udp_set_len_short.
>
> This is discovered thanks to udp_set_len_short, but is this a
> preexisting bug and the fix go to net with a Fixes tag?

You're right, it's preexisting, it can go to net.

For the Fixes tag, I'm not sure about the first occurrence of this bug.
It could even be as old as 1470ddf7f8ce ("inet: Remove explicit write
references to sk/inet in ip_append_data"), but I can't compile this
kernel with modern tools and check myself, unless I bring up some VM
with an ancient distro from 2011. And I guess, it could be even older,
as corking existed before. At the same time, something else might have
prevented this bug back then.

If needed, I can try to do this archaeology.

>> Note: IP_PMTUDISC_DO with IPv4 is safe, because ip_dst_mtu_maybe_forward
>> always clamps at IP_MAX_MTU, unlike ip6_dst_mtu_maybe_forward.
>
> That was introduced in commit 14972cbd34ff ("net: lwtunnel: Handle
> fragmentation"), the message of which includes "This includes .. some
> mtu fixes" without elaborating on those.
>
> That introduced the same clamp in ip6_mtu. Which was removed in
> commit 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")

Looks like it could be by accident, it's a refactoring commit. The
similar change for IPv4 in commit ac6627a28dbf ("net: ipv4: Consolidate
ipv4_mtu and ip_dst_mtu_maybe_forward") preserves the clamp.

> Tangential to this fix, but maybe that should be reinstated. I don't
> immediately see why the two would diverge on this point.

I agree; even though the output case should be fixed by my patch, it
might still be relevant for forwarding. Let's see if Vadim has any
comment on the history of the above.

>> Reported-by: syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/netdev/6a6a966c.86abc875.e5c3d.0054.GAE@google.com/
>> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
>> Assisted-by: Claude:claude-sonnet-4.6
>> Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
>
> I only see this patch 4/4. Is there more that did not make it to the list?

Sorry, I sent it like this by accident, this is an only patch in this
submission.

>
>> ---
>>  net/ipv4/ip_output.c                         |  2 +
>>  net/ipv6/ip6_output.c                        |  2 +-
>>  tools/testing/selftests/net/Makefile         |  1 +
>>  tools/testing/selftests/net/cork_fragsize.py | 77 ++++++++++++++++++++
>>  4 files changed, 81 insertions(+), 1 deletion(-)
>>  create mode 100755 tools/testing/selftests/net/cork_fragsize.py
>> 
>> diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
>> index e6dd1e5b8c32..2bc997c4fa7b 100644
>> --- a/net/ipv4/ip_output.c
>> +++ b/net/ipv4/ip_output.c
>> @@ -1299,6 +1299,8 @@ static int ip_setup_cork(struct sock *sk, struct inet_cork *cork,
>>  
>>  	cork->fragsize = ip_sk_use_pmtu(sk) ?
>>  			 dst4_mtu(&rt->dst) : READ_ONCE(rt->dst.dev->mtu);
>> +	if (cork->fragsize > IP_MAX_MTU)
>> +		cork->fragsize = IP_MAX_MTU;
>>  
>>  	if (!inetdev_valid_mtu(cork->fragsize))
>>  		return -ENETUNREACH;
>> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
>> index 368e4fa3b43c..91c92cb8e529 100644
>> --- a/net/ipv6/ip6_output.c
>> +++ b/net/ipv6/ip6_output.c
>> @@ -1430,7 +1430,7 @@ static int ip6_setup_cork(struct sock *sk, struct inet_cork_full *cork,
>>  	if (frag_size && frag_size < mtu)
>>  		mtu = frag_size;
>>  
>> -	cork->base.fragsize = mtu;
>> +	cork->base.fragsize = min(mtu, IP6_MAX_MTU);
>>  	cork->base.gso_size = ipc6->gso_size;
>>  	cork->base.tx_flags = 0;
>>  	cork->base.mark = ipc6->sockc.mark;
>> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
>> index b43ddf192ecc..628203fda424 100644
>> --- a/tools/testing/selftests/net/Makefile
>> +++ b/tools/testing/selftests/net/Makefile
>> @@ -25,6 +25,7 @@ TEST_PROGS := \
>>  	cmsg_so_mark.sh \
>>  	cmsg_so_priority.sh \
>>  	cmsg_time.sh \
>> +	cork_fragsize.py \
>>  	double_udp_encap.sh \
>>  	drop_monitor_tests.sh \
>>  	ecmp_rehash.sh \
>> diff --git a/tools/testing/selftests/net/cork_fragsize.py b/tools/testing/selftests/net/cork_fragsize.py
>> new file mode 100755
>> index 000000000000..7a1bb069227a
>> --- /dev/null
>> +++ b/tools/testing/selftests/net/cork_fragsize.py
>> @@ -0,0 +1,77 @@
>> +#!/usr/bin/env python3
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +# Test possible UDP length overflow in udp_send_skb/udp_v6_send_skb.
>> +
>> +from lib.py import ksft_run, ksft_exit, ksft_true
>> +from lib.py import ip, NetNS, NetNSEnter
>> +import errno
>> +import socket
>> +import subprocess
>> +
>> +
>> +IP_MTU_DISCOVER = 10
>> +IP_PMTUDISC_PROBE = 3
>> +IPV6_MTU_DISCOVER = 23
>> +IPV6_PMTUDISC_DO = 2
>> +
>> +
>> +def check_dmesg_clean(func) -> bool:
>> +    dmesg = subprocess.Popen(['dmesg'], stdout=subprocess.PIPE)
>> +    result = subprocess.run(['grep', '-q', f'WARNING:.*{func}'], stdin=dmesg.stdout)
>> +    dmesg.wait()
>> +    return result.returncode != 0 and dmesg.returncode == 0
>> +
>> +
>> +def test_ipv6() -> None:
>> +    with NetNS() as ns:
>> +        ip('link add dummy type dummy', ns=ns)
>> +        ip('link set dummy mtu 65576', ns=ns)
>> +        ip('link set dummy up', ns=ns)
>> +        ip('-6 addr add fd00::1/64 dev dummy nodad', ns=ns)
>> +        ip('-6 neigh add fd00::2 lladdr 02:00:00:00:00:02 dev dummy nud permanent', ns=ns)
>> +
>> +        with NetNSEnter(ns):
>> +            with socket.socket(socket.AF_INET6, socket.SOCK_DGRAM) as fd:
>> +                fd.setsockopt(socket.IPPROTO_IPV6, IPV6_MTU_DISCOVER, IPV6_PMTUDISC_DO)
>> +                try:
>> +                    fd.sendto(b' ' * 65528, ('fd00::2', 1234))
>> +                except OSError as e:
>> +                    # Ignore EMSGSIZE: it happens on kernels with the fix.
>> +                    if e.errno != errno.EMSGSIZE:
>> +                        raise
>> +
>> +        ip('link del dummy', ns=ns)
>> +
>> +    ksft_true(check_dmesg_clean('udp_v6_send_skb'), 'WARNING detected in dmesg')
>> +
>> +
>> +def test_ipv4() -> None:
>> +    with NetNS() as ns:
>> +        ip('link add dummy type dummy', ns=ns)
>> +        ip('link set dummy mtu 65556', ns=ns)
>> +        ip('link set dummy up', ns=ns)
>> +        ip('addr add 10.0.0.1/24 dev dummy', ns=ns)
>> +        ip('neigh add 10.0.0.2 lladdr 02:00:00:00:00:02 dev dummy nud permanent', ns=ns)
>> +
>> +        with NetNSEnter(ns):
>> +            with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as fd:
>> +                fd.setsockopt(socket.IPPROTO_IP, IP_MTU_DISCOVER, IP_PMTUDISC_PROBE)
>> +                try:
>> +                    fd.sendto(b' ' * 65528, ('10.0.0.2', 1234))
>> +                except OSError as e:
>> +                    # Ignore EMSGSIZE: the check happens after the WARN is printed.
>> +                    if e.errno != errno.EMSGSIZE:
>> +                        raise
>> +
>> +        ip('link del dummy', ns=ns)
>> +
>> +    ksft_true(check_dmesg_clean('udp_send_skb'), 'WARNING detected in dmesg')
>> +
>> +
>> +if __name__ == "__main__":
>> +    ksft_run([
>> +        test_ipv6,
>> +        test_ipv4,
>> +    ])
>> +    ksft_exit()
>> -- 
>> 2.55.0
>>
