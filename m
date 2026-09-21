Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD044A6CD6
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999655; cv=none; b=UKBqXtwEav6bCKlXEiFllM1MjXEBuzJdEo5uoocW1dQcUHCoPoY7Ng7szDXBmMiJY3vT/B+VJq+3RMh7BtUqvspgzy1X67TEuBkUmiJo/e0r4YOknlOUp7w6naSz513MeQWvMdy6D8JEYHsNWMNjAfuvZ+IqCcS57H2V/5r1DIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999655; c=relaxed/simple;
	bh=ph2cExDaQRQOwHEuFpPe/53YJaqNaEO2h1aVyc1Vvpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gONUtBJfq5DK2MeAvAKEWFLHhX5bNe9SIFMj4hScVMUW9ZffQhRsDVVI5FRNXts56P3JP+2Nsgor/LNQn1Csr37JQ5phDqxgCB5EZrZiV4KJui7wJzOyx2HExwqXC0X63R6yP+uv9OwahoIa0ftMyM3UVVeIu2agI92820/+Ue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxXJYEfh; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxXJYEfh"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so66224135ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999654; x=1790604454; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQJ1GYmLnk2RvPx8au14VoaR+1x+bzghWulma+pPMno=;
        b=dxXJYEfhxkwDaxKklG++KTrJbWZ5yavCjUmeX5Yc7cpRgkWHMEK2pPIgEXs17cAq0X
         p9m6UFPTbgOBkXSXD6/u8p0gO0F0vamXHQRsZ0dQr9dYzn6UscefKwQju5pog3zP4nWN
         5p2Y9T21ey6/vKPlZUUSI/yyhqNZc1Wv5l1Z3wAj79j9zNsv4Pa7pEXvOTuYTuyoxI1D
         aO2nfKhX+gwfM0RFKH9SrLvzpBQs3jt8eAX2fh5oVPYdcnWakFU1BIU84zHctOXJjmvQ
         nVXQqFGbuV7AU1QTMrQPf/RFu3UH9E534EHEr+lnIjxbvLeCfhsjbJmQx8zXgx3MO2ly
         JgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999654; x=1790604454;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQJ1GYmLnk2RvPx8au14VoaR+1x+bzghWulma+pPMno=;
        b=1PHR1N78qhaojb/n1JwDNLakW/cO7pVdFhihKoE7e3MjCQUi9v2OhUo+o6l8xYWWUj
         PWlICtAmbnFjUPYrQOs1gFINoqwTStkq5M1hOaNBRIPc+7yUDmfdP0dSS14m2ZhFM7MW
         i0Dmh5gPjI835SUPDfevij8mTD64+nzFySMnNiW64n1yNgOm/US16YSHEbYIVPvv5Bj8
         5O+khNs92pOr5xHOdzjnUGqOrk5b/JqhGoUfWj9Bxh5xzSRZxMTcH1lBk5oBrsldXfwz
         s38rkjXDwBEiLjNweBcup8pTWUm9JbJKJgRu85fqUXyaC94wPIiE/P30p5PeIDRRdng9
         h7fQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+MmCvumtImzed4zG7MoK3rkweMxRW0pVqoFa8+HL9Ay0bM+7Teip7G65kAICj0NfMI85lnfUJzwAVqvHbkQc=@vger.kernel.org
X-Gm-Message-State: AFuF++no+MCX60VInmJEjQnXbJwZl7sct7800z1jYa3vk3rpI0hms1Xl
	8Hz/i6vHq1pZfv+8HcK1tMxmlQt23HJsM7uLqRpbDmA+KLmlxuQpcwJyKSs/TEeb0fxsdqHh/o/
	TTa+exg==
X-Received: from plan18.prod.google.com ([2002:a17:903:4052:b0:2df:500b:1a93])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:bcf:b0:2dd:c100:3141
 with SMTP id d9443c01a7336-2ddc100323cmr69307015ad.61.1789999653610; Mon, 21
 Sep 2026 07:07:33 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:36 -0700
In-Reply-To: <20260907045246.3783304-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907045246.3783304-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999930529.756750.6445682647618178643.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix the never-true negative UFFD delay check
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: shuah@kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 07 Sep 2026 04:52:46 +0000, Chaithanya Lagisetty wrote:
> demand_paging_test parses the -d option with strtoul() and then asserts
> that the result is not negative:
> 
> 	p.uffd_delay = strtoul(optarg, NULL, 0);
> 	TEST_ASSERT(p.uffd_delay >= 0, "A negative UFFD delay is not supported.");
> 
> p.uffd_delay is a useconds_t, which is an unsigned type, so the comparison
> is always true and the assertion can never fire. GCC points this out with
> -Wtype-limits, which is enabled by -Wextra.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix the never-true negative UFFD delay check
      https://github.com/kvm-x86/linux/commit/25158cac2d15

--
https://github.com/kvm-x86/linux/tree/next
