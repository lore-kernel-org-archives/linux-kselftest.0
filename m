Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14753537F6
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484781; cv=none; b=W8R4SyiM2cAbuwUbkp/b3XnzFvzKLgM1WKrcFtkCw0+BFyxZP695UUme+qeBtkQdqyMsrZDjCmrLvuy7K+p8l69x7W5Rrn/GIqASczsa7ufbRamwcNkRvBascYE6JwEnZRTeNQ/l2YMBhZxl/dONYemLTgM7n3u7nBd3zmSPQAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484781; c=relaxed/simple;
	bh=ltPFZOH3+F5GclvIiCsZJo9B3Rkn54SH6kgVTpcfOWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iIBWmq0JcMSK2G34JL2YM9Wk0sAVFncdWm8f9zN8jwyvBDg4Pc4WK8UFGDU8eSXEZ6IOwjpjy+BPBscvAfOx+C7Ay3mAC0t7jFpmMfybO1zrxnUASut4HHwAL5eea9Wvc0EsFsZYFsQ5z7Fu8WfPf4pMZfDXXN07LeJpcDqI4B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G8j6+2VG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SlZBLP3X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G8j6+2VG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SlZBLP3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777484779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=or10qtpHF5q4FsYpWyH8aqkdxHYxoqC0I1ML0azCPiE=;
	b=G8j6+2VGLryecSLBZX4XzXEYS2Sj6X7UmSsl7gl54xEUNymywtFG1tSLN5i5Qb0DKt30ia
	qwcZ8xTE1eOQphtJ55hPhvYsjDr4IE881I/kmA3G/adNcRBaXlRG3aF121hqktUF1zlWmC
	crGk0sKe0e9xyb+9vq0IMTs4UIv6ISI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19--cK8UUuEOlebe6Anaf0aUw-1; Wed, 29 Apr 2026 13:46:16 -0400
X-MC-Unique: -cK8UUuEOlebe6Anaf0aUw-1
X-Mimecast-MFC-AGG-ID: -cK8UUuEOlebe6Anaf0aUw_1777484775
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b934e96af9dso1341459466b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777484775; x=1778089575; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=or10qtpHF5q4FsYpWyH8aqkdxHYxoqC0I1ML0azCPiE=;
        b=SlZBLP3XuTCp2bzQvvEcYvgNI4iXEI5ycfw3lYvUV+HUF9P+SfOIYFJfzNJO7i1ZVT
         0EEmpSdj8UKKjFk/e/WJRasdxpfAUTkGRpmzGnZ2pf9up23tEKDydYPIHh8bNWIYLK4W
         xjcqTNhwCjMhp+p/uVIUfXP0tm58s9Rq+2sV8m+wm4ZHbjqIY9qJQPA4VttvwNsuTHGQ
         T8m6+Aghyu9R6R8GwJEOiSyQGFitLzUQBTvJk0cXJxIVH+f+WGX9mflcAcaeU6OjcoBs
         1v9bXlh4O4fJAvM0XUhcVSBSkgPmd3PpK53NWthKfRdbQgWpOUD7J1Dq3xX7aiRBDrdF
         HHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484775; x=1778089575;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or10qtpHF5q4FsYpWyH8aqkdxHYxoqC0I1ML0azCPiE=;
        b=kMCzX+pKPUhGeFBI2N2QTJhDme2V1ctaUu1+5Nj3WZBLxiKCti9R+oM4PU725V2xUx
         WEvBDlttrgMOnPbsAtky7RC5WHsWRsB7iuPsf0m52GGs5bot3ExgP32dA2KSwxygiNJz
         DbuyvAJSr8+vo6U6sovPwV2qYR6Axoep9d04h/uCkIwP8u+0Z6L4P24NGx4IjxSEgX/i
         As/w3a5E0JpJqEqRYiEegPTr8A+RX8Z9r/mv8FBNeBejVEL568LwFyKw2FhGtimaMgV1
         bC/RCrlfulYzXivRS8gXNfyZjPijluQpuL7brvQXRw9kz1KeKRAstWqLTa0blGRbouat
         g3Tw==
