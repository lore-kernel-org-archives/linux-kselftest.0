Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A43D34B8
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 18:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772649463; cv=pass; b=oMukhWtN2lKXeLAa349WmpLkaRaPVTF/4NxZnkguUDAM5TewT5H59yySRbW1afX3tfToB57YQ7YsByeXHSpJMHOaA6Z9kBtZtb6jWi+OUKU/9daiesFaagXnNyfk0ojPGSAYP7IBf8FDIL5CkmSny7Li1R2BdlJgew5rMtURRSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772649463; c=relaxed/simple;
	bh=0MAhsQztQctAeKwrF4Xh8Tv+ZEx/NHMxtMK7pSDmIW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntGUEp7OnzWBX3aVlpzM/r0oCt9FdTcP4GzCsclUZxJamyVJQvsLia1WinGwviVPwMpallqQVnsFguCJ7klFSXlwnWDojV99oUo0EUVJcbsTPY9VObohODMBheSqP0gbzvgnt0T9NVcS9o1xxDz/lCjr3spBJ7riQU3v02xC3ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qxubPyUn; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qxubPyUn"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65fe2d2b744so1265a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 10:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772649459; cv=none;
        d=google.com; s=arc-20240605;
        b=MhBjjdnSR7xxBqA9n8TLSXuvJfUrzmEkXpgLzkkHDKNiVQChnW0wg9Kcu/P5R5bp+E
         RZdYbV0kmX5m585jGEeceucCK+523xBYOzhITwj73NADwe076cFMi9Ik7fheVoNJPmjw
         RXvnKnOWrP8AaRNKgLaGCJ6aWUZO71Hh28sEuOZk8r1CZ5NOe3pem/HF36i2Qit3KhIM
         I2FdJH/w/kJtosgQjN0a1Cswky8xW+0MT1GIiCPMirNhZ5H/M9qJHOiuMsAAAAS6bPA4
         tp3c0mUHXQlCYNXxFZwSD4Jslp691TBMJzEY66gOAi22JOhwmP1y1zYw1/EsuEz3ILzk
         GaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qyg7JiALUhnTVHTDoz+Wh3a71GEFMfJh5eqsvim4jwM=;
        fh=f2d4CL+ULjroGgQNT3hMP6GY0FkBEMLcirLqucJHMLw=;
        b=InWn+rAKb2EEJCOohBzeSRaW7IMz29Rrwf0B58ljDMQ9esQz/lMnvKQpfqX89PbycP
         YArGHuyNZVvtbSgnZpbaKMEycmRdJdUNO8oDvTXfdYnj0qmB7JacdvDWwRpO5AB7l/lC
         0CozrAUCSC6A9foFA+xLl0pRqOttcfaLVsoLnBgRMJSXOk+hJvi3onYwZxOdIG4GSav0
         w32yLUqas/ri++SrfqFUQJcDo5mLAa3QyKvA3UVTe7t7fv1Hm1itfo/58opTRvX9i8WA
         bc6P+87Rv1VzxdzZAQIrEkQ1t4CJgg26kZRJE13UXyWvp14iWh/wnVJdnUpvWRWECCqe
         8OJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772649459; x=1773254259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyg7JiALUhnTVHTDoz+Wh3a71GEFMfJh5eqsvim4jwM=;
        b=qxubPyUnFnbLLaAU23PpztVoNAuXiam5j/NDJOMku8iIKyTbHYROy3ykiQrB6F9wMj
         P0nYgvo2c33VhCcxQHlzgUD1XZyRQluRbAe50J/mx7xFL/5X7M5RiWp+esE9/D7Kk1li
         GRcG0tQZTWrMCL0iaKcZdXagKWnQ7+8OIeB++ydCJJoSHXFAUAOETmO4lTykwS8/+o5d
         yXlB+W3BcqAcXABZ6iWUJk8bsXJa0yfNFCAqFA5YTEP5LW9CtIKMSCL1HM1PE0I6WNQB
         rLXqRVPCoRcElg4Wa17eVThd13/aDGiuu7ESK77fychFd+C2PP7VjVksZWqcxVGS6W0Q
         c5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772649459; x=1773254259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qyg7JiALUhnTVHTDoz+Wh3a71GEFMfJh5eqsvim4jwM=;
        b=R3xaKT1sBr+V4P0j5bxooYwTR+MRurlK1BdcNB4BiLWaC9rUrdzic1Rb7zSS4GqnpQ
         9wQOIrNUoTFryk0CM1TIO0KB3Q71OxxRCl0Bmu9DccEw5HHJqZlNBmMCllwLgF3JxIB7
         DdEQ2WBSxIust5SdTxYK3eyt3fLO0P66EHo/fMgMKUIDLe5jXVjMKdMjjmF8YNSuSNph
         6wf41bkxmXGZialSc+dBKnt8te7DYAsX/zcb00IYkSBO4D2SpjojHRO7CP+WJQ2A8Vvs
         cu8fdZGyT1UDDObgfRhk4Ct87puU1aLA7wNhk5FjQL/qCYJxX68HWQqwWgFtTOwAvuv4
         4cKw==
