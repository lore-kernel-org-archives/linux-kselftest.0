Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CBF47D952
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 18:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905696; cv=none; b=FFeIG1PWB7FyICHIUoR1mpn4hI3IOaT3L9kXGHZJ8YOLs3HLgLd+V7P+07sFwbH5V2F7v0BFCP7vXiqFXRgr6LndrwVMeHBZCEDamF3wETXzNnOTUZRpfjB8jqC8206CQxRRJswcCzWTonmk8XahMEnuUNZrtnSQSIbL1J+LL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905696; c=relaxed/simple;
	bh=Ov8QZgZnUCc7NB32UwdQmqtSQt0Xv+hbTNknT4Kr0QY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RikHQvA2aUcmBXsFNP7nS9/tm8SOnfRyTi9Yx1uX36q3SJWhGiE89MK+tPbwyvoz+Oqp2HMClOB1lSHPg3TrrCn3S3ZCwAlRxvwvM4+E13dVTBoQ9uhaUOvBeGZSUceTXP15S+MXFURVagonf+EOkDH9xueWCO5k9sOmKZA1tOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dtq4+Rpn; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dtq4+Rpn"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bc7f9b2213so86865745ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905695; x=1780510495; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JeW9vSkTjKc1k+OCVdMPOWZMlOUToLyGE6RjxbEFUFk=;
        b=Dtq4+RpnW74jwbnOha0QJUYGtunqDQkkuQ7ytf6tOskGn82e9No4rHtezSa4FINGWt
         O4E96gA6UkR34kscQGltepHJa0MJR2PO8uVLK/9enMM8ucib4gQHKg2aK42kIrO+ZUYS
         b0OYD9KI0jcHkR8miRjFYVw0lz4KnnmdVa60ks6xSzUMVarcKL7XX6QBkfPHOE37xjA9
         y65vWlgfRz++QVNqjrkKvEA9A4MUTiqfXui5x58e68u+cH/DvxeJMUv2p8tI80Fkzan3
         DIBVfUDc5xSOlT08Nx43Bw6Hl9U3Vl68KuR7IrKglXYg9VIkqr9aSshsC/GaF2JkBw0B
         DYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905695; x=1780510495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeW9vSkTjKc1k+OCVdMPOWZMlOUToLyGE6RjxbEFUFk=;
        b=kI+IZW8u2dgiyHW41oc11ioastYRllSwrd+j2RrI3LeiWeEuy5KFV97HZBWvoFzy0N
         xP736ljyEvsEAgv/1cG6fGcE0TEQ5W6yadPOkMUmGNNjJguNGF0LPZaKAha7AQXNS1C5
         wO43dXfVE5xXoJw3l9iKNnyRyvgAsx/GJ5M9t9MF3PIuqWg+olM1rv1j4mZZ8MKYs+lo
         YaxydQ2XeEFtnbSwhyQxevN2rAW0z+HZtUYKmBQqebCfwkPne2x9zXfWLe3F7gBiXFFa
         7t52PBqY/GgSg2asRU324szWkwf1EDrx5199FJhqSIm3gpKHmLNj1Yt8YZEEhTVBXh0L
         oKAg==
X-Forwarded-Encrypted: i=1; AFNElJ/F4P5lkYpGzXMEgGFeGOJmV6BQtbSy3Nw6b1gmqtPH0JdyH6dbg1lbyeacBfxTarLCeHFLtPG8KgKUy/qGQhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJh3hP3VyRupv/ze/bdvxTR7aVCZl6oYHNEftE0U14HbTG/vH
	nhrrU3Rnx3Ao8XZWkkL+UoeIPg6ydjI6PPBKYFWCza2gukNmwBComWWsrkKFaAtJPQmhQa9wCOK
	1wGu/NA==
X-Received: from pglv10.prod.google.com ([2002:a63:150a:0:b0:c80:15fa:8bd5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6113:b0:3a8:2339:24c4
 with SMTP id adf61e73a8af0-3b328ed61d9mr23386909637.26.1779905694394; Wed, 27
 May 2026 11:14:54 -0700 (PDT)
Date: Wed, 27 May 2026 11:10:20 -0700
In-Reply-To: <20260518071008.2091335-1-ZongYao.Chen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260518071008.2091335-1-ZongYao.Chen@linux.alibaba.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <177990532788.4122200.1656663741093651330.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix vcpu_get_stats_fd() ioctl name
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	ZongYao.Chen@linux.alibaba.com
Cc: Shuah Khan <shuah@kernel.org>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 18 May 2026 15:10:08 +0800, ZongYao.Chen@linux.alibaba.com wrote:
> vcpu_get_stats_fd() invokes KVM_GET_STATS_FD, but its assertion reports
> KVM_CHECK_EXTENSION if the ioctl fails.  Use KVM_GET_STATS_FD in the
> assertion so failures point at the ioctl that actually failed.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix vcpu_get_stats_fd() ioctl name
      https://github.com/kvm-x86/linux/commit/2a3987540cab

--
https://github.com/kvm-x86/linux/tree/next
