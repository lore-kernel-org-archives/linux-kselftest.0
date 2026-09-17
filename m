Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69551FCAF
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651061; cv=none; b=RhVi63dg1zA/W5au3NhO8JYrseXcXzWFYkTbq3avJ6/ZqTRndb+K8CLLBUYpfvhufh/tx2dp6I3Bhrb75hlKeHg45VQWzYn7oz5w9wyQE3z8BHNjnTmMZ9RuPRK/AuBD21/PBEqwrc55BxbYgVDmcklsExtyTx58UJag2rhC9UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651061; c=relaxed/simple;
	bh=mWJb4t2kIydkYhKiwti+kWwyjbq/7iOJUwQJjQ/ftgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQfA4zWfz+QSD/PLNcOwNI1YarILVYaUWj1OeUV6Pr88sERVhnJzEfC4l4eDG5VX/FmBSdOzxFhCByhkJCYmW45oi3Gbnlm89WLxcOXTXplwru2bTrMILWph8IDeI5bidujLFa9rBTRvD9T3phiF8FkDZ4o485YWpFqNRBzkF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckcH7F19; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j6vmvPCR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckcH7F19";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j6vmvPCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789651055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W50fz/nBpQW0iJctJjgH1Q/mfNCeyh2X7geaavsggEI=;
	b=ckcH7F19WKgBFqp7nT81w/hX4idY/XGhgeGxI7g7WfMFjWw1iycIFAlqpFgcskdK4RwUfR
	MWMWQgm51CZ9b2ZPbLGZrc44KUbCsz8OuL8CxrOwLkWqw3o7qT1bQEIZhTLaPN6T9bijm3
	DnelFXhHWxyxVeb2bhvqSMLxO12quYM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-pJqPZsJ4MeWcltGVCq2N2g-1; Thu, 17 Sep 2026 09:17:34 -0400
X-MC-Unique: pJqPZsJ4MeWcltGVCq2N2g-1
X-Mimecast-MFC-AGG-ID: pJqPZsJ4MeWcltGVCq2N2g_1789651053
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4870a0f802cso810914f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789651053; x=1790255853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W50fz/nBpQW0iJctJjgH1Q/mfNCeyh2X7geaavsggEI=;
        b=j6vmvPCRRPBGYvPbUu6L91tuHsFC0Ws2mCKHSLpXNz0Qq3J83NVTiiYzueuoT5EI4V
         5yVJNFKfQvFVjho5NV0LY13kZgK/UFY5gqxYcuXIffP84uIuJmQRW/Rkr5R3FfjIX/7g
         uq/0GGQY1j9o5T0MQ4KLySLzRsN+xbdC7rLbLsIVL0w0EIp1XkheAfMCpaexWRJD4prQ
         LuafS3/0rEt6bYN3g0s8O2RyHY4R3WS0+icdTt478IrDI7Y32FFSNuSpAO4i+mpclJUH
         pjTP/ISqBSjmmMXGlHLfPGWz3BMnSLRUWZrM1LqLo8hXm+CrgnDYKn1nhB6PMDzqlvRq
         l8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651053; x=1790255853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W50fz/nBpQW0iJctJjgH1Q/mfNCeyh2X7geaavsggEI=;
        b=h3eWOxOGECuM3UyE71FbNMwF5cbZ3II0vxJ4Sw3GEizBKEpDMs7orlsDYIGh3YRVdY
         LN3eg+mUPKPzn0gCe3yQEoa1xuGa1mC/J5UbfiUJJ7mYJXG3NCK2skF53V9KR9OySoNj
         r3FlmYLVbqDvK16gL9i/dIHrvOpR44R9eoC3JPFjMxkYGlQXXJSAZXHTO1tMdHQ0tQ2S
         FYGGzNKRdGGVk9R4nYn7/L4OjEQdnjVCIAZ7JzISFKXEK1dKVaUZCwIQzRpM8qu/D7bZ
         b+v7JQhuvyiiwu7Cwx8+FuoDHcj350+n3ZYldzkXIMR5bIhsLDKOpFobA42nMnJ2HHPk
         mKAA==
