Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284080;
	b=q9GzVV1A45M99V83JXwuahJ6atKgnD9fp0a3FxcmqijXV3IjLixoscrTdy+uPD0QRNvG
	 3czyBjbR+86iu7w1oNfh2GnkpBURQ1l/gazAvQ2c53trGMfWIhvVnT6N4bF1V0LSSpaOP
	 YA4OG7niCIKquKgP2IVp3XBFqr97w7YLZyxyBkvYkP4WrxL69fqs8EcFI/ONblRR8FeIO
	 QojWE1LUshC7UnQv1XRqe6S+ZJz5lK/GAIigF8AXklg0cgFTu3N36KoBQVvDZtQmp+f4D
	 cclZB1l3zcHip0aB4oBAKgOVl5dQJdeyjkyBCNgGGCc64rbRpa1A0ALrZxMvlve0Axw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
	b=wKGetmRa3JvJKoCG409byt+9J0iRW7KlEsUQyvDBZ55afAfjt6XJN6wWgkMmWPjG9Xqm
	 erbmwMnUV6zO53Rbfvon36X4DSlbJJ87tB6fwEOJCeK0APKHhavasVWPDxLPtj/fzFPdN
	 FpdCRFqiUNTS3fHwNB8ESphfVt7aXf/3rC4v/FYIc5a3eisXSnBXGVkqxtOLzndYxVMfB
	 w0e5r3N5WBkiCTzaB4/WPZwguICHmEQl+Lu/+TehaBMg4zGmBooeMjk7CjYidNl9ezAhu
	 Qq4mNx0Mu9ewvRRv7u0OXbE0hUV6nUlaIWb+90ZzG0ZifmOHjqI4v/AO340x32t3rTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8PPkEnW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF95606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 14:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF95606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8PPkEnW
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso1308588a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 07:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284078; cv=none;
        d=google.com; s=arc-20260327;
        b=rkIILJc1AsZL3hQspYq56TYGyP71zm2eL+mjPv6omSG/lKRaEYSfwraDa1D7dNLTRv
         zXkSRr7+nZWju6PIj0UdefTBei0Glbsc+boMU9DoxmzGmqhRu8mvf6O/35t4fhH2p2tg
         rNIxFn72thL38eErWPxHHYrFo2rFQ8WYiI7e3GJi7pQeY0xDje9ySy122VGf/VrzflgE
         +GwPk2AyISvgou3/USDEdYFLnmNi5FMyCuhRo6cV9LsiiXPdXo3JzOeXPOppeUtGjGsx
         xj9ffpoiofrwFIT8Zzgb40aEMB8baKOwyp8PwkLxZRIP7iVixtFofqTgVghn9iGzKUbE
         t2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        fh=aivNE0srPaTLR0yc7TTzMjKSjwqZA0x+w5NoDfnAajI=;
        b=fZx3s/tBdCCWWkQI6YgtL9sYTKcXc4Tb7TigN63EUTT8pPWSjFRGNi8XFefx80jJ2o
         L6MGHvXH4zcQ2caq2un+fgJGnYMyABLDmquRimrNitsha+EGDyjizZbGAVV78ukPw/RL
         kE9aopjjo/hKjV/iZkHYLbElKbYqyzVDIiuVx7WGibTQ1lS3sbneM04YS/a718MfltzK
         D3Avz42FKkOjOlIrmZuX5lxLhnZvOXY16Jap2Ct6DwB4yc7HSeHvnVOD76hSl7dwmTX1
         06g0Fx1idEGHqerNkbJEA2Dv+BWn1jzBYpi33ZoqWsVlp57F9LNaPoNaCD6x27cR+ViI
         oM6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284078; x=1793888878; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        b=m8PPkEnWZHgn1Yb0Kv+PNdW/reeGdEq8N6q7lop4c48D19FayEDDBwByUJzfxfAYB0
         Nx6SivpMpjf4vryEp7Z6xQtXOV9c3shPE1Hc7s2WcU2RmtLAyL+AQcIuedB27KrBj3jf
         x0PGYWzIl2iQx2PU6qMDdgD/nrDfhou5mEpSOKicJT6m0EKMJLzoryAFQN+7cU9wK0HL
         CihYXYE5rkMLljgh1Axb5DEL7zeyYN4KXtN2IGxGPFh60KQG/TBvN0NUdVve/uzacl0V
         aMYcozMfnCJgh9WdiDoPl9xREiY4Ifp0gSowJbZOnKxQxBMDiJhCe4Qap88yGlZJ8D84
         n8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284078; x=1793888878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        b=ixREjBxw8C3i4sYZkmEXPskT9hSFI7JrG9AV+AHy479Gmq05QXJ9NQy7V7e1R++RkP
         yXF7MB9QTCoq/iSNCr7LG4w3PWSMhUJxqaTR/D3MhLwQ/U3zajNVlGGM4Nx+0T4TeTxl
         5+7TwyLy3D2/sFsjoaEHCXG96qv7SJ5E9xacKOwyCWtX/yKDtGumLuyMI/KoTV7bdQ5l
         +G3iLW+CarCCQ1gU3DFVtVlqJKX98TaW+BESM9I+sFgj0NxG8Av1doMLWyOZN8C0nWRM
         NYjGY5cYRpYvwVMdKfC3NxUxnzVLr0d3hzUqfutyC87jBXh9RvBF0RK2yOtVkjiooH4L
         bvfA==
