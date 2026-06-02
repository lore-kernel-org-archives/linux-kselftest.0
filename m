Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA2388890
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 20:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433174; cv=pass; b=koeDxlqoID/2G/j62nHuJb/bFYsruTSPRt7oUlHy0KET07po+IkoJjkGFXXo1Ohp3vwAfUmQxYUH+vfkDikyySMytYPqMd9LNEOy9uHoEfpjHVLtGR2sErsqOeudFWTcvx6ZWTtdsyckBqycGE95QIy2eNKQ029TgD5T6LZJzdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433174; c=relaxed/simple;
	bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seyTKiOM++Tl33Eld7qdSu1ujB681kv6G+2MfmHWtqVXJvL2i3oGpnH1a2MOrrEqrMsYZGYHfwlKgV27K/slTejADl+rBG+f6cL+gxdqGUrHp1bAoA2j/Zzi/P/u388ZsN8WjWJPcra1XHXNiitMR3k/Gi1zxZ16Bb1oCLPVbp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J96zf1ao; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J96zf1ao"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1370417c01cso11878349c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 13:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780433171; cv=none;
        d=google.com; s=arc-20240605;
        b=BMUc+hGsoNQWIzYxeyJmja7/4lOVw14ukrRYd6Qm6hw/or12UMM36Mwd245z+5wiAr
         lGNlTCF0w4byQ+2EZzO0WaV8gqvfOhDgW7t6KUW6wIcwBCmXKYsXS9orFaDJSTnduhpe
         CXPxhD8FYjVLdIQ550BTN8bOxPDJyj2Iwg5e0DO5UWGMT/LgvZT6sMb7Ox56OC/ee+Ij
         nBSGtjXRbrNmbASRfcrVL3VSoQt3P7EtYLrTomR8OfHp1IyKMDE3PBiY+IaKgWkBK7UR
         h3OYT1uLPipQR83S7IMn1x6fysF+1GP/LAwxDDzQqItNXKZu7d8rnnmv08Np1a8xrBx8
         2I8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        fh=ZdDS6MgE6YwaeNlR4Xb7NjZBI29keXihiUd+xREGxHo=;
        b=IozjmjMI/rwxi+gRaSK07x0X61J64r3HQ7MBBou64LqO2YLvCWalz3uIZmbAbhNqg5
         3bdRbG7cDnDj6HPnk84ro3SODhlPFnwIYP3bu6AoEhru3AH5/ZxwQm6Fop/F6+87bEIZ
         4he+PxaLId0dfGTlBt5R/1WjsozEQzCoz1R5M1AyYhqese1lQS5JIo2mai1AeuIgT2bo
         1WuAQygF6XzKaTjZu++K10BCEPDlU0bDmq9NlexqAv3PX1mNSGsc/I7KyUwAK61y5wxN
         yg8DvML/WG8xpEFuuBpWfDpy9/3AuHNv3ZKQrE0rlwaImVW3U4NAi06SW6YEuNPCW3+I
         s67A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780433171; x=1781037971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        b=J96zf1aoHutplBwfLO/64O+CNeopimd5AR+Qq0gZztktw3Mj53SEgF3ePR6KnN5fL/
         sT14QVXNxC3L6LNgESEqBwZDtkaGBb7kF6pM7YkYc2Y/BTQeaPbtxVTPz18MXW5ub2eE
         7zG5ouhBHW2QqdcMUkYkbEQwPc8XbnHCSWvKkVca2qP/pKyViikNglV6lUzyvwo3tplM
         gjPJHNesb0t6QQ9RRyldKevy+k+kNb9ww6yXVHHeHKvYETvJcd0r0RwxaBvhASDzI6NB
         l8U9CLVO/LL2PhRQsBZKy0D4tbyIAREFylXIkrW82+ajcNG/FCfQW3Vb2MEPN4QVXdMW
         /DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433171; x=1781037971;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        b=HkCRfrVCrJYWwtGF8UJqL4WGwlP4/mGW6ZHaUsyvXFVEX/7Q8QUeyt9+lT81QdCQOt
         LH+W+IEkjFMPjwqN4TMmvRemG9SPFcrP11ZyCDbFdatc7msMA0pqOvzMGhLH+nepmVJc
         YimswHbxSBvLoSICoKwkSnwqGPAS6S4L9JVmmfep1jvW+F1dgoZt/M+jAaOTbvMtA2nA
         8YcaqCNTuCfjKHJC3Fz1ygEXuGUlKf+5y7Y5plyRWaioLPlMPzrSjazbWhdA/64dm49H
         N4Dy6WYmkMh3xORpQMCxUTS2HgPYfYdDTdTmuLEYrex8eU8RgEFXOtUXVpZLnxQ5xKXW
         yScg==
