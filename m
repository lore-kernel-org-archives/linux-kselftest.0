Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8BA5A0ADD
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894202; cv=pass; b=Yzf04nLnDfBcVzfZGeFU3wCwPLLy5/lMN30kOUmqMZpj2oGsHv7v9g6r8L1+fUXcO/N8lYqVhzVf+rXCVTpfv75fXaup//Jm5PIZ945Uo0WNqnimopPVbkR14IpGFUlHukRZMjqaqbB6RWPle3e7WwsG9ZfyzgJm8JPujYgfoBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894202; c=relaxed/simple;
	bh=SirRPd8MEjuE0M+o4ZIQ6nFLVuzs+EvDMR2q6/kdoLg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWos8qsep/u0M8UbpHIhqKGO7I+NAEmcsyNi8JKVbTf0x0QIffnnC5pIrrgJgqyojw8ANlU0YvhX1hORFev+Xa9D5PqP9KlzFdnudRCQIsiD3MUScrbnbZl7M0hdMAsenR4hBUC1sh1OANb+mux1D57IRAWiwypIOFSbgnM+w0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CBVK+XcI; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBVK+XcI"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90e7bde5596so62824846d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 12:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894200; cv=none;
        d=google.com; s=arc-20260327;
        b=G45ql4AHLRTl9HB4NSu2Wxt2lfiNR1XC/vpMPfEgUvsgnba8MH12mWoesR12Rpz6xr
         51DSmRoeumHisGBK8f+pW7Xej6fVXBcxBmwNPgvp+ad+OGzgulWxdnnvqH8LkYwE5tIb
         ThnOCbcZIi0nyXh5m5DzR7Q2t48ERdQLP+WBsX6bXE2zVLB22NKLUGcaVDD2p5EVgwxE
         gQSqnK8tCfX27GJ6MBEnODYlqihBVLfxaRXW7z8+Jl/v7p3S5k00EPo5EIuYkhLNUIK3
         yIi7Pl/I5i5nuWVsbAY4F1ExrnCCwYjJFA/QvjAt5Dug40PXEcqf5rOPaN/BAl+U0vrT
         uuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        fh=0voY0JrMzB2r2XoPLuihi2fMbXdh7g+lAkoFuvv4Otc=;
        b=PMdUCqfdMorlr8M4fznngvDCZuzBee9l5HelQd6OFIIBtpmQaclMpj2wZALQ63pUwQ
         Mq3ybLJOPklIzIUOaM90c5mY2N9r0+3hSqyt1+UIss3HrNcB/K/ISL/DonR6t1LEZP6u
         JbAQYCNvZBeMargIfkfSIQ6AKyRbzAj5x2hZqw0yQuzHDi5lgVZhsJJ+4RUHwTSedewD
         n/bRX+I+BWpbx7W/gPFhOq8zVkDAhB+u6XghfWaKQPNjtxWCwfmYogflbOTrWwcq1JhJ
         XAKn7BUkoseHGKS86IrRRcn7hCAq9Sf0HPM+XT9rQCgJbaYB5bopBnBtFNmbgsR7IETe
         0fzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894200; x=1789499000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        b=CBVK+XcIap/64eG0GVnc0c8DwXLC7/QpA0q066jg4t1Dm/Nn+cIph5WGt3IqQEWTDF
         L/xAPFV83elhby1bm0Tso/Hraii+omYqfrcyIykj4Gq8sNFTh5mBNvcpuybf3Pite+Dm
         W9oeqRJ/8IBv27/dN4o0IOyKh52eY5vC0GeCUvQPaTneYgdaALWH3dGqVvwxsHrugEAi
         LtMVxcmNH3Qt1t91s9cMYIn0IPTmoEke2Ii3YaagMnHFbkB/oavZkCNizCZaIYGygVhl
         sh1xPrkSSGkLNxaqSUCjJhHtRNH4JaGBfLmzQ5NmYLr/UiVqyC6O6sqPGdfFI+ccWmEY
         NPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894200; x=1789499000;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        b=UZS3Qr3A+vjBhgXlhWJykeeaso0wxfY2hdlc+VzmQyTXVCyeiCOdxLAJJg8+8i5O5x
         g/CSw5SuA37IcJ7n4bkPWHBVP9pu2E2dXV5l1oVFwa2CzvTfHHIdOhGKpntboF4PwGBW
         AzRNbESzPlH2e35TJcqgPaL9Z9eYaWqk/daeX7ShDpKg0hhtnUNIVOwGP66Zghij23Dc
         6z5wtXVeff1zLQvO6BhCo1i+73P9IANhohE2kpvY8IJwfMylA4CnQfQrHJ2L3pTamFmb
         EYYuaVJbOMHR008tN0dbNYyNLSuYHrs7fgsav9d7I3E32WQcazCeCg+6PIfkXgKLeduI
         U0Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwP8qC1HbeInoAMzC4GR1xbJayJ5dL7RGTOzNs2kdsSakbtia0c6MJb3mctNFLyTW4LCNs/RFnuOk+QD6yRNU8=@vger.kernel.org
