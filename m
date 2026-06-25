Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0B1F3B8A
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 00:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782346791; cv=pass; b=LBUKyYo0XybMJ8EjWvya3P0NwVTdDfGGaTxlFlObO5yDDCCS+p+zgYX5bz6kFmCy+ccRr06pZGqS14S3eyoU5Hf6PBYmNiJ/zyO2e9lb19E6fbvionpypWzCnFDJeIfNyBVGTv7zKDeGsTYx5GzSOpxPRCyaovUrl0CCCB06gyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782346791; c=relaxed/simple;
	bh=rLzvOJxIQU3Ts0wS9KKJCuJPkhIJBlsf6U32nXubaQQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcldMCHh4Oub++B8+ez9NUjZtknknJjupH9jshEPFxci724UZ0vLXG4tVpRo7uwa8pAU5+zbloSgIyHbbJll2jco9BaZTWiQ9KyhvscEBy6rpE1CiiuFTTFZ6szHQzva6S7MyAJin8Ec8F8Ty+svp/W+gNlrT+5VSWdnWMHR3NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d6SJ8T8b; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d6SJ8T8b"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-139986373b8so2266413c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 17:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782346790; cv=none;
        d=google.com; s=arc-20260327;
        b=nnUcesA3CVHKEMpILHPF9ZhaIvZ9QgRM0h7mj94viIWqnvfkeKzz3yavUNr75iToIE
         Bub1hnrFoyDB4FUwcJf61J8BE/PFYq2GOQV5uRHHq+5SVJMrDlmt0h0RP0NPvLCYStoV
         Fo+DPqIpNFgj1R8HtA3A6lCYKweQibC9b0mWOT3qo+3Bjf1NN41ePbGh5s62jX+hBGiE
         18YQWxhyD2DPBbhSRn9DJns8KAOfIVCM1l82RrZlwHVpHOYTd1FWVF0kT4WzUBjU7ItJ
         GhROqriBrlgqEma0k5xQb0ttM3zT5El0n6Cv1Wh7gxc/22G+GofV4J9jb7D9QLMvNB4o
         VNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        fh=k36FW5ZpV5T71Gs+NFRovlYegRzVpATQURshQCIr1wk=;
        b=bM16KPFOVsSlkPyNW8RlmXxUrd087CQaZN23dH1Sk+N6N6ybt7C9LR5cDEUVfI5gYf
         Fq2l/tEqqotqaUWlrPRhqsWb869mmRqHN7/pyEBV6TUluqRB7dfVnk91J01/CmCyaZzw
         26xcy5uOPmUPiIoSqyQMT0b3rs/tBtM5NlQJT7/mgeIEqpSQSZ4WVbFLJSqis9Vv7KSK
         dnp29RqXLrbGLogEzUeFOt0syS/RAdTOkQ2r4TdCEReeEdL/OB+JbCDsfD2jddoHeSrz
         cYIuJHpKrORDbYMXTtsLBXOS/2NVX3SJOmtkt5yR5yFW20pZNL4aayTCV7vHBdhbDJ8T
         LGaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782346790; x=1782951590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        b=d6SJ8T8bFXONBDv8sWkZAq4UxMY1A+sKJAuHT6rEAa7dMvyVDEJrMh1ltaIaSfuquJ
         edvG+HIKuITzIffmOLmoKSQLPZ/dt54ReDIf3J2wnsRdhVmFvN9X5RQdKHO3Hjrz3o2L
         fpjxSMr3L8Ohxdl75FruWF6/Ned4s9TUgu1wtKXLR0M6y1ZjRFiAvapds5FbrNstpsZq
         c7r0yPZqNWvF9p1/Ps+v4YJby45kyjrQpZNQ4yJ6vDfcLnF1EkmBQRaia3NGo1HqfLIV
         h/9MjPaFQ88X58vnGtO91tzkrlUTPflsbxRF27DR7/Fj6XdjYStQIF4j7f7WMalRPUIJ
         NC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346790; x=1782951590;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdGA3bllvZfq9+oq5ATtnUq0c6NavELb8bI7ZCuFA30=;
        b=VpkT3KxJECkH66RhnQU0z6wEz7jMRjkq9k017eSbdSgHOlWQcn99TTqF2W9M6YpDS5
         E5QwqRP8kglO22gUvfmJfw9NGmZFGs6iCfhRBoHhWXqYTvc8KldffNXfVgyV+9rZgqjs
         /EI59kOIJeUfEJe2wrzu7EihK1PmI5V0wOqrInprYD91lwarLcoAN4HVMMCQhVqSq2UU
         t2Rhe77LoyGafzUXeUoX1Xecjn/8U6s5uzVgeJYvflx66a8kss2R0N0vH/HeIiyMHVrT
         MGDWxbakks0QZG6pOS2k3RmQ+PeS2vCBPnAPsx5fPavZeqR9J35Q52l3t26TYKDBdy1v
         OjeA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ct6PALSXnO3y96g9eNEPzPRNW8to+qfe2HwpT2OC2Lh+lcb3eDsBc9tysxBAbPvk1J8RNSEYrDWpILTBWCl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7DmJ4GQNn8tmlm1Lp6g2eod9rTx4LzbN91x1ww+xfe4QwhFc
	168i5mTrNT1384GUIPkZ7x8N9v3Gk+K6HZSOrKRn0/woLWXvv67nUhdfYvuLocg+ln+L03TdyXn
	uU2G6gWdPwTiqO6TJTFYSPgNnRqN1Et5vhqtT+7Fg
X-Gm-Gg: AfdE7clUvTvfuLpdc2S5+aA10AkLTlqUnfufTeu5ttwptvpdq8xlEHrih7K9in1KyBt
	gsNYaz2ITx7UMzD4nAdK5if33P6Rc+QgoEMKvfNpffOi6pm0XADnLeNTaaaaEg7aI0OqTUSbCaP
	a6O4Y1jBDJipKBTSeJJnkS6iBSnomdWtkHxLEJQC2Xi94oXzJQAuztNTIIhq7Spj7QoACuNQZQp
	GFFq0n2OFsnbd/3owKLt6S1eSFq1+6t97w9qbWM0/Cz/FuQ4DRwDkUd2U6MsF4VrLspATRRvhky
	h35VeRuta0BzD+horogtecy+LXkxwK4F00P1chm5G6vegSVa7+kp84y1IQk=
X-Received: by 2002:a05:7022:611:b0:137:f001:fce2 with SMTP id
 a92af1059eb24-139dbbc564bmr255822c88.33.1782346789006; Wed, 24 Jun 2026
 17:19:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:48 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <9f81ea12-98c4-4ce6-a95e-233851dfe8dd@intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <9f81ea12-98c4-4ce6-a95e-233851dfe8dd@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:19:48 -0700
X-Gm-Features: AVVi8CeR8FAzeQAvNnM15yag_GxBRrpO8H44tlQVk9R637S1b27Bxjsp2TDXvkw
Message-ID: <CAEvNRgHR-6X72fvx-4s+RrsMHohSCBu53bVX4G3x-=XGLnOxiw@mail.gmail.com>
Subject: Re: [PATCH v8 00/46] guest_memfd: In-place conversion support
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> TODOs
>>
>> + Retest with TDX selftests. v7 was tested with TDX [12], but the setup there was
>>    wrong. Conversions were successful (no errors), but the shared memory being
>>    tested is actually in a completely different host physical page.
>
> Glad to see you knew it already (I was going to report this to the
> original POC TDX patch)

Thanks for reviewing!
