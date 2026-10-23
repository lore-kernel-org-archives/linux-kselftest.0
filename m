Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776556;
	b=mzpbysNBSraZzjq3+uCIGA2QREMpTM0cb6mxeClnw9W69/Ma1lJhH+bBH1fWEMqnEoXw
	 uhsW1MY54fYGt3B53b/H+zV3zKrgC/QuDDI7iwvqsDQ5zdVMujHzhmNq/XCBQMBPzSBmR
	 WoCf9GL7WfZUZ0reCYo77lkRf06jKELt8PspKWzsIqpDCkWolRQ7mKjVNVDATWswGLxqa
	 7rPOOH3nbSOmoPsLyR+fXwbRvlhVPxsz/3qgt8pjtZaLZwMcKM3Y0H6vwTydAySVmI9E1
	 CzdQWHtlu5MNcnonyId3Sqt/HHEv3StxwxvTFrW7tEkvTs/wgP5HZDH86zLu7rZymBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
	b=vOb7g11OQrqe6enHYuv3SM3Q9maVLYxJ20BWeCvAUraBHS2KQ3oB5ZZwYupGLTB3BR3d
	 ZR0JgD3eqRskjoiqhPM6af0tOte5iCQsUxMXSeNENSLMeCFu63ZC97tdHBgqu41vMmVR/
	 /67DLeibB0x93pH2bUQ+qpfxWpQmAqNHqoRyCBqwiwflpE/98rPt724b1fErp+Fs14nHc
	 FAgCGM2PpWC1/B/KpC/o9dgyfhNjHKgwB2UFkrFEbLzIpLAy1XxGGorIZ6pX2mHoE7q9/
	 jGrMy/t0odZi7smGtb/knOAifNR5Mu96vLb9AElVSs0R+b8AxX90ga9qS+Z9wD2whmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FsXey+P0;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C5606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 17:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FsXey+P0
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b060ec084so757236f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776554; x=1793381354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
        b=FsXey+P0eeIEmJhBgBeUCGTebbSsxCz3o6QZLKul+LrAXxI5Iq6haR8I+mfQ26X3rv
         jdictCITfezDnQnCYZ7j4HTg/tTcyUC/Drgp3vmWKgBrr8QxD8Lc9OWWfgyy8NXh/aVp
         FU1i0kULfGHjxWSDkzzHhNYPQMA22NfAV96rytMgupGsdGonuZFqafUHqB4ni9qYpDM0
         pMnX6nPNZmJtDzCa3r+7pjhGX+9lIH4WS1e9IAJRnvCXCHaSmtntU37q/aLnIzJzsrgt
         wez8tRl8q/zWBYrqF7uksh+EHPqd6RxIvPagUfBww3wDRIPgVXt5ZOLUSwxJKgSTrUuS
         E6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776554; x=1793381354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Qj0y3/sB7EeSLYwSP8RPCK8AZrmLUoRtMMcxttoCbM=;
        b=G+QUgT0Ot4J8wkRYRNec4Ba2wEK+uDBzGPIgw6i46R52bjQdNK1FqMtouoai8sNSYc
         UO2McKXsWAoVsI8OtpR9iBvfJrpwW7V1v9jD077DvdTwmajLGt41DZlDvEOyTKsOTqwd
         zGSWLqWkEjTYg/9zQK5OW48Gx9U/xRmouf52BDg01eNlzWF34GnfpeIsGo6n1htGYbpX
         9DZXPQWL2q7BCBTj5T7OsrRPcxzweuRjTHXrJJTgK+cZRRq6RxwtmZVDHcZU0MlaFrum
         yzHn/Dp8ROU/UWDYuiQAzDtza1Z21WoFbKYkUgUVtwABgGP8KTaGFghC0szgrtNsdiYs
         G7Fg==
X-Forwarded-Encrypted: i=1; AKwUvBynZfSDFpM4b8u2GrPBol/anULClkTC7hCB4/uA6jGyo/iE7aD6xFiyA8flRKiTybm2+3riBwHaBJeiRVcEer0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEzULZqcecERr8QGVtfJ8CjFLSFn4g9a6CBVU1Tj2PcI37ZBTE
	oG0Tk5U4CNMCKMelQ0ZJGVX/QPnB4waXUmcFgYhU3QKfbhYg0jj/LkOb
X-Gm-Gg: AYBFou0LzlXX6qF3zMOH2BNUG9S5cObjxUyFnkGKWRzdbH3Zo5cKxglo4oZ4LypBmsA
	YwhqnIvJQSIbXauw6q8WzDy64DmXWzIb4NKzoZ/Ex2oFCAJiOfsZV8kicaE8CPo22GD6WN4CPUP
	FTwCNl3ugjzh/Na9gJILjmycAo72mEHIugH33JsTnHQ4Z3o4rYQy2mv2weVegmdZaO48ARuXjFC
	zQj8jxySKNzK0t0RWAE3b84R3c9ag8MSkADAsgXXmFgdbC+v9RjeB79AX16foLIZANXw3thP2RH
	1DRpsZkyzhn9LHPfr2W74JVc1YkY0omIHET7GqAJhMvSHmrIt+nBFkaLkAfAHeCfpzI6PVuSAcG
	+oljH0VnI4vePXPF+qn0UxksQu5s0jvjVM3Np141iy+ksJ/Q7oB65CKnIzWcM/EAffUxpxvJK0N
	i+W5me/EkK+I5Q10wnvPkpR7AkgsZE5rnfcoPBjr++NVpiPSlj3Lp0Pj9Hmy1XgwgGsX3klOGTI
	ziHL1ApzL8zAyHL+kGIq+Xsd5gMlo66cP/wffjoQA3+1xXQQiPofAkLUcFtMRfH2uxYQDDiHuAA
	xJp1Z71Sk1wlz9sTkL9GA5Utz1mg9Q+VP6RHsIA4x8kOZaw5bgSNXcT+lMvwtliCAXH4NVozoJU
	wg+aaANaPW9YtNOh2
X-Received: by 2002:a05:6000:2004:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e387d65ddmr4932292f8f.41.1792776554351;
        Fri, 23 Oct 2026 10:29:14 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4144f8sm1120262f8f.41.2026.10.23.10.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:29:13 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 34/50] KVM: guest_memfd: Skip checking outstanding references in PFN mode
Date: Fri, 23 Oct 2026 17:29:11 +0000
Message-ID: <20261023172911.17557-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-34-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com> <20261022-gmem-alternative-providers-v2-34-5dd1dc6c660a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +		if (!kvm_gmem_is_pfn_mode(gi) &&
> +		    kvm_gmem_has_outstanding_references(inode, start, nr_pages,
> 							err_index)) {

In folio mode this check is also what guarantees that a private page
belongs to the guest alone. In PFN mode there is nothing like it: if
the provider also exposes the frame somewhere else, say a ring shared
with a device, the VMM can still make it private.

And it is not only this guest that suffers then. Whoever else uses the
frame breaks: an RMP fault on SEV-SNP, a poisoned page or a machine
check on TDX, a granule protection fault on CCA, or, with
SW_PROTECTED, silent access to "private" memory.

Only the provider knows about such frames. With an attributes output
from get_pfn() (see my reply to 31/50), it could flag them as aliased,
and guest_memfd would keep them shared: refuse the conversion, treat a
private fault as a hole, and refuse populate.

Fred
