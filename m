Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975F6551992
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894107; cv=pass; b=tgupTr/ZTYaEac+h93lk/gWCeJk67k6tu52k1F0T2LU0+vB3YuDftOmPvmvCrkDkl5J/e2HZlbv3EYh4Hd/KgOdBNtuaJkOUHqTCJuNNnEUzHicsQwNWO4bLVyFRbzCY5ybtUHtDoiZf6ydDHPlLs66kAJC980sXVQDR48f2QEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894107; c=relaxed/simple;
	bh=QhYlL6j553P0EUMnVDTNvdPvx8/iDvuOHmYwBLPXEvo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/q3tCsP5LC5fjrIwr39vrjmzAokMYPN/A3ARpNY1JLhM5d6qgwsYsa7deC0sjyPFeiL7gUvXDFv7jBqlSt77i+LUIcg2NzHy34CquZfznSQRclChOGvDyphExHDQBMb+w+/6/mtCpkRzOhBkcavzwHZUb8IZCNdJRP10J6QjCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HgQIpA1L; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HgQIpA1L"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66f883abfdcso4615077d50.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 12:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894104; cv=none;
        d=google.com; s=arc-20260327;
        b=WL/FCYf6XxSiArz5Xv6xwlohfgk/Iv6AA0HgyENB+d5ojXSwKHtspX7lcb+mj9o1DF
         W8kJ4j08ZCCkf9B/doEeWAJkGgduKkbOpj4Hnogt7cOGCFfn6RN0J99P2GVRY5oGgwO1
         9P2UGlUmXgzM/7YVVNDwLYNplHIre5NiCph5kqkAsbirxF6zM87P4usKfsEwVLpaXy4l
         5RSFCD2gOpbbBA4bbX3MgL8oZpoz3H2RpFzakQqG/8D5Z4o6W6p3RlKgWJ0ZpPJEQK3w
         u5ZxFFEfJfvUrLidOsOm2QPkt77XCl3ZY8/KiVhJb0bJOJ0kR1IG9QwhDZ3D0zaSqMuI
         +YhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        fh=nGPckmMRQ+0S3LrotMhcL5HEUA9mBaf8rhceKEZYDEc=;
        b=fghXwtEDSgoujzhuExPTVUN4GWt/x5KFOL91WUL1dL2dM0e/UB9+npMaJPKdw1Lurh
         UGoooS1xkBpYmCOPFeEw9YGHxfzRX/TJeiIO92FFXHsalKf9OtXY/+RZsbbp+GiBcrfA
         vdoVtn1EdhYnDyCPQmwPCOFw+zORZ6P7kor/m8adfmCnm0w3Qo+4Ooui/prE1OdK6lXM
         WjDiN0JrAH7iTdRGFCZ+vEhVONYXM9pNTDvI97fugAVnyV7DiZevo9+3FNKqo4thbJWV
         pxv8JhgIoSnfs6WME/vWny0tjHa+ybCKwLAa2q1G12cNuWh+g8dRDg5ppcR8qoiM+s0i
         W++w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894104; x=1789498904; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        b=HgQIpA1LJzj61BW2e60/ni93YanjoXQ3hCyxY+fox8cVBPp1N+NasshIJqqZA9m8VO
         yLV3mHy5u8s3WSd5n+bRAlaXLxJ/R9NA+ROHssYAFZ9dmxmwHexjh2fVAfq3KwmrExT+
         I5EJjiReXdX/g1aNuPQZ3GBRQ7xzly6pVPloRJWpKNkI9AJXkrkQJUC87C4Pd9CaK8DD
         g6X5NMeEop7evDpymWJ3X7ULUQcCSpDsXkzmov7WY2br9c+6BJL5zR7Sd65lc9m7ZT9v
         mopBNiSQLYFzWP+tQSTxrwJIyJamJDq2LFjam+XJiW8ewFEPcjsVCYEcBVyMfuc5BueC
         LDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894104; x=1789498904;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        b=bysc8M/bS7eTKWohCTNCK/XbYfNxIjUmk0FlOTDcCnylL5v/mabqVtqe6kP0sjgbFb
         4DpLWB/C7OKPyZjfAWeSS0hQBqPxas4ubDnOV1sh8YXOAf3ZFtUS4eW5vVrP9vrqX6MQ
         UvLtRTJKtIOcbiPu8iblpCmHtfQo/GgO93SmfUx6JNKYc7dZmm23rlHY3QZUsJn7mfqW
         JKxTR7HCaZNx9kFldFwbDz0/0Q3r05woDXzMbvKlKL4DxlR+4IIhSMEZBAocwTMmmcBx
         Ia8ythYwu9mMKdveRcYxXEH++RLX+MU5FTdsZbpOVQCmp1EBgPx13+SECwg0GJOqonjT
         D+qg==
