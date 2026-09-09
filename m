Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED544399E2
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788996194; cv=pass; b=rzPrYPaQfDXbiAonJWJpnP7aEsAd5FMOwlI7i2uKSBA8jXW/BR1WHBo4xHSpQmWt28W71dYWGflzyfMoXvQa5mxLLd9Y/YmLQEdXdX89WGuH15aDSZ6D68LVkUGeTGKGDzlgHK8U4MivRJBKeaVSCrLSrYOr2bCzO4nOH7OIOeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788996194; c=relaxed/simple;
	bh=l9QfXr2PoEddtIVhwJixT7W1fjNbDS64FxOOCH9rE34=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSlfUavukCgkxjwflS527Jc6U1oq/mcmmeF3eOy2fHmwfWU6iwwod5uEbLPjWQvrj+d5Gblq6ZVis/QQD0Ylhsm56bMBkHy/QH2Wh5tLVMTE7Dq/3gXp/ho8tPg3UwDBmAMXFDW77mg39OsNWzNvyMsBb0tQdVjXkwh+3UAU8So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TNoie3QF; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TNoie3QF"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ca5aa6so112930085a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 16:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788996189; cv=none;
        d=google.com; s=arc-20260327;
        b=DhyrGJBpambxBBeuDVTl7CTrG9oolgbn3AZHZ8B9//Y66ll5dz2zn3rD+w7DdKelxV
         baGEtUlsk/PIGjTTFikqQASIwbjUWyPBgq5GPLHXeyL3vA72IH/5D5ZiZvkjsoeGLGYm
         QtB2P+FT0MwrRkKte2OYswHURVubFc7tTdZSTEkeBuX1wGtJkQ0oGuJ4kaeHwxZ5kDrK
         2a+sQm5UTaU1lXE8aklZE7lmgb/mvLJ8FptYINhisKWmcR2c6tpt/yNLJNlCPQ6wMEDb
         CUbV8Hy3OST4pRY3wHlr4771xrcQH5g7pyD4iASJPYUUfGP33EG82boDkSRnXT2U9vDx
         6e7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=En5tOZVEsf8OKBtyg5CL4cfCdUXCngpBo9ElWnq0faE=;
        fh=PIzgVqkJ8iqIzuVpWPApBAi0hshiWGXFpLvkhXCGHC4=;
        b=OFjMLev4T6nQsxWtD/vLZxuJwpN7TPD8lhBXOJ5/5lHMgT2BQkhPiKszY8QWlBSqvn
         3+qUPCC9hmu7THBPS/ysbX/05t1ysK4GwxAFYIY+KOf/LSW+XSIt5QZ2O/C8gFLCk9Qk
         X/cRAD2z2dcoJi0+meZYquu3jLZzoM1E//h4b+NG3CpNYOTpqpvIOsOx8PxpKFM4pahM
         M4lf5qa4QPGsVjB68dnUhnapYAZzUm7Z3o0k7RJwR9b4Tp74xlEBQz8dxIAxfwSqyl6f
         sP0yHjzgsibKdDGOV+JhWXLJem9ZaFUHOeTXE4GThs/Uw1oHHzKqyKQZXNloMZYqwrFm
         B+VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788996189; x=1789600989; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=En5tOZVEsf8OKBtyg5CL4cfCdUXCngpBo9ElWnq0faE=;
        b=TNoie3QF7SIkY1mHWnvmOctrYEsD8GoDJer9qY560QAAZ2gJmc+To3SJ1ARGmkxFNk
         6t2FMGwWrf0UcXL2TYjJ9tmuL5Qs7A3liRp9Fq3TPl+9e78uQ1WJQIaRS+KbHWnM4dar
         Q/d/R/yHW6bC31pHXddLLYOnctox6iSApyq0M9AufMQzlM+WwV4UGzFbVgpDK7aF84YX
         nQt6rfF2qN2QjaX+k/+3kPAYUAemGpSTfGLPVNC2aHC/QhjAUmuGELZhq3zw/Te3CIbC
         66Qy4wc7ZoZGe3z+dB1zyQ+wkXmigvp3zY+wbWwLy90nqM2KErjKt3XiqvOSI1xBtZPc
         AJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788996189; x=1789600989;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=En5tOZVEsf8OKBtyg5CL4cfCdUXCngpBo9ElWnq0faE=;
        b=e+uI9z7DiITWSAFrU7TN3Li9TeRFJQkTxlLxcroluBUKir3NWP3QFzR9ND6Ml3ijYA
         jgYks9ZxdLo281K8ClJ0x0pXZBmGfLR891L5KUHNSec7KM8iEzYKhjACOD042YQFKizV
         orbNFIMdywqorGH2NAIcOguRdhCm/pqsE3/L14eg8ikUvJqkIWxHdPeDa36ZmGbTJJqp
         6y2pLrCp5qI/As1a/2XTemvyxQYoePkIoz1myuoXG60ZAYtv9SOtI0zKetIezEisan9X
         5eJUURbeCbKBNEvpAWgP5uLnHItxE2svz9NilfYj/1hB6OgSbHClHKsSRWYCuxwFHyXh
         IN2A==
