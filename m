Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82F63612E8
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 15:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770996397; cv=none; b=AKjbYqYGmOEISvgb27xzKwVkMuV0Fv1B6P6UpFV+8rgrodE4XPo7o5cQNf4zEmgzyG716PiPpwSE6UrpMgyxcW8xxfcegSBsqPxj1ecNQ0aPJLkwHf2SRj88dI8dbNNKjWmq1rOpPAw15u76X12y05lqVb8E5U1Co1gA63PrCTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770996397; c=relaxed/simple;
	bh=pi30Pkn9PzCg21hY3eOknzX2n23fwwsolli8HC/B4fs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ivSbi2zIYVEaTyumbO5uBrDLip6BdwmSIcJjOIQuudejOhX972fZIlvkDcVYjlq4UV3UNp4K+ZmrSBpcNbtF5v2ojovNSzLN3DSf+elQ6FupMY9nAN1dkW9b8I3L9/YgD56WXysskIC8xspPRC7C7YiSjEnU8ZWV8QswdMvRDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yT6C+EOv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yT6C+EOv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354be486779so3141359a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 07:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770996396; x=1771601196; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4NZ9EGPtUS+7RRQiNTrvozs7Ig+vPBqmlPOteC+yYic=;
        b=yT6C+EOvEMKLYtMSVsK0xda8I99aVSiS6HlrJlYxo02SMBeU273Hm80fn6lZDGk13p
         aYQ65emOT8i8EvHzoNI1XY/MD+0yKeD5dBdnuiNTfu0Z3JT6dSV7Ae5m6vk6QCsCE1G7
         y+6xUn9CD7AJxGK7KEFgIiecU8ry2WwCCT+HrWxUJtp4JA2ThKVZRCR6X7yszcrsVBHe
         jihlvzIkIAQPOZaswKj1THEgF3KK4CWoxEo+romZwP8r7i+WcGTgixl9rIxu9sdBsk/y
         Yr3uyizCxyEu7r+5yZPcV18lIECCtbMhgrKAugD7QL4NXyEIOJk7nwNgKQkCdRhvOYzB
         eo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770996396; x=1771601196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NZ9EGPtUS+7RRQiNTrvozs7Ig+vPBqmlPOteC+yYic=;
        b=cP+HZruPKHqYdBAZLpWn9RPoYLecVnhPD6h1fVC3f/CFiNFwViZKqYPOhU7bW5f9+8
         DoBBB1lX1vLiZcYHDBhEm/64qXPWOWO30D1TaMDpAZiwhH5dzyr9YGsKw5xPGdVKkkLV
         2fgUqOZ5hSJZGYF6fcqH89vsZykZh/fQ+yxvdaAoT5EqdUFoKsyzGwEq7MoGig1mprbB
         D68tqnmddRm7DnUE+1xn4YD53is7/K98wWEYH7xl9CbH11oPw0KMMezGAO3dyZyaiazs
         1nj2O7eaaom8W+aHxN6DZelv7+U2pI9zPeG7yHNSWoAdEQbv9WvbtES58cWUh/xqjqTb
         VGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMJMR+jNPQ9Ufm1yhThbUQ1rmz5Nci0v3zhELKw2QwftUbrM2Uhjp1Myb/pVFHiJFrtn0T6Ls41jxu1nKhU1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAL3IqX0y4BbgUh8UerCdGOpSHi1LZoOXotPxyFKycPTQzh4MI
	lvYe4hq3yLMGlJLQtxPAQFIb3WljXw9wqBC76Dms0zQK6fbIkjlK4RkEqzwUnP+UnE3ofRyNyTQ
	e0d8blQ==
X-Received: from pjbqb7.prod.google.com ([2002:a17:90b:2807:b0:356:1edc:b2a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc7:b0:354:9b26:cdf8
 with SMTP id 98e67ed59e1d1-356aab9a321mr1928853a91.10.1770996395984; Fri, 13
 Feb 2026 07:26:35 -0800 (PST)
Date: Fri, 13 Feb 2026 07:26:34 -0800
In-Reply-To: <f72gve6ia3aqcpkqxzuwnleaxzxmesapzmoaus6bwaibsq5f2g@hgq4z5mqxykh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com> <20260212155905.3448571-2-jmattson@google.com>
 <f72gve6ia3aqcpkqxzuwnleaxzxmesapzmoaus6bwaibsq5f2g@hgq4z5mqxykh>
Message-ID: <aY9CqmlpZb2Unh0y@google.com>
Subject: Re: [PATCH v4 1/8] KVM: x86: nSVM: Clear VMCB_NPT clean bit when
 updating hPAT from guest mode
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 13, 2026, Yosry Ahmed wrote:
> On Thu, Feb 12, 2026 at 07:58:49AM -0800, Jim Mattson wrote:
> > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > index 0bb93879abfe..9850ed01e16e 100644
> > --- a/arch/x86/kvm/svm/svm.h
> > +++ b/arch/x86/kvm/svm/svm.h
> > @@ -434,14 +434,15 @@ static inline void vmcb_mark_dirty(struct vmcb *vmcb, int bit)
> >  	vmcb->control.clean &= ~(1 << bit);
> >  }
> >  
> > -static inline bool vmcb_is_dirty(struct vmcb *vmcb, int bit)
> 
> Huh, I assume the removed of vmcb_is_dirty() was not intentional?

Regardless of whether or not it was intentional, IMO it's a good change.  KVM
should never check vmcb12 directly, and I can't think of a legitimate case where
KVM should condition its behavior on vmcb0{1,2} being clean/dirty.

Unless a v5 is needed, I'll split it to a separate patch when applying.