X-Forwarded-Encrypted: i=1; AFNElJ9aWdzwFjWlNGvU8GozNFBudTSCvs8dh/OOXPXwgVHNF0oooqFJHADkSRqxG4CrXQTdLHfBCqm/qOnkRyU1CFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29kod6I5iGO+8/86GCoznfjhhMpk4ZPTbsvIfPDj7SCq5gUrg
	sYbOXkCvelihs2fJWQP9HOR5DV4joHNWpvaNmtYnCEoOibdnw8iR3xhBcadROyJUe4+vUcTkUn7
	dcC3InG7XKXDxeQiMqc+rx768l4fVZO0oYR83/CZ66VExZw8p64Rnrz92rF8+PHzxGnoKfw==
X-Gm-Gg: AeBDieuk6QTpjaSAN8IgsYcaK94l7Sb9Wf7Ezyy2rPsFmOza17xDBfMurneJqgorOGw
	uBbPIwtYEm28ccnTqdVvcA/GXfDpozbyOPYQdnMTUUoszl5fBh0gHmncAAz/Ls3B3MQe0sijL9C
	A/svfvKI40k9AhjXR4bFEYAQssPBH/kM1pxTtB5Ewi6+LUu+5H3kN4Bni4VktZs2dNoH/AE/eef
	0SUnrMk0/kmhMcwo0GHqH0ZgIpazpKnAedfSvNdrpza9gVq61M5LjKy/EtkO5TT6sd81FMqQ4R4
	YepRMamNPYnySFo+tN7I6M3+rEgM/5XGPazr9l9+v6kzegQcXQO6NmrBE8fsCXGhxtY3UhaH+HT
	7ulNSJYVGrlxuLpmRV2kImO6uU3j4IUTWxHYZG4cEij519JicdoO2VdOLoI9V66brfr1O4KWozl
	ILQBgllw==
X-Received: by 2002:a17:907:1c29:b0:ba7:4cd9:ca12 with SMTP id a640c23a62f3a-bb8026bd340mr584860666b.13.1777484775195;
        Wed, 29 Apr 2026 10:46:15 -0700 (PDT)
X-Received: by 2002:a17:907:1c29:b0:ba7:4cd9:ca12 with SMTP id a640c23a62f3a-bb8026bd340mr584857866b.13.1777484774601;
        Wed, 29 Apr 2026 10:46:14 -0700 (PDT)
Received: from [10.44.49.209] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb980a6f9d6sm125280266b.10.2026.04.29.10.46.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:46:14 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, Aaron Conole <aconole@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Yuan Tan <tanyuan98@outlook.com>, Yang Yang <n05ec@lzu.edu.cn>,
 dev@openvswitch.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/2] openvswitch: fix self-deadlock on release of
 tunnel vports
Date: Wed, 29 Apr 2026 19:46:12 +0200
X-Mailer: MailMate (2.0r6292)
Message-ID: <AF80E37F-6D40-4D74-906F-196FBFE7A032@redhat.com>
In-Reply-To: <20260429151756.4157670-1-i.maximets@ovn.org>
References: <20260429151756.4157670-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 29 Apr 2026, at 17:16, Ilya Maximets wrote:

> Two patches - the fix for the actual bug and the selftest that reproduces it.
>
> I missed the self-deadlock in the original patch that introduced the issue,
> because testing required code modification in the ovs-vswitchd to force it to
> use legacy tunnel ports.  I thought I made the change correctly, but apparently
> something went wrong and the tests were run with the standard LWT infra instead.
> The selftest added in this patch set will at least prevent this kind of mistakes
> in the future.
>
> I mentioned, however, that these tunnel vports are legacy and not actually used
> by ovs-vswitchd.  RTM_NEWLINK + COLLECT_METADATA is used in conjunction with the
> standard OVS_VPORT_TYPE_NETDEV instead since 2017.  The code to use the legacy
> tunnels still exists in ovs-vswitchd however, but only as a fallback for older
> kernels and we're planning to remove it in the next release.  I'll be sending an
> RFC to remove support for these legacy tunnel types from the kernel, as they
> serve no real purpose today and only increase the uAPI surface for CVEs, but
> we need to fix the known bugs for stable versions.

Thanks, Ilya, for working on this patch! It looks good to me, assuming you
remove the unused socket library in v2.

For the series:

Acked-by: Eelco Chaudron <echaudro@redhat.com>

