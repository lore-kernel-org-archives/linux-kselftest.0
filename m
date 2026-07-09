Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876DB3BB69E
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608913; cv=none; b=dHHNLZyyJF73fDluHXikdVqgleY7lnzRvgL8iLB0Eybn11boe25jVeHxrswcwA4o7JIgBYoh5DimdCojYA6kPGH1fNXPUO7fFxI59gBnf9pJYj/4oQLumLzN8AOEXK1ipCcILIw+qAu4gvuPDvDi1Zjoco7ErnDTRc+qBNqIKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608913; c=relaxed/simple;
	bh=Z92wjpo4T3gw0Y2zNCG2Jd/Ba3+9EzNo1LTP87sUDGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MS5Ony6SWy0gBEvwT9Tjmq9SGLbjz8Ot1V8iU9JW4TPVQCWu6jr+Z5f6ODWsNcXYuGLOJYvqc3cZgjjIkg3CD+iK/vejhucz6xnBILzbEd0wQvB+F3Lgcctet5iP+nvqTt4tKbVNbQ9dPBffqqtiSxg/EVNTnZ48IPPwVADW8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rV2ozypf; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rV2ozypf"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-848568a6f62so1881878b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783608912; x=1784213712; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvTDmaZA4veBPk22tfgJT4gMaQFjXb/XSia/PA9AeFU=;
        b=rV2ozypfHj2TGjGNnzUB71uX65+x8VyG9TDAJbVbPYBAdrwcGgUaocBlYfzgD5A41x
         MIMKO3djb3MP0xx9JP0PYrCZ3mMu/p4sGaMVURBr9fx7kLZK5on/oUW3B0jB7PEMl3ei
         wUh7XWMJ/Ju0hR06vZY+ncv2DNhdgS0Ha9LdFY5WV/laQ8a6ntijLABy3HZIpJKajAIS
         xlbfu9COFxHkCEFB6GoEgpBsKS1INFLJdi9bOTyNEcDqzg+p+47J2G0m8YDL211M+skH
         ta18t0kmK7QYJDNCF8oQ263z9yzInF4V0k0/CUnBiYHUyB0zZTgyIWgTw3mgk2uP+ab6
         0qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608912; x=1784213712;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvTDmaZA4veBPk22tfgJT4gMaQFjXb/XSia/PA9AeFU=;
        b=ZFjhXj9yN8JOhnPzp4OUC1jKSQDLfVAGzejnUuxqvRnSfCgZ1NuPhHsOX63K6aL02B
         7rjIGaHwj+gkFpH0SyAE2eO5yrSc1kH1f44XAiozY07S44G9eQWzWUuiJVQmLetJgLCN
         whcGUiP6WS42bki1IywPL8svsqEQPVDyOmkGXJRFDlUypPYDU7MduDQT0S+BCuyQON4f
         tODAS28HbBsR1Ogqa3VqxUCDyWot9LKLrajX4InzP+pZZf68GjC5WILoUxzYAkdfcDvu
         uN2KJNw1QuCOPCF+nAHz7x/2ENjMth0yYLcjlcQE+h2hct+PsCWlOgKAeD9S4FTK1VQZ
         S9OQ==
X-Forwarded-Encrypted: i=1; AHgh+RruirNQzHRszG7Zgy9CdIC+w91c3FlXAYZ1zDDSAGwuPdizDUuVPk8r74T+/pP4/TJEu0xpXcYCXINFpVOE3qA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFZVSYB+JddA6NXbFT/DEmU56ZiUZhYwYSf2rTqaWgOY7XnBy0
	49gvSu2kg9WnZH2SxugMOTL1YuIhl/phL3IEG/OEddrcW+EIR/LmlFycZxRAgbLxOku1+goaCO7
	XbmSA6w==
X-Received: from pfxx22.prod.google.com ([2002:a05:6a00:116:b0:848:5740:db83])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4191:b0:847:7f3c:b5f5
 with SMTP id d2e1a72fcca58-84842ed2020mr7288680b3a.11.1783608911583; Thu, 09
 Jul 2026 07:55:11 -0700 (PDT)
Date: Thu, 9 Jul 2026 07:55:10 -0700
In-Reply-To: <20260625070914.2175124-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260528154003.3594107-1-piotr.zarycki@gmail.com> <20260625070914.2175124-1-piotr.zarycki@gmail.com>
Message-ID: <ak-2To4F5tNjyolt@google.com>
Subject: Re: [PATCH v3] selftests: add swap() macro to kselftest.h
From: Sean Christopherson <seanjc@google.com>
To: Piotr Zarycki <piotr.zarycki@gmail.com>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, vkuznets@redhat.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 25, 2026, Piotr Zarycki wrote:
> Add swap() to tools/testing/selftests/kselftest.h with an #ifndef guard.
> 
> Guard the local swap() definition in mm/uffd-stress.c with #ifndef to
> prevent a redefinition warning.
> 
> Use swap() in hyperv_tlb_flush.c to replace the open-coded PTE swap and
> remove the TODO comment.
> 
> Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> ---
> Changes in v3:
> - Add #ifndef guard to mm/uffd-stress.c to fix a redefinition warning;
>   uffd-stress.c defines its own swap() without a guard, which conflicts
>   when kselftest.h is included first via uffd-common.h.

Why not explicitly include kselftest.h in mm/uffd-stress.c and drop uffd-stress.c's
version of swap()?
