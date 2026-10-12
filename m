Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F20474263
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814285; cv=pass; b=RCfLo6S9+IMDL0dx1xCBWN22c3BOWd9hdc+5Kq9YxTCNlti5vmG1t4ti+sB0gB+Dds/nxJCB05GAit1mjbHeu0qxp52Vu9fONKye/wNH4M2F4uYwr6K54S2PyE4cscOsR12C2oeAKTyfREkC4GrU3yQ+EHY3chJ+XF5gaq2IukI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814285; c=relaxed/simple;
	bh=toTfP3XAamHR53tLn5nTeuCeveBATzueww87oO23fhc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RA1YH2BvEaYfR367wZD0k6m1kGF8jpwCoTRW0K65ypI+oh4aXxn9/jDbMHzZqO23scfbWchpQk39ct4eGJoD2FectqSwYxS/WPQIYjlF5E5DQDq23p7oCD4OgR4OtIo+7WJiwrAd1w40xE4+BF7v7YSbENdda1pQlGCoJ/u3Y3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=riuHiHDN; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="riuHiHDN"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91986c5cb75so26065986d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 07:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814283; cv=none;
        d=google.com; s=arc-20260327;
        b=hDRo9TSXbU6pGE1xNP2I74wrv6vJvGyqcaMP1lzbHI2X+PyPXVWpL8dG9Os5emZV0v
         Ruvszy2QAvoV5Sbabxlm6oRGBNs9kKjEtyY+FAzkZUtvFzFMrZFgQ/b1rfPhiVfoJ7fT
         DjQtHgKG+oNa1B6YTv3C2qSktuhfcurFCffS9zHUti5td2FHZg5o03JF8g3p52S8gd6J
         +tVa1EDh7tZdvyQQhRJ5IZDAfMCSx23E4sx9CLq0H3RNKnjhXcYSfk/kTQZpoXYVoCDb
         338hG326vs6pOFxUP38NDNqoD/uRghYhp8Wg5nTp6M0Dk/ZdAgj9uRleVuDOpGZ/qBQK
         MmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        fh=FlyuisoJRbKFOIuZdNr1sxhuTJmyoibOcbKfLLIve+0=;
        b=C2Wi7COISoP/URtRy51fKtLf2oYFIW3Ki9ExUqCu05uGWPg9TJWE2XTXyJTLdN2K4H
         bwG8qKxdYAw591N9tmFbc96aUE3oYTqr0gKsbbBYbPVkCdaFX6HkCuCIRCOxMBkmGTUj
         fSSXEKdvxWt9sYcV64hyk3NRbNiY5c07J136QYYy/t+k/2T6Fjivh/saJY2Upp4FO/YV
         GCzWhOBgufpT0uTLvGqiX32FIvrFDdsmzDbqDOc3QuGev0FtSrZrcjV/ByjhXdiEipNI
         k0vxLlAVbOMXqFnxrEeriQY2co0ml+KvctXnctbCWnuRmzrREQjlm1BBijRIl40jppo0
         S9BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791814283; x=1792419083; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        b=riuHiHDNI9VbFbKH0rde37/ykIQHmtHxc4wUw4QOAJXPzsnzi8j+1eiNfM0X4MguS4
         JXwovS5bZUNydRY/IxjZYYmuQpkw+RJvr9LfcZXyjpTz2u87kRr7GiKsTieVmsanIWkL
         UwjCPacdD2mICgm1V3og5rguoRO5WIdCWYbxD9AijiQXbBYr386NufiBinUAEpfXH4+X
         jLIJt4F2o9i9m6KcdyFwCTnsW3PD+DSRKDYlvQLjNV08LUFp5TymTaNl5EtsTWwAovql
         mmu94+cOesk/2rCSd0D/Tg3YDsQ4g2d2FlPJtslOfah444xvgzoWE/Atm/cGEmQbc26u
         Xw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814283; x=1792419083;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        b=j4RfbzkJSSTTf6dnXCnFioeyI8j3j5Vg/TgmCw8/YuLU0K6snJZPrNlp9DqeS7nbLa
         rqhrRod/5OrdfOxNk3BpbRgUmWn1YPotiyC/sDXNcSE/ABpwy/xnn6enI8sgbzOwAqAM
         G88hBi5EqOb6vlN1JU//14jFJqWegu8p01TNYvdAZBJ7WY35DyRsv2JskM7w1TAfZEu8
         wm2UBp84JOq5S+QjjIS15AUayRFtyRBj0QSMM02pZv1wBsght+dGCHxQq1hWUBviOQNR
         f+I4icVQY515hg2GkcUpLBx5eBl9rlPWKFzX0zp0YLAL2RzINREG+1wjc5rXqlJDjFrC
         IkVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYgXFC+LkBb7vCTYa1D21WF/UP7mslfkAKjVE0DEPawAQb7nQJaevArDqgILBQbC65ShZG8oWjG/s+BzmYiY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrEEQbPK7uoXEyrYv5nmglHxRJcO3+RBkBpM1K44D5r/7gu6Nr
	yGDHUpCSf+82cPYJCNVa5Ag18L9A9Zk6r2nu3fHHoAuAosP1tt7UXzJHiFdyQGWMQoHKG8IgEjx
	SirSS/YSn4UhKr9QEikINiaUtcqimU4BFV8GlA7cq
