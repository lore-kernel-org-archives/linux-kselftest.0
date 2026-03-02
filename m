Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C93241C0AC
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467062; cv=none; b=t38ywgStatJRyDaqM3c2Xr8unh3MpXzU6lJAXZ3J7C3N1v+FJMVTNj2q0qjCQWK2bQS1ogugSqkFjjba95+fBLOTTEmfUIdiQND3Wv6p01A+LcLR4fWQJd4VRC2EkHukFYWKBDx6TOWMRu9ffUGN3EUW2uynh1Moz9zaH/60igg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467062; c=relaxed/simple;
	bh=iYsd3Elf0ik4GJpr4eGq44qKeDc6FOSqBZtqVOSshJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IJd7d1xhv/mlEPNSieFf2BD3Dt22ZqVO1cVfmMsDztLlQb7/32dCAqCiO351YlQPvIp62gN//G9yLcVy2p8dNh5QEuYplhscKrpJ7J8mMyI9UixP0dHIDWN5PO8gcGW5YiJmC2uwfrIRWGXSesAbYqaziDvxUw4Pvdsal/UfYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P1H1H/zY; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P1H1H/zY"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-359918118ebso1872317a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772467059; x=1773071859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ta44dSkyUYoWSHu8DjFcJDUvqHtZprEgi2FuVoYoKhw=;
        b=P1H1H/zYZoibKL1lGEcVpuz8c6BDWHwJEYFNS4Jua76NRE5innUXZ8hsEA2CcexsiY
         tClaS3cIVl82DPhOnWJElue/vEuShWsawQNJPPHKMyjjYpcPGXof4w151ZCpr+RBY4K6
         4CqQQdDWMYZq8GgrWm7qZcgye3SZ2A1fkDZsPTwu/tmKvgtFkWri3Hw1xoXjO29eBwpt
         Hbtq7XkQHrX0ESOe5DKUZjmqwp8UqJr5JkkB2+BAl7TjfsroiaF3myWgDDN/5eOpJDvV
         DwMjvTPESSOOTuimsTvxNGBl/f7p2gKop400EIyK0PQAX/tJhLIUxm+zu9fCVfCn5wpy
         ogCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467059; x=1773071859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta44dSkyUYoWSHu8DjFcJDUvqHtZprEgi2FuVoYoKhw=;
        b=TlcNiUY4MA89VHjOonwBjuouzaHFgbaQ8MpSh8XXVVJ3k+mhrFA1aP4kzntn3wtcHX
         xIeXliFLZjmdpTzg1tNosliIy6Kun2X1b9d9ec8dI+O0HhyoFCAntFSyz8B3yaqvH2iL
         6m8IJ6wgj3tBjbZN/hJYCE4YU7ff60hWGBMQa9Og83JrZzn3pJzXQRBJtiFDdBMsyw8R
         vxOtlNxOptAZc3lrnSJFndVM2zHGlOvAPSN9HnvjpAjcn7z3HZ5bMw1LoglzbYDMFPa8
         kmfSFFWKjhP9jt/IiPRvbSVAHRvXn3tBWaUy228gR5/B3aT3AIFmHsdYdsN78GPpuLyD
         /VgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdIrx4AGDtG2Bz07qPOeCwRYmy2PdAxA/Jip4DwRnE16aKGfS3gyvV5YsbCNqe2vAx+2PWwa65inhMdgFeJN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHoTi/az4ZnQBBU+BFIDUGKysp+IM6AwkbnRMuIxlggz97Iick
	KYpOtnkArmCd5qBXCakBloiLip3Q7DciCHEBSO+ypuoL7yJNzucLL7ACB9n+guqpqrG6lAaTL00
	lrIyt7Q==
X-Received: from pjpy12.prod.google.com ([2002:a17:90a:a40c:b0:359:8e40:28c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c0b:b0:359:8cad:bcdc
 with SMTP id 98e67ed59e1d1-3598cadbd66mr3700334a91.10.1772467059132; Mon, 02
 Mar 2026 07:57:39 -0800 (PST)
Date: Mon, 2 Mar 2026 07:57:32 -0800
In-Reply-To: <20260302090739.464786-1-kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260302090739.464786-1-kai.huang@intel.com>
Message-ID: <aaWzbCEWbStphJPh@google.com>
Subject: Re: [PATCH] KVM: selftests: Increase 'maxnode' for guest_memfd tests
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: pbonzini@redhat.com, shuah@kernel.org, shivankg@amd.com, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 02, 2026, Kai Huang wrote:
> Increase 'maxnode' when using 'get_mempolicy' syscall in guest_memfd
> mmap and NUMA policy tests to fix a failure on one Intel GNR platform.
> 
> On a CXL-capable platform, the memory affinity of CXL memory regions may
> not be covered by the SRAT.  Since each CXL memory region is enumerated
> via a CFMWS table, at early boot the kernel parses all CFMWS tables to
> detect all CXL memory regions and assigns a 'faked' NUMA node for each
> of them, starting from the highest NUMA node ID enumerated via the SRAT.
> 
> This increases the 'nr_node_ids'.  E.g., on the aforementioned Intel GNR
> platform which has 4 NUMA nodes and 18 CFMWS tables, it increases to 22.
> 
> This results in the 'get_mempolicy' syscall failure on that platform,
> because currently 'maxnode' is hard-coded to 8 but the 'get_mempolicy'
> syscall requires the 'maxnode' to be not smaller than the 'nr_node_ids'.
> 
> Increase the 'maxnode' to the number of bits of 'unsigned long' (i.e.,
> 64 on 64-bit systems) to fix this.  Note the 'nodemask' is 'unsigned
> long', so it makes sense to set 'maxnode' to bits of 'unsigned long'
> anyway.
> 
> This may not cover all systems.  Perhaps a better way is to always set
> the 'nodemask' and 'maxnode' based on the actual maximum NUMA node ID on
> the system, but for now just do the simple way.
> 

Can you add:

Reported-by: Yi Lai <yi1.lai@intel.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221014
Closes: https://lore.kernel.org/all/bug-221014-28872@https.bugzilla.kernel.org%2F

> Signed-off-by: Kai Huang <kai.huang@intel.com>
> ---
>  tools/testing/selftests/kvm/guest_memfd_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index 618c937f3c90..b434612bc3ec 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -80,7 +80,7 @@ static void test_mbind(int fd, size_t total_size)
>  {
>  	const unsigned long nodemask_0 = 1; /* nid: 0 */
>  	unsigned long nodemask = 0;
> -	unsigned long maxnode = 8;
> +	unsigned long maxnode = sizeof(nodemask) * 8;

Pretty sure this can be:

	unsigned long maxnode = BITS_PER_TYPE(nodemask)

>  	int policy;
>  	char *mem;
>  	int ret;
> 
> base-commit: a91cc48246605af9aeef1edd32232976d74d9502
> -- 
> 2.53.0
> 