X-Forwarded-Encrypted: i=1; AKwUvBxr86Ni8C/K+xbhPVzHXC72sI7imXNXJyZ+38eHnSxA0li3ApQ5RiBHWgG7jcwo2BrZpjnNRWk9TSUssxICQPo=@vger.kernel.org
X-Gm-Message-State: AFuF++nPXXbXUKbd5crDImvtNJKQfu188ldyYKdbu9k+L8CCa+mM8smA
	n8x+gHcxVTWPtYSJyTstpPHUcw8xqs5LdiaZX3ZnifGxWzMv6atbNeOyflRgJrmowFWIpt2dOvO
	HVUjUIujvjiaW+bx2DG1R5OV0IOCqWX6Au6b/xDCR
X-Gm-Gg: AYBFou31b6zYslFjWDR4wesBDbGiy3U+x+ZbI8eIDDWoAYPG8Jz0qMiUiGckopHsSfZ
	GNp7hFxn5Q7bawAnIll0D6rpw9A/UnBTaAQqaqlzPop4DSDggY+TJYij7aLeCd2kHLbC7fdqD0+
	qFuQ6fC14nhAmYxSxdLF29OoWUCVVHIb+J2bqoJct5MirWijOVC45gaOpnihhLSUXaq10L/9lDF
	AFSR2oK+PGMan0DXBAfwbf7OvDRGYNElhpFcMxuOxJZ4IjoyDAiEZo3DfMnJBBkGGmOjU/LrnOw
	IrComf9iHiVHSsd92CwxRIs2W12uO82LoeCURLxVhO1Yyw5UPe7lcfZu/CIxfaS0X93zD0HrIuy
	iH/QrzhwX0fTW+5oi3lD6cJJF7XN18ZI=
X-Received: by 2002:a53:ac99:0:b0:66e:3e9a:9e30 with SMTP id
 956f58d0204a3-66fb5a0f620mr9359683d50.24.1788894103467; Tue, 08 Sep 2026
 12:01:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:01:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:01:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:01:42 -0700
X-Gm-Features: AcwNN1WPZ2uU8GfQmCXhnm2Xzg5FSQlgtEqA3NyC-GefYugQL38hpysVtSVZrlQ
Message-ID: <CAEvNRgGifoMQNRFMzmuGpChUD3YE6iUZbfsHAxaFEeTGfNfeEg@mail.gmail.com>
Subject: Re: [PATCH v14 06/22] tools: include: Add kbuild.h for assembly
 structure offsets
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
> Add the Kbuild macros needed to enable the filechk_offsets mechanism to
> generate C header files containing structure member offset information.
>
> Tools depending on assembly code that operate on structures have to
> hardcode the offsets of structure members. The Kbuild infrastructure
> can instead generate C header files with these offsets automatically,
> allowing them to be included in assembly code as symbolic constants.
>
> For example, the TDX guest boot code requires access to parameters
> passed in the C structure (struct td_boot_parameters). This header
> provides the macros needed to extract these offsets from C code and
> expose them to assembly, ensuring the two remain synchronized.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> ---
>  tools/include/linux/kbuild.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
> new file mode 100644
> index 000000000000..957fd55cd159
> --- /dev/null
> +++ b/tools/include/linux/kbuild.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __TOOLS_LINUX_KBUILD_H
> +#define __TOOLS_LINUX_KBUILD_H
> +
> +#define DEFINE(sym, val) \
> +	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
> +
> +#define OFFSET(sym, str, mem) \
> +	DEFINE(sym, __builtin_offsetof(struct str, mem))
> +
> +#endif /* __TOOLS_LINUX_KBUILD_H */
>
> --
> 2.55.0.229.g6434b31f56-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
