Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850C143FD1F
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656245; cv=pass; b=EHr5UE3/zq3mGYQGJooltQ8ZcH4IjU6JYJQko2DLNkx8m8DKx/JKwDAb6Kaco59UFPbqCpGn63VyTD+CCnVksAYzzVuOAYZuqi0HoJd7SrZj1m8vbCmsERXXf0XDZptPAwJR9YYN2r2GUe0Cks4M2rsi2qw4BN5n5MdUQSMkYDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656245; c=relaxed/simple;
	bh=qX1IR39uVwaDaiwu+D13suWfX2py7eKUr7A0OiCh9ro=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abUTOZZww6QiVqmgP9Fjbak7IlRNiAT0F3ThNgEu6CcL5lNEssKL2wXTWRVi8deRsa7IFbo5bQ2gD+B6GTydfY4YjbddsRDcZkrE7G4CGPksJXcBJYtQkBbxgpyuMotvAe1iD3+LQIAROq3aPv9PYDUroeAbe5RJXvgzMq52GnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmlSZbTm; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmlSZbTm"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cca0c5799eso3911045ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 14:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786656243; cv=none;
        d=google.com; s=arc-20260327;
        b=Xm26OeBE8UaGlFe0ngUx6rdOafCjd7+g17Aibs57Mx4EKWAhV2GlpJjsc9OzhPs9+P
         GcKmm502Vm98ubhiKcj2JbuNhiFirBSv5gQAguooJzQ7GEwlXXknHI5cyrbnTOldaZnv
         X5IxsmdgKEwuowrd9079EK2IdPihi89M1t7faU37JPM3xgDnoDew4AqVG2OqauMREjgZ
         ss1E0wrT5DKWK6j/8A7kM4G+whhVAuwdBo14dWthlRj5zcIMeARH5CMp9l62v7N6E0Ev
         8sSuk1NRkn7+wljxp8JInleamjHsWYHNfV6K1LjRz5Cx/d69L+HJfPqBWKDNrD4gl934
         rJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        fh=jpeAIv77Brk+v8HMbCTV7UUmW2rTeDbHRTD3CWpMtjA=;
        b=pj1961QkZo1ixrqKWTDFTbUHnQhh9LsVLCkiN8ENXxcPu0ZaaFkSjVlGE+X0Tl3YuS
         PA0UIjhZbn8FEUaYhb/oS40/193GPfPXDTuWHHWfHcr8h2d8FlP32qlT/ZY00HVU3en1
         GH09lFKsOyfhCuPjYXLpNp6LdzKddMPH3qtQZ7e0x5hTV9BY4SLdYMOHC0BmDxrbc1/p
         /sYViHWBbCRU7uH+apA8TTvbcU2H2YJrzRCvZs7SMg/CR+jd2yHZ8nCpSCC5eI5vlKY6
         1Usl2CWoYgk5ol+vipCx9rDAvZSVpMbV3Zt3MXLd2YJTJAuIebG2QunuHShOz34glI+V
         /g1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786656243; x=1787261043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        b=hmlSZbTmcwlzQzA4RAjRnm1zAMk0yOyDyMiwa5V5oYk5WEKaIOXTCuTjW/Jlww969n
         RaLdn6beYoaRoNFonZ+vIsG7xCCg850Rll5+UitkFZtfYQNfslPNDdeBtmwBg2rli2nU
         MXkUnasQN7YFrsk8p/jha01pyz9cF+pDF2TJhhkTEpyyefnyQE3q1OOsiPiRx7shpwi7
         kjJwqQkjUbmXB9amDQTCo1siV5u0ey8SE6OzW+nyNIZsLGZ6LXYqWXWz3tM1rOwqUHZo
         66SZmjsv/sgA4jd5zAufZ8uZGxGdzR9I3b4fyErxjshJDf+8pU2H+m/XeDZ4NTnRVx4V
         Ef3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786656243; x=1787261043;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        b=sxILkxufU7wa+mXj1s4FRCleOjp8zhqzq2xoi4tfgo+zgoeyNCPz8DwC8FI3vAFKrm
         LqTUB6Itz2DrRnESie3+b1KRzpDpVZkKhXI727xmomrUH8CkZ5+++4C1/1R1mZasSOrU
         ouDZIXXJajkaPtvHkCBPxBjI6mv7f+kNFKgs7nTawMj++0lNxVjCmjPUBOe2oL60CuqT
         Lr/tTNZIeSTKHLbZbcCSty5WJIPd8RoaxZ+L4iiUFcucQwYWNCSLGjtUeFOVPOELQ5xm
         pfTW7UbZ0xYGS5f+LcPSsXDSM9HI5JJsayAI4uw+wyJY+dhg0zZLdlFkDhbpIbmBYdfn
         D9/w==
