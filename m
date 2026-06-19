Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8229931E842
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856787; cv=pass; b=j9nZi3tK/iFnTWmws2Le8HW/3d4UFB+Qvdi9EDohGOhitfUCHuk6MuFpjB168JKZRpipC8WHAlGPECJg0U90J7aJ3BXYnNqgV1rbuOiVpSrM0wakSh+NcCEqDDkJYXB/Ee+3v/8nAoaPqU8zrV23mqyyAX1+Pz23ZUX1fWpi1n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856787; c=relaxed/simple;
	bh=mhRQfYgewaEHTKhgMkBt4xMNRF1jHjLdpGKjwA/SfyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwzP/9Xf+dF6wvz+VY3NsPqDInoIvhw1XBDMpKzis3Na+XrhWJVjmv5Lk/v/tBxBcp9p4C/4ALW7vNkq10BO5IP/+ifaFhDYBqlhUrNCp9NzHuStTZaaOkpBFvf8jvGZmyYALZzwhIao7PW7gtaAo+xj15zhrPEFDplSQox1L50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sahczB/r; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sahczB/r"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51765531803so194591cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 01:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856783; cv=none;
        d=google.com; s=arc-20260327;
        b=HXPItu2hsVNnj4xZhpif29OrXwvPXhC4onZ1m6vyWxSTB+9QJGBxeB+eeMJ7hhuHsI
         NtLOcAbape73d3zJVnL8W7Dm84+pFuY2pWPJcPyOM/3gLNdIwC7tLStrYojE/tFY39Bj
         WRwbmNTwhBKry8Sf8z4ffR+S+rlQjIMUBR1FIbPBdjMrEMQEvhmRZ9l26BbD6jplXEme
         idwY9g1cbPlBZaCyqxw0lQ8uMoHNhmQUgXem9Dv54H2layyT3nIsYyws66DqbwawCZej
         rutlGjnVa1jRiii/isrfH+MG6yVTNe71q4sf9O/dtEIIXMMEwM8RZxW8fvPJMlGP+cxl
         hrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        fh=sW753NbdidJMlHXD4mNeH6POLt9vn5039E88B9OxNrY=;
        b=h98is7GgNC7mRcSss65bKp0WrYLKi0ew3++q8KFRh1xtce8cro17sV1adGSdu9+G0a
         xU+WdW19s394zswM/WRAIGyaXWnc7Cuq/zVYPUAxhfczaAlJgUeChjwxVLCd6M0nT9Ip
         1tCTT0oYW3dTUV4rIlu1LyoNaQ9DUWX/1vRb6UxepcC5pJDnsLSgFd7lIVc4ol5stRru
         cFvG25LIzCdz8fn9yrHHVqZ6uVGv03Q+iL+I6Usr3MOW0W6+q2FTw/zV2ypx6hV+GcLg
         jCz/zVKv+QEgQbeLJL9eNr2QK0z+iQvkEB6h71af9lSFdqQQ7XHtyTpuZdg8tZ/FEfSk
         uxSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781856783; x=1782461583; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        b=sahczB/rRnzk+ww2AZ1aNgNxt/nON3nOo+Wi824CuV3rJoCfe4RgPy9Elx7/zM/Vjk
         +8RH3kL/rA4+Sx/MXeSPmI9gj0wNz9nj1L5WFKQLCJdqgIdfX4PmOiESOl1iOo6Q4XDw
         sFuuoHhXCjsC03i9YUzkFoPPUhLZa5KWUFkLyDkzGTnP0icEdvlSY4EYgfzaN0ZEOJo4
         eNekKNaU8BYH5zAaXomtPwhTYdNjTggsd5rkZN7GJ4ftJPbItbsPKSPghimp/FGrA2ue
         mlt4+T3aY1PSAHL381lM2lqC1/Uiv9smlERNoSUXwXae7e6bJvPRki9+2p32tA5gzIdg
         hSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856783; x=1782461583;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        b=ep7SsI6UeJUHU294ZOc0pBUQzgl8Ohq0fbF+Wj0wI9en8Q66u6+tmNbYNcEY40cGgB
         AC/OxEMrwNXYeB6myIQIbHaNQFdPMnXpNGPMmIt2y1S+xmXfDfFOaOUqbxdUVC864uVq
         2neu+T02qPgV8r1RSQe9iW6IVKVC9XyikFa3hyJqyWL6TOMLn4xGR+vy9iX5/3u91Du0
         ai6Xnw5mkuZh9oumnd6WKWSkA3AglZALohMIr1s3wXFUZgr47YUppt/ds67MtREktzvU
         z2FW0MIB57fLM03uQoCRzij2xLsk93Hna4uuJAQVGMW0W4VV2Znd5sIHVQI+A2Ck82Pj
         CiGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VhXlABCRav/tfZXxiAk9EFbqDSWS4lbihNsM33KvCx8D5P+Im++JWRPGSArpX/XCXNuCOF03v2Pj8+3R0wxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9UtPgNaYetwdL3uXKuml05o57ryFmM2WpggacpD8dp/GqK+aU
	SrPXqxpzhEyuBRmSP9Sht6kdRp28/ZhG4OALKp/MxTM3SYQarJKegGunyf99coJ2uW9o+G2bABs
	R59vFlPs27S+gwJ25w04ypzKj0safSDS2E5LJDaBv
X-Gm-Gg: AfdE7cn9sPH2WcRvYoIC13k1sfd4DXnzKpoUviHGWqoaCjaY5yyCWpIR5oF+x0Ty/RT
	wudnpwQbXbKutWugo5xb/xOFzRewNP/n6Nc9gWf70THrl5JBHffHhHobV5jFqZDP4Ap5rbLzEIN
	h0YZxptPi+E61a9s4I7lPqIVapvLHZ0uIeaGTYfOSonYPJZoV8usAwkfmZkowtAecwbkDTtpAY9
	yRuqN52kjYfjvMkL6zzC8ro24F6n+PUQ5JEDz1May6VyHiM7YeFlt2V0klYsRW+kPeHcDQixRmg
	FxKdxy+n
X-Received: by 2002:a05:622a:1906:b0:516:4f62:85ea with SMTP id
 d75a77b69052e-519e8d3111amr4387331cf.21.1781856782436; Fri, 19 Jun 2026
 01:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:12:25 +0100
X-Gm-Features: AVVi8CcN5N8mHAFYGVLMZrPjXc2jn5V9jAAbKlAQIrOrX_OPU6MaDRc17hIP_FI
Message-ID: <CA+EHjTwrfont5S84MpiwSLfk5doD_RwS96EX88e07c4-1DeMZw@mail.gmail.com>
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable
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
> Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable, only for (CoCo) VM types
> that might use vm_memory_attributes.
>
> Also document CONFIG_KVM_VM_MEMORY_ATTRIBUTES to specifically be about the
> private/shared attribute.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

You're missing a SoB, but with that fixed:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/x86/kvm/Kconfig | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 24f96396cfa1c..c28393dc664eb 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -81,13 +81,16 @@ config KVM_WERROR
>           If in doubt, say "N".
>
>  config KVM_VM_MEMORY_ATTRIBUTES
> -       bool
> +       depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> +       bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
> +       help
> +         Enable support for tracking PRIVATE vs. SHARED memory using per-VM
> +         memory attributes.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -138,7 +141,6 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
> @@ -162,7 +164,6 @@ config KVM_AMD_SEV
>         depends on KVM_AMD && X86_64
>         depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>         select ARCH_HAS_CC_PLATFORM
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_PREPARE
>         select HAVE_KVM_ARCH_GMEM_INVALIDATE
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
