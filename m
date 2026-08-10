Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB23DDB19
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368169; cv=none; b=r3DFlS1tkbwRBO2rRAmWLktwugGB9qs+W/nAw843kKXx94+OvnASWoXM/WQI7HomqDWzzPNqL+50794qzR8eZMJpFh5VB/7Fxo/mpQcKgFWT1TJI/i+QtZOJXVrdi+Lw4TabIygE4QxTPPodXfIbd0M9EFl4KaQUr+b7PaH5Wr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368169; c=relaxed/simple;
	bh=QgQ3h16t1I2y58P4HYcYNeAl6wbVQDA6rb4jfsvSqvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DF2l9axGNNGunJcpRMnKl3OgUnlbUD3D9mthrZ/f6hl3x1+EZd42wtz7hyBKxz1EzMlnBq+wgWhDBf0YF25KPFtPP7+vczr01Pi2BykGzlss9On6T/LQXW5Qqg+1Zq3ueU5WpiIMR9A+GlLveZYIzcnwe4rxmXF0JFBGxG1r4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gX4zsmpF; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gX4zsmpF"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c20262b5e10so210891566b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786368165; x=1786972965; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iM/Qa4ThtXGVoAOuESD7ZLMy4Hwa1Cb/UO9QtFpTQ7s=;
        b=gX4zsmpFsaLr1vGEnAU3pmgiSc5VIlJ8EHzi78YoYadPtC+xjXHFXrET9ARQvunh8U
         4GmNg2eDH2SseIUkS7ciWSMVtEchs9GXxiJV0NgQ09bSMQgPdx6/va18LCgf8izxg/Cd
         skrEWyLVjwpH7hSc4ifLRKFoa72rpInVTZ9U6HZStig+4uXxR0Y9DV3Vc5QqDutBZTcz
         Cf2bD2qjeu9j8jfi0jsDtxSuifWx2goD+j//Jyyhmz482IXz9mivqzql6tOt8zv7HsCu
         ie/7P1yim5tC4vp+9cVqmhASNY1nPoljd3eIc/R/B2oTyiyOgjHeUoKGVcIcDO+8oBFt
         FwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368165; x=1786972965;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iM/Qa4ThtXGVoAOuESD7ZLMy4Hwa1Cb/UO9QtFpTQ7s=;
        b=dgc8xbK4R9c+CQGdeGMWVvCIXKC/+KRk9hKGK7IRSzFMdIa3kN4C0L9QQPyb2efx/P
         uv0Z6QSGrQDHxp4FCaRNPbWFlIeDXBbg+D7x4xY5/nrf5dA+cZSJiLyWxG56v30Tnkcs
         l5uLOyG6ulp4+aNBc85pBYdgNrE1ZjUxKnM+YESxiPTmMGHjVCcMgYPpiCnW6upOxtxI
         cxhLvDd7+v0X0GXj14YebHX0PjMCTb4jOLDYz9FVS1e/C5lzoUaqlGwL692DKcz5LIYp
         dv178FC1TlEhnUvBlv/xO3dYe1cM+LO0Cl+lYEzgj1A3tATyjljFBOoXOTMejZj9osgK
         X8Zw==
X-Gm-Message-State: AOJu0Yzodkx22btV9NFGWvDuI0S1y033L4oWw2hDigRhP5VO07ainvNW
	UurA3qbB3dmxXWSlrRlmtwDrQlJMEOBosvzD6tkeEJxTtf/6isTnUMRZbXzizvozkV+t9iWdYDF
	BSTpVWfWT3WUBGgxBzQ==
X-Received: from edap32.prod.google.com ([2002:a05:6402:5020:b0:6a0:ddb8:db7f])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a5c1:20b0:6a1:f7f4:200b with SMTP id 4fb4d7f45d1cf-6a1f7f4278bmr5285938a12.12.1786368164940;
 Mon, 10 Aug 2026 06:22:44 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:22:44 +0000
In-Reply-To: <CAEvNRgEbS06snhyHznPSqxnUrdudVEKUuOpPwnU+AJATWFBRBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-12-tarunsahu@google.com> <CAEvNRgEbS06snhyHznPSqxnUrdudVEKUuOpPwnU+AJATWFBRBA@mail.gmail.com>
Message-ID: <9huzv79i6rff.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 11/11] KVM: selftests: Add guest_memfd_preservation_test
From: tarunsahu@google.com
To: Ackerley Tng <ackerleytng@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Tarun Sahu <tarunsahu@google.com> writes:
>
>> Add guest_memfd_preservation_test to verify that KVM VM state and guest
>> memory backed by guest_memfd are preserved across a kexec reboot via Live
>> Update Orchestrator (LUO).
>>
>> This test includes multiple tests
>> - (A) Test to preserve non-guest_memfd, non-memfd which must fail (/dev/null)
>> - (B) Test to preserve guest_memfd with no INIT_SHARED flag which must fail
>> - (C) Test to allocate the guest_memfd memory after preservation because
>>   preservation makes the guest_memfd frozen. Which must fail as well.
>> - (D) Test to verify guest_memfd with INIT_SHARED flag preservation across
>>   kexec: Below is the details of stages in this test.
>>
>
> I think we should split this into multiple patches, where each patch
> introduces 1 test.

Got it. I will split them. I thought that this test already spawn a VM
and other test can just reuse the same VM.

>
>>
>> [...snip...]
>>
>> +++ b/tools/testing/selftests/kvm/guest_memfd_preservation_test.c
>> @@ -0,0 +1,357 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2026, Google LLC.
>> + *
>> + * Author: Tarun Sahu <tarunsahu@google.com>
>> + *
>> + * Test for VM and guest_memfd preservation across kexec (Live Update) via LUO.
>> + *
>> + * NOTE: This is a MANUAL test and is excluded from automated CI/testing
>> + * frameworks because Stage 1 daemonizes into the background to pin resources
>> + * and requires a human operator to manually trigger kexec before Stage 2
>> + * is executed. Running Stage 1 automatically would leak the background daemon
>> + * and cause CI runners to falsely interpret it as a passed test.
>> + *
>
> Usually there aren't many printfs in tests, but since this is a MANUAL
> test, maybe that's ok?
>
> Would like to know what Sean thinks of this, and printfs in general.
>
>>
>> [...snip...]
>>
