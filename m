Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F335418A48
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057506; cv=none; b=vEBK5joBZuswC/CyAphqxPZwwOlyBDTensnIySkHZ38bsWfkeqJ/8o/Ba/4cz6JhzHabJYSvLx9hKamFOpk+qiLM55cxdGKBO77tkin2aG4zclzjOJTB69ShpQeBYi+iDxR9V4tYCE7CRJ5NeVwiHbkqcoSlIkL6xujL0DFoyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057506; c=relaxed/simple;
	bh=oucaucGfexhkmWcECJk8W0jpGX1dlRq7Q88nEAgm+24=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cp/5kmL8aRj/O33t4FEBduoNtCdm7Z8yKeiz6uZlVPdT42q10cPiKHh/gVxpEReFNIb6jdMibWYwPzVaF61g4qdcwZ4o7jYGaE8EjdH19AO8j+fbw1PZUbLrQ4bOWLlinO9S+sCyqtdNycgKX6JKPCHpPWSVseW3QJorbp6Ml2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xr7FOvmm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xr7FOvmm"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2caf4173b1cso24325715ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784057505; x=1784662305; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9cq28POFnFnawukbQ6SqW6AutImKyLZHOnYanXpBtQ=;
        b=Xr7FOvmm+iKxa230sgfMe9aFRnAWRiyft8jclXEAbXzL4hnvwjETG1MQkzWywxVrf7
         0hXI0/BRfTUPAS1FeOBzuECLP0X7aRVjWu4+cdLgXTzZvVWNXO0YLCUn8RwPjXqAYm9H
         tAjxjAe7X+9arlzR4QEbm3QsVShYPv6AOWB6jVvW3twxgC7FpcoH/3VIoNPoJHznb+4z
         sdvr4W9WsskHYv3RCPfAeT6w5ZOGbsYVJSrcz6kOhg74mvro7+N2tnyrlmRTSaAnf6+i
         Un8gUm9SMTzpB6KJSxVE3KeAFhQpyqikhSbegAv4D617dUoj8PxH+iftc+wnCD7xuCno
         O9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057505; x=1784662305;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9cq28POFnFnawukbQ6SqW6AutImKyLZHOnYanXpBtQ=;
        b=mpYdUZuFXaPHkxLiZuVUfKGtIFUODvo3LWPjV5vwGhHu07jwsmldtwd4nFBGeHfdX7
         4T1yLkYhfK7rxh8aGDp8IoLkh2cYf1xr2a408uPujFw+FqYxzA6hOBr0xhXLrFHEmnt3
         q7m65FNXNxw+BWa2DlKbqHlyV/xWTUPikYceMZ9tjJhb8ecuQZRiofFXqJAk8dyWAG7Z
         3VBz46priucACGMblQjA4hZjYSmM63QgjMf46lDaVXptvlXeFGDZ9ztvGKmPZJ7nqbq0
         EcXFw1qdLxG5PLCX3dFX1GGT/IC6C5sMB5sV1VDsdHktskEgLqIsHyJC7ZJlIDmMTrVc
         xV2w==
X-Forwarded-Encrypted: i=1; AHgh+RptlHF1pfSaXa3e+K1AYDz7gsZKAjM/LlaLu8hajM63NR4NTfcsR67vZBMOErN5sJnGJ19zpGJRY9tabTY9iF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxewMN/S9X9qcobE2ScZw65GAtFWf+TJb1pytJVKt7CyjbJGi9W
	+xfRSu1yZqLGekgNgKvC80HhNG8zVeByEzfUIds0W03IFOumFMQX7DdkoM7NKfmJewMUGDzgNo2
	SpTd7Fw==
X-Received: from pllj8.prod.google.com ([2002:a17:902:7588:b0:2bf:20e0:3f57])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b4f:b0:2ce:fa3a:45f7
 with SMTP id d9443c01a7336-2cefa3a470dmr23851615ad.16.1784057504792; Tue, 14
 Jul 2026 12:31:44 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:41:37 -0700
In-Reply-To: <20260702015739.367597-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260702015739.367597-1-wangyan01@kylinos.cn>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <178405408856.3132315.2423130556002157314.b4-ty@google.com>
Subject: Re: [PATCH v2] selftests/kvm/x86: fix spelling error in
 xapic_ipi_test comment
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, shuah@kernel.org, 
	Wang Yan <wangyan01@kylinos.cn>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 02 Jul 2026 09:57:39 +0800, Wang Yan wrote:
> Fix typo "usefull" -> "useful" in xAPIC IPI test comment.
> 
> 

Applied to kvm-x86 selftests, thanks!

[1/1] selftests/kvm/x86: fix spelling error in xapic_ipi_test comment
      https://github.com/kvm-x86/linux/commit/5ef3668bcea2

--
https://github.com/kvm-x86/linux/tree/next
