Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9438BF6A
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368419; cv=none; b=Y2p7kuU9SUuiFjaMGOU3TZ5Oqn3OuHtiznhrsfTHNESv2JeTuSxPkweHj/7+DXgY0u++PBJWWwX3QRa3UfuaYAyOcUBy1T0UBjJJqKdeW0RnwTh47DKZWg3fL1xKwkWBd6vdtPit/YvEPxkHp1B9Y5JHrVN+l/4Krda32I/dY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368419; c=relaxed/simple;
	bh=BwUcI927SyLVRlFXerZ4C2KhkdStVKNEijngOS5FYtg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dikTIqVl6HSljCArOLm+dIpVhRwsW38RZfNmpKuC0/Yx/VebC5m68Uypf7f3MMIMwni4Ed2OMrJYubogVUngHBSonL3nZw+fxfi7b8kDzYK7kJo91SotpIerCOwvrOgguQGMjRDQfKRcPuN7u6RbFf+tlJWjOLviuIjfVKHsB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P1WtQyIX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ByaXHfkS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P1WtQyIX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ByaXHfkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777368412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SElkUbSArWKRvTI8r4YNCpzW999fwj8na5PfWJ0BC/g=;
	b=P1WtQyIXOlKqlriw82bVLnMlz7GLkrFb+vcOYZK21Zi8ALRljQsQNCSCoVslAu/Ia8MVPq
	/v09f7i4URiaDgi6YrtQMtbwoE2GjDhhjMefCQsFOXuYWzAKEST35GP6ig5YD0WU93HCAL
	0ZgLAGOvc2o+FpfknPibGB8tiv/dg7Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-y_diUf89O9G6DSuGdPU5TA-1; Tue, 28 Apr 2026 05:26:51 -0400
X-MC-Unique: y_diUf89O9G6DSuGdPU5TA-1
X-Mimecast-MFC-AGG-ID: y_diUf89O9G6DSuGdPU5TA_1777368410
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ebe2c596c6so1658887585a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777368410; x=1777973210; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SElkUbSArWKRvTI8r4YNCpzW999fwj8na5PfWJ0BC/g=;
        b=ByaXHfkSkXkv/5ZtKldihyLqrlhI9OMbFtkQbaB7iqTIGIhyQwUArXCaRIUtGIusWi
         9gUbJyDRdr+oZOdRv/dXlFYR2Mztcow78k//x+BViao7sAByd7zvl/uE8M5tjXbRkDo1
         HSnndf/gFiO80XZ+/Fqoo1+f7XMpSv6+YuxD/kdRA3EoB7PR43LOzIblqSWyd0bT9G2y
         IVQzGcL6fYKrVJYz2P9IwVqfWRqB/uDn1c72Blf7UEpz09jQ+4dIcjCytOennZv8qFW1
         E5ErvNgCeROodrZ2vCs+SJHVfAm1JLhLIPg/nqLtiZYbNIenswN2X0Jjeu+Vy53qwYMb
         qYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368410; x=1777973210;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SElkUbSArWKRvTI8r4YNCpzW999fwj8na5PfWJ0BC/g=;
        b=gf2g9lRPobC5oEbddGBfe2jEzpSGzMpby2/dXirNz7eb6rB394CPWjBZvrrSUaTYtw
         +XqMDH4cVkLPtjQivQDcwOcScbrdYB9W1ilIXmuyub64b6qxN6LR0Kg0rbL3/5qcV9FP
         th7CfAdzJG6yFLnUWYArj1nooRy8qgX1hOipeGmwi/+YGxzJ6Suht9zj6Q2F34yqMIRe
         pXeiLtG+iQp6Uc+TIk9KrVDUKzpdWcpjP85uq5Kc62qYb1PEB1uLFwqu+/JWNeU1ZPKI
         jfPdxrTQyTTh264b/yfiOgZuhxG2AAErVXkiUj3WnDK65IV+2hKjeOWFmnREIAKdUVzn
         mwMg==
