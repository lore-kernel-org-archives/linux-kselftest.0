Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F223741
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Aug 2024 00:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725063718; cv=none; b=igxNE1+Hsl4Z4nkKwXYp8jqSm0UKJaaZXHHqLRcK3TA14rut/EY8ZmagCenMyh3c0ybPTkQj83dFWx/ta9G3kmXjlcoZ1Kdsu+2qEu8BHXJa/pYFijPyiiTPglGsJhJmONZ1541x+iPUpYvM1muLTRK+pGbE+x0cR3d8MoO32U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725063718; c=relaxed/simple;
	bh=uikcsbcYWTizg70A9pXTDrH6Aq2HwfIpluSe5pLzm3U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mx8qqhuC3g4zSYUlC3rmreTqApqfFdVR8R69MvPbJfOq7m0dicpAkl8yYsf4JAY4/0ecGbSyFODbWNniudpsqK8YWhDuJmpNsNEU8jLTjchqr8aZr7WjCrRkgBAhsneon1Bz3MVPy4RkE5XnKLcEDvGIHAVfbxFPE+e32LOiac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=acB0VQAr; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="acB0VQAr"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7c6a9c1a9b8so2294756a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Aug 2024 17:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725063716; x=1725668516; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQ0cv7Qd+gmdijk0mM0rETDzMYm/E79aKdx8FgcPeVI=;
        b=acB0VQArEtQmvLBS7CTAru7iGkooPoOoysItT3pQmAbm26BeEO641z74NzMR7itdzG
         eORY/TwjCzRA+xwJ3Q0l+raVgC5L8dF/S5cbgZO/nV0VoQZr2CWFMJHS0DoedEq+DeH8
         455Q/RRc6FDoAp8/3aMv2rGj6/TgnTPURkIHVjf2BfUBr3Lh6vvClouJcRzudmsR8JtN
         sxETvedqzNtx5zX9kvPU1GkPFmHSZSzKo1/0UBd1ybK+3RgpcyFmDbTH9nA8ITyxglPm
         5NF9BcPxC1IvGHS994eVGQLYgJKDS2GIMkjaqnXmr85noCX4OFaSYKQtlUVkAqzpsemT
         P8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725063716; x=1725668516;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQ0cv7Qd+gmdijk0mM0rETDzMYm/E79aKdx8FgcPeVI=;
        b=EevYD3C5fiOZpoCFw3vAfqrckZBLay/q3QviZUgmz2efJ0lIjM0jxeumxuVCsHNZAV
         Nhv8w3NdDcUsJzlARanh1vbZSNl2Utl419IBQHv8j/Wv2y9b7OyNEW060ZoT14KbcXTr
         6jVrSZM2TjBSzmdklBpRLK3jOMV9DZj1PdEsfB1gCY1Y1J+Q6w3sHL6ewYEP+HwGmTdc
         srgE87UghHB6fOR8mD430R4czZv7z6nPMrLNAGUZbRGgulrqGw1ysIDOBQ4lqJBBCMCW
         biBo2DrYjBrxMUHZQd9Q7O9FNgnBQxUhudH/88epT1LCvTOBulKvBKXOGxgZ4ctV8Dji
         IOCw==
X-Forwarded-Encrypted: i=1; AJvYcCXxyfKBKWDpvvPqllLeMcFgseYp7zMz9jBWvBSMq+roed5BWcb7IqpAqRoUcG3vhUYyol8THT1Em+p2IQyExss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIe0CjZBgg/a8V+Cghkk9ow47d37bBKbf4SthjipLgg2FPWNaT
	pnLIf9RLFabHct9T9/PBs+GeYBw1dVGHMxxsfnrTIzgJSZGq17WOCKGu2geOHqjVwkr6+M5UWsJ
	hIQ==
X-Google-Smtp-Source: AGHT+IG1zZXwwzR1gaXHIo5VHk6KMji21CeC5APkFgCfFzhzxXAK9Z+KmZlxoO+VmmEZORM0HuKDi9jjeoo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c405:b0:1fa:fc15:c513 with SMTP id
 d9443c01a7336-20527e7da59mr2460095ad.9.1725063715836; Fri, 30 Aug 2024
 17:21:55 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:20:59 -0700
In-Reply-To: <20240709182936.146487-1-pgonda@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240709182936.146487-1-pgonda@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <172506355899.338644.7289334225291315172.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Add SEV-ES shutdown test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, Peter Gonda <pgonda@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alper Gun <alpergun@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 09 Jul 2024 11:29:36 -0700, Peter Gonda wrote:
> Regression test for ae20eef5 ("KVM: SVM: Update SEV-ES shutdown intercepts
> with more metadata"). Test confirms userspace is correctly indicated of
> a guest shutdown not previous behavior of an EINVAL from KVM_RUN.

Applied to kvm-x86 selftests, with the IDT clobbering.  Thanks!

[1/1] KVM: selftests: Add SEV-ES shutdown test
      https://github.com/kvm-x86/linux/commit/2f6fcfa1f426

--
https://github.com/kvm-x86/linux/tree/next
