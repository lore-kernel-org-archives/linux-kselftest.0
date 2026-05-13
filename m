Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF230DD1B
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691735; cv=pass; b=JAuYGO7XujihOS7SzDUOTldYq+g8b/RzTIXWYKZjZgoDVOO5hzbTJ6/ne6W2hum3rQ9DJ6zaCdMMQCtkSiar2DChU5940Kc0mD7Q5HaF1tjgePJNFgjmWXrr6IrulmRdO8NrMokUHo9AO5iSDri+4K90klLSotez2AbCPmgsf5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691735; c=relaxed/simple;
	bh=jDAM/QoVFszMIUFczVb386HAVy8pWg4u5py+ckvmY84=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blBJ2F2bIrsvgVCuvCh4UCumo+APYMr0lds0Q0yj2c3YF71cfDnyUFVYkQ8j6iSsSusZXbsHQw+U4fZNiTPjJIigWnIU+ovQfjT/U8MS4m+9RKJ5a6QxWCgVAQ4V00fl+Vg8lKyMCEIehMMGWwdwHLmYO8qRxMfSRyJbUbxahV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ChUr1rWp; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ChUr1rWp"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56739adfa1aso4720084e0c.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 10:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778691731; cv=none;
        d=google.com; s=arc-20240605;
        b=bzqayN+yWUoaOmOMYDMoXYU/+SOSv5Qm6wH8YN4j13soxeCymQXoywlvjzsL47uIu8
         do5JzVJrOnAdW1+hANcsIh/74oBXzyP14SnbTL+DZP5VLMr6mIUIWr91P4S62a7CWfdz
         wGVhjte/MYb1a4RZc3m8vMv7PqKmOcggroBhEs5M+OuLH4ZN59oGDJschwSoLwlBpYGX
         V3rpKP7sOucC2gyPW15dB4r98pp9ymobctyEPlWia53q69jKAeKSlxK0uL/MseO5GOdM
         vdBaK42N6yl3OI1VvPME+r4vmSzp4+g+UEeJSKkrvt/K3DKt+9mGpOWNURk80CR2SJNI
         KIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=h1pqwbkD9RQvoJKBcu1L4mkhOGVvcWwZWBB66EXM0+c=;
        fh=hc3cDJq9tOQQCnxeB+JZsR0DYAK5Tz+TfKOwRY/UqLA=;
        b=LHOoiGbO2EcsHj4YnNS1nqPd029hxMqZ4oFSUO/q1C0Z+72OvJM5eQc+AUdbbkpPM8
         ObFqCMIRMU36Ev8FQBNsFCOIV1A7y9BYxWRrxo06aywEyT1asQXgOyhqUVKs3KvYCvzJ
         Jo+6hZgddWgjhlogNgQGO5WQJFyX73dwxxZas77bL6UbpqZEcgnAtLPps6+KJ3TYIJNG
         10q2gdE/u8SbpRkq2dtZshwEJ7SXHpK/cOp3yqXXnylknKkaTj8iHql6o0E8muX34zm6
         QMmBpvNEO4T3tohKgeHS524Akeoq+G8LEyy8kDz7GAjEgVmtG62qvdx+x0egQgB65Jnr
         l2UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778691731; x=1779296531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1pqwbkD9RQvoJKBcu1L4mkhOGVvcWwZWBB66EXM0+c=;
        b=ChUr1rWp5wbUCuXE3n7KVlYQNbATYj2chSJ/BIoj2Bb10/sujONfkRpTPfqtRe0WMt
         UVfEttt0I4NUoetYb9saFW6/0X/ZiSQ5m/cDQEXszm8l/z9ftyG5c7vIoUSz46UUWq0c
         Lg3cjmqeF0ewfHyUEQ35JJ7UZcqudPxTl1ue4VfwuhY/wZOcTnbhjX3Ff8m4hl0DGI0e
         ylG8zuKVfdJ3cQXA9feXGs7z0bxFkIXzeKXGv6EwiPI7K1Rsxa/rwaVYYeL99yCuAet5
         stgmDc2XfJYP6yOOlOMU2CY3gTCIq9sh5iLKfdoacTGbaSCGlwbz4FmtLXMX7FSrHzv2
         nA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691731; x=1779296531;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1pqwbkD9RQvoJKBcu1L4mkhOGVvcWwZWBB66EXM0+c=;
        b=rxNAtiXFEYqoGtmVjpu/eV0OvwGHkzSt36dz49iYoV6AQycW8gm+4aUh9oyrpD9eA3
         ccD0JoCey00ghsMgu1I4m0cYhBnJxcrAYINN1tDhBkAm3x1vlQ//HjyNc5URzbtJb0LF
         it1nymvTM5/jLd55u66phLrZOP1dIaLWD78Dogl13XltPl+/WsseZwAN4pglK89G8gXT
         uYgdoiThhQmI5YTSNVuunX4i/IKfUieWK+jJ/IA0soJkzfxYCa+0VQ97tPB8tAeZfSNW
         e3k8KdGrzax9O2faRW8q2j1nfDWw3UrE2/iYHAG/V5ciHADJMrmL1kZv0+zDduNLiQKu
         E/Hw==
