Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712A3749E2
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374756; cv=pass; b=oSGtiOIKDYD8s8GBTBYXZdpx/E0Utkp1HYoovuKZcnW5irIG/9jvwSmQUCAwscgp4JEXVDREw+vlMcLGuEfxxw/tYRAakdMf/eCHpKepd013kLm+0OpdzvoD9nX22Dqih5U/OxZUA+BTH915mX049joI1H0dKSnbKL3DtG2UwPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374756; c=relaxed/simple;
	bh=gUH5CYeDQBwLfZeJDBALuowu5eygG91h78hLIiPuwTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUou6h6hUVGabJOPjYaov/iGD+wvqgSxmmppf3fJHREzTTVi+OSy1kLB8CvP1o4yfuk5pAy/YeFzK//n6wYvVRhBwhPe2zSF6XsW91DQo7fF4P0m+YCtcDvNbRGQEQTCn4yPQ0slP5UKPnO9+InlJ3XxfAfTyWQ5MIrduAM0pIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YFbONY8w; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YFbONY8w"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-519ed52bcc6so198031cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 01:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782374753; cv=none;
        d=google.com; s=arc-20260327;
        b=OpRtpD1AiYohzxi9mZ9Ipe6vVHZT4oDzuOdnS6NxS9cifH4kvFDZt9AVCoIsWQtZ2p
         hwhsLmAvgl3dQZwTP1RFNs1q1frLdI8FjXxRgHCxl78/NWBhA33SgAMPLvdhwdsrjd3W
         jgO0D38HabfSpbOj06LpZ10/1CmHMg0OFg6MYiYQYfSxp2OlLMn1MoSx2kVbB45jfqFF
         cKK+B85wztMIrKL4Y1Zc5hd/jVX+A2KXTAube2okua+54PTymiJOB660W8GZU+2Ggue9
         Bq/jylBbx56dFdB3p/ifMp/W6YdHRUawtzJvb7XgCLZHEMBSY3ieubMibOh0U0F80ibB
         v83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9LjtIzZk3vxrXZVAwqdL1YMS08SLuDbLYjQh10VCn/I=;
        fh=vd8ZM60z4K6aGGzrZAV7WqAndbz+4053/PfQ54XUqtA=;
        b=HrGab4hLg2A7XbKYT1yWJShx0CAIaoo/ULUB1R+q/C5PTIvYZer7bI7Yp74IfJvHzI
         68rxPn3PMosvnyN+5FDrSToLWFN9fwkkyx4HsR5TiTdmfVpPzXSbct6e2/tgz9kSvuyb
         9YNH1gOqkpyf97bq+NO8y3NbxjV75vUOZc3q0rEirij0BWzH81rlb8rVvC8W25lAvJHV
         RLZt3BohFNrRLTh+Q8YecplFU09kFz8DeY2+Df2593FLCDm6eVZq11rsEA0bPsTJm+c3
         FoOOL5Sbr09Hn9TBFfaKHx0ZQTWqXfhErkD3u/g+goJn/czQT+GJR1ltTP9NyakUKCGP
         y7OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782374753; x=1782979553; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LjtIzZk3vxrXZVAwqdL1YMS08SLuDbLYjQh10VCn/I=;
        b=YFbONY8woyRitxOoL3EOCijfwZmjVqxkXb3tlHefMKLJHWvlWwefwjsAkTp7x/HB3h
         +nM1BkP1tcuZ5cFWSybI4kh4vQDezciG4UgXYpqDxDft0FznJY7bwusIvni7jB0/PaZa
         r30LNzjVwejPNokpTMm4iRLvJittgnmhgX/+Z1kxiCGWCAPeDfZ034qyYBZJ8JSic4QQ
         ZvwyUeTdhQzc0Yzo6z3jFmr+82Jm5wrxkwiSd8Ao30OxgX4s5BFQry8fem7J0DnxhGeU
         WBS6IlacsOxKFAWrg7Yx07O1XU7wcSJV5D0LGAS6yT5qhnGx4iw36hcmx5zut+E5gy4B
         1x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374753; x=1782979553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9LjtIzZk3vxrXZVAwqdL1YMS08SLuDbLYjQh10VCn/I=;
        b=axuM6bQ7jiP+AGNVfd3PxWGW/VY4TX9hhZw7W5XGWMdxrRo9EIJivPqWghL0JzVG4r
         bJuaUSvSxjrRRSjOCo0EpYZS4KRNoJANJGqNfbHSIMGXIssrQ/U+20+6ixkOqhWAusim
         Vh3gkKXt3vvelRrMQqxZsMvjuRJtIwwp81ImKirKT2VK+lsnCRe4K6LmQLHqlyicYa8a
         Qwo/ZH9cWWivrXWeomBPc8QE3l/NlEwug/jZCMwSAldtbSOmZ2UQaCwOoeUglxVir1eU
         DlTbTrFUFYelR6qZAd5iiFTWYsxTegfvXjyhaRFFKvlHdWNa0bFYoJvDf4zvd2sO56BJ
         akWw==
