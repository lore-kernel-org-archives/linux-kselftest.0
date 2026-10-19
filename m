Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4884AA1CC
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401629; cv=none; b=AvJ8BNgwgIUG/bAamkhO1t7E9mS4q1QhroaXz6jYJrhOJ+nHDZU3iFypkU5yetuOFl5zyeFb9H3u25QmvitgZmzM6p0VCvixOlfmExjvZOHjLWP+HDR+4qyf+IAIMqmXraEYZyKImZU+XF9uWWWxb6kk5yPUuwasRwOEWFIEwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401629; c=relaxed/simple;
	bh=23uLVGVu4LenPJTiUbtiHkyS7W5/ZO7Ic3YJWLzrJ8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FtPylIdCekc0M2cXDTS7S7MFxEwrirBTL4JEc6wAwY/jXworKjuzaD67SqdsBST+yHobmdgG+cHXUafgm4VwGSfEsjBPlBn5YvjmAlHMfzRZ1wvW57Wj2CrkZ6vRbunOwEYLFrOxeBiUXa61yuTVNXWuFzJwIGOcMP7nwpeWjXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=N7B4PspO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="N7B4PspO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40f29667e6so102770366b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792401626; x=1793006426; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rCnbEw2lvBYbntrA6KDS3EO6vufdqSnBrzMmqli8drs=;
        b=N7B4PspOq9/uakZFaemK5D2GJIoFlyDJz0JsUXxdX31t+m2Dauj4XpS2EkeuQKOdQK
         wh7Nw7ttBy4ELbOtSYNv8tnTYh6+p8NQEB5WFUDhN+wgg8VqjjLwl5bqhs3xCbmGIXKx
         i5QjNH6U6AnZPuLL0e/Y7IC5j52uMt7wcpWCB9Cn5qTDwwoTYn8+DMeTwvi/gKrm1Qby
         RxDIrBARe3ujeUbAo6+zhot+jzY4erZQvdN7Fq3/DJQB9OVOdot7wM9Wyq2W/n3jETal
         u60AD7/aJeGZi9MJ6nJC8JFXUDR+X2dZnTavmhaaE3doRuAzwmg0F5ZgFW3A8pUd4/ye
         r6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401626; x=1793006426;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rCnbEw2lvBYbntrA6KDS3EO6vufdqSnBrzMmqli8drs=;
        b=wor9iGyxHTMUVGT85wUy9W1wvVBublfgoIXjWAL7AMMFw3BSEZ0oWyw8DFvyu44Tli
         DqJZacr0BN78FhCr8zLy0Pfuym7L9E6qJRLbh0BAgkxdk1sOohN8Ssn39QiPgGFcWXbU
         BiFzEh3pDlfij+mOnOmJJnn4fVysUR0jQYZk0oCABJycKgr6f/maw2ipxgZYR3FiK5L4
         rN+xzttQ75OIh1pbcx0KvvpwlcPc3LrbmfwOXdfe4yMGM3Uw09zXQZcRvgMRhmseKliK
         wERSxG63q+BeZPiYgGUqJtCIw6egrlWz+uKyC1m5+Tn2nTQmIjEJIQeu+1Kn3W1PuL86
         R22g==
X-Forwarded-Encrypted: i=1; AKwUvBzNFohuR4MxzV5XxVvFIOiK6Z+qpxs/td1JsinSJkfiheVns8DL4zAz3hH46IoH3OXoeMhQN8shB3n52R9ogh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYImLJmwvD/WYXR5JoqWKuA8y0k4y82pCbtZOJXLmU+byJWYPbtK
	SsnkXg4OORZCx6QYHY9b9nYSxS2Qz5b8oYNPPUETrF2S81OxRVk+VrydUkUXW/rA7rE=
X-Gm-Gg: AYBFou2UIHl4ParSAw25jJAILSm7n3yxrBka3g7L0PmjsR8hP353Dfvn64LBvn8v0M3
	ZfAbu0ZIsWZKvq6sDU3Bq1qCFHn330w8S5gVkVNVrg1Tg3FO8F0WW8Bm6W31L8dTTH3V+uYQRpE
	vzBY3s7G5tEoLCwC6QSzWRfVMTUSd5o5imgdXJ31azXDB5DFoB9oZWee8vexT285WvzY1TZ79Z2
	fogyEx1+veEfYAmQng9nvYMPBTgyHzfKSCaCEMMbDmZnjBN6I9ysrh3kFf26EIbmR8IMIGG/X4a
	9QRH8f+80tzmOjiStWgLbLmaZ86Vp7C1Or456T89Wwc2+FkrNcbu05nX/yb1P96Vwhd+oOfklsI
	zNM6MRUhzkDm6YY2zATnibekMly75E7KEd3w58YGTl1tnhLV2IySsQzPbhtMEAtv5LGJJCs++CY
	7SdPRiOW8Bxsks0AjStGypVEBxKDuOwBw9Bjq5q9tmhvI/edNV+8neivbM2qvT
X-Received: by 2002:a17:906:ba89:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c4196dac03amr433604866b.0.1792401625664;
        Mon, 19 Oct 2026 02:20:25 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:5067:2dc::49:220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm342196266b.61.2026.10.19.02.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:20:25 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>,  netdev@vger.kernel.org,
  davem@davemloft.net,  edumazet@kernel.org,  kuba@kernel.org,
  pabeni@redhat.com,  ncardwell@google.com,  bpf@vger.kernel.org,
  ast@kernel.org,  daniel@iogearbox.net,  andrii@kernel.org,
  eddyz87@gmail.com,  memxor@gmail.com,  linux-doc@vger.kernel.org,
  corbet@lwn.net,  linux-kselftest@vger.kernel.org,  shuah@kernel.org,
  linux-kernel@vger.kernel.org,  kernel-team@cloudflare.com
Subject: Re: [RFC PATCH net-next 0/4] tcp: carry a BPF-chosen identifier in
 TSval low bits
In-Reply-To: <atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com> (Stanislav
	Fomichev's message of "Thu, 15 Oct 2026 14:45:02 -0700")
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
	<atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 19 Oct 2026 11:20:24 +0200
Message-ID: <87a4oaf3mv.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hey Stan,

On Thu, Oct 15, 2026 at 02:45 PM -07, Stanislav Fomichev wrote:
> On 10/13, Willem Ferguson wrote:

[...]

>> Questions for reviewers:
>> 
>>  1. Is encoding an identifier in the low bits of TSval acceptable in
>>     principle, given the trade-offs above?
>>  2. If so, what feedback do you have on the implementation?
>
> Don't see any feedback yet, so from the top of my head: looks like you
> control two sides of the communication, so why not a custom (bpf) tcp option?
> Would you need that on every packet and it makes it expensive?
>
> Or any other field you can abuse maybe? IPv6 Flow label?

Nah, we don't control the client unfortunately.

Client here is any device that connects to our edge PoP.

> Implementation-wise, the sock_ops is going away in favor of bpf_tcp_ops,
> so BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG is a no go.

Yeah, we have just recently realized [1].

Thanks for feedback.

[1] https://lore.kernel.org/all/877bjk893u.fsf@cloudflare.com/


