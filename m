Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E503B52EE
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433018; cv=pass; b=Nnv/kt4+3JR63JP1AoysZ4QseMnCxNl+Q2bpO6F5vVTnEo07YfuynfLQ9rheiYBvBIc8+M51lAbJr571Ij8DAElB9T4opkishHIvxBBuGajzZivn8cK/pxhMAGIwKo01n7rtAnR3hoUCcE0p+8TnZ+BUFQNgaQcwGus99NnstW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433018; c=relaxed/simple;
	bh=bEZVfjW3X/ZJJhJsMcL2gQZGx4De7c1nlF8QDVmWlMY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph4jhesV4vw7SoHWQt04Jo6VoAzThS/2qcBbPGp46W9j2Qg2G10lVm0U9AEx4T9im3X8BuDF++8X2l5Vp4hV3xGJDGwMzctIVYk5or+HN/ZRFM7GcUPCc3p4pWw/lw76nhZf+dS/kl27LYH7eGkurGhxGNX3RA/qJKvBSltkGnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cagJfX0F; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cagJfX0F"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso38822a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433016; cv=none;
        d=google.com; s=arc-20260327;
        b=ftuOU/T5wQsLbrrZfhavpfCkR0iPiju1hlbx0A8TtziiO12l+WDwR4evyjgfkplkFB
         wKbjBgIB2FZhpbHPvzolqrnJKGbfWqAk9lHU2KtNYdGr729ppLqduBpq1O7PU4uLyt6L
         I4grD2iwWO/HqKA/yYK+xQf3pJoVYs0ztOW191cqXJwBQSL7FQggR86cMWSyXoBCsMbG
         lg+Ntqlvb49ADOLb423fMQlo+jAW9rAGegx7n3yTcxUVtrohDk7mLxHX/uNrL77b3KiY
         4AuEeP6El42r7goZ7ZSo047cCHk28cfCl0NeM5XYAyUIewJshJd1ZQi3TfpTcWN54t1H
         QZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=cF6Glwk5JHPcXFLYP8vDOSrow7Ekc+sBztL/w45l/K8=;
        fh=k2M5+le0vr3qB4AfMXUEMpfaL7Ua8Ow45VRBol8cKiE=;
        b=HDVV2x+G8hWibc52Je/jIw3hwrqVuX6dnRh+2P10MnelI4djgcoHcmwLc6kUtuwhRC
         /c9kjTUDXozKayH907JJhRnsDC3v1Hnj5r05sgUDC5oj8Yi8iUv+sQQBq8Qw2AzeLTQ0
         vBYBUDlq475WPOOeC5jr8CSs1iiGkvwxn28z/HEZmq9GU0AYnwW5j1Ql0WiQyKKRyut1
         dE5FlwM7e7kmhGl1XEeDi2qJ+5dwOD3LByVrcHs4Sp8n9vh05ZJtspTVzG0NEv1mLlWK
         5vBiLPz1A/RFOS+TVJnryxIUwwJ8lYcVbOaxCCR42j7lPLln1obwHxM4TKdpBg7Qhzk6
         CKrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785433016; x=1786037816; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF6Glwk5JHPcXFLYP8vDOSrow7Ekc+sBztL/w45l/K8=;
        b=cagJfX0FCSgk1ujuaijcW4jPR/t8fGWlyob+Gx8vyrAs18Wjrm/zgCJCz4fd5qUFYl
         d95wNBU20RdJe9VwhCkD9FRzlgChn8vRXrJJlxoBkTzaO+61XDz8ticDicbtZdyTP8vS
         EwzWdbDOk1akmjDje7XW3iX4NKCec3drxMv+LKHJFLBxTcVnFBBb2LzRLQ4qcpQ5/64r
         jgsxwUTpw7zQcs85u+bsR0TG2udwHua8VZealKkm1IA8BItSYdFmLMfrOITwvFQ8BY8k
         ykTxQyKuk35OUGY1nsMRUP1sNOTx8QEap+3AqMtr2wAyQV1h1PtXzWFqCDnJF8/RJJYs
         OJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433016; x=1786037816;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF6Glwk5JHPcXFLYP8vDOSrow7Ekc+sBztL/w45l/K8=;
        b=iSBMOD8Fgbcg6fyjja8Gm3QQdzqnmMxX2nTQgU3kK/sL+mTwlxJoPCjMKJgTjtwzFz
         uSwWPzlaroH8n4gD1nnI7EFio1+mPKgkDB98odRkTy6mFvM7BshIr6NFjTJVgQxR6kfO
         z14KDMN0qtCH5e9PADVt3ugMzHZRPZ3VGqzdpQcex3XORB9ySCOlev37m+F4ZXqY9WXv
         IvFlRAOYngAyXNzdlaWXKDLt+5kVaT4ZyrAPBkqy9TbToY+u42aGNOZCqqxFxhoL8BiZ
         6HzSCkiQs/otaYp0h52uz1wrmbO5GfHRVdTlLa8iaDZvygrrFhQwXYEXJjJ2vgDYRDjA
         Nfxw==
X-Gm-Message-State: AOJu0Yy48Jf8U8akhzHH9BnpRusYJsqQXWmV+iBpU1FutO3wvWpS02Qp
	bT59wM3AsnMizAu3bBI1yXdwchVzrsXL5FE1E2aSxNQFHqwA9fHBTU+QL7RMOCUvCaIk4qo6vkV
	hP4jv6xbsPbGVZ0Kclb+gcK3o7vfoHV237NuI3cZm
X-Gm-Gg: AR+sD13JVn9+8AcNPJVXodv4OpDu2vfaI7l8nesw2Jlm9kInqYFPOQGRkbsIeJuDQ4e
	SKUhK5DR0f8smDTx8BXnNk3LYVYke6mZ9Em03wirgRQH+IfUIWkxRpnd2hi+oDLzdjw0VES6myj
	ggxbPKKE3+bZFEvGDXxtg5dqrZICTenbs+bxcAlh1iCfdL5dTtoRpzUteMnyPrAWOvfV2B/66VG
	ZvI0EPYLZ+aYa+q4tF8q4u9Qzo+sU16bP0qWy5xd8nHypUBi0P5/w5EcTUWAXqWJT3syLI9zA6J
	8DVkc2P0zbHUnMsI8xI/HyykqeUXbulJ+KT9XsQnB8W4j8XY8O3BobXs5SlvOq92dF5wvKhl/RN
	K4KGbPRVv7c/v+0yvLhiXSUgkpA6mnYyPig==
X-Received: by 2002:a05:6a20:d805:b0:3c3:8651:b302 with SMTP id
 adf61e73a8af0-3c90072a2acmr3423693637.28.1785433015659; Thu, 30 Jul 2026
 10:36:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:36:54 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:36:54 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-3-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-3-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 10:36:54 -0700
X-Gm-Features: AUfX_mwFoYwitx3VhlqJDH1-k0l0ItJ6i-x625ej1dYBsVgzkh7R-MZiFMgMH5w
Message-ID: <CAEvNRgGazT2D-G7sEem4RD5nUEj7dmcg8vx2=3bpatS_o5uE+g@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] KVM: Introduce kvm_create_vm_file() helper
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> - Move ITOA_MAX_LEN to kvm_mm.h for reuse by upcoming kvm_luo code.
> - Introduce kvm_create_vm_file() to wrap kvm_create_vm() and
>   anon_inode_getfile(), providing a unified VM file creation API.
>

I think these should be 2 separate patches.

>
> [...snip...]
>