X-Forwarded-Encrypted: i=1; AKwUvByazSYak/4ZNYrAjtzWR8tfRJZhDV0O4v1S/y0CfyqPto+DW9oaQb6g3nNInKQRJ8ISonozBblZ70Rs9iUsoo8=@vger.kernel.org
X-Gm-Message-State: AFuF++nRwNNjzvXtfqiPiQVsnslPFgIz1AHHOWKKBHWPFDVBcOZbxzRx
	gOadzCAHUCITQj3LxGu8PDfiQhriDLvc5iojnPvQCrYx6gKEdZjKoATkWWmu8srxbk554FQIe1p
	l1TTh8K/W76MLkBvr3v3ar3TahdN0zx9zqpiSN2vt3uM7n1hcobwoOQBaiQMhbslY3JdSkQ==
X-Gm-Gg: AYBFou0KwpS5LAz94q+2HJvlnr8VnjhOqXAXs0WRbKCTX6ioXLSFKtEG8kZmSVUDzrB
	tvgfcV/VBDdUaU/scv4QrZECtrbkCA+pXh/wI6c8qTTJJEPzVQ1aIeBqQyIkDof3Jc81RcQznsb
	9F6C1eTbxYSDO5UaG0ajqSPiT4C59bHxjqO0u/xW6Ar4P8C5yLbiJv/JjFvi0pnovmu+AgTIp2Y
	efoKGyWrcFnPIKVdbI4JV6EOLD2VdiQ7N1GjLsIJpOIz6i/I/4UAi8MBbAB9nuQBfmXHhzaSV6W
	KVkocBeg2pcG8VjwVwNr/MP7/nejOjBAbzRaa/H5f7X8Mm0g77M4eG96AzyAD9ZHes9surIAQLp
	F6YCW9ZGcYGZe1yi7iASqMa6RrpnV3UBSaVGsCLM2/gDdUOl/2gNM1XPr+Xu1j4BtUyD5HGxPfw
	==
X-Received: by 2002:a05:6000:1883:b0:487:94b:2262 with SMTP id ffacd0b85a97d-4870d05adabmr8486584f8f.52.1789651052574;
        Thu, 17 Sep 2026 06:17:32 -0700 (PDT)
X-Received: by 2002:a05:6000:1883:b0:487:94b:2262 with SMTP id ffacd0b85a97d-4870d05adabmr8486535f8f.52.1789651052131;
        Thu, 17 Sep 2026 06:17:32 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef766dsm15083243f8f.4.2026.09.17.06.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:17:31 -0700 (PDT)
Message-ID: <6fc1f088-b139-418b-a6e8-d273d235f444@redhat.com>
Date: Thu, 17 Sep 2026 15:17:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] selftests: net: packetdrill: test exclusion of
 old ACK from TCP fast path
To: netdev-bot+sashiko@kernel.org, inbal.lipshtat@mail.huji.ac.il
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, amit.klein@mail.huji.ac.il
References: <20260914090408.1435080-3-inbal.lipshtat@mail.huji.ac.il>
 <178959269660.22033.12533704715181509708@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178959269660.22033.12533704715181509708@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/16/26 23:04, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] The new packetdrill test