X-Forwarded-Encrypted: i=1; AHgh+Rqw8lpurD0Ey9u6sOjOJdeD6Hrh3X6ugwHanckAtxdzUfIVKvaWFGolwhpKR9uWDdwxo6fyGeWBMeqX10vwsi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LdXnynOdLzlEKfzKyA3ZWpvPoxPuBZKWpBEIj+T6R9Sioe8C
	HiXARH+JjrMg7tBQfqM2/BopSV3DXuzOdBMfebDrJ831o9Qqw4thmCJ306Vv7ezh8hs2VyDttic
	nGN/zELf+NeTIEv7kpT4wElTYe3etDXFXBFQoWmZ7
X-Gm-Gg: AR+sD10t6mRGnGB+Qi0QjSPD+B9pwXfkEElBWNhRro3u/7G3aC3Eqn7kqis232FcExN
	VU9mrNARoK2vUwJn8tpzWVaeuwhuyBgleDyKgmzHLZsz3TibibH8JZC8uWnk5W4kusY/1IsCM4j
	t4IhJHi+IfhV52MCMtOrGMHXi3sdtr1r4eGtGraAopYAnfXhK+tbfmFWIXt8oDtdpIgIsM1RNST
	xK325VrMY2ymX/FfcRI70kBPUH+g+Mfc9JmIROfiULma/UmCyYld95S9WTTN9CBXUaB6aCh+TIo
	SUnLMK/a2mQ/UyFDwNxeaN9yqaDwZKzoKt0zkvFQAPwGxiSaXS4IvhhDVWiK9NbfFO0+SG8UviZ
	XuXkTBqalheqBjTH5tJXGNIpxJue0zg==
X-Received: by 2002:a05:6a21:a4a:b0:3cb:d156:d362 with SMTP id
 adf61e73a8af0-3cc7196e785mr831997637.3.1786656241969; Thu, 13 Aug 2026
 14:24:01 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:23:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:23:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <82ded1ea-e0f6-48d9-8bcb-38a6bc5e9176@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-20-2fc18ee6d3ba@google.com> <82ded1ea-e0f6-48d9-8bcb-38a6bc5e9176@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 14:23:59 -0700
X-Gm-Features: AUfX_mzbri1ixV_zlf2Jna8d8Me5Qvc_rxP8xrcIgsSaQjjAlnxnniHAuo3sYt0
Message-ID: <CAEvNRgHpy52iynKfXeEkyCixhhu0_Hnu5jSNT8i+BNxvEoG7Cg@mail.gmail.com>
Subject: Re: [PATCH v10 20/41] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>>
>> [...snip...]
>>
>> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
>> index abb108886733a..2c3c22aeafa54 100644
>> --- a/arch/x86/kvm/Kconfig
>> +++ b/arch/x86/kvm/Kconfig
>> @@ -81,13 +81,21 @@ config KVM_WERROR
>>  	  If in doubt, say "N".
>>
>>  config KVM_VM_MEMORY_ATTRIBUTES
>> -	bool
>> +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>> +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
>> +	help
>> +	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
>> +	  memory attributes.  Using per-VM attributes is deprecated in favor of
>> +	  tracking PRIVATE state in guest_memfd.  Select this if you need to run
>> +	  CoCo VMs using a VMM that doesn't support guest_memfd memory
>> +	  attributes.
>> +
>> +	  If unsure, say N.
>
> Hm, does that imply that a distribution that must support both, cannot ship a
> single kernel?
>

Did you mean this as a documentation comment? Should the above read:

	help
	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
	  memory attributes.  Using per-VM attributes is deprecated in favor of
	  tracking PRIVATE state in guest_memfd.  Select this if you need to run
	  CoCo VMs using a VMM that doesn't support guest_memfd memory
-	  attributes.
+	  attributes. Select this to defer selection of where PRIVATE vs. SHARED
+	  attributes are tracked to KVM module load time, where
+	  gmem_in_place_conversion can be specified as a module parameter.

	  If unsure, say N.

I think we should do _without_ the above clarification since using VM
memory attributes for shared/private status is intended to be
deprecated.

Is it fair to say distributions should not support both, and if they
_must_ support both, they need to read code to figure this out?

> --
> Cheers,
>
> David
