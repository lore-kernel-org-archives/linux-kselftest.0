Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6544213A
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014229; cv=none; b=bBqQ8P98tFC841Qzi1VfBSFCdiEjgnkvBcNPoBohxvETcao0Wrbf/QFLM7TrH/wofgVbyDoyPYjDLbatUSezXFqRTssYjWo8ZXygiSkJf/1Uj20XncYvP14nd/QnuY8mRWAK+NQBlUV7uzG5pyGlhpLnLqgbOWc2qCavcBWEUPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014229; c=relaxed/simple;
	bh=iE6Q2Ug/6mAeAIAFnrmSJLXnWZ7ZduGAOhOUVlAG/ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuctT5o+oqom1ePq/pSDV+wH7krHqhQAQJW0mTKyqt86eDlEqhfh7njl0aFGze8QDl0jPLIvkVJA8dJwxX48OPs13I/vozZBUH/VcKnnhZvIwQh9G1q23a5k2wFiFQXeaAzmojna7P1JgPh7aHCj6PhEiZpdyaU2YxKU3EC6FkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DH/UZFzR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqlfruSl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DH/UZFzR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqlfruSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786014225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSz29CkTSO5NJpT4GVHSTW68SMyx+zAIl+7sgb9/rBc=;
	b=DH/UZFzR7MBplqCau1sZmDUmU/o7q+HvAopLwJpAtDciwnpzMOKQn1xgp45J55zmh5lh5t
	18Zb3MZxFAv06sQRFakckyrgNjrKCo2u+T2MC2oEPowX5fVrheeMWb24lt8+z/0xx+8wZ5
	r73U39cwyErmlCCEClsA0oMCRDyMy/Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-PopENErWN2eHaSvGAQ8fSA-1; Thu, 06 Aug 2026 07:03:43 -0400
X-MC-Unique: PopENErWN2eHaSvGAQ8fSA-1
X-Mimecast-MFC-AGG-ID: PopENErWN2eHaSvGAQ8fSA_1786014223
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49561facb1dso13122095e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786014223; x=1786619023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSz29CkTSO5NJpT4GVHSTW68SMyx+zAIl+7sgb9/rBc=;
        b=QqlfruSlkDi7NuO4nhuZhrCNCE/Yj6CU8VuS7yz+p5sXhh0agPU8NGWGLtUjZYqcEo
         u7K69+c7AGeX62heH8PAuzMALT0YYYrCPN/sVKXVbn1PMzaqUZZbnz/ZDC4WGKbmlZRP
         2Di2RAohX5tUTqDnHwVNHgTcjEzhIbut3A2AvgSiKZUGoWETt3Q5nkWVLIPsN8IKxSFo
         Jvgd/Gp9Gfz/uhsF9OTU5gngwS5OfKlD/jBA/CUdxdrmICLB+FapxtB3i6pTxMdrpxVz
         r4NTbVwqne3D8kg5unIL5z2rt28tL+Rp7ejkukJMilelth7lmgStQ6+RlFxH+80bxrP+
         MT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014223; x=1786619023;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSz29CkTSO5NJpT4GVHSTW68SMyx+zAIl+7sgb9/rBc=;
        b=m7syL+2m0prSZB/mWkwV1dd4+FTEg4VGPji4PWx6kPVG1h+Xx9W3VYHYVOoqjFSBcj
         7hcwHcDbwef5JfG2lxcxDsvfqR5uVEm9Z2lWFRUTT0LKzOc8luMvN1DnJPa9TDGCgASs
         i4ndoeS6Ts3WU2k5HxEG1Hz4VR0ubiorDuRFSX1m4KfeC6BpPCFWTTHGIiWUpD7mscF1
         JIzzH5W6G49GeUi/ztlQR+9wqrwBJHDv6mV5A4JkPZ7OUGypz3VWcTC7duzoJqO9e7Sb
         kfcff+jcSVNeSQq2WoxdgiG5+G0yV4vfvNq9Bj9Ix4EPLuh1UDEizqeUsLOUu6zdK5qh
         LP8A==
X-Forwarded-Encrypted: i=1; AHgh+RperDwoD1uNbpYfrM8txO/sLD+EHc0lYP58/k7jUTffvvZ3+pMrlrea5njNCqFL3yGaVSX5GlqEYcG0qMe9Qkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfnqCIZ8rc0bcV3w2WNNNI6B552GzGxxxC4kUllEvtFCmLaGT
	Smp6dr65iH2Z2lsoHJ0/+C0ZkzVZK6yoV5A5dQ2Ba/n5oTslJ61+Z02vzvffy4rWrgIQvfGmLu+
	cQoRb0GZgRKnGvMtZXf3n42H33c4pxecITkSYX+o9wmRm/rxEBriT6s5tg4zKbZfEJy7uog==
X-Gm-Gg: AR+sD10kygYDwU8+lUQyPFBrY0yfP6Xv7olRdYWe824+jdG6ULRwI3L1DpVpaDd/4rA
	CpqtjWmigFuuI+nq7egjHQ/8duyAovxPEFT3QTlNTVkejOgce3hIQDMR6MLzRORi84B7XMFWB8a
	XctlFNmfEuBQDWISFJCIiGnUQXqoNAZ+wxHVprK6gPFoDNSoyLGNdBfCmO0wj2SNM66OHuYUQeS
	3z3+IDa6ug7mVZrHgicHHstF4D7sa/WGW4DTafobgsWJxz/znGOFagd9R75z2+t5I60NR+Hy9xV
	0DI6TRQu5Xokupf1pHmiyV7cZnSy8TxbzOtOnM8nB1tcTdE5mPrJys52/fwBAu1mie5GcM7pbNH
	gnwjEdVAbH/oCa4nDqoybmegQCP0a3Lw10MCVZE/tW89WqqjaqzODEkibWvkRbLLVewUa0uw4u0
	A=
X-Received: by 2002:a05:600c:310f:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4994e73cc33mr139825935e9.5.1786014222666;
        Thu, 06 Aug 2026 04:03:42 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4994e73cc33mr139825345e9.5.1786014222222;
        Thu, 06 Aug 2026 04:03:42 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e980559sm118088885e9.2.2026.08.06.04.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 04:03:41 -0700 (PDT)
Message-ID: <0bd2ab2b-a664-4de6-9acd-5a7fa08c8bc0@redhat.com>
Date: Thu, 6 Aug 2026 13:03:40 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/6] openvswitch: remove support for legacy
 tunnel ports
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org
References: <20260804182049.2289754-1-i.maximets@ovn.org>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260804182049.2289754-1-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/4/26 8:20 PM, Ilya Maximets wrote:
> ovs-vswitchd doesn't use OVS_VPORT_TYPE_GRE/VXLAN/GENEVE with the
> Linux kernel module since adding support for standard tunnel devices
> with COLLECT_METADATA back in 2017.  The code to use them was only
> activated as a fallback for old kernels, so not used in practice.  And
> it is now fully removed in the upcoming OVS 4.0 release.

Given the above, that ovs-vswitchd is the only legit user this interface
the change looks very safe to me...
>  21 files changed, 63 insertions(+), 874 deletions(-)

... and this is a very compelling reason to have it in ASAP.

/P

