Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA4436495F
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435529; cv=pass; b=qix0EwQxnHVdW37wrtolzA6HmVUEdrn/7yTWVAN6GXd4HrPh/k6yWTdeC4vyMEu4fPQ1ZeuR/qnUN+JEcubDr4BHyzu3B++YzzBbXOFHlHIZhgQTtxe7LOr4oWc7cKaMTuo4a/Uy95h/Bnt95WVH0dOaJv/Ds15x4cinVcxIlls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435529; c=relaxed/simple;
	bh=gJHV3b2Sc8xEI8IKQeSL3rSLGGFn/d5inPeMCN2Ei2g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kD4YzbyPsDSczPdtsKVvITNUC1nXwCetasP5RzutI+1a5+1Uirx/uaT6vB8ihdJWMeCrhaEEhWo50dsB+7REha5FbS2U0yUhN11ZqUHcJhqT7z71IMU2biffjGUNnbGlcVtDApDRqThtMY5A8aty3DtmoDdLVmPLzIKbdbDW/7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GBYHkGsk; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GBYHkGsk"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38f620399a0so174624a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 11:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435527; cv=none;
        d=google.com; s=arc-20260327;
        b=B1asng/UvQBNa5kgG3EBBDWZujbGfuAEUH11ASJ1JcEdcXNrkWc9Vm/WbOiSgsY9cn
         vMwu2EyhjM/fI6/O3T/+28L32bOze6F7yb1j3uc2VUWb6dWLdvopCLt6EwSpMXt3l6YU
         4JmLf/LXgHXv6VJKFm0vPujx/pFjZ8ojN3jwTU3/m1IzO9NFWKII6D+mB9QQlTZ5im4g
         6rrlyaEb5/DSnLLYuQpVL9ysf531+tO8CSjA0dB8FLx42qXdZjW1VVG5UI7dT1Td7Hka
         lH2z4p6KksfufZMY6xpraeAt8L+J/pbDqXTJ01jZzBo3+V1IXBJt10wCemRaYodOwSAm
         b8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BcSk1/y4fhEYP1oDWtEyRtQmE44YyXI71BVE0scYBk4=;
        fh=k2M5+le0vr3qB4AfMXUEMpfaL7Ua8Ow45VRBol8cKiE=;
        b=I1YJu+PSAunUP2i3iABAhQOSAWyemKs6XvQic4KLkOws2EMXb/UCUEbwNEZub3yahH
         6XHAFJ3ZHFJRBlLDKi5ZnUzHCIxfJS8t5YnHHkOCOZycVS4wpCL3qbN/v9BTY/v1x6d4
         nzBxm20mrIYVpeKK1yAZx/EnEv2HwPpiACtjmxkdKg/yfgzUJsnusbfx+CaEgNhGwfIW
         hjRiRKWjIXU8e02K88kn1yu98G/yLtcNdgg3GM0f1gr1mAZvkNe4XdXwdiYAhxmz6jvx
         6NpqJ4s5KxBBSxVALFtdnOG8STutlP1hbtws8PRD0uUNaVebr4QqbMIGTUPcffTfQliY
         RHgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785435527; x=1786040327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcSk1/y4fhEYP1oDWtEyRtQmE44YyXI71BVE0scYBk4=;
        b=GBYHkGskC3W/60mVgxyZuq99MzKq6IwMmllpmiuyP8fW71ofh312bKprI4rBFRkvmn
         RsrziMBdwyHcnbvEkVt0XvwqT/wekwoMY/FxanxEMuPFZSbQ3eCBBfcQ8U9ga2zRwXZm
         T8gmVfC/AYMjk+PEYSrqZnt19/ePl98DZOBJ3f1pJ7jWAz/D/rzkWrhWLVnLxUe9M1oF
         8u/4XmZplHV0yq72RRTP3gNS3Bl3eTHE0oxlVLtz2r4zLH2ZzxA4UUnH5UB/1OcVrLFC
         hCc3Pv6tkQkM7VhysQnVzUL4Jx4ED+mK1iuvB/lq7oTFBZ1v/X66ElNlbfhPXA2gj0tM
         HoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435527; x=1786040327;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcSk1/y4fhEYP1oDWtEyRtQmE44YyXI71BVE0scYBk4=;
        b=LMIirtZbWVHl9OMK2FP7eOrD8PnKRM43D4QK9dwtJ9vDarxQHJ5m6igz5TC+l6LCNx
         tnN6ymJyDD8g3FuxpgMch1do38VwBoemcJq6Z9Olr07Z9qN8ElTrKrSEFmgtr7Y3OUis
         kcbzZZR3mZQ4HfZwttj6jbjB4O7geL8bN4yR4XlR6RHx5yN4EaiAupx0sBnvhKQphneC
         t4tYA+g0ztA4j3NZbh6EbQtAIilMMXIrffSCtJDBiqF8tVG0YkgPr+7hrdqo423kcJ/D
         ihOB5EyfUG3VfEvhA6uyccDMvPg12O+Iwv1dB4v9bGGJz6GcIyZ8EH82KbjrwZSIOMwk
         4OAA==
