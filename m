Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E52F1EE7C6
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786405302; cv=pass; b=FPIRiqu5mhY2qTn2ZB3lvo4GqmWAWHv8AF1ZW98cAzv4V5YtPwVfnQTDCPlOPJI/rWJTPV++5hf9SFB5lMRmKcVJtHi3Y2QXtYoo3CdoEsXbmZ0g7Cctek22lCahsNnpnjw4cEqMYNgzRJxbFa2SlUmEfDP9wfEFERPcDZsVl+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786405302; c=relaxed/simple;
	bh=Q7a7K8y6K91AYZoCZj24dpjtc+/Iv04y0vXjPDlyobw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEoygKe9omFpk0o1/EYHQla1JpzqY9WIV7Z0nPMdNvhRWHvKf28xS8YcIkx+cy2c/JmZfCAZ2drhGeuuD4NA5yzsuOTV7NEK2YxCVt1t89K9sB8MTs+YKAs3ilw1joxXPmGK5SXFPdeKGip8UEtuN62c6wFw58MXVeNDFaK6u4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GwbtHYTt; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GwbtHYTt"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2190879a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 16:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786405300; cv=none;
        d=google.com; s=arc-20260327;
        b=bx9FgXFNx0rE5TqKDRDxucn7wVwWHeVhZd6acTogYTeRw2b7HUKlryvUq1zF7kWd3s
         oij7878g47Qu1TJaxO/NzOpXk8Khu6p+X/wY2KSyom0c8H5VZafkj7w18Pnggjfolx0n
         +eefPw0kzYWxB9Xvq7OWlgZ7tNAxlgRviGAbmrIJ0pZk5c1Q9EkasF2w3sl4qeyHmtfA
         Q1ukacTNcwZ/UXWyTx+6oaaMnecl7EUqbSks34FWtg0i1OQ78H2HE2CmHBY5vHCvpar2
         ngsbR2Y8VGGUOgyLXUx5JxD5yhbXSI+qF+QhSdL31vPzIhbAeJzxNZCCO8cCUJjR7pPl
         nlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        fh=w0Lw6sEI41ykxvBS2uQnbY6YhGOpu1bRHnpriD2GwGs=;
        b=j6kDlbIVjJ8aYTLs4XDFXGSACrtT0lj0xG9eRzKEcQjrB6OSkgvUUpFKHQPZPl2lyx
         oy/WG+EGaq2fvSfvySq2MVKPkEPiuQZBgC8XvezvATerwOtBCurM/cyGSU9IgDXk+kao
         FNRGB9UN+r8CEBfJQLe2CH/WFK6dVr+duY9GatJ591SgWKTJWBrPKCqPR4hu9wHqc6A+
         GkGzD5OIdXUxeiokHYsTzVEapXtd9Zsvo2kQN4V/lnUVhFE+2MRaVv21Ci9r0FrLX5oF
         TiWe75G28zI5N2FMgd5Zw9+W7J3MLzyJTqVBF1ulmLB8glgzgKH1JrUXuTg2LBLK4VOF
         y8GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786405300; x=1787010100; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        b=GwbtHYTtD3k350PhxgcJ5OjVPuwV0+9Enfl1981mWXOwWTTsqXr9PiRrsNcrwsOHak
         37EMYWdRHpyZanlUZpDHNkUZBGkUWD6i3RmxnIFF1hZPG0XO6SIWJ2L9IhNIbhx+wgne
         n4F30f/lVCnMOFwMQdjNg62Q8AlBfqBn5qf5QtuhkcOB029fzpXyfM9p7P3MtJkRU8YF
         bHJpL+e5RhrCp3RQoN5ieNBWYu+L9uD1aoHSmX2cUj34hMXj5ZRACl+xNV7ZfSReB9II
         DyjVyIk1DlVAwwwdqDyR9FV3GGjKroDjMpI5i3QsR1Xz/NHKlnaEPmKTGWlGmcXqy8d9
         +k9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786405300; x=1787010100;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dp0b2gqcZ26DbJ9BVPOHI0R6Nl9LEyZ50URFATgNWEw=;
        b=nxhMKLmCr63HO4DrBsnB+ytGkQk/0nU1Xiox6ICISS70yLDK6cK+4WiRLw7X68PxVl
         ahUA6LfUiM1pN307PuCzPm2QMdlvn34pbd32C1zO21+4Vh/dMYoQRQC5yamLqay9nXtn
         cxFUBJ+TJcNcppS+JvT47aRXfHOXPg8YBUkwYZc1mD3vliDtq2QN/vN/ua/2F0liHUbl
         JPbNskHf5+u4KMnNgyhUORTgh0GosntVgrR4FXsZS8yoThYP+hYd1dDjfUd+L1M79K2b
         8YbC0WrGWbBMx6gMA8fHvdZK9CiZxybDRKjIyVuThLkLG+uO1VxAMQ7/oSj7jh8As1A/
         9K+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkTsfegDHBDfoIPYQgvSVeJkyPInpd4EWU666CmQUNJOPLxsm22ror4ubKsIg2oRbZdCWTReYtaWrGIOykKbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgaX39JPvha1PaU6vfFKNpVWP4gRAUIKy3HZFg7qGXYYnl911C
	ggs4UsgDKAtsJF+cQYpA5MAVjeQ5LntGDqLx432p9t81Pc6ATNtV7y7drDdZsq3VCXe5Ytj63bm
	Dp5l1Vg9rqXiUQl4mvmbKIxgvUTmr2ed9OEGLxvT7
