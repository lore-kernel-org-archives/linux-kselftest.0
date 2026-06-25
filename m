Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73CC3C10A2
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370720; cv=pass; b=AhQM16Bc9VncXRY5MRUrS12tgq+nJee6Ve1e0VSPYlL1q0XmWwIhKFKoo9sqTqnJ4Yylb/tEhWlM39UoXVHURUgqlICKZb1UawAebONoex4vPdokbJsw2pKKvqgPjxdDnvJBHCu8roqn4oImW6wgegC3TueMN8YohnP7zH2Xr8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370720; c=relaxed/simple;
	bh=SyGSbXNz8q/qDroqw0sxRk5+NR5xp21V4hgaN/9L/0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMmRQiaWkwHdZIttnReHBLqGu69OxUx75B5jgmg5j5sgdadtE0ylMNctSsI6xwJvx8f21tZ4DqAMQJcVUtpJkM0blSiZZycQye4UCEWRHXXdAIf+LIIk1st9haQ+EHXvPjpX7W/kCx1gQLOVbe4LfLCHNjwPUAVJ3p2tQviWQQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tGupKp70; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tGupKp70"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765331535so122581cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 23:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782370718; cv=none;
        d=google.com; s=arc-20260327;
        b=pDX0kI1DbYIbMhCwl89daZpc00+v/CsoFqGH1OfY0Tbgc6naQKVWdHAinGF2PbwJmB
         knmooXqURFOmGOUrHar0aQNu+0TUp/rc3VowklTna1/pDazAZ5NxTXDLztPY/Jnlf/Rg
         kaL9a9Ve8/yo/ml1asYsvMjEeSCCVK5Pex30oCeakGznTxh9XHZoNt8fRm9aU4kc6zJ+
         0qGALK8CGI2J6Ia08RQl99UY4I9ZcOQNIY0rr7AYqX3ZQNBUl8ubEyAVzTpLRp9428kP
         yLl6loOhqt04+2Q9R55OwwQX+Ii2nDerCernyk57S9p/t0a3r6UTqex4VIkGyTDfyqGz
         sOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KdGqwRZEoBZlGth5crGGDiriD2nf5vVEe54PRH1YZ7s=;
        fh=ZXARCmZxtGcPWOJB551xVnu3Czl3/zhhm+LikQoZPOM=;
        b=IeZc2a9QRjm172cSc5EV9S8tXjuO9bofb8L/K293CS6x6Us4IWV6YD1yEcoRwyOA7U
         8kWQ1KrgnDxoSZvyJBjg5g6BTNik/Tuz0s57cjuaCpr8LXPfGGTfHtl8wvrkDcy5X4sX
         7oQjUb2Duu37OgAFC/hrp8oCtH95HKbMmHSow7kJA587iXLMZd/5heXeiFKHOe+tI6+v
         rjGsoFU9oBQFsdU2cbePrcBtWAzw2t7ugl7Z85m/UjPS0xFMcf+/XBV+rANpDBn27Xu2
         anLY5gdq8dJuV4aI6OgGNBswx9+1xQ7s3puU/MSTL2MgmhNlAdkIvZes83ZesI/zhlxa
         wumg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782370718; x=1782975518; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdGqwRZEoBZlGth5crGGDiriD2nf5vVEe54PRH1YZ7s=;
        b=tGupKp70o6smKJB8ePSOk+DwlwWcKNkV93oqRQ/I7T8w4llXQ8DAjcl+v1KxTs6GEc
         HleWAcUwm7Zz3qU7x/6LvN62bo2nfqUMm32TbZJPVxdg1Ylsy9e/f7YJX0/SQ0N0frEb
         ZMSajdlg3t7RHxislDw22vxIk9zH1iZqdT6HBWFZX3+yTArPMREusZu8MukaMwPlgdiN
         nDmw7b7Nzm8AsOjrJ0SDU2ZSKy0Mz/TiRPvbEOG1m4VLeVnxmM/n35xvmil5lUXHjRZ8
         q7Su8DZjXg7vPYSucskLr3bfG2lV1HrS3tBRS1xGr6P6jseZXvaB+9n1WUJzyAVywNOe
         BQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782370718; x=1782975518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KdGqwRZEoBZlGth5crGGDiriD2nf5vVEe54PRH1YZ7s=;
        b=qNapKwz93zo4/NEvvi0m8Fx0Wlh2DqnNR0Ed0KlRVVMifpaTuFA32rK/iQebZVE4CV
         PKRsmxv0m0K1WBsuMgIO7NZFxlN2lzBF8q9lyHLFqdxQrLp0DGad6xnALrfyxAnp+NY/
         HPRg3l6UUpKPIHqy/g3YAWg87TYN3rBecORjuA8FwIPp5AE6gP+5DZNy9mWsq9bPvQtp
         4mFFOF+TUYEyIdvcnhKhe2jpWdxLIl39NxIK/J2k19rJi6IO2sGV61jHG6cqmEEaUypq
         suuxw5KCUIyZ9kUGvVj/seH5lKdT52Nf6Z6rg0fBLk+7OG41PiJkOHiL4+Bd/ICzSfOC
         PMkg==
