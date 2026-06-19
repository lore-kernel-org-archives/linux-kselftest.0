Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF29375F9C
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866330; cv=pass; b=tLRENKhDVKg4uFL0olcVANzsBhDCrT8CXxfiLG6z03zl7E1GmtsxSA8ItBj9qpTJ9fM2LCgPjLdHGgyPzY+ApOfNqfXIXPg4o5sZOoubF/qmlbwyBNswmphhHafkB9ksxA0oGaWnDNHziQ+v6Ei2hw0PZ5ugewONym4DSiY0iHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866330; c=relaxed/simple;
	bh=FV+HhQxDLV3ClDVmAYwBBibFkDhfDGLaaVmYDJKEf4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CaV/SX4/7ak9YBOpJpg8jP1IzYBiqs1vOln2DBccYfK23Ac0ndSj/oPekefisdeLfKbJmnHiW890kz8hStiallRqJs/LQIK6soMZxS3bRTvuqAATo7Khv+gnrf6uLINrsixw/sI+R3o42DbiabryH7wpFHJtErJEfFJnSmXTswE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XxrQU6b7; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XxrQU6b7"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51765531803so233321cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 03:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866328; cv=none;
        d=google.com; s=arc-20260327;
        b=kP/96BReWqEM+gGh+F55Hv7KecbqF9t+YlmDc9NuCJVXL9g6Omak6F1/7D8pFUQW7x
         NrJ+vrXNM7Q0toTKhstUOkMdok68avXgxxwDpu1cASyetGomLuZqn98AsgBrLEtZgAQE
         9EPeCIsWhWqNLhFOlSZ3Dlf/4VQwFJfD1QqkFhep08hiTuGpMqdRbmR46dnz0tMsHr76
         c3v+AX2BXJeP1j8j9l3nVzqWIeD3qHxvgmxgNWrKszjmegwEGszryUfVmZby3Y6etrbh
         DX7lEshSIZLBCjVtDeJF5iDE0thZpqdWotWkEWXrY7+7s4Lw4TmaTHMtv7GnJ5gO1A8z
         vEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        fh=pPdHJAORqGiVnthyrM/FcewkH0h3EXR+tKfYAgjTUmQ=;
        b=JZNuOpvIKJs1eUMPHxqMCHnkCRY94FckNBI38HGbYBeo5YHRH6Nce9HSGwo1bDTfVd
         eVA0PoyX1Ac0aSAXndY2jkHsgJHXwQkyNFr07FQLvIlHCSQ5rPE5GGuqObXewVo2Q1Sk
         SZPuEXwMTF+oJkQlSeGXMxMVJB6cDft81HWclNbcXEk/FbN+Nt8mhwDTPGf9qOl8SSCs
         UbRuWefUxdujixsV2sjF3iC4/JYOUdkgawbNvIgMuB+sRzW776ZlTdlPua+9hu7uJMBS
         bDqTvJeZeEt3TpZytWdDp8817tCyrLY5nIrajFf3q6KuJZO2Fb61McUWgeOC6mKPIZ71
         a2BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781866328; x=1782471128; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        b=XxrQU6b7wwBSKKs8iV2lXnI+K1kmrUZPHm9Uusk12q3/cPL9QeXSfhDwfvnS9F1XQQ
         42BUxJ2S2rJR46489jxLV7/VywSARvYgAGKfd+D80jzxnLb8h87coJgV6L4OviiqfNq0
         2ZZIifXHxW3Z32MC2UJbYjO/Ea6NOMaK3NFhCdhDcspnFSo5KJRoRsAGivWp/UfyEUuG
         agPc4ait1pdKaqUQtt8a4rJhYLFRooIs90dHrQ2NemMT5lF+LlBUfpyWEPTIgWpn9mqt
         yJ5ArL467Trnampd6fpat2YOOAl16Kdn95it2E+DhgqXJeT1Pojj9Ro4PERav8rYyCBU
         ZAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866328; x=1782471128;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        b=Jw4mLnpuYbIa4kfn7un5RwrXOMLKLCc0RZywwB0kKIMmfGIJA4a7508zRHLTXzE5iB
         VpRNC6ETqIroc6jydsj6mdyZBi1kdPvHRkpo98hrYQow9CaZh6wARm28Pc3PEOvRVdjB
         UMLFUnUCILeP3Dg2Rkv2rZHnIml1R/8p3rc6UJmTf77N9M5vj8I4jnE7DW/IxDEJ+kkL
         QtYY6U5PqCqaheHrmfB7mFFm+QvFt0P9UU38mzeD+uvFYECJTSlen6KJhaTsE8rLLSnK
         yMfABAZ4ePJpg8xYoZYOScMBfvZdGhns3l5rd1s0tKaN3IfI7e+Tb5zPZVdZ6j+Dzr8x
         mU0g==
