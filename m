Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C9E37DEA3
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528694; cv=none; b=N1mDYgkRukWgy7bubDRXSbhp6qvhqbAJY/L5JFbyf3upFd13cRwKeiH2Ei4CUiUEtY443PYp3ncUY5/8p568pSA04s0u42S82AC3c2cJbYHyVtn9qcivA1aObBUkaSen9fBk2xe6pU0Um2/og4jt/5Lk3jLPmGrW/R1l2/Mxs6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528694; c=relaxed/simple;
	bh=LliCEIB7cSqXro5g5Bemup6pVO6DvqdB4CW1K/BGC8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E0v5sJ7/vwHVCKojzuJXxUCOtARWeLIm+Ew/ZBQ1acMrN/BXN9sbtknOSOx2bNR9ezmi6cNrC72Yng379HT9Vd8Jje+LnPE3JF+PvJ1GGnOQ1VHAVFd1+LCA0/5KWKi33VZpxS6KR6jd7bxELUEqxkvzlpn7XBIfsRt7ptlpgjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e2w5iW1h; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e2w5iW1h"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so2129574a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785528693; x=1786133493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mohi3fwyxgZMgHq0qHNtqMEnkOy5lhGMQOSIxwStBVQ=;
        b=e2w5iW1hhKLa+VhohXY/jz2YwYmwEGC3xbRlRWkTA7OrCikxzAzRM19XhLdWxseZ5C
         7oXKRtRqev8q66yVzkG+zbAIzsyTkL8Z2JZYhlxWuu+Wi6fggD/ShQLjIZgEhHi8cgeU
         VjUxPE8jX/Nt5JZAqQdM8qsRM8eE3ALYdWRTw/af1KDi2H2sQYeDhUPoL4tyNvFGBxzo
         kHuY+JGnjXpqbu8vFSFFcw6GNM5GB5sdZlitQrVVbOklHTt2p4aOqArQkNidfobALUz6
         Yz1yXOble8QXSAhPTzf02UQRnAzQ979axJ0CcFwFbFemRAgd21B8LIxR9ii5ivhJim59
         HakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785528693; x=1786133493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mohi3fwyxgZMgHq0qHNtqMEnkOy5lhGMQOSIxwStBVQ=;
        b=Qx5E0vDPwqGYj94z7PwUt7QM/TC10UTmlR/kdXFkZ/E/+zpYwq68foR3HcHCFsORsY
         6ik3grj6g0+WMkQoMjzbx0hOXvuW/lfh0vKnUYGT4v9GMKtBRmNYZXGMS4vxiM4hBkI5
         77cZ7YMvCSxFoiovyQNNYMZuGB5oapVzNG6nK+IFt+9IYitxZ9FazLxpMnrFYP6qnTia
         e1//eg1JZ94QXWM4sMbV/ynvgg8YWW3vRUpjeIUncuMDPL3cYKvNTbFdV+XEi/9dfKuZ
         9UYDRfSOBwRHGaO7O0RnJSFBCNWCxFWemmKAkybqNggnFpVuyUiJ0pzZ6S3mVKeTnNHP
         QHUw==
X-Forwarded-Encrypted: i=1; AHgh+RrtcN6lslUCeZ8ZB3DoynYtZooRDxnrnMfNZZIjj49jczBSg+BUI9hxRGPxbeqErVeK/xMtc7oTbQ8GW+FWuz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlyc/6LZ3xKXdXzcpWHLuFZiBI7lfbUENRmV/Ar9okoSQIvkci
	PAgza7l7WLeZf9sahjqFN2It3EQrFWL79lVpmaIUWyUoHMAD6on+Llwo23cBI6/xcr46uxwt5uN
	4uQEtpA==
X-Received: from pjbgz8.prod.google.com ([2002:a17:90b:ec8:b0:380:60d8:dafc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d445:b0:38e:5717:9cc8
 with SMTP id 98e67ed59e1d1-38fbc56c639mr915252a91.31.1785528692799; Fri, 31
 Jul 2026 13:11:32 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:10:07 -0700
In-Reply-To: <20260717162838.1562808-1-shivanksharma2376543@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260717162838.1562808-1-shivanksharma2376543@gmail.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <178552833004.2710599.12265437445033912305.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix typos in x86 and riscv tests
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, anup@brainfault.org, 
	Shivank Sharma <shivanksharma2376543@gmail.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 17 Jul 2026 21:58:38 +0530, Shivank Sharma wrote:
> Fix spelling typos found by an automated checker in the KVM
> selftests for x86 and RISC-V.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix typos in x86 and riscv tests
      https://github.com/kvm-x86/linux/commit/653857a5af46

--
https://github.com/kvm-x86/linux/tree/next
