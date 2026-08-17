Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13958367F31;
	Mon, 17 Aug 2026 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786991533; cv=none; b=XDrL+YZgwZkzPdYHyD2mXXFSheZDhIV2+0OBzrXx3UdQEIjnoG3vpOMWytR1nyilXLgBgi8FhZImpfVu3AkEPb/qkQQ7EA7rsvAyZ/RB0EBYz0QYGRWy+GK1HSM/pvJHoHxdwg3Gg7ZoLbd4XWM9X2AwuzMmFUkhdvedGlfn9Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786991533; c=relaxed/simple;
	bh=IMQoj6D0rq3BOpM1o/+JI6Ia1+TSg1Regq2JXU/YfJE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gklRl+dXDoF52P5pJRFls+K0gjeKAXM0GQ3/ptDJTmTD6UV3xz1VmlmA22ncsJMC7UqwUT+2jEbS9dI54gD6pknX4wamqnNOkRZkli5YueZ4FIrLKcCOsJcuuZFFfT4VUSDXiwG0oWCMy1LVy8bUXBYlZvql8e6T8oWypH+m78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=TWkM8RDE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yf71EQBd; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="TWkM8RDE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yf71EQBd"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.phl.internal (Postfix) with ESMTP id D3AA6EC0248;
	Mon, 17 Aug 2026 14:32:08 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Mon, 17 Aug 2026 14:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1786991528;
	 x=1787077928; bh=MtjU5bkpC2xyB4NSqIwD732uMo+jrlPz7qmzJaBHwfI=; b=
	TWkM8RDEnAOB5ERS3YPTYvN3+527scE8NHdz9/Gqql6NBjKxcjUUllXz0VaELuN0
	RJaccdcoH0EqlOZdIebpImrT01Hy1xWtdI5M7Qlj7J5unF4WPudI63tAtHRY5tzO
	UfwPlw19vZj6DiCzMsHYzJ1/Y1Ywv7HZBSPzIUJgpjRzjS42uSVqQfSJvqZiDJPq
	HPlh3f0bb1c78kirH5OpT8xKA4IBjaZTqlzhcYV8EHF7EVxAHSbW8CDii/8cbRqj
	YZzrKZEwhvJKBCu6Lb5TogMQ3CH4mErXPi9NyHzwGpHiqTuJroAKV8kfTY/1RJv6
	ajWl/IZY3z3Mmz8Gfh0pSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786991528; x=
	1787077928; bh=MtjU5bkpC2xyB4NSqIwD732uMo+jrlPz7qmzJaBHwfI=; b=Y
	f71EQBdi4hblB4jlYNZ7etDEasB62PozXW5wGa2A9A6Bd0yZ3es3kLdUOk9pifqs
	6d/Y9K9xTv3r1ySOSg5pjTKIi4ZWmejw1Lntq7KqHzTOxZte8bOtZ8sHFDxNwri/
	dyHkj+YV5w/Y1b/SY2ZFfuJ/wZMpGkqfIvDRhFr3dycuXp2jLA5MOvJ/JJBMVNmt
	CuRzT0B9TXHj5l18+nLMLfGtupcOQeuKEV8tKC/13RuQ0PteehXx5WP5S0C4XaCc
	Oeoa4JP/2qwKJfDrZrse+p7xAilmdoF8ltqG9mjb4zQYYsVs9h3MVevIruXyJtKd
	pLeBBCz3J5LVPzJIHwerg==
X-ME-Sender: <xms:oVODarXeIG3R5AqCctw1EIrafyONR5JvsuI4Xkqmyl5HIHaos53eVg>
    <xme:oVODauZEgB-0jpyVTx7elIzD5RLwiiGyOTtcZXkNe1cMi4VGeYoap8H4CsK6augSH
    IqfXiTxmidGJ0g99nOClLxTQdeJ8Spi4LSLMVvAYrnO63k6k_Za_O4>
X-ME-Proxy-Cause: dmFkZTFf9JxQWsrlrBcZ/VsRjqL/014Jjz4/GgDYIRriVccFpZUApplgFK+aS5yA2tVYY6
    uO50t1pxqByeS1+XZxLEfSJgK55dIY0SYuira19IU3wGaOM5u8JUFTNj2PU+o5F47dioJD
    ZWs2Slxzg6mKFxNQ3LAHYqyfo9eb0FePrTdKzv6KipLwc/2iucx86mBEXqcOo3LhzN+hqR
    /gMAY5IWoguq4noCAWI4OH3BIUTPdkHoeVtQ0lB7tlEPxyt10sc0crn2I+W//7TlZYaUh8
    nO3+ilYOEu90aByC2ZY/LRlgjaf+EqQBeq0+hcAuUO29oFSQ2hX9XYcB7rUOBm1VXTH8Di
    FD9RhPUePs91Lgf4m8x0zxtWI0cNd6XbbfBrERD31LDTAIT5oZc55RNHm2KufvZzP2PNQH
    47Qrc9Nk8SFkg6row+23kEdY3lNDkupxzcPuyPyXWNzVEeHxGM6rjflkuMxUU2Ux/v30aC
    Pc2ttHCK6mdWk5H3LOWac3Sw0/YXvZEo6Yarn05xzRMND/gnDDSlSIuTdT7nHsCV1nn1Oy
    zVSaMhrye4EqCyjaZH1wUo4l09P5W5bknwPM/LW8+qUUNyXomhlyFniX2EMHjc93cScDif
    z9tfLnASXOA/nos6jRqSGT+rKqAk668N6Mk3XWDZvsHJwGOxA1crndZORjoQ
