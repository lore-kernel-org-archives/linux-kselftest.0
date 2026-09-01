Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E4432E6F
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275221; cv=none; b=iBmOa9iIIQjNxSSgZUna0PFymJ53u2RbuJvchFyJqHFjKS7K9Aw2Z0NgvE3X2wkAujnOkKRcgZL/drKknWcE0Re6gcdFD10wQQhoSnltA7ip9ILRv0kRqBpCcOMpo3Y4YktZwXskBJjMNzvvFfNSUUuszIJYDleQ0s8vy9OCijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275221; c=relaxed/simple;
	bh=IO1d1IK5naV0clT1y60mbzjUZ1i1Ufx4f9zvROWWDdw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZJKA7bqqDzIrT1QX4fN8qBsA0vPthO+sX3mc/FeCOU4PcfTXlG8Uf8eNQ+HXO4UrHGDZfz9WFoes1RY7+nj3m3AmwfQQJh4I5hopKypTK8m4ks0RkHjBdP9OafSQolcyR+Sm8eO38QlGR+nMJQWVXg3SKa4uP/tPeiGDYt/L/NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GVzIIKHI; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GVzIIKHI"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2806855a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788275219; x=1788880019; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW8X5PJ+vB6MltrnZZz8mv0H9sxjQGZjiNCW3Xegwfo=;
        b=GVzIIKHIkORbnLsLka2BlNxwyaZaKuD/ztZeqjB4UQ8IPy7P/64cQlHS2BufEgA31+
         E8eTGRxo/b/YI8Y2TZbbn9ENA+r/b2ZpmssswX+U5FhohtUXPI12BhLXSdjeFJI5BWkx
         PgPGAM3KOrYoi85s+jMH0a6o9o9rp3Rr4MjGcdAGEdE4ysQGu0IuGKLi2OQLmv11ey5d
         4NzIsabObDT3jV9XuU0XMJgD60ts8+Jv1pi4+2FEbbmeXhZcuxSn8jP+ArfUFDzauxy1
         dk5KoazzVo63Q0/mzsNDyPDfCoPxHgEB+2r/LmiCDLsMdSQFmezlp8mwU2OpcxUXAfvG
         ff+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275219; x=1788880019;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW8X5PJ+vB6MltrnZZz8mv0H9sxjQGZjiNCW3Xegwfo=;
        b=JUINT3vUnR8DFGjrpGauHm339ZsTYpZj0zCpXNTTfgFDnlqX3mzGsUyTRF28WSet9r
         qoSkFbZqqf3TZ/zXky/DVmIzhOEzqQMWXJ5PCi0kIeu0J3Zv9epOwLPfGnZccdPkUsow
         glgSmg1pRVc5Bprnchxw/1uj2lbDWzgVM0Lb22WEgplXticmN+ZR1FxONemj8yd+pQuH
         bCl45TS/t0kI+kLAXv+ggiAY5fLC9Ve7KsiZ2TVGcpwD3IqmR0rCNd/73tXEGUftWXBJ
         bUNuyB8bzDAZ9KXwN5NQO3TIUhI08YdbiYkoCCghEnbU2wYvb4c50F/zJ+wNATfTAX2G
         Nn2g==
X-Forwarded-Encrypted: i=1; AKwUvBy1TgV3dRNKrgZ+5sFDjP8oOZvr6uyCR7HpqVPj5M/NOU3KtWS3OmYIuhb+dtvFmoLk0L/Wa/gpsEFuuRWzO4c=@vger.kernel.org
X-Gm-Message-State: AFuF++kDhnOXvP44p7eJjEgKVnA06PYbJpp/sEV9K0V0nJKQ7ZnWzYb2
	dD4B2AOl+KO7JtpywUph3XzNuj+4okL3HLrPqXe0AwbQaAQ6UFznyNawlBlLKXbO/XZypJ1Otwj
	2BxMNXQ==
X-Received: from pgee16.prod.google.com ([2002:a63:1e10:0:b0:c9a:53ea:434a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0f:b0:380:fead:448d
 with SMTP id 98e67ed59e1d1-396d0fd2a75mr54462733a91.13.1788275218580; Tue, 01
 Sep 2026 08:06:58 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:06:57 -0700
In-Reply-To: <20260901-gmem-selftests-fix-v2-3-5a273153354c@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901-gmem-selftests-fix-v2-0-5a273153354c@amd.com> <20260901-gmem-selftests-fix-v2-3-5a273153354c@amd.com>
Message-ID: <apbqEfeCQhgdAvKa@google.com>
Subject: Re: [PATCH v2 3/4] KVM: selftests: add get_numa_mem_nodes()
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Jim Mattson <jmattson@google.com>, Peter Shier <pshier@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 01, 2026, Shivank Garg wrote:
> The xAPIC IPI test uses MPOL_F_MEMS_ALLOWED to get the memory nodes
> available to the current process. Move the query to numaif.h as
> get_numa_mem_nodes() so other KVM selftests can use it.
> 
> Call get_mempolicy() directly instead of using the assert-on-failure
> kvm_get_mempolicy() wrapper. The xAPIC test already asserts its two
> node requirement.

NAK.  This is not an improvement.  get_mempolicy() straight up should not fail
for this usage.
