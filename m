Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667301;
	b=DcCxmWWyA0+KzYtBcA0454y47lce/QHSnt6Pca0BBu6As1KhUREQEDtU9LKpOL8fNt5m
	 eWYvuwEgIJhNnQOq8zsp6U0FM1/qKLJVvLlJOS65RZSCRwAWnLn+tDFD9iPICjIXGDHzX
	 d+AkGtcwwfoHAFRFp9yGwWkZb/uHmux5X77FuyRvLyYBt4lkyxD4bkMq7dFfx1oCGwp2g
	 FKxvrFeSik4o+Oe4PwbY7uD9SrMD2YIayCVqBU5hX+56bFvjcDzoCVWnpxCHd7dxMrcRI
	 ciIc76kl+Di6em+Iu0K66CdGr1RsUbEM+8upsA1JiIkhLm8Yb5prQdQ/dosDza5RX9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=utYETJ5rHiqNuCeYbazrvQTxJbHnffVJ+WGLRhPpEcM=;
	b=hHDj2rnlczPUVDmGgvRyliKWYHDCqLrczKZT6VRAAjdCqetxkrfwQK0LAcFNI3tukiec
	 PJARtqqO7iDhJBLv2BkP/F5O5RMCt9bJ2I81KJVywjithBkmrpTaWXRG7W7LnVdtvtG8l
	 U8nQ6nw6d7U6xi4FpHcqt8Mzho6wbyApOq8K8xwexiEauHbsLn93gvIhJba+gyOcL8EA+
	 B4GTpvr2NmPRTFYRLZPLHaJiGFpG8BJk+zMc2sXoMbYXY83XB7aruY+0q9surBTWlsTqF
	 nt0QCK9xMw2bQhCvCYsHk2dcptfgrj4FW9hK0fkairxAqCSkSBdra1xK7lzxGBi6G3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mDxlUQbx;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211DB606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 00:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mDxlUQbx
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1835043a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 16:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667300; x=1794272100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=utYETJ5rHiqNuCeYbazrvQTxJbHnffVJ+WGLRhPpEcM=;
        b=mDxlUQbxsLKooZ1+O0OFTCvjBlA/exBlT61vu6XWQY1i3FoERgcSmYgmy00W3bs2u/
         6dSQ8IiE95puZ8l8pLfIrbjxqjzd78CsCOdANjsHRM0OZqR0v9JOv6eNGpNU98Jy1iuz
         Bb/2MJDQ873SPx8Dwfe8nWB5yjj1xaNXu4JIERwXrqyAHAEWrnqLUulatudPktTbo49z
         BK+BI1UrrjDzEZg2vIBqcJDsyJ3duvRoVG21c95GEuf2Ufy620sh49g7YRlPnDhxXDWA
         jaqrW42hNowdcuRQGBr+VpZexu0XpuSxc3gQf5ts/Ss6FV2vte2g7oJ7KInhTI3NGNNc
         iqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667300; x=1794272100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utYETJ5rHiqNuCeYbazrvQTxJbHnffVJ+WGLRhPpEcM=;
        b=aJnbhMIZastvyBE++XTU4i4FbEalYuRWX53VKrrcrelePJ3+lefvDJGyOODoynULt7
         Y9d4sWcxjvAjEM7bT+0A+muX6Lg8/G8gJqeKhJV1qCQ0sOeeKr/n61YjqrsxtVMr3trd
         9yTOcpN36iJObhT0vliuUe0kY60DyvOe0WjNOIOYNcIEMRPAuu94957yqOVVLwiOyN1C
         FbgHdAYqgiGTgdhRn5Ubm8SHRiWdiC3AHx8VuCgHezndGPRAHRNm2rPjdh4Ao4xB9rWl
         gRMvKwY73jSVxIZGe91SADXSH4+cm8TcdFSWRzYTzrYb5R4S1iMz8tEUird4dFFmsBv8
         5Mjw==
