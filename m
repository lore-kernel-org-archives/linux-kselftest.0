Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D0382294
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711984; cv=none; b=mbRFaBerVKiO1z3sfYbp5qEFQoHiWWEqoYy3uVmvBwK4ZmZ7qCbUe6Ru0QmGplJAE8hUrnT2Pp/ZyQutjpSsWTznBtmAohyjpbX9NGcSrkZWzrmi94J53rQB9V5wMB65KPfJfkTpzX9G+PK2SOjhNDI/RTVbnJqNKWb8JTQVr2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711984; c=relaxed/simple;
	bh=XKd3/sBVdFq7scHu0YsvYg3lOUwCrl49yVJU6hxqojc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sHstHLGUFuhCOqTdWp78n4UCpJmZ8N3O91AhGeHMfEpY9uqlur79XP/wwrWMnAQMQhK+yz8F37CLwwB0W3LMTHJYT16iJ9vc06dY5XjMil1iHy5d8LmFAK6/vClABMtNhbBb4eygTv0qzSiO19hL6bbzHvRNSBf5UP8+a4AaPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/lOEKCe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3Zb20dV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/lOEKCe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3Zb20dV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779711980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4hkd86DeSZBRxqkEKxXYxQ6Fg5bw2Xdd0Nw7s4mAqxY=;
	b=T/lOEKCeN8ZgBnQe8l+GICI16pqW+1ms7o1ohH2E2atpQ3Y1jZr+TlifjxqtH4vXoE2gdB
	dGBeXM9GX1638hjS/GKkuv2rOCbzFu+enuHLTa+u1FNqvK61BrTH9q+yXj4uC8ZTg6x4b1
	J8M0k6DfGDfssfLhZ8N1wotIbk7Wazc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-WfdUSulANJiSuTI7JRdajQ-1; Mon, 25 May 2026 08:26:19 -0400
X-MC-Unique: WfdUSulANJiSuTI7JRdajQ-1
X-Mimecast-MFC-AGG-ID: WfdUSulANJiSuTI7JRdajQ_1779711978
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49043386b3fso28487655e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 05:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779711978; x=1780316778; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hkd86DeSZBRxqkEKxXYxQ6Fg5bw2Xdd0Nw7s4mAqxY=;
        b=V3Zb20dVjHJQvBWw+ViTWlfBtxLVs3bMm4kfJIfFn9XNdNGTATFAh39d8A80NXn5dR
         DNETLpj7ygVeu/wGcu62/rrEP2ui9LQ+LsqnF5i/2944Q6Uv5P9K0uj9zmFoVH9NL90m
         9HORkLlFhjgtI0xk3DyMrCrxqNHZYICj2IRS7x8KJfwoN56uvy+9x65WRF79LTZ3fMfe
         PSztA/nd1BfF/nUP/0q2qxe2RAelscpyo3R6CgzbLtW9qKTjv2qDx4Aloi5Y/Ne13TNZ
         pKIuZ//AOi9NXdPFygtRPnKahv5G0WfD3MWymHcXKDNzLLqD+8PVWZ3+bVw32++BPcYJ
         6HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711978; x=1780316778;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hkd86DeSZBRxqkEKxXYxQ6Fg5bw2Xdd0Nw7s4mAqxY=;
        b=Q++hX9I8kusNY12eo+LaLVad2aLtlO8FE+nkYtRqrpNQaSBLomKRJC/lU5n9MuX+ab
         0zZyDjh/LVr7VYJEB/ZeEjFXsafcVwQs3WMqTRNkvfJBhdnafbebdcApGgkyar/yWnef
         OWlz7Ehi5GtZ3AdovI5thxfmnxuRNzzuHvE25rdYXf4RmlXUO7fSPJjpVFwnXmyVBZPa
         UUT7G7tQiODSlnwADSp/DH26jID2pIIIgijUOyuq4lrD+5DzP8BzDHSA2g7zXFBRz5ki
         IhAuDejWEC9hM42/LrxQtaWkM330fgJ3Ob4Tvls708/miOB3CShBt3ag1u1ZKjeuffM6
         T3nQ==
