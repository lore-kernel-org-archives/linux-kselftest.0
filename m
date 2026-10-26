Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996369;
	b=FLW9j/j+RWl70iiMGv5hheWfivZbgefosV0aDJwtvxJVMvO9xXyjBKO2lhMWcxLYPFdZ
	 4ixM+Q1hm3ml/34s70cukDANHdNbRIYxtHjQBTPOQzoNdLOwX8+yZblGiEoukn3GNZbYQ
	 1CkNks+MZBv3cqlGD2QBcwX/IbTvmVMYatrp0C/c0S8Xo1PFFyAWkecEBnhuRBt1y/ppV
	 HrzXCkh/UZvcXI2rkGwrVfNBafPsGhmigc0pniyLIJUQQq6/WkjlDGS0gtkjrh8xUJWa+
	 V3CFb0dogtUJ/80PokcyeVxDE4RmHNC00rcLSzPVBvGCUU0hMqTxixmNLjO3AH+heoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996369;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CC59iY1aw6OyV8aTURcQLbLL17pBSNRBVzyiXs5pORM=;
	b=duy8j0P0zo7443vWscs2Df2wo0CF4wbYH1DoMMP29MQmwd3pDFciytfw2UE9BL/3iwE1
	 IWIzakTmOkhjljTg+qy5rfRdYTyIyeD8wd4lW1CEUi4WrltY89G2ruE4nxBxBzpxZZcBv
	 Z5oGhy5A0ohmRr0clJCBwBJuYzCEt+wmapV6RrFWIFj/PmHR21Ab2Dwdb5eiFsv/OUftx
	 KhKGP9ZRWsEWJeCSn0ZWy5ZulwGMIP/veMjYHDCp6IljxbpT63R/wh4QJGiJzenC1QPc1
	 dyFr2iRuoI5iLSPoVcG8hcZQE4cTOy09jPs8qx1REb2Vkig33TTGezRmeRRFVbku44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.190
Received: from mta1.migadu.com (out-190.mta1.migadu.com [95.215.58.190])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB9606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 06:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBB9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CC59iY1aw6OyV8aTURcQLbLL17pBSNRBVzyiXs5pORM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792996358; v=1; x=1793601158;
 b=i+8Ult+S6zvD9Bg7VMNe5iRbHrfBhZVRsULgmUnxm37S/8jDYdapDB+FvUaGp2zrcK/aaEFE
 D8uzEsO15Z75t2TuY3WKWU/zKZGkAG0ewvT/UeMW/bCmF9V8zzU8BjTtMkycyGJ2BJD8jbI40oI
 AMmWhlsG/2P/E2gnd59fe7fw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b6a4888feb48e90f;
	Mon, 26 Oct 2026 06:32:38 +0000
X-Mizu-Trace-ID: b6a4888feb48e90f
X-Migadu-Flow: FLOW_OUT
Message-ID: <50b12d32-891c-46d4-bd5f-8924cb8db60f@linux.dev>
Date: Mon, 26 Oct 2026 14:32:23 +0800
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
Subject: Re: [PATCH bpf 1/2] bpf, sockmap: Stop reporting EPIPE on zero-length
 skb redirect
To: Eli Skeggs <kernel@eliskeggs.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261025-sockmap-bare-fin-v1-0-bb8feae7c4a7@eliskeggs.com>
 <20261025-sockmap-bare-fin-v1-1-bb8feae7c4a7@eliskeggs.com>
 <23181ba7-e4ef-4475-92ee-366e0ca2dcf0@linux.dev>
 <010101a176362646-06b53e65-6c20-4ac2-9e05-b74eb5376abf-000000@us-west-2.amazonses.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <010101a176362646-06b53e65-6c20-4ac2-9e05-b74eb5376abf-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/26 11:17 AM, Eli Skeggs wrote:
> On Mon, Oct 26, 2026 at 09:59:00AM +0800, Jiayuan Chen wrote:
>> On 10/26/26 7:41 AM, Eli Skeggs via B4 Relay wrote:
>>> From: Eli Skeggs <kernel@eliskeggs.com>
>>>
>>> Treat a return of 0 as success when there is no data to send, while
>>> continuing to fail on a 0 return with residual bytes. The loop exits
>>> without incident on an empty skb, and the skb gets cleaned up as usual.
>>> On an ingress redirect, the empty message is still queued as before, but
>>> the target socket no longer reports EPIPE.
>> The target can't receive anything after that though. The empty msg sits
>> at the head of psock->ingress_msg and nothing ever dequeues it:
>>
>> [...]
>>
>> So the user gets EOF on a socket whose peer never closed, and everything
>> redirected to it after the FIN is lost. Without a verdict prog on the
>> target it is worse, tcp_bpf_recvmsg() returns -EFAULT forever.
>>
>> Since this patch is already about the zero-length skb, can you handle
>> the ingress side too? E.g. in sk_psock_skb_ingress(), don't queue an
>> empty msg when len is 0 and the skb was redirected (skb->sk != sk). The
>> self PASS case must keep its empty msg since is_next_msg_fin() depends
>> on it.
> Yep, thanks for pointing that out.
>
> Alexei suggested skipping empty skbs in sk_psock_backlog():
> https://lore.kernel.org/all/DMEE6SW3UE97.2DF11HBEBKYYI@gmail.com/
>
> To your point, I think the critical difference between these approaches
> happens when the sk's backlog queue is not empty and the socket's own
> FIN (the self PASS FIN) gets queued. In that case, we rely on the empty
> msg to correctly update copied_seq, and skipping it means the copied
> sequence number ends up 1 behind rcv_nxt.
>
> This path is already broken: when a socket's FIN gets queued behind
> other skbs, the backlog reports the erroneous EPIPE just as in the
> redirect case.
>
> I do like the simplicity of skipping the empty skbs entirely. I don't
> immediately see what the consequence is for copied_seq being behind in
> this terminal state, but the approach that updates copied_seq does seem
> strictly more correct.
>
> Is that the right interpretation? Let me know what direction I should
> take for v2.


Yes, go with Alexei's suggestion. Skipping zero-length skbs in
sk_psock_backlog() also covers the ingress redirect case I raised,
since the empty msg is never queued. copied_seq being 1 behind
rcv_nxt is fine now, plain TCP sits in that state until the user reads
EOF, and nothing on the psock side depends on it.

