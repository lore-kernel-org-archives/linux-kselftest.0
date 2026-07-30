Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF1405C48
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435145; cv=pass; b=Ks2JKaxJmpeH42soB0oFU5bTJogqoJR4fWKFFZ3g/xL4u+HMoed76bNaPQF8zEfoGCkTFDEc/tZ07Z63ygmWGRPVQ+KGZuSa36FLQyL20qJs2uGotwq94UlNlBFJCB4Dluml1WLPJgLYWxxP1CV9dkwZX9+fWmIVGyBgQN7CI5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435145; c=relaxed/simple;
	bh=TfIMwScvckB1Fib5Y+wsX3mqgKnQULjNLMCYcEOof2g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JORhcPSYmqm1LrcI2zIdK66BWXsuApjlOflUHbSZn2sKXCaclgBsuRo//VCoL8cMUJmYsw6GOIgvJl/pqJukSbX2uchYlN2ExtUIKAfElzzMMmI8N/N705yihn0E+Tj+qESOEsGvfADFIb4Pr8TsgzTibyyEgtVL6CqTuqCj8jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uF91zuAN; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uF91zuAN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceae1ed204so1286865ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 11:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785435134; cv=none;
        d=google.com; s=arc-20260327;
        b=rJbwtrg/nYqReIa3JDRpwZhuX/Xy/tSYvasE7nj7e5AYNmC2QjEoLdmC+IpW5fmSQ6
         IzCEk5Oi+AGk8nVqVFtTmlocjyG/RiTOjG+0MF4mNrMTpYJQfz1hp1inTXluhk3MDmvF
         zOAkHisLwEthe6TiioBYMKqN4uox8KKm0UR5VLLGIVH9x4etIX3P2esYlDd0FgUMV7Af
         gNbrJSA28962PSR26jkxdUDWrFFy2vDHB8PG+B6WRaVLs31lB+epAoC2m/YQLTJw9nx5
         OF2bN9ANcB6kRqXkIM4MTNx4WYPUN6PwYtGorfIZTwQW8Oin/Xs17dU9TbUEDlPe3vsv
         CY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gPvFSTghJ28Kixi5Kvwbbt6p3THpZRrypXj1JQIqIto=;
        fh=k2M5+le0vr3qB4AfMXUEMpfaL7Ua8Ow45VRBol8cKiE=;
        b=EXyPi+u8ScVDKWrQJsICgDd+r3UiXQizVviT9nvyfgwe7VIykVX8BfM0cZK4N42xAz
         SqIJM+jB+alLDl9/t3UB/jgNeUDEDfJDDeSBJ7XFlgGWpim+y7Q3PfJJnIwVmNJVP8bI
         83HfZXPffodjS0ChHao45L/xvsitzWLF/oOzCoHgOPkyjfgsYZ0rl3Itc12YjUecAfZt
         2Zx9bPRNyKWtdt1yh6w5fmoNw2pokXIwCZwlWOsc6Dc7Ygc8Ajw0l7vLWqxHa0n7kTHB
         VepuhCNvKFyDJi2Ojs73MTllEFXd+yL1lY0MNehgcM5WS1FFoqa7BxpidrijAB/CrWFI
         DeOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785435134; x=1786039934; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPvFSTghJ28Kixi5Kvwbbt6p3THpZRrypXj1JQIqIto=;
        b=uF91zuAN4E52hdv7rh5ePXW5IbE21BmQyOaLbedFouQNsSbV9KuoJ0tX4AkVWtRDjb
         JbMNO6qgTtJXtJwUXcYMpGigwjyCKv/8ASC9KiKkp4WywqK+muw7YUGcf+zcD3nAB1Kw
         Sh33C1d4YCur1zwK5LwbeboW5N+kIptKOXnJdzasF6sL44NEwIg5WF8wjcc6Lblzs/XC
         6BibsrvKm6LZ6+p/cUor07EBzr8p8eNO2VGQaHi3e96wuG/tw5hC+CEYRP7OwqxiVweh
         1BwVmnHf9ZlKmp/mymp6a8k2fXq5xA7Sjg2QtEn6pLrPUU0R7DCFrEZdD1tuxMyeDkkp
         ZOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435134; x=1786039934;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPvFSTghJ28Kixi5Kvwbbt6p3THpZRrypXj1JQIqIto=;
        b=qFOB6NzXYAA94R5zXfSX3TZ4sDtIU+O5IsGwCRZ/5ZJhAq5KHuy3XjHca+K1vp1WNe
         5pQYCft+2vW3uVR9aQ/bC3KoK/pJmEovBOlmoWUnoP7hzJUkP7bLE862NYoa8ZLmGDt4
         sGVVy0jMX8vu7xAvcw2MnHh5A9V38zgpLKi/f9g/MpFHOufGFTmmHO8uwPkiab9nlv9u
         /nJik8+sw9lJ76ixvitDVsRfRZ089q5ECevxlC62fS/8lwzP3C2yu9Sck+B09+yYJQXZ
         rpAwf5hCzoxghN47awvOUMY8HBzt9MpFFLeZ/AxiJinkgUDZcCYKHgTfEKw41hhx92rI
         0/Jg==
