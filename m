Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F288A72631
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 00:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568287; cv=none; b=mK1OHz1PQvps2Vmabu90wdg26ZUo3R9LgERTnCni4T+pkzNCXiy9SHq3SwSpuaQb4/b9i/JrYHj3Gzyy5L6OKT0+olQIw9VPtVzCv6jKvFkEvcmbjSL+7kX1eWd8w9hXh0sly4dRAZ3MRxQ1zACkjNlMCNRZlvRDoOg1YHbDFr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568287; c=relaxed/simple;
	bh=ScZO0zTAhAUUrCPn2ItLGHBxZgasFBIGvOq7yrsaQ1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiQNpPvVcoG+fn9Nwygpd67gn/P53ZrRLtCj6mFwTrfj/r7brw1NyE8RpkjQmjfNGEsrEEZBAeiMHY0AkUKWVZTxAlGk2zIUEAduDQO/i4+1FrSzAcU/FLXznH0PinrAYbVvanHZauxnsGQOL95jY6XYhSMqE2nvf2J4gmRzdN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tLZe5R2x; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tLZe5R2x"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf22c18ad3so24225ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 17:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781568285; x=1782173085; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GHN6z9ynbO2Res19U2YVQS85Id9OG0/5Hx4RzpTAx3U=;
        b=tLZe5R2xzc/wZn+OMFt2Z64ViIUbeiRqwBx1w7/C6Sb9i1Lq4BpSEG+6rJg4dYk5q6
         cyM8mzx7a7zpmzsNnWo4Yjsz3BSnvzNPlfSqnS+fMTvCtxLF+sdp3XKoqFk9OZjrsLEJ
         qwLUZ2NvFuolQZEmSH7pNwAeqkiBf51Pd0asO8mgqAyS5W1JfYakoG1Cewp+1fNwtggX
         EsLZVNpScyUUyIx0AhYjYEo35y7s9jqMV7jokXv1fF3+XudA1FS4yQEOrFmSVgotAxfS
         X1kc7YD5luolHDQXCezs/7XO76TQVtOPaIMRoyC8QRYZRHsEU3d1phhDl6oc51s8nqjP
         519w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568285; x=1782173085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHN6z9ynbO2Res19U2YVQS85Id9OG0/5Hx4RzpTAx3U=;
        b=c8jv9vBFtSBFIMJiRufF0kV8Zg78b1vyKerSaJ1+vw22oq4DIHSUHI+Tu25QMLqjwn
         dQtop1jloeb4mU4AOJMSOmN23cezIMCNjpV/4d0/rE9MZsY6UPyhwpfQzDdRqtkZ3iT9
         0NeF6xZLEiJkWwtXMB6UQKqsZ7lKMY2FYoN3UT8M6NrHsaMqhPa7JAPvEDlFnuCY9WNQ
         EBlkZvUDbd2IfXdR7XwNYHdr9DiFMeEMUrT6toxzIOzeoMfJo8j0jvp0h8/k2Poti7Wn
         eNK30/2X3Ul82e1PfS+nxjZGfjiwkzRp4m0CVrg4csW4C4GWyy+/9zCljM3HRrTtJ4on
         rjWg==
X-Forwarded-Encrypted: i=1; AFNElJ9qRp+3e6WMkpYwNEyWIihO1f8vkL4ryJjgtOCiHLmd7gVd/1FN1KfmSCHnR7R6YtaQLQvJjhxuVWU/Mp8371E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+WrUP2cpprN4gy7l5Elg+AsHMau3wx1WoZoK/xZRZodpLWVZP
	Py1WPNWClotwk6J29fnM/W7NTQGrshszdHxahMyglxfrApOCLoPCZeZasB0uVtWVaQ==
X-Gm-Gg: Acq92OFVPnzTMIV0lPfEerI0YC4KTzeQO8DyrDZfcaxIWmgIK6QduyEUg/KO2scD49v
	OLAE7DkgbC50H26KOuFa3K4yIkObAly/G7GLGCOLqLEi171JhEDTaNMqJH+EyS/0mf8FikCwm0H
	5Y1t9YMJfTMw/yPOEHdWK/r1POgRGXLFJf3jZmtWEum+exS6UvmhXXFguwiJA0Gh0b/7Mi2D68z
	suQFU69zJgmQwtYfeK2c7IHZNXdY9q3JqCAnI2XygBFPiGIkVkvvFXJSN9cTlD+bs9hVC1i+zqO
	iRqsqgT1pHTdbjz9Kk6XZBZE0vJO1ZEpq/K1V4T3tFNTofBzYcgpeh6DS6AXdxOH95+yuZsv+8+
	who2RGEcF/z7qRBiw60VlRbTHqaCdCFDiYIGhPXsXkXVoQ3T0b0vkzRuM19yYJ+zqNL7hYdzgsH
	bn6t4gH7eZltw+QInlGxW5qWMQWxrA/CRoyfqFlsw4qtoQxp0v/paS2ijyPr1z1YBo8yo=
X-Received: by 2002:a17:903:2a84:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2c69a26dea6mr1202495ad.2.1781568284918;
        Mon, 15 Jun 2026 17:04:44 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm11119220b3a.50.2026.06.15.17.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:44 -0700 (PDT)
Date: Tue, 16 Jun 2026 00:04:40 +0000
From: Lisa Wang <wyihan@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v13 13/22] KVM: selftests: Set first memory region as
 shared if guest_memfd
Message-ID: <ajCTGGL2k2FO_Bgl@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
 <eab3711d-c5b1-4132-92e4-7f7040fcd17b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eab3711d-c5b1-4132-92e4-7f7040fcd17b@linux.intel.com>

On Mon, Jun 08, 2026 at 04:03:23PM +0800, Binbin Wu wrote:
> On 5/22/2026 7:16 AM, Lisa Wang wrote:
> > +	 * exactly like other memory providers.
> >  	 */
> > -	flags = 0;
> > -	if (is_guest_memfd_required(shape))
> > +	if (is_guest_memfd_required(shape)) {
> >  		flags |= KVM_MEM_GUEST_MEMFD;
> > +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> > +	}
> >  
> > -	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
> > +	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
> 
> The build failed due to this:
> 
> lib/kvm_util.c: In function ‘__vm_create’:
> lib/kvm_util.c:507:9: error: too many arguments to function ‘vm_mem_add’
>   507 |         vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
>       |         ^~~~~~~~~~
> In file included from lib/kvm_util.c:9:
> include/kvm_util.h:714:6: note: declared here
>   714 | void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>       |      ^~~~~~~~~~
> lib/kvm_util.c: At top level:
> cc1: note: unrecognized command-line option ‘-Wno-gnu-variable-sized-type-not-at-end’ may have been intended to silence earlier diagnostics
> 
> It seems the patch set doesn't wire gmem_flags parameter to vm_mem_add().

This series need to based on "KVM: selftests: Add support for mmap() on
guest_memfd in core library" for the gmem_flags parameter.

Lisa

> >  	for (i = 0; i < NR_MEM_REGIONS; i++)
> >  		vm->memslots[i] = 0;
> >  
> > 
> 
