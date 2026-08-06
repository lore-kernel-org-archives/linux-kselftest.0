Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390D8448392
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012512; cv=none; b=eUnmQnLPi82Zgp+po6zNUFvmHH7NMQtVZX2MC67g88e0RSvyuB0ybQLun0+IA2hWCmPE2PrD6ExBohx+WglT+gvCp7F6vngRSRI0wySZIfKB8CexJ5RwlTJro4jTamRRc7TlKguhuxWjI6f+lnTAJhjhizjveiHi8Wg5Vl2fKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012512; c=relaxed/simple;
	bh=NIfmBcIS8AUrGupvQOZ7x2SRlwytFniaM+5zsSUMgVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tj/NO76GM4bXNZsM+FIxSiQOg8O4z1uMWo6N2QZKRMU7iFx6LIga3D3WO8ZXRW/eBsUx0jZ/yOMxwzPCujLmTzMApoeH4qsu4vky1FNNJ91/rtKixRqZj1Ls2Fo86Njqfsjm+StnhNzim+jVhjKP3OOS4TkQTd9VsbiB8U7g6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CX+YjKWO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iQqNCssb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CX+YjKWO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iQqNCssb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786012509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJYQ27Sjsp6jth/HjB+z5OpRp2AnhJkmpaIw+MV/sWQ=;
	b=CX+YjKWOsnWTLPWRw3kKnumLFL6EUVWerXJ9OHr05eg+CnrJCUMa3iAN3KC7RtyiOqj6KB
	rYU5THq5V9XOhm80tRJpUDSxUtKB8gu49F76ksMuzpHrukXb42W1wwGXALH0WT45pWRj6j
	vE2df5TQt+9MntJrR1Qer5ch6+/71IA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-nYxuXolDM4mp7xau6AdeFA-1; Thu, 06 Aug 2026 06:35:06 -0400
X-MC-Unique: nYxuXolDM4mp7xau6AdeFA-1
X-Mimecast-MFC-AGG-ID: nYxuXolDM4mp7xau6AdeFA_1786012505
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767b782so15344935e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786012505; x=1786617305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJYQ27Sjsp6jth/HjB+z5OpRp2AnhJkmpaIw+MV/sWQ=;
        b=iQqNCssbILnvVFNoN7TfO13u98GwooZneMdFzf5ekOunXSx+YBOLSw9rh9MjC0/7pF
         ClGGhsqCsmvumCWcVgP2szVbaSoiYH4HHka6vh54t6NcwIvnM2xywIOyGTEe/awjeTXN
         VqDHAqVpp3rnzur/2w+i95FQWaWyROKINjPQ2Fw3kzLt6+JsdtJ0TF1fYRYDO7fFsXzj
         KLlokKROs+QwZPGvE3BwCviYN6GywST+ws6bHacExBYUrhPUqIKc1I3hJE0fbBNSz4VU
         ACEmsirLF9o8un/vjdDImKjcc9K14GujOG/AeWNPH0Lkri9fRG7ubeNx4sZePZg2tq5u
         BWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012505; x=1786617305;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJYQ27Sjsp6jth/HjB+z5OpRp2AnhJkmpaIw+MV/sWQ=;
        b=hL70wdYInataWWi5iZ5JJ7FwmAeoUQrTA/tSNv916N+7MYuOw0lA2qDfI0cMb0boNl
         /Ne13/hPiaN6/hSY4P6fXcJpBT7Oq5KqZn7MQFHY7qCgM1pKiondXyR3ZXnkchrT0tK7
         dJVrlDmUkGW1ys0tx6oBG0rOVhEzL5EGI36UyIfJM0oqA5L5qSqfOIWumH8peWaeSf5b
         Uz0+1vISPU6yoPXKBbYDdIfWHQlwrQ37dH3qH1a1QoK9lzz0x15V8vCv5Kw581DoT0CA
         a8O6dhQzi9BMFuk4VJePm07Yv1urttozHXxnRWYOF99YwDDKMtonGyNCOwQhA4ihqLMR
         kDdw==
X-Forwarded-Encrypted: i=1; AHgh+RrQFYeZoFBoBBGG2oJJB6cc8wq0QZKCbmiYMYxjlmjTp8m2fRGCcNSBI6spGP6hu5dvgfYPFP/Gcp6KADKT5A4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0uTKDbs1S7FW99ErCgtZjl9OMtoHLSVDZx1/Pqd9hv1MJurB
	g75nyEWKuFs3uoUV1nI8poMldqVZetRxtI3ELeAmcwC+DO1eI08/4A9k7gkEewjP8C5GHxTHnPQ
	G/eZqVUO42fUX9kwDtqdAP7zZ3k5wa76ERM4ekCW7RRNgV8zy7P1BPoWNaLAIjY1uxh0SNA==
