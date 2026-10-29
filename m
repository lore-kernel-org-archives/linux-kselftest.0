Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278364;
	b=to6mZVaPSfiKqu2P7RHzKYPI63Om3LXj0bglMeAqBk3uVeNZMFmDpKVztUed/I4BF+Lt
	 1HIqyB3RdmzZn3QcGQFOpECx6inA8Tym+TFy488l4JfmdlozBbiAtgLjrVj3hNKYZXQw/
	 1VNX6GJCn4DRXQyvj6cijv9cilCSQpH0fxzfHgPnYGInNwRMDR9r4TpHe1+tAMNgzCi+6
	 UGS3OtrBx81GBGMpRrO9wz5L3JwnbANGj4FtCGAtGEamM26Ixd1Jj0tcnfFcShuM9jcZ7
	 xFT4p5dy5vFAXOTl0m0oBtIQqTRWAv6MI60bvqvFQ2cvHqo15lvVtqttjzckEmxEdVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
	b=vF5SAVXCmc2PRSBhUWPLiIyCqNxf6+DmIdX8fXf0A88gaj0hsr9fIcAEUDwLXbrYxAkI
	 3qze9PIznkDd4wMH0Kg2PovYkP/luUy+JXybGBZkw0ZOhLTH17DBRc4oTGJDd0aeJCia1
	 TSF568qeMsbMUqdGTjDjr30PnkAeAE/Mz+kLKx3pI12l15tJuBa7E2IqCw5rs1ykaMYa/
	 PzVziPogigsIPC7Zo/zPlhkCyhaVJFYDnkBbA9abx57toHJ1T+4dGIhd7As021KWE8dwO
	 1aLNQo1sXEnc97zg9o+69KE61+uF78BTCJVNNEfBH6P8DGCcJM0Ao4O2B66StPnAxWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ilBWZNJq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB30606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 12:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB30606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ilBWZNJq
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c75267b0fso24077546d6.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 05:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278363; cv=none;
        d=google.com; s=arc-20260327;
        b=bWagoz+AmrDAcFwZheMBDpE5qFpZe/ZqivX8N5h+3dq4dvZkyPcn7zCBVihzAGgmUN
         vbFMyubn6opRvdrPyiYOxFu/xJIwaxA1K79kntD4k8ltsgUFPRR/+6BIKpg/hreSjBY0
         x+/1k06UdC+uCfXfVY34WwBvrwhw5JVd6TQkTiDTgLdTZrGlyjdlS6KAh4THrwjyp0gN
         4NKUgf1dfitEnmCjRS4J0JcVggsOkL/VobYaM7nw2y9Hs3gGfYfrJJQzMnvXdqRb9f+f
         hjJqfZf0fe+fDyYLZUAlxPgA3ojG8Gnk0XnBEP/VWvGSkdW9J7m1e9XUWyJDcWQblb6C
         8kEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        fh=ErWKn2XAP56ghzEabOZxwcdcu1QeTpEksffgrifOdfo=;
        b=HBpIwp40sg2R9/nNyXiB8BQYzALKxItZHsllTY981LZHci51dZFUcQkD8o+t5Wnmox
         5jhJyfXqn7wyINRLgdn+tGGrGvJzBUCtNA/RHTR6XF1OKfhlFxsU4AKIT4ht56JCnIau
         um6FgHGeaDhKcG9UeP9kTbLEOQvWROmDOEgRqksGqUKihx0GDPh++9bd/f3KFbLNPciN
         xK3sQoYx8ddZvwQmP/9cOMC3o0n90Xe9gbcHZN9FALZ/M8jDHJeEGdTJdgo3FlNd329K
         ThydzpL8VtjDUMWyZeWxV0re8LQIlKCD8xp4xhNBoHrRUmTvyZSCQmaTgi1TFJ/iMk5t
         W/eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793278363; x=1793883163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        b=ilBWZNJqMKptZvwkKrs2r7FR0ELwbpG7leCsdx7jfQxCDTv/k93OwjEufXvhCe0XID
         xibNckbWfyQTFPGne38psJQsKKrvMTJJdUQrdanZeOz0uHUNeBTeawL4MNhJjblH9PIZ
         fZlKI4CivX5tJ8PkFacttPvf+wR4llu5ZYaPk9JEPGxEXQ3BR/ekFNZPTLVjPTxSfuhU
         s5joSjQqJptEs99jZvbC2wWxLLtLFk1R7Zc5/St+4erii1a/eVPJ1zmACPUgBAS6QKjF
         g5vMM7efqUOyZxMUXtpdO36TgIHqhKOpKi0VWbuiV3m0U/xsOFgC0QRTl1rLSFYijegC
         ufWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278363; x=1793883163;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        b=dOrt3ZuiytVvm2LLnhT5M2+dEHC1o5ZJML+tvYXcvJqKLhOHzlIs477uuQe6untri8
         4+7+cNKRqjCBxjmZjvFkVW5j+YTPATpQEMY2d7qtDMqkOMYH6AC5arxtVnYokszwuzGM
         zTZhxe5/tXon9W/rZhC8xZ8a/e+ypBa+yIvsiv6r/FREcQT31VTQnepL+OuKKszVu+Vw
         QL/SCP6mMoXrhFq3N9cnH9XceVGLzo2ImklR9kLTLNXbbzraasO4l+otWpN0oYMLj6Jt
         cN8NvF+qDe2fSUE53p3lHZ4uhMt2NsyqgsPawRTa/Dq99t5GombIYPV2ZxZddhtJT6GN
         MlIA==
