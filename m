Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84573570B6
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898609; cv=none; b=mK/dbSt6wvykSwro5LBT0K936u2FVQ3rrEyY+3Qcd12gHQda7jJH4pzoKBYCOCVaOcWLZyoHJlNvqbyALmEPMA+jiOAuE5j9Mpaf+kr27UFGus1j+3o2IQUoFn2wgnmpQL65u6XyB+nyJpkOAlVdAF3yK4J8ul74ReQM2HHCcmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898609; c=relaxed/simple;
	bh=JWljiblHKdW/kvLi+oANTy8OmaENQH4T3UWSJZWjvFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzCAbRzhHIdwbJpETuvQBT4H0sAS04jJI43XUutg6Kz8KEWAu4RbEmtMa0t8BsGComkbdrErjdqdROrGbykz45BBLNdFxiKNLdDaB784pFjEifWfKa+pYMTc4b5Ll2p+cddkGJ/RboS7JfyLD++pK0By6igiUlURJ5dxvvzeUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eiP9VDfq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=acorpGF4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eiP9VDfq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="acorpGF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770898606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ASZtwC4Jr2vY7rfr/wbGtVzwGSZEjBKWQrjrryCwDs=;
	b=eiP9VDfqbtlvai58YJ3XwBgfuidAfFpKf/EHQo2V1qH1lZs05qvPnHXxKwXYqRNjbT3Fek
	uZykAkq/pUaCRRjdTYUVwgRVuD0nV3ctkUBdKIO5EQE0diB5j+n5r0RI4LXSMUO34OSRyi
	9TtZgXbvP/u/HPDPmg3z14ZpAfV9H0I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-BMGoR8G6PIKIGixlHtyeug-1; Thu, 12 Feb 2026 07:16:45 -0500
X-MC-Unique: BMGoR8G6PIKIGixlHtyeug-1
X-Mimecast-MFC-AGG-ID: BMGoR8G6PIKIGixlHtyeug_1770898604
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-480711d09f1so41510585e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 04:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770898604; x=1771503404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ASZtwC4Jr2vY7rfr/wbGtVzwGSZEjBKWQrjrryCwDs=;
        b=acorpGF4kFx8o5/6t6OW4yUJji1mF9Tl9Vmid/46M0+rLwid8Ej469iqO3ijuBwdwK
         I4KdrQyydVq8GvDiKUTj/XYffmtfMj5IgtbtwNLi5+snAprHLtZhaE4loJqrhN9tMN+K
         Mf/bZT2uZi+RcyNmLR1BrMSqnRuj5OqN3QX5UVE/pe9IW3QMG9UtZX7SIg5t6S7HoQph
         VGRoaxwJrGRng4hKiJxEkkCpGUAloNRL1d7sY5g428MD3lIXiquXKGFqQP3RjQcO2Xwn
         AOVR9+xbQj5Nt+XEeqT8PoaWWG1Aric8NtLcOpU3nIFInH5jJ2K87qOPMEp3AabuU/wu
         LteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898604; x=1771503404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ASZtwC4Jr2vY7rfr/wbGtVzwGSZEjBKWQrjrryCwDs=;
        b=Si07SlLkhQPMNYA+vDe3oR+Yz8WQPTWiQ5m2XOXIwyiDPF+gMoWGLSiCs6/k1n8r4/
         4uD3yilIjCpc7oOXWhtZlyvVerCh1D811wj6Rd9MwQNTYCxrdLZUkljXfUCoqSKLSq8H
         vIWkPk+NV4nrhJYOjT9fFQ6p/MzPxm/giGgNXlIKPu1xT+g2GssTraQZgRa29YgUVEkh
         0iMsKmqWecgrFYZa0psokvqccg0VdvDQO3mgzRn4gSb7OgqieFUnNw7fsn72h6vO6TOc
         GfBEIq5/vAkhcmg6Rn4AKtMca2GkhV0qxvZTSy2CuUlNBZAbJZfU2csQDlCGyrNOyd5m
         nHVg==
X-Gm-Message-State: AOJu0YydK2zBncE6aDx00pkeFU1TjAsJFSNZOZD5UmH+mN2BC3Qnwmz3
	2Er31ZzjwGSS90d5ucEH2codRgS0/q/MbDbuF83RgF+ExvPob3gNQlM933PezRjH83nBh8rNNaw
	LQAC98yqzm7qq85p8dGnrhEBjyPjh1l73rD/UgO5DAODjfmpk+vj86PXyVn6W1BKDExFYbw==
X-Gm-Gg: AZuq6aJOFqIywU5jiOFVro2cMtVUbzfZhPIWU1GMtQpRJ2XdsCLvRmgT0EBRiA1Ktkb
	nG0ggYZNxNnjGJLzSrrS9DWXNHPMptHJ1PacHWV31a802Czai+vO//rN+IXSa28JZQZmtQJJVy0
	c+vt9drAwEvub8XD12Ho8i1FO74spa0rKiyu7/CwDSSm5M+JdZVm3ijY7IFzwBfq+mirOGDD8uf
	XgO+Ct/z4LmqBwKJm65FaHkPm8DsnpYAzYUVuFJvKk/N98K5+EzQmuQQgKPTyNKyt5DwfWPoEEm
	5fVaCS0ilT/yLG71tyjevanHc1/Tzy9oqNzvpIxmHsrOm2/R+rJrANHrHye1P5w4JxjUWSn9IyI
	q7hJFuZp0owt6hqFIpwqPn7ZRxA==
X-Received: by 2002:a05:600c:3b12:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-483670fac23mr28141745e9.3.1770898604174;
        Thu, 12 Feb 2026 04:16:44 -0800 (PST)
X-Received: by 2002:a05:600c:3b12:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-483670fac23mr28141325e9.3.1770898603714;
        Thu, 12 Feb 2026 04:16:43 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm365332535e9.11.2026.02.12.04.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:16:43 -0800 (PST)
Message-ID: <e52a10e2-b208-460c-a3e3-305b91433531@redhat.com>
Date: Thu, 12 Feb 2026 13:16:41 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/4] net/rds: RDS-TCP reconnect and fanout
 improvements
To: Allison Henderson <achender@kernel.org>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, edumazet@google.com,
 rds-devel@oss.oracle.com, kuba@kernel.org, horms@kernel.org,
 linux-rdma@vger.kernel.org, allison.henderson@oracle.com
References: <20260212053230.1921241-1-achender@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260212053230.1921241-1-achender@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/12/26 6:32 AM, Allison Henderson wrote:
> This is subset 4 of the larger RDS-TCP patch series I posted last
> Oct.  The greater series aims to correct multiple rds-tcp issues that
> can cause dropped or out of sequence messages.  I've broken it down into
> smaller sets to make reviews more manageable.
> 
> In this set, we address some reconnect issues occurring during connection
> teardowns, and also move connection fanout operations to a background
> worker.
> 
> The entire set can be viewed in the rfc here:
> https://lore.kernel.org/netdev/20251022191715.157755-1-achender@kernel.org/
> 
> Questions, comments, flames appreciated!

I think you could resubmit the first patch for net after that Linus pull
the currently pending MR.

---
## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v7.0,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Feb 23rd.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer

