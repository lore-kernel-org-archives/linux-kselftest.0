Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F1C43E06F
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389119; cv=pass; b=isZIUDchxHB0i10GR0diBj4R5egxT3HMx1etb/pcrUqtFIZxe+ka5OnOHlKHPoedrXotg57z/NsQ4Aft+nS2E58pg0A1r0vB/gXSQD/8PB28zCsiGWw4jCRom7awxJvArkCSoTubsugPnLk9H7dBhfva+PfQShxSsA0hdbReJkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389119; c=relaxed/simple;
	bh=qAsxrt4aKm/2jD+D94DvWn6jQ/0j2S49WH6opo5RYcg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7CynWpPPzWgu9dsS+3puQQCwcfwBJLX+rqwx5/EFGalnHPz2wqid2D6AnHBbMZwW1zUhJh1IprumdZ+OXNUxlqrFunKZli1WnjX1sy1ircpSZwG0aweiIwq3X69nF70wHmEqWnUfEArRgKNpjvd8Eox+3kAvHEdC2wlf7uFyXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WXAez1Gn; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WXAez1Gn"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c167aa9500dso285624466b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 12:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786389111; cv=none;
        d=google.com; s=arc-20260327;
        b=mqNWJuRAwYi4h65dr5Z4HJ8bJTq0c5uc3YF2Bji41Y1MecxHsI/4O0HBoGpS9ahvaY
         awwUwL8YD1AEQOf7yScG0u1pCj/CIYymoGv5o3WLZVlaVsMxkIQoW2UUyRZNQDPwMEiH
         +DBex7zpnqUzJqVjHJvTscFkxoH+MjnQrOpUTARjnimQyO4AcdwHTHfx2Qfp0wdNSfo6
         6l/y/FNlUdkdPTLaFT/zU7N/Yti4ljjXtQbJoh0cp5m43v5Y1Gg14JAa/8aMIKz67TFV
         R3k/9MqzvIC40SgrSuNmTpBW4b076dN+zVpBsPvUzNNoJ6K/x04BId7VniwuXGRUxNTt
         dSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lTbNU28ri9zZ2toTUiO4PyOFIf9m/AozcuO/ntOhi+U=;
        fh=JuQ2aaKTLUBuQVD0ujZ1/g4qQolcLZjZBCnE/apxSKY=;
        b=ozmSLCXgXacP7YFY/JBKPhgK3opTxfUe6ocL65oup9K7VY8JrVu+mDf6PLYhbihVLd
         er+e3zTNFdWJNdZ1h2pVt+LRjGDVeqIEmUjHAmu2uKfW23cHy5dsHnaGYYH8+1o2SM/U
         kLRQw8C1fzopE4fI/klch98X/D0CO5bUaFxWyXFxFQLGwqGMI8V8RwvqbWli6PHP6vdx
         RVA2T6bJu3WC6fIFjojAJ95YCNKpzirQasHTInN6IzXYAtYyzDE4LS1Ud0NuXILMpWJg
         jejMUm5VQZxRbVKd+y6ixuqOGo7xvQHEwEBnIHARvkuX0b1AewMrpf2m7qdQv35M12Sv
         4HGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786389111; x=1786993911; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTbNU28ri9zZ2toTUiO4PyOFIf9m/AozcuO/ntOhi+U=;
        b=WXAez1Gn8WFaaa1yLwWbXAvcPJcVlFoVGkvFId/nBQP264AMsqJUXlnn6aIIcbAE/3
         wplIyNvKCWcyBde31WptAUgZe2qyMic/Usc6sSAk7u+UgAJrwxXvH5uVh5BVcL3xhcur
         1j9UQY3xpW5/w45p4jpdYeHy2Io19AM672ApBZktfDEEq9sBrZM3xIzdhYfuqfI2tJNE
         0Jc7f2wfd5Rr+BMLBpfbGWJLPaMmfz4QD6ziIRVQoCeZQwZ1LlJDeVXNC8OpxoAT7N0C
         kC+aIjPw3DpiusfvnJUUVWI9CODun8ZH9qx2s/KHiW0vcHjQBw9mmR+6GJHJ7wiVWdT3
         xo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389111; x=1786993911;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTbNU28ri9zZ2toTUiO4PyOFIf9m/AozcuO/ntOhi+U=;
        b=pfPFtFF2GUyLBk4B+QVMhhlIjJ9xocQ3PZEX0uIODxusfI/hDMvJzBSevZ1igI1Dtb
         msXnPlkJE9JPMOT0YTms7PTlHHG+WbPWSHRnFbtp1uIJ3wfICuuuSJIp4aWz4lTD0qz3
         VYQRisV8uR8FEOBFIK4F7wsGPfwcyncdpGF4pdGcLsFIkIg8TkDqajJY2JqaEwLoyp/6
         dcatuJ0ZyveoiXKL3Pg1pkLx4X0suRXHtAbPgsPyMbxLW1apm+QppoOzZKjO5//gtirA
         ApmKjI1HGVl6qOj0eqY2k8TVpaYBMFmC2/7eDFEncmAKdh/nQahq/B1sUh/tlFIo7gNJ
         X40A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1F2PFkqca120UlfrhMupB/JswpzE2m0sjwnnR7ALNOgHqe/FThG2JSZ5KUOoZSu9Djr/54NwCakBog6jzF5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI/pPLENkbtmvZjy+DmdVazWE62uf+cTClRrYxnyeqgNxg4mfA
	wjLjMsYKub+wBnechxZXBwi/bEDIn0Cve7d76p1j+nWpIQCu/c7COd7ZgSfQQ4xHXPMz1HfAyIf
	qC197nIJoihcLU4ZVro5p78YMXWscYmlthT/RcOrK
X-Gm-Gg: AR+sD12mj6olB83Im0FacqkO+QwtJ60OZ9JnRaixDRw5h9HCv7cIb3VMEwtJm3tO726
	w1akEyzYFmn/6xLGGCRpWzoK4wFiRilZER87ePAsZTIS2U7XbvLVUZJhmi2yv3yTgXLwdVq5GgJ
	PDcgqP+tN9UmDVDvsYalS5lbLfrQbsSgJ664y04pSksCylGK50sF+u9w5CsIRdL+yvRVvN31ak+
	glfbGOwMiMmHKbBJt2IlaCA4rnOkMTq6ogzCLVHlDh5ovkycCxbbJbd6dnhxn8mwQZjryyys0KZ
	BrD3CiS5Sv6eOI+lFgiYtcMZ2Hq5QC5uuHlwcUW7IZZSKNyQIj9S4hLF2XgunldlyUNK87IfVrV
	EY0XPfDgZ5EVYJURhJuoZUjaNeX4feKA3b4g=
X-Received: by 2002:a17:907:1ca7:b0:c1c:4adc:31a9 with SMTP id
 a640c23a62f3a-c2039e3fe56mr2131203166b.28.1786389110165; Mon, 10 Aug 2026
 12:11:50 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 12:11:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 12:11:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
 <13ca60c6-e154-4397-8092-09f861e90fe0@kernel.org> <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 12:11:46 -0700
X-Gm-Features: AUfX_myM87U3S8SmK_og8xg6GGyI1_yRBB52uSNeH53JSCFRKhcscCat1IpW7LQ
Message-ID: <CAEvNRgGOyQHnF_b8dk8E0d7_=CcwXtYUdU3ko7Qbep+_O7UC0Q@mail.gmail.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
To: Suzuki K Poulose <suzuki.poulose@arm.com>, "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 10/08/2026 10:06, David Hildenbrand (Arm) wrote:
>> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>>> From: Ackerley Tng <ackerleytng@google.com>
>>>
>>> Before conversion, a guest_memfd could be either all shared, or all
>>
>> You mean "in-place conversion support" ?
>
> Not necessarily. This is supposed to be :
>
> "At creation, ...
>

I've been thinking of this series as the conversions series hence this
description, David is right about being more specific with "in-place
conversion support".

I didn't notice that it could also be understood as "at creation" vs
later on in the guest_memfd lifecycle. I did intend it to be about
in-place conversion support, since I was trying to justify why we need
to zap both shared and private pages instead of zapping based on the
INIT_SHARED flag.

>>
>>> private, configured at creation time using the INIT_SHARED flag. Hence,
>>> when zapping pages from stage 2 page tables, guest_memfd can filter which
>>> to zap based on the initial shared/private state.
>>>
>>> With conversion, guest_memfd tracks shared/private state on a per-page
>>
>> Same here.
>>
>>> level, so a range can contain both private and shared pages. Zap both
>>> private and shared pages for simplicity.
>>>
>>> An alternative would be to iterate guest_memfd attributes and only zap both
>>> if shared and private pages exist within the range. Setting both the shared
>>> and private filters lets the zapping logic do that iteration instead.
>>
>> I mean, we just want to zap anything that belongs to guest_memfd, independent of
>> shared vs. private, really?
>>
>> IOW, it's not about shared vs. private, but really about zapping anything that
>> belongs to guest_memfd.
>
> Correct. But we want to control what we "zap" (invalidate range) when we
> do the "conversion". e.g., if some ranges are already private, we don't
> want to zap those pages, as they might have some data "populated" by the
> VMM. For more context:
>
> https://lore.kernel.org/all/114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com
>
> Suzuki
>
>

Looking again, there are actually 2 changes in this patch,

1. Zap both shared and private memory.
2. Allow zap requester to request what to zap by providing a filter.

(2) is preparation for in-place conversions, where Suzuki pointed out
that in the conversion process introduced with in-place conversions,
guest_memfd should only request to zap memory that is not aligned with
the requested outcome of the conversion in terms of shared/private
state, to avoid over-zapping.

e.g. for shared to private conversions, only zap shared memory, zapping
private might destroy data.


How about this, I can split this patch as follows:

1. Update this patch to just do (2)

Commit subject: Allow zapping requester to provide range filter

In the conversion process introduced with in-place conversions,
guest_memfd should only request to zap memory that is not aligned with
the requested outcome of the conversion in terms of shared/private
state, to avoid over-zapping.

Prepare for that by allowing zapping requester to provide range filter
so the requester can zap private, shared or both types of pages.

2. In the next patch "Add base support for KVM_SET_MEMORY_ATTRIBUTES2",
   call kvm_gmem_invalidate_start() for conversions providing just
   KVM_FILTER_PRIVATE or KVM_FILTER_SHARED - no change to the next
   patch, mostly.

3. Add a simplification patch to always zap both PRIVATE and SHARED for
   the truncation, inode release and memory failure calls to
   kvm_gmem_invalidate_start()

With guest_memfd in-place conversions, guest_memfd can iterate the maple
tree to look up whether to zap PRIVATE, SHARED, or both based on the
range being zapped, but I think that's doing extra work if the goal is
to zap everything from guest_memfd.

Before gmem it was an easy lookup to check the guest_memfd init time
flag, but with conversions it requires iteration, and
truncation/release/memory failure aren't particularly time sensitive.

Sean, do you know if looking up attributes in gmem to feed the KVM MMU
the smallest set of pages to zap will improve performance significantly?
Or if there's any other reason to do this lookup (more complexity in
gmem)?

>>
>> So, couldn't there just be a KVM_FILTER_GMEM thingy instead?
>>
>> But I didn't quite digest how these filters are used.
>>
>> I can see that kvm_gfn_range_filter_to_root_types() does some magic to them, but
>> I am not a KVM MMU expert to know what KVM_MIRROR_ROOTS would mean.
>>
