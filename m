Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B73B960B
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 12:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734703; cv=none; b=oboMrhEL3sVUyRNdl89N5JvmzqCVrdK2wdiKr3pPkEoSSCKarz2eYYW3q2/D0z0TzTMRHTdNAPdjjqehTWnAepd9aIE6aSUJXRkTWzyuff7hGEjr2lpR4mdviOxj7JafMCKQfvtWwfDftK9XtgjIiCtfU1LMxUIS6FskY2uX5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734703; c=relaxed/simple;
	bh=hduq/+QUzvOYvyBjV6zvOD13s4oXxdEzyFDF6XcgV/o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DAih6k+pu66C0KzYfZMHMfRPRBTlhVxD+bTv7a0TQk/itVJXBXEJji9xkHwT9OVkNKKqTyCfvrUHJQbgwRMjHkoENOkPooV/qxK3t9p/uwCjlbbLbN6OKgGF1YJwJgBvavVOqryI/agVxyFCJLgyV20iLGeXVTln2Hfppfk0IZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cfZxGz5u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnfd7Uui; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cfZxGz5u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnfd7Uui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782734701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yxPybTnAynYrqMa7xM6kuJZ/NYcVq9nFK+M5bYeVejI=;
	b=cfZxGz5uwZWPieZ9ll/6cDsGwaXA6dQv+I+AwN1W/lpFBkXOJKQHl0bkupGcQjQLcjqdSI
	b5NoT+SPQJ8aNJ98I9cpB5N9YuMAutWCANgaCW4Yxj/MtcwLbiBqwE4Vc9HwbRWB61tDgu
	forEVsOHZIC0jEiO9/TtpV6xx++NoQ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-bHBmu7EnMSSVAins36MwDg-1; Mon, 29 Jun 2026 08:04:59 -0400
X-MC-Unique: bHBmu7EnMSSVAins36MwDg-1
X-Mimecast-MFC-AGG-ID: bHBmu7EnMSSVAins36MwDg_1782734698
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493b0a5e636so6775855e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782734698; x=1783339498; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yxPybTnAynYrqMa7xM6kuJZ/NYcVq9nFK+M5bYeVejI=;
        b=cnfd7UuiMho1XjVvRJrytu3tIGdsN2Z5zZDXuYBbt/UcLqB7LtoO+yiB0GZou3Q7DU
         XgR8XydLjFZNTNd02H+so+iwusHIHsquRe4SIAdiqb9hHwpux4iqGRhZg0PzaPWRngjw
         OtMZ3iSLhMOEum9xJv4D33WADkN3XOYSpcVWvHk3GC0d83HxKrm+tQqkIVqTMgFqkFd+
         vmtciaSX2JRpWWxdilxgVE+75EH/E48SDpvdaFeUfZo3cP16cSpI9mGkc2q/ZAHPD/DL
         2Z2CfXX4JXVL2esmktsSSl+2TcOgLTJedKnbhA1VO0MNEMIF+F8dJlSIHbCwCd0v22qb
         BCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734698; x=1783339498;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxPybTnAynYrqMa7xM6kuJZ/NYcVq9nFK+M5bYeVejI=;
        b=k4MR2OTpPciMj+OO9PV71sMO6H9pAnWsc/L5TzmKQjyL+5jd+0WpxOor5Sluih52gf
         2BweWcZBXNNWFlMkwIxqyfWWpRYwHW+P94Y1ISjYFXzvVd13AJcvo18Rtgr/rlesegL5
         DIcfK4AvfRAFeyR80vvnE0ohHAsZll0A++GPYuQFamu8BR6q7oBh7lfgU/Ei670/3Hwi
         9Kz0gAvJGlWFIPg/D0ymDA8Hrx1+2haXrnvmQ6m2erWG+T/kBtK0w1i8BnMfPtKG+ihu
         +Ao3i8nro1nrry46ogjOxnIi0+b//l47n0Z9AB6dPamzVtWbs5t2fxyugdQtqxk9T3d4
         2hgw==
X-Forwarded-Encrypted: i=1; AFNElJ9ff4vnwmkg9TGlOfDr+J/QwAJbESS+FZGRGMIWJtM2F0XGmC4WdV+LwVzuLLZpJpTTStyLOGNB0Wj3+BGItqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYGijHDc4BEDL1lGlDcrYV1dJZbMMKK2LGcMApAZEgwCkbvtWG
	hpFAlc31BmZEAG5JEp0L0qBUvWY/f5bMCI4cUEUBsiMimRBv38KsiRdohEW5G9DNuKmnihPNZyE
	Lq27D+raEqm7KTcB1yjYpCazal9u9zCM3R9mHbJGW+79sPgoSiRD4RoGASMq5QvzJkoUruQ==
