Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E14349AF3
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982300; cv=none; b=f0IjD12oVQBRA98I22zmex/zscI8+uskVvgmuY7yIq1PF9qd1dV84NRONBCg1TObUcv80z+TVKo6sVHLM6Mw2AoPHHpnnSrTBv/7Z5+xrN3ERvwmnZPBti7VN8qt1p5v23IJVMnc+Ptdmyi4uoKpgniHMgaqlHo19rqkGa3nkWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982300; c=relaxed/simple;
	bh=yvTAb2zyJxbyGLlRHGT89BitSAH1SZdALJsqlZ+b2z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3PBc5q6aXVAQYH7ysysTXjxpCtvIrTMMGedDvh4ieKtg2nv6VETJ3+pPUDZr50TIHihMQnjkw/sz5l+0QkUUwftL5mXdCN2jNci5Md//jesTGDwjANOsx9zarss1xel71UUNsDCO6Rx8H0hp+pmQelRahZlXFsHc0L0hbs7lQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3DMvwDV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7P1G63L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3DMvwDV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7P1G63L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768982298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxvpO7SuR0Srs/NDxoqT0f/eYAD5mZdjyHg/RVhlFCs=;
	b=c3DMvwDVAindHXglwcwdgszjrOV8/vecj9EMP1aLixRty6MhR32xsHHcr7hv+AELvtEG66
	ft1y85eWuJ6VlZ5acUieIugLqeoVf9mhVD6HmgAmTk3TQkbzf63TjTKwQVM6fsqEJx0GWK
	j4hz8tBYNyYwpqauJseKKrha4VipfdE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-y_MxR9Q8MCCN9y9qUDZGdA-1; Wed, 21 Jan 2026 02:58:16 -0500
X-MC-Unique: y_MxR9Q8MCCN9y9qUDZGdA-1
X-Mimecast-MFC-AGG-ID: y_MxR9Q8MCCN9y9qUDZGdA_1768982295
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4801e3aab32so31162525e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 23:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768982295; x=1769587095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxvpO7SuR0Srs/NDxoqT0f/eYAD5mZdjyHg/RVhlFCs=;
        b=K7P1G63LGX6IvHLuqQdZZEm28D5707Ixxr2p9sk9M2pIdU//6UxhnbEe1kI1P9nbAf
         2VuOUz3cPpkGv/iI3b9YeWgDGZqKQtQA7w6jjJwky9iTnUa0nWNH1PiQTswza3Vv+b/F
         k94V8Js3H7mMO+zfxlF3Xfms5FbYvuNTsrnVU90nzEm/PY1oLDYtrb5M/IeVxkKg2h/q
         aucKT3CiEmF8IfgjYufgmRW7Q1uAnoq/F8z28Zv/aVJrzUcExpKtzvyF0ecUsif7qhgd
         I3pY/R5OYvtw0au+zAZ7Ti30v7cbtJyPagD2o9mKyNuhHT8xe/PUCQm/MGfLQMnd1i1f
         CBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982295; x=1769587095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxvpO7SuR0Srs/NDxoqT0f/eYAD5mZdjyHg/RVhlFCs=;
        b=pLFZvhenL6sWqOK9ARSRXoeCLolw51s97903z7TM+6uj6TZWgD2pAIIxRUEGilpXgQ
         1HKILygVz3qyqKSjs0EUHDAxltQkUnyj2e6LAQaR+BN3LEcbBqpF6p1UvVHPCTqxzSbl
         YjuLKZWA3mK0fzrAsBgP0h2FrW5AA7Y/CoBm4PphVe76ybuCCLzNLJEJhazP71XzH6xy
         UmfC33FBldD/uXib0y4DnSG72YqOJrIw+DTlkUeuzKvTK+U3DdInBTwWx3iiYVrWxJbV
         caaW31T6vg85JrhiuXSHM7efYEFcV/WzSB5E4vkPGA2tkEaVDo7TIs8fWQe6/o/to8aI
         w86w==
