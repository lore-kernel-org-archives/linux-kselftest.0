Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721DA563FAC
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967976; cv=pass; b=Fo7aZB2Q5Y0DAUJZl+goqgR06d2ehggRCWIjH8vmgrGd9Byno7H65FIVNRgokvJ4fF00CsMV6uhqu9Ek8QpgpMseV34uQLLbzX9bClmlIkUNpV9ikYW5l3/U+xeX0W3P2GoBjOpL3aY7qf8nTi4igPCXWjtp8go5GfuF9WBiTLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967976; c=relaxed/simple;
	bh=uhhQTIaQc8uxwzQ47gAsGq8TmGrfD2ovEMzuW5mE1Bk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEwzqJJtxJNEiE0OYSAtrBEN5j0wi9VIuuGdeKwQP2fvaIJ1RvWL1nn0d6i41PqV+eeMRoKn1rZlweP4Ry0SbP6uDMF0skO8pzU+ceikJlD1LpZuBQnFfmu6U6jt/K69LYMbRCmZbdySJEkzFr2tUNY+AR9Jjyn+Q2Rh89KDTeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pa/3XfJX; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pa/3XfJX"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90cd8e45460so81834296d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967973; cv=none;
        d=google.com; s=arc-20260327;
        b=J8lnr8bjNDN6YF7bi5ncnIJ4PmdpTt+zhKM0QC8kbTznjuVNhkZE/XbGt5bIgxjFlr
         GK9dq0wB9QDy2vhTxUfKY8KKzWtOpMOLw3iYSN5Mktt8DW25WvFCWlP14XhO6k3RcaTT
         4hoyyAEfJ92Y3mdRbq86gIrdBMmfNX+TXl11RHZ6uWizyEchtYSfmzb4SgsfAayqMcSD
         ncmMXbkiiQV+863YAXeMRqeAv44ATgshBkvmaSMpJd8RFEJJtEF9CFIc7XqXCMtSKazu
         gqHmquu7OV33rTU6XOZZNukaPkL7+NRMlJZFAkHMZgsQp7LzoC0yAe6fIJiRIX5+bR5K
         l4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+0yQ0IytrFR+cprTV6f0ILvHwq0HfsKregN1JLnR5qc=;
        fh=qSZd6Rub64wGLOQUhcXE3uzhaGiNqSdNTAHNMwf8aDU=;
        b=d7aEGX7oHO/KfFoMhFmDyvPLI+wk2+pcM6+i+cQDMbjLSHwjtn0GOgitZJZOkeEt16
         zmW8i4DM2ev3G3o2LOYqu1Mf45tsnFDtR3Pgk7cFVlxmghoSgLmDgUg/4AqsjEXjHnK3
         iIesSh6qOOtaHEro7b9eWO2SWBhdO26c8LIrOL4ir7cqzXbFFiq+/3gMQnPMiOwyeKs3
         rLF/FtzztWQyHyH30UfHD1SMKTfj8cOdchvahlM5jZn3p68zJ23ylHWl6+dBBpTaul1Q
         QeLa0kxYAFT/a+vC2rBFAFcpTE+g/izOCcaplk/l7wmZsyWOWUTPltp3ikw6qsZOQ7HN
         MDcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788967973; x=1789572773; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0yQ0IytrFR+cprTV6f0ILvHwq0HfsKregN1JLnR5qc=;
        b=Pa/3XfJX1Z23SmoW6Qgtk5M2jiLZeIH0RAVXKxm5hqL7iIUwEQjskVSrOr8EHX3pjV
         I4RPGlA+VmHOywvJJagD89UGg049dcpbdaWcTR3+IVEcVQ0pKM1UBN7wiupm+KJiSiCD
         Jmelck7lCe0pWyONQ/+v6gL4dWbiOVFfJZbQP2ZvvrlU98dtDkBmEpMkglPRGlqHGxHv
         3zha9R84ROcHrKYkduq7rAOfRAf+wF1+OrPNSIQIzAxgPm768gMa5xOzuK5UPMHtbdHV
         PzUoXJjpoY8dGFA8ioOAWWDUVSiHuJUhjBd5HDhetk4Ls3dmhjt/hZzoZkYtOOOEmhmQ
         CcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967973; x=1789572773;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0yQ0IytrFR+cprTV6f0ILvHwq0HfsKregN1JLnR5qc=;
        b=njp16dEhiYQeXxaTehxLOdOEjySWLfZHa3PfexL9bmfnOErntp/TqPrnm7tRqqXI5p
         GznYy48tjKiiEi5+NOeoX5Sl/1jSmw6zNYvcq4dFGSujDiMgr1bLaipEkAfuOMJbgjpR
         nVzL8oVSv7CzIh896mNzKFkCi69I56rBGOOuPJdn6LMx9KmmsuLcnRDLB092XPYiaR/I
         kY7oRwfCF2DgHTrlUrPfJ4x7rfjWbQyg3uPdau+ftVHst2GlzBXK+izw2nxgPUkhX6fY
         61im+rYou0Jv2o1xHmr7OCTaK0T2VK4YUZ02QWXlHiTQe4YKYelLasbBD7F7N+6iVRmA
         KRhg==
