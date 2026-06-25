Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E9B3C199B
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371072; cv=pass; b=T12Qk7bUwQtW1G8uEI4NLoxFbm3uXzHHFgwy9D1rCyzn1iFl8twi6MSYW4JWehSGgXl+LrjQkVTGxYOKOiWPMLU+Kjuilo46H/UwodfpUTeLQqaL91QcGrlNJOJNpENI5cIX0o2nmsvzWEdDJ8cwxNBchySnF689wpKAZ6KnVSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371072; c=relaxed/simple;
	bh=zdplWEMU4ZutyOkbI+3SiQhFO5MjqtwHboLbHuF46t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYXbrYzok4WeQxanCDOvqO/lukVwd2pVKtpZfZoyJXmzEj7RZU9oO77JHQwkvAzq/o//VTnTwqh3tLDlueccxALRjOU3TLCFiSKnRJOA5/U103Fj9ONV94Tx3Oue2r1vne68iW0iQ0F1+XE39te/hynv4UqjrFsjGZYXZUvAB1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q9sZA9BW; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q9sZA9BW"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51765331535so124621cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 00:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782371068; cv=none;
        d=google.com; s=arc-20260327;
        b=ZSAuGyLcDnHw+KIGSH3y4vLz1yYG/n4h1Z3MCF65dcS7oBew71s1LJ6xn85jQmWYam
         iNFluHL5yf1iPcvQZnMpR3A4zPwB5ULeZm08GnIpr98cIhN129A6fim6HYXFaJC5AnLT
         xQ6eEm7tsdwpMI0BI7UHefFitYQqWCKnYI2VXmMet3WCybYTGmSpYPc5LMZ/WkZ41uAB
         ftpBd9mSnsjsMcg4Rm9sLGdjWeVe9tqkNjEdLIFcDflYpQNOpXRbO41choH+9y3DIAE0
         3U8/WCcp9t5dxkQFaKROLuJC/i0G2w7edtwKq9pA0U6P9Jesam70UgL9SQUHwFP3Qs0o
         4SEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EviLczuyy1yyIrBaIYV/LFmo2BGtZCvU6IS38nnd4b4=;
        fh=AixqZHlYQPGoMto82EW8CWYGGZ12K0QlRAOnPKI/aac=;
        b=eKDUZF52VL8eYRUE7QZc1LY8uLM3ucgQHiRu3bLCsU0XZX4VMnCwEO4zsD8G3RX6Uq
         w+Rc/qC4Xo1tTBSgiKkUahxHaPR2cLbnYES6LQbUD4BqF22Fbwu8+O8yJdTMAQrCU8Jt
         emWXtIqvnXbxzsWekjXeoL2fMec4nN13k2Oeac0IdlicpybBswZ+kzoRMICKYrc0z//b
         0P2Zst476NV63KNwRkLweDSrh3UuzDFCm2EdWuNk3Cnm/iBc9KBZERmKvFG5HOyeuUef
         zmBxQXgbDzM+FPx+Dx8o4mAEGbqw1b3XlORiM4e+neHTbO/QZRBwGRl0zv4Z7IPHJrDT
         6iCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782371068; x=1782975868; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EviLczuyy1yyIrBaIYV/LFmo2BGtZCvU6IS38nnd4b4=;
        b=q9sZA9BWKj8e5gAjlUeJer2U2/ygGOKPecKmhNST+2LJBoxivs8AJXXFykgll7PRWs
         yihfiGuo62y6GSheBuKyR/+LUCGaz6m1TKOXQCbY7gr032+Sv8cyOeCwJ3fHtNNnrlvk
         ghglZnhiy5IOkjZmJz7E8N7AcVq2ZwXQ4BY+siJlDAICY3Lmasm7aJrzNAaCXL0jzQr+
         e0Ql3yaWSYiqPAEA2wJiHk4u8un7IrseLEVKwdisFxMHQDYRTFZ6MgW9yhltmVdKimE4
         Ja4a9271KjF0etmXnh1g2SlwlCVDG4CWteGt2IpuwKNiJL6z+ALUcRaAbLlQrVlCAYVq
         Z4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371068; x=1782975868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EviLczuyy1yyIrBaIYV/LFmo2BGtZCvU6IS38nnd4b4=;
        b=DFOlFgz/N3DMEk9/Ivy4/jWcruK3gsX0aV8xmdqDDHsFVvAmC8doLHfBcHuE35uzWA
         KNoE+xLyRF8Mks4agIVmOXCMhh6585DeCXSSFRHxVVPEjLhl81tsKxl00EDwSxS/0FQK
         9wkAHTs1pQ6SnfC+VJt82D14EpTf54W6b8m07TQTY1B/HbeL3S40uGNt5fcAmS1uevL2
         PmvnpLG/2k9laA8oodVac0uluih3SaQ0lP4MWhHW/N3vwdGB2mNWSy+2HiGCL/wDVij9
         eiMfqB1oInmPdXWtcnfoTh4Dn218vnZE79xeQFRCwT8uAtiPuRdEUob8ul/eVPM2belK
         mTFw==
