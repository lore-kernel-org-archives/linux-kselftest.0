Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB63E3166
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370861; cv=none; b=WpkaYQXmUQ5nbewdToLUHVCqcxXIbmeaIiNSc6uls+Isc9AxwxmeYutQYq9Gzw6taH9/mXE6IG2l5fjukcMzGML96hILdluIXaCjLHk0cT0Ra2WruSTLXUSFa53zbrUgAqNYG+mqX7OQvLEcnfZSWZbMksS1DdMxi3OXLYRulQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370861; c=relaxed/simple;
	bh=t1Txx5sP5rjbtyEZIqhukkWiABdroyLY9ierQdCxkwA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ntTmyynFvousvxSjyYU7RCRk+yJAITa1iRzDpu8eLd8bnBUXqo/VRftbuEM9aYL7Y/ft3bQhr8S9pHtSC9hQwZsmTcrJRGw2eIbhzCmRw57d04evqVaVQQn8W8LSFvymPF+z9Lo8Gba3H5biEJSTplkEBh5euXnbgovrxwRbHy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mUwo/+8Q; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mUwo/+8Q"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so3199706a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786370859; x=1786975659; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrLr+WVvghUQuf/OY4c2fRyfsehtJvAKrMA4WcW1Fx0=;
        b=mUwo/+8QisQlpL4de6IZQGN8Z02Xxq4r7YMT6eoek9j3bIAqs6qp2o6ScGrOKZ2FzX
         CfopVw2yn1pb7bfR37oqda61gJxOpgInubmO6ecABf0QUfOpfpdqVSyy2yoz2B2n5yul
         g85hBLm5ynYX0ETVfnppMrIzFoAcKN68DjXRMGVHlkrudkaliAlyCtKjZ9V1dIT965SJ
         uk/i091dQmNJy8j4vS/z/PGQJTxhYIWm9AsBh053SIXtkJ8Yf02K43nRY/Kov3v1RQ+G
         mfZt0FAbj7SgdeUl/TC3pZy9tDcpdU2/AGFh9jt7Ohp/L4n+86XXBtZZiAGBJT6jfrTz
         Vu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370859; x=1786975659;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrLr+WVvghUQuf/OY4c2fRyfsehtJvAKrMA4WcW1Fx0=;
        b=Xn7zEbYXjq3M2AWsikM6Avf9YXbm1vFUBlsGxaRZMAos4UoOjt3bN8sFHEpzma+Y/X
         hTDCWs8FME7sdT6t2aSR2XLMhf4dT0t4iu2JdSF5hO3UKeXsE3VAyfcQWedaquT6dr4L
         zFjpCISt9AE7p6+ONRW1VCkqSjo+b4RvgViIujiLfEhIaS9FRcgfK9cfHnAvmwHtJZXh
         C3/fQW8TT1Lf7WzqEA9kidiwdzJ4lTTetHced3ibW+h/cApwYABXoCtQ5VdmkoCGFHLI
         1hORiwWlSg0yb/HoT4G4ZjDc/kFr5fGLPEv7eODUdSMaIhboyDVWBcJbL2UZ2ykkzZRS
         EaWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9qNvqOfYXnW+r3riQpxeFwbGwyAV9TOTChakkjwyQPZ9OGWYqRr/7FUhAvTGlYQzyFlP5ZPvTjtZ2tmc7nps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBu0M0a7M/vg+daZ6OOAlDuBBhXNal5TMhqzrkNBaNGaG6jRU
	royfy1tlInD+iPBPx1XKejms3fba8i84pBW2g0s60x8SCEP8IOWaWpDKkcuQ+MnrIMHsdYDx/WM
	XVgI04g==
X-Received: from pgv28.prod.google.com ([2002:a63:155c:0:b0:cbe:3002:6608])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:da11:b0:3cb:9a16:b159
 with SMTP id adf61e73a8af0-3cc1a0bc37emr2552599637.6.1786370859292; Mon, 10
 Aug 2026 07:07:39 -0700 (PDT)
Date: Mon, 10 Aug 2026 07:07:38 -0700
In-Reply-To: <20260807071026.195503-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807071026.195503-1-gokul02k@gmail.com>
Message-ID: <annbKnNqQvzyn8tp@google.com>
Subject: Re: [PATCH] KVM: selftests: Compare the entire XSAVE buffer in the
 SEV smoke test
From: Sean Christopherson <seanjc@google.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 07, 2026, Gokul K wrote:
> compare_xsave() stops at index 4094, so the last byte of the XSAVE state
> is never compared.  Both buffers handed to it are 4096 bytes: the host
> copy is a struct kvm_xsave, whose region[] member is 1024 u32s, and the
> guest copy is the PAGE_SIZE shared page that guest_code_xsave() runs
> XSAVE into.  A VMSA synchronization bug that corrupted only that final
> byte would go unreported and the test would still pass.
> 
> Bound the loop with sizeof(struct kvm_xsave) rather than an open-coded
> length, and make the index unsigned so it does not mix signedness with
> sizeof.
> 
> Fixes: 8c53183dbaa2 ("selftests: kvm: add test for transferring FPU state into VMSA")
> Signed-off-by: Gokul K <gokul02k@gmail.com>
> ---
>  tools/testing/selftests/kvm/x86/sev_smoke_test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
> index 6b2cbe2a90b7..c7af27954356 100644
> --- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
> +++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
> @@ -90,9 +90,10 @@ asm("guest_code_xsave:\n"
>  
>  static void compare_xsave(u8 *from_host, u8 *from_guest)
>  {
> -	int i;
> +	unsigned int i;
>  	bool bad = false;
> -	for (i = 0; i < 4095; i++) {

The fix looks right, but this is so bizarrely wrong that I can't help but wonder
if it was somehow intentional.

Paolo?

> +
> +	for (i = 0; i < sizeof(struct kvm_xsave); i++) {
>  		if (from_host[i] != from_guest[i]) {
>  			printf("mismatch at %u | %02hhx %02hhx\n",
>  			       i, from_host[i], from_guest[i]);
> -- 
> 2.54.0
> 
> 