X-Forwarded-Encrypted: i=1; AKwUvByGkiBF31gyh5Cr/Wp4ADcgnQWC/sQMQyo55M3n1PYB1rhfVnEKSmCNWUV8CTL1T/TAjrMKr4kOx4WZMUjqnR0=@vger.kernel.org
X-Gm-Message-State: AFuF++nrbF9nsQtGb393XAWiOVGQxInD+Cz3eA1VUUqh4gsQXjzGnBpy
	yvCvHrfnw/R3ZoLBRRWr6/XdG5tjKRji+dPDzDAFsC80usOUKbFA9SOUbiGRfaiCTNNT2lNRlcq
	1p2U3kfw1vZbvXK1BVDHsxoZCDdCz78ZeP1/uGXec
X-Gm-Gg: AYBFou24HnksnyCHx8EQA+PuxsAHwxaApHzM6jPCDLSmxdxFzRH/8G4J9YWV2aCqqG6
	QVVbEwaMC0CdzJ9k0UReHFCiqwZyzuoOSqscpB3sj/yjZFruzF+e3C8dvVGuaYKkvBngRSEZK/Y
	5+zT8ODjbFbNwjTowq9FwP91Mkh5iaWchHzqr34geGOp4H8vDQhcxyduNjeriBerrgj3A3Qrzcd
	1G0O1uCMnqwNVxSsz9tGJfjOhSilxtSs4EaEbgSmg+6uyi7Aakug/muGvUTcwFsgr6ZaygNFkt6
	td23oFzM15CoyiqpHSRpEU1LeuOkgpztaM2T7wohtwFp8W4F+xg6fCJbOZC3zB50ZFJK7MRrPI+
	y2C9PpGlzPAOwiR7vczRc/Q==
X-Received: by 2002:ad4:5ce3:0:b0:910:7076:b681 with SMTP id
 6a1803df08f44-9107076bb36mr33516746d6.2.1788967971471; Wed, 09 Sep 2026
 08:32:51 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:32:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:32:50 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <apcY5b2o5k04XffH@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-23-85e5fd25252a@google.com>
 <CA+EHjTzALzghuG5J-LFuG5pXJ4WgEfrMHgwkMHnq1U-D6yS7Pg@mail.gmail.com> <apcY5b2o5k04XffH@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 08:32:50 -0700
X-Gm-Features: AcwNN1UUq4SnqnO43s4JocxnzO6yIsHxwMjPp5Qjf0-uaaWqzT0IH1RML9MbcC4
Message-ID: <CAEvNRgHm6AbbUUayS=Smck_41CrQ7yXYCN5soFOYZ6N-YqtXNQ@mail.gmail.com>
Subject: Re: [PATCH v12 23/45] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Sep 01, 2026, Fuad Tabba wrote:
>> Hi Sean, Ackerley,
>>
>> On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
>> <devnull+ackerleytng.google.com@kernel.org> wrote:
>> ...
>> > +       kvm.gmem_in_place_conversion=
>> > +                       [KVM] Controls whether KVM enables in-place conversion
>> > +                       support for guest_memfd and tracks the private/shared
>> > +                       state of memory per guest_memfd instead of per VM.
>> > +
>> > +                       If enabled, KVM enables the KVM_SET_MEMORY_ATTRIBUTES2
>> > +                       ioctl on guest_memfd file descriptors and disables the
>> > +                       legacy VM-scoped KVM_SET_MEMORY_ATTRIBUTES ioctl for
>> > +                       private memory state tracking. Only the
>> > +                       KVM_MEMORY_ATTRIBUTE_PRIVATE attribute moves to
>> > +                       per-guest_memfd tracking; other attributes remain
>> > +                       per-VM.
>> > +
>> > +                       This parameter toggles KVM's in-place conversion
>> > +                       capability support. Whether a VMM uses separate backends
>> > +                       or out-of-place memory management is determined by
>> > +                       userspace VMM design.
>> > +
>> > +                       Note, this parameter is only available when
>> > +                       CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y. When
>> > +                       CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not set, in-place
>> > +                       conversion is unconditionally enabled.
>> > +
>> > +                       Default is Y (on).
>>
>> The parameter is only settable when CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y, and
>> in that config gmem_in_place_conversion initialises to
>> !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES), i.e. N, not Y. Is the doc line
>> wrong, or is N-by-default not what was intended here?
>
> The doc is wrong.  The intent is to maintain backwards compatibility with existing
> deployments if KVM_VM_MEMORY_ATTRIBUTES=y.
>

Thanks Fuad! I got confused, gmem_in_place_conversion the variable
defaults to true (because CONFIG_KVM_VM_MEMORY_ATTRIBUTES is by default
not set), but if the parameter exists, CONFIG_KVM_VM_MEMORY_ATTRIBUTES
must be set and so the parameter defaults to N.

Will fix in the next revision.

>> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> > index 05c518c9b8078..929fd3e1a01e6 100644
>> > --- a/virt/kvm/kvm_main.c
>> > +++ b/virt/kvm/kvm_main.c
>> > @@ -103,7 +103,10 @@ static bool __ro_after_init allow_unsafe_mappings;
>> >  module_param(allow_unsafe_mappings, bool, 0444);
>> >
>> >  #ifdef kvm_arch_has_private_mem
>> > -bool __ro_after_init gmem_in_place_conversion = false;
>> > +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
>> > +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> > +module_param(gmem_in_place_conversion, bool, 0444);
>> > +#endif
>> >  EXPORT_SYMBOL_FOR_KVM_INTERNAL(gmem_in_place_conversion);
>> >  #endif
