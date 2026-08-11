Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF2314D06
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454828; cv=none; b=aAJ4RLYRy79cgb5KBjKRHI57B2F+iOqnJ3ktFCZowckkHpXdnryLftzua5CA1KNtkAFb6ekx7wC/nfsMHzkemgpdbx1rlBBXfmjRWqRHKtz+e0wEExCtruXKda7UJw0kwqcjvHBNiFf6vDRERYXCYrHhKuB6PTVcbQaiTUztu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454828; c=relaxed/simple;
	bh=HSS2ol7a0YjbjSr7IwadkoiUtq++DDqP02Tw9wqOwC4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l+r+4tzWsoenxUCK824SlYTNiiDMmXrlM4QqyTFLaoP5DFzYEV47fz8UreUHrvz1JflYAQz631aZiCMm7GiM4ZmcoGt9nCE+ftZomNogyRqLeCcpllMy5tIilF9S+XjjKV5yJA9yih2mGrMDN4ansPNM/07IY3WDYJr1LUoREBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aWSvuH3+; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aWSvuH3+"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6983e9c028dso2220945a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786454825; x=1787059625; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHer5Euf93guPyEW5SSggQ6xE9fM7y8lLNbmZzisUY0=;
        b=aWSvuH3+7mA+n7ro+qrHnNOk0u2ma4PyI/dkh2Pitat2kGzwFMYEkuZyT0YuEGQcO5
         oHi2q0Fng5EDiMiyvb+6mLLvSyiQJqT9mXITiT3IkcYPOkPHfz2ZSCUQd1zq6OnTxqg6
         rA125X5oBFfdV9abSbExVWJABnVRLlT5PT/5ppvv4oqUL0snnmJAzFjeba5lpfCk3/nf
         0zv34+XAZvQj1RaQredVziC9xZd7Wc7PklI8/lZY7MQOftLsw5O8YELLVVTbWAN0VHMJ
         KgCqzHmqCbrCapRCtN/oup8SRCqw4j7QUMMHvK2xdaKMnt0et+r9FaQ7AVYwdDT970+M
         bsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454825; x=1787059625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHer5Euf93guPyEW5SSggQ6xE9fM7y8lLNbmZzisUY0=;
        b=BwgpwMBpUAanylhd2Ge+oF2FfktUIdqaEg+SqqICmi5fDj/4DtRAfXeCMco6nFoCSz
         NdWXax9kqtnxBpabfTH5dMAaxQw7JmK3kbU2m4bdzuYdNn9BltKiFcmwlbuN+56asTfk
         tIxULtew59mR7GVklXe8Wh7C34W+57Fy5RxVCilP+Z2b/5WGguRmV1w/PTk8GtuRcIHb
         32ZufrEWdMLpxEBjywTD2YwjhR1VHBJcReyYXcWM5DjQZHMESoKeSX0CW06s33t2MvGD
         ZmefWsLP7l33g/9DICfxWMftIaGjHkjpNneXBjEWha7HhtTcsFB9M/3GiNcmLOKzuJnx
         E8SA==
X-Forwarded-Encrypted: i=1; AHgh+RqdOeN53NfJBfB2Yn018C3no0OQVW2TIqOyY+ZP2dOu6dacXLsuLhAXVik0FXEB4YkO9Jf1r4ILlP1JNhRfavQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+i/PAbSGhWObseRT/UlJOnG9Pn5ycrsJliakq7Q4ybnym5mYb
	wGC0xHpuJLwAUpfAy+YJGVGSeaMFUiLvfqmq0QemPTgwGzaa4tzbQDiZGv6Fnz0vTUCqIaRh1JJ
	6PsOdcujzFyERPZbq9A==
X-Received: from edsu13.prod.google.com ([2002:aa7:d98d:0:b0:69c:835e:2527])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:210f:b0:6a1:b23d:e962 with SMTP id 4fb4d7f45d1cf-6a36c32a68emr218706a12.8.1786454825019;
 Tue, 11 Aug 2026 06:27:05 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:27:04 +0000
In-Reply-To: <anpZMemVz5yC_WLo@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-3-tarunsahu@google.com> <anpZMemVz5yC_WLo@google.com>
Message-ID: <9huzo6f8zt1z.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 02/11] KVM: Introduce kvm_create_vm_file() helper
From: tarunsahu@google.com
To: Sean Christopherson <seanjc@google.com>
Cc: ackerleytng@google.com, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	linux-kselftest@vger.kernel.org, andre.przywara@arm.com, michael.roth@amd.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, will@kernel.org, 
	vannapurve@google.com, maz@kernel.org, fvdl@google.com, kvm@vger.kernel.org, 
	oliver.upton@linux.dev, kvmarm@lists.linux.dev, alexandru.elisei@arm.com, 
	skhawaja@google.com, aneesh.kumar@kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, kexec@lists.infradead.org, 
	suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Jul 28, 2026, Tarun Sahu wrote:
>> - Move ITOA_MAX_LEN to kvm_mm.h for reuse by upcoming kvm_luo code.
>> - Introduce kvm_create_vm_file() to wrap kvm_create_vm() and
>>   anon_inode_getfile(), providing a unified VM file creation API.
>
> As Ackerley pointed out, changelogs that are literally a list pretty much always
> needs to be split.
>
> These also need to explain *why*.  "providing a unified VM file creation API"
> isn't sufficient justification.  In general, all of these changelogs need to
> provide more of the "why"; I can figure out what the patches are doing easily
> enough, but in my speed read of the series, it's hard to figure out the "why".

Okay, Will update them.
