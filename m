Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CE33C18B
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776930633; cv=none; b=Pd/dtMri1SiFo7EndyUptI09/kAaeP9oDKRghJhg8xyIVnWv4VeBnDa1D0CpwEY3oDvLktEgvN3ZJFYK2pMSohpfEVgmS4y3S3a7jdJqlC0oUP33uTk0nenifcTqgp1goS/FB2U+bG0onvWDmM7E4beM00Ii1DHmEP2t1XwanxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776930633; c=relaxed/simple;
	bh=IgtwCmjndgaX5VLGbpmx2IqtuMX+Uwr5274d8PnIO7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V1jtLnKP61tkvE2t/bqoCS3cq5Wi/USItYVcS5Hun7eJin8fOAglXfKEJwzmIZaWuE/a5ONs4yEWX9jJ4R8g3fXt7NrCOintI/1q7CcsEYKn8sgi+TMFtnuWgdCQrDnW1hPUKWKAh5trWRDXYjdJbx7fdKddnr7PSRYQYwgVDkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QunwAd/6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aH9RIC6I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QunwAd/6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aH9RIC6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776930630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7M6hLcNsYTpn8pFlak44q94E8+lDHFczoYFSZXMpddI=;
	b=QunwAd/63TOm7YDPervaQaI9TzmoJ4FoBweyCm2zBuaosP4pAeaIiiTuSLS63taKzFWlDy
	phFCXzpWwRsY0T0cg4uBwPSoMQxKy3bVPk/sUG3INRymnyca/qbAfqXN5ynmG4BdpjzRoR
	BxtfpxyvK2A3xVqXQ9giHj53RuV8sZU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Yrjc-QbSPWG1RvuC3QQkJQ-1; Thu, 23 Apr 2026 03:50:29 -0400
X-MC-Unique: Yrjc-QbSPWG1RvuC3QQkJQ-1
X-Mimecast-MFC-AGG-ID: Yrjc-QbSPWG1RvuC3QQkJQ_1776930628
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso4265984b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776930628; x=1777535428; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7M6hLcNsYTpn8pFlak44q94E8+lDHFczoYFSZXMpddI=;
        b=aH9RIC6IMgKWJJ/9wsV9feHrNvlMacZPgZ01bFFqV10zrEMimmDTM/8ZeHKrmzgH2m
         M6cgg9Wsj8S8UmztldG0PkdQzjaDn5Ichql/GLtJwiGz0bN91B8sUHlk8Q/Dj8BIqfIu
         BRjhTI07WFuEaxUOSTJN/zzsaYrED1kqBSfSIY6wcmK1IMNVCF5rBgRQpvZllxC7R0vI
         lXV+80tUht9im8lbN+tJOXzaCl591sWWyyUQonWBwzWAaWUmVuHCQWioZu1UO/MrOMin
         b1FAG6agOiProfaAvy+wuieuttSfn2nDeZXLqUgVEgjRG21+dNBHHw//fzQgblpP1+B7
         aRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776930628; x=1777535428;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7M6hLcNsYTpn8pFlak44q94E8+lDHFczoYFSZXMpddI=;
        b=HOxCXHYyiQe8iXpV1Uorc+O/uunT3szTsyT3h6DpNzhnFyAxLmFfZXGL8Gw7Lpm7sc
         T7vkSdKtLRR+d5+qeiOZ2rdrnr9xBoIneGVkOkLFOLyWFjcAXd9rybDsEfIekgG+CoAN
         Lv9zgvC/l0UPI9wLO9BA65M4tYpWWsLLH7OAFPlqnWQ0JZ3DeNd35JJl/ldERe8u6r9Z
         86yBF74XwQ7EFJv8P3c2CZGETj8k5brBhmiN2u+Fg+FqfOpU8FmdP37DpRU/StXDOJxR
         ZmmilI4Hl4VRXZGAICon9GRV4eKkLqpw6cOlpaH6dKO52LirrrFyk69htlT35AUfPdVV
         r3/w==