X-Forwarded-Encrypted: i=1; AFNElJ8vsGCpWnr7gkme+Am5kD/o6+O2KiGorigDgSVDiPevqho0fHXa/WGLjgUWcp+69TUhG9BL4WnKH24WvKTbsuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2Tkt8knXrTIdC0TLEUwiECSv3A3qSGk75o5xTpY08P8kpaFf
	iODztZ0KODTTQkZQ8eg0fXhmWrDOmlZcC7PGnZrOufXQpzqRW01asxRv20B2kwzWeNTQqFDnWqq
	QlL0PdErI6ftlMQz9Ey1M2xopaldq1wQfgsuRNmYk
X-Gm-Gg: AfdE7cn6zFC1gZPFSt0v2kNBGHA5qIpy5jbV4AHr4gHC+Qaz0Y2KWfQDePK7jlCLPOr
	6HX6cD64wFLN2Mp27a0liVH8RnbiPlk7Dp7vm+BNB9gOnmAtaiPCTxyx+bAxyhOdyNuheh3iKfI
	ok0WS+OylA/ZFk3KKAQYey215yRlY/6nayD42tIxhBCla9vXGI2TrNnYKjf5oJD52sTRT2qDbgz
	/yULryjPJs8l7oHTn6sw+csSNF6TO6+A3q2pWOrlAxW+gjviUAAXLUShGKiqTsho1/n69r2nA==
X-Received: by 2002:ac8:5e0d:0:b0:50f:be7b:923a with SMTP id
 d75a77b69052e-519e890f9bfmr5827961cf.9.1781866326641; Fri, 19 Jun 2026
 03:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:51:29 +0100
X-Gm-Features: AVVi8Cf7maLTmO8Ms_Jrooo0n7Lq-o--etDJs7TRVCXqEuhsxAt-xpYkzSdEOcg
Message-ID: <CA+EHjTxOYWNeZ=2Atxn0iGQTOskR+Y3uiujWEOOfGLGcWadoUw@mail.gmail.com>
Subject: Re: [PATCH v8 21/46] KVM: guest_memfd: Zero page while getting pfn
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Move the folio initialization logic from kvm_gmem_get_pfn() into
> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
> kvm_gmem_populate().
>
> With in-place conversion, the existing data in a guest_memfd page can be
> populated into guest memory through platform-specific ioctls.
>
> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
> might contain uninitialized host memory, which would leak to the guest if
> the populate completes.
>
> guest_memfd pages are zeroed at most once in the page's entire lifetime
> with guest_memfd, and that is tracked using the uptodate flag.
>
> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
> can get a page, write to the page and then set page uptodate without
> zeroing.
>
> This aligns with the concept of zeroing before first use - the other place
> where zeroing happens is in kvm_gmem_fault_user_mapping().
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 90bc1a26512b6..86c9f5b0863cb 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1137,6 +1137,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>                 return ERR_PTR(-EHWPOISON);
>         }
>
> +       if (!folio_test_uptodate(folio)) {
> +               clear_highpage(folio_page(folio, 0));
> +               folio_mark_uptodate(folio);
> +       }
> +
>         *pfn = folio_file_pfn(folio, index);
>         if (max_order)
>                 *max_order = 0;
> @@ -1166,11 +1171,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                 goto out;
>         }
>
> -       if (!folio_test_uptodate(folio)) {
> -               clear_highpage(folio_page(folio, 0));
> -               folio_mark_uptodate(folio);
> -       }
> -
>         if (kvm_gmem_is_private_mem(inode, index))
>                 r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
