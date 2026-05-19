Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A961A24E4AF
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 00:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151403; cv=none; b=gLEklLIWOglzS5OqU3NuYIhiPRRDYNcn7Am9klp/IUeX2BMpnqVBvCH76j8McOyDZs+uYI4mc99MZefrjBYcHOztwM09HZQxXiEIeYrIsZP6k1KKCPAtRPAVseAHQ0Y4Re5DeEm3SEAQLHY3w8YQkDWxPqaUxqff3BQPiUjBorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151403; c=relaxed/simple;
	bh=qRsPnhBYEICKZLB5dt83iyR7ioJ5uFr9gOpOcCpyMmc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GYJqKBgwz28wa8o2NjF5j6qcm3VMTHD0pedms/w1xHE5kmkN52FE7YhNj5cjfUke471sDP2meb5OtacBYkQHeS1DPoE4V7U4RRB/2Mc0OOTfHl6Fn5TF0xcsfoqdVpj8L7NdMGCgW/3Y/z1SC3G5KClCVPSePEtbPWRSQ/+v2xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KK6JDbZZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KK6JDbZZ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82894155ceso4329289a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 17:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779151400; x=1779756200; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGBjT94a+74rvETz8HxBL4S/5E3oNBa6USJdxjpgOKo=;
        b=KK6JDbZZKn/1q6733XNjIMLifcBPKCMaEIgLNV92/Ti9x2S6Y0l9+Gc3nddXqNB5vw
         iBwqPqoutP0F/Vf89KU6Re6ChNm32ndacxmsafTKLtOem8fu6ilaraiePx/ncMc7513c
         ZSBzp245iCVHhFGZs8UnpaCuZlqK7vGUvATJu3ms8Ia01zugITGA0zqAvPmzfPCF4LtX
         AO9UgbxwMSYNm6bgP5f5OYYEHbsgqvQPLR1wKUyPVyjWXMNiZiJz1WY3gwAu9/cEGJvz
         fgvMCxLIGF4HBcPko7xX8t80IF/Uw4KtVHvuUenE+fMeEJToNEkNTfukwWlW2w0IEmZq
         tJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151400; x=1779756200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGBjT94a+74rvETz8HxBL4S/5E3oNBa6USJdxjpgOKo=;
        b=LIEySeKx42I6CH6KiXpOEBJznn8d6N0vIn0ShFhyc2KIvEOTmpDILLp9WplrxclpC7
         CXyoVH8C2Z0UnNw9rDObrHI5YBRjdMJvxon07aNdH1DUCmKJ1v9zhdey7suVL49MOuMB
         5w0zkxKJf9WGX+fMaqfZoRbzMLT/FlcD0aepdvln+pEzGeJYIo0P8QWbhXyEgBfv4E9h
         7gbcN7nh7goKlTuZz5xsurj5mt0V6P7HW58LWKYWAzw/cJmd+p35CddPxh7F36Jwfjpg
         kSwbu+1Jm/z5Nygyx2aEyiOJ/LKH3tUltETN4zzPcDWskH3SglhypZeHDigpcRff/tRd
         5qPw==
X-Forwarded-Encrypted: i=1; AFNElJ8lUZg6Opux9CtKvZC/cAoKD40cWUa146nnadIWUjIQMROIbujauW9hUOA/We3Og9uBYJGQBVqX5yB8Uajjaik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6eH9/MOPRNKatDNceQIG1mnltHePuailpJ+BgDF48NaIMrBMk
	7C0rIPtHkG+AnHWEzw+h+4yf66mgrFLXr/xGWafTWmii5Q8UmrBl+XzMFgV6skjFPeBzmiXTuTw
	bHrKxeA==
X-Received: from pgbdo6.prod.google.com ([2002:a05:6a02:e86:b0:c7f:cbc7:f21b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3383:b0:3a2:d68d:9e6f
 with SMTP id adf61e73a8af0-3b22ec9695amr20355111637.33.1779151399836; Mon, 18
 May 2026 17:43:19 -0700 (PDT)
Date: Mon, 18 May 2026 17:40:56 -0700
In-Reply-To: <20260428083037.1926902-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428083037.1926902-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <177915102047.2229773.8353028347230680571.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix typo in comment in hyperv_features.c
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Piotr Zarycki <piotr.zarycki@gmail.com>
Cc: shuah@kernel.org, vkuznets@redhat.com, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 28 Apr 2026 10:30:37 +0200, Piotr Zarycki wrote:
> Fix a typo in a comment: 'vailable' -> 'available'.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix typo in comment in hyperv_features.c
      https://github.com/kvm-x86/linux/commit/b67c030f4f65

--
https://github.com/kvm-x86/linux/tree/next
