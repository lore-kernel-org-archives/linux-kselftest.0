Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2447C401485
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522028; cv=pass; b=fAZLkmxCEamTzmC3EW1OnYLKNlYjn/lHZ6ogoCOBxwLPvNF4n3yFaYclwCrHX/1NzLhaOuvw9CtDJA58XLKwKrCawa6bu07A2WZ9cRYFJIP8SHBU7uxhNYCm4Xl3kgYh948SR4aYZY+5KPnvIAnk2S8zgBEiI4RsZ36+P1k69uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522028; c=relaxed/simple;
	bh=R6WSQnJIsA+v35uGQtkq6O8mYZ7zBggzE/oxP9twkYg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqbNbktL+HkfLOFpFEH9HlCi2vrx+zd/uD2ke65X15vrGOjekPNgSS18Cr4/H1zgmvjNXOlmT1cggNu1Slo8LXu44+P5Mwc+hxHLhxmLdLzn93bCWOB62NoZb1a/tgVIL59p0/+K9Ujl5v1uZyzOXZPw+IWVDXovt1N2wc1gUC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WbpOTiLd; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WbpOTiLd"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137f0aa125bso36396c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 14:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780522026; cv=none;
        d=google.com; s=arc-20240605;
        b=HJM7I3WDytBvo6zr0d5ZX11w4VXYX9vTqE8LQTpvTJKdoRqI/RWAsi9eS1VEEkf8sj
         hloRR0DoziHWUwOsEvYfIVpQqCz6ll+vW19iIlIu7M0MwF9zYawE4m+cd3YPKmMMG6C0
         12TORUZX3LeWIgIEktFAPuUvVhNTDGLAMiyf0lCqsVa/dxqwLaT7T/ic8GYKSqnEZ0ad
         R8u2jJx0nGHsKidGx8QBKsvt+kIkswE7HYJv/rnp+VHzGRq1QjeC2l4iR5pcS1K6/TQ5
         Dtk0XxwyRAJFqekfqL7ioTO7xiDuh19FlMNucrjUdXSX4HT5ZB0r5PfNyztqRu+W6ACe
         cR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=kXmCClVJ6sffKdNaL7Yv6BlzVuWsmG/JEBjIeBbKKjE=;
        fh=Vx/rji01Jib9awx6LBPn89gkkG2qenE28T3kr4JqN/M=;
        b=LJNB6FwbGzx+cfjnczTwuqv+i6F2aaMnBhaMgbu674SZYa9AOA7VnGHqYUxjLyfUnU
         qsMVytIAywcJsjUd++si4EaycXrXAxnN2sNAlUsnAdYVk1iYmDNcyvtsArZJHO3LYXjj
         NaJ5zZelhyrc2J7uPPhMV8eF5Gi45wkxGM9UvMNU+3xS7h643plRxAhufhuk4m+EZLZi
         zUPvvCjqGCE7Bz1AeUA5dDTOaff2iqnjFWLql68PHzCwaL77d5Lr1PixONj9oCr8ADmp
         qKUOmOVcJmJiESlnVrVg8EkMqXyowPxm/WDbMG9ncVxbPM2peSQw+S4iN1Ene5ae/hGt
         QQ7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780522026; x=1781126826; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXmCClVJ6sffKdNaL7Yv6BlzVuWsmG/JEBjIeBbKKjE=;
        b=WbpOTiLdHBvzmwiTpMPVgbnII3vNyO3SNsoPLH6VIEBacZOPD4FZRi9ouBmHzGfdyz
         qQr4UPLmfVX0Mna1x41GMFNRiJ8Tp5lxjh0qK2tOVIkO1Qx2eu5e61n9gM0VwSqQRiXz
         inzjmgz0zLFYc43ghOoSHDJoDaSuI0qkD/ZgDe543j47DoVn3kqcDvcT2bIpL4xc8VDq
         CEB7XicOiRBqR7dVAPk+kgjQJYxCxZ93tk/Ljic4NKSKnTRB+EEYoFl6psuEc5NDjHnC
         B6iSDmEgjThK1D/INgd02VnCj/BaRFqwLruf0W6rr6YaUbM/nHavujSCNm9JhcxARVqE
         AYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780522026; x=1781126826;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXmCClVJ6sffKdNaL7Yv6BlzVuWsmG/JEBjIeBbKKjE=;
        b=F0UoJfZwR9WDt6VzJfhZ1/+i0fYKZNSize14CgL461kz86gKfZ5JkWn9rXbVrelXrm
         nEyTjsaycKZbo15QfkOEyBwMSvAYuPtZNyHOs1my+Ny/QrGYaVoQ57sAxOTkS20eqMzZ
         eCJNG+NcVqlMrst4EzW6O06TS9JGfLTJYXPV0kDZmYpqCly2mZ7CsjlbFd7/EfiPZGi1
         rJDuKnO10teS49h5yhBdRdvYnvpKJCRIB1pY91GHu1ipGQoJpLG08NoNtn9fDf2lKJk3
         03NoaY2nShgVhYfMEq0orMyPl6221HNw7I6TZrDzlFxrd7786l73SZcnYAjif3vz1NwI
         L30g==
