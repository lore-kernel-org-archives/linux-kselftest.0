Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781453115AE
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787077178; cv=none; b=ERbzcfySc9g8x82kNrqsuI/Ac0jcAunC9J2LeL9rr8FhKjq1WTZrn3f8JxZSzRe/kg8Rue5VtSnACDE1NLuTBCU+saykJVBTAPw+PdU+TVQSe2vcp6KNrQx76b1aWFvs7T6e9KIVgGnFrw5Vj4ItndUFoXrsfvAcjn2CKUemZNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787077178; c=relaxed/simple;
	bh=pygKv3Wbalj6+MtA5uiU+EmhuvPucvfBv4OUcTcQdoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot8zLA04Okb6ruKduiLwfmOp0URIm4lIMsxzD2t0IdRb6Yx2o4vcD4yjbVLHQYEOcVP5kKN2+H10cZ4G561HRl36fyk/3+jXO8Lvhi+pooG8XAz02wxFSusaQjspzsWW4lsep02ILYrW0FfJbBtQ2CGJSrH5+L4c+iH7uWgKWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLXkag/H; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLXkag/H"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4813ea321cdso889290f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787077176; x=1787681976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySZ8BacOLTLDA5sq5LcB1+kAXtDZMHEPQalGl0GKu2U=;
        b=GLXkag/H4Z1qFdXEjOFCPVnW/e+wdhPUAOBvXq9HfcuciNYQ3kuwjVDVJkp1z4tmii
         EUFidZA8klrm1r06cx46Ay4e3cnFjxJjDDk6FgsSxn9xML3eO/I/HGrHvtfDqDUAmbFE
         h8J+4dghm17zesiCzK+8ExWTofJqMKUbfViyUZUQmXXuRDFLtWHt21xX3Nik3Vod13Su
         cPCVzgGU5vRgvc9wmPS2/otrmxHDpJaEAy8kJl/bioxBJwXtpI1edNOvbpMfV0VHRf3C
         1XQ2kTgPmCnygelo1I/rJcSRZu5lBnqTGsa/cGBAsNCCbhSjPnH7FuVCr50QvfgiYeXD
         TdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787077176; x=1787681976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySZ8BacOLTLDA5sq5LcB1+kAXtDZMHEPQalGl0GKu2U=;
        b=XQV7f3nDyieAD0ItNGGO/qjAP7swGvPfFZZ+TCPQ83s/gy6DOBXKnG5rUa/vPlwzIX
         YQYqxsPpb8yelygPbBlybBSjX42K9L2nq8Wxs8Nd1F+l7D0bP8/xFdAddusEOvLMWhKY
         YPU0BEZljCmXMvRZRGVqvRgoWnmcbOpzuKHUaKkuU0aG8g/5JXStXTVclR+Ry+sdu9Fv
         57hRYGgelSm1r/Dsz6xmiD84VGIqHuajcv2yeGBlhGRQHKIuiQSQLpHe39VdQGqF0M3f
         X4z5dCiYxjomRNEbbwgDNrtOB/1hja5hZzCkoQ0U+SGbdRn6wv+r1NZjqUoKOWCOXaAU
         AQ7w==
X-Forwarded-Encrypted: i=1; AHgh+RrFPWCsOPw8ffiAVdYjAHN3+FfjCqmUZBxP+G5SQlM6esFDLEwx6gqKJq8cRvIUXGzpJQzunlNXW9OHCcezFfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBpn1nWzl8mQnnL4vpa+6XvvY39rD23eoSJSTO3YAUHxQGcYn
	jUJPSOmF4/t5f2EFSupknAJzP4IcBzon27leliZbf1gij+wpHuf8LX2r
X-Gm-Gg: AR+sD12k35pfC3GyN8vUjw9bHwdwUywsa+J0Iq94DL9InVHN7IwaWR3WLWcVwQp/bBi
	R8gzL0agiFFTioDdCfLXpo/a+IR3sgJJ7FAxEprHqYPDhns1bD1wfqj93aymRusLQC1YSoQOO6v
	IvLhxC9/aJuUBM/flAS8PiahUEnUvqBLiAc/nWjvJQskf6EG3spiPCOSrzESCUD0wmBnVsxhbPL
	focRoIftHdiNIB34q68NqWpikhnFZDN2iJ2tkKOnWGDzHN2X1PKGgQF/gtjqtjWCjw5f9SYtmtV
	j9FvA9CcZ3DHnTk1c3mka7EYXlXz/QAIqgFLz+u0ZMAnu0BaiPUDlYyG0CxgZ7N3RqGX7S/45nv
	R83ctBr9LDEPQyQKREATonzyi2j64o51eX+Tkx3salPockTqygZ3+ooP9o3LlPBhvZ8GV6juqgx
	zD07brVLqKIIgAp4UxDuxn/0oxCy14KST6JIzWt0IQBHpm05qZkck3ZhWFKHKVuJfI+cq72N6l4
	1yxjIcpaGcfgKUksotx3CsKYkUSNIISfVnLzEAIe3t/Z8lG1ePEnn4g3VsljrUVvkc=
X-Received: by 2002:a05:6000:22c1:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-482a9d5b7d0mr14376721f8f.0.1787077175538;
        Tue, 18 Aug 2026 11:19:35 -0700 (PDT)
Received: from ?IPV6:2407:d000:508:2027:311e:5c97:f108:813a? ([2407:d000:508:2027:311e:5c97:f108:813a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b816f7sm12956144f8f.34.2026.08.18.11.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 11:19:35 -0700 (PDT)
Message-ID: <c2f7e904-2646-4b01-864d-d185221c7f56@gmail.com>
Date: Tue, 18 Aug 2026 23:19:32 +0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260803170825.925561-4-hisamshar@gmail.com>
 <20260817220457.554823-3-hisamshar@gmail.com> <aoOKMeua-cNeTxXT@google.com>
 <8d069fe1-a5b6-4a86-9604-26aebe2dc243@gmail.com>
 <aoSIBnFfy4osa6wt@google.com>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <aoSIBnFfy4osa6wt@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/26 21:27, Sean Christopherson wrote:

> Oh, so on top of "https://github.com/kvm-x86/linux.git next", this *is* the last
> blocker?  If so, then I'll grab this for 7.3.

Not quite -- I tested kvm-x86/next + this patch with musl-gcc, and the
build still fails. On top of the steal_time fix already in your tree,
two more musl blockers remain, both from code that is only in
kvm-x86/next so far:

1. hardware_disable_test.c, from 496779b54943 ("Pre-set threads affinity
    in hardware disable test when possible"):

      hardware_disable_test.c:75: error: implicit declaration of function
      'pthread_attr_setaffinity_np'

    The call sits under #ifdef _GNU_SOURCE, but lib.mk defines _GNU_SOURCE
    unconditionally, so the path is always taken and musl (which lacks the
    function) breaks.

2. The libvfio wiring from a262fc49e0aa ("Build and link
    selftests/vfio/lib into KVM selftests"):

      vfio_pci_device.c:25: fatal error: uuid/uuid.h: No such file or 
directory
      sysfs.c:31: error: implicit declaration of function 'basename'

    The former adds a hard libuuid dependency (its headers aren't visible
    to musl-gcc here); the latter because musl declares basename only in
    <libgen.h>, while glibc exposes it via <string.h> under _GNU_SOURCE.

The rseq __GNUC_PREREQ failure is already covered by my patch in
linux-next. With the above sorted, the musl build passes.
