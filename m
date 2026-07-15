Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E243911C9
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129189; cv=none; b=iXA0Hlx8+ghzZWilB37eFzI+cPhRN0mYOGgPYp6bLxbAG0pHxoDnyezsTLd+mvwIXtxH3LCQ7iVcHV9mqQev98A2614lV0HhSuUv8cLxadSL3hPbeFsuPk/v0Z5nqNEKUHCKyCOjeBo0ICZCzaovcSHid13+Td/QLlOsDLu8Xxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129189; c=relaxed/simple;
	bh=xdP0ArL5gj/ZOhu33xZ5Z3/r/9Z5XjyCI4qrp+oXj+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enNavelQYJQUbU6hEMKrAKzUpyNQR4poHFoWnMvEdPFqcFWgZ9VXbWxcLVvXOzNPxerUEzQvCqTO3Zz++4vq1SlaDYB5F7zDtHp4CFMw2WagmfcHclLEiWHOmfc8G46F+ssNuEW/kbPuZCKYGRZD6SInOroJgxKfFpA9L7qKEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Cz8q7zpC; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Cz8q7zpC"
Message-ID: <2dc3d52b-ce4a-411d-9c30-934318ee98b0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784129174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JP3A/Omv4EUP9yEwVlgSrlWoXSIU6lWPXQB91//sneg=;
	b=Cz8q7zpC2CodYaOysieqVFvzXPcAnNxIfrGexxAdrsqa96M6OI0KYGFogVk0n2UOiCk/vy
	RLYyw/zscwXB1QYUyY7IJbP0aBg7FRxoktlQog/ppxlyOnWX+XEYfiZ4NkL3faM1OUk/E4
	74MSrG88CZ1fN4SbRLZlk/fhpdcoTLA=
Date: Wed, 15 Jul 2026 23:25:51 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH net-next v2 1/2] tcp: Add
 net.ipv4.tcp_purge_receive_queue sysctl
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Neal Cardwell
 <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Ido Schimmel <idosch@nvidia.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ij@kernel.org>, Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
 Yung Chih Su <yuuchihsu@gmail.com>, Wyatt Feng
 <bronzed_45_vested@icloud.com>, Jason Xing <kerneljasonxing@gmail.com>,
 Lance Yang <lance.yang@linux.dev>, Jiayuan Chen <jiayuan.chen@linux.dev>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260715145328.54597-1-leon.hwang@linux.dev>
 <20260715145328.54597-2-leon.hwang@linux.dev>
 <CANn89iLyeAPNV2VHTM3w0-zpzjZNFy3aJDsVUERYyniLN4ub7A@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
Content-Language: en-US
In-Reply-To: <CANn89iLyeAPNV2VHTM3w0-zpzjZNFy3aJDsVUERYyniLN4ub7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2026/7/15 23:15, Eric Dumazet wrote:
> On Wed, Jul 15, 2026 at 4:54 PM Leon Hwang <leon.hwang@linux.dev> wrote:

[...]

>> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
>> index 61045a8886e4..4f1027173e95 100644
>> --- a/net/ipv4/tcp_input.c
>> +++ b/net/ipv4/tcp_input.c
>> @@ -4853,6 +4853,7 @@ void tcp_done_with_error(struct sock *sk, int err)
>>  /* When we get a reset we do this. */
>>  void tcp_reset(struct sock *sk, struct sk_buff *skb)
>>  {
>> +       const struct net *net = sock_net(sk);
>>         int err;
>>
>>         trace_tcp_receive_reset(sk);
>> @@ -4869,6 +4870,27 @@ void tcp_reset(struct sock *sk, struct sk_buff *skb)
>>                 err = ECONNREFUSED;
>>                 break;
>>         case TCP_CLOSE_WAIT:
>> +               /* RFC9293 3.10.7.4. Other States
>> +                *   Second, check the RST bit:
>> +                *     CLOSE-WAIT STATE
>> +                *
>> +                * If the RST bit is set, then any outstanding RECEIVEs and
>> +                * SEND should receive "reset" responses.  All segment queues
>> +                * should be flushed.  Users should also receive an unsolicited
>> +                * general "connection reset" signal.  Enter the CLOSED state,
>> +                * delete the TCB, and return.
>> +                *
>> +                * If net.ipv4.tcp_purge_receive_queue is enabled,
>> +                * sk_receive_queue will be flushed too.
>> +                */
>> +               if (unlikely(READ_ONCE(net->ipv4.sysctl_tcp_purge_receive_queue))) {
>> +                       struct tcp_sock *tp = tcp_sk(sk);
>> +
>> +                       skb_queue_purge(&sk->sk_receive_queue);
>> +                       WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
>> +                       WRITE_ONCE(tp->urg_data, 0);
>> +                       sk_set_peek_off(sk, -1);
>> +               }
>>                 err = EPIPE;
>>                 break;
>>         case TCP_CLOSE:
>> --
>> 2.55.0
>>
> 
> My thoughts are:
> 
> out_of_order_queue has been forgotten. skbs could be there and still
> 'block devmem'
> 
> WRITE_ONCE(tp->copied_seq, tp->rcv_nxt) is certainly wrong, because
> read() will return 0, instead of -1 (errno = EPIPE or ECONNRESET)
> So the application will not know a RST was received :/
> 
> I think that BSD and linux implementations have historically retained
> acknowledged,
> buffered receive data upon RST to allow applications to drain data
> already ACKed prior to the reset.
> 
> Adding a narrow sysctl specifically for CLOSE_WAIT creates
> inconsistent behavior across TCP states.


Got it. I won't pursue this sysctl approach in the future. Thanks for
the review.

Leon

