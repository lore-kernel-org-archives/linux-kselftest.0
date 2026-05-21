Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35331383991
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347649; cv=pass; b=SsTEGIdIPUfpoLfcjyOOTl5djXdXpGN0Ka/DI2ozhB7nAg9j9X7cAHjsdNjcWGp6LTNKm5XCurXOQsGjKLvxKzTG/yednlTIVFS479wMQkcsreOIdsSR6dVb4yhfOtnotR5FTSMdTFZXqT3CtNsEkv6QRZ8SFpzjDn+kxiYQXis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347649; c=relaxed/simple;
	bh=FwszKxRTkU5t0/z62X07EaM8UOUdI3Szs5D9p5DC8sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCBuKTarHi5yymS7bhC9OGpBeGZ6lMBTflAIL7lRmiwifDGfYg7eJAWmG9vh/kGjFpaKxnIuZBEDHzEY/MwRqb8hAxuoAMKNPvpi2BRG5dBjlPhII1WDcz5C7lL56mmqGVEspXfrRu9wyMgsDqwZKC1rcUQmst/zutZGm1SwzcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O2cQz0Se; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2cQz0Se"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d6b393d60so5361cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 00:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779347647; cv=none;
        d=google.com; s=arc-20240605;
        b=bSACLHxQKyMkAqb1jPgrzRi80OX9XAGsaJPckrVs2qgGxi3LibYoRBId6224AvyB3S
         Hee5PawWOKJRHb40JAazRxqSiTnezfdZwZrOVlpEe77QAn3rfL0XKlBBv8lrj27nE0S8
         ktfHKD8hU5ThSBLdlTxcnqCb9a0wmAeVOgiWbxemmea0iArsi1L5B09o5XG4jIZ1qaU6
         Dl+eIkMkLM2+xFIlIWqRjLENt682O/JLS2ktyuAWFzKZqwmA78IyZnVn1D/DJzstjvMf
         nQdxX+Dmkoz5OtCYJAvQZLv+r4xAbQZ1gCe+LtMvaMI5pX7O/ArVjuiWZA6r7ZYMxz0/
         k26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        fh=ApPRL8kbcowO+CmIo7uGD8DC5Xa7nl1yf2L6Zqcl8Qw=;
        b=TO5KPUzzMPw9gT1piEEWQbuiMK0Z0uMZvPsNK9CuSD2YqsdAzWUchw+rkKjCUMptMI
         dCpAS2vbFr8GQgX20s8GA3zRiDJz4gL9BbANY9gh44HfaD7pVwjpz81zqZ7q1lNP3ybR
         t4Yn1yaw5ZtVgUR7iz/gkEEWthPMg6Yk1CfF20LFV+HNasKm08xNy6mdPmrzdwshvIfu
         kkofC/cMMptmopYYOTCZpaUeuXUEt/RAoMju9/apcCB3rmNRsLVAXXX7id40KwU6JXKu
         TeHrA4tslWOTEZwFc1rHbmN03+chRRDEgBDxxfieAleq0zpHvh7rQ359xMdKIeJSE5vy
         8d6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779347647; x=1779952447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        b=O2cQz0SeX4C/yZ+DRCyv7ydtQ1zi3t0I5DX3GMidk6poxMeGa8Pi22mmL0eHWKuhwr
         RKLSVf/0/WLZvCew3MHxcPOecpa8GuW4rG1f21OsT7kjTtGVyk2FxP7Jss12ER/u76Xg
         K2q+ob+VaZVAj6RccdffXe7/wa100flX15bP5JK9TR2aHPgYohW9XcYjXavpndw1m114
         Pn2Rvv1EzCe4DbkWJPPFVbM8Yibf8HAh7pufDo/MLOlKiezO7ib2e8zh4GeFCkE4IvgT
         cxB35ZdeZwYR2aKl7Z55pPRx9441wivzPz8rHuzYStZjnf4kEy8D5+hEIDiXvwXyiHbU
         A/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347647; x=1779952447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        b=ilFdK1zlyOiT1LOEgRWp0XVgfQ74YSNr9LnSY1Ul9gA4SHOMAHDJUT/0Zk/uxYJHAk
         HLlKbjjezSpfQuq40cZpEqGzOPcUKM94TnrExRTegcBuXa2vfK0Bs8z7UjrMn+t/qG/E
         mgLoOiK/0SNPLzTbctuvSuzKYiz6kASvQU6N7RgypQoSpGTVamfb2P8Ut+KMLrRk9q0b
         ikQsAUa9KzB5ExFXEm5J7TKbjUlLMAD4CUfWISZtW2VBEkMw+7Fyp1pKb/HXVMhzx1Oy
         +KqON8WKPL9vDgNAQIKYyRvAaHYHHSEougRzdrsR2SNxtytpeT0gft9tCjvAP/RWJT4W
         QbzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l9TxVh4RgcCosjZcw06HjfjToOtqBC333TRLJ5hKRvT+TY6l0w3PH3ILyGJjVfdbXF3ehv7dBbYK7BIlPv1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxItkw2Q8AL+pR3OzvYDe2V2YQSrMLK3NP3xSJiw+udSdPyXjKE
	U+ubvbHoccRjTbORJFDTCA1atw+9Em40tGxCTTDMitabCKybex98R/KwxhtGCyK6aaL1wb10dMT
	JivSSldlxw3Oeas8GORb1taKOjX9kqNg6bfWcu+DA
