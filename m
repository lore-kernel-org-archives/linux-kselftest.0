Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264592;
	b=F4AMF9uKVhGYzhd0JA0blZZtIZiAt+C6ex5UrGFg9cDqt5jmkKEui7B5e0+zJPCHHuNN
	 qEglvlUnPjLJF0r6OPMS7i0UicKKn5V6uqGftwD30vhEN3YMxSZSxMkn3K62/03Idj5th
	 kG9EBb4iQm11+7SKEQ5yYWS38dz2BXfU+WI9y1n4wRSkccljlOA1NjFcu/XTIEVb3/lZ4
	 bTWe4N9wihpLfaaDJB4O8Og9X6PEdM20WOoByU+bbc6sZSdDrtPCZ1CLeRkeHeHPJR6ue
	 j9gO4DIzzV78RBtofWHjjLo3CEF5lLY8V7nwg46E+zrQ6cq+Yv0GyVw3BOnuI4HmhIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264592;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UFZCpBIooBFicB0DvgSTv3ZMKgKfwRuEH73crPEA3VQ=;
	b=d8eJpIM0jPUjfbL52c1plWo7mlz6Bnax+0gKDHtu+qfChoxer86nDtvdE0gWgunqJBHF
	 WodK85mANSrAjFj50FszKR4hEXiEf3/OBXi0+4W0CETy9BDX5R2Jvg6MLyp6BzGEAoxmJ
	 t13dWQvRjjam3PP+wRwx81ADgJKnIP+WHMaCbh13L8PE3JWSVBQgP7ODeJ750KUCBL9b5
	 RqRksR0sVlv+pW3LQb5BdmG40yL+ieDKGAuSnOBCqD8PMKQwGXkKAHGEjWnRJJ4h7Tzd4
	 AdspgFmR/gDUUvI0seZuGsy02GP4UigTcwjp+Hc9zdW/YnkA16s1DsKT+ppAZsHJ6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kEPeHiBc;
	arc=none smtp.remote-ip=95.215.58.154
Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43395606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43395606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kEPeHiBc
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MaoRXuZQ6JtSp1A0fSU4PHAxq4HR0lMZe1iC1l2Gt+U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793264589; v=1; x=1793869389;
 b=kEPeHiBcFJ6MqLDvdk679musMJlanpqMTGX3dcejyW4Vsb3Stn63Pm1k3TIxv7ZLbNC1JnXd
 ABg0A/JtwajvqXjc2lo1tfdg3wyYzmi/u6sVEaxrwmPaqkny4qi0Vuw6lSQd3dYv2PG42it8dUl
 O02+X887Y2BXcEFXc9guNpSA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 62a73de914bba6f0;
	Thu, 29 Oct 2026 09:03:09 +0000
X-Mizu-Trace-ID: 62a73de914bba6f0
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 17:02:50 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH 0/3] net: ioam6: makes IOAM insertion transparent to IPv6
 ECMP
Message-ID: <auMLuvAuQZoOfAyc@fedora>
References: <20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0@kylinos.cn>
 <auGryXdPv2mx0qlp@fedora>
 <20261028165812.1b40d1d4@kernel.org>
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
In-Reply-To: <20261028165812.1b40d1d4@kernel.org>

Hi Jakub,
On Wed, Oct 28, 2026 at 04:58:12PM -0700, Jakub Kicinski wrote:
> On Wed, 28 Oct 2026 16:01:13 +0800 Hangbin Liu wrote:
> > On Wed, Oct 28, 2026 at 01:45:28PM +0800, Hangbin Liu wrote:
> > > This series makes IOAM insertion transparent to IPv6 ECMP, as required
> > > by RFC 9486 (C2): a packet carrying IOAM options must be forwarded
> > > along the same path as the identical packet without them.  
> > 
> > Sorry, forgot to add target repo "net". I will add it in next version.
> 
> CI bot says:
> 
> The new selftest added alongside this series (tools/testing/selftests/net/ioam6_ecmp.sh)
> is failing in our CI on the "Transit input ECMP with/without IOAM" scenario:
> 
>   TEST: Transit input ECMP with/without IOAM (diverged on seed 1: without IOAM via
>         link A, with IOAM via link B)   [FAIL]
>   TEST: Transit input ECMP with/without IOAM (seed 2..12)                [ OK ]
>   TEST: Encapsulating node re-lookup ECMP with/without IOAM (seed 1..12) [ OK ]
> 
> 11 of the 12 "transit input" seeds pass, and the whole "encapsulating node re-lookup"
> scenario passes on all seeds, so this looks like an edge case in the Hop-by-Hop
> nexthdr-recovery logic used for the policy-0 multipath hash, rather than a test
> infra/flake issue. Could you take a look at whether the recovered "virtual" nexthdr
> (or the padding/option-length walk used to compute it) is correct for all IOAM option
> layouts/trace sizes, since one specific packet still ends up hashed to a different ECMP
> sibling than the equivalent packet without IOAM?

