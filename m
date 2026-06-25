Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F883074B1
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371032; cv=pass; b=Hc9dxtd6bsJ5TiC4rvcvSco0Chx73BB2KyJ+12p9Et8R5OKUzQ/YgOyVDGSgLaXCxm2x0Emx/ajG4Ht9GIiVDzrk9b9ivZHgUgCIxYA1NPfC3+hsRW7XU93ujdBXtO6AlHD1BkIkYkBIbjK8RsicSll1zXJRxcQbM0LwSlJmRE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371032; c=relaxed/simple;
	bh=Ez7Zm7P1hEGa0blOb+96zp9ELCwRYL924NP/R/74yK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJeoz2idZ78+jRHHmwUcpmkhkMi3m0Jkq/vVAV6IJw2EqFxDbzmmQpbmEV/GDatfp/ztl0i+sE935r7fbBqIVtFz6QR6voI1pqK+xGeJGWsc+Kf/10eD+sgYVIr5VJcotOVnu0VlXCr5SyCQWFN+ThJSAN6IHj54YKAqeAF0OHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ukieVSaJ; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ukieVSaJ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5177d1ff061so135461cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 00:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782371030; cv=none;
        d=google.com; s=arc-20260327;
        b=VPqvcd1ozm0hwCPWN5I2mHlNAo7mkzxeCIYy8k9vaVoWsBth5oVGYd7kZc5gvDNieU
         IU5DybgpExsZEh5v5Sgw8kwQGtGGyiOJjpg693bcexAD1IHeSd1a6k+H+AAXQSdR3tpP
         ihxZezvGSg1TqWOAMk80kcJvQJsUGXTNVGVNxBj+RXs8U/1Pt7WLIJQfwwp6OCo1Ee45
         KHovO0SlHIWbrYS6CBq6g43A2W9NWuRFWL17mCN6+7hpTrCEInR2G66RAPcqWFGpOw0u
         A/MLQOVoaYInFmRYsT0Ql2Or6HAcbLn4AgYWnwT+t3HI1S44eSY4Jg4knd39dfJTnnBY
         9i5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        fh=IHFIJ7AMFJ0qb49D4VSG1anxL4KbItGKlN61yQLbmzc=;
        b=AkI46D/XFFUDGeSKavAoPIbyuBRheJm1EK0uw7G6PT3F8AAqcFkio4ZKfG5rIP5Z1x
         ZJ33hUZ5YWKuiQKbOK39sLgSBA9TQ5gbskYOnTr4GbiYhn3skx1Rs/RyIW0fZo1Qf4E1
         7z0ntbZy917fm/brWWb/IfXM1/ZggT6VSZwZoeprZY4XMRatjeTbtRd00hz8asakuv6L
         q8dOmpF+M9KBCslWvNOH/w1uBQZBih6Cur0TYA6DcU5xwV7VVIuH4A/wTf5H/NTaJoWP
         pYqlVlMKpkoZFy5fuKptcYHRSjZ+2WYkjd4pbtcswmRJKu86klo6xntHFNFtIYGUNuWI
         6nwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782371030; x=1782975830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        b=ukieVSaJAzEUdhev5GVx9vncSogL572gObnX1cR6Us+BKrty0xPVxxD8SyiIoqTV+C
         PwwcfiE18SD1Kc9dTmCtcZH44T7ICizZf+V2/WFdSCu0eJumYPsse/LwsEzhVcSGH0jU
         yEGLlMYOWVSo6mQvuaG2uDGZvzTFZ9J4U1hJLJxzviz5yRofEnqkzTXEbMQFYv/oCOam
         829B0+z6e/vXi+xnx3FFvGxA5VGeYcqSR7BskYQjF9ECoavaqjbAjPL7MdbWl6Iw2ohc
         7UpLyNyUhACLiIKRlANEYiBn3yQlondiNBRv5rpnn45zRiNFZyKRfiEuv9Z328m9MDUO
         j7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371030; x=1782975830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        b=nH1Wm1yg3eJfM0leSV69LZdN21zU2Gm0giSJcWBn/yiwwngGqr4xTm6pVoTiWMQSer
         6pKmOt1NSvqj2Lfa/OapolZKP0SKodhYWLj+j20+vXA0XlEpcle6SKqb5wBtso4LsWj9
         rbOVAey5R8YwrU+4R3c82oLIH3gZVVGm88Vpone1LUD/JNWQkN4snkdYtbsAHNdo6NGq
         qJEHcN0lOHCfLoapzCaI+O9Qj/37P2Zg5qIQ+/16m3XItS4uCHlIjETjrZmPo03v1gM3
         JhglxKnmaA8DBazusI0k8a3cOKjdQA2gbVFxDRyafsGIVZd3N/CqNCwJ7ewovG8z4Qe2
         tVmA==
