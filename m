Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E53A6F00
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316341; cv=none; b=bYEyA4sbwpV2/E24qu4PWHy6kW+FaGxSLOcz1dXVrdOyQzft0BaUHmPGvmo+QxFE1mlM93IALMvQznv29PaRMAHv2vWZawvzX/SzW0433O/7MHPL+401+s3PWpzXAoxPwfBiF89j8LeMy9VX5j9QGdtggKrOn3Hl1dlg5tot4/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316341; c=relaxed/simple;
	bh=M9TF/2NTcxfeDuxVvVqxdJ3U3H2unaS0+16ygI5y/qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8QYZ4JWV8yLvUJlMgRZWfNn+vbUGdQXd9KGkWQBYdkCli9+uv9nLHgyTo56jl9eon+1w7NXUOsCpcJTCeNYT+I4ruVbmAFiX6UbV8q/fXXlYpIwxl5zteUiQs3YExwPUtft/tlY1jEJnpBnAvmR6VR6U1bi4XHNGZSRHgdL9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuDwT/F7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuDwT/F7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso10435415e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787316338; x=1787921138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofVVmavq8wtT0bF5YA5bCdNX53D9kSF/gQ+ziezVadc=;
        b=TuDwT/F7MC5fZXMnl64dcf5Ryd9aXKIHjluO8d5Iv6sWxDTCB8OTftL3l76WvYcICL
         GNtrESq9MLNam4z2tlE2f6Dy3oQJLyYk4FX9o4sBfh4kCZ0UmtAcEL96ur94T5IIkvA2
         qpnbyURurfR1s9BG8Ar8Zoq6/YwwE/eAvb0f0YsoUjvUaBd7G9tmXeyGq411cbYULppP
         9KAZ91nLJYWi/dHbmp3UVGEIPUoepjnTKbQhdM1mhY8mubpRYjvuiwgHkrIHzmbqDNcu
         DHIDoZ9KSeUMTdcaojQUMNmsX7kvavhPwc7irY/OFMh4fsoH/tCiiEh32T7QPzVqyJjJ
         D4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787316338; x=1787921138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofVVmavq8wtT0bF5YA5bCdNX53D9kSF/gQ+ziezVadc=;
        b=b8CqY+LMPSUZeu5Z0J5mmBlqBz2VT7o7TfCPyBiX0jU//pCwZ39M2HQTbB+RP1jd/h
         EoYn4tO2PZjCQplocnPE0T/Cq0kwnmKkRUcLUuUcxB5rsahnUp4yYl5Vw/6/iH5+4M6g
         GAHMHlg0kdNEVB6DzZ7dTf5peRV2kKqcCpSY/zLIbCh1AoK9Zw4yVK//9C0SeUnSFYJE
         fk6oMnNBMzb4n9pkk/Wx84vWkmQ5o5kQq6/0uetrwwSKr9kGCwX8hcIMIQPsHYaqJCoY
         sdY0atlL+gkeacVOhEFpMkZQmGSUi97emwCd2LeyW0PWgY0xhadi2wSqmgBcs7whrNQy
         tTBA==
X-Forwarded-Encrypted: i=1; AHgh+RqshMXhAlRMyhV0Y2VInkAEKr0x2X915FmNSd5s0yWZk5Sos48oj7GAz9aEScuukRgDEB+PdIs/v06mVQB6OPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/4Z9IvOyLxYArskQ421Lh11qQSp+8XSuHVfu1FKAAa5T9Mi2
	9Vr+mdSWzqD5xM4P/5t2oIW/OyiquvxWfbsWUEWOXYg4eC6YtIjVSLLi
X-Gm-Gg: AR+sD12I9MtOz9v42xmtu5rYb6RHt2MRBqXOXXCkCp9qZ2tzZVKhM/Cp273VFqsVGQO
	r7d8oDQ/aE/8Vd/9iQOuwS8z+uuTidCMkf/gmkVO3yAc4BuEpON52fEe17l9C8my4lhAgvshokp
	1U5yNgHm9k4/savI1k+M3jh/p02oTRO7QZUBWMfZXL7CzFHfAWCXB9/tGqYZ5cKlUJn6ZCh4/it
	mzFBDXF1RPBbdrO/GZtAzKpyV6OF5vU7BL77qwv4T3RyqLKRD2xrBlpZGO0KkVwwC0YyO+E9bl2
	0bjY+Ry5G+1NxPpqSxjgkPK4fDtuLlc9Y5B5njCVgTVN5gG0Tc7qXn2IUWeyvXLhdd7jNL+35aW
	rCloBIHxnENf5gU65Wzje84F7YqYxv4xv1N8WlEywMG/Lg6XURnijUFfyr+b9bEsaOSt3FowsEt
	zIebG1T8Couj6Sz00X/jZukIlFw7nkm6Dq/8gZnoWyAubJcsRcIKPJ15gSwPIXUvWw1qEm2wSCa
	iznPXbwWndjKsgu9H0SHEqEgVY0Ok5Gly1K9RM1ohwQ1szqxCK+eRFvGHf6XIPj
X-Received: by 2002:a05:600c:8b8c:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-499b845c9d9mr99624285e9.14.1787316337718;
        Fri, 21 Aug 2026 05:45:37 -0700 (PDT)
Received: from ?IPV6:2407:d000:508:2027:f309:cd0f:ed5a:5b9? ([2407:d000:508:2027:f309:cd0f:ed5a:5b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90f746csm27470255e9.7.2026.08.21.05.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 05:45:37 -0700 (PDT)
Message-ID: <94e1dbf0-de6e-44da-9bc2-772fd6654250@gmail.com>
Date: Fri, 21 Aug 2026 17:45:34 +0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
To: David Matlack <dmatlack@google.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
 pbonzini@redhat.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20260803170825.925561-4-hisamshar@gmail.com>
 <20260817220457.554823-3-hisamshar@gmail.com> <aoOKMeua-cNeTxXT@google.com>
 <8d069fe1-a5b6-4a86-9604-26aebe2dc243@gmail.com>
 <aoSIBnFfy4osa6wt@google.com>
 <c2f7e904-2646-4b01-864d-d185221c7f56@gmail.com>
 <aoSyYtxBpEaoBwGY@google.com>
 <c9ee5f08-81c3-4c91-9189-002b260ea641@gmail.com>
 <CALzav=fs4bqMM7BXNPXqhtbqGzA+LW5fgx2-1Q5=sTN5+krYhw@mail.gmail.com>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <CALzav=fs4bqMM7BXNPXqhtbqGzA+LW5fgx2-1Q5=sTN5+krYhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/26 21:13, David Matlack wrote:
> libuuid is required to build libvfio, which VFIO and KVM selftests
> both depend on.
> 
> How is this problem solved for other libraries, like -lpthread? 

musl does not need a separate pthread library. pthread support is part 
of libc, and libpthread.so is provided as a compatibility stub, so 
-lpthread works without an extra package.

libuuid is an external library from util-linux. On Alpine, installing 
util-linux-dev provides the musl-built libuuid and uuid/uuid.h, and the 
selftests build succeeds. I confirmed this on a fresh Alpine install.

I sent the basename fix as a separate patch:
https://lore.kernel.org/kvm/20260821122110.902382-2-hisamshar@gmail.com/

