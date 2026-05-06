Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C47406277
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081546; cv=none; b=icmvR3pc1415jcnZh7FjE9+s4nDud0BD2BmcLO3rN3H/oHfc/CZjbBFQnMUqiqK6dYvdUKfG5LLeFb+sXEXOw9FX+giwWxYkvtM2sl66HjuLb7biCHgBHhm8xWEeJ/eCUIwIhd/N5pVzOphR6OhXRnd4hXsdTE655NdL1w45gyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081546; c=relaxed/simple;
	bh=6B1JDvhMshkikE3fZUzsq/DnpD+6Z8qzfXdxsT5eDSE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DCEk3eigQeY5DlUYXvT6K0iSzjCaxhvnH99umVsmDrN0j6TF9VE2I9dyC6IN40i1r0whX7/uRzGDlwzSRS7FGXuEnxrhCQZjGTeZD/t3NEGEx44eLvweYlRxcyC7rwIojnaj83Ftr1NbYG/5DH7Ij0GVe9rdwy3ZIDyltEkuUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZO9TXiOP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=poI9nu6q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZO9TXiOP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="poI9nu6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778081538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWPJjdL+Se4qf22augp+8U/7BbRvhUfZs7hvq4GmhQ8=;
	b=ZO9TXiOPDXhttOA0Ln1RQVrrdbF+J+Fv3Se36tSA2UZmr5IRyXr5JS6QUB+TweTiQYq37q
	7RSWkUFL7eGIs1dlWY+ktd1PqewbRKsMVTO+4TZV5559LVyPejeDltvdZjPNPhJZqkR5RK
	2ZCERacy6L+q/gQWHOF+SeTYQDRndPQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-7Fmz6nFaMCCJC3HPSMg_bg-1; Wed, 06 May 2026 11:32:16 -0400
X-MC-Unique: 7Fmz6nFaMCCJC3HPSMg_bg-1
X-Mimecast-MFC-AGG-ID: 7Fmz6nFaMCCJC3HPSMg_bg_1778081534
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488d8deb75fso54919565e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778081534; x=1778686334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWPJjdL+Se4qf22augp+8U/7BbRvhUfZs7hvq4GmhQ8=;
        b=poI9nu6qHVNBnpI7t8Or5YOFC9c+vV1IzskQTsWQF9+6YMLFO+xZBU3HY0TZyvb1/8
         Qb/raVLmD3TrfI7YEmeQhBr1F2QWZGlE9SP9Q9P+VmGqRK42NFu6JBLLLuy09O+uxN3a
         8/IJDGuMSL+IXQvO50e00e4YI0hX3l32VRpBeCEA6kEWtn/x77fUG5JjYRCtfL/LFQTz
         INMTA7wCFvBIfji/r+XTEBaQpZG89TiL7kbl5p33dhUEpQO7b8wszbyNDDf08S8EOXWi
         Ip/dPIBY2aoEtl+nfke0dHjzX/1lP/G5qGwAtJfamsRetynpNjVpdurizLI+JwGMxni5
         9bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081534; x=1778686334;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWPJjdL+Se4qf22augp+8U/7BbRvhUfZs7hvq4GmhQ8=;
        b=WhyL25A4Nz9EX/eJXlkecXeDfUvlhkwqCyXCnmC5xGz8Qune0gtrBIE6cxypY1JTM/
         cbKYEuSQz0WEOuDpq9BEdC9S40p4DJX7F+2kf3dXjezNwy4xN9+A45r+L6fUPQYNIkga
         6UtCCjR6TVtn4Pih8aX88QUIUu2JYND6RqkL2omLHoyaBd3AE8d5JpiFrc+94k9FSpG6
         /s0UN6WsGJO+hI8nT1vReYFkQZdxjk2GG9R6l2ZKYMuvPbuUjuCNVgJPbDqf8nnnFLGS
         AFZYkMFbPMrQNJ0IebFLJHnath8Jp6YgObr7y/02e9bVzWvpHIp67hrZ+ys2ZI66ygpt
         8tuA==
