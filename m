Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45016390C83
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661468; cv=none; b=Hie8sBUqJ7eNCLTrDHLkeI+1ZxS/GTDfti3ia5kqvr8nqELWxA8RJtIEhwTN9RdMT5sVAYg324FhgPcV3K263Fp5cZS8uy1HNStAvombUnBYe6dco/eOFQQQfgztrL1EsRsRA4RjOSmp3lwEI0FnH5/CcnKCJ/qi3Z3jUAPXwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661468; c=relaxed/simple;
	bh=XYZ/Z8E6vtXI8ekr+HAC+mYeXCVml7M5yCUGxNj3tfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQKwDn+qMCBDWnhVBifciQCahUjXrpXHs0n2XvWoNrOryagKB1jNf2qBIStOE36epm2oGl2xYv9giJMLJa9pxCyB69rabz8n37vdnhbT24sors7Rdq7b/ulFc9SfeAOgBxzCLPPQHyk7fvcD3ukYUgGMDq3+TgLLpQfLWS7wNpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLdiH2iA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sH39Iz7J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLdiH2iA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sH39Iz7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773661466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjOWdH9YOd3q5jDpZy3h9DKwR4CFECAPPaRdY128lqI=;
	b=WLdiH2iA1Fj30KikWqsTr882TlmQNJPxWsd0yhTZuWtCrsmTWGoe98gePWbWrQ62SYG6x0
	VQGKKM1la8NrwjL/yG5UQzFfbbI/xKgbkJB1xQT0r5ntW+WkifUQzM/MX5IhIpbXwo2b5C
	Ls4NSIj5HCfVsA39eD/a2Dpf0JKsyYQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-8x5YYf88PTSFYm3InTaTsg-1; Mon, 16 Mar 2026 07:44:25 -0400
X-MC-Unique: 8x5YYf88PTSFYm3InTaTsg-1
X-Mimecast-MFC-AGG-ID: 8x5YYf88PTSFYm3InTaTsg_1773661464
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8fbe7a6f41so367399066b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773661464; x=1774266264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjOWdH9YOd3q5jDpZy3h9DKwR4CFECAPPaRdY128lqI=;
        b=sH39Iz7JhqEO7BE2yyd3VoO8NN5Sf/SVeBsxg/KeAiRczBZfWz91QuEltU0LeIBgph
         wXACfytY2IJTtBDn8D46ZjhbvqVecAcVtWCf9Tmcwk/k5PODKOMw72hprMQVMsI4LJrk
         YgDZ3kc1ljHr72WiKVDDv1fHqJajN3+gzQJNsFuJKkSXrzrnNF3K3uOMrg94aC7kD8ST
         aV69KkCmXxsB9+028EkCEzcYVkWHxFYad9gU9SzDLkE1SE3zTviemydUaozDx4gBRol/
         Urb6qZmgEnwiOaJgKS1sldpEqiu9Jl2ESxN4ppP379pJSTgTNRq590ou3jlrndb9sHgA
         xEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661464; x=1774266264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjOWdH9YOd3q5jDpZy3h9DKwR4CFECAPPaRdY128lqI=;
        b=KVi7lu7S1skO2Rp6/beKU9/rGcrbgdnAFfvaqTztvrZ4RC7mh2CJ5ixozf2EowvXG7
         M6mtSqNlmQKZNpOmiK1aJ0jZqEPaU9xiuy7rkdY8AQofBJGKiV14nLvZ9iNCZTwg/yHb
         oprY5nwKlhA/lSHMowf3xeW3HiYHQLUvTMUBKOgV0w7r5heCXjLDoq6Zf/Nhdd+heVaJ
         Hi4mh9GsxYhK+CAujh884bZZTzWpfCdkOfYyuFXo2LqT2SLsxeBkDPXPxj7x3obdIibR
         6ah1wDfxXRRcDl5RjhO5hPQ8P5IMYAPtZVqj0+FnS1Cai0acQvCGT00ul6rvNzTpvP4F
         r7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+q8I/r3ZTTd7tp4gYGOdF9F5VvaEXXXFzCXHmfTIc/oYuNdsoDHpd83aQHLXcjchRbacK/fJcXgobs7IlG+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNVGJx8xBQMs81e9ORtnEBw+lpJ44fI0lewYIvW3KLUIkASVA
	NlmP5u3gGp5nwbPMLr8kWverPah/7gb/glrVwCFtsn114KrCTPlmYomwrf75MGJpws5uHyFqLI6
	Miy5S8C/Du8vyWNUZjSPDjxYLi3SHdYZU/uo7yzL4ZiJfMstHsR5aq8NkprG7HyEW3fsFCA==