X-Forwarded-Encrypted: i=1; AFNElJ/pcO0itLHNgJ5udER4fNnePiZyW3eGoffff7HuCLcTiexOcTgAPBIyKxHBLuoL21pEe8sU/uyejo99ko6lwVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Fn4SOZnuQnQIUXWwCErXMML5lGFHXOKZoM48CgP/RR7Q+FqL
	qEgcuZjde2u1ElDGoXwxwSGnh6sdzm5RFfzA3nwM5wTojwjvY8J7vXVqUdJg0O4WAoEWdHwFMt+
	5Eb1YlnhCHdg6fN0Jh+ClI6D2mPauKQue8agHJWcn
X-Gm-Gg: AfdE7cnO63r62X5wRfyF/jSBkN1iuzLJY+8MxWuxgRyZrOP9WyGarlUkPQsM47gDiaK
	HioBO+tACBdLBJEP0iXmgAJW7KWrcxPYgbJ0Z5gQ+Nr02TTApwRcYYZxIDWxT0VxRic/OdG1CPR
	EezE+gXunypt7tWKWjvBJn1IU6YsCiqTB4AxGLpY+vNdL+v1llRMb104+o3zOKQ6N/qEKmdgbgM
	vVUD8kRgvueqpVpueTqPKar29iCKW9vkWQqFwv0jU2ixPy29vsARW3bFyPT1pepl6P4D8acfQ==
X-Received: by 2002:ac8:5a88:0:b0:519:b655:235 with SMTP id
 d75a77b69052e-51a703faaaamr4395391cf.3.1782371067208; Thu, 25 Jun 2026
 00:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-36-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-36-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:03:50 +0100
X-Gm-Features: AVVi8CfPiivQ2jTF4C4b2T4SW03MiAlvIrJh5OdhMlg3bv2FAUX7zsWQXsWcZEs
Message-ID: <CA+EHjTzFUayXCh2SBe7Nwu7YEO3aUmL1Fo1hE_v8OvUw7MWO6w@mail.gmail.com>
Subject: Re: [PATCH v8 36/46] KVM: selftests: Test that truncation does not
 change shared/private status
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
> Add a test to verify that deallocating a page in a guest memfd region via
> fallocate() with FALLOC_FL_PUNCH_HOLE does not alter the shared or private
> status of the corresponding memory range.
>
> When a page backing a guest memfd mapping is deallocated, e.g., by punching
> a hole or truncating the file, and then subsequently faulted back in, the
> new page must inherit the correct shared/private status tracked by
> guest_memfd.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../selftests/kvm/x86/guest_memfd_conversions_test.c       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 0b024fb7227f0..f03af2c46426f 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -10,6 +10,7 @@
>  #include <linux/sizes.h>
>
>  #include "kvm_util.h"
> +#include "kvm_syscalls.h"
>  #include "kselftest_harness.h"
>  #include "test_util.h"
>  #include "ucall_common.h"
> @@ -309,6 +310,19 @@ GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(unallocated_folios, 8)
>                 test_convert_to_shared(t, i, 'B', 'C', 'D');
>  }
>
> +/* Truncation should not affect shared/private status. */
> +GMEM_CONVERSION_TEST_INIT_SHARED(truncate)
> +{
> +       host_do_rmw(t->mem, 0, 0, 'A');
> +       kvm_fallocate(t->gmem_fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, page_size);
> +       host_do_rmw(t->mem, 0, 0, 'A');
> +
> +       test_convert_to_private(t, 0, 'A', 'B');
> +
> +       kvm_fallocate(t->gmem_fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, page_size);
> +       test_private(t, 0, 0, 'A');
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