X-ME-Proxy: <xmx:pFODal4AoGiRahA4nbhWZmtdiH5XJjjbMJqZddHivIdWZy4QjlEteg>
    <xmx:pFODajUPx1rJ4KPpa_CqBfqiXnwhzXlec9fggb95wsZbR8FrrncuGQ>
    <xmx:pFODasOHKtr-m_I2Es3Ap3K_h-i0mn_NYK_2XPDqNBKL2hWngNksQA>
    <xmx:pFODaqjParLk3eFOGynxXY3IT0MRT2XphMRJQnJQyK7BR-KOprk4Lg>
    <xmx:qFODalaGdBaoF79-5F440zJ9edfQZwLpBhrWp2Lq-pOei-OYt_uyR8i3>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1137F2F81643; Mon, 17 Aug 2026 14:32:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgiS_BE1KCRJ
Date: Mon, 17 Aug 2026 21:31:40 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>,
 "Hannes Frederic Sowa" <hannes@stressinduktion.org>,
 "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Alice Mikityanska" <alice@isovalent.com>,
 syzbot <syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com>
Message-Id: <b7fb448b-7b70-4c00-833a-de7f23a4888e@app.fastmail.com>
In-Reply-To: <willemdebruijn.kernel.f41e3c8f9a9e@gmail.com>
References: <20260813120351.2807829-1-alice.kernel@fastmail.im>
 <20260813120351.2807829-2-alice.kernel@fastmail.im>
 <willemdebruijn.kernel.f41e3c8f9a9e@gmail.com>
Subject: Re: [PATCH net v2 1/2] net: Fix UDP length overflow with PMTU discover and big
 MTU
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 13, 2026, at 23:11, Willem de Bruijn wrote:
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
>> 
>> Note: IP_PMTUDISC_DO with IPv4 is safe, because ip_dst_mtu_maybe_forward
>> always clamps at IP_MAX_MTU, unlike ip6_dst_mtu_maybe_forward.
>> 
>> The Fixes tag points at the first commit where I could reproduce the
>> overflow with IPv4 and IP_PMTUDISC_PROBE.
>> 
>> Fixes: daba287b299e ("ipv4: fix DO and PROBE pmtu mode regarding local fragmentation with UFO/CORK")
>> Reported-by: syzbot+ce13c07d96d04716eaa2@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/netdev/6a6a966c.86abc875.e5c3d.0054.GAE@google.com/
>> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
>> Assisted-by: Claude:claude-sonnet-4.6
>> Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
>
> Not sure whether IPv4 and IPv6 should be separate patches.
> IPv6 will have a different Fixes tag.
>
> Per maintainer-netdev.rst, mixing code and test changes in the same
> patch is also discouraged.
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
>
> if respinning: use min(), like IPv6? It's even more concise and easier to read.
>
>>  
>>  	if (!inetdev_valid_mtu(cork->fragsize))
>>  		return -ENETUNREACH;
>> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
>> index 2c44e5ed6171..81fb61b94759 100644
>> --- a/net/ipv6/ip6_output.c
>> +++ b/net/ipv6/ip6_output.c
>> @@ -1430,7 +1430,7 @@ static int ip6_setup_cork(struct sock *sk, struct inet_cork_full *cork,
>>  	if (frag_size && frag_size < mtu)
>>  		mtu = frag_size;
>>  
>> -	cork->base.fragsize = mtu;
>> +	cork->base.fragsize = min(mtu, IP6_MAX_MTU);
>
> Not sure whether a limitation that we seriously have to care about, but:
>
> This restricts all IPv6 protocols, while only UDP has the length field
> limitation.
>
> With IPv6 jumbo frames and RAW sockets, could there be a valid case
> for larger fragsize?

True; if a valid jumbo UDP (length=0, with IPv6 HBH exthdr) packet is
crafted manually with SOCK_RAW, it's dropped after my change. I'll
respin, limiting the clamp to UDP sockets only.

I'll also split IPv4/IPv6/selftest into separate patches, also adding a
selftest for SOCK_RAW.

>>  	cork->base.gso_size = ipc6->gso_size;
>>  	cork->base.tx_flags = 0;
>>  	cork->base.mark = ipc6->sockc.mark;
>> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
>> index 708d960ae07d..82a1407f6a69 100644
>> --- a/tools/testing/selftests/net/Makefile
>> +++ b/tools/testing/selftests/net/Makefile
>> @@ -24,6 +24,7 @@ TEST_PROGS := \
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