X-Forwarded-Encrypted: i=1; AKwUvByTCJDyyM9KKa8ngl1HXuNRMNwGpZx2jwcY7sEIA30F99URDDd6hAKFGYEbQQdnV1HDTO9pkdFLR8bSFNsA+2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lF3HW+VePb1vYhNxGUiybcaRkY5PCwwayX2UKKwSsl/iatozaJ
	mMa08Btz4Gr7XqhVd4/jQ1d0vgR60c1f1cE+EDRmQ5ZbE43++Og9ITP7QAvv67SsS3Ynvf1cDkr
	PxsgogABAG2sIosYbaQaI9zCpr1v5tExuoGklcsxw
X-Gm-Gg: AYBFou3ZpgD5pPs5O/kCKg71wRNmJOv68ORY9ilNQdFPtvQpZDm2Yz6RxFHKfrDXj8Y
	hJHngJ0OGHS1nn3FS2no7/TRvqbWzHFCwCNfY3b8dBhMc6lKpHC4zyHzMxYBIaKOiAJ4xME/vjr
	GUvrvKhidDdzkhSmSLNQJ52r88ioGAYDJDCzlufn6vzzNNMGi4D/NcPaCjs8zQE/+L6qdG6gDG8
	Ui04bV+fPRJzlTaDMFAbPL5DEMfbdWm7g8JYC1hzEoJMUKC69pt+F84ABDRbZ6mpiIpPm3n+zb/
	G+ADttZytXr7bvu/VulOXu5fnMxZFnBTefoDgSI9e/pzvq3Voyh7YUTcDRW+kCt6BfPLibxMvyv
	IBY12SRirkxg0sGo+iWcTm2irCRge+5tF0inNJAYs
X-Received: by 2002:a05:620a:d8e:b0:936:cd76:4d4b with SMTP id
 af79cd13be357-939d4a8e082mr635316885a.42.1788996188016; Wed, 09 Sep 2026
 16:23:08 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 16:23:07 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 16:23:07 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aqHkVKvons1tBs1O@gourry-fedora-PF4VCD3F>
References: <20260902194657.79075-1-gourry@gourry.net> <CAEvNRgHWyBaBpZ4Bem1Eu86b-cuEA7NkyjxTJ4D3FnpGe1B2Yg@mail.gmail.com>
 <aqHkVKvons1tBs1O@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 16:23:07 -0700
X-Gm-Features: AcwNN1XfBb1QvPKkl28AJUF1eJlFWixEPhPOQhdktuRR8-1JWKzX4sglljv8C4I
Message-ID: <CAEvNRgGAQj1afTRRO+DpVTaSCTZic3K_x6ZfwvBLUbfara5v=A@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, pbonzini@redhat.com, 
	seanjc@google.com, akpm@linux-foundation.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Gregory Price <gourry@gourry.net> writes:

