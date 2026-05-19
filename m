Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025C200C2
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 00:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151409; cv=none; b=sZ+vPLD9ClXEChCFLi8RQ5ohvrSSqrr3r+VfqM9kQU3vpKpSx4kEMwyhMy8A2rn5qGH3Aj6ZAFyKxrVpr/zAXv79gkhqDgX7x3elUsJps6jf8GesYRT86aJC0NbjPaDA+uiRue5wJLps75/jf45KSp/GJ2G7/eM/ViCqAiFxfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151409; c=relaxed/simple;
	bh=Pk4qSfP3YN5tXtnbQMBWQFIcCCXD+LhnCL+eu5cFtws=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pGx9q/RQ31J8wU1mz7BIVh2c0XIqW1gDN3tTaHTYaHLsRlqigljcETMRsnHxMEQ5JxUjWqEr4Q1nI0jEsH3QXH/Joe4Gxe8j0NJsdRvAcQ1+rJgYki75WbOQgnnUxnRQCLgbml5+LfOAmXiHicgWqmJyIhIQY/dxYK47JNDe/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ae/VJEBZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ae/VJEBZ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c827adbf00cso1136647a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 17:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779151407; x=1779756207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Xp929jg+ST6Jp0oX69vevpdtBMJe3Ax2GWRKNYZ8VQ=;
        b=ae/VJEBZfFn8kY6Le7lDg9F+YrhtufbUVpnos4AOmKcT8unxZg72kHU8ongfxyJfCN
         hHVm+FOt+1GbC1u9D5DATP82aH0M/A4ucpvXLjuIq3wA1BeXRZkkAlMyAk8idQ3SoF2O
         p+f/QwLddzaqq23hCc/exLx0svA2VHpwaDQ8+2Vj83YYMCwC7dBhPSWdDbYXaFXndK8K
         K6pmALZUbKss0L97DebRmiSFoRBlLivYhpHABxuEcRbHnfzugAqDklCVDK05zdgNF/r0
         dqNPQev6embMXp+uJVj81pUyy3//ZXg6uoNptc2c7DXRxeckU36ewHlS6uJbzYsK4mLW
         0UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151407; x=1779756207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Xp929jg+ST6Jp0oX69vevpdtBMJe3Ax2GWRKNYZ8VQ=;
        b=LNlt8kcoDtmaFmLa7cWVhhMbgnlayzgqQiUlEHQPErcpoP0P1yR/jGDBJ/FSQ+iGND
         XkLd2FSoXe93tiwtkCHylIjUjJB5bFTH8ap8lkJOGJLpcmJCY2KPZebOGfsXEsce3HVw
         7igXPLOIsJEPhzUfkoyE1WvQW2be/15YkEOzmsbLPk/rfKzZjxeGNBZL6MiSxy0L7gD/
         cbPFb9M1DGTzAJpFIpZuhtbbZMDJeNIBgVv+jPuM7Sy8w0d4Hng4+gsvTvaxp6NDQS5C
         wtTpfgg0lkyEz+DTX9Rt+wkdoCn356cOrFVryJUsnCpZ1T3RTHLKgLwvUZJiOjkcCV1x
         VSoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v4DvKYISsVrvwCuQvOE+iojRhhLpubYDtO+En4oR90eXKVD3Du5mX+r3GZUidjJTNNlP2S6dlx3GoPy7PWjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq4z16hwkboMERaMcdQMTqEjtFeWPm0TivFHT/Wg2SfBw3uJe/
	p+onL8vq7i7i81npn9KZYQYqMRLj9lTVDEbpDZ9uLa2UrSq9fWspXXxamPiNjeHX0Hl7bU2emKC
	Y1IOunQ==
X-Received: from pfh6.prod.google.com ([2002:a05:6a00:12c6:b0:837:e800:7c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8c5:b0:835:7c0e:b529
 with SMTP id d2e1a72fcca58-83f33c2f0aamr18233606b3a.12.1779151407092; Mon, 18
 May 2026 17:43:27 -0700 (PDT)
Date: Mon, 18 May 2026 17:40:58 -0700
In-Reply-To: <20260512161317.2580678-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <agMwjrRbeuJsi9OC@google.com> <20260512161317.2580678-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <177915102840.2229940.16577957714908550348.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: sync_regs_test: drop stale TODO comment
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Piotr Zarycki <piotr.zarycki@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, pbonzini@redhat.com, shuah@kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 12 May 2026 18:13:17 +0200, Piotr Zarycki wrote:
> The TODO asked for a build-time check to guard against missing new sync
> fields. Remove it, as code review is sufficient to catch such issues.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: sync_regs_test: drop stale TODO comment
      https://github.com/kvm-x86/linux/commit/64f1fa859c1e

--
https://github.com/kvm-x86/linux/tree/next