X-Gm-Gg: AR+sD125Lh5L5YHweAjHfQY75IT+A/kKzZEMTGpAMD/IqFot2mocWk8ly2snynGZlrF
	F32BbJsYLgcADBvYx8cJO1gZSPp80E8tWxfKa/OcEK984odd74B7y4DDTzi7FlfqbAYP0rDTRW6
	jSO9HwQYyVuegjMchjHTx5b0LBY1hL+w7/LIEQ9RDgvPJ9pcbVpwIcu7+OENqwpqgMIRq8Ys36q
	I4BSlEuGAoj/7fOJzXSZUFJctKXvNwqqY2dMkEDnYH9mgaw8otHKM6ybQZaezUjyWFPpXbCp35l
	LA99MSeTUlYjobpUNR7F7zl7BSBz+rBuGEF+IHEJMiUNEpb6PiFUZjr6sKiZ3OZ43qVFqtDdIiu
	/yT95EpDaReUrUnbo7mCAbHD86DYa3zdKBhmFbRw6ceWrGjMn89wy/mAZZXx0Nt3UVDyMXmOO5N
	Y=
X-Received: by 2002:a05:600c:3583:b0:499:59e9:64 with SMTP id 5b1f17b1804b1-49959e900b4mr2389155e9.12.1786012504794;
        Thu, 06 Aug 2026 03:35:04 -0700 (PDT)
X-Received: by 2002:a05:600c:3583:b0:499:59e9:64 with SMTP id 5b1f17b1804b1-49959e900b4mr2388435e9.12.1786012504257;
        Thu, 06 Aug 2026 03:35:04 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542241c4sm49753095e9.11.2026.08.06.03.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:35:03 -0700 (PDT)
Message-ID: <4fc3b9f1-4bef-4b34-ae7a-e89037cce829@redhat.com>
Date: Thu, 6 Aug 2026 12:35:02 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/3] net: hsr: clone before updating path and LAN
 IDs in tagged frames
To: Xin Xie <xiexinet@gmail.com>, davem@davemloft.net, kuba@kernel.org
Cc: edumazet@google.com, horms@kernel.org, shuah@kernel.org, lukma@denx.de,
 m-karicheri2@ti.com, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, ali@iusegentoo.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260802202504.2962-1-xiexinet@gmail.com>
 <20260802202504.2962-3-xiexinet@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260802202504.2962-3-xiexinet@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/2/26 10:25 PM, Xin Xie wrote:
> hsr_create_tagged_frame() and prp_create_tagged_frame() update the
> path/LAN ID in the received skb data buffer and then skb_clone() it
> for the egress port. When the same frame is forwarded to both slave
> ports, the second port ID update lands in the same shared buffer the
> first port clone still points at; if that clone is still queued
> (qdisc backlog, NETEM, BQL), it is transmitted with the second port
> ID - a silent on-wire corruption.
> 
> One always-available trigger is the master transmit path: a
> pre-tagged frame transmitted on the master (for example injected
> locally via AF_PACKET with a valid RCT) passes prp_fill_frame_info()
> with frame->skb_prp set, the master-origin gate lets it through to
> both slaves, and both slaves run prp_set_lan_id() + skb_clone() on
> the same buffer. Tagged frames arriving on an HSR RedBox interlink
> take the analogous path through hsr_create_tagged_frame(). Normal
> traffic tests do not expose the race: the window between the first
> dev_queue_xmit() and the second ID write is only a few instructions
> and opens only under egress backpressure. With a 200 ms netem delay
> on one slave, all 200 injected frames left that slave carrying the
> other slave LAN ID in testing.
> 
> Reorder both helpers: clone first, privatize the clone with
> skb_cow(), reacquire the header/trailer pointer, then update the ID.
> skb_cow() is used rather than skb_cow_head() because privacy is
> needed for the whole linear area, not only the header: the HSR tag
> sits in the head, but the PRP RCT sits at the linear tail.
> skb_get_PRP_rct() computes the trailer from skb_tail_pointer(), so
> the returned pointer is always inside the linear area that
> pskb_expand_head() copies; frames with a nonlinear tail are
> mis-parsed by the existing helper regardless and are out of scope
> here. (Both wrappers currently reach pskb_expand_head(); they differ
> in the cloned-data predicate, and correctness here needs full data
> privacy, not only header privacy.) This adds one linear-head copy
> per tagged egress; untagged master traffic keeps the existing
> __pskb_copy() path and pays nothing from this patch.
> 
> Fixes: 451d8123f897 ("net: prp: add packet handling support")
> Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
> Tested-by: Ali Ahmet Memis <ali@iusegentoo.com>
> Signed-off-by: Xin Xie <xiexinet@gmail.com>

Please try to condense a bit your commit message: too much text is alike
no text at all.

> @@ -377,15 +389,28 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,
>  	struct sk_buff *skb;
>  
>  	if (frame->skb_prp) {
> -		struct prp_rct *trailer = skb_get_PRP_rct(frame->skb_prp);
> +		struct prp_rct *trailer;
>  
> +		/* Same sharing hazard as above: privatize the clone data
> +		 * before updating the LAN id.
> +		 */
> +		skb = skb_clone(frame->skb_prp, GFP_ATOMIC);
> +		if (!skb)
> +			return NULL;
> +		if (skb_cow(skb, 0)) {
> +			kfree_skb(skb);
> +			return NULL;
> +		}

This is the verbatim copy of the previous chunk; please create a shared
helper instead.

While at it, sashiko notes this leaves the else branch open to the same
issue:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260802202504.2962-1-xiexinet%40gmail.com

Note that the data race on the dev stats can be addressed later in
separate series, as there are already many occurrences in the hsr code.

Also be aware of net-next commit c82ff94592fb.

/P