X-Forwarded-Encrypted: i=1; AFNElJ9H025DgjjRUbNdHxDSWncZsUd+1Wl++/FbzEsz/VYZmqrjxN1qkp5Zml46mXwI/WrAlc07kxvFtKqCXTplwJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgN53+RxjFRiy6LFFuoF3Cxi4GDgZ0D7sVDrv+kQMpp2Zy4TZ/
	Q/yRXUy7B96FBGdeugDqU/66DCDxFVl4q/5REZcWvh5dMAiKcWuD5kUE9wIWJH2PK1XrMhUmwfR
	Z42GFlFv5JCkQYEFQF0gkJhY1YwEDVRaOgs97bYUlTXWsyvAfJtuZ/8Cm97W5JBOhnfNxxw==
X-Gm-Gg: AeBDiesCnmHO4q9sA6mhskkbK9+eF3m9B7TPcWfHxL1k34tn1whWgnmjXwmA4TrJDsp
	bqIT5Ohvm4M+FRptqb64PTEEmgfjUoxnY04N6sg6iiqdBFUrI5iKIZjThrCgHSOzvjgOOHUkoDl
	FsOLtD3PL3gDRjzLtebppzdHAWmqUqQx2wHppgg1nhoJ9sRoCyvBv2bHo7/38pE5SHibtILAsTu
	/Ub4gAcpdpqGxJxJ12A5PXhqMsbCuOmFMPnJcfJnvE0INom3uODGmGpUgwY3RLqcQIi19ypLf+u
	tdXjYhNx0ti2qehchZ8dCF15e32lnEFDZAbddoQfYex3qB7aGNcquiDf8CFJHXlq+NK533fVBr2
	Hf/vjkkXfKQS1PKcC1UtpYyFl3C3p
X-Received: by 2002:a05:6a00:148e:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-82f8c87e28amr25577178b3a.7.1776930628214;
        Thu, 23 Apr 2026 00:50:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:148e:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-82f8c87e28amr25577148b3a.7.1776930627699;
        Thu, 23 Apr 2026 00:50:27 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec23b19sm22580923b3a.59.2026.04.23.00.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:50:26 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Piotr Zarycki <piotr.zarycki@gmail.com>
Cc: kvm@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Piotr
 Zarycki <piotr.zarycki@gmail.com>
Subject: Re: [PATCH v2] KVM: selftests: hyperv_tlb_flush: replace NOP loop
 with udelay()
In-Reply-To: <20260422130307.1171808-1-piotr.zarycki@gmail.com>
References: <87v7djgoji.fsf@redhat.com>
 <20260422130307.1171808-1-piotr.zarycki@gmail.com>
Date: Thu, 23 Apr 2026 09:50:16 +0200
Message-ID: <87se8mglon.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Piotr Zarycki <piotr.zarycki@gmail.com> writes:

> Replace the open-coded NOP loop with udelay() which was added to KVM
> selftests in commit 6b878cbb87bf ("KVM: selftests: Add guest udelay()
> utility for x86"). The NOP loop is CPU speed dependent while udelay()
> provides a deterministic delay regardless of host CPU frequency.
>
> Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Thanks!

> ---
>  .../testing/selftests/kvm/x86/hyperv_tlb_flush.c  | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> index c542cc4762b1..4b7f089542c1 100644
> --- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> +++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> @@ -141,17 +141,6 @@ static void swap_two_test_pages(vm_paddr_t pte_gva1, vm_paddr_t pte_gva2)
>  	*(uint64_t *)pte_gva2 = tmp;
>  }
>  
> -/*
> - * TODO: replace the silly NOP loop with a proper udelay() implementation.
> - */
> -static inline void do_delay(void)
> -{
> -	int i;
> -
> -	for (i = 0; i < 1000000; i++)
> -		asm volatile("nop");
> -}
> -
>  /*
>   * Prepare to test: 'disable' workers by setting the expectation to '0',
>   * clear hypercall input page and then swap two test pages.
> @@ -169,7 +158,7 @@ static inline void prepare_to_test(struct test_data *data)
>  	wmb();
>  
>  	/* Make sure workers have enough time to notice */
> -	do_delay();
> +	udelay(100);
>  
>  	/* Swap test page mappings */
>  	swap_two_test_pages(data->test_pages_pte[0], data->test_pages_pte[1]);
> @@ -189,7 +178,7 @@ static inline void post_test(struct test_data *data, u64 exp1, u64 exp2)
>  	set_expected_val((void *)data->test_pages, exp2, WORKER_VCPU_ID_2);
>  
>  	/* Make sure workers have enough time to test */
> -	do_delay();
> +	udelay(100);
>  }
>  
>  #define TESTVAL1 0x0101010101010101

-- 
Vitaly

