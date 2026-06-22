Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB83B83E3
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137666; cv=none; b=TXUJv0B3BKPjvaR/Pv0Wt2UHb9ueXM65MzZKZlg45/oLZ8A/3nrA6LftilwDgjeHmNL0o8M6mjGy6EpotPx2BRQ7/uEgaGJ9od/NrAprJNQpbWMVoTjvPscrlotstsyr2gSOA2kwuPx6AnJURo4WE4N/7Q1l6qs9s0BeZZIesCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137666; c=relaxed/simple;
	bh=AsVvIRM0LiB6uuIor9GeEXofQ5mDv6boraWopSijpi0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IlT7GX2XHTtBHse+S0QOZ4G+B2OQfWxlzeBLhcyM8Qi7+pswZjElUrkXs8HTdxQBo+BdjEqeaMcZ7RI3lKI9yjCeoQNJA7IeUe43WrJrYHMDbuq2M1Tzon5XRW8emDeTdSAiWH6iWDVtAxZPvd+1PlWUtIwt4BnCVO/+BXRf8n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4Eia9pb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUmftmYL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4Eia9pb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUmftmYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782137664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2lZOSHl7jsAhia0SyyH/6Muj5VDwhnEjjlDeTnLCJo=;
	b=i4Eia9pb2YGp9BOiGmcr4c7lfyPygPb0fg1Km/y/PDo31W71T8kv8EGdcNZJuZJI3lelKY
	/B3ZTY0hXM91ax0G2T1tz5da9o5Bu+y5c6C+xJYmJddxe0VN92po5LoNU8npW1o0UNMlJn
	iDHc91/zBthFQm+kwLOUmHp8VQ/ZK+c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-qKu_r2YIOLiheDim-So0hw-1; Mon, 22 Jun 2026 10:14:22 -0400
X-MC-Unique: qKu_r2YIOLiheDim-So0hw-1
X-Mimecast-MFC-AGG-ID: qKu_r2YIOLiheDim-So0hw_1782137660
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490b37e1f47so29234895e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782137660; x=1782742460; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2lZOSHl7jsAhia0SyyH/6Muj5VDwhnEjjlDeTnLCJo=;
        b=BUmftmYL5XGu2XvOdrzut9qMNwVc9YcZYKHdlTqoC3H4/ebLugababqdu05e1qmuq5
         oAISqFfIEHsGAzgSp4tGgKYx2CH03VTIApBaR7xXh8bOKPLzXzsYhA3/NFR5/AYmMce6
         VPLC2xwktesa1SEnoT5xv7Nh4eqib8IrAp64D2qwpkbg7BuSRYCGeP5jJm3lAIFfW+5V
         ATZFNDcOAyDyiwzv+yNGI8bVv+yLL0nimtJkxu4eDZo8VnRByql0uz76hcqvRU9abBgR
         akHh6/XB8CdvwRBAD0TNFdyhZAjfs9/DMa+635aGZKSG0TBMoCRorshao6H2GbWcpU+G
         ZjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782137660; x=1782742460;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2lZOSHl7jsAhia0SyyH/6Muj5VDwhnEjjlDeTnLCJo=;
        b=D7RBDqu/gooLD3B036jkClw9uANiq8mMiEFwnte2A8i5FJou3yjyTsa/wlEa7Vulge
         mY0hSXTKcS51gi5CoxtZChWC6wP8MgA75aWAU4HjiyVd3D9960ehqPmMbfx9NdZJaDJ5
         /WegVc0rrQr0+GbsMTUcnPonUWujGd8UGAGemDemfVEqBMR3l0mc8IKAWqGPgo745rxX
         VGlnmyQzdkyMA71iBuS5/7msMNFDH8jm9d9X67prdUP31ynNlkqod4d+jz0HPABSbZ7T
         8iXSVW5+4nOF23iUFB5ykPJWlDe7qJ8m5SvTVsSVGEx5xIyNM12VvNE9vTN2REgYap+G
         ga/Q==
X-Forwarded-Encrypted: i=1; AFNElJ98pczsCzLezGksRZRUgTU/zKLTtOMsGA3pNHNie/n2JXdZU4dQVfrEzyrEtaVPshGD+Igy462t6FUgJUctuWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8SrVmnOjWd6WBVKTEdfhITS8KAnHuDly4K1pt8igWWANWncQy
	vqyupFuAJcTdF0/pozP/f3uC7hhcdmIM5IxC4sO63IPVS27BvQHTEcSQKbHmiun3cOIF9kOatUA
	/M0jPudlYytQYdoFzN9rwfXA3bgEhBUXZzs3T96tfIsXqln28ZY1+SGQMQ67a64TWoZNkEA==