X-Forwarded-Encrypted: i=1; AFNElJ86xoz5moNRNyfM1/k0rZ3gmJO7CqnwWEGNgoxfnPDU6C6YAoB664mQAZqKtoZeTgCagQxUd1UoQKjyPXUw/4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YydPiN5T2/w4NccfFH2Q6jF54bfLFtqPrWzSA3fiIzepElrBfXu
	XfVl5Z5WZL2gZx3oqtsqJu/hkJc5/KkmgZkGQWCFdSdpQhmlLXgTf/Qyl/ldYNf/y1GUnltARZl
	Z63ZhIY7sWRifuxSaDvGu6NoIYopZdtlQJM8ko6BI
X-Gm-Gg: Acq92OEvyQ6v2k8HLqYTG2ckSeguO0EzfIpdhGXGN6lrHpjo/h41DZsCyBaFDbqHhMs
	nILzYVhV6ZYb+/Qv/8YKvYYjncZbgW4TYjxmBjXKiABDDGf3k+ktgwenMAWiUHYiTIIBqRTBVVO
	qQYv4jRemUehgFgbk5ViGk1QfbXwE7oUiJyPDwrWyhE5OnM+Ra7obvUXFcAl965xB8emQIQcfcB
	8RTnm6g3uI4lD045GoANE/fZLs0By6F1qofC6323cYJ6IlvmCvmcheb9gqqc63v/lpA+xNeIHvg
	7NVz/WHR63Tx8avNsBpdPXt/VPj1DOAz1ITLzUcMLBRuNGWkZjrBp2FWzk+RKUgAM9EK0LHqLjQ
	wgtVbN7eOfOpK2cg=
X-Received: by 2002:a05:7022:ec86:b0:128:d7a7:5271 with SMTP id
 a92af1059eb24-137f6bf3cd0mr110847c88.28.1780433170429; Tue, 02 Jun 2026
 13:46:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:46:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:46:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com> <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 2 Jun 2026 13:46:09 -0700
X-Gm-Features: AVHnY4LuAokUCPsMDhhGv1NZjrPxAfRb9eFwDvC0vBskqE74-aUqfHm3K8vBqpY
Message-ID: <CAEvNRgGzOnA34WyOHtkOx5MZDZhOHaXAe+nD75AiJsZ-PsTSFQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org, 
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 23/05/2026 01:17, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> All-shared guest_memfd used to be only supported for non-CoCo VMs where
>> preparation doesn't apply. INIT_SHARED is about to be supported for
>> non-CoCo VMs in a later patch in this series.
>
> nit: s/non-CoCo/CoCo ?
>

Yes, thanks!

>>
>> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
>> guest_memfd in a later patch in this series.
>>
>> This means that the kvm fault handler may now call kvm_gmem_get_pfn() on a
>> shared folio for a CoCo VM where preparation applies.
>>
>> Add a check to make sure that preparation is only performed for private
>> folios.
>>
>> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
>> conversion to shared.
>>
>> Signed-off-by: Michael Roth <michael.roth@amd.com>
>
> nit: Missing Co-Developed-by: ?
>

IIRC this should have been

Suggested-by: Michael Roth <michael.roth@amd.com>

IIRC Michael suggested this on one of the guest_memfd calls, Michael
please let me know if you remember otherwise!

>>
>> [...snip...]
>>