X-Forwarded-Encrypted: i=1; AFNElJ//Mmdmp+pXX9VX1YGiM9MvsGIthgIsZ5QdTD9jjV9dPgBrzl458Pocb+7ZDoONipTbwwXT44AMr7krN+cARhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEFDfJLloNgYRxAEyvM2jjdJIIpy51Ba9UX16gX62jd3oZPUm
	aqFXIsKwLJb0773ou5fXHyzhGMSfwitWWlJlcke1P9IPSO9Ldk4czSIa6vq+r5co+aR0RJv8Sbj
	2hrhKqx2QnjMH8JmvOS0HOE474f1GYTV3vlIP9MFy3vumyThUlTjccSa70eyIFkptjHMwbg==
X-Gm-Gg: Acq92OH2VabJzFjm52Xf+42iBDSv+eyOCkYD3GdzGOG+WwrNFAI415mZQpsGIUJf1cP
	UhvcaUlB35cNpwB4I3cuGZLs+nv+1d/BUh4TRAOvEd9nppMQcY3eZ7igto3AoMs0mhCWXw6Vuq8
	uSFjkW64yR0Lj0ewNh6zviMuPGdbTjp/O1AhKmj8ZTCaBF8pEiMbe8OfgzSYRLbgPGYQ9vW0DZ8
	i3TzNtyz27HEo7GvMbQk50o/P3F/8P+MvPrM71OWbj0LPmuLvxei1/rgmGqnYD4wdVmcDuMrlUW
	95QM0h6mIpptrxIwZ0fyqiJoi5pxvz8JphD0v5N30gjSUUoOf4Fyy6ytMr8IajGc3aYT7Jb5Irv
	yfQqkeh3ZJ+J69/iZoZZAg2o=
X-Received: by 2002:a05:600c:34c5:b0:490:601f:d775 with SMTP id 5b1f17b1804b1-490601fd89emr86929555e9.5.1779711977889;
        Mon, 25 May 2026 05:26:17 -0700 (PDT)
X-Received: by 2002:a05:600c:34c5:b0:490:601f:d775 with SMTP id 5b1f17b1804b1-490601fd89emr86929055e9.5.1779711977417;
        Mon, 25 May 2026 05:26:17 -0700 (PDT)
Received: from fedora (nat-20.ign.cz. [91.219.240.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49045282201sm272209365e9.8.2026.05.25.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:26:16 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Piotr Zarycki <piotr.zarycki@gmail.com>, seanjc@google.com,
 pbonzini@redhat.com
Cc: shuah@kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: hyperv_features: test write of 1 to
 HV_X64_MSR_RESET
In-Reply-To: <ahGPQDJCT1aW7vVY@arch-piotr>
References: <20260523111857.195396-1-piotr.zarycki@gmail.com>
 <ahGPQDJCT1aW7vVY@arch-piotr>
Date: Mon, 25 May 2026 14:26:15 +0200
Message-ID: <875x4bllp4.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Piotr Zarycki <piotr.zarycki@gmail.com> writes:

> Hi,
>
> After receiving KVM_SYSTEM_EVENT_RESET the test simply advances to the
> next stage without resetting the vCPU. Is verifying
> KVM_SYSTEM_EVENT_RESET is delivered sufficient?
>

For every stage of this test we're basically using a new VM
(vm_create_with_one_vcpu()) thus it does not really matter much what we
do after receiving KVM_SYSTEM_EVENT_RESET.

The basic idea behind the test was to verify that
KVM_CAP_HYPERV_ENFORCE_CPUID works as expected, i.e. the guest gets
access to the MSRs/hypercalls according to the guest visible CPUIDs and
not to everything KVM knows about (I guess we could've named it
'hyperv_feature_access' to actually reflect that). It, however, makes
sense to actually test side-effects of writing to MSRs/using hypercalls,
especially when it's relatively easy and I see that the change here goes
in this direction. With this, I think it is a good and sufficient
change, so

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Thanks!

-- 
Vitaly

