Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE22F83A2;
	Wed, 15 Jul 2026 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130558; cv=none; b=qDt8FynjI8zuNQkctA3+TVyQI5GJeNMoVJ3nqz+J6uS2wJJ2jxg+EigE2VPDzM2YXqWaQdgmS8SAUIf+Ss1s49/a1TrTDSXrlis9YLEoB/WViMppx5oxR643/zxha34PEPxnYoAiOBRbYAzM2QWy+sMTPZcUZm7q+z7yr47txzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130558; c=relaxed/simple;
	bh=X1lP/qJIF8wK6EXQw+eKpQli9GiZLIefKBuzHDkLCjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fx9RvSu7Qfa5HgX72p5x3EDZ2yFQltSiiqVLZNZHwsvWuFMw9FH5PLLN5ocs442nN2QduyVhGloHqXoiK2uA4NW8pzy/hpQKvQqE0f47QZyALZhyzJJgShZe7BeIxjYOLZg694sqc1fCcFuFe3fJoRN4b2oVbXQY6dN+H0JsSM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KSPYelD3; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KSPYelD3"
Message-ID: <ac02ba8b-21c8-4fd3-883c-7a7efb921a76@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784130544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k97CRl2ZK+5SRM7BRGAjzePVGPFf02NA0p6ZKkVpa0g=;
	b=KSPYelD3xouK73HeqlIiy6vmGvgGruUXIaR8kiG7srwPiWqMF4P1HfrRRUt0yocouRsLfJ
	OI8/74EBW3qIyDXnpwCqg4svqwY3UZUaXDQWJ1gnh1p7zpq4FTL6fgxIOf/JDSi/kKW9ZW
	92SLbiX8V6ngw26lVVJEroTRbJ1Uvkc=
Date: Wed, 15 Jul 2026 23:48:43 +0800
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
 <2dc3d52b-ce4a-411d-9c30-934318ee98b0@linux.dev>
 <CANn89iLV9pyCKU4vyNMzW5FFv4=Xcq_pgvZaFhzJHAAbCK0h7w@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
Content-Language: en-US
In-Reply-To: <CANn89iLV9pyCKU4vyNMzW5FFv4=Xcq_pgvZaFhzJHAAbCK0h7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2026/7/15 23:30, Eric Dumazet wrote:
> On Wed, Jul 15, 2026 at 5:26 PM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>> On 2026/7/15 23:15, Eric Dumazet wrote:
>>> On Wed, Jul 15, 2026 at 4:54 PM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>> [...]
>>
>>>> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
>>>> index 61045a8886e4..4f1027173e95 100644
>>>> --- a/net/ipv4/tcp_input.c
>>>> +++ b/net/ipv4/tcp_input.c
>>>> @@ -4853,6 +4853,7 @@ void tcp_done_with_error(struct sock *sk, int err)
>>>>  /* When we get a reset we do this. */
>>>>  void tcp_reset(struct sock *sk, struct sk_buff *skb)
>>>>  {
>>>> +       const struct net *net = sock_net(sk);
>>>>         int err;
>>>>
>>>>         trace_tcp_receive_reset(sk);
>>>> @@ -4869,6 +4870,27 @@ void tcp_reset(struct sock *sk, struct sk_buff *skb)
>>>>                 err = ECONNREFUSED;
>>>>                 break;
>>>>         case TCP_CLOSE_WAIT:
>>>> +               /* RFC9293 3.10.7.4. Other States
>>>> +                *   Second, check the RST bit:
>>>> +                *     CLOSE-WAIT STATE
>>>> +                *
>>>> +                * If the RST bit is set, then any outstanding RECEIVEs and
>>>> +                * SEND should receive "reset" responses.  All segment queues
>>>> +                * should be flushed.  Users should also receive an unsolicited
>>>> +                * general "connection reset" signal.  Enter the CLOSED state,
>>>> +                * delete the TCB, and return.
>>>> +                *
>>>> +                * If net.ipv4.tcp_purge_receive_queue is enabled,
>>>> +                * sk_receive_queue will be flushed too.
>>>> +                */
>>>> +               if (unlikely(READ_ONCE(net->ipv4.sysctl_tcp_purge_receive_queue))) {
>>>> +                       struct tcp_sock *tp = tcp_sk(sk);
>>>> +
>>>> +                       skb_queue_purge(&sk->sk_receive_queue);
>>>> +                       WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
>>>> +                       WRITE_ONCE(tp->urg_data, 0);
>>>> +                       sk_set_peek_off(sk, -1);
>>>> +               }
>>>>                 err = EPIPE;
>>>>                 break;
>>>>         case TCP_CLOSE:
>>>> --
>>>> 2.55.0
>>>>
>>>
>>> My thoughts are:
>>>
>>> out_of_order_queue has been forgotten. skbs could be there and still
>>> 'block devmem'
>>>
>>> WRITE_ONCE(tp->copied_seq, tp->rcv_nxt) is certainly wrong, because
>>> read() will return 0, instead of -1 (errno = EPIPE or ECONNRESET)
>>> So the application will not know a RST was received :/
>>>
>>> I think that BSD and linux implementations have historically retained
>>> acknowledged,
>>> buffered receive data upon RST to allow applications to drain data
>>> already ACKed prior to the reset.
>>>
>>> Adding a narrow sysctl specifically for CLOSE_WAIT creates
>>> inconsistent behavior across TCP states.
>>
>>
>> Got it. I won't pursue this sysctl approach in the future. Thanks for
>> the review.
> 
> My intention was not to kill your proposal, only to start a conversation...

Thanks for clarifying. I agree this approach needs more thought.

Thanks,
Leon

