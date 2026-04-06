Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EDC30C608
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775516415; cv=none; b=G6kPSBkkrf53Xw5ckwu6w5v9xZU/eRIcM2x5c9oxkMg0lLnNwsNGOPI2BnXqWzn4xzcR/3lXFA7G0M5IKUgguTE6rSHNU1AYYzwHYk6f2A/7v8QTw7Vj5XwSXSMmwhr0/Rq7W30kpxOjeHSKZyFDZRg/6+YIQ5NWTJHp3tyV35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775516415; c=relaxed/simple;
	bh=SU7cd0cbc63KLc5D6MlfVPj7f1aX25jUYDpVEVQjE6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rp/didipZa48OrpwJwb05vDWIGHfitKcprC6njtC1FMMoJqTRZ71HjFt0S9QqsSLCJNTv4dhPuOB+FxnuEwVfVST8h12/CNdE8ooyrldT1FvpJaZOC0oYJ/6kQ0ziqcvyOBYEM5PiDvENEBrXYRPvnP7PwBtiqONiScFEAOO2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R0Uw3IiO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R0Uw3IiO"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82c7ec40f92so5958243b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 16:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775516414; x=1776121214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LIGAhI9t8Vs7faC/bm2p2nXCXAiMZcEtLu5XGGyDRdQ=;
        b=R0Uw3IiOqYb9Vti+fkCI3gmJzJdQbnUW+sc4pnMiUgamAD2BOpvJG56RCMcRGp6K9J
         3gkUi3HaIb35pVbEfo1kQFmR9Ck8bc3eQ6mhjh/PC9shOE5sAn0ipbLtBkfQPMLvMy/t
         tjGiRFIrblBlRoo4VcrB7XKZs3vLGJczQ8h9BDJZQsfY/ZbQtUXomibHy7RbCmSKSxM6
         vgmBvBJzkJDEZO2JU4odumOYf+G+jH8EbRF8gCvqrExw7sjHAYyVNubB4wpWKAHXsfAO
         v2Fs3IYORmnGA4/08ZHpJrCezHdpM8phpCzBnyU6NsmwgpC9VJbjHBUmxB/5llqYu9Ti
         0qpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775516414; x=1776121214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIGAhI9t8Vs7faC/bm2p2nXCXAiMZcEtLu5XGGyDRdQ=;
        b=kd3KEU7SJdbA+nRUqymbdEzITGrUPQIvhWmqzWvd8wIAOxAyDw1rBYsZv1+3LaqBJz
         eUKrtxVxf8NegopNisVVmUzN+/7rsvjzHW7MDLTyi8VoJbyHqqkDDNg8FZRWOc2IA41D
         MJHpYCUD59ECVjVYC0sA58TJ+YyfO3mkc3XD84MJUwHMVEhWcZfop4LfS1vwhUn9cmIz
         v6m11IW7iVKpRD/UHRWMSUsDhjewSXU4r0hctNW1P8URJ8cdY1brNCbR9yR+7v7AOtrz
         94IfH3RxogD4vQ3FNNqrPfEFHIQs12Kg6/RzbrOjM5iK9VKbY3zFy0/pwAGJWrUGFafN
         82Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU/lbYu6AQJHHLv1BdCwISwur9c09kSl8PSFiaWvy4WCdj5iOmNXu2xp9iQS9LxNhzPZlQSh59P216O37wn6rE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTJtA1S7oxmTU7/dLR33LuMqoINwsi8DuFTueshh7ctuMsTxH
	nZPA5k8gJNo0VIz74JprvIzoAA4/O9xPOyL8NJXdxOdJgowE7lh6UF/+BR5KpMJjrI0KqmuYCKu
	bxqi66Q==
X-Received: from pfud22.prod.google.com ([2002:a05:6a00:10d6:b0:82c:6863:427a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ac9:b0:82c:e3f4:f5e9
 with SMTP id d2e1a72fcca58-82d0da7d403mr13540678b3a.18.1775516413925; Mon, 06
 Apr 2026 16:00:13 -0700 (PDT)
Date: Mon, 6 Apr 2026 16:00:12 -0700
In-Reply-To: <64d44f37-7d31-46be-b9ed-cc86969777dd@maciej.szmigiero.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402102953.2984284-1-mayuresh.chitale@oss.qualcomm.com> <64d44f37-7d31-46be-b9ed-cc86969777dd@maciej.szmigiero.name>
Message-ID: <adQ6_MyjhnpJYJ5H@google.com>
Subject: Re: [PATCH] KVM: selftests: memslot_perf_test: make host wait timeout configurable
From: Sean Christopherson <seanjc@google.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 02, 2026, Maciej S. Szmigiero wrote:
> On 2.04.2026 12:29, Mayuresh Chitale wrote:
> > When memslot_perf_test is run on qemu, sometimes the RW subtest fails
> > due to sigalarm, indicating that the guest sync did not finish within
> > the expected duration of 10 seconds. Since the current timeout value is
> > itself a bump up from the original 2s, making the host timeout value
> > configurable via a new command line parameter. Now the test can be
> > invoked with '-a' argument to run the test with a suitable host timeout
> > value.
> > 
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> 
> Out of curiosity: which KVM-enabled setup takes more than 10 seconds
> to run that RW test?

Hmm, I assume "run on qemu" means running in a VM that's fully emulated by QEMU?
That would probably explain why it's so slow?

> Does it have like, multiple levels of nesting?
> 
> When I wrote that test I calibrated it on a mid-range x86 machine,
> where one iteration took on the order of 0.01 s.
> 
> 10 s time limit per iteration is already three orders of magnitude
> slower than that.
> 
> Otherwise, the patch looks sensible to me.
> 
> Thanks,
> Maciej
> 
