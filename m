Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674C4A43E2
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999646; cv=none; b=hbVAo3pmCOzRZauUzf6HJLfr9/4IN+zMSIvlTapJYK9oer5GbcXZa6ISDfrRPQp5ZTdg8M1nuKmq15bDBCLGomMSYKinRSTHapBqd3iyifMSYFuB2grgYs+jwRl3BprWawA1KZZO1qUM7qadUmE1ddKZVYvUygO3cmDMGx0ukmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999646; c=relaxed/simple;
	bh=aVY+77+Rg4LdrLfAH6xlK0pN+kCKSnGa0twjylLa7m4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=noyNiQkQ/FTN0+JpCuOTWBQ1hxfKORUdk7EqxBNuxU6CjqqmN3sonqQIlZ9EjIkrRgOk3Xt9dfsJBkcnRAlDzY87M734IhkcSooVJGL4059pH0cOcALulSjZq57T7xFo2qiqW35R5qmNIlRaXqIikRFDyZSojDJ+oCkLcA3TPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d36U9OqE; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d36U9OqE"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-869b8d63e28so4399872b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999644; x=1790604444; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7kVfEuUUuG5RNBx6vZsXAqf4DhBGNyoOU9tZbLc/gs=;
        b=d36U9OqEy5t1YSBG3G0wsA04D9U97Fvp344kSMe9WPaXa1qeOiup1nBk7QMtYIe4my
         59Duy4/P+j6qra4KJQypPXj4jtrzjJndcbwzKxZ5f5HNDOJ+TCuNgwJvIuIVIlijEEHx
         uviGmzzRcXLKLrFEMe4WBSXUqrUDwzq1qNjDHFsEF9ycwor9ix5OLAaqZW/Yca9Spqkf
         COzdtAMyYKn5XGwJkOBe2mOPOzLs77snnJWUD4fZs6ltlvL8Esmfj3D5WU0jOLaLlukh
         L7kP0lYBS7N7rXvfXAzazoyPk2yfRyQ3ceN+ET5zG8s1GQPp0KO1MgoSJVjBKi/O630R
         BVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999644; x=1790604444;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7kVfEuUUuG5RNBx6vZsXAqf4DhBGNyoOU9tZbLc/gs=;
        b=Bcpsp9H0LKYjz0DWgBQY690i3AlnBgB2ilVd3oHES4vNIrLpd557xQuQ34Zg9FRy/S
         H36jobz9I69C7AQMrShQqiz1HsyXAMAE9FIq4W8A65vZ+9QlnOqAAmiLyMa/+rNCyhET
         Ker4IPJmMjGAiDHbrcSh+5i8BTpd87b244mqoMk8A5e5bN8x7TtlOYdrdOqo7grGuXod
         f6UfQWmgwuazFWcQW1Xv7KYzkjBDTgimhK2nuR4V67bBuD4oohcyHJdGwnQ1JJJOdKVc
         XUsR4kUtSKJBSn/6d11xgfsnnTh5g627NJT27CYvMBrEsDZ1fdjYFfnb+YAisMGSMTW6
         PU+A==
X-Forwarded-Encrypted: i=1; AKwUvByFprHDMa/FJ04ByurPNMkD2Tq/siswQapeDioef1MHwKr7g23nc0hCeCHByKygP2L1f+WnOl4ss8NxpRTCi2c=@vger.kernel.org
X-Gm-Message-State: AFuF++mwUCXefmS6OzRrGZFemQcxuZ+7T5bzpbgCYbZU1/tQVHRSUijH
	XL8wStQn+dAZQWlEa04Pw/KclBzN/R2zVyB46icc48V69icgkL2tBbPufCKaHwcAXAAbdoU0r0n
	aX7NpNQ==
X-Received: from pfst21.prod.google.com ([2002:aa7:8f95:0:b0:87b:300f:fd01])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8883:0:b0:84e:d5e6:a085
 with SMTP id d2e1a72fcca58-874d84a92bemr15148212b3a.0.1789999643931; Mon, 21
 Sep 2026 07:07:23 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:32 -0700
In-Reply-To: <20260811050029.530698-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260811050029.530698-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999927029.754512.6741483404933166279.b4-ty@google.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix two VMs leaked on early returns
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Gokul K <gokul02k@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 11 Aug 2026 10:30:27 +0530, Gokul K wrote:
> Two x86 selftests create a VM and then take an early return that skips the
> kvm_vm_free() at the end of the function.  Both now jump to that existing
> cleanup instead.
> 
> Patch 1 is the plain-SEV path of sev_smoke_test(), which returns straight
> out of the UCALL_DONE case instead of leaving the loop.  The SEV-ES path
> next to it breaks out and frees correctly.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/2] KVM: selftests: Free the VM when the SEV smoke test's guest completes
      https://github.com/kvm-x86/linux/commit/434c50e703c5
[2/2] KVM: selftests: Free the VM when NX hugepage disabling is denied
      https://github.com/kvm-x86/linux/commit/ebb702707896

--
https://github.com/kvm-x86/linux/tree/next