X-Forwarded-Encrypted: i=1; AFNElJ83z8vZ2XrTCUe+h16FuEgDIu25dfKqxGgaMsnPsWnVm+cTk+ZB1dfjdHwoxXf916kDyFC8xx/hGey12gWP1DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7wlazIWxROkCowX6lUVtydBeMf5lf5QrVd4lmAu91GcQvvrak
	Ug7o3GF/HTa+ziMDh3qVJHdX+FsPCpW1bFNCi6ANAiL9i44d/Q+CW67UBuTwOv/FwBuDAeiU8dX
	kWkx2TJmUdqesz0DZDkoXhJsnTpK7SeKtGIAJFmw/
X-Gm-Gg: Acq92OF4qB/2AAOdsCq5QWrNAyeAoTeCZCs6owDKGjwhfdP28Wp57yDWfbW0xCMX3C+
	tDrEY2Wh4xulw0tsuZB2Ub5ifMfUKCNS6JCgH+ZbfJwrk/bMzxqriWXHE/dwE+KP2kqdlBjVF6O
	hKdE7+fBaqTjxmrQJbO3m93iTSzTDrK9T1koktDBE85Fr9EDuT/h67VwHjKH/81qhoL3Q+PBeb4
	l1NpuOBxsXa7zbmgC2mEjMtMy+Yz/+DKY0i46BPvzlThKY4L835AZBcZHcPAfXMQrHNEKABI6j/
	Pp+Qj/dQ+IggRT0nZYpr2APP/EpgsC7AbYXirJXml6DyY0knAQHPCPEX5S7XqDhv+i9hVqyKBOi
	zrgGF2e/ApnrSBIQ=
X-Received: by 2002:a05:7022:1285:b0:130:9b78:b17b with SMTP id
 a92af1059eb24-137f6befdaamr2412541c88.38.1780522025275; Wed, 03 Jun 2026
 14:27:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 14:27:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 14:27:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 3 Jun 2026 14:27:04 -0700
X-Gm-Features: AVHnY4LsErH-4tZ18bsf2DQ3mNo93pDC9YYwJb_gB-LjwgbEb6k0MtNG-ciXWJs
Message-ID: <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/42] guest_memfd: In-place conversion support
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> This is v7 of guest_memfd in-place conversion support.
>

Here's the outstanding items after going over everyone's comments
including Sashiko's:

+ KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
    + Need to move page clearing into __kvm_gmem_get_pfn to resolve
      leak where populate can put initialized kernel memory into TDX
      guest
    + See suggested fix at [1]
+ KVM: guest_memfd: Only prepare folios for private pages,
    + s/non-CoCo/CoCo in commit message "INIT_SHARED is about to be
      supported for non-CoCo VMs in a later patch in this series
    + Use Suggested-by: Michael Roth <michael.roth@amd.com>
+ KVM: selftests: Test that shared/private status is consistent across
  processes
    + Improve test reliability using pthread_mutex
    + I have a fixup patch offline.
	
I would like feedback on these:
	
+ KVM: selftests: Test conversion with elevated page refcount
    + Askar pointed out that soon vmsplice may not pin pages. Should I
      pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
      take a dependency on CONFIG_GUP_TEST.
+ KVM: selftests: Add script to exercise private_mem_conversions_test
    + Would like to know what people think of a wrapper script before
      I address Sashiko's comments.

[1] https://lore.kernel.org/all/CAEvNRgEVC=fFuKVgZYvWyZD7t_zvUZihFG8hrACjvtkD5cwugw@mail.gmail.com/
[2] https://lore.kernel.org/all/baa8838f623102931e755cf34c86314b305af49c.1747264138.git.ackerleytng@google.com/

>
> [...snip...]
>