X-Forwarded-Encrypted: i=1; AJvYcCUT9PCAEjujftAK6B2ukBc5VJrJXTiZ5Nbp3debrmex/1zb53IifLBHqRiuYC01c0h8gXDBtsC/fffll4x3ipo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4ErUhagDgwGq2+yuM8Njjwv2uQvQdCONe8zZyBp2l4VQwGy0
	eaCfWDUobq+K7p3lIB2wPpItSBHUO3bMR12VKc/z7oEz5VhIv2YwuL0Hin7SzBlsYQ98I3Ufkox
	qhWFvZdkOul78i8it5wqwXYI19JlB6YWPFAjuwBnR
X-Gm-Gg: ATEYQzy0oV1ZV7sn3vTdt5HRkSixxgEykNnwqr0nfG+F/qD2hLv4lfatnniScPOujc7
	ftwzYz8bu64VN6qTUkIhLp9byMVgl2ZYHCqvFqmTFWUO+201W+3azVmovUCKYc/9WGoz1z0Tc/u
	oLZAFqSIIOZflJfUXMSyMitvMeYqNNwU42W0tnmiLYY7r+j7gMR6+U8dCuvCjz4e27AssZl75+G
	AHxHQ70DriApzijuwkkA3XhIAU6qVFNNRVXbd+RjNvlxL04LDN+GwBBwAzewuZaO1tYuibUcA5A
	HD1QpHmJLS9SU8Lh3w==
X-Received: by 2002:a05:6402:11c7:b0:65f:76c8:b92f with SMTP id
 4fb4d7f45d1cf-6612a7ac28bmr49817a12.0.1772649458305; Wed, 04 Mar 2026
 10:37:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com> <20260224005500.1471972-9-jmattson@google.com>
 <aahn2ZfDAJTj-Afn@google.com>
In-Reply-To: <aahn2ZfDAJTj-Afn@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 4 Mar 2026 10:37:26 -0800
X-Gm-Features: AaiRm50YWu54ulNxMcZtc5Mz8kw3MXpfQLRVptEK6Cn1xRR91Wdq3CyvdybtG2g
Message-ID: <CALMp9eR7gKWp8M2Q8Q7vA5hGx5bc12KCh1NZMK33A1dpiKNt+Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 9:11=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 991ee4c03363..099bf8ac10ee 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -1848,7 +1848,7 @@ static int svm_get_nested_state(struct kvm_vcpu *vc=
pu,
>         if (is_guest_mode(vcpu)) {
>                 kvm_state.hdr.svm.vmcb_pa =3D svm->nested.vmcb12_gpa;
>                 if (nested_npt_enabled(svm)) {
> -                       kvm_state.hdr.svm.flags |=3D KVM_STATE_SVM_VALID_=
GPAT;
> +                       kvm_state->flags |=3D KVM_STATE_NESTED_GPAT_VALID=
;
>                         kvm_state.hdr.svm.gpat =3D svm->vmcb->save.g_pat;
>                 }
>                 kvm_state.size +=3D KVM_STATE_NESTED_SVM_VMCB_SIZE;
> @@ -1914,7 +1914,8 @@ static int svm_set_nested_state(struct kvm_vcpu *vc=
pu,
>
>         if (kvm_state->flags & ~(KVM_STATE_NESTED_GUEST_MODE |
>                                  KVM_STATE_NESTED_RUN_PENDING |
> -                                KVM_STATE_NESTED_GIF_SET))
> +                                KVM_STATE_NESTED_GIF_SET |
> +                                KVM_STATE_NESTED_GPAT_VALID))
>                 return -EINVAL;

Unless I'm missing something, this breaks forward compatibility
completely. An older kernel will refuse to accept a nested state blob
with GPAT_VALID set.