X-Forwarded-Encrypted: i=1; AFNElJ/YsQLy77/MAFRJCCvBYA76KoMJv+Ty1XUn3eXHW/DClkenA9gMM3uIZsstt+wYlVz+ykGCnZDZqcOPKRTatbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyeAITLCShaZrLDgwg/XFqpU41j76u/ongOGHpnhs3xRocSa2A
	F+FS5kgBwt8ZXhNuJ7ZZkMaI/UB33UjcOCU+3v/fLRER9aesNju+ZNkO/gz2OhpUvCH7ImscN6N
	0zcAoGsGafZvtE5WJ/GDJqc5hmQIPvApCzVLbfW6z
X-Gm-Gg: AfdE7clfC8SAWe8eQwvGRrXbjSd3o3v4/DdMTu/KuNtwUX4E7fWXetOlKn+ogYJcmQF
	Qn4okelDJUVDFs/ZcrSBfJcZYwNpJfJ36BVEotq1/TTJyTSKxP54XniSSDHJWdf9O+i0kDqD6Og
	xd8BD9mrwL1fZm1A2mMtBkFLwkmvS+rF5SpXPtRPp++rB9Ie4x2G2fdw0i9SMEp0aWhZpX95ZSG
	RrmzuJqShIf/ZKOBcjzRF6DBUxP/TQ1jYZPw5WTzRy3fCSqT6P5f2KGe51Fygk3V6v6aKRHsw==
X-Received: by 2002:a05:622a:586:b0:519:f8a0:16b4 with SMTP id
 d75a77b69052e-51a6eafc644mr6248791cf.14.1782370716783; Wed, 24 Jun 2026
 23:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-33-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-33-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 07:57:59 +0100
