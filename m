Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7523515E7
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481093; cv=none; b=sVpSO5lLaLDK+IAC54QKHqBPtgi1C//kZnxUPduSkmgIUjmJIdncv9DTSGTWjdcS8cijJ7YnHhlg2MAfu7Nqbv5Nqg25DepV7E4kLqGr3OLvUJVXOyl1/WFbcGUSDIXWv4SL6FmzN8yZ2W7ExCFwelDNSHK/QAS7m9GjJZIlEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481093; c=relaxed/simple;
	bh=0gJ11eK6vyMd1f9poJ8vcFJX9j9y0Pob+2gbkGLs9ew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XTR21jZKcoFUxiRc2hGRrKpPj8G0PhpMBsRSiarkcbWTMvR6aDxtqh8RfTHXUd78iVgBiw+7wx83FzCJjNZBK56AR4JOBW1v5ejtJSUxFWbGGn2qtBXPOFnouwto3aaE81wWGDygxuwRJMFg94vOzVZr9UpdHAoNdFnq16wASP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NFAdIlR0; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NFAdIlR0"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso83334985ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789481091; x=1790085891; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANfnbIvY5HHUWypRItLWP/OqJoXyH8gPZpwc115le6o=;
        b=NFAdIlR0pH7f6RKqyNQtJVW44jLxxeFbp8GfJbuW1Ruly5eK/hRhx+TB+XTWsPJILA
         ShqIlDV1YZVBV7MjYoGT/M6twQ7z8h0vzdZZT0sffVOwFqudYM05YNhwFFmpUlyk75zh
         ULzz54TfZ//Z+Mbqou5HGvOo3yuV6zs+AEwO6iXkMeCrCLf9Puo42qqHhBWdWtdmbx6S
         6hxQKNVeEa/uof48yivUXcJnkTwWw5VtOekvlshFmRaEweVPpZOdwbuStkhj0mFBc+b+
         azfH9gPMcyramvQAMt5fFlK3R3QfVDRZAQ+8gm8lJaF6mZBtb0NFgxm9ZGNSgPaqEZZo
         q63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481091; x=1790085891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANfnbIvY5HHUWypRItLWP/OqJoXyH8gPZpwc115le6o=;
        b=2IDEUFoB9C89ghItPM4QWKfqfdCIlNrCv13U54bQuHM8BxrDZq+GyFB3kA10v7FlGp
         2bPgHMrMwo4to4GDf9GVl1H2NjAhX+TfMmIe29is7u6jA83sSmZxc566hLEfejgo08aD
         6Gqj785HFPWcImW6DiJ0Psok1TevCg5Ef/7WbciLO3ykl79AHf4II2RATfe+uR6fDYvb
         SYgmTSSaataXntepL7H3pLCzdF6AWE0L9UNurZFTqU1/ideXxeyqvFppHLKTt25SrNNl
         0PsTS4xVvxCjJ3e//FlHqENi8xqR/CXAAZtkVgoRnOPbIq3uSb0LygN4LhBUFMmMlf86
         w6Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwNQqZE+cx3KFHm7dUp4VZK+OwvkisrCrTzILWAOo9jfmrAnqH7a2Poz9x3hGFNyOmHbSm/hQJonKpYk7qQ3mQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mW3VQsWxqjqU2g2vc9oHwJLsEVNlwtyu4yL7LsZk2r+EjnuTpz
	yZnkE9fenuvXBvK8dX2G8JZstWAOqnvFZvb21GgS4agXR2C91/oV3IVNrAnG5L10ztnKqe+g9MI
	lltU2rQ==
X-Received: from plq6.prod.google.com ([2002:a17:903:2f86:b0:2db:7a1f:5d7e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d488:b0:2d7:f0:896b
 with SMTP id d9443c01a7336-2dd6c6c0d27mr131092555ad.13.1789481090362; Tue, 15
 Sep 2026 07:04:50 -0700 (PDT)
Date: Tue, 15 Sep 2026 07:04:49 -0700
In-Reply-To: <c5076e4a-0335-4ed1-8049-a3ddf486ea03@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260806011536.4172258-1-sohil.mehta@intel.com>
 <20260806011536.4172258-5-sohil.mehta@intel.com> <e6220b0e-0f5c-435f-823e-318b527eee8a@intel.com>
 <c5076e4a-0335-4ed1-8049-a3ddf486ea03@intel.com>
Message-ID: <aqlQgQgnLDf2CHqx@google.com>
Subject: Re: [PATCH v4 4/7] KVM: VMX: Implement LASS violation check
From: Sean Christopherson <seanjc@google.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Kai Huang <kai.huang@intel.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Chao Gao <chao.gao@intel.com>, 
	Yosry Ahmed <yosry@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Matlack <dmatlack@google.com>, Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, 
	Kishen Maloor <kishen.maloor@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 14, 2026, Sohil Mehta wrote:
> > Yes, this could be a matter of taste as taking and going to maintain the 
> > code. But as a reader looking at this, the logic was not that easy to 
> > capture at a high level.
> >
> 
> At first look, I found it a bit hard to follow as well. But instead of
> splitting out the logic into 4 static functions (which have limited
> value to the rest of the file), how about we add a high level comment on
> top of the function?

This is a great idea!
 
> I'll let Sean comment whether he prefers to change anything here or
> leave it as-is.
> 
> Note, some function names in the proposed diff could be misleading. For
> example, is_user_mode() checks the IMPLICIT flag in addition to the CPL
> which feels odd. And, is_lass_enforced() seems like a generic LASS check
> but in reality it only covers the supervisor data rule.

Yeah, this is my thinking as well.  In most cases, I would agree that we should
make the high-level concept as easy to follow as possible.  But helpers like
these, and even is_user_address() vs. is_supervisor_address(), highlight why I
think we should keep the more open-coded version in this particular case.  IMO,
the control flow isn't hard to follow because of poor coding/design, it's hard
to follow because the actual behavior of the CPU is complex and subtle.

So for me, this is more of a feature, not a bug.  I.e. I *want* to force readers
to slow down a bit, because while the basic gist is indeed very straightforward,
I think the resulting code is actively misleading if we bury the complexity and
subtlety in helpers.

That said, I love Sohil's idea of adding a function comment.  Someting along the
lines of "The basic flow is this: <example>, but the actual behavior is far more
subtle due to many exceptions and edge cases".