X-Gm-Gg: AYBFou2oHdEO3m6ay/q4dv7egocvpWLTxxsL9uH2wsyFHKXGK7U4arTzVQzuy3+10eW
	i8k/1VM/qGnSn3WxtvALHFoXMM+2H9+qzgtTthGUqxYyEd5uZ8Pveb4q+IzmwXKzu5yCm6VSQlf
	FXPGfJaTG006QgJKbNXXMETAadq8jeYgXYHBMvxTIj/UPmIJHtAkd9f9ioGfMb5ny662Z5FusMs
	T+rLzeQgJbqrz6gP/nKoyYvvDF5wOmi0CplfB9hF68ut3R6iBHgjc7T/sun2rZKW4oTu32OplcU
	z0ZIhgqcIzIugmVTuGBK6p0E8fitUO4LfiqOL2pr6Ks11Fns6/olcBYaXcnWZhoO1iTyN4ZADXc
	4rvLZMx/50vbJXQ5+IfQm
X-Received: by 2002:a05:6214:23ca:b0:91b:8e83:e4b0 with SMTP id
 6a1803df08f44-91b8e83f3b3mr19792736d6.20.1791814281518; Mon, 12 Oct 2026
 07:11:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 07:11:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 07:11:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ar5iaaLcyz9dCXQI@gourry-fedora-PF4VCD3F>
References: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com> <ar5iaaLcyz9dCXQI@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 07:11:20 -0700
X-Gm-Features: AclHuK-GAlH1JSAYNCIS06aJZxJfvunIjbH1E5FXsRqa5lYNWWJsyEqAXZVZwzo
Message-ID: <CAEvNRgFO5FUFwU2GEEbHogLmT+SXVu1asLe5uzvRte2jqXthUg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/17] Allow guest_memfd to be created using a
 resource (pool) fd
To: Gregory Price <gourry@gourry.net>
Cc: Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, vannapurve@google.com, erdemaktas@google.com, 
	jxgao@google.com, rientjes@google.com, fvdl@google.com, jthoughton@google.com, 
	tarunsahu@google.com, pratyush@kernel.org, fuad.tabba@linux.dev, 
	David Woodhouse <dwmw2@infradead.org>, yan.y.zhao@intel.com, michael.roth@amd.com, 
	suzuki.poulose@arm.com, Christian Brauner <brauner@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>, aik@amd.com, 
	aneesh.kumar@kernel.org, Vlastimil Babka <vbabka@kernel.org>, kernel-team@android.com, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Gregory Price <gourry@gourry.net> writes:

> On Fri, Sep 25, 2026 at 05:50:47PM -0700, Ackerley Tng wrote:
>> + e.g. for tmpfs,
>>     + Use mount page size.
>>     + Respect mount size limits.
>>     + Use guest_memfd mpol and fall back to mount mpol.
>>         + Gregory, now you can set mpol upfront on a mount! [3])
>
> I haven't had time to quite give this the read it deserves yet (have
> been traveling this past week), but I think this mpol/mount issue can
> be solved with a new dax driver (which maybe provides this provider
> interface) without needing to involve numa policy at all.
>
> Essentially
>
> fd = open("/dev/cxl_dev", ...); /* backed by anondax driver */
>
> then later when a fault on that fd happens, the driver provides an
> anon-memory allocation that explicitly requests the node associated
> with that device - as opposed to trying to jam this into mempolicy.
>
> If you're planning to be at LPC, happy to discuss this in person, but I
> think this provider pattern is likely much cleaner without mempolicy at
> all if you can just make the provider do that allocation path for you.
>

Nice meeting you at LPC :)

I agree with you, I don't mean to require some kind of mempolicy setup
for every provider.

IIUC you're saying the entire /dev/cxl_dev is some fixed NUMA node, any
allocations from /dev/cxl_dev is from that NUMA node?

In that case, if /dev/cxl_dev is used with guest_memfd, guest_memfd's
configured mpol, as in kvm_gmem_set_policy [1], just can't apply
then. /dev/cxl_dev fully controls where the memory is allocated.

On traditional mounts like HugeTLBfs or tmpfs mounts where the mount
config supports mpol definitions, we first apply guest_memfd's
configured mpol, and fallback to the mount's policy if there was no
configured mpol for guest_memfd.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/virt/kvm/guest_memfd.c#n400

> ~Gregory
