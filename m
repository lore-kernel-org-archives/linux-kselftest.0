Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504160;
	b=uhhyKrhJpDPppjEd4ufjKwBjqcl+V8WXot+dvqqrLIzsa8qrwW3x00TNvZzxUvtkPINO
	 +9nf9hHC9Z7/NbMdqFHCljSp4fpt3HTouYyM/raYYFjxQ1yIjKyaf2slcPAJ5AscCKSdu
	 K3KFrctlmWi3lhPuz8Oob5Ckox3l+G6wfUwo863m3u60o1LIAGEoDUSJgixBNVtvqVz5p
	 PzV9Pn3xe/pIbgBDAAPNzQ1+zlymtGhL5AqI7ujDASpqx5AFZvtzO0mEREnQwkrXivp0h
	 9PiJTgRunlAeCmAz7V3MfaLVVI3XBj3pROdWWlMSqnGg9Rdjb/mdCpcJhWSSYg/Tssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/AzCjpFBcsxFuApem78XlXxlBTt4SuIRCgZJ1fWdV1M=;
	b=qmdfaKWZf8+MUwJZUgFbvjAWDjZ5QtPLlrct/1U0JiqscuyCoEpV/2ocXb+Ca1acTlcH
	 POuwSYCYZsz55lVR3+pnt+IzAaHNBaf26XxpXScVDIzZ7bVVGmD7U7rNEQljrmnz8FyYu
	 ihPzjisjye4GHG1wtscndZw3sjxcayxAd9DJMm4PWzZjNl92Cm0aSaEimmUpTkt3vMfPI
	 jrlVJzCYppUs+odHwTFHSMCWySb6ZTaaS7lLq0KF9aH90UA4uVKPxrP28IEi2l26HX5b0
	 p3S4HYxht5R/VrAaIDFIEpDdcau+8SMd97aL5/MvxfM9TUXRr1u3tvHR/82E1QNXCrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=El2U0FFa;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794E606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 17:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4794E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=El2U0FFa
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb2437d752so1415495ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794504159; x=1795108959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AzCjpFBcsxFuApem78XlXxlBTt4SuIRCgZJ1fWdV1M=;
        b=El2U0FFa/1kTNlfAoi4s3lVxhBnMS+TuFDyQDMzpDozCU6OYPkMXzTzlLBheS9ebNi
         V0Yd3DCF7EeGNz2s9mFP+56Ruqn5gQnxeYbpeRRJbqvh/Lp4jyBdq8ocd/vt5KAPkAKT
         D2VNZQrDAoe3xJRCdLhvJxcSdqmg8Zi8tz0zysXNjqZDq7aPJfbnYWJP5HY08syecLfA
         bcg/mgjsaMvtszdLpZzl6hLZpgAK2xSBvLRHDKfm82rvyrOvqxUJhgBscGukgwQfbg2B
         92fjHtg2Yb2kMZDDZug49EaL6Pb0qkXMtcPvRdekwPocdqBwhwGYlBYOHOlmPkMzVAR7
         BhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504159; x=1795108959;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AzCjpFBcsxFuApem78XlXxlBTt4SuIRCgZJ1fWdV1M=;
        b=E8xxDeyvMto+ota5eer5tfPCauO8g2YDlKApF5Fx97qpjtxW+l8wZxfcJZJ6UNgoiK
         SbrAGJnaCQv6K7aZakRCZbLOhcl45839yU1eIRE+py/2XR8K4T9OihcNmY6wdHPU+36j
         MgKCuVWsfKIaSpnrTPTg/L3EkZjyPexl0l0FWyXzJ+/3ZTWRiRDpSDm27LU96VYaz2fm
         GeGtb0RH29ydqY9vyS9N7wvb/yYot43gmDJ0Z2cFwVTGCI+aBocuYWQmM9GQxweVwRuv
         2r8IUKFnU13N4k2fOJZPPtSc5fCBWmllpjDhi/kGWeeNmioe/Qfi7zQqVEGsi5fgwK1w
         QMww==
X-Forwarded-Encrypted: i=1; AL+hErGqMRobyFIB71exCmXxczQM0TH9Np25PY+IWogYI6BeLRbSeHogzSh88MOIJ7D9BVi70/Rk9h4EgPN4sO7lCFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/prVk0zRw+9DUUcHsnjp8J8DVU42G3Qc4FooI5kgfdUWKqTAZx
	HHtr/jMfwou3fI0QD/CxkO5R0DzfHhGkAf0uSpXftaQMNmCz73b+wdBPe0S78ZjQcApaB67wh4V
	5LlB6Sw==
X-Received: from plgs10.prod.google.com ([2002:a17:902:ea0a:b0:2e9:5b68:4b7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c8:b0:2eb:4a05:4b4b
 with SMTP id d9443c01a7336-2ee0dcc3023mr420945ad.49.1794504159130; Thu, 12
 Nov 2026 09:22:39 -0800 (PST)
Date: Thu, 12 Nov 2026 09:22:38 -0800
In-Reply-To: <20261112144220.30801-1-dwmw2@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112144220.30801-1-dwmw2@infradead.org>
Message-ID: <avX13o0qRkidIwWo@google.com>
Subject: Re: [PATCH] KVM: selftests: Drop stale exact flags check in private_mem_kvm_exits_test
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Anish Moorthy <amoorthy@google.com>, Shuah Khan <shuah@kernel.org>, 
	Nicolas Saenz Julienne <nsaenz@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 12, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Commit 7d0afe669374 ("KVM: selftests: Take into account mixed memory
> fault flags") relaxed the memory_fault.flags checks so that they only
> test for KVM_MEMORY_EXIT_FLAG_PRIVATE, since KVM may report the access
> type alongside it. In test_private_access_memslot_deleted() it added
> the relaxed check but left the exact match above it, and with the
> READ flag now reported the test fails for me there:

Ah, this is against kvm/kvm-memprot-v4.

Paolo, what are your plans with that branch?  Sashiko had valid complaints, e.g.
against patch 1[*], so I assume the branch won't be merged as-is.

[*] https://lore.kernel.org/all/sashiko-outbox-193903@kernel.org