X-Forwarded-Encrypted: i=1; AFNElJ9ELpCumcbhdpNSxHwqy4taPO10syqgPe2AYMCU5t2NLuTGax43b/lG7BL3Tad+qvzw0ExIJ5cInGgp2i93KeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDB96c9DbubDGNTL/SY8a/HZB9sr5n2hQulO5A+rSXYclNrVOb
	IqFqsAuZ1FXg2RH71Ss+tNkJvqi0t3kdMawv8R+2Zv1YCYRQ0v6XG9CH7+xSYxGsAdyVjooq/C7
	JiY42txxNzmDmLjdXXvWBFQp1JlwanW6xiA57+tOt
X-Gm-Gg: Acq92OGSCVy0tn6I4mSInjsH7s90PP9ED2q/7jmFyDS7JCzc0YwBxB7AJwWK/nNx9EQ
	yjqw1c0uzVoZRH4sFcgX7bF1gpjNAYc6zvzFYyY1E2upmk9t97hzwLAVQtRuMl7LVs3/zcMOnI0
	qotQ6lnWUtKqSyualDpmGlyWKnXAlUesuWCeMVm1WI1PbOJLpl3Flrfis8ULtYpmiZmfVwW4hi0
	od9dk6CHXAPm6UNJL248lE7WiNdHYdssgrUQaOkDBDDpIfRnUPNHZyOvo6KxPvfQh2DMPZgbUQM
	9edkLPAuSbyR1F4DI6rUcB3yvStS9RZqa+XX+blSlXnsz1nAgj9/xtSk06NBDXt/TOqfSugsHk3
	YqE/T
X-Received: by 2002:a05:6122:1057:b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-575e6b7c6f3mr1887453e0c.0.1778691730803; Wed, 13 May 2026
 10:02:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 May 2026 10:02:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 May 2026 10:02:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <agSCDrazxEvStSuI@google.com>
References: <20260508015013.4108345-1-maobibo@loongson.cn> <agO6oLqQYQG14x6D@google.com>
 <1a5a115e-3bf3-e2bf-475a-b49f5b6e308f@loongson.cn> <agSCDrazxEvStSuI@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 13 May 2026 10:02:09 -0700
X-Gm-Features: AVHnY4IZCymsWlyzXzbzCIngna9ZiTJGyW83ZiodmvC7A2JtAcOCvGD1mOGMYHE
Message-ID: <CAEvNRgEgTf2a_KCZiw50T=AXAgmYqLPpXacDePwdXTvT4O-+7g@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Check guest memfd validity with flags
To: Sean Christopherson <seanjc@google.com>, Bibo Mao <maobibo@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
> But, Ackerley and Fuad want give kvm_vm_release() the same treatment[*], at which
> point there's no good reason not to be paranoid.  I want to do that in a dedicated
> patch though, and harden "everything" in one shot.  I'll send something like the
> below.
>

Thanks!

> [*] https://lore.kernel.org/all/20260511113759.610924-3-tabba@google.com
>
> diff --git tools/testing/selftests/kvm/lib/kvm_util.c tools/testing/selftests/kvm/lib/kvm_util.c
> index 2a76eca7029d..2476167252a1 100644
> --- tools/testing/selftests/kvm/lib/kvm_util.c
> +++ tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -737,6 +737,12 @@ userspace_mem_region_find(struct kvm_vm *vm, u64 start, u64 end)
>         return NULL;
>  }
>
> +static void kvm_free_fd(int *fd)

Not where the line is drawn between "free" vs "release" in the
selftests, just wanted to draw your attention to the two terms we can
pick the correct term.

> +{
> +       kvm_close(*fd);
> +       *fd = -1;
> +}
> +
>
> [...snip...]
>