X-Gm-Message-State: AOJu0YxHKiwRbFJYQNMcyIEzvEAwYlA59hJslgYMVbLBsgTtifOqe1YL
	hwsVMJ6Uez0+r5dncdJOBMszeVShi6sdXbfhzJZuPsL4uSbwLLUPH37i6c0AsKaYtgqwStbk2/o
	pVT96irYO7OYUSyFHmse6f0Cs2p4WlMJwMFbPH/N6
X-Gm-Gg: AR+sD11Zzf2QhsJLyO4sv4u9n1/+m/d5H8fT/FGzkOzepYanEf9Mvi+7GQJUdkR/M41
	Xt3uIIi4KZmW1lEuRxYeCWYEr3+Yo12hFWBV6mN0eKq5sKFSc18JDBZ1Tw7zhJATEehujNmK9co
	xmM59szqAZZOfvb9D0bqkyxID1C+oHNSOnWeq9/jwXviCcb4S2I5PX3IwTx87ZWgxc7C55rw8Bg
	XgRwHJO4U1CHyDtMY7dhW0bDpaKwSsdsw95tZ6n4jVMJAsstsVTyxtidR1SopXiAtmyvzqRXHc8
	P50BV+apIaNxuc/0fG6QyX1GvH7coCPepAt3DXGRAppqoSJaJBZ5vGNyET1s1t+202hw+egPNR4
	J0S6bE1pNqWdXm4OH0bq55rki972z16jZQQ==
X-Received: by 2002:a05:6a20:7f95:b0:3bf:9b61:f7ae with SMTP id
 adf61e73a8af0-3c90046cff3mr3701207637.14.1785435133085; Thu, 30 Jul 2026
 11:12:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:12:12 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:12:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-8-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-8-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:12:11 -0700
X-Gm-Features: AUfX_mx2gL8KIE-6PLoUtXVMOZbkrQaxrGgfvvgdayE505KQfySpbra5kxUa-V4
Message-ID: <CAEvNRgHW0P78eL0ip799XF+2geKwz7MQrjSFTgvCdUAuh9oykg@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] KVM: guest_memfd: Add support for freezing mappings
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

>
> [...snip...]
>
> @@ -273,16 +284,30 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>  			       loff_t len)
>  {
> +	struct inode *inode = file_inode(file);
>  	int ret;
> +	int idx;
>
> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
> -		return -EOPNOTSUPP;
> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
> +	if (kvm_gmem_is_frozen(inode)) {
> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +		return -EPERM;
> +	}
>
> -	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
> -		return -EOPNOTSUPP;
> +	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
>
> -	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> -		return -EINVAL;
> +	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
>

Continuing from [1], this guard is actually meant for PUNCH_HOLE... I
wonder if there could be a deeper refactoring to check when actually
punching a hole, basically the equivalent place as kvm_gmem_get_folio()
in the flow of fallocating.

Will srcu_read_lock() be taken in a nested way for the fallocate case?
It can be taken in a nested way with some intricacies, but maybe if the
freeze check can be done just as the folio is about to be removed (as
described in the above paragraph), it would avoid this nested locking
here.

[1] https://lore.kernel.org/all/2vxzzf0kl3dt.fsf@kernel.org/

>  	if (mode & FALLOC_FL_PUNCH_HOLE)
>  		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
> @@ -291,6 +316,9 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>
>  	if (!ret)
>  		file_modified(file);
> +
> +out:
> +	srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
>  	return ret;
>  }
>
>
> [...snip...]
>
