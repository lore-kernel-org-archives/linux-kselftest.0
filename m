Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25163AF66C
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369069; cv=none; b=F9RRAbp87f5Tg5Z3m2TZjYKRm1MQIYurjwF5mLvKtmkqcrr69HIlNwG0SrOUk1CktH8MSZbrkdxx6vpgguYNAoKu4MPHXY9m3KP2Z6HK9wjEXmgcwMBdsspfgUxIpt9XxFo5UZ9SR12ZprH1B2tnJphC7Ba9/9/btVWbcjJrCwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369069; c=relaxed/simple;
	bh=q6FNZp3XFaqNHFhMl6+y/FDb5a1CEfUMMH6myO0ku7Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uB836is3U5PHS7Sc1MSqgE5qAoZ7kROBh6fE6wOSviGAuck9U3ytyTBwqqk4bprZAU5W+/bfc7EqAvwB/PFlGWN6rukT8l0u8fT1gAoUY383xoGCvZnjLNd8olQ5sv2hfc2IYAZYzghn9egL9+ODk+64pYnCeaH3OU1UoKAT5wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sH/JUYIH; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sH/JUYIH"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso2362283a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786369067; x=1786973867; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OjVBVJfk4CwI9/GoWgBIfWW3MJVUID0+VTcUKcWM90=;
        b=sH/JUYIH7yf/OfLstBaHv1v3tygMHWKFFx95P2mEV94SMvLiNy+uFFU3luRo5Oc24J
         AU3QAnffU6rVvOqp0Rz6M2uXb5A+OkleVdfmxPZc391VHLA6iXSiJxZaSL9cktE/DWGI
         kkkb5nve9Wqv1AR5UFVcIdxoV+8/of2SnAQwHIOcYaKZw6J84pFrBoDBHB39pJobN926
         xDrVkvWxEtLH9hhyeW/Z811olNL6fv/C/Bfv8F2PRdAVo9EdgsLiA9jBeaUKbCoM8z1g
         Kz3xINKIvEQnYfvdBS+xci3Gqs/IauvxD25CB55eRSVRWLo4IirG3vP7rDWQhHDzHqsF
         Em5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786369067; x=1786973867;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OjVBVJfk4CwI9/GoWgBIfWW3MJVUID0+VTcUKcWM90=;
        b=b8b48n2G1MNMho3cxWMcyxo+WlWuD7ij8oRWP5Pj34GbiEGe8G0bQgJv9FA0uaia2X
         RMiJUEmOft9sFPLmHV6huBd6UR+23ajrx8GF/eH/qWbkaPKNksZpdaQJlKiRKx9dhMq8
         ubaDvXnWfsga/db8YeVweXWWbMhO+43n+BKYz9lKgtb4v27CYwAQ+yQnLVt2WLN9jJ2Y
         ly7mHbj5FU5FTtLzCCJ+gMm3OFRWQEesWxMNdhaMVyJEt7YBGoNDlfW+YG3MUZ4LQQRE
         xD5HKaNzZkJJpEHW3As/dCWngPVlBLYCNwXebDlkY0ypNwZDoqemf/4aFTrH5kaAZzaW
         SXrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyUyQe+Ps4J2PFT71uKKiS5HYBONyGu56nUy2yfPExC81wx9T/X6dnY6PzJBnJKwK5pjYcnaTsjcdxFTfFAGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5WWoHLbLOA1GCGH/t/u61B5dJn7lc0zBYRvg7D29Bos9KQMKS
	otMVIE2wZbblwR5qfM/0UI5M+fZ/FqlSES0gb4tLIgWmkQAd2vdWTKoS4jf7jjCdwpGD0uzBy+X
	2f6kJPA==
X-Received: from pgii30.prod.google.com ([2002:a63:221e:0:b0:c9e:41e5:2eec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:10a:b0:3c3:a140:9380
 with SMTP id adf61e73a8af0-3cbce7fdeb0mr25171510637.16.1786369066622; Mon, 10
 Aug 2026 06:37:46 -0700 (PDT)
Date: Mon, 10 Aug 2026 06:37:46 -0700
In-Reply-To: <20260808081050.408657-3-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260808081050.408657-1-gokul02k@gmail.com> <20260808081050.408657-3-gokul02k@gmail.com>
Message-ID: <annUKvHeseEqVtp7@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Free the VM when NX hugepage
 disabling is denied
From: Sean Christopherson <seanjc@google.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Aug 08, 2026, Gokul K wrote:
> run_test() returns as soon as it has confirmed that disabling NX huge
> pages fails with -EPERM, without freeing the VM created a few lines
> earlier.
> 
> This is not an obscure path.

FWIW, the relative obscurity of the path doesn't really matter.  

> nx_huge_pages_test.sh runs the test a
> second time without CAP_SYS_BOOT for any non-root user, and main() calls
> run_test() with disable_nx_huge_pages=true on its second invocation, so
> an ordinary run of the wrapper script always takes it.
> 
> Free the VM before returning.
> 
> Fixes: b774da3f2e57 ("KVM: selftests: Test disabling NX hugepages on a VM")
> Signed-off-by: Gokul K <gokul02k@gmail.com>
> ---
>  tools/testing/selftests/kvm/x86/nx_huge_pages_test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
> index 70950067b989..49b70c05daec 100644
> --- a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
> +++ b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
> @@ -120,6 +120,7 @@ void run_test(int reclaim_period_ms, bool disable_nx_huge_pages,
>  		} else {
>  			TEST_ASSERT(r == -1 && errno == EPERM,
>  				    "This process should not have permission to disable NX huge pages");
> +			kvm_vm_free(vm);
>  			return;

I think I'd prefer the same patter you used in patch 1?  I.e.

diff --git a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
index 70950067b989..e3b20033a884 100644
--- a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
+++ b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
@@ -120,7 +120,7 @@ void run_test(int reclaim_period_ms, bool disable_nx_huge_pages,
                } else {
                        TEST_ASSERT(r == -1 && errno == EPERM,
                                    "This process should not have permission to disable NX huge pages");
-                       return;
+                       goto done;
                }
        }
 
@@ -213,6 +213,7 @@ void run_test(int reclaim_period_ms, bool disable_nx_huge_pages,
        check_2m_page_count(vm, disable_nx_huge_pages ? 3 : 2);
        check_split_count(vm, 0);
 
+done:
        kvm_vm_free(vm);
 }
 

>  		}
>  	}
> -- 
> 2.54.0
> 
> 
