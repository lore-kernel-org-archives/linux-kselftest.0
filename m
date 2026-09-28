Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0144EF15E
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613610; cv=none; b=rzie/HDrn4s6mvdraPfxA7HEAveFmlrA9GskIH8L6Xi7vBtAC+8JJz8jifaDQGnwZcEjUVG80w2sKfwX4YfGnPaJslcFcGzt6ezfRimolAU5F9p0Z3FkjCmrjRfDg7yBiYo7iWWVEDUFSAGhtSgPiJCuCQyrxDiuTJcyJzutI8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613610; c=relaxed/simple;
	bh=6THoCCBVd+/ZjxZ3xgtcJIVoQhC/QcPIewn4tAZ+WI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l25Ipm+tMOIcNbiPN8eshWMDC64lMlux/5v1IujCF+xeS0J6l/lKT12XlTRQHgiQAIgpZbX4DA4v+UYnWbMk+nrsrvaXaOemyRW7h8UHiqNZ1I92a08sW2C2gNPC3R5jM6jdmX/yap+533ImqcJ/31u9FLoH2n7vklF8P/fSIcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rTkfir8/; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rTkfir8/"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso4729024a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613607; x=1791218407; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MWRr8LBMaJZmxpSUxy/Rjeh3NVu2xmhfdirmx3vVU0=;
        b=rTkfir8/1F6a7yCgMrZ8Y2agqXtHOhZboanxGWqljoN5OqYK3Nu7vjGMWJqU//DrMY
         BttlSBZEBJzVE6UTGIzFW+cRmgMSDpKF9Up+fMCn+sLY5hFBnVrcEoIsmwZUoirnFrdM
         lJfYtZM61NwtPhbv13XpXqmBqIx5v8ez0VaXggGywcXiE0/gqYKZmaoHvv8T77ve7bFf
         MhVX4mu7Ch0eLAKTrhXMpXsT9g1f4pJZl++Xc5pWYTeQvU/YmDcbTH8QCQxQIXKBuj6z
         6MqEMvF3IOenKzaK/zY2LZBcsFKtYIQ6pfHjow/kJtA6KyvFb4KJEMKE74tkGqX79TgY
         MTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613607; x=1791218407;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MWRr8LBMaJZmxpSUxy/Rjeh3NVu2xmhfdirmx3vVU0=;
        b=Suv/+xEkvAs/DbQ7c9XUeV+L/FhG1AhMhMgUDDO5TnL9YV4DKObrA5MMEazgGYFWTV
         J02HPu2G3/LtsKu/KSBYwjnsgyaFNCpko33XtK8iDFXsrAh2A1e/vyY8rLMaef0GI02O
         usVg1LJnYE8fRo/32vOrv1784puFijfvmf1JqJWCYXPscN5pV7JbXZNIUVGgUqUGfqa1
         A6CHI2WS+31rE/MQoQaTNPSFdKI4z7N0YEfpmX0DElCyGBzH6QSXyxlR0pO6phGTGFeD
         JYPDmiUwhtgjpKXU/Oszt0qxoHvNaqXpb9LOLuzJfQNcOMtt3siESnPfeyFyJHke1lHr
         2CKg==
X-Forwarded-Encrypted: i=1; AKwUvBw7BjlB2LfqEykigsZcCXcfkS8rY82h1mmaIBd6nweEHtOniPkyDvPDoY74AAix6Lh27pxvRdmNJXaGUJMMiyo=@vger.kernel.org
X-Gm-Message-State: AFuF++k24lidT3U46nOE8buDUq7s4trqktqNDYttXNRVJcWVkayKmR5P
	fJvWq0kSANToTofaj/+I3yI9g1/u8lp6xyWFohyVfuqEo6OfsaRfjOtaHRuoWH4GD80+WhVDu3W
	NrsjeBw==
X-Received: from pgbgj7.prod.google.com ([2002:a05:6a02:4947:b0:cc7:9d5b:c2ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cf8f:b0:3de:79b7:d62e
 with SMTP id adf61e73a8af0-3de79b7da7cmr609965637.54.1790613606937; Mon, 28
 Sep 2026 09:40:06 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:40:06 -0700
In-Reply-To: <20260926104355.13697-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260926104355.13697-1-tharitt97@gmail.com>
Message-ID: <arqYZpzSNppxYBK9@google.com>
Subject: Re: [PATCH] KVM: selftests: Verify KVM_MSR_EXIT_REASON_INVAL on
 reserved EFER write
From: Sean Christopherson <seanjc@google.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, me@brighamcampbell.com, 
	jkoolstra@xs4all.nl
Content-Type: text/plain; charset="us-ascii"

On Sat, Sep 26, 2026, Tharit Tangkijwanichakul wrote:
> The msr_filter_deny test covers the FILTER and UNKNOWN MSR exit
> reasons, but nothing exercises KVM_MSR_EXIT_REASON_INVAL.
> 
> Have the guest set a reserved bit (bit 63) in EFER while preserving
> the other bits, and verify that the write exits to userspace with
> KVM_MSR_EXIT_REASON_INVAL along with the attempted value.
> 
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> Tested on Intel Core i5-10210U (VMX). Not tested on AMD.
> ---
>  .../selftests/kvm/x86/userspace_msr_exit_test.c      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
> index 2808ce727e5f..7446e1404264 100644
> --- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
> +++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
> @@ -309,6 +309,9 @@ static void guest_msr_calls(bool trapped)
>  	/* Invalid MSR, should always be handled by user space exit */
>  	GUEST_ASSERT(rdmsr(0xdeadbeef) == 0xdeadbeef);
>  	wrmsr(0xdeadbeef, 0x1234);
> +
> +	/* Setting a reserved EFER bit is rejected by KVM, exit with INVAL */
> +	wrmsr(MSR_EFER, rdmsr(MSR_EFER) | BIT_ULL(63));

I'd rather use an MSR that is less likely to gain supported bits in the future.
It's definitely unlikely EFER[63] will be used in the near future, but it's far
from impossible.

My vote would be to write a non-canonical (even with LA57=1) value to MSR_FS_BASE
and/or MSR_GS_BASE.  While it's technically possible that x86 could extend the
canonical address space, that's pretty much guaranteed to require truly massive
architectural changes.  And if we reuse the NONCANONICAL macro (which we should),
then even if the unlikely happens, at the very least it will be easy to find what
all needs to be updated.  As a bonus, the test already uses in MSR_FS_BASE and
MSR_GS_BASE, so they're naturally fits.

Alternatively, we could use PAT, as it's extremely unlikely x86 is going to gain
new memory types in the near future, but I like using a non-canonical value.

>  }
>  
>  static void guest_code_filter_deny(void)
> @@ -627,6 +630,13 @@ static void handle_wrmsr(struct kvm_run *run)
>  		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_UNKNOWN,
>  			    "deadbeef trap w/o inval fault");
>  	}
> +
> +	if (run->msr.index == MSR_EFER) {
> +		TEST_ASSERT(run->msr.data & BIT_ULL(63),
> +			    "MSR_EFER data missing reserved bit");
> +		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_INVAL,
> +			    "MSR_EFER trap w/o inval fault");
> +	}
>  }
>  
>  KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
> @@ -667,7 +677,7 @@ KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
>  
>  done:
>  	TEST_ASSERT(msr_reads == 4, "Handled 4 rdmsr in user space");
> -	TEST_ASSERT(msr_writes == 3, "Handled 3 wrmsr in user space");
> +	TEST_ASSERT(msr_writes == 5, "Handled 5 wrmsr in user space");
>  }
>  
>  KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
> -- 
> 2.53.0
> 
> 
