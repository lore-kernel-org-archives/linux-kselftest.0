Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD33AE6EB
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 23:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785279972; cv=none; b=Sis1L/nSjKxQBzZCRGRA+5l708woMo9+OJT4O2TmdZxHi24Z837zfPXZZfjOUT5rI0fbkrY4mq2sCy9c0DTnki1cJWuRnstyU6Ty0FSGrAs8c651GGDpBgwY/YAw+rfbsbcaJwklTphuN9JByiF++StuiAvmC9QRGB4CXFAh3UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785279972; c=relaxed/simple;
	bh=DogBQgPNXswuGIoml9u4fiZ1siHOFMK0NYoj1Fcu0ek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZgqNlDdrttJZ9eAcbwR3iKr4PTjHjVCFfccxB0kSWNYuhZ+ArUBwbDAUlVU+El+deqkRGl8Qx19Rs41KId8jmXvBsyJdXXd36llJWJ71PMc1nbQpQkatLRBPYSS1ROC6DwcEl7sQl0yU2RjXHdsMCOOKXVL29nL2LBOWUD56Ptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XHnP7TLQ; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XHnP7TLQ"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso188748a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785279971; x=1785884771; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIqmps2dhv8tBsBvZD3H17qhoPMotCZtd+Geu7ae0Wc=;
        b=XHnP7TLQcqGrUbh4qia9Wr/2HZjShWsF0N076n1po6boeZ6UXtU2NtkpEbfbggHwZF
         sShCsohlVFZvoAywE37ZQARO2INQQyh6FJ9ptcxqFHHNtHMWK31Nk0eWQpMXS09abnDi
         YkLWtoWza6Kh6F24bcEqvsiAul5NaG4s7H7OaRYANI8ZBDjRqrPUxBjrl+rxGOeQ5qh9
         fzy0CwF1Slb7pivI5QShWDCnyQZfhwZRQCx5ya8S3MSVcYdt6ykHUo0h51zTFLBMRlW6
         V0gvIMOYEtvD0bkKD3TsRlMZp4oQ4pjnsqBVt40tuDBSSq9tQaEc0FoF2so/RnHLAMUl
         kGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279971; x=1785884771;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIqmps2dhv8tBsBvZD3H17qhoPMotCZtd+Geu7ae0Wc=;
        b=K/Br7lRDj1sXZDVgwrc7W5uZ0Tjnjo2NQ0Da1cb3jA/0+jH/cknRv1d3K2cfkKi3gd
         hliZZBzs4p1thg7843k15LAXK/z5XhIyHsmeZyy3tzT0/5KHb+2c5JxIgR1qWZzLVEu7
         qtQ0OtKR1W0Ov7+TpR1JUzncP3zGOBLdADPlq02LfY952sJdLokigIluLvvWhmpVCFfG
         xjoSVZonqG7aKUdfmIYKLAlIlVUw1f5aRCoAE9UKScYuW1NjfDgrbkh2dRxZGhijUKgy
         Q7eiEuWUhTY5D7Ea319o3U9++XaZv7SRxA7pNfmj1GLqCrxDzrMKtvrlnAs1tPQNk+D9
         M4zw==
X-Forwarded-Encrypted: i=1; AHgh+RpOGbio0FXLK4iwitRxhpU2ZMi9OwMGvp2mgUDDKn63EDFcWMN0mluFqOpx1MR/bkWBZ6+W16AH3zbVdrj1/8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhHNhlJ/c4wOA5oLQln8dMtz7zL4W6UJXY5JuYsqJztZbv8lg
	7tU2duDDKctm1penqCN8GgLrw7A9T4yMD7y/RYnBO5RXkL8g1mUQqEOWbOXLC+LH1SGFaT+tQQs
	sHpwa1g==
X-Received: from pfbig10.prod.google.com ([2002:a05:6a00:8b8a:b0:848:478d:6efb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8c5:b0:845:f107:38c8
 with SMTP id d2e1a72fcca58-84e9332e63bmr4750014b3a.47.1785279970563; Tue, 28
 Jul 2026 16:06:10 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:06:09 -0700
In-Reply-To: <20260728144954.355376-6-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-6-dwmw2@infradead.org>
Message-ID: <amk14dmn5j7Oov1B@google.com>
Subject: Re: [PATCH v7 05/36] KVM: x86: Fold __get_kvmclock() into get_kvmclock()
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 28, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There is no need for the separate __get_kvmclock() helper; just inline
> its body into get_kvmclock() within the seqcount retry loop.

Actually, there ends up being quite a bit of value if we rework the inner helper
to be all about the master clock mode.  If we go that route, then the main loop
is pretty self-explanatory, we can use early returns instead of continues and
subtle fall-throughs, and the indentation levels go down.

	do {
		data->flags = 0;

		seq = read_seqcount_begin(&ka->pvclock_sc);
		if (!__get_kvmclock_master_clock(kvm, data))
			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