X-Gm-Gg: ATEYQzxe7qVx3agn1uJPtF+l3X5qHHDm1Rhwi/1TufIfsFxQilqlXTSy/5mGN+MZbRB
	snl8cKpvFfAoyWd7BmSVrBpDcHuJNQHp5xwV6P+V96QMam224UEPriIUxOhIK63HpwyKHQuth02
	MKDUsVxep+LI6luUNpXJ/9C1OuD8qNoue1RrYCGFbBZy4HaE/OTpGOnnIixkN/D31FaLRv5JJ/Y
	qYkX++hQco4XZKJTzNvXXFfq4sxRIzHI8msR66uMPOVswdq92/lHz1C1O1xrRWGMbZ8C9R4AKO3
	v5YO5PtwpoPZ1GU45afh/UrEqNaeByXxjWgVibH9ZtLQ4VMiXW7sEdpkWiaBzk/qyx3y7dQMCh0
	DJPi9Cfb1WZsTU5MfxMpU5zIcLs0iCEtXgQMDzKdqYE40fqQVwSyH9X0=
X-Received: by 2002:a17:907:3c90:b0:b97:acca:fcf4 with SMTP id a640c23a62f3a-b97accb064dmr285764466b.11.1773661463830;
        Mon, 16 Mar 2026 04:44:23 -0700 (PDT)
X-Received: by 2002:a17:907:3c90:b0:b97:acca:fcf4 with SMTP id a640c23a62f3a-b97accb064dmr285762266b.11.1773661463375;
        Mon, 16 Mar 2026 04:44:23 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d096d58sm533417666b.62.2026.03.16.04.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:44:22 -0700 (PDT)
Message-ID: <dddab568-a7dc-472c-8799-095ab96cef0c@redhat.com>
Date: Mon, 16 Mar 2026 12:44:20 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/14] tcp: honor the maximum advertised
 window after live retraction
To: atwellwea@gmail.com, netdev@vger.kernel.org, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, ncardwell@google.com
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 dsahern@kernel.org, horms@kernel.org, kuniyu@google.com,
 andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com, jasowang@redhat.com,
 skhan@linuxfoundation.org, corbet@lwn.net, matttbe@kernel.org,
 martineau@kernel.org, geliang@kernel.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 0x7f454c46@gmail.com
References: <20260314201348.1786972-1-atwellwea@gmail.com>
 <20260314201348.1786972-8-atwellwea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260314201348.1786972-8-atwellwea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 9:13 PM, atwellwea@gmail.com wrote:
> +/* Sender-visible window rescue does not relax hard receive-memory admission.
> + * If growth did not make room, fall back to the established prune/collapse
> + * path.
> + */
>  static int tcp_try_rmem_schedule(struct sock *sk, const struct sk_buff *skb,
>  				 unsigned int size)
>  {
> -	if (!tcp_can_ingest(sk, skb) ||
> -	    !sk_rmem_schedule(sk, skb, size)) {
> +	bool can_ingest = tcp_can_ingest(sk, skb);
> +	bool scheduled = can_ingest && sk_rmem_schedule(sk, skb, size);
> +
> +	if (!scheduled) {
> +		int pruned = tcp_prune_queue(sk, skb);
>  
> -		if (tcp_prune_queue(sk, skb) < 0)
> +		if (pruned < 0)
>  			return -1;
>  
>  		while (!sk_rmem_schedule(sk, skb, size)) {
> -			if (!tcp_prune_ofo_queue(sk, skb))
> +			bool pruned_ofo = tcp_prune_ofo_queue(sk, skb);
> +
> +			if (!pruned_ofo)
>  				return -1;
>  		}
>  	}

The above chunk is AFAICS pure noise. Please have a more careful local
review of this series before any next revision.

/P

