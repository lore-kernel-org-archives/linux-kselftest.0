Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88873175A87
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761370; cv=none; b=qcb1gIKmFsshzq3dOUUAdh8rsU3CDCPm2IjD5cm8ZhTRLaLqEcRi3E+s9G+I/4nryQ6rcTe1SI6M19ZbfqO9WeT0IppVS+UuJF5bGG2EdPr95dtWHteMUj9Pmip55vAeYhETNLRm6RjBtdyXpv+S33c7ubzJJrVPcKt3jD8/2iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761370; c=relaxed/simple;
	bh=5JsshEzSWKkHHybeMjzuOi1TJBB5BJquoeXBOVXlaJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctlHJPVqE81YnfOy2IwvC8KRLbyWxUaY/qC54+4U2eFz20D3TXQv8fH1/Fb7GTB3FzFW3GYmN+LSZAa3CNBoOxcJe/5teUADk0GLySFyAWedabSdq+3qlrmXrgzCVTOtq9I+dMJGOdHviiQwuN006tcEilEEpqWyan7HoIbApgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZU3qDPJK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GUZBopwT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZU3qDPJK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GUZBopwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776761367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM9QpEa1glVvOOAGDNSNRupzn3Y+00X/KBAisgsGArQ=;
	b=ZU3qDPJKq1Ez26tTasFHZvjiaMP3B5FGUzu7PViUIhLAQA7md3EMCdVIDR+hwsXYn2la9f
	+K4hdb0+m280hx0LUWIgl1FgSBmIeLfDMQXht1x4uDMCPjVPqnHAs80OzN4UxkfhWFsPLO
	Gg257FMolqSFAuFeUbEGbse1+f6b1cQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-wDbTngNSNLCGefpW_8K3Jg-1; Tue, 21 Apr 2026 04:49:26 -0400
X-MC-Unique: wDbTngNSNLCGefpW_8K3Jg-1
X-Mimecast-MFC-AGG-ID: wDbTngNSNLCGefpW_8K3Jg_1776761365
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso584791a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776761365; x=1777366165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dM9QpEa1glVvOOAGDNSNRupzn3Y+00X/KBAisgsGArQ=;
        b=GUZBopwT2Lqz7xmtwyln0Wd/xOyF8y0E2AetOfdfdfE3a/V4x9LHEF8kU6vwff6/rU
         4HcCYwl3o3cDKthaYV3Nl5ehhZ8tpyvmvg0OsMrGUqq5d9I9I5NFPyeOX6hYU2pyU6cg
         GnsIC/tXAqK8dn6iPlxIkuSqO/23oSuX/YpnGUmCC4zsuKz0EAsO89ueo4s3QIoowG2h
         6fK//Q4mu9v3oQKBDDaxJpX8Q/XIJi2Awl7Cb8ZISXdYVZD7bVjQ0gTqZok7lJATJTuD
         xaphl4Ewmu9PBPHb9Smi7RK0+jGG4TSt2au+KyqA3TjvlOhKsIYcbO2EgF41LNDoYf0C
         s3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761365; x=1777366165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM9QpEa1glVvOOAGDNSNRupzn3Y+00X/KBAisgsGArQ=;
        b=e7olwgv3s9MBoMnEYSQx+EKlIIVa5qaoCh7mk6BkiNgDfIhcjlK41QmFmy/qUNzZVj
         N2QGk3EmzDIiGzCAVrJupOtoqEx32p2Iyjwb59wxxknVRXIMDDKcGmlvcf6Dj7MglkJH
         tc5AI57Xey0e5iOSSB1nwxtt4+dZaLOAw3B5QZdypQQcIqQZp8SkSgpHkMVWIR5EGcMB
         0r64rxQYZU+EftQyml26WWO0MJtQv4kcKhWTcZqbfutbx18+PgWk+ZyiDD6nIQviWTxE
         ftZwdBkrrbLOdvkndkLWqciasMgOLVNxxcikvdibxGnKj7ZCrbD1lEXQqxildhZi2d4b
         gKag==
