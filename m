Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EBF36997A
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582751; cv=pass; b=c2Bz2T2CVGBz6ukWWdwuGNC0y6pIzxJQWg9BC0CTBB0mgnDCEBvNk+4IC4wvoeoxaHJDFvZj/zC5Yn+nTI9iRegcSpC1TbXYRGKS1CxYvYqs6MXms0/2VyNUfM49hogSrmfq368qMDexJaRFqn19fjL3CkzHCxikzbDtwvxynKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582751; c=relaxed/simple;
	bh=HjYwTd5kWmHq4WzayeX05JXI6uq7QkVWkmVqyAOIZIg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzgIuSUPBA0tIdJpVj656ui2g1ta4nt/j/m8VZB8fsPe+fEmYod4+LJkCCDdwiazLtS8UUMF1JoybpjGeakwMz7Q1Us1XdiSBOUXeKLU8RmsYHxFYtRFx/HQBd83taz6eNIkFnMf9Imi+oNLSsPJlKUSG79HIrPLHeKnt+2RcEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bP0h7Zqh; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bP0h7Zqh"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90cabe38a61so7119586d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 07:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582748; cv=none;
        d=google.com; s=arc-20260327;
        b=YyKi2OAMU1ZaGpk2f8SnQ/JtPcHtO1nVHLQp9ehOGcliU2aRag+ew8N95hUeEo9FvV
         de5QnSDny+MK81aml1iBLoTyn+uQTg9uWf9kLnsgOVkNfkCjZoLdYvqCzNPA2XQYgnQs
         TVJKOgUFwkc2+OaUvRJ5eby1IoZ9lHL/iaXWVvBPO9wHK/FXKmIXhAJnx0XPPV4BLL6U
         DHTZxrDC5eNEwRZuqxFaE5Nq2+IZDwCd68q1t/n6eBFumWfQlQ6MFsjdYoRk2u1QmbbR
         L4cg0EQYbm343lfSflwofquuYhy+Rhq0BxWa2W6v9bHcYvl6NU7ebYS2UkN3kIWh1rJX
         KQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        fh=Xcld42hoI6qlfuipTpPbT3Jy4GR2wb7rvYVmOU6vgtY=;
        b=r65dbjg7kAGMU3iFitOMqQrKfixQA9xfQA8WqmPbidiZqblVPXkMr03R5dU+sshDK+
         zQsQJOtIcz4weIvxoXE8K2gSInELfQ34BsUFTI7fDSPYZQlgwPZABK9eCsqJNH/QHqkO
         qlo1juceCcSR7hYOwz5+04FNIlMGw+aCPh7nwWlprSqHw+TqNXIy1RNkMEYbE+JHHb2i
         GS4n7F0cB+VtZuiCefPFbOVQECqMInERxjSgDiNmRrhzE56gHWJHFofFF8afEmvT6prX
         V5U4w1C43RjiLDp4ksYogkwRUOL/n2fAKhkmsQbROoxoVI2zflVvK0iP6hMG+uei7Kh0
         Yapw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787582748; x=1788187548; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        b=bP0h7ZqhRP2YZvqVZFGgMR0GPc6dwH6/vzBF6W2hb+DmQUHbkyzIIorUyBAK/VYuoS
         khNXL66K3q3Dbw1lqJVp87tc+5faJbejMLEd5pbky8AHTNu/qv0+CzWTXfiL7NoF1wO9
         gIn8WMJMzMPTvdevPI06JkZ8qaL+ezt+fkYRBb/RNi/bGHuK7fJ4CkYqnOkRJAP++Tsx
         vKWmYJtP/phj0tMvhrH/J1pqucckN7zM3HYb/UqD7CkgP3PpFNhPDwou/xc5GuMhJSaC
         wOBR1ynPpBCfH2eBAWSB3KrKWOSLJGpIpIKTGRRZ2dIawrhmIy8md6FJvyzmo6p9n1wT
         O06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582748; x=1788187548;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        b=iswATjV4MvutAA2w1uVwPmck5iTLWKyvhxTCYPFSB6SCW74j5EZHKvXPUnKDyCL8r2
         lYsAYwLa4IeaOrPWK9d5jkpQqbCVMqJrY343nyDBnabbRepeYBRsv/QsrgVTJ3N+gxTR
         3lt8llZpKsHMG3rUobjBV29S7ObqE5G7UJXsCU4rtv8r0vHXimtYXEbI3A00pkpDTCuB
         dULvMkGdj506VgMnaWEMY9hYQ0Ja70Kt8fy93PL4V/ktuu2/lIsrZAc7obiGfYSMFl7d
         5Cl7tvRepphAM/XgTGuVXjnw7EEqHm+kDrEn7sXVqn2aZnolnvvR6NcwyKKLvU4kn7Sb
         jtkw==
