Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B669378D82
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866008; cv=pass; b=Plei2uQ4Xokwl3kXaMWXx9JfVQbenL3SlSiFTInYIi9exlbWN7ICKLHjba+XiYIwOsWxlf/41rrdhc00m/13sFE0/nocBpLWYuPyR5GgbloMGulkCKC8MkIOar2bcQVoEUPy/NczY/cl9ZDr298bY1V69L4C8sCpYH1mBcvAczI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866008; c=relaxed/simple;
	bh=GBE1TgSby7J232lUKGK26nn+IlCCdnbJXDX5316EbVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUJtah4/Gkw6xSZ3x2U5hbN/kqPIVa526jzsx0pbvCZNvsT7oQBorgiPO0DzPnnC4rZfLWa/501ItgCQrA7k6FatTLpYwXoS3eGPu+7TEcq82jCkCPNMVHRNQqgJhgCzR3grVTDrobuNFGA8QV8DKscLwqrIU3JQEP/wcOrT2fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U75CQJbP; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U75CQJbP"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51765531803so232071cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 03:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866005; cv=none;
        d=google.com; s=arc-20260327;
        b=jTyRrzqFbKZlepi34pQsnTNraA54OBp3WHWmg6kmu+1xbBrfXHb3YpqlRnAZN3IhrZ
         PIFcHW2wO7BmUMu2AuwkyFZnmHxufBh7nkgphrMAc/2Ls4t+1FFUnaR+woP3a8jeDDDr
         Kn4ThQVJKe8xgOyZcrPhbyqXsNbKeWseOGq9/sZexJD2nm3fSDFLpVm19vQ8bRaZFgNP
         j7U6/jDY20Vv9BbPaEirw5xRWFDgokbnNqVEytKOY2Tn7BMk156jEI1EnEU2GmMPFWaK
         TiX29S0Dd3JG6137N+pEXj3rQpUDY2/lAkcjnjboIHNosizcyi4dTk9573/O/9wyepB4
         eeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tqVqdR7eGLFAsCQYmX5JI1ornwlzeYgCHzhYfEkLeRM=;
        fh=CDGPJLqJTR+viZFr6dNcuRJj7sPC5UIWLQvcCu0M9Zs=;
        b=GQg15R+ky28RYQ6TRTcSCYZG24TNj2/bgDoJM+CqQOgnkVUnPsl+R3dHeDJuQI31nR
         jRFWF/vuwgI0X1/sbA24zRrf8QC8O2HR5cIblN8msLUaYazGUoEgMmDyTbQjg4ze/smk
         3iOMTpPRf35xOpw0OOGi6FDWtuHrRmoyJRjUVeAyt/4cIC8jPhXeC7xLG1OlunzgnpPo
         ZmoiIEi4x3w5hEHqcG240O0vLrUavnxw3aJm7/AUOHQHOJIgtean7g7WzBnRe67UkB+r
         dW2jb4VQs2ciglM2s3afG3C8n9okUf4rs9TbilvJySf3ZNvPdYgHMlqzjj1f+RXau5+p
         /Cqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781866005; x=1782470805; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqVqdR7eGLFAsCQYmX5JI1ornwlzeYgCHzhYfEkLeRM=;
        b=U75CQJbPcSNy7b3rqNQlOkqM3d9AAFeN+w9Y+3TxossyxgYPBaPMs5YymOB1n4gKgk
         fEjKdJv4RFKQtPh9n/tPH5u2C4dUPWhS8cieaRDcY9tSSgEuNkb03E9A2RLCFmqcA+kg
         Q2TvuYSvO41PrHwye+FSfBAENNXa4JUMv/GVmnCcN+r2gnmI+HXnldQVnpHtCJtcWnDN
         DXRz10L6pTc5gzwRTRJQ/yUvGtzmOFdn8T/Jsnbdo70Mu/AhB1wFr0G/NPHtXJkm8bWN
         Q9dF3ArHPxIlJy2gGqv6ryeGx+XhZ82IXM3bnz7n6pJylDpY6qQuzbseg7375z7kxqr0
         mk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866005; x=1782470805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tqVqdR7eGLFAsCQYmX5JI1ornwlzeYgCHzhYfEkLeRM=;
        b=UlLvSHaVjMPS3zEtVFZqtpncOONzHOdge0xVVP6KYwWX0m8cfphgw6j3GmV7k4P8rb
         BQitY/5zukoiEf3reW9i87eDsLvvGaiTRccDq1hvQ+Sn9KD/8iDv7PPWbJfmGXXc5nUB
         I2Woy8lrlce/58DZweTzkZRMiUb0sdHzAitawXvGGEO1azGGQRQ8ElmDACdif3YOM+gx
         yIA+RGB3dlIgxS73Y0tUFEnAcTOIbi6tBwEPnCFk4zhuAa8Re0+rZoWI1CJAbKO/k327
         EivVMSxxs4+ektZNmoYMEAaJOLLlmjBg0rngXTHIuBiKLLBWW8pOTaTrr7AiZW3n15JC
         SFbw==
