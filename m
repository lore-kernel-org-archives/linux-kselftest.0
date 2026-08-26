Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078513DA7FB
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735929; cv=pass; b=XWhs9j2rAqSJF1/GHCCeiafpobUBJzBxU45wwyxV3qdaJdBTxsN4FeE1SX4sILbu0q0BO9fzZFhL9OJkTxZxbVMyzAe7lD/3lGw1CeIRkTFOtTCD5tTeDxgjcqrCtYnet6RwpuiXhln8DD5upSDqoGXfLqXPx8LwTR/7uB60JN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735929; c=relaxed/simple;
	bh=PXd4FJsR6tKMFA56Q6aHGGrl17ypmJp1VW4g24+xHhM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ow2J41Rh5reXytWAIFeNZ5wSs8Fo3bbwhHh4XwG0oIhYXTRFWUEQfzOkK4GGKqdvn6ZiAzbIpEsnmO7JfW5fGcnaCOBGzpmJZDs/1mJ4s4mHo504SG++6TylvtT6jhvUJPH7qSG3YNQESSpTMNqdOozto/uktqOL5L/UBl6gBCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IfrZPe57; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IfrZPe57"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9061a795d76so9250266d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 02:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787735920; cv=none;
        d=google.com; s=arc-20260327;
        b=Ctbr8qcLi6MxHwQqu9nEQG6LMnRkL2/1s5P3YBPHyL7D2izC9uB5OYJoW3KzHPC2rz
         HFRsS1Op0RTOvieuayuuxSo7luEm+8x96kImZ7cjZ2XEc9sfTggFUd3crbXABu+XBzwb
         SZVwS30g+85nyndzoAbgE2sMhTgi3tcl3o6H/+ev/AW6/SxtEgHX5qiARlWwlY18Fy2a
         ARL279NqN1ZSWwAsOyZPt640lVTYWm3ZSIcJeDiwX66XvQTDllZAsk3zbme7NF8IBjrv
         ZQ+K/b/8LsDxU/wHGv8ByIPs82siNVrpeNjYAAFcGOZgNmNolWVtEzlGFO1JuPYkBtPK
         f8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=W29gLyGYJCPLMB1l2BXhwer1rQC/3q6nHb6nCzKL89k=;
        fh=gvMVhDhYcRarbwOw1vS/4b1mESBBi06BYo0mvjVTPe8=;
        b=SKMCVRSOji3jp0U5+2pTtzVAP597403QFmvwj9AVBfplYN2MNW23sdE4z+8CnvnvRZ
         kfB6zMjzws1bdY28S8nw3Cvhab6V59VPk7dQZ2PIE68Mik5wybsBfDPowjzsHYi1KG6e
         QeWsOYT+upuP9or36AjhnAZiB3KYs7xZZBN3C5wm1G9uvu/LvqenC5oKbTLRRZqWcCFW
         0Qp/iikWqRL5LPWzeEga8RA9yK0A+brigCWsbj+477MzcbkpzCJWZ8zb7YYuDlXRGA5P
         hOzrdrj4wxQIc0w3qNvvnuMcwNQ58KSrCZo7OU/86Mu72Utj/vK4AsOT+ImtXHMa8t7X
         IDow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735920; x=1788340720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W29gLyGYJCPLMB1l2BXhwer1rQC/3q6nHb6nCzKL89k=;
        b=IfrZPe57UD3maWrzjHlCLZIUEkY8lCP6jSm07dch9te1pki8yTl8ck7Fx2Wp7DwR38
         F3oRqHXICRw7yRJ+/iNVTEBAmHLyyTr2wHX3imPqFsJUEgk5l+owlb9ug7U+jryFiY+F
         5fys2FcVYVZ5ZL7EJWR2C5JmvZ13rjoV9VU0F3fvsSchtxR+ysxqxW1mtU5IiE4TCliu
         yorfsJ8mVg2NvexzkNjMepb2KplZ6iHxCtTGvGXN8L1S3eIoIXjE+Q10mlhoQx1efZt8
         xNdLkxzQ8U67unfsqklyOzjHI/jvGZiiheiIctp23OHLBfZ8IFUrFxRz3o95NA1fIGnp
         z92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735920; x=1788340720;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W29gLyGYJCPLMB1l2BXhwer1rQC/3q6nHb6nCzKL89k=;
        b=P6JRzc9RE+bnNowhkQ3Qhqcg6tw9N+2vnLJxvqVh4xIPmYRJIbeQUB2H/eb87Ttgnl
         B0uQ57CtDAkEi+Ul6+Wr3cPLoV0a/46yJpB1jbSxwEN96ORscQlen0b1wjxGMU+HufPh
         BwkTMi8H/LTbPxYknkhjY4RLqicBeM8KVopsuR93cUL2PJNtRcnQDQy3zp165QsggMdG
         PzbJwQ6rFH15/IRp4f0wThwSfUtkX/3R/xCM72muGz6ybSVkl2qveBRO43QLa0EYvSeD
         5agTc11kHisU3SbIBZ9UxXVXVgEy2X3jnmlD8Fzjf6i3j0T2U3CdEEKQz3e6R5f1epFo
         395w==