X-Gm-Gg: Acq92OEndR4RM32bz/HLr9vO9fIcGMrntn2a8RP5uKZWxNWewqcqfPRFhfJYDS8d4V8
	m08G0id48iXFzo6C6SWchwPUIbKBFrr04ytIWNn3gdGOHj8/Ss38XnNbhdjWOI+mIGhRXMcx67H
	DG1EwpYNEDP6E2OnBDvjI06cbFLDx2bq02SzkZVLFg4+wTUXOb+MFc7T5J5vLznGPTSywmjjVIj
	AixPfnNinxRorEmCkS+spY0measa2yne97MA+LpLeczsDcUnw8XEp3v4A68AW6ajBbT8PwXMP5v
	pMSXX+y6efqrO41roiW5bHukN4l90g==
X-Received: by 2002:a05:622a:9d8:20b0:516:4f62:85ea with SMTP id
 d75a77b69052e-516c553b726mr5238111cf.21.1779347645271; Thu, 21 May 2026
 00:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-15-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-15-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:13:28 +0100
X-Gm-Features: AVHnY4I5mlImmNgj6VU9Np6tF4MeIY8QXPe0q5_43DkzSppchE88oaKE6aKRKpA
Message-ID: <CA+EHjTyZx88qAjKc=W1GOTMLdDFpTjuJkAPJ3W6Snnyn3ta8tg@mail.gmail.com>
Subject: Re: [PATCH v6 15/43] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
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
> When checking if a guest_memfd folio is safe for conversion, its refcount
> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> temporarily increases its refcount. This can lead to a false positive,
> incorrectly indicating that the folio is in use and preventing the
> conversion, even if it is otherwise safe. The conversion process might not
> be on the same CPU that holds the folio in its fbatch, making a simple
> per-CPU check insufficient.
>
> To address this, drain all CPUs' lru_add fbatches if an unexpectedly high
> refcount is encountered during the safety check. This is performed at most
> once per conversion request. Draining only if the folio in question may be
> lru cached.
>
> guest_memfd folios are unevictable, so they can only reside in the lru_add
> fbatch. If the folio's refcount is still unsafe after draining, then the
> conversion is truly deemed unsafe.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Not an area I've worked with that much, but it seems right to me:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  mm/swap.c              |  2 ++
>  virt/kvm/guest_memfd.c | 18 ++++++++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/mm/swap.c b/mm/swap.c
> index 5cc44f0de9877..3134d9d3d7c30 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -37,6 +37,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
> +#include <linux/kvm_types.h>
>
>  #include "internal.h"
>
> @@ -904,6 +905,7 @@ void lru_add_drain_all(void)
>         lru_add_drain();
>  }
>  #endif /* CONFIG_SMP */
> +EXPORT_SYMBOL_FOR_KVM(lru_add_drain_all);
>
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 034b72b4947fb..050a8c092b1a3 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -8,6 +8,7 @@
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/swap.h>
>
>  #include "kvm_mm.h"
>
> @@ -596,18 +597,27 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         const int filemap_get_folios_refcount = 1;
>         pgoff_t last = start + nr_pages - 1;
>         struct folio_batch fbatch;
> +       bool lru_drained = false;
>         bool safe = true;
>         int i;
>
>         folio_batch_init(&fbatch);
>         while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
>
> -               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +               for (i = 0; i < folio_batch_count(&fbatch);) {
>                         struct folio *folio = fbatch.folios[i];
>
> -                       if (folio_ref_count(folio) !=
> -                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
> -                               safe = false;
> +                       safe = (folio_ref_count(folio) ==
> +                               folio_nr_pages(folio) +
> +                               filemap_get_folios_refcount);
> +
> +                       if (safe) {
> +                               ++i;
> +                       } else if (folio_may_be_lru_cached(folio) &&
> +                                  !lru_drained) {
> +                               lru_add_drain_all();
> +                               lru_drained = true;
> +                       } else {
>                                 *err_index = folio->index;
>                                 break;
>                         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
