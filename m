Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A53128CA
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 04:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177266; cv=none; b=J3fUbDnWRJWQ/HcOKRc9G7qoQWfnt4QM30/hMNBdbhgPSQkk5311L81cOAeTcltbBrjZfDaaK2K22das3MFKmhZaXNqN/Jyt3w3dKZMySD+d0gy+ujptYCUCC1qrP46kfK26D3wUQGX4S/I6t0W+kTthk3269EgK3/Im12QpIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177266; c=relaxed/simple;
	bh=rf+xcw6W9dqatxhX5/ZemDEUvNG5YoPppX5ka6EgHMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kF3L0tfVSN2gEJZ140TjijbfoiSECQ0qFiUQZxm79WCm7gXm1YWIRcP5M2hRxhYjCK4YOhs1XM80vqQYGXmYdSDJhZeoVki6SZylazKMlkSYrySvsUUPpL60lzfxvRpwyi5sikOOChJJGofcG3iYI/p3/kzRT3KV2PvoBpQVSEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RyA/1hcS; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RyA/1hcS"
Message-ID: <4e6bf7cd-a133-443b-864f-a3d60d5c08f1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784177251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8nB70rsozdYbQSCJ2LId9j4sXaQKQBhDOLTpWWsJlA=;
	b=RyA/1hcSHAB1TDFHb0aB9DhfEhIHdgkvTQqgs8pQcTxnPsSNxX+mR7WuVI3ZmmDolozDm1
	xoY6SQxaHodBhQpHFpNpRLN04LRUF+8S0g+xR1S0eZDqVZK7s7ryZa2xnpvqVi0JuqcM0R
	WwXXfIQjrBJm6xCsQDs+1IbT3Rklx/E=
Date: Thu, 16 Jul 2026 12:47:08 +0800
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

On 15/7/26 23:15, Eric Dumazet wrote:
> On Wed, Jul 15, 2026 at 4:54 PM Leon Hwang <leon.hwang@linux.dev> wrote:

[...]

> 
> My thoughts are:
> 
> out_of_order_queue has been forgotten. skbs could be there and still
> 'block devmem'


Yes. The tp->out_of_order_queue should also be purged here so that
out-of-order SKBs cannot continue holding devmem.

> 
> WRITE_ONCE(tp->copied_seq, tp->rcv_nxt) is certainly wrong, because
> read() will return 0, instead of -1 (errno = EPIPE or ECONNRESET)
> So the application will not know a RST was received :/


Thanks for pointing this out. When sysctl_tcp_purge_receive_queue is
enabled, read() must report the reset error.

The reason read() returns 0 is that SOCK_DONE, which was set when the
FIN was processed, is checked before sk_err in tcp_recvmsg_locked(). I
think clearing SOCK_DONE after purging the queues could let read()
observes the error installed by tcp_done_with_error().

Will also update the packetdrill test to expect -1/EPIPE.

> 
> I think that BSD and linux implementations have historically retained
> acknowledged,
> buffered receive data upon RST to allow applications to drain data
> already ACKed prior to the reset.


Agreed. The new sysctl is disabled by default specifically to preserve
this existing behavior.

Enabling it is an explicit opt-in to discard buffered receive data,
release the associated resources promptly, and report the reset error
immediately.

Will update the change in ip-sysctl.rst documentation with this
application-visible tradeoff.

> 
> Adding a narrow sysctl specifically for CLOSE_WAIT creates
> inconsistent behavior across TCP states.


My bad. After reading the RFC 9293 section 3.10.7.4. [1] again, "All
segment queues should be flushed." should apply to these states:

      -  ESTABLISHED STATE
      -  FIN-WAIT-1 STATE
      -  FIN-WAIT-2 STATE
      -  CLOSE-WAIT STATE

So, the sysctl-controlled purge should be consistently applied to these
four states.

[1] https://www.rfc-editor.org/rfc/rfc9293.html#section-3.10.7.4

Thanks,
Leon