X-Forwarded-Encrypted: i=1; AHgh+RqjBQsipl+mbRmRW2soIE0HRgrjGqb/lfQtlUgPf62idsXeRcmnHj9dJAKh+iDNsT78ib7KS5/GgjO8XLsPJZg=@vger.kernel.org
X-Gm-Message-State: AFuF++krXoBpuL2QRRQcbrKr2Sp91yeik5ngSEOkrGoo+qnmQUJDumoP
	jM6Bbt/rEiBy+lU+WRyFwdxnNFYNrlibJVDy0XvoKZsvAKslZKq366e+Urp0lC0yneNXwgF/9Bu
	LD4N4yy5B0BO0idOislvfOZEalGjSevMXIdi4GUel
X-Gm-Gg: AR+sD13QExG6KC4499xTyKKxppT7ehpsBmnOfnZI9rOXufyWaMwXZUUL7ySJU8100d9
	TAo3Cu7mhoLFStKnZiQKxY2YLbT2S8mkpwTZGWZml5xMhJcqsw1OJd/hwbaYmq5M0EPft3wTq/u
	ECpyJxPP/piPmk6eX+epYGK23Kt8p9uySX5VMJQpVFu2hSD/L80cj2rx00j1kVCj2UCmVZkPHlX
	pwcCx4bxL9DQxmjK1PbCQTDHSbe/2CXSO5U6CIK6OKk0KZFAO890qj1nqPaE4BdpOpJI53uEdg9
	WO81isTnEa4pumFBy41LOZcswF3ED4UXom7bH1UVm3GvkID+ZmyQ74XpauGwCmOVHoT7rTQI8jC
	fpYmrwLHxIQY3qWMq5sKWp05wlv3SSA==
X-Received: by 2002:a05:6214:260d:b0:907:94e6:f8bc with SMTP id
 6a1803df08f44-90cc79998c3mr49415816d6.15.1787735918598; Wed, 26 Aug 2026
 02:18:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 02:18:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 02:18:37 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ba8d0441-b52f-4357-b2e7-1e352aa385a2@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
 <13ca60c6-e154-4397-8092-09f861e90fe0@kernel.org> <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
 <CAEvNRgGOyQHnF_b8dk8E0d7_=CcwXtYUdU3ko7Qbep+_O7UC0Q@mail.gmail.com>
 <aoZZMQ3Uc8yQWPNA@google.com> <7eba513d-cdae-4832-abac-038dcdd88517@intel.com>
 <meww2a2uf3yeevsfpicyrlg3hch2x4bsdqv2lsv3vfjxg4qzes@co5eogmhkxrk>
 <ao3lOu8-wpGTs2wd@google.com> <ba8d0441-b52f-4357-b2e7-1e352aa385a2@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 02:18:37 -0700
X-Gm-Features: AcwNN1VwWEAXm7Hyp9OqQou024-MyvsmSKreeFDqqoFiEfe8rutDN4-Z7NuYwk0
Message-ID: <CAEvNRgFXJbV78ktsg=b4srFp1OFjtQWQGuNPjr_MmWD-wOvjgw@mail.gmail.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Michael Roth <michael.roth@amd.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/26/2026 2:55 AM, Sean Christopherson wrote:
>> On Tue, Aug 25, 2026, Michael Roth wrote:
>>> On Wed, Aug 26, 2026 at 12:13:47AM +0800, Xiaoyao Li wrote:
>>>> On 8/20/2026 9:32 AM, Sean Christopherson wrote:
>>>>> And vice versa, a PUNCH_HOLE on a SHARED gmem (if userspace is
>>>>> using an INIT_SHARED gmem for the shared branch of a memslot) could invalidate the
>>>>> PRIVATE mappings (of a different gmem instance).
>>>>
>>>> I'm wondering now how this could happen.
>>>>
>>>> the requirement for PUNCH_HOLE on gmem to trigger mapping invalidation is
>>>> the gmem is bound with the memslot. But how can a memslot bound with two
>>>> gmem instances?
>>>
>>> I think this is for when userspace uses an mmap'able guest_memfd instance
>>> to handle shared memory, and a 'normal' guest_memfd instance for private
>>> memory. Each instance is bound to the same memslot/GPA range, and
>>> KVM_SET_MEMORY_ATTRIBUTES handles switching between the 2.
>
> What I didn't figure out is exactly how the two gmem instances are bound
> to the same memslot.
>
> The case I can imagine is
>
> 1. create gmem1 with GUEST_MEMFD_FLAG_MMAP and
> GUEST_MEMFD_FLAG_INIT_SHARED, and get fd1. mmap the returned fd1 to get
> a hva.
>
> 2. create gmem2 to get a fd2.
>
> 3. call KVM_SET_USER_MEMORY_REGION2 with KVM_MEM_GUEST_MEMFD flag. Pass
> the @hva from 1) to 'userspace_addr' field and pass the gmem fd2 to
> 'guest_memfd' field.
>
> However, with this case, only gmem2 is bound to the memslot while gmem1
> is not. Following PUNCH_HOLE on gmem1 doesn't invalidate any mappings
> because the f->bindings of it is empty.
>
> Do I miss anything?