X-Gm-Gg: AfdE7clByaXcmiUe3uJNHlzzgeS6iezW1pLbay0mhE4PEnl/raFhdGcC2Nk46IqfqPO
	ekKfLub9gA1SznMaUEV4yL954MbX+Ph+FjJHU6o4kA4WdxrEQ9HvBNuWHXrM1y3KFKwo7uUmJpA
	KqFRbOjdHZ8VHJ3yL+Ujq9VPWRE59NG5UBrO91yDN+FiYilOn2XDvpDQfEmFeKuLEqdkl2UtQsf
	NJ/+glV3vnpqsMMnJCr3pMQ4CtOo+mOK478pBVM7JX5HmwsjlJqmP8Je5NcnVKfUf0eZ9OadPve
	rcmq+iqnXdq6Nx5CJ0j3PCjJP+fTbAZGjMGAJLz6/unGIAMmIUO9B6NeaX40IUHKun1lghLv8uo
	kXKSSIvuOy9hUZakBItz4hQLko5z4Ek9CZl4uifli3c7eIAOVWfQqrvr7xHzj
X-Received: by 2002:a05:600c:828a:b0:492:5297:e8a3 with SMTP id 5b1f17b1804b1-4925297f415mr101043335e9.20.1782137660454;
        Mon, 22 Jun 2026 07:14:20 -0700 (PDT)
X-Received: by 2002:a05:600c:828a:b0:492:5297:e8a3 with SMTP id 5b1f17b1804b1-4925297f415mr101042725e9.20.1782137660057;
        Mon, 22 Jun 2026 07:14:20 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de. [2003:f6:af2a:6100:f239:e076:bbd7:6784])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49245a69f81sm268598405e9.1.2026.06.22.07.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:14:19 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:14:18 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
cc: Jiakai Xu <xujiakai2025@iscas.ac.cn>, Shuah Khan <shuah@kernel.org>, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, kvmarm@lists.linux.dev, 
    Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
    Oliver Upton <oupton@kernel.org>
Subject: [PATCH] KVM: selftests: fix steal_time for arm64 with host page size
 > 4K
In-Reply-To: <7575a845-a542-4b16-b512-aec3126f97f3@linux.dev>
Message-ID: <335f21e5-493d-012d-b07c-2e48cc2b9aeb@redhat.com>
References: <20260504112808.21276-1-sebott@redhat.com> <7575a845-a542-4b16-b512-aec3126f97f3@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed


Fix the following failure when running with 16K host page size:
==== Test Assertion Failure ====
   lib/kvm_util.c:991: vm_adjust_num_guest_pages(vm->mode, npages) == npages
   pid=873 tid=873 errno=0 - Success
      1  0x0000000000405a27: vm_mem_add at kvm_util.c:991
      2  0x000000000040241f: check_steal_time_uapi at steal_time.c:223 (discriminator 7)
      3   (inlined by) main at steal_time.c:539 (discriminator 7)
      4  0x00007fff8b57af3b: ?? ??:0
      5  0x00007fff8b57b007: ?? ??:0
      6  0x0000000000402b6f: _start at ??:?
   Number of guest pages is not compatible with the host. Try npages=4

Fixes: fc240715fc50 ("KVM: selftests: arm64: Fix steal_time test after UAPI refactoring")
Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
Link: https://lore.kernel.org/kvmarm/7575a845-a542-4b16-b512-aec3126f97f3@linux.dev/T/#u
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
  tools/testing/selftests/kvm/steal_time.c | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 76fcdd1fd3cb..cdb81f3ee4b2 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -208,6 +208,7 @@ static void check_steal_time_uapi(void)
  {
  	struct kvm_vm *vm;
  	struct kvm_vcpu *vcpu;
+	unsigned int gpages;
  	u64 st_ipa;
  	int ret;

@@ -220,8 +221,9 @@ static void check_steal_time_uapi(void)
  	};

  	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, 1, 0);
-	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, 1);
+	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, 1);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
+	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, gpages);

  	st_ipa = (ulong)ST_GPA_BASE | 1;
  	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
-- 
2.54.0

