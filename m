Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94007304BBC
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770405481; cv=none; b=p8viEQyBWIhml5mDE/dbjX9qqFfIVyPtbWlG29HotaU/iUltdo1P1ESrZllmWeNFnpsYlN8JDRNmbI5088xY1ys0dOwNh6t5bBNORNadTPeptLkYNtqcyl3GFjlKQzb1qJSQN4+aGez4KtV8OOf7Y/fZsRa3R1zIZApzMY20feU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770405481; c=relaxed/simple;
	bh=tNneEUSRpNgvU++qw3Ls81TMA3bi+XNQ+D4Ph9I27dc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mJy0MlXhIPn5rhrD0pTqTnyHRCLFjssspr0T1UC+8Dm0GzdyHix/ewmgQ71+MqsjRHf5O6musFMNQJeTDm1wSNKlqQ4teZw0nYZ6peEqh3QKs6OcvMLkavQIbKLJADXVgYrDpJF346p6+aGEE+41qh6WGRbzptShn2jGlewf4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z+rgQ8gm; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z+rgQ8gm"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c5e56644646so2577122a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 11:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770405481; x=1771010281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HocNkdNaDiGeWVOi6/l+5YPl1rtto8z6MkmTCj9sFOI=;
        b=Z+rgQ8gmnUY4bxH9TYCyBqibIPpY6mDPcPZGUjHglb/k+Ylr1v1SbNzJ4igSUpo+Jk
         F0D46uiyRoSxwrVQ8PaMVvFL32m9iclmLX3rIjsTVUaeM8nGls2aQVvkceBv0f5BQKaF
         OL7KBynL5Lahs5hWIFkHI2EJNGVNTWDx1+5M5+FKBii6YShD7yAtYP9Gh1HqNJ1+IIcq
         hy6eWqU8xIrZ29MBEGtZUjBqUsyZjMpLnPe3cTOEdhBzo0s5lBNdPBVkhPzSUZ+t5YI4
         xr5ciQytw55B0A+YYdnohlfLb1n5PctmmWHSnE3GxLqUCEqwDuHbeqSxV5WUJ8iQbTRr
         7tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770405481; x=1771010281;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HocNkdNaDiGeWVOi6/l+5YPl1rtto8z6MkmTCj9sFOI=;
        b=VLRMRjwGcaxhOLuNGKwMEfayVwXs1LPVC/vEPb2KhhHfkfymsSN/1gxZGb0gtdy1Fb
         y6iWGgrqKZ8OWSX3RieTbfLJhr8u/cJ3ZWYw0OcLmaWMsdPbrAoEMRJ6eAww+LpPulzl
         5oKLiLxe0ojKqP3yHQuSJSB9E/YTctWQd66E3CtgFZS/gVVXnOHAoLNE1CNenBu7jtG5
         2EqBIPS4OjUT9Xy8kIB0XQYy3PoXosEckxTaOqVkRnnlk0flwvk8yBQGi7vJF9MtwGSX
         n29TL4VOJAb/wl0/OBn/7lO9x2x3DIYn198qosC900TWnTxqqzJmxNQ5MOMWYxyFTcuB
         wU8A==
X-Forwarded-Encrypted: i=1; AJvYcCVl3WqtQiEFTxJ62YZ80o7W12CdyS4eUwkPnqwNQHev6RM1qBgcBCTF7f08ROxSMLDhM2rAdXBGoH02pEGeyAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRkou2c9cTEGoFScckzF8Pf5G9tZbE0yfp0pEmWJojlV7OeDt1
	Ppmq3FVWQF6PB6tQntqUi2CUKFr1NK0OFJYA/DQfLMpEQzV2sNmoYaZQ9BbUUFxJng4TMNyQS93
	YwSJruA==
X-Received: from pghp20.prod.google.com ([2002:a63:fe14:0:b0:c66:f3a8:71ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5499:b0:375:9d1c:1b29
 with SMTP id adf61e73a8af0-3938fc274a0mr7086263637.32.1770405480857; Fri, 06
 Feb 2026 11:18:00 -0800 (PST)
Date: Fri, 6 Feb 2026 11:17:59 -0800
In-Reply-To: <20260205214326.1029278-8-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com> <20260205214326.1029278-8-jmattson@google.com>
Message-ID: <aYY-ZwjEnHbY5J-T@google.com>
Subject: Re: [PATCH v3 7/8] KVM: x86: nSVM: Handle restore of legacy nested state
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 05, 2026, Jim Mattson wrote:
> When nested NPT is enabled and KVM_SET_NESTED_STATE is used to restore an
> old checkpoint (without a valid gPAT), the current IA32_PAT value must be
> used as L2's gPAT.
> 
> The current IA32_PAT value may be restored by KVM_SET_MSRS after
> KVM_SET_NESTED_STATE. Furthermore, there may be a KVM_GET_NESTED_STATE
> before the first KVM_RUN.
> 
> Introduce a new boolean, svm->nested.legacy_gpat_semantics. When set, hPAT
> updates are also applied to gPAT, preserving the old behavior where L2
> shared L1's PAT. svm_vcpu_pre_run() clears this boolean at the first
> KVM_RUN.

State this last point as a command and explain why.  E.g. I think this is why?

  Clear legacy_gpat_semantics on KVM_RUN so that the legacy semantics are
  scoped to a single restore (inasmuch as possible).  E.g. to support
  restoring a snapshot from an old KVM, and then later restoring a snapshot
  from a new KVM.