X-Gm-Message-State: AOJu0YyWcBC0GlB5RvRXOtj+O0QYQ+YM5lwLrYi56wh9Q/EfWaZhUG2z
	7xgH5zCwEn2pUbME8RUgtdyr1LRNIL3mmfQe2pJ0sfXDtqk7tzy3fDOVnO4dOdhDPGFNfLcomKV
	W3Z2FYmn9y5TTWcnboF6A1T4i9SgX8Dcpl35U/19n
X-Gm-Gg: AR+sD13ufMkTjBJx4h4a98Cg4UG03Mp3EEOkRv0YtcRA6FTo+Mm5zm8VmEwIZKv+rGK
	BYE9ERxJzb4L5QyeVzypajCuvPZAb3W8azCtq3jnCC/SWvE/EYHe3XSangyy54Ol581l1glN6+r
	+l8uGHxZ399bpmEihM9qg35sz+oSVPOw/Is0hJMny+eddBBLg5Uk5X/3rw9T7KU+hPXQMUeOA4i
	qmU9mmOoM2r5su7e8mz3yUlyTqggawBU0iJIaEVs8yjXsRhyd3IXABJmdPQYHkEUAfWgBnEx4T6
	uO/K7KsAgBjqwsfjeKGGyKhxh0R10PgxPkTq+iQqri/G2ecSLcHPXZIYuCdKNYnkzzxMfyOzW17
	bYOBTL5/9Rrqwd8YZIVUHvk0mgE5YJWPswA==
X-Received: by 2002:a17:90a:d007:b0:37c:6130:7a5b with SMTP id
 98e67ed59e1d1-38fa7dcb036mr912482a91.8.1785435525974; Thu, 30 Jul 2026
 11:18:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:18:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:18:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-12-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-12-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:18:44 -0700
X-Gm-Features: AUfX_mzurojFzFl7kQ4jInKyqzMda986c-EWBvJn_4YyREdNQpyHfl__fqR3AfU
Message-ID: <CAEvNRgEbS06snhyHznPSqxnUrdudVEKUuOpPwnU+AJATWFBRBA@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] KVM: selftests: Add guest_memfd_preservation_test
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
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

Tarun Sahu <tarunsahu@google.com> writes:

> Add guest_memfd_preservation_test to verify that KVM VM state and guest
> memory backed by guest_memfd are preserved across a kexec reboot via Live
> Update Orchestrator (LUO).
>
> This test includes multiple tests
> - (A) Test to preserve non-guest_memfd, non-memfd which must fail (/dev/null)
> - (B) Test to preserve guest_memfd with no INIT_SHARED flag which must fail
> - (C) Test to allocate the guest_memfd memory after preservation because
>   preservation makes the guest_memfd frozen. Which must fail as well.
> - (D) Test to verify guest_memfd with INIT_SHARED flag preservation across
>   kexec: Below is the details of stages in this test.
>

I think we should split this into multiple patches, where each patch
introduces 1 test.

>
> [...snip...]
>
> +++ b/tools/testing/selftests/kvm/guest_memfd_preservation_test.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026, Google LLC.
> + *
> + * Author: Tarun Sahu <tarunsahu@google.com>
> + *
> + * Test for VM and guest_memfd preservation across kexec (Live Update) via LUO.
> + *
> + * NOTE: This is a MANUAL test and is excluded from automated CI/testing
> + * frameworks because Stage 1 daemonizes into the background to pin resources
> + * and requires a human operator to manually trigger kexec before Stage 2
> + * is executed. Running Stage 1 automatically would leak the background daemon
> + * and cause CI runners to falsely interpret it as a passed test.
> + *

Usually there aren't many printfs in tests, but since this is a MANUAL
test, maybe that's ok?

Would like to know what Sean thinks of this, and printfs in general.

>
> [...snip...]
>