X-Forwarded-Encrypted: i=1; AFNElJ+aAxP9aOb8VXhB0LdUko45CnBYmt3SZk1kaNCJwogSKUK4JwHGX57nJHr6Mj9U6qOB2dHx5vgs6j4QAMUn5fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAJ64s78YX4CzBPtT0e+DTfhAUNxyNWdpgzl8rkRrBqbCzybSg
	ncwHkE7qaXaK1tyOv2IcIu/zn2qMj+uk/CxT9lszUJsJoXdyOziKz2NwF8xBp0zqNgxC/m3qfDO
	Rhrea7Q3khntRvGqB4QLdv3/kVyPBTy6vrccqAZH3
X-Gm-Gg: AfdE7ckhitucOGXDxVl9c8BIaSvpYADXA0/ogUWV+heZLD251b1CYVpKig5ksLzUdQs
	+/KMyF9Ys8Mx8g57WrJTki4Hxli+gkOiWqZYh0FdOU0/M3rfCrepGomnGvLVM3TpCHvTxqcaDse
	fiwPW7MT53X52576N4u0AZYbjgzvOOloXksOgClXBaVJj3CAHmz5Smbnd1slDOthlZb5N2pPNII
	N3TO6lujophK+fEewx2DTFHGEG6TZYFpXOTcrOXscgeeuqmljBBJjyZwiK/KOeX2mMDbNnjuw==
X-Received: by 2002:a05:622a:1b1d:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-519e877e8c5mr5598281cf.1.1781866004326; Fri, 19 Jun 2026
 03:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-19-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-19-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:46:06 +0100
X-Gm-Features: AVVi8Ccyp37Iml659Lz9n-v90nTTG1Iev3H81NTyrRm5pUpcj70uW3l4zFQ5-a4
Message-ID: <CA+EHjTxr1KrtZDakniWCF+c0E6s9_YbQ_gMVqCFnwEP3USEXXw@mail.gmail.com>
Subject: Re: [PATCH v8 19/46] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
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
> __kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
> not specially handle -1ul. -1ul is used as a huge number, which legal
> indices do not exceed, and hence the invalidation works as expected.
>
> Since a later patch is going to make use of the exact range, calculate the
> size of the guest_memfd inode and use it as the end range for invalidating
> SPTEs.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  virt/kvm/guest_memfd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index d163559da0235..d72ecbfcc3144 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -366,6 +366,7 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>
>  static int kvm_gmem_release(struct inode *inode, struct file *file)
>  {
> +       pgoff_t end = i_size_read(inode) >> PAGE_SHIFT;
>         struct gmem_file *f = file->private_data;
>         struct kvm_memory_slot *slot;
>         struct kvm *kvm = f->kvm;
> @@ -396,9 +397,9 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * Zap all SPTEs pointed at by this file.  Do not free the backing
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
> -       __kvm_gmem_invalidate_start(f, 0, -1ul,
> +       __kvm_gmem_invalidate_start(f, 0, end,
>                                     kvm_gmem_get_invalidate_filter(inode));
> -       __kvm_gmem_invalidate_end(f, 0, -1ul);
> +       __kvm_gmem_invalidate_end(f, 0, end);
>
>         list_del(&f->entry);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
