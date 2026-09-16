Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F054B1D0B
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585628; cv=pass; b=RbBNtdVLDbGsJoBUahIZ4W8f55xbjY+xn0vHY23jdsk699bf5HKnUrj0bq/LzZdHROl7i4NAYpXQxBixkkvbVwEbnnyHi+JrqijJOd1p3xNk9FnxS2ZEGYXq7RaIVMu0Alrkk+o2UM0HYGo0Y6upRTJfsWgzaTlBe+gO6a0+gVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585628; c=relaxed/simple;
	bh=YFbcwtgNuX0U1EJKvV9Ul//2Ots1PofZrH0PIe/ShVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYZ4FtyFzdm2BAhuM4tGgjiE5LbEEA/bdYxYr4Di2sFXHVPCSRbsRmkXn9FpmZOvUqMx7IlvlwU0cH1mwlE9qBX5VimKFEAMVCh9+tjrTT+6wo/P/upF0Ph5p1lkEoEnzi2/oZovGasOkgcvPiTYqjJKKLtosPEuhNUo1XAKO0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UEwPAwcB; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UEwPAwcB"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so1677a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 12:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789585605; cv=none;
        d=google.com; s=arc-20260327;
        b=HQNEdvqJ2hq/cvY7neAGCkiSdyJ6ifwzZlWkT9XKeymc5/Gw6sQ3MyEESIF+ipzUjE
         0sOOIxKR73SQBrqaoOK9Zw1xYulnOIYIHA6NphYT0t4Ggmz83qZT11kFpchYABoNhsWu
         faXWgHgKv9hSMyzm71YpeWCAePhgE0Dlqr+kLoIxZ207W/JKo7if/SthZ0haCNiolQzE
         U50XMqRu8Rbanr9Iw4xkU8Qs+ZXLEZ0x9ksmiuEwwpTXC1BGa9SxTZapj0GO2p/3uZyU
         XN7VcmsdKCyNGR/LB86ZEDt3JKUVgUNwl0z8Y6Jljug14hx0ub3DZEoo9teGdKw5ULqM
         fTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i8q6HHOe1ZAhbklRTyDXKcKv9K3nDwMAOUFrm0T0XXw=;
        fh=WlF+OCf13e0v6oEK2rKo7XWj4N+VKjoTeDJRVCbvzHc=;
        b=YvhKyyOn4zBzyGO/UzcSZyvspw6IL6pMO+8c/rzV0hK4hcTboJ0QZXRjko89lTisO/
         RuySTnS44yK6xxudaNgvSBHZDBgOg/Mzjo6Xqn4GbC7wIjqoF1o8gVjeUht8OYrbvnGT
         U/Qp4srSq2tFU0LWwX328Chk6WLNsmCG0Xz/7EkUlHnF4juvdzdNgF3k5SdZd/EEOOkf
         jQk0EOTo0AQ+jcQWrHFeTodKvI3G2ck+/IiDxv7Wv8HcEehNGwMJcpitIsuehXAcaIGB
         +CCCXcHEexQeEXmCOCWP7E0Fo45Z9OGlEPv1QOk0WOXffE+twngiBJEvq9F2ULlk6QDt
         sw7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789585605; x=1790190405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8q6HHOe1ZAhbklRTyDXKcKv9K3nDwMAOUFrm0T0XXw=;
        b=UEwPAwcBGKJp7rc++RIRYesLfdQ+S0085lWyBL4LDVLhOtVwvpIJeN+Wx9285wB3Eg
         QXvzFPLMQPkUP7HFHWag25Xiy0mo01/6MHF66S9mjVK/w6FWsjMki9G6icmnv8HJKPSi
         Ab9Kd9DkOJPjfdVWXg9xpvgUX6bLY1AOOY4vZOCFso+hX/285VODKZULbSOoRUSHtHez
         5H9cTXObDWc7XVlq4KgzSTzjCEnUvHEcwZ9DUTRsigiPjkO0ViiK5MCvsKOXbO7Y/v0M
         7KjjbxNRsFatmNhtrpYdkYmndMo7tNg8Rtbe+MYTOjTrNnHa1jkuU/qiqG3m+83aRVdR
         MeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789585605; x=1790190405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8q6HHOe1ZAhbklRTyDXKcKv9K3nDwMAOUFrm0T0XXw=;
        b=Tuu2FWbTSL8EwE0vwMa5p28jgUf7V9cTfUCNoIwx2UAQujCxku0XmhrSD8OkRPD+Ht
         mtlbU47ZxLMOdegBl1QEVp+TsOlw/0D074gQ63XDx1wk/o5JJANpm4KQa1nsjdZ2pzff
         jbfavHGeM7F0NePZagBfWKCqXOjvz1QCmxD9L7a32k8y4iWcNaZPqCtU8sp1TtUViBfH
         aYnJSYghdAhuZecOSalYoWXaOL1W5GW9Zoo5qz7jaavvI1vykjUVXLmS52lr73034EWZ
         lxhiMqGmbX7Y4kflnS6r7ylt8tuVL2OS7coMF3bdREbg1ZkUEo1iyTpds/X0CpX0XW7v
         mBHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6ZvDJSq6oS+nPr1t4f28i26F2UKvFVRCby8bekqhXDv1ZEabmA3sK/xWM2WHLYit1KQdA84zhuCsHfGYIwww=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ7B/v0D6tOJNf7uMRCNUy65BzxjFRrYU2hFQ/n22j8n52FQyG
	nRtnG0tsHlhwmRwex4Dk8bswSEtrRZxxpupJS7s1OqRSsFEuOAkmtcAiNv63xU1vHkl0IcEUApC
	gLZ3tp2qHUXYEfI8PlfcIR6qwjE3HeSaQfQXCKed3