X-Forwarded-Encrypted: i=1; AFNElJ/BwjZ4ry3fE3Dy0FiDsF8Hqrguqtiw/UeHZwYVDgM4j1DjK7GsUJTE+9voIVITN2tXyamoZokpIbR5wdwgxfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSZeHLky36B3WPeIY8rFcy4sPRlMicvgBq+mmE7IC49SxWfga
	5tOlEpGp2M+T63M9QOkPLG0FL8B5NxHtq9T6HNOzOIvGHAFnzMsHOJ0vIWtUxhEybfK5E/+k9Xz
	UVcRd6VSC3V3pu03HflAWCv+jn6UWn5rJnwNGSztByHaaGB7SMZqPcxsxxgO8XKd7ic4qSA==
X-Gm-Gg: AeBDievN03uXA0N2CVBKuD7xXOVkKHzpcrdiZePofPjyLH1UbSjNg/qiMB4TyWCjsvO
	v0rs8HJAMMTDK09rfVVDUm71O4OMqBV3Pm/LV9Z1CKSHIMbwU7tQ1kqshd3IdrciOa4xNX3BSRw
	Ka4QfWvvJPkBudegClplzLj9S0uoYU5CpiFz0piMWpfwEfiFHDp7iblIjLfiXH7K38rhhQG3RyG
	PsGoMzn0ymEXRqzlxr5qRT2yeR8zN9NmSPW8uPc3yA1rK+yca3JFQ9kbhH7oVnqVWAwEcLMCAtP
	IF5clFtrz7STsWX40y6GLyn8Qx5YMuw0Ciu2JM4j0QU+heWJOh3x2lZP1wQmsfDFb40T1Ug1Wi6
	JYnqRTwl/BhxEvi7WqK/31H7Gv99vWCk6Kq4InhvjQvgdFOpvgw9Ndn5E2GE/NdQHROc=
X-Received: by 2002:a05:600c:4996:b0:48a:5821:5ffc with SMTP id 5b1f17b1804b1-48e51e0bb6dmr41569965e9.2.1778081533816;
        Wed, 06 May 2026 08:32:13 -0700 (PDT)
X-Received: by 2002:a05:600c:4996:b0:48a:5821:5ffc with SMTP id 5b1f17b1804b1-48e51e0bb6dmr41569375e9.2.1778081533302;
        Wed, 06 May 2026 08:32:13 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53116a9fsm28671565e9.8.2026.05.06.08.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:32:12 -0700 (PDT)
Message-ID: <af591664-bb26-4b1b-93cf-cbcc68763d5e@redhat.com>
Date: Wed, 6 May 2026 17:32:10 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 04/12] net: shaper: try to avoid violating RCU
From: Paolo Abeni <pabeni@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 davem@davemloft.net
References: <20260506000628.1501691-1-kuba@kernel.org>
 <20260506000628.1501691-5-kuba@kernel.org>
 <59b26f1e-efd5-488e-8738-15e96b9c79e4@redhat.com>
Content-Language: en-US
In-Reply-To: <59b26f1e-efd5-488e-8738-15e96b9c79e4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/26 5:22 PM, Paolo Abeni wrote:
> On 5/6/26 2:06 AM, Jakub Kicinski wrote:
>> net_shaper_commit() overrides nodes which may be concurrently read
>> under RCU. This is not a huge deal since the entries only contain
>> config, worst case user will see inconsistent config params. But
>> we should try to avoid this obvious RCU violation. Try to allocate
>> a new node. Since commit() can't fail fall back to overriding.
>>
>> Full fix is probably not worth the complexity, struct net_shaper
>> is around 80B, and the allocation is with GFP_KERNEL.
> 
> I'm not sure if even this variant is worthy?!? The scheduler tree dump
> could be still inconsistent, as the dump is not atomic. IMHO e.g.
> inconsistent weights in the same WRR group would be as bad as
> inconsistent values inside the single shaper.

I mean: I would simply avoid addressing this RCU violation.

/P

