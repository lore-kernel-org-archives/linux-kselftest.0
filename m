Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6D34029E
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320227; cv=none; b=rYJc/vd4GNWzslLddKYQh4uYObay3jT2M7GCprvNSNtpiZeHMRRd9zOCrES/bdPjI/hAWLvQEr/aLgetxshOFHUynqn9oBWRXUMSs70PSqHLpIUKIOrAuWNhLkes7fb8dztji+b1cAmzGVEup1Xz7EbZ0TWCidB4bK9VP2uOELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320227; c=relaxed/simple;
	bh=sFclBlGuLlklutyWalxOxdLRxtPJWxF7xb2dfh79PCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q9qW3TpZN3Qb4rzKoLac6BfGYu6D8Kws+14cKYD3+cHiik3av6VhtmiywmeLnkqV8ealhGcaxxn9+4MTWX5XKogNDtsbHWdub8n9rMDt/GKzc6/FxcGlU/iz4vZpEeOFPFK0aLsENS/IWd7r+WL0QGnqKVSeaeZdUzROC/viChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GwH5XZT5; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GwH5XZT5"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c0d0516ad7so8395685ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782320225; x=1782925025; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bTiRAq90VFPvdthoswICGCbbk82NFtmBH/qctXPK1uM=;
        b=GwH5XZT5Gjtb/KiCw8TnuO37Blpge4KdrQPeHuge+fZ2ETrA/7DHZDBZJhhj5T9t9T
         +m0mKXolKbM+sB2/iw5PzfNG9X3CKDq8QaZGGePsE7ehLwyy7NViZtAxz1EOO0qgD91B
         sDcE44mtf8Uhm/c6mfio2i7R7I2t77uN8d4RO/shjDMAyLXXQgp5TuL2qNZzfP9f491L
         hVwGb2vv8u4P7+b4j3S6xKNDoGiGW6Vce2462lp2Fkt9ecdJ9NlzKImTGcEdh86+Wsxt
         pkDn9q1v+NC7T5gda5AA0A7AC36NAdqEGWroymqCYDcuS/Wg2/x6jj5CxstfckPuFGkI
         g4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782320225; x=1782925025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTiRAq90VFPvdthoswICGCbbk82NFtmBH/qctXPK1uM=;
        b=B6XcksAV180M5dvjzeFbkVyx9PwWbl9IRkT3FUx9iS3qNafcmvLE/N9lIX3fkCijBO
         FFm2WSXYXHvpg3u9PdLmP51w0Vnj772YB0qcuHkzY3IKflvzf87sUjb7UUfbeAM9td1f
         xQrwsPuX2+ogaMatw/qkMIXoiZ3Jf8OERIrym056+GWwwBDpEYMRoaiBUtfqktlTTZ18
         W+gNDkYto8kTxNWv7+xSqXODcTKiRbMyagdHEdFZ8OadpUf8rWfCJogzVj93wMy2Z4p9
         llf+U9CrnJuieyHIBt59NopodZxoAAUWX8IezaP3uZCQD3CLJebDx3YLhwxJx6Wg89bA
         BjVw==
X-Forwarded-Encrypted: i=1; AHgh+Roj5bHQ80RRvQJFOGrNoJeew1o3O+m6T9WO3rSh36XZaMJQ6txpcHSP6pnc57GyPCDSHPNnS8wyAEjnB5EfoqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIduwNsy3XgPngwLeumGISzMntVcwjzXmZGCy9tn9fn6NxIEv4
	12i2D6uGAovwTEezPmUX8Re289Ugs0o0jRBHZfOStshvsYlGoBcE1DjK93ZgJNSmoktNHOp+bVC
	diuKpQw==
X-Received: from plpn21.prod.google.com ([2002:a17:902:9695:b0:2c6:b814:535b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fd47:b0:2c0:b081:84b1
 with SMTP id d9443c01a7336-2c7e1464d1amr26763135ad.10.1782320224855; Wed, 24
 Jun 2026 09:57:04 -0700 (PDT)
Date: Wed, 24 Jun 2026 09:57:04 -0700
In-Reply-To: <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
Message-ID: <ajwMYCSrPlxg-Fok@google.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 18, 2026, Ackerley Tng wrote:
> When checking if a guest_memfd folio is safe for conversion, its refcount
> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> temporarily increases its refcount. 

Under what circumstances does this happen, and what alternatives are there for
userspace to work around the issue?