X-Forwarded-Encrypted: i=1; AHgh+RoH4Qjntx7sHYoiNoi6Gmm4vncUYbWPMTRlUw3MnhiMTyO/RNZiX2EHWvOWBxVnUppSbso9rVDDaPl4wNiyXzk=@vger.kernel.org
X-Gm-Message-State: AFuF++nJLaH5XuFg+sAMEYPILeLIkw+hKbOSESBFGn2GjKrSKRzd2RA3
	dX4FKS+DZ5rkNdqfy/SLTmfWSiWo0hyIY3f05KcxCbedZNA5XeVJSPxY+t0FCc09L4tXFcOsuEL
	8si8BrHOqRNa9JOF+9kllI2KVnqTKn/74UU/Mvf4u
X-Gm-Gg: AR+sD13vnmMQpvaNyAs1QWqONOjaKJbBQ+766180lgnCdPnjwJqjQtEfPIssb5o2TkK
	oKW0971Wd1oQ9GfQC+a3wSN3KpnNauYF3LuGou5hgEPUgcCZLc03Mcl8egkyIjweYZbkAre+bUu
	9UbBOnfvZTan5zs0uJEuWeqoZcreeiWRANb/DS6G2YHgoDL31BvKSFQ7pJIYxAEUZ1RTbwGSJMM
	VQ5xOi6rW7JlWZx6lDGGI6mXD3UaRwO9Ha+fo0Ptd5nSdj9Bdla9WmhahxWBFOtr3xKHsD9YKVh
	YVQR4bU2vnVUVI5PDQpXUllAqMzv/mam0QATZSlj896PgackRYK/oewbe05FTegN9Z7ED6gXWrC
	8kZ0=
X-Received: by 2002:a05:6214:246a:b0:908:2369:df1c with SMTP id
 6a1803df08f44-90c8f9f6e2amr182627906d6.20.1787582747578; Mon, 24 Aug 2026
 07:45:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 07:45:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 07:45:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com> <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 07:45:46 -0700
X-Gm-Features: AcwNN1X5oDcPBaq55pm-MNepv-y7g9QlVSIhzW239c93dbXJQTRPUD7hBagIvPo
Message-ID: <CAEvNRgGvxMus6pp=xuDYOumH3Ge4oi0=YKjTaFykFHwXuzRDwg@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> Stub in global variable to enable in-place guest_memfd private<=>shared
>> memory conversion, which will eventually be exposed to userspace via a
>> module param, and wire up the __kvm_mem_is_private() static call to the
>> guest_memfd version when in-place conversion is enabled, i.e. when gmem is
>> the sole authority on private vs. shared memory.
>
> I find this patch changes the default memory type for a @gfn.
>
> - When memory attribute is tracked per-VM, the default memory type is
> always shared.
>
> - when gmem_in_place_conversion is true,
>    - if the @gfn has no memslot, or the memslot where the @gfn locates
>      doesn't have gmem bound, the default memory type is shared,
>    - otherwise, the default memory type is determined by the
>      GUEST_MEMFD_FLAG_INIT_SHARED flag.
>
> I think we should document this change.
>

In a way it's not really a "change" since gmem_in_place_conversion is
set up as false in this patch.

When it is enabled in a later patch, another way to see it is that the
default remains "shared unless defined as private".

Before:

+ no memslot, or memslot not bound to gmem => shared
+ memory is shared unless VM ioctl used to make gfn private.

After:

+ no memslot, or memslot not bound to gmem => still shared
+ otherwise, ask gmem about status, which I think is already captured in
  the module param concept.
    + The very usage of gmem (without INIT_SHARED) is defining memory as
      private, I think that is already documented elsewhere when
      INIT_SHARED was introduced, that now the default is private.

So in summary, I feel that this has already been documented in various
places. I'll also add the following in v11's "KVM: Let userspace disable
per-VM mem attributes, enable per-gmem attributes", in
Documentation/admin-guide/kernel-parameters.txt:

	kvm.gmem_in_place_conversion=
			[KVM] Controls whether KVM enables in-place conversion
			support for guest_memfd and tracks the private/shared
			state of memory per guest_memfd instead of per VM.

			If enabled (the default), KVM enables the
			KVM_SET_MEMORY_ATTRIBUTES2 ioctl on guest_memfd file
			descriptors and disables the legacy VM-scoped
			KVM_SET_MEMORY_ATTRIBUTES ioctl for private memory state
			tracking. Only the KVM_MEMORY_ATTRIBUTE_PRIVATE
			attribute moves to per-guest_memfd tracking; other
			attributes remain per-VM.

			This parameter toggles KVM's in-place conversion
			capability support. Whether a VMM uses separate backends
			or out-of-place memory management is determined by
			userspace VMM design.

			Note, this parameter is only available when
			CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y. When
			CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not set, in-place
			conversion is unconditionally enabled.

			Default is Y (on).


>>
>> [...snip...]
>>
