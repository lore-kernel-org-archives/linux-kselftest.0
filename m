Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204312D739B
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284075; cv=pass; b=tOeQhlYaGJQ+rFf4fwYl+3Hv/JLuuAdUyiTf/DWzuVCFAVEsPCL+MgHskhDGCTLA/qpE9p2fKI2io9et6Xb4P/hsAdSFaj38vdT6n8pApt7ghG0+pvWKOkaOM53OBvPIebIQbuqdH+IfEkNKIwortHTOPB0WkI5XZbulVa+s3WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284075; c=relaxed/simple;
	bh=qQiJNamxvq/HKg+2DcbBfJZDz4xq8G4yBXbE6YWO298=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qy0LI1/9I2xZUt3y6xpyxWfN1S0zksQNm7aGw/28C4829ndILJ6HEwHuPBdnWdRb28J0mwbziKnF9LvvWH48V/YZQEOeuNzLzg7FthodhiWe0zmWSLEXKwrDgSOHJe7jnCyQvQl71+cyCFOoDMvw0UILsee7uoIFxngM3ipUKB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZBRT6gnh; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZBRT6gnh"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50e61648f10so10291cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 06:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779284072; cv=none;
        d=google.com; s=arc-20240605;
        b=YSTiAzfnV8/TJ+b79OuwInAp+aCuTtN2Dgv+nQtncSNikKJqPqMf7CxUF5mr0A7HWT
         D6NYrF3+PvV3u0pXaGxxPXjYb/slc9iuJcvlooKgribOjRb8QbGh2APelYu+OWlWcoDt
         BqZWSvt8ct7zostZprnPULDA/0oylapx3GBZRCXaqAwFpOUrNtwnojz7K4lFGRZqgV/O
         zzeFtLzfe7ztN4AVJi5sb+lBKyAOJbUlvdIYAcXXgin70ReLs9+AIiYJ/KqgCgGI42AO
         zdLn3ZFWsYT67iIMRP8kDj2Oo14jdX7la/KsEFC/ih7jcUowOuT9xGbzR0wjZDFdWXgJ
         8s1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        fh=1ex0MAJHN9BArTX8RRIAOb6p4wp64rDH+DozDjF/Z50=;
        b=Y7UVug5DGHcJxWrgfimp7kdvLkLHlAtmobYo78YNX2Tym8CXv2tMSeDvdpfRy/HPcO
         TnaSuKjfJU1cb1HgtdF0GBzd/WEzlRO0BgQY1bBJTRmdr3P/rR4sMgN5MAjouizC5BAT
         gYQAWVq95un55YnN+itEjED3frD25l2BSA09O/85WKq3L1U+qXX5Ddv6EnxNj0RN/pac
         aODsJrN9J/rfGRzgrTLwg8QkEHdiNi+ch+lfUO8rXzJ98JeSyg4th0zcckfnkTeSXlWs
         EyWbQjyLCrqkv5zSOp3YblDRU0I+LdKfqVY+1/Rm8ltNdLuNSxUZcF6BjcqXlF2C6rEU
         m9dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779284072; x=1779888872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        b=ZBRT6gnhCXkmGh5E5RtdmLG01m9cbItQ+fVl69SplNV7tKGs61gKG5ulpXLXI3m0CV
         VqWRol0J7UEu6kw0wTYeDnN+bhK5PkKcjH4IZBDJu2QnESW3xcrRHKQ2NmeBb+e1z20y
         40TGM7LDeKzAVQk0C2z1InDN9opgFG0aYQ5pizLD3zEjBmXu75tCjgpzS9Dy8ZtoRAnd
         mseFVCUD2+xzRKgDKks5GSd74VjJhvBSzB+FU0Ij3tsu9TVKxjNcRfZ9s+XTod4gwuja
         f443+uL+BI0rx4m5EKNYjDSE3d/gPxIpxLnXDYygGkZmTghLORiiVzj/Vuc5sYqrnefo
         LX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284072; x=1779888872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        b=m6i2T8llVBe9QQ9jLtXiUKtLm7xS0ZVg0YJZ4gnj8vCLzREuZmX0Ec+BrlhvgIlabK
         ooyaGs781szD8JvOwamV3UIWKpY/KD8k2JPupBAyPwrwFMDzyoXEfhSlokRWBwWc3t+P
         VSttTHvvaCfILW+A5dgyVdiMFC2TBiww0GnCx12Z4ZuLHa8dbc3c2qCOwzK2vLJsvleT
         b7wHSza7seq876x1Xob51s0l/6EISdsmkuB5SSB5m45vgjq2tBns+wzvxGbCMqdePX4T
         vYy0Jwupl1JHtNFWNbLkGEFfWBKbvpITLln7IfX70nfCUsVO3G4fr73ridoatwzJI00I
         TuPA==