X-Forwarded-Encrypted: i=1; AKwUvByaCSRvZbZ1rgaoQ+c/QACrrez+YGpfmbfrcjNGr8pH0JNYzFREEk9/tbnRzuN0YTlbGT1OBcdOLQlhMV6z4+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3geBj7YvOOFptwbgz7S+PPvLDP4cy31yM3cj/YRCHySmyLKrS
	zrCi9cq8Eymayj9kHEK3vl03mpQoEbUeGG2AC4Sw2xuNOIzTPQMCAwLunHhh32+381aHamAueCV
	GKS3WrfwGeoJ8reBJgsPNY6tPWcftyaM=
X-Gm-Gg: AYBFou2jE2ANtgrKjlwKXYBf+JftVbSYqJPXtStzu6Ucua/0cz+84hjBHw3+xB7erz7
	WhpVkhllTOslPr6MC2vA0tlq86TjG4mWV2l4XlYSotRxniNR1NBq97LFaR4gAjDvj5u6gym50vf
	+0DDl764DrsY766nrpU46Y56nG/HtFYvCuALzmuHHmooqVJYE7HuM6/KPwf9DNRtngcqi6l63ef
	vGFY/FguvxmqqZ5+Bqst7YT9YPDFoCGFq5/vxrhh+/xTpVxPMaIifcXCHp2BUxXL4vxTtIr0zWK
	l3Ha9/3W7idvIb5SDTKCk8KspEJNew02kSkbgV3HxZTIiofB6cW07X9aqqMrt42e2JsruZc3oro
	zTsZzM3Tn6MR3tvu/xksQNTKNfpt2sRnalUPAv7wdz1kj8xopBkVRRPLRZI08VcVC2VXqWA==
X-Received: by 2002:a05:6402:4508:b0:6b1:bb19:de98 with SMTP id
 4fb4d7f45d1cf-6b4b0b09dcemr2163933a12.1.1793284076799; Thu, 29 Oct 2026
 07:27:56 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-12-griffoul@gmail.com>
 <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
In-Reply-To: <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
From: Frederic Griffoul <griffoul@gmail.com>
Date: Thu, 29 Oct 2026 14:27:45 +0000
X-Gm-Features: AclHuK_kIg9XZ2cFnZL0tpsqSJGFt3xKJOd_xbKB2NrNWZ3oy-bCAgu9pf3hZSM
Message-ID: <CAF2vKzOTd=0rmMXvtAE_SzbbZ3C9n9jTcjM+Rj=ovFoYBsXCKA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/14] KVM: guest_memfd: Add kvm_gmem_restore() for
 PFN mode providers
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Alexander Graf <graf@amazon.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Alexey Kardashevskiy <aik@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Ashish Kalra <ashish.kalra@amd.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jianxiong Gao <jxgao@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Oliver Upton <oupton@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tycho Andersen <tycho@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2026 at 05:52:40AM -0700, Ackerley Tng wrote:
> Fred Griffoul <griffoul@gmail.com> writes:
>
> > kvm_gmem_revoke() does not fit: it would
> > zap the guest's and the VMM's mappings and reclaim frames that a guest
> > may already use.
> >
>
> I'd drop this paragraph from the commit message, kvm_gmem_revoke() is
> the complete opposite and isn't a candidate at all for the goal, which
> is to notify importers that a page is now available (and they can map it
> in).

Sure, I'll drop it.

> provider --1--> guest_memfd --2--> IOMMU
>
> 2 is definitely required, but why is 1 required?
>
> Between the first .get_pfn() or .lookup_pfn_range() () and
> .put_pfn_range() or kvm_gmem_revoke(), the provider should consider the
> memory in-use by guest_memfd.
>
> When it's in-use by guest_memfd, then guest_memfd should use --2--> to
> map into IOMMU page tables as necessary.
>
> When it's not in-use by guest_memfd, why would the provider force it
> into guest_memfd?
>
> If the guest VM knows that the page is now usable (some other
> communication channel), it would touch the memory and do a .get_pfn(),
> that would be successful this time. Perhaps that's when --2--> needs to
> be performed?

The IOMMU never asks, and the CPU may not touch the page before a
device does. A few cases where only the provider knows:

- The provider gives frames back with no guest involved: a page that
  arrives during post-copy, a range moved back to the VM, memory given
  to an overcommitted VM.

- The guest already gave that IOVA to a device as a DMA buffer. The
  device writes it without any CPU access, so there is no .get_pfn()
  from a stage-2 fault, and most devices cannot fault.

- A read-only frame becomes writable. KVM finds out on the next write
  fault, but a device write to a read-only IOPTE just fails.

kvm_gmem_restore() doesn't push the memory into guest_memfd: guest_memfd
only passes it on to its exports. Stage-2 and userspace mappings stay
lazy, and iommufd looks the range up again and maps it.

I'll make that clear in the kernel-doc and the commit message. Would
that work for you?

Fred