X-Forwarded-Encrypted: i=1; AKwUvBwgFEMWiPd4PYmRVJ6wFFGlQKjGbUdV1IeizZKvnupOz8MBJaTMpTwhnf745c+LJEwns7jBvUMJGD/kQvoirwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVP7s54ydFSfYmKrD/rL3OFjDrJiLyA180iSR/oB/wK5FiCnFr
	flQTmays7Pel7/UlRSt6BVkUBhhgfa6lY1aq3XmYxXSxFggQvz7RAyHxf/VwvEJ9vAWlK1O3uyh
	ZFcO9+MqFFIVTdn24Ve+2BCcBo9oc+ctiPyUa7KhK
X-Gm-Gg: AYBFou2OqNfPJ0Fjs6m1fiOpPzgCsICBvmsib8UUXyLKKGVDbOz1fXYJwSRbVMGq4QE
	9vJrx8B5pgptSsDxXK/y69n0sWuC7aVknRbwv21HY7mOQTGTdP/zLTSLpj6pxRZqPN3aBEzv0IO
	fxAxHB3JFubLew26x7dPRwAuupS5imF6MtAT7nORwHMK5iPYj4Aqm0oiTeoqK3fsbWjUQ5CvN7M
	K8CGBlKKPFkcr8r7pLtzNo8LxdilvQuwGAcGIJxIofU6vm8S6fL9yko6OMQtezF4uREx7s/rGMN
	OQw2VLceahHX16VH1O2TBlqffFgVdww7MmUtL7JXizYTZr3+Lkr95G1zOkVpM6JJBNtW9ywBCj6
	ufJ6SiXtIRI7xPLkYA5nr6ggPp9HfGtaOaTMv6/lh+Q1X/pl3jOf6VpVkP9/L5tcsLQ==
X-Received: by 2002:ad4:5747:0:b0:91b:9496:6a18 with SMTP id
 6a1803df08f44-91c7d1ae53bmr83041376d6.37.1793278361370; Thu, 29 Oct 2026
 05:52:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 05:52:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261027154649.91571-12-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-12-griffoul@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 05:52:40 -0700
X-Gm-Features: AclHuK85LBuCmtDdaaOWg4OEyIMQUVa8mDtLyPY6JdCBNPTut6N07RXjZEiRQWQ
Message-ID: <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
Subject: Re: [RFC PATCH 11/14] KVM: guest_memfd: Add kvm_gmem_restore() for
 PFN mode providers
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

Fred Griffoul <griffoul@gmail.com> writes:

> From: Fred Griffoul <fgriffo@amazon.co.uk>
>
> A device cannot fault, so when a PFN mode provider gives frames to pages
> that had none, or makes a read-only frame writable, a subsystem that
> maps the file must be told.

Totally makes sense that guest_memfd needs a way to actively map pages
into the IOMMU page tables, rather than passively like for userspace
page tables and stage 2 page tables.

When the memory is owned by guest_memfd, on a to-shared conversion,
guest_memfd would do the mapping for IOMMU, which can't handle faults
like Stage 2 or userspace page tables.

> kvm_gmem_revoke() does not fit: it would
> zap the guest's and the VMM's mappings and reclaim frames that a guest
> may already use.
>

I'd drop this paragraph from the commit message, kvm_gmem_revoke() is
the complete opposite and isn't a candidate at all for the goal, which
is to notify importers that a page is now available (and they can map it
in).

> Add kvm_gmem_restore(), the counterpart to kvm_gmem_revoke() that the
> sample provider leaves for users that cannot fault. It only updates the
> exports, under the shared invalidate lock.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
> ---
>  arch/x86/kvm/Makefile       |  1 +
>  include/linux/guest_memfd.h | 37 ++++++++++++++++++++++---------------
>  virt/kvm/guest_memfd.c      | 35 +++++++++++++++++++++++++++++++++--
>  3 files changed, 56 insertions(+), 17 deletions(-)
>
> diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
> index 25fb3d6e2032..3255280884b5 100644
> --- a/arch/x86/kvm/Makefile
> +++ b/arch/x86/kvm/Makefile
> @@ -63,6 +63,7 @@ exports_grep_trailer := --include='*.[ch]' -nrw $(srctree)/virt/kvm $(srctree)/a
>  				-e kvm_write_track_remove_gfn \
>  				-e kvm_file_to_kvm_fn \
>  				-e kvm_gmem_revoke \
> +				-e kvm_gmem_restore \

provider --1--> guest_memfd --2--> IOMMU

2 is definitely required, but why is 1 required?

Between the first .get_pfn() or .lookup_pfn_range() () and
.put_pfn_range() or kvm_gmem_revoke(), the provider should consider the
memory in-use by guest_memfd.

When it's in-use by guest_memfd, then guest_memfd should use --2--> to
map into IOMMU page tables as necessary.

When it's not in-use by guest_memfd, why would the provider force it
into guest_memfd?

If the guest VM knows that the page is now usable (some other
communication channel), it would touch the memory and do a .get_pfn(),
that would be successful this time. Perhaps that's when --2--> needs to
be performed?

>  				-e kvm_gmem_export
>
>  # Force grep to emit a goofy group separator that can in turn be replaced with
>
> [...snip...]
>
