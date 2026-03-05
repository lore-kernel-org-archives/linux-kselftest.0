Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05FF1D45E8
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730508; cv=none; b=rWpo4izKPTIZuP5XPuPvxusbriJyDKYwH6gQo6uCGZ3eK6sL1OZOsTDyKPTfHjNQUuuxG1sGcAuqxM0tRt7t5TO2qgqfTRPfzyYDuKvBIBRVmFPjtaHRf6VkWTVWQD20MVdjcf1+2zHKFDuczHft7LVQIMZ9pxGQddlQotXPkO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730508; c=relaxed/simple;
	bh=O8F/OpKEPqoxckJjW/M18dzfpFqrB6MLhJmUth4rs8g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OU9JhXkKvAuqepADsA6yZYBYd8SdAanrR5PAKkIgXlXiGLXQZtxC6TRw6yYJSYguoZl9ZWzk+XJrOXpAFdF17YckMAlCekj/OQzCz9bmkQhB4M3Y014BfUdH3EaODRQ3l3tNZlTc2046PaKwsoJ140BUPSjMwqt3W5Y5fU2FgCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NvqzQXr0; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NvqzQXr0"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c73783c96baso1157488a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 09:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772730505; x=1773335305; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tF1alokY3YId0A55xxADUd9WJcgKIT/tUWOmNO1S6To=;
        b=NvqzQXr0QwJ4ZFCD+BOxYx6nRvQZCk06NCzBm4HBHGRHD/L7X185PK88Foso0frCod
         6f647Ae0GtVGAFXwA9HUHHINFCHF5mN1Pr/tIyKiyGowsuZgNEwSBOhQM8QZQEEmg0ln
         yD//jdhqsH3MaXzHJ9xai+mBtP3f0DX7U45HcgB5Cof67ZzdtWtHy3D1PzOJVABpLpIB
         3C7CiD+mezX7TJyGPx0PU4ToIJQWuYNW5XU8PQ6K/OF/gxBRdx9lEayUn+/zNTsQllM8
         uV5A9DmsRP4cG4ihwzSINlWdh5fGPWmjk+IYASecGRM+qTD6qe4ezX0TDuDCC+Ja/Dzn
         L0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730505; x=1773335305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tF1alokY3YId0A55xxADUd9WJcgKIT/tUWOmNO1S6To=;
        b=k2blNa9sN6TfhVFf9I0bphFlzt1QutqsYuoP9Z5B9T/81jLiJxIEMHbsXEeRA02Uho
         CrfX8Zen+3qKhVs4Xh6LNP0KWsWBY7o0Q0YGJG37FLOGBI4BX1dwb6C8XwMQ3+iVypo4
         12rRz5tuSAX+LRnvSWurv11PFjjUps7epvZIzFESyYgCVVqDMVlsYyD5kBfKf5u4WOuQ
         eAzK4mH8ovcgsnfTWAoWr7MUlBzYkvSe02njlnyeMd3KGPHaadcCAHdvgZoiqkUJMOCa
         uykSNv7NgGIljdYE68HEvjwZ4PYHNL1017DAFcsE9pO7+kxFSaduMQpVo4+fcBp9qJER
         hdQA==
X-Forwarded-Encrypted: i=1; AJvYcCVYnHQOp+by4gDyJsCOLSRukCUzMwDl34fyrKQjxIEq7pB5PXzR8W+5PG4odVelw3F/Nlepe2HCudBIuYgw1SI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCzVBxaHMcyzzKkY4D/AknG7Tk8jim32cJbGnAYFMKckjm+QS
	yFpKt2BR+VKS4dZ8LXmCWglCTX7oD6Ni2Ku83SEtzUfkS5Gwwxb1hw5fgOT/SljY15CtNrI162O
	jPHNFrw==
X-Received: from pfbhc17.prod.google.com ([2002:a05:6a00:6511:b0:829:9082:12ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:7494:b0:81f:4a06:6f5
 with SMTP id d2e1a72fcca58-8297292ea94mr4681316b3a.4.1772730505109; Thu, 05
 Mar 2026 09:08:25 -0800 (PST)
Date: Thu,  5 Mar 2026 09:07:31 -0800
In-Reply-To: <20260302205158.178058-1-kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260302205158.178058-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <177272959239.1566071.6075460406863903774.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: selftests: Increase 'maxnode' for guest_memfd tests
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, Kai Huang <kai.huang@intel.com>
Cc: shuah@kernel.org, shivankg@amd.com, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yi Lai <yi1.lai@intel.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 03 Mar 2026 09:51:58 +1300, Kai Huang wrote:
> Increase 'maxnode' when using 'get_mempolicy' syscall in guest_memfd
> mmap and NUMA policy tests to fix a failure on one Intel GNR platform.
> 
> On a CXL-capable platform, the memory affinity of CXL memory regions may
> not be covered by the SRAT.  Since each CXL memory region is enumerated
> via a CFMWS table, at early boot the kernel parses all CFMWS tables to
> detect all CXL memory regions and assigns a 'faked' NUMA node for each
> of them, starting from the highest NUMA node ID enumerated via the SRAT.
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: selftests: Increase 'maxnode' for guest_memfd tests
      https://github.com/kvm-x86/linux/commit/afa85076709d

--
https://github.com/kvm-x86/linux/tree/next