OK, after running the test 50 times on a debug kernel and over 70 times on a
normal kernel, I've finally reproduced the issue and identified the root cause.

The reason is the ping `-w` parameter. I originally thought it set the maximum
wait time, but it actually keeps sending packets regardless of how many packets
have been sent or received. Combined with `-i 0.2`, it sometimes sends 10 packets,
which carry over into the seed 1 test and affect the result.

That's why the debug kernel case worked and the normal kernel failed in Jakub's
environment, while it always passed in my laptop test environment.

After removing the "-W 1 -w 2" parameters, I ran the test 200 times and all
passed. I will post the fix in the next version.

TL;DR
--------------------

Here are my testing steps. After reproducing the issue, I dumped the tc output
and found 10 extra ICMPv6 echo requests.

filter protocol ipv6 pref 1 flower chain 0
filter protocol ipv6 pref 1 flower chain 0 handle 0x1
  eth_type ipv6
  ip_proto icmpv6
  src_ip 2001:db8:1::2
  icmp_type 128
  skip_hw
  not_in_hw
        action order 1: gact action pass
         random type none pass val 0
         index 1 ref 1 bind 1 installed 0 sec
        Action statistics:
        Sent 1040 bytes 10 pkt (dropped 0, overlimits 0 requeues 0)
        backlog 0b 0p requeues 0

on gamma veth0 at the start of seed 1 testing, but *a0* is 0. This means some
echo requests are still in flight during this window. I then captured traffic
with tcpdump and confirmed those echo requests are present on gamma veth0:

15:47:09.161066 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 1, length 64
15:47:09.161083 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 2, length 64
15:47:09.161086 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 3, length 64
15:47:09.161088 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 4, length 64
15:47:09.161091 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 5, length 64
15:47:09.161093 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 6, length 64
15:47:09.161095 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 7, length 64
15:47:09.161097 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 8, length 64
15:47:09.161100 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 9, length 64
15:47:09.161102 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3254, seq 10, length 64

The question is: where do these 10 packets come from, and why are they sent
within this narrow window?

We expect only 3 echo requests during the ECMP link warm-up, which does not
match the tcpdump capture. The timestamps, however, show the traffic starts
during the warm-up phase. The subsequent echo requests on veth1 are correctly
sent as 3 packets with a 0.2s interval.

15:47:09.221513 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3284, seq 1, length 64
15:47:09.426247 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3284, seq 2, length 64
15:47:09.633125 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3284, seq 3, length 64

It looks like the skbs were held in the unresolved neighbour queue and flushed
after receiving the NA, causing the packets to be delivered to gamma ingress later.

Then I tried to send 1 packet on before the warm up.
ip netns exec "$ns_alpha" ping -6 -q -c 1 -i 0.2 -W 1 -w 2 2001:db8:2:1::2  &> /dev/null

Now the packet shows

16:05:20.744986 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 1, length 64
16:05:20.744987 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 2, length 64
16:05:20.744988 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 3, length 64
16:05:20.744988 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 4, length 64
16:05:20.744989 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 5, length 64
16:05:20.744990 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 6, length 64
16:05:20.744990 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 7, length 64
16:05:20.744991 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 8, length 64
16:05:20.744992 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 9, length 64
16:05:20.744992 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3765, seq 10, length 64
16:05:20.744992 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3774, seq 1, length 64
16:05:20.936373 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3774, seq 2, length 64
16:05:21.137153 IP6 2001:db8:1::2 > 2001:db8:2:1::2: ICMP6, echo request, id 3774, seq 3, length 64

The warm-up packets are correctly back to 3 with a 0.2s interval. However, the
first `-c 1` ping still generates 10 packets. With set -x, it shows

+ ip netns exec ns_alpha-nBg602 ping -6 -q -c 1 -i 0.2 -W 1 -w 2 2001:db8:2:1::2
PING 2001:db8:2:1::2 (2001:db8:2:1::2) 56 data bytes

--- 2001:db8:2:1::2 ping statistics ---
10 packets transmitted, 0 received, 100% packet loss, time 1865ms

After checking, I finally got the answer:

-w deadline: Specify a timeout, in seconds, before ping exits regardless of
how many packets have been sent or received.

When `-w` is used, the `-c` packet count no longer acts as a hard limit. Ping
keeps sending packets until either the expected number of replies are received
or the timeout expires. In our case, the timeout was hit. All 10 packets
(sent at a 0.2s interval within the 2s window) got deferred and surfaced
during the seed 1 test, corrupting the result.

Thanks
Hangbin
