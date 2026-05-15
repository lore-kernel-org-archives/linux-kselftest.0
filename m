Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B23F8888
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778870080; cv=pass; b=rCM1zdm4M1qgmJMsbM4ggzjleIM4X+nzvuHvMWx/hT7Mm15abNexvlL4cZY7Z5Xoqo0cfPbrrC7ByskpCJ494liR3LDPIKjUcOsbJrkrL3/d+Hmlm0OrtTDEMzl3qWldSJs6ByPT+Xax9vlVLANTCFGUDRh57wmUyEHDag03oUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778870080; c=relaxed/simple;
	bh=DA2Wy9smkUrOgGLD5EcQ7iMKHSUE3cp9ttCFreanAWA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBiech2b0YGCjTfpE3h+jDqkXTQ2ikF/sxV/Vk2Ai/b5/lMShtJ4mAR9A7T3YOFJVYIPaDh1U1VJhEye6xdpciLkruQ0H0MIYSpw5D3IXWBfo9NYmMsg698lAs8yPbAsgYFsyKfFuHGN2lu13sGUWdoqHcZWTRYS4UWPP96Np0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YYS73nz/; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YYS73nz/"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso34746241.0
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 11:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778870075; cv=none;
        d=google.com; s=arc-20240605;
        b=HvFvWObfN41NX8140ysGNNmrqt3PhKBe8q4SBbKkmeP0lC9GXhrfixemqLIoN9G+0K
         6mhXzoDKSDOgkvNDOFkDZTeNp8i6Tto6S0PBlLFNv/2sQiuCsFXph4kvhT9di/bJg1Dg
         wl1YYejdwU8zQAhIZXXP+OHFO1KERZLilgp5yNDhCT0LaDC+ox0zOYvedKou58Efmqy8
         V/4NocQ0HsKLNTjptpYbU/JrLiXiJfR95tb1LxncB2fRxyQoRCYX2SLMPRzYdECvMbEc
         bLpoMdzO3aHxGi9xdFspkqp+doB/hAI3Cp3VEoaYB8IbZFc/WkgHam5vvWWN+ADoXvpT
         Le9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=hXzcL4Si7AoDz7U9pqlgIyMQAxFIyNef25XFajpPNe4=;
        fh=RhK++GzdlG/W/V9Chh1qihAdVsNw6vReFROBzS91Cbg=;
        b=JLVTOpqSrQC0Arna5PS+YQL7kXd9qwJDEREWdWARSpWKZx3RiSEuTPj7jMYI0wZp9a
         OorDEWfIEJKfSFFAMsRduJpEZVt6Ix1vPAASsK/U19At5VO5NqlBmg3LITLP8WCY0ufs
         4NyOgV5TfFg4/JM9bUNmf53KnqSMSaOP8fmRqJ48dZXT6yzL4QDj/zP01tzA/ZfIUvSG
         d6k5vC3GCqtlxn3izatRrPjxHcAJsdxkllyEd0/5/+s5/YY10YMg9odpvAKNbyktZ3ui
         fW4EkpoPEu2J1wj5oecPVHveXlCGd8P3NIwZF0z+0iJGJxE5liD4FfxJKOKClQM4m0pe
         GCiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778870075; x=1779474875; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXzcL4Si7AoDz7U9pqlgIyMQAxFIyNef25XFajpPNe4=;
        b=YYS73nz/xIcDnIoNXHbg5GJ4s1o3X29GnkFEut9rfuxgQk3TQRUsu6RVLw+uqTtc/v
         d2z1AxB2eSs4RV3oGINb/D2mPrEtUN+TCkSDpWobhMFO0HR0hbo5L8yeD9O8iU/IcRJH
         sa7VwaOXROWEEexJ+1HCXnKsA1naMryFUYh/MiAvcrarKYPHzupdMRSlAWyR8eOetR3b
         Sxe8w+/PVbeVsIw96r/jOUejGQ71sBO0mVt543KBlOXhuQ8VzTtMl4oO9u8I8KxBxyia
         EK+Q8RFlfe1ZHyYZaqOa1j0zPOMaJsKMfLjG/nF5Rn7Z23Kd8k2b0hBAblYntqprLt5m
         Klbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778870075; x=1779474875;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXzcL4Si7AoDz7U9pqlgIyMQAxFIyNef25XFajpPNe4=;
        b=P5qVFfjP5EmdxlGQSlXUSaRDSb3MnQ/SMyxzWAI4sYzgqOgEBJXlwCmClfHsjrXS+2
         /+xAaKEAfS6aHkBF2KbfdQvrWIsUiM/bjuPFPLdxi9bCvbyowUC4eN7W3TimbjQXC0+U
         lzh8YNQf/FE1t475L27ocCJYzCigpy/aHPOjp6f/NisQtMZb9J7lvP4fdoqS2V2YYt1d
         oLj50XcL6wogQsLsu6FOL8Uw3g3nMDWWpFq6SxtU8VI61/GrvvkSKowJ6AydjAAoKgmf
         ElBHn/ZjVZT6d0p1JO8kGvK0aM5xf70ctrrerdWNHF3RNNQ/fsnjqNMgNOgA0XasEa9d
         FdRw==