X-Gm-Message-State: AFuF++mEVS81lBYgWMpq8z9rXm6+LgugkevnCoCSDIexV++RIVze8Oix
	H2FM1G4ulBxsjPuyuLnNEzenVC8wC3ldycrxdo36DgoRQJ0x3aRnfZg8dSjzTBKAE8M/BabPjMm
	VdRMUaw3dbCCpS2mny47BevHd9qrid3OjUwTUN1fK
X-Gm-Gg: AYBFou0F9MnaIF8ta2GdssmsZ0zqEUEL6Z0wqSAnR4ZfdNHMZUgEHEYTCgfEXrWD6Yz
	dGBHAZO6oEO2dzwLXEfllNdGv16Zwze/3oPabW8FEWNi6dGrKDGghIVTmpLhcDAXc7Cqhg/aoVs
	eknIDxhT7oNnQdK0nlfxgMJrWOxs2PdPyb3ZjScxRFOlm4wZLOAAJciXz1sc3lFidr5JuAOVwtM
	FIq7g0t1WID4DUmJoJbhHji46fbwMmmcPQGOooGXY9IFC7BqpK5Vd/Huza1FlW/Z6r42d2JgXG2
	3oQbhBK+Cb2+EfXRF/FcDIBovTtInKB+CniggjbYgZY7UW1kT/LE/+GQCIerOKZdSnSvYUOE61+
	PCqVvMf38DWgz5eIZqzo4gHoTNtwhbtE=
X-Received: by 2002:a05:6214:4287:b0:90e:7bee:9a6c with SMTP id
 6a1803df08f44-9103ef88de7mr407562466d6.19.1788894194840; Tue, 08 Sep 2026
 12:03:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:03:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:03:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-5-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-5-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:03:13 -0700
X-Gm-Features: AcwNN1V9Kl5cU_xU1Qz969rvQ0JujFNCbBSW6jqcW2Xx-zikXZHSBnXLwAN1H4g
Message-ID: <CAEvNRgFiMWb_n4nL8E2HBfkQ247GEhGQ3us_cfoQG4-JBiD2aA@mail.gmail.com>
Subject: Re: [PATCH v14 05/22] KVM: selftests: Expose segment definitions to
 assembly files
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Move kernel segment definitions to a separate file which can be included
> from assembly files.
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
>  tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
> new file mode 100644
> index 000000000000..713b6bc0aeb7
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Used for storing defines used by both c and assembly code.
> + */
> +#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
> +#define SELFTEST_KVM_PROCESSOR_ASM_H
> +
> +#define KERNEL_CS	0x8
> +#define KERNEL_DS	0x10
> +#define KERNEL_TSS	0x18
> +
> +#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 7d23344854cc..97acc5aaf7b7 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -8,6 +8,7 @@
>  #include "kvm_util.h"
>  #include "pmu.h"
>  #include "processor.h"
> +#include "processor_asm.h"
>  #include "smm.h"
>  #include "svm_util.h"
>  #include "sev.h"
> @@ -18,10 +19,6 @@
>  #define NUM_INTERRUPTS 256
>  #endif
>
> -#define KERNEL_CS	0x8
> -#define KERNEL_DS	0x10
> -#define KERNEL_TSS	0x18
> -
>  gva_t exception_handlers;
>  bool host_cpu_is_amd;
>  bool host_cpu_is_intel;
>
> --
> 2.55.0.229.g6434b31f56-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