>    tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt…
> 
> --
> 
> selftests: net: packetdrill: test exclusion of old ACK from TCP fast path
> 
> This adds a packetdrill script that primes the receive queue with a 500
> byte segment and then sends an in-sequence 1000 byte data segment carrying
> an excessively old ACK, expecting a challenge ACK with RCV.NXT unchanged.
> It is based on the reproducer from commit 3d501dd326fb ("tcp: do not accept
> ACK of bytes we never sent").
> 
> No Link: tags in the commit header.
> 
>> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
>> new file mode 100644
>> index 0000000000000..32dd9de1d3662
>> --- /dev/null
>> +++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
>> @@ -0,0 +1,29 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +`./defaults.sh
>> +sysctl -q net.ipv4.tcp_invalid_ratelimit=0
>> +`
>> +
>> +// Test rejection of data segments carrying excessively old ACKs
>> +
> 
> [ ... socket setup and handshake snipped ... ]
> 
>> +// Populate receive memory so the following segment can use
>> +// header prediction.
>> +0 < P. 1:501(500) ack 1 win 65535
>> +0 > . 1:1(0) ack 501
>> +
>> +// Send an in-sequence data segment carrying an excessively old ACK.
>> +0 < P. 501:1501(1000) ack 2794967397 win 65535
>> +
>> +// Challenge ACK; RCV.NXT must remain 501.
>> +0 > . 1:1(0) ack 501
> 
> [Severity: Medium]
> 
> Can this script also pass on a kernel that does not have the fast path old
> ACK exclusion?  In tcp_rcv_established() there appear to be two independent
> routes to the exact output asserted here.
> 
> The route the commit message describes is the header prediction gate:
> 
> net/ipv4/tcp_input.c:tcp_rcv_established() {
> 	if ((tcp_flag_word(th) & TCP_HP_BITS) == tp->pred_flags &&
> 	    TCP_SKB_CB(skb)->seq == tp->rcv_nxt &&
> 	    between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) {
> 	...
> }
> 
> But if that gate is absent and the fast path is entered, the segment can
> still leave it before being queued:
> 
> net/ipv4/tcp_input.c:tcp_rcv_established() {
> 	...
> 			if ((int)skb->truesize > sk->sk_forward_alloc)
> 				goto step5;
> 	...
> }
> 
> Both routes end up in the same place:
> 
> net/ipv4/tcp_input.c:tcp_ack() {
> 	...
> 	if (before(ack, prior_snd_una - max_window)) {
> 		if (!(flag & FLAG_NO_CHALLENGE_ACK))
> 			tcp_send_challenge_ack(sk, false);
> 		return -SKB_DROP_REASON_TCP_TOO_OLD_ACK;
> 	}
> 	...
> }
> 
> which emits one bare ACK with ack=501 and leaves rcv_nxt at 501, so the
> single expectation "+0 > . 1:1(0) ack 501" is satisfied either way.
> 
> Given that, does the regression value of the test rest entirely on the
> sk_forward_alloc head-room left by the 500 byte priming segment, which the
> script does not assert?  Forward allocation is granted in whole pages:
> 
> net/core/sock.c:__sk_mem_schedule() {
> 	int ret, amt = sk_mem_pages(size);
> 
> 	sk_forward_alloc_add(sk, amt << PAGE_SHIFT);
> 	...
> }
> 
> so the residual head-room after the priming segment is roughly PAGE_SIZE
> minus the truesize of that skb.  With the default MAX_SKB_FRAGS of 17 the
> 500 byte skb lands in kmalloc-1024 (truesize around 1280), leaving enough
> room for the 1000 byte segment (truesize around 2304), and an unfixed
> kernel would queue the payload and fail the script.
> 
> With CONFIG_MAX_SKB_FRAGS=45 (BIG TCP), skb_shared_info grows by 28 * 16
> bytes and the priming skb moves up a kmalloc bucket, leaving under 2048
> bytes of forward allocation:
> 
> include/linux/skbuff.h:
> 	#ifndef CONFIG_MAX_SKB_FRAGS
> 	# define CONFIG_MAX_SKB_FRAGS 17
> 	#endif
> 
> 	#define MAX_SKB_FRAGS CONFIG_MAX_SKB_FRAGS
> 
> In that configuration an unfixed kernel would take the truesize bail-out,
> emit the same "ack 501" and report a pass while covering nothing.  Other
> PAGE_SIZE, NET_SKB_PAD, kmalloc bucket or debug allocator combinations
> look like they can have the same effect.
> 
> Would it be worth pinning the path with an nstat bracket, the way the
> neighbouring tests do, for example on TcpExtTCPHPHits or
> TcpExtTCPChallengeACK?  tcp_rcv_big_endseq.pkt uses:
> 
>      0 `nstat -n`
>     ...
>     +0 `nstat | grep TcpExtBeyondWindow | grep -q " 3 "`
> 
> That would make the script fail rather than silently pass if the segment
> reaches the fast path.

IIRC the nipa CI runs with CONFIG_MAX_SKB_FRAGS == 17. The above could be
a possible follow-up, not blocking.

/P