> On Wed, Sep 09, 2026 at 03:41:35PM -0700, Ackerley Tng wrote:
>> Gregory Price <gourry@gourry.net> writes:
>>
>> > guest_memfd allocates its folios through a per-inode shared mempolicy.
>> >
>> > Today that policy can only be set after the fact, with mbind() on a host
>> > mmap of the fd. That requires the fd to be mappable, and it cannot reach
>> > folios that are only ever guest-faulted. Neither holds for a
>> > non-mappable (confidential) guest_memfd.
>> >
>> > Add GUEST_MEMFD_FLAG_BIND_NODE and a node field to struct
>> > kvm_create_guest_memfd. When set, KVM builds an MPOL_BIND policy for the
>> > requested node and installs it over the whole inode, so every folio is
>> > allocated there with no userspace mbind().
>> >
>>
>> Instead of a custom API to ensure all guest_memfd allocations come from
>> a single node, how about these options?
>>
>> 1. Using cgroups/cpuset to constrain allocations (could be troublesome
>>    if the guest memory is not preallocated, unless the vCPU threads are
>>    running with the cpuset config)
>>
>> 2. Process-level NUMA policy
>>
>
> for 1 and 2:
>
> the intent is to put the guest memory on the target node, not all system
> memory for a given process.  so the scope here is not the same.
>
> in fact at that granularity, the desired node may not even have eligible
> memory to host the task's memory.
>

We have a similar problem where we wanted only guest memory to be
charged a certain memcg. Currently guest_memfd memory is charge to
mm->owner, which is the thread's parent, so doing the fallocate() in a
thread wasn't good enough. The workaround was to have the fallocate()
done in a separate process (fork) and have the child process's memcg be
set to the desired memcg.

This workaround is kind of awkward, but could it technically work for
NUMA allocations?

>> 3. Why not request the guest_memfd to be mmap-able just to be able to
>>    set a memory policy?
>>
>
> the eventual intent is to enable this for fully confidential,
> host-unmapped guest, isolated to a particular memory device.
>
> Requiring a mapping to get node-placement is quite defeating the point.
>
>> 4. How about something like fbind() that takes an fd and offset range
>>    instead of mbind(), which has a prerequisite on mmap()?
>>
>
> This was a consideration - although it has other limitations and larger
> complexities associated with it.
>
> Where does the policy live for random fd's? (inode? address_space?)
>

Off the top of my head the policy would be saved at gi->policy, where
it's stored for mbind() now. fd+offset is just another way of
referencing the offsets to set the policy.

> How is a reclaimed inode's policy handled? (lost forever?)
>
> figured i'd start by reducing the scope to the narrowest and clearest
> use-case, but I did expect to have the fbind() conversation.
>
> I'm open to it, but it seems like over-engineering.
>
> If you look at tmpfs / shmem, you'll see there is the option for a
> default filesystem-wide mempolicy that can be plumbed, but i'm not sure
> there's a real usecase for per-file mempolicies that isn't literally
> guest_memfd.
>

I see, can't think of other use-cases for per-file mempolicies either.

>> This doesn't exist yet, but I'm hoping to discuss this at LPC 2026:
>>
>> 5. What if you could pass an fd representing a mount to guest_memfd at
>>    creation time, so to make all the allocations come from a single node
>>
>>     Step 1: Create a tmpfs mount, specify mpol for mount to MPOL_BIND
>>     Step 2: Get some fd representing the tmpfs mount, hand that to
>>             guest_memfd at creation time
>>     Step 3: guest_memfd allocations will always come from that tmpfs
>>             mount, and abide by that tmpfs mount's memory policy.
>>
>
> This i think this is more feasible than something like fbind, but devil
> is in the details.
>
> I definitely think it's interesting and would love to chat at LPC!
>

Great! :) Cya!

Along the above lines, for HugeTLBfs we'd do something similar, and the
mount's fd would also indicate the HugeTLB page size.

Relating to memcg above, this doesn't really help though, since tmpfs
doesn't offer a way to configure memcgs.

>> May I know more about the use case behind this new feature?
>>
>
> see above - confidential vm whose memory is quarantined to a particular
> device, without placing that same burden on the host memory.
>

Is lazy allocation a requirement for you? (as opposed to fallocate()-ing
before the guest touches pages)

> ~Gregory