X-Forwarded-Encrypted: i=1; AKwUvBziuyYVQDZpvCXcBCDvS6/ekHgLAqOb9GJfYUEUFG/pgSnOcwrI4Pcedimqu2VjgOvNW3dIlENIOq0SI2chb4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JqS8eprqfldaXpRQa9z5TG/FRtaQ8ZO8YUq4YHqcNLuXv/C7K
	z0UMBNvXU/sLJD25fy2O4NhPFlZRCnRaHIKQ5/bcQFVLhhTyHizc2cFtxZTPPw4xNQ==
X-Gm-Gg: AYBFou3c+bhoq5f8zY/JuGysz8i+ue7Ok3Z7mawqKLrgTDFboVvHS0aJLWExF9l+jVF
	uSmGDXfgteME1v+BDH8IiWTebF5UCH1vj8krBJSF2SQRzescLxZnUEEMgvpOqrDngl0LvJz9SRB
	a9q/D5shonRMWRGL8byNqb+x+tiOhzDrUdRYRtfDnWjqHfA6fxyj+WiZPsQKuRDlXIOkxMJ6Fqo
	53KvLdx3DSeY+EKZRaL7zMTZ46tjWpsbzICGGZPxIeR+t7yoRagBsE7zP8MKihfl4gETdqmkeb+
	jmPOuMhUZxhFS1ELkLulLfdDxmgqdN8qdIgDNY7bKPYIh0Rl+R9+GjazDJqyS1EY1reyPYWjgiy
	sGU7GNiFE3az5+zBU+ihZlWZZOa21ODrxoNkyG7e5gdttKvtsPc8gMZ3mNWqJtvAC5hOu8BvgcN
	HcWv1p/9g4XqeQ7GbM6+zbKeJMxYHjT76pEozadAgPFsLY7ZdaDAoHCH2iUFSAps0airYhE7PQK
	przSpOB+bvsa//JCEzf6BwAAXgRx6Mduzl/LOZsOCHoaJ16a4XIJBzjKTHAJ8lYAIgXXw8yNbZw
	uQhSM0FzY8isn17Hrt77WhMxriVmDGYKGAFhNG5is/wiQV6k6hwQPF+7BSOXjW86
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr9255823a91.0.1793667299847;
        Mon, 02 Nov 2026 16:54:59 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm10138264a91.4.2026.11.02.16.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:54:59 -0800 (PST)
Date: Tue, 3 Nov 2026 00:54:54 +0000
From: David Matlack <dmatlack@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>,
	Matt Evans <matt@ozlabs.org>
Subject: Re: [PATCH v3 3/3] vfio: selftests: Test BAR write faults after
 clear_refs
Message-ID: <aukw3s0IR689RYYG@google.com>
References: <20261102230445.3993629-1-almasrymina@google.com>
 <20261102230445.3993629-4-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102230445.3993629-4-almasrymina@google.com>

On 2026-11-02 11:04 PM, Mina Almasry wrote:
> Add a regression test in vfio_pci_device_test to verify that huge_fault
> on writable MAP_SHARED VFIO PCI BAR mappings handles write faults after
> soft-dirty tracking clears VM_SOFTDIRTY and downgrades vma->vm_page_prot
> to read-only via /proc/self/clear_refs ("4").
> 
> Use vfio_pci_find_mem_bar() to locate a memory-backed BAR of at least
> 2 MiB that is safe to read and write, and zap existing BAR mappings via
> PCI_COMMAND_MEMORY before each sub-test to verify both:
> 
> 1. Read-then-write fault sequence after clear_refs, exercising in-place
>    huge PMD/PUD write-protection upgrade via wp_huge_pmd()/wp_huge_pud().
> 2. Direct initial write fault on an unpopulated BAR VMA after clear_refs,
>    exercising vmf_insert_pfn_pmd()/vmf_insert_pfn_pud() with
>    FAULT_FLAG_WRITE set.
> 
> Skip gracefully when the device has no known memory-backed BAR >= 2 MiB
> or when /proc/self/clear_refs soft-dirty tracking (CONFIG_MEM_SOFT_DIRTY)
> is unavailable.
> 
> Suggested-by: Alex Williamson <alex@shazbot.org>
> Cc: David Matlack <dmatlack@google.com>
> Cc: Matt Evans <matt@ozlabs.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>