I think Xiaoyao is right about this, the "vice versa" part is wrong,
since gmem1 has no bindings. Even after kvm_gmem_invalidate_start(),
going via MMU notifiers, that invalidation invalidates only
KVM_FILTER_SHARED, so only gmem1's mappings will get invalidated.

The earlier sentence about PUNCH_HOLE on the PRIVATE guest_memfd (gmem2)
is still correct.

Here's a repeat of the above in pseudocode. (I wanted to make gmem2's
flags=0 more explicit.)

gmem1 = KVM_CREATE_GUEST_MEMFD(flags=MMAP | INIT_SHARED)
gmem2 = KVM_CREATE_GUEST_MEMFD(flags=0)
userspace_addr = mmap(gmem1)
KVM_SET_USER_MEMORY_REGION2(userspace_addr, gmem2)

gmem2 has no MMAP flag, so that KVM will actually fault from gmem1's
memory.


Walking through PUNCH_HOLE on gmem2 again:

gmem_in_place_conversion=n:
  * conversions go to the VM, shared/private tracked at VM level.
stage 2 page tables:
  * private mappings from gmem2
  * shared mappings from gmem1

If guest_memfd invalidates KVM_FILTER_PRIVATE | KVM_FILTER_SHARED, then
gmem1's mappings in the stage2 page tables (which are shared) will be
invalidated along with gmem2's private mappings. That's not great since
we only really wanted to invalidate gmem2's mappings.

If guest_memfd invalidates only KVM_FILTER_PRIVATE (since gmem2 was
created with flags=0), so we will always invalidate just the private
mappings, which is what we expect.


Now I think there's an issue here: with gmem_in_place_conversion=y,
everything is still the same as above, other than where shared/private
is tracked.

gmem_in_place_conversion=y:
  * conversions go to gmem, shared/private tracked in gmem2.
stage 2 page tables:
  * private mappings from gmem2
  * shared mappings from gmem1

This time, the filter lookup will return KVM_FILTER_PRIVATE |
KVM_FILTER_SHARED and we will still invalidate memory from gmem1.

In conversions, a to-private conversion on gmem2 will invalidate
KVM_FILTER_SHARED, which also invalidates gmem1's memory.


Is this just a case of user error? That with gmem_in_place_conversion,
userspace should not use userspace_addr from something other than the
gmem for the same memslot?

We previously discussed that validating userspace_addr belonging to the
gmem for the same memslot is pointless since userspace can later remap
userspace_addr to something else.

One option is to say if the gmem doesn't have MMAP set, always only
invalidate (filter &= KVM_FILTER_PRIVATE). That means a to-private
conversion on gmem2 will not invalidate the shared mappings from
gmem1. That would break implicit conversions to shared, since a
to-shared access sees the shared mappings and doesn't cause an exit.

Perhaps we can iterate the maple tree and present folios and invalidate
exactly the folios matching the shared/private status and gmem, but this
is quite complicated and I hope we can avoid this.

What if we say, for gmem_in_place_conversion=y, set
KVM_MEMSLOT_GMEM_ONLY for all guest_memfd memslots. This way, the host
can still use gmem1 for userspace_addr (user error).

KVM won't be using userspace_addr at all other than kvm_read_guest /
kvm_write_guest, and for those, we previously discussed that it is a
user error.


Xiaoyao, any suggestions to solve the problem?


Meanwhile, I'll still post v11 to resolve the other comments first.