X-Forwarded-Encrypted: i=1; AFNElJ+u20j2tFeG4w93CgFN/73XlzGACUBnb/MeiI15T0pRyW0fVmz545Wn5GMOpx99X83T48EoDk3BBQDdQLsM7+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7zUU2k8xAYOHWqgpK2JhChej09QAd9JbQL6+63HsO3ESOxIj
	rqMC0Rdj6lJx8yNzImzjpSsy/TGO2WuKLxKD3RRdlAwluHG0S/FATsXV5orXcuD9zAskYZNtoTG
	joTq6+Ih+xHlpvakyc8MrpyMzVWc5td/cRYT37VWn
X-Gm-Gg: Acq92OEnCh2zIU2gwKOLU8XRBDJYIvyqVt2AFYPp//zf6FCzrX3bD1UxnyYa1PhHzT5
	/oE2TGm0vcHtZEJ39eZEJD7MXUZwrkTXScgUgjxOyN4lKQK4EEfJNtnnlEWmcy4aOE6D3FN4lvG
	Ud+evIgVmhvAqD4k372A46UwPn8rQdG47Si2U/L3gYnEsenN4+nKLZ3wJ8IF4gUiSIxifLNg3SM
	QkJ/HD4t/FakTMSPrmQh9oSKPf65bd3HJAfrBdm5k6A9jOp2vCV7FmwQwOoeaoWWSAHzr2PwTEc
	9CMXo/CPdvwyxRF2Tp4=
X-Received: by 2002:a05:622a:1f18:b0:516:5709:45e5 with SMTP id
 d75a77b69052e-516794404famr42713051cf.14.1779284071144; Wed, 20 May 2026
 06:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:33:54 +0100
X-Gm-Features: AVHnY4LNSFj0RfEZst7XJ-H9igWv5oxnJFnr1A0Uux_hrTg7SmxNRLrzDdjcxpU
Message-ID: <CA+EHjTxvLU4XDPXDXYXXWJES1OFQgN8VTRLMgCCNMwBE6Hk8tQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/43] KVM: x86/mmu: Bug the VM if gmem attributes are
 queried to determine max mapping level
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When the maximum mapping level is queried, KVM's MMU lock is held, and
> while the MMU lock is held, guest_memfd cannot take the
> filemap_invalidate_lock() to look up the current shared/private state of
> the gfn, for these reasons:
>
> + The MMU lock is a spinlock or rwlock and cannot be held while taking a
>   lock that can sleep.
> + In guest_memfd's code paths (such as truncate), the
>   filemap_invalidate_lock() is held while taking the MMU lock, and taking
>   the locks in reverse order would introduce a AB-BA deadlock.
>
> Currently, the maximum mapping level is only queried from guest_memfd in
> the process of recovering huge pages, if dirty logging is disabled on a
> memslot. Dirty logging is not currently supported for guest_memfd, and
> guest_memfd memslots also cannot be updated.
>
> For now, bug the VM if guest_memfd needs to be queried to determine the
> maximum mapping level. This guard can be removed if/when support is added.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index a80a876ab4ad6..153bcc5369985 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3357,6 +3357,15 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>                 max_level = fault->max_level;
>                 is_private = fault->is_private;
>         } else {
> +               /*
> +                * Memory attributes cannot be obtained from guest_memfd while
> +                * the MMU lock is held.
> +                */
> +               if (KVM_BUG_ON(static_call_query(__kvm_get_memory_attributes) ==
> +                              kvm_gmem_get_memory_attributes, kvm)) {
> +                       return 0;
> +               }
> +

This directly takes the address of kvm_gmem_get_memory_attributes,
which is only compiled if CONFIG_KVM_GUEST_MEMFD=y. This breaks
ARCH=i386.

Cheers,
/fuad

>                 max_level = PG_LEVEL_NUM;
>                 is_private = kvm_mem_is_private(kvm, gfn);
>         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