X-Forwarded-Encrypted: i=1; AFNElJ/NcXJwRKuqUKVRgufbXE2cA4fPV6tLb+K5f46Ajc+oGJDM4DKc9Is+A5Jx+2/Bd0VmPqtKLnmiCIbYY22A840=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmDMA0LnjKfPRDUS+37ECssc0zSAJb/wCeDP3qQAyhGb+RtFd
	TdK4a2lWz3+MgHvqtHbP40julMrXvgtwkrf/e9PCWzRc2uCU1euIvdt0H+nikWjEbscp4DN0810
	Q4/Q5rb/KRLIVPl3xquqCH0ReLwbnyV6mRfjgGTTe
X-Gm-Gg: Acq92OEYg3+Nes4N3/thFKA8+MEeZpOWhIIvFNdDREf5wYo6nTmK0m3sTQy3ZjsxGKv
	qtId5gStqiTGhmwmkLi04Y+q18Eh7Nyi+VvxS/VEwCbKeWFpf1XoHR+XSSO4rALRhuFVPkKZlqn
	2bFyoS7xFsuhmhkL/BcvNghfUej8m96wBKeXSL8m7aZLtBLm2UWpLD7iHnKVX/ASVQETsMbzcTi
	hjQZAHWyxzWMo0vKsRUa2/LBeHgFgbtoyxFcc9z5El3dLcA0r5XYqL+A0O6WoI4AubnKHAPNQbD
	0ENzGbcRiDCUg3VTGBKWTKCQLd85YkOE+YLFt+eInsNv1P0DtdficQA4792Oy38Srd9elS9chTY
	NEgsj3QpMl1Y1PQ==
X-Received: by 2002:a05:6102:f13:b0:5ff:f4ae:a154 with SMTP id
 ada2fe7eead31-63a3ca1ab64mr3398396137.1.1778870074886; Fri, 15 May 2026
 11:34:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 May 2026 11:34:34 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 May 2026 11:34:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ac7oE_1j6gxf8OKT@google.com>
References: <20260402041156.1377214-1-rppt@kernel.org> <20260402041156.1377214-14-rppt@kernel.org>
 <ac7oE_1j6gxf8OKT@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:34:33 -0700
X-Gm-Features: AVHnY4IEbHvurLDEpAdcz2fUdNtakQtGECOPGI7q3-EkzXTSsmoe5CSHOnLeDQk
Message-ID: <CAEvNRgHd4azPaMddvqnSG+Z5fmg+LWd+pz=LSB3PrJTW618dww@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] KVM: guest_memfd: implement userfaultfd operations
To: Sean Christopherson <seanjc@google.com>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrea Arcangeli <aarcange@redhat.com>, 
	Andrei Vagin <avagin@google.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Harry Yoo <harry.yoo@oracle.com>, Hugh Dickins <hughd@google.com>, 
	James Houghton <jthoughton@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Oscar Salvador <osalvador@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, tarunsahu@google.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> +#ifdef CONFIG_USERFAULTFD
>> +static bool kvm_gmem_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags)
>> +{
>> +	struct inode *inode = file_inode(vma->vm_file);
>> +
>> +	/*
>> +	 * Only support userfaultfd for guest_memfd with INIT_SHARED flag.
>> +	 * This ensures the memory can be mapped to userspace.
>> +	 */

Is the principle here that any memory that is allowed to be mapped to
userspace can be userfault-ed?

>> +	if (!(GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED))
>> +		return false;
>
> I'm not comfortable with this change.  It works for now, but it's going to be
> wildly wrong when in-place conversion comes along.  While I agree with the "Let's
> solve each problem in it's time :)"[*], the time for in-place conversion is now.
> In-place conversion isn't landing this cycle or next, but it's been in development
> for longer than UFFD support, and I'm not willing to punt solvable problems to
> that series, because it's plenty fat as is.
>

Thanks :)

> Happily, IIUC, this is an easy problem to solve, and will have a nice side effect
> for the common UFFD code.
>
> My objection to an early, global "can_userfault()" check is that it's guaranteed
> to cause TOCTOU issues.  E.g. for VM_UFFD_MISSING and VM_UFFD_MINOR, the check on
> whether or not a given address can be faulted in needs to happen in __do_userfault(),
> not broadly when VM_UFFD_MINOR is added to a VMA.  Conceptually, that also better
> aligns the code with the "normal" user fault path in kvm_gmem_fault_user_mapping().
>
> I'm definitely not asking to fully prep for in-place conversion, I just want to
> set us up for success and also to not have to churn a pile of code.  Concretely,
> again IIUC, I think we just need to move the INIT_SHARED check to ->alloc_folio()
> and ->get_folio_noalloc().  And if we extract kvm_gmem_is_shared_mem() now instead
> of waiting for in-place conversion, then we'll avoid a small amount of churn when
> in-place conversion comes along.
>

I think it would help if we do some refactoring of existing allocation
functions to provide guest_memfd's uffd ->alloc_folio and
->get_folio_noalloc callbacks instead of having new functions.

Perhaps uffd ->alloc_folio and ->get_folio_noalloc can call an alloc
function refactored out of kvm_gmem_get_folio(), and also do the
kvm_gmem_is_shared_mem() check.

+tarunsahu@google.com, who is starting work on guest_memfd preservation
(as in LUO/KHO).

>
> [...snip...]
>
