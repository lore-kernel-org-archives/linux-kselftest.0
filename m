Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FF47CC74
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905685; cv=none; b=krXr0LX4mq0/vtTg0CVyfnPE69DTxR/afSt3WRYfSM5fbO2VZxSQ0XaUrZmb1mOh5/doBAzrWfM8XaXRRMOBXIjRB0siYmO6lCgxONEoPT0jEwQazXTg901wnmXMZjg5F3lh19Ch95ErkXPUbsxfOEZIbk7hWlA/A216NQuS9UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905685; c=relaxed/simple;
	bh=OdkQYg9fKRcLy8CeKe0nSAB38xYFhj3xHHgAxKzfI/8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zmr6ITGUBzWPY1088ug6yS0kWHflXwKO1Q698Bw7D0BGE+JlT9NQJq+AbvcJwX9pBaL/0wXcFwRBFQX2Y+B8RQWrur0AvMvDfGpSI96C41sXw8SBq5dt9mdNgsy9MbPHU04sZpWu/Fkf4fps+CJt+8kJHNckUNmcKoSHJwgXmsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bvmcZHM1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bvmcZHM1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso23534065a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 11:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905683; x=1780510483; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v08qm7HHU6Iqudc85UgZ/ZNchG+m9a7a7G8otExlR3M=;
        b=bvmcZHM1L5UPK8Yg9yTnAASheCdWadRi3PyW+bUDXYGxRonwK/jl9HyNTFJCuuiuFg
         FCYLT+Fed2g2uW9fQRFmzompk0zpQUijjl26vyMJ8ut5Sre0PzrBhW4tJjFOWMgPEuNJ
         EdofH8kczZ9M5WkQd6NKgGB0QiEDcHy1UchWYwvsZnIMlvGHP9lF0VCuStzFAmcMFmKz
         RUNUSX2h9NYG1TLKyAXyKIReTun7jo4KdPKnhncscyk52yCf3KOFEMNt0TS9JoMBLagq
         sYnnLwparXhMQgN0/wmu/pDIyAK+SMvuGFbEPsUeFSiYySoXP1qoiXtu2Q9M5JI9VA87
         T8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905683; x=1780510483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v08qm7HHU6Iqudc85UgZ/ZNchG+m9a7a7G8otExlR3M=;
        b=NVWDfdQsx+5JUc8QatgmZmCEANQQQcgrc/wHC8Eu4rEOXt6o4pwMi5RQOeR3Rbr1Mp
         z2+A9OshaMf8sVOZWRLU4dbRNDr5qs26sJf45PIFpUFoFeUl4FW9sU7xV08im+csFquk
         TPeIgZ9B6ISL+CBNT51rJa2G06NMVpoVdR0zzqwhz6BGsRKB0xEVxu3NrclKhwY9fGl0
         0SQIdiS2GHjpICEc6GF0eKyUcgBJNL3EePQVS5gXtSshKkDBLbgJV2rP7mlvC7PwIhD9
         nFew9WjbP8FWLKH1O+3xZBpTkDPQ/+Xy4zh+bfLo0PbgMKlD9ujAEiBj5c2ktNX7AmXq
         UgCA==
X-Forwarded-Encrypted: i=1; AFNElJ8rkRjNa+NyKpDRT6u8NOAMVHk+VYndrHa6BC98UWL8WGBVUwNOUjYecid0/N/PvvHSB9xrz/UCwy9cjkK49gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0ANT/7+SzuRCpACG6kYlpX0SgYi8sHqkSxLrKHYeT8RPYMrM
	Vf9BWKQawttXiW4Ajblr70yIfJQitnRqCFDVRAbCcw4GqTkEZjxkcB5UNq3o9tgV8JBukUl9oAb
	Wjnm7+Q==
X-Received: from pjbtd8.prod.google.com ([2002:a17:90b:5448:b0:368:b689:fb90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3505:b0:35c:30a8:330
 with SMTP id 98e67ed59e1d1-36a671ddedcmr22896140a91.0.1779905682359; Wed, 27
 May 2026 11:14:42 -0700 (PDT)
Date: Wed, 27 May 2026 11:10:16 -0700
In-Reply-To: <20260522171535.3525890-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522171535.3525890-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <177990525056.4121118.3430310763169481740.b4-ty@google.com>
Subject: Re: [PATCH 0/2] KVM: selftests: guest_memfd close() fix and hardening
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, 
	Fuad Tabba <tabba@google.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 22 May 2026 10:15:33 -0700, Sean Christopherson wrote:
> Fix a bug where freeing a VM attempts to close an invalid guest_memfd instance
> due to checking if a u32 value is non-negative.  Then harden closing of fds in
> kvm_util by invalidating fds after they are closed, e.g. so that freeing an fd
> multiple times will fail instead of silently closing the wrong file.
> 
> Sean Christopherson (2):
>   KVM: selftests: Cast guest_memfd fd to a signed int when checking for
>     >= 0
>   KVM: selftests: Add and use kvm_free_fd() to harden against fd goofs
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/2] KVM: selftests: Cast guest_memfd fd to a signed int when checking for >= 0
      https://github.com/kvm-x86/linux/commit/849d65e27bd6
[2/2] KVM: selftests: Add and use kvm_free_fd() to harden against fd goofs
      https://github.com/kvm-x86/linux/commit/3e8a0b991223

--
https://github.com/kvm-x86/linux/tree/next