X-Gm-Gg: AYBFou1xrxFsxfMm76BTRqrxRcoT1HE1qQyeF47Rf62s7VDNuZ5obo9LGN2ghcQVp1g
	/TK3RuBbmi+mx/MtxP7ewNhLe3FtEz91RK9KVDYKcrgTJn483dpwm2USozGFrPhYDaz5iv5x9u7
	RLabt/Jo03HDm2gYkH5PuqFeVGjlP1FF+dTV8hjjsfCDA8Rgq2mLFArNdlOivL0g7GcE9QLHVDx
	lUlUOBJkUumm3sU/HwDmvKMgheQR61b0/z94krawfyla7+ZqsE/7nWX3zMja65z6t4F86Lv4AMw
	Dvgoehm0li/4OBs/OyDgC8p9PLquDYBL48T3EZsxCIRpK1p8eCWpcNg=
X-Received: by 2002:a05:6402:b2e:b0:6a7:453c:a166 with SMTP id
 4fb4d7f45d1cf-6aa37503e67mr7027a12.1.1789585604831; Wed, 16 Sep 2026 12:06:44
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net>
 <fc88f299f41c99ddb5851c24d97970dc29584876.1789281096.git.zhang_wei@open-hieco.net>
 <CALMp9eSv77sBcfYpPJm4Uk+9CePV7YMdYXhvBHKHSvacnnRBUA@mail.gmail.com> <3451f275-d88d-4db9-acb9-ca80d717df7a@open-hieco.net>
In-Reply-To: <3451f275-d88d-4db9-acb9-ca80d717df7a@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 16 Sep 2026 12:06:30 -0700
X-Gm-Features: AcwNN1Vb7avB1LnW1gDR4-nqujxfy2WLNfEbAl-1PKaPYp4bwb_CEzgH4WJPJXA
Message-ID: <CALMp9eS690dzVm+H55U23g8r3Qwbk4V-=vp-J4Ajvh-iC4J_4g@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] KVM: x86: Provide INVLPG linear address to
 intercept handlers
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:26=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
>
>
> On 9/15/2026 2:23 AM, Jim Mattson wrote:
> > What if __linearize() fails?
>
> This was also my concern with using __linearize() in v5, which is why I
> initially calculated the address directly. I wasn't sure how to handle
> its failures when we only need the address for EXITINFO1.
>
> Simply propagating the error seems questionable, since em_invlpg()
> itself skips the invalidation on failure and returns X86EMUL_CONTINUE.
>
> Would either of these approaches make sense?
> Option 1: Factor the address calculation out into a helper shared by
> __linearize() and get_invlpg_linear_addr(), leaving the checks in
> __linearize().
>
> Option 2: Extend the existing flags argument to __linearize() with an
> option to calculate the address without performing access checks.
>
> Both would avoid duplicating the address calculation or modifying
> ctxt->exception just to obtain the address for EXITINFO1.
>
> Do you have a preference, or another approach in mind?

I think a comment should suffice.

EXITINFO1 should be the address that INVLPG would have used if it hadn't
been intercepted, and the address that INVLPG would have used is exactly
what __linearize() computes--even on the 'bad:' path.

I know it looks like I asked the exception-return question as a "test," but
I actually just realized the additional benefit of my suggestion to use
__linearize() here rather than open-coding an alternative: em_invlpg()
makes an identical call, so the two must agree.

The APM, as usual, doesn't really cover the details of the corner cases,
but on the Intel side, the SDM says this about the exit qualification field
for INVLPG intercepts:

  If the INVLPG source operand specifies an unusable segment, the linear
  address specified in the exit qualification will match the linear address
  that the INVLPG would have used if no VM exit occurred. This address is
  not architecturally defined and may be implementation-specific.

That's just one of the scenarios that leads to the __linearize() 'bad:'
path, but I think the same logic must apply to the other cases.