X-Gm-Gg: AfdE7cnYkVogcL+ohTDLzn2WFuPRCG5u373U5z5/ZGTbB5uTPoTTcpfxy09Av2fB6uI
	RMEY0Y1OmHFpSkAKrA5npVz3w8kSmYwFnXP9B7PDnxSTE/PUf6GCMAhWGfS8gP/Uc9L9G6GtEXT
	jh4kLZAiTOGlGtWyKolo/8QaPKtMOpom/tliPzKxLDauYH0EFWjRyEpoo1Dql8WnvfKw+/fzx9R
	xB2U5tULdstM5jpF45q1IckvkzKm3ZRgYdVHKJ98EGUvM4YM9Xu+Z8omTn86vDqTml1lVx2IHQ0
	5s8l3R50jaZ/PfsbHB1d/oPOFfEiNQL7Dfz65pDUTtzc67yqgKc7Nw5OfBnhPkVBr4F8RhpnfsL
	RSYzPWIvcH65ts5oYHolEj1KR83wg06ApB/fj6v6tud1V/5oTeeiCLqLFrHUl
X-Received: by 2002:a05:600c:6096:b0:490:d32b:39c3 with SMTP id 5b1f17b1804b1-493b719262emr8675315e9.6.1782734698010;
        Mon, 29 Jun 2026 05:04:58 -0700 (PDT)
X-Received: by 2002:a05:600c:6096:b0:490:d32b:39c3 with SMTP id 5b1f17b1804b1-493b719262emr8674565e9.6.1782734697481;
        Mon, 29 Jun 2026 05:04:57 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de. [2003:f6:af2a:6100:f239:e076:bbd7:6784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm43526066f8f.5.2026.06.29.05.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:04:56 -0700 (PDT)
Date: Mon, 29 Jun 2026 14:04:55 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
cc: Jiakai Xu <xujiakai2025@iscas.ac.cn>, Shuah Khan <shuah@kernel.org>, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, kvmarm@lists.linux.dev, 
    Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
    Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH] KVM: selftests: fix steal_time for arm64 with host page
 size > 4K
In-Reply-To: <a6ccc7a8-488b-4454-81b1-f29dd875845c@linux.dev>
Message-ID: <073cfbe1-0a27-015b-c688-53c186100fa1@redhat.com>
References: <20260504112808.21276-1-sebott@redhat.com> <7575a845-a542-4b16-b512-aec3126f97f3@linux.dev> <335f21e5-493d-012d-b07c-2e48cc2b9aeb@redhat.com> <a6ccc7a8-488b-4454-81b1-f29dd875845c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Sun, 28 Jun 2026, Zenghui Yu wrote:

> On 6/22/26 10:14 PM, Sebastian Ott wrote:
>>
>> Fix the following failure when running with 16K host page size:
>> ==== Test Assertion Failure ====
>>   lib/kvm_util.c:991: vm_adjust_num_guest_pages(vm->mode, npages) == npages
>>   pid=873 tid=873 errno=0 - Success
>>      1  0x0000000000405a27: vm_mem_add at kvm_util.c:991
>>      2  0x000000000040241f: check_steal_time_uapi at steal_time.c:223 (discriminator 7)
>>      3   (inlined by) main at steal_time.c:539 (discriminator 7)
>>      4  0x00007fff8b57af3b: ?? ??:0
>>      5  0x00007fff8b57b007: ?? ??:0
>>      6  0x0000000000402b6f: _start at ??:?
>>   Number of guest pages is not compatible with the host. Try npages=4
>>
>> Fixes: fc240715fc50 ("KVM: selftests: arm64: Fix steal_time test after UAPI refactoring")
>> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
>> Link: https://lore.kernel.org/kvmarm/7575a845-a542-4b16-b512-aec3126f97f3@linux.dev/T/#u
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>> ---
>>  tools/testing/selftests/kvm/steal_time.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
>> index 76fcdd1fd3cb..cdb81f3ee4b2 100644
>> --- a/tools/testing/selftests/kvm/steal_time.c
>> +++ b/tools/testing/selftests/kvm/steal_time.c
>> @@ -208,6 +208,7 @@ static void check_steal_time_uapi(void)
>>  {
>>      struct kvm_vm *vm;
>>      struct kvm_vcpu *vcpu;
>> +    unsigned int gpages;
>>      u64 st_ipa;
>>      int ret;
>>
>> @@ -220,8 +221,9 @@ static void check_steal_time_uapi(void)
>>      };
>>
>>      vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
>> -    vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, 1, 0);
>> -    virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, 1);
>> +    gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, 1);
>
> Would vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE) be better
> to describe the number of pages we want to add?

Hm, I don't think we care. This is just for the uapi checker - the vm/vcpu
doesn't even run..

Thanks,
Sebastian