X-Forwarded-Encrypted: i=1; AFNElJ86cRDyfFJG8YLvj1Dr4VxPu5dPEzSdavs2zHoOEmyW5t6hjQIPH0xuvIdwWQ7DYRXnZz7ifaDJA5XlY8pW4nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+HavfVD1w6LZOghjTxaDhNkXhSI8b1Pcg6C0oNViBNQMFy1f
	frFsCfJgls1RfrelEvQCZiYCkjYHByV7VUSjXvwN9xW+Cabhe+4G2sMSwoy6ePYnzhCReofFxeH
	Elcyi1a9JPb4Y+bf7oqBEddZtHN59B2sATmkk6lbKWe8yRP6OYdZJ83ftjA65IPWKLkLLjw==
X-Gm-Gg: AeBDiesbz+MOaRApgJaolMJFF4973pNq3yLssZjpxjkeW3Y4LIfc3N27+88EJGnPzRZ
	ubP9nlK76x+3otyJ91LSc2eL+cZRKZRCoLpoc1t/s/00ElkvhcXvlxvRV3hQVAc6e7pFhNui3MG
	I65G7SKHc3z8q9BGKJK2YMV8A/FZ4Q178pSzWQhU6cA8WPagv7SyYXj5HnnDMzbL0fBFkZTlf9o
	wOblQBP324EkWcTO1UKhmmS2SGYMwNgb6cyzOzokKaZTvgvNIYqOjO+ZPSa6UZIb9zegICObRtQ
	/roSWF2KQ4ZIZFMmRqDxPGhTVggpCVyWhVm78gosHOVxb/2GBI7CtwfRw2EKicz6ttkhf3ggYve
	68NSQ1iddZg/5myhXHymPFn90V3ps7MlBltXTBfqLPTs5eq7Y1G3re5kOUlBYlWTJnqw=
X-Received: by 2002:a17:90a:60f:b0:35f:b137:5a63 with SMTP id 98e67ed59e1d1-361403add26mr12204446a91.5.1776761365201;
        Tue, 21 Apr 2026 01:49:25 -0700 (PDT)
X-Received: by 2002:a17:90a:60f:b0:35f:b137:5a63 with SMTP id 98e67ed59e1d1-361403add26mr12204426a91.5.1776761364789;
        Tue, 21 Apr 2026 01:49:24 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141869e88sm12675045a91.1.2026.04.21.01.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 01:49:24 -0700 (PDT)
Message-ID: <d306bbeb-141c-4a44-bcc0-2e2c5d51efd5@redhat.com>
Date: Tue, 21 Apr 2026 10:49:12 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 1/2] net/sched: taprio: fix NULL pointer
 dereference in class dump
To: Weiming Shi <bestswngs@gmail.com>, jhs@mojatatu.com,
 vinicius.gomes@intel.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, shuah@kernel.org
Cc: horms@kernel.org, vladimir.oltean@nxp.com, xmei5@asu.edu,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260416185501.647884-2-bestswngs@gmail.com>
 <20260416185501.647884-3-bestswngs@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260416185501.647884-3-bestswngs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/26 8:55 PM, Weiming Shi wrote:
> @@ -2196,14 +2199,14 @@ static int taprio_graft(struct Qdisc *sch, unsigned long cl,
>  	*old = q->qdiscs[cl - 1];
>  	if (FULL_OFFLOAD_IS_ENABLED(q->flags)) {
>  		WARN_ON_ONCE(dev_graft_qdisc(dev_queue, new) != *old);
> -		if (new)
> +		if (new != &noop_qdisc)
>  			qdisc_refcount_inc(new);
>  		if (*old)
>  			qdisc_put(*old);

Unless I'm lost, it looks like taprio_leaf() can now return
`noop_qdisc`. As a consequence, `old` can be a valid qdisc, NULL or even
`noop_qdisc`. In the latter case it should not decrease the refcount, as
it was not increased previously.

/P