X-Forwarded-Encrypted: i=1; AFNElJ//bbtqcj1EZS+CKEyWQQhgru1Y5LzB0Y1Oxixi5bKScKj0cwdkyUjLTgkswpjSvdjXTLHnGWBZUmPdExKfpPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hOtr/RhnRkYHbMmLFOOmKUKuP4h5Ls3ByvOmuA2R9lEzZMzH
	F4kSASUcnlIwbLiUAsiSVoYOosa8XQdK0wjLqb/qls9B1IEeQ9j9lAQ0zKIb9qE3KvarMnC1ENn
	Z9OdK4gD4+nKz0lO/LrbGdKm3udhSVnW1e/OcG4yj
X-Gm-Gg: AfdE7clX27aEbs0gq+5GG9dv/xq7dhcC0RqpppQtS7EHlZFQEHs0+06zxM0C+LhHfKL
	/noPDWkUF1bIIh7TUOFKp1JKiOp7rUFK8GuoN1PTTqHH5iP3AzXl4V3CR4swWi4Y+AZN9OlVBRv
	faW2k/Zlh+X8ZACxlX7MRLp0/7Vmc8J0cqEuzHrUCovY7hQS1iDxmfYqGjp9QH+RUnyuqjP73EX
	G2g0JmcXOMzKCMRd0mLG06RCAEPZxMa8ItjxlFFpWD4MnQaAtiOE+j7u1KwvMATfuIDPl5NoA==
X-Received: by 2002:a05:622a:4d99:b0:516:4f62:85ec with SMTP id
 d75a77b69052e-51a7097cdf7mr5787961cf.17.1782374752598; Thu, 25 Jun 2026
 01:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-39-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-39-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 09:04:00 +0100
X-Gm-Features: AVVi8CcBY4t5giF0-A9bP1HPllgz1zAJhj3Ny1-iABTQtlbD2BJIIQOiCS34wl4
Message-ID: <CA+EHjTxtL+usjD5XWzrEXegSAt-JD_SjH9MG1S6aOy8sWYf67g@mail.gmail.com>
Subject: Re: [PATCH v8 39/46] KVM: selftests: Test conversion with elevated
 page refcount
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
> Add a selftest to verify that converting a shared guest_memfd page to a
> private page fails if the page has an elevated reference count.
>
> When KVM converts a shared page to a private one, it expects the page to
> have a reference count equal to the reference counts taken by the
> filemap. If another kernel subsystem holds a reference to the page, the
> conversion must be aborted.
>
> The test asserts that both bulk and single-page conversion attempts
> correctly fail with EAGAIN for the pinned page. After the page is unpinned,
> the test verifies that subsequent conversions succeed.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Not sure Sashiko's concern is worth it.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../kvm/x86/guest_memfd_conversions_test.c         | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 99b0023609670..4ebbd29029526 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -441,6 +441,62 @@ GMEM_CONVERSION_TEST_INIT_SHARED(forked_accesses)
>  #undef TEST_STATE_AWAIT
>  }
>
> +static void test_convert_to_private_fails(test_data_t *t, u64 pgoff,
> +                                         size_t nr_pages,
> +                                         u64 expected_error_offset)
> +{
> +       /* +1 to make it anything but expected_error_offset. */
> +       u64 error_offset = expected_error_offset + 1;
> +       u64 offset = pgoff * page_size;
> +       int ret;
> +
> +       do {
> +               ret = __gmem_set_private(t->gmem_fd, offset,
> +                                        nr_pages * page_size, &error_offset);
> +       } while (ret == -1 && errno == EINTR);
> +       TEST_ASSERT(ret == -1 && errno == EAGAIN,
> +                   "Wanted EAGAIN on page %lu, got %d (ret = %d)", pgoff,
> +                   errno, ret);
> +       TEST_ASSERT_EQ(error_offset, expected_error_offset);
> +}
> +
> +GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(elevated_refcount, 4)
> +{
> +       int i;
> +
> +       pin_pages(t->mem + test_page * page_size, page_size);
> +
> +       for (i = 0; i < nr_pages; i++)
> +               test_shared(t, i, 0, 'A', 'B');
> +
> +       /*
> +        * Converting in bulk should fail as long any page in the range has
> +        * unexpected refcounts.
> +        */
> +       test_convert_to_private_fails(t, 0, nr_pages, test_page * page_size);
> +
> +       for (i = 0; i < nr_pages; i++) {
> +               /*
> +                * Converting page-wise should also fail as long any page in the
> +                * range has unexpected refcounts.
> +                */
> +               if (i == test_page)
> +                       test_convert_to_private_fails(t, i, 1, test_page * page_size);
> +               else
> +                       test_convert_to_private(t, i, 'B', 'C');
> +       }
> +
> +       unpin_pages();
> +
> +       gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
> +
> +       for (i = 0; i < nr_pages; i++) {
> +               char expected = i == test_page ? 'B' : 'C';
> +
> +               test_private(t, i, expected, 'D');
> +       }
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