X-Forwarded-Encrypted: i=1; AFNElJ9meXU86mL6WMUFc4XEl27yMY7GS9UgOYBmm1JWT3yifmcq5aWB5dZi9YqRE9KiOxPQg4kGuaXv5lGBE4MYlgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJRhmPB7FGK+hMP3yMlAVVw2VcExiI3ZgLxEPzZ7iko+s8tMF7
	/m4YEXv8idMpzO1QNgge3YZdhvqY4Z8zcvll1AKqh10A7aBQ4IOyKntVFxDKjgrEet+3NYt4x5g
	lgM+QVXxsDgDIKLZDP4aNOIvAKA+FC4plS+SWy8gQB5YC5oGD9DJiTcf/U6K2xsg0mnfOkQ9vpW
	2ymQ==
X-Gm-Gg: AeBDietUdPfMAT+h3mgIGgqd2dd844TAlcvmUdjJ6/3sXDfbAIg7fWCQELaQNNe+csU
	8aoeqYf887ai/3xiJWNMzxXkhNcrdQ10mZKVyKeyLshFUb4gTQC8x9viRndPzOAY8RHEnKcGtnu
	h/VuVgrZFGrOXG2d2bgB/xhc+VXclG9B5+FycSAe73MmghLflWKxuymE8AO94uiiwZtsQBFn+iE
	R+zAPMLGEfCGy6/ToMLEif49tn9FXyJd8mWwsX18FAxoK7uE5S0keXBsqWImx/NhyDpAQTTl3eE
	RZPA5DaZNHSCLqB+jyJt1dGMCQ0j6Lsfq7ELlXc+H9N2PsKdRZO4PM/AmB9dEr2/g4rtERAeZK7
	jRoIDCGQhZxbjcNGZyaZof/Fb3hB0
X-Received: by 2002:a05:620a:2a07:b0:8cb:5176:f00 with SMTP id af79cd13be357-8f7d98fe7c8mr276263485a.45.1777368410335;
        Tue, 28 Apr 2026 02:26:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:8cb:5176:f00 with SMTP id af79cd13be357-8f7d98fe7c8mr276261885a.45.1777368409899;
        Tue, 28 Apr 2026 02:26:49 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c81c5605sm142517985a.33.2026.04.28.02.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:26:49 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Piotr Zarycki <piotr.zarycki@gmail.com>, seanjc@google.com,
 pbonzini@redhat.com
Cc: shuah@kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: Re: [PATCH] KVM: selftests: Fix typo in comment in hyperv_features.c
In-Reply-To: <20260428083037.1926902-1-piotr.zarycki@gmail.com>
References: <20260428083037.1926902-1-piotr.zarycki@gmail.com>
Date: Tue, 28 Apr 2026 11:26:45 +0200
Message-ID: <87v7dbl9ka.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Piotr Zarycki <piotr.zarycki@gmail.com> writes:

> Fix a typo in a comment: 'vailable' -> 'available'.
>
> Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> ---
>  tools/testing/selftests/kvm/x86/hyperv_features.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/hyperv_features.c b/tools/testing/selftests/kvm/x86/hyperv_features.c
> index 130b9ce7e5dd..f943c748f9ff 100644
> --- a/tools/testing/selftests/kvm/x86/hyperv_features.c
> +++ b/tools/testing/selftests/kvm/x86/hyperv_features.c
> @@ -457,7 +457,7 @@ static void guest_test_msrs_access(void)
>  			msr->fault_expected = true;
>  			break;
>  		case 45:
> -			/* MSR is vailable when CPUID feature bit is set */
> +			/* MSR is available when CPUID feature bit is set */
>  			if (!has_invtsc)
>  				goto next_stage;
>  			vcpu_set_cpuid_feature(vcpu, HV_ACCESS_TSC_INVARIANT);

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Thanks!

-- 
Vitaly