X-Forwarded-Encrypted: i=1; AJvYcCUjxAnj2yXtu4ER8tME0rr+Tq+dAoElAYlG3P08Dh6CCf8LPHqUVMbbGcmaNef8DfAqm/iPDH0UZvur7YVpYXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHp8S/HoTWI3FEsPntZhzWc4pjgfn5dR18IxzdXAt/cDKXytT
	AkAcAzfshWBBGKW2aohxbGr5cCtJZIVsnNkiTNiOn7TsNCDrjesbgch+gf6LeG2TlEdxWI+kjdk
	4QVXU5WtEOtxs24etICTGhM6a3jFoXpYY72eVcwtQWOgmXSM7+QDrDqcB1k9aqhORqbZbJg==
X-Gm-Gg: AZuq6aKd3sOLnmZhRWD/8+bMgvJsyh5QCmvcmgx/L4uPZ6euNpC2hQC4Z7X7tF6KsIl
	O/C5pM32vCGYjJDf9fX50UcZ0rZc+trL7JiNk/lUK3Pchj2lPTHBWPFFKG/wvWMFkhNnGcGPIxc
	+q+JCnDFXoQ/vhO7iGZXjG4W8dzang6HYbjaIYMMQM2oJXzxVCLkQqREDNNGVjFCNTBWEeEPqZM
	vvP1tA/SB0ap/WjL90K1LOqH4vsH847jzcAz77RFBjyF8LLGtb0FyWwu734Fq9dSOXA/0JgBF/a
	2GOVrj+iowCto9KUrHMLulGI1Kthvc8Sx1vN5R4GC2dOlLqngmRWbuQAMNJljKKiE26UNsvVFPX
	LEOE+ddzhOjgz
X-Received: by 2002:a05:600c:1387:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-4801e30ba55mr255746875e9.15.1768982295367;
        Tue, 20 Jan 2026 23:58:15 -0800 (PST)
X-Received: by 2002:a05:600c:1387:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-4801e30ba55mr255746565e9.15.1768982295020;
        Tue, 20 Jan 2026 23:58:15 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c56f4asm13906205e9.15.2026.01.20.23.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 23:58:14 -0800 (PST)
Message-ID: <eaac2f5e-842e-4a18-a7a0-8a7ba2794ef9@redhat.com>
Date: Wed, 21 Jan 2026 08:58:13 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 net-next 2/3] bonding: restructure ad_churn_machine
To: Jakub Kicinski <kuba@kernel.org>
Cc: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org,
 Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Mahesh Bandewar <maheshb@google.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Liang Li <liali@redhat.com>
References: <20260114064921.57686-1-liuhangbin@gmail.com>
 <20260114064921.57686-3-liuhangbin@gmail.com>
 <20260119122203.5113b16f@kernel.org>
 <71e30492-7644-4d4f-aaab-9a505f8faae3@redhat.com>
 <20260120151109.2d483bd8@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260120151109.2d483bd8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/21/26 12:11 AM, Jakub Kicinski wrote:
> On Tue, 20 Jan 2026 09:29:14 +0100 Paolo Abeni wrote:
>> On 1/19/26 9:22 PM, Jakub Kicinski wrote:
>>> On Wed, 14 Jan 2026 06:49:20 +0000 Hangbin Liu wrote:  
>>>> The current ad_churn_machine implementation only transitions the
>>>> actor/partner churn state to churned or none after the churn timer expires.
>>>> However, IEEE 802.1AX-2014 specifies that a port should enter the none
>>>> state immediately once the actor’s port state enters synchronization.  
>>>
>>> Paolo, how do you feel about his patch with 2+ weeks until final?
>>> The first patch is definitely suitable for net. If this one is not
>>> it should not have a Fixes tag. I'd lean towards getting them all
>>> into -rc7 if we can.  
>>
>> My personal preference would be for 2/3 landing into net-next: the code
>> looks correct to me, but refactor has IMHO still to much potential for
>> regressions do land directly into net and the blamed commit is quite old.
>>
>> I suggested targeting net-next while retaining the Fixes tag as we
>> already had complex fixes landing into net-next in the past.
> 
> The appropriate way to delay propagation of the fix to add:
> 
> Cc: <stable@vger.kernel.org> # after 4 weeks
> 
> not to merge things into -next.

I went over the code as carefully as I could and I don't see any obvious
problem, so I don't have a so strong opinion vs net, but to hopefully
clarify: my thinking is that this is net-next material because it's an
invasive refactor with behavior change. My preference would be let the
code be tested in next/net-next for a while before landing into mainline.

/P