X-Forwarded-Encrypted: i=1; AFNElJ/NiRyedZICHhai7HQQsGPWPY7F8IaMDd8HfRuGgKVZcwqwxuqp5Vm2SOfiYS+ObN/C8albKBuBD8RryIPqo/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyexVEY9YeGTqh1dibUMADVJTQ+PRHeft9sJRJSG2/RM+Ug8ErW
	UysA2BLf1Pkp9DJpuPDUb+fzVsELnlfzi49p2XQ488kcoGvNDj6ZW5SobAjQv29IjGpN/xgQsIf
	LITMSQOPy0FkarQ1GjrLU4c6BabaU2bA1XG9u7zZR
X-Gm-Gg: AfdE7ckrWkVziDKkWmhH4XKmg0R74DqgUUHUd8Rki9Yx60t0XyGNx/6FqDpm9Wo9ttr
	1trCn3uRFSObWujL3Un7gbHEXmMLL5jJqRvZpmrjwS2VswUy/1YJe19Axc2l1X6O7SyPsKReXjE
	8zGT3l6TbMLqvadJ96NP56hUYvZZgXQ0V+V9NJKTSN6/bTUWPP3yLnmuTHFIcTHP1d1A+mCVOog
	1W32oJEPB7mqN+aqQQMfCNriCEgX+LS8fVas5ORTlXpt0LS32EjMSNYmHdIjtdaKh6DOQgHlA==
X-Received: by 2002:ac8:5913:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-51a709566ddmr4167481cf.7.1782371029299; Thu, 25 Jun 2026
 00:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-35-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-35-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:03:12 +0100
X-Gm-Features: AVVi8Ccml7uePn0yWr7psf-IlIIJeOhhOzFV38YDt7BElEVA1ysUJR_9AnFc0ro
Message-ID: <CA+EHjTynteewQUd4VTobSypO=oFObYSBLZ_xyK-CGNSRNcrViQ@mail.gmail.com>
Subject: Re: [PATCH v8 35/46] KVM: selftests: Convert with allocated folios in
 different layouts
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

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Add a guest_memfd selftest to verify that memory conversions work
> correctly with allocated folios in different layouts.
>
> By iterating through which pages are initially faulted, the test covers
> various layouts of contiguous allocated and unallocated regions, exercising
> conversion with different range layouts.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../kvm/x86/guest_memfd_conversions_test.c         | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index b43ac196330f1..0b024fb7227f0 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -279,6 +279,36 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
>         test_convert_to_shared(t, 0, 0, 'A', 'B');
>  }
>
> +/*
> + * Test that when some of the folios in the conversion range are allocated,
> + * conversion requests are handled correctly in guest_memfd.  Vary the ranges
> + * allocated before conversion, using test_page, to cover various layouts of
> + * contiguous allocated and unallocated regions.
> + */
> +GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(unallocated_folios, 8)
> +{
> +       const int second_page_to_fault = 4;
> +       int i;
> +
> +       /*
> +        * Fault 2 of the pages to test filemap range operations except when
> +        * test_page == second_page_to_fault.
> +        */
> +       host_do_rmw(t->mem, test_page, 0, 'A');
> +       if (test_page != second_page_to_fault)
> +               host_do_rmw(t->mem, second_page_to_fault, 0, 'A');
> +
> +       gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
> +       for (i = 0; i < nr_pages; ++i) {
> +               char expected = (i == test_page || i == second_page_to_fault) ? 'A' : 0;
> +
> +               test_private(t, i, expected, 'B');
> +       }
> +
> +       for (i = 0; i < nr_pages; ++i)
> +               test_convert_to_shared(t, i, 'B', 'C', 'D');
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