X-Gm-Features: AVVi8CdlUqqm7utRrODu0hzmedC063K0MES5T7_EuttwZUvfcmHiCBLx6crELI8
Message-ID: <CA+EHjTw=-yzY+SLvLFwJx+73OeYcBmT3YHYQmuf9=fx_KoebmQ@mail.gmail.com>
Subject: Re: [PATCH v8 33/46] KVM: selftests: Test conversion precision in guest_memfd
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
> The existing guest_memfd conversion tests only use single-page memory
> regions. This provides no coverage for multi-page guest_memfd objects,
> specifically whether KVM correctly handles the page index for conversion
> operations. An incorrect implementation could, for example, always operate
> on the first page regardless of the index provided.
>
> Add a new test case to verify that conversions between private and shared
> memory correctly target the specified page within a multi-page guest_memfd.
>
> This test also verifies the precision of memory conversions by converting a
> single page an then iterating through all other pages ensure they remain in
> their original state.
>
> To support this test, add a new GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED
> macro that handles setting up and tearing down the VM for each page
> iteration. The teardown logic is adjusted to prevent a double-free in this
> new scenario.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  .../kvm/x86/guest_memfd_conversions_test.c         | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 5b070d3374eae..8e17d5c08aeb8 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -61,8 +61,13 @@ static void gmem_conversions_do_setup(test_data_t *t, int nr_pages,
>
>  static void gmem_conversions_do_teardown(test_data_t *t)
>  {
> +       /* Use NULL to avoid second free in FIXTURE_TEARDOWN (multipage tests). */
> +       if (!t->vcpu)
> +               return;
> +
>         /* No need to close gmem_fd, it's owned by the VM structure. */
>         kvm_vm_free(t->vcpu->vm);
> +       t->vcpu = NULL;
>  }
>
>  FIXTURE_TEARDOWN(gmem_conversions)
> @@ -101,6 +106,29 @@ static void __gmem_conversions_##test(test_data_t *t, int nr_pages)                \
>  #define GMEM_CONVERSION_TEST_INIT_SHARED(test)                                 \
>         __GMEM_CONVERSION_TEST_INIT_SHARED(test, 1)
>
> +/*
> + * Repeats test over nr_pages in a guest_memfd of size nr_pages, providing each
> + * test iteration with test_page, the index of the page under test in
> + * guest_memfd. test_page takes values 0..(nr_pages - 1) inclusive.
> + */
> +#define GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(test, __nr_pages)           \
> +static void __gmem_conversions_multipage_##test(test_data_t *t, int nr_pages,  \
> +                                               const int test_page);           \
> +                                                                               \
> +TEST_F(gmem_conversions, test)                                                 \
> +{                                                                              \
> +       const u64 flags = GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_INIT_SHARED; \
> +       int i;                                                                  \
> +                                                                               \
> +       for (i = 0; i < __nr_pages; ++i) {                                      \
> +               gmem_conversions_do_setup(self, __nr_pages, flags);             \
> +               __gmem_conversions_multipage_##test(self, __nr_pages, i);       \
> +               gmem_conversions_do_teardown(self);                             \
> +       }                                                                       \
> +}                                                                              \
> +static void __gmem_conversions_multipage_##test(test_data_t *t, int nr_pages,  \
> +                                               const int test_page)
> +
>  struct guest_check_data {
>         void *mem;
>         char expected_val;
> @@ -199,6 +227,44 @@ GMEM_CONVERSION_TEST_INIT_SHARED(init_shared)
>         test_convert_to_shared(t, 0, 'C', 'D', 'E');
>  }
>
> +GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4)
> +{
> +       int i;
> +
> +       /* Get a char that varies with both i and n. */
> +#define combine(x, n) ((x << 4) + (n))
> +#define i_(n) (combine(i, n))
> +#define t_(n) (combine(test_page, n))
> +
> +       /*
> +        * Start with the highest index, to catch any errors when, perhaps, the
> +        * first page is returned even for the last index.
> +        */
> +       for (i = nr_pages - 1; i >= 0; --i)
> +               test_shared(t, i, 0, i_(0), i_(2));
> +
> +       test_convert_to_private(t, test_page, t_(2), t_(3));
> +
> +       for (i = 0; i < nr_pages; ++i) {
> +               if (i == test_page)
> +                       test_private(t, test_page, t_(3), t_(4));
> +               else
> +                       test_shared(t, i, i_(2), i_(3), i_(4));
> +       }
> +
> +       test_convert_to_shared(t, test_page, t_(4), t_(5), t_(6));
> +
> +       for (i = 0; i < nr_pages; ++i) {
> +               char expected = i == test_page ? t_(6) : i_(4);
> +
> +               test_shared(t, i, expected, i_(7), i_(8));
> +       }
> +
> +#undef t_
> +#undef i_
> +#undef combine
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
