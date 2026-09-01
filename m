Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3C3CF200
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255907; cv=none; b=PMTJeddglaF7lZN/9fUxX1soGIknDyeh6Js1j3kfOACirIw6afeGwoK4HK8EaXjRUqKwNVPNzOWxAFe92PbXuLdcIv2YDb8ZMqn2tJljaUcT47DaNYhIJaR23coRtHcEHEVmUUzTsqM9MBC4XIGim0kFwV6nzcR9+Ie0WM4pyVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255907; c=relaxed/simple;
	bh=z57+bjmdhsIpnXeGD4vSr7O/fAZ82WFkyFGHAzMiiKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vw0ykA1SZ5DMXyDEuSXq2DlEqtl6TqP1JYRl9aZtzONeiRVSY+AVhysVG0Hre6HlhG23e8WaR1zdi6Zzxi4Mnb1ddWnT09tP+H6kPGHjsjRmtDztUNJlK6jtYp/ctB5AgGhTjHbbd+FsTpv/1YzATLUsPMrDPUCWWqIYelC2X3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AHMmma9U; arc=none smtp.client-ip=91.218.175.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AHMmma9U"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z57+bjmdhsIpnXeGD4vSr7O/fAZ82WFkyFGHAzMiiKY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788255903; v=1; x=1788860703;
 b=AHMmma9URiZ1JjmEuKOutyWwxb3jAd14nfc8EJOTWU3y9QRjL/I6trTCvW8lwXCxaUvv08Qe
 2Emp9E6bwxuS8K5H3AzmsBjwPkS4xN3VTrgrbKQwoCdnFDX96Q7UVkXsADNwI0dmvBzx71gf98c
 vgF/GBInvtd5sWhSYQpGxPfk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05d3745ab2a180d9;
	Tue, 01 Sep 2026 09:45:02 +0000
X-Mizu-Trace-ID: 05d3745ab2a180d9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a8173142so4100e87.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 02:45:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVs448g6RO+Xlm8ZG1P8Z1j7hEdbeOpeCSTM1UiK16TU5lpODm/MyOY0nMfP4YlL06mgQ6F5GcCv6lgkqSC2A=@vger.kernel.org
X-Gm-Message-State: AFuF++kfYgrYDmOsg1xz2smKl4HqugWwjuSr96Yp2eAX9qBS3gmPv2nK
	0onGytgkC4boudaaiuykyFgsxXIS2bDlzUT5KN/vj528z8xk+dxJOuattvB2GnX5gu+nYD1qsrR
	Il3Nazi850Cbrh9Ic4JBv55zaL1Ma0WCc55NXLgko
X-Received: by 2002:ac2:51cd:0:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b5ff233baemr129072e87.4.1788255900753; Tue, 01 Sep 2026
 02:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com> <20260830-gmem-inplace-conversion-v12-11-85e5fd25252a@google.com>
In-Reply-To: <20260830-gmem-inplace-conversion-v12-11-85e5fd25252a@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 1 Sep 2026 10:44:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwWJ71eHG9MKPoHFzpTF_tgptm89F8N3auD-kFhiY9ykQ@mail.gmail.com>
X-Gm-Features: AcwNN1UPfOAVycrEsYSNjlC5T6BZ8Jhw8Z-X2BEumfOk88JPkifl9vaDdwv3ap0
Message-ID: <CA+EHjTwWJ71eHG9MKPoHFzpTF_tgptm89F8N3auD-kFhiY9ykQ@mail.gmail.com>
Subject: Re: [PATCH v12 11/45] KVM: guest_memfd: Invalidate both SHARED and
 PRIVATE mappings for in-place conversions
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> When removing one or more folios from a guest_memfd instance, invalidate
> both SHARED and PRIVATE mappings if in-place conversion is enabled, because
> stating the obvious, KVM needs to ensure that all mappings to the folio(s)
> are dropped.
>
> Opportunistically rename the helper to capture that it returns a filter for
> all gfns in anticipation of zapping only the previous mapping types on
> conversion.  I.e. when doing in-place conversion to PRIVATE, only SHARED
> mappings need to be zapped (ignoring that KVM would ideally not invalidate
> ranges whose attributes aren't changing in the first place).
>
> Note, precisely zapping only the possible mapping types when in-place
> conversion is disabled is important for functional correctness, not just
> for performance.  Specifically, if KVM zaps both when SHARED vs. PRIVATE is
> tracked per-VM, then a PUNCH_HOLE operation on a PRIVATE guest_memfd will
> incorrectly zap SHARED mappings that have nothing to do with that gmem
> instance (because they're mapped via a VMA, not a gmem fd).
>
> The incorrect over-zapping of SHARED memory that doesn't belong to the gmem
> fd requesting the zapping will be resolved in a later patch, where, if
> in-place conversion is enabled, KVM will use both shared and private memory
> from the guest_memfd. If both shared and private memory are from the
> guest_memfd, invalidation will only zap memory belonging to the given gmem
> instance.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  virt/kvm/guest_memfd.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index cd966eef45b69..0afe1468d2d9d 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -139,8 +139,11 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>         return folio;
>  }
>
> -static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
> +static enum kvm_gfn_range_filter kvm_gmem_get_all_gfns_filter(struct inode *inode)
>  {
> +       if (gmem_in_place_conversion)
> +               return KVM_FILTER_SHARED | KVM_FILTER_PRIVATE;
> +
>         if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
>                 return KVM_FILTER_SHARED;
>
> @@ -191,11 +194,9 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
>  static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
>                                       pgoff_t end)
>  {
> -       enum kvm_gfn_range_filter attr_filter;
> +       enum kvm_gfn_range_filter attr_filter = kvm_gmem_get_all_gfns_filter(inode);
>         struct gmem_file *f;
>
> -       attr_filter = kvm_gmem_get_invalidate_filter(inode);
> -
>         kvm_gmem_for_each_file(f, inode)
>                 __kvm_gmem_invalidate_start(f, start, end, attr_filter);
>  }
> @@ -347,7 +348,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
>         __kvm_gmem_invalidate_start(f, 0, -1ul,
> -                                   kvm_gmem_get_invalidate_filter(inode));
> +                                   kvm_gmem_get_all_gfns_filter(inode));
>         __kvm_gmem_invalidate_end(f, 0, -1ul);
>
>         list_del(&f->entry);
>
> --
> 2.55.0.897.gb25b4bd76c-goog
>
>