X-Gm-Gg: AR+sD10xpATllANxa1TgPQ0kZOdBF3QGZOU+S+1AHOeuG2FeuvG073E/jZQzfc9yIIz
	zMXei5cfrMNP/NO7iI2c+HLiPpbhICX61H3wQteHsOJO/y9s83j3G/eYFh3y9TMcBTSHSndLaqi
	ydWOnqOs2jN2nO0q65M2Kep3OIGoP1nPrBO8SmeyCHgrpkdgF4GDo+KOSQSVs79iHJCVVhDsU3V
	q3YNc8NhyLluI/xOlmI0TDyc66JFPfCB0SUUf920sx9i7Du3wuUFSW3zf1Hkjb74LONiXSzs6pF
	cde34gLZIe1SAY7rTXdcxbHJVI7dEimkSbd6tSf+ZQJyPyYYQqUkTu2ad90UZkT/3dIjcHTh8Zt
	Nm8vG0hOHH8e27tT4UvB/xZQNOnfvn+vJ4Kg=
X-Received: by 2002:a17:90b:268f:b0:38d:c74d:29c5 with SMTP id
 98e67ed59e1d1-392cca64db7mr5320468a91.19.1786405292124; Mon, 10 Aug 2026
 16:41:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 16:41:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 16:41:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <dd9ebd52-7171-4353-8c83-9363019d55b8@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-16-2fc18ee6d3ba@google.com> <dd9ebd52-7171-4353-8c83-9363019d55b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 16:41:31 -0700
X-Gm-Features: AUfX_mw6OlaGLLkL3HyJwIpviYhrAvoZYVarJDuu-bVxocdCtMCbumdkufhLAM8
Message-ID: <CAEvNRgGSK9tO_-TvQvXoMwVwGygh5WjjBUOY-zLOA5yP2DwS1g@mail.gmail.com>
Subject: Re: [PATCH v10 16/41] KVM: guest_memfd: Zero page while getting pfn
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Move the folio initialization logic from kvm_gmem_get_pfn() into
>> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
>> kvm_gmem_populate().
>>
>> With in-place conversion, the existing data in a guest_memfd page can be
>> populated into guest memory through platform-specific ioctls.
>>
>> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
>> might contain uninitialized host memory, which would leak to the guest if
>> the populate completes.
>>
>> guest_memfd pages are zeroed at most once in the page's entire lifetime
>> with guest_memfd, and that is tracked using the uptodate flag.
>>
>> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
>> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
>> can get a page, write to the page and then set page uptodate without
>> zeroing.
>>
>> This aligns with the concept of zeroing before first use - the other place
>> where zeroing happens is in kvm_gmem_fault_user_mapping().
>>
>> Don't mark the page uptodate again after populating, since the page would
>> already be marked uptodate before the post_populate() call.
>
> The downside is that __kvm_gmem_populate() will now zero+write. I assume we
> don't care about possible performance impacts?
>

Would we rather zero in kvm_gmem_populate() only if !uptodate &&
gmem_in_place_conversion && src_addr == 0? That could work too.

Previously, without in-place conversion, populate never reads memory
from guest_memfd so there was no danger of leaking uninitialized memory.

> Worth spelling that out.
>
>>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Tested-by: Shivank Garg <shivankg@amd.com>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 030af0855f8b0..41950c8105b5d 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1079,6 +1079,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>>  		return ERR_PTR(-EHWPOISON);
>>  	}
>>
>> +	if (!folio_test_uptodate(folio)) {
>> +		clear_highpage(folio_page(folio, 0));
>> +		folio_mark_uptodate(folio);
>> +	}
>> +
>>  	*pfn = folio_file_pfn(folio, index);
>>  	if (max_order)
>>  		*max_order = 0;
>> @@ -1108,11 +1113,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  		goto out;
>>  	}
>>
>> -	if (!folio_test_uptodate(folio)) {
>> -		clear_highpage(folio_page(folio, 0));
>> -		folio_mark_uptodate(folio);
>> -	}
>> -
>>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>>  	if (kvm_gmem_is_private_mem(file_inode(file), index))
>>  		r = kvm_arch_gmem_make_private(kvm, gfn, *pfn,
>> @@ -1159,8 +1159,6 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	}
>>
>>  	ret = post_populate(kvm, gfn, pfn, src_page, opaque);
>> -	if (!ret)
>> -		folio_mark_uptodate(folio);
>
> In case post-populate failed, do we want to re-zero the pages?
>

I believe we can't re-zero the pages. When SNP fails to populate it
could be because SNP didn't like the CPUIDs userspace set up, and after
the error userspace is expected to check what SNP likes, then
retry.

IIUC zeroing will destroy the message SNP wanted to leave for userspace.

Michael should be able to explain more here :)

Btw Michael may I also get your reviews on this series?

> --
> Cheers,
>
> David
