Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA652773DE
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730694; cv=none; b=Bck69GriEKbggrKCdCYUBujJsD/vIe5y+oPAtxRjrRqhHFr1OXLATJeTphz/f67svOW9vHLRi2C1AiFHvtcLoywDWYEZVe+LIpTN0oegrKt8KwrdNhMnTn7hoAVHOK8+1ETmrP4nw7KMyXV2PtENYqMO4uX8UZIhVOcHqSfILb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730694; c=relaxed/simple;
	bh=81QSElhrAuFp0NoTuVYYfD1YTPQ8SQOwtUF5mj3cVKU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=XT2Oj3DrRPNVe4Hw4k2Bocr7t7o/nJPGlOYrkRv0rufk6g/jfRGFK0fYQaiiHI7yOW3VARZ6TbBe1B+a1Xx567Adm8mDbCAIR40V/292Ddp118qRtRBh6Vv9VCi63IDc0pyoT1s1eRv6g7mXPv0CT1F0M4+gEwv4+4PJpL1C0aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QoYtIB6/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QoYtIB6/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35980a994d6so26003884a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772730693; x=1773335493; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux7LTzpSlpPBEoYOqrXHTB2itHck9XrWWXlzEMKo5oE=;
        b=QoYtIB6/0C99Hdizm7H5dRlr5n+Bl/BWidtwJNEVBgGYIpRfUyg9PwBBfKnyESk9zg
         BW4eB8bffRoRVvnNtZJNUFtCNW1ZXzrSWJtZ8v17tpWMmLdUnJAqSsQOLpiFflbLuw59
         y4nntCsGv7ANr7KQohKZ1PW0J1585PmpdVRdRdporrmvG6FaecEYHNTwfkdaRCJ0LEzs
         2wgx4KHVLSd6IJG7e7j2b8EVV8q5XaDA/qIfN26ulFYir5Vo/BotTo9FdstXkIJKVZ/y
         eqwj6Jcm09Md+PkL1uVlorI//vIi62/EM4NGjffocDvwvMmNjGKvgbqe1OS0eF5snXN5
         d0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730693; x=1773335493;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ux7LTzpSlpPBEoYOqrXHTB2itHck9XrWWXlzEMKo5oE=;
        b=DDyFOfBcgozhT+JmEbY2+4yR9CS2SgFP2DNzenmVJV6mj4Js+eZRkVq0W7EQQQYQ/x
         /wxC8BXqhPIgfchcyks2/hP+yNt7xQVIDgjRE6QVRYI8J/4udmi1JcOtuQsrvTlDyCiV
         4+tQeFh6EGtbJs0B5dvWM8de92c56cxvzcNJqgRlfrDDuzMehhvnlOQg0CjbQX0MDlaU
         3RfWFZhya4F2juP0nncjYJGx9KBdGy8n0OeVHLdN76ID0j5Z15nDPIP8/pYddWKxgUWx
         C2weWrniN30KjfTHqwThYGFRj7nV0BRL3hlIvap6ey4lJSUE/6fvdKqr22I0b5MglXEF
         usMA==
X-Forwarded-Encrypted: i=1; AJvYcCUCaPfw7VwszyETyNeZuHCsuCKLCaEUz8jP1EFL5hwEi0jz0FQ4iuSszIaQj+ccAPXtQv4Ea2x653l8mT3a3Tc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbah6mAg8toyseLNuTvKcY0KVFT9s1U5BL7btcNQi5T7c/qHM9
	bDMbgwks4PMislSb4ljf5WxcsHR2VjsGX7gIiIyCxFfr6CrueO37A2Ei8Gwjg1R6fTtq/UN6HO4
	KXUuMlg==
X-Received: from pjbpc11.prod.google.com ([2002:a17:90b:3b8b:b0:359:8098:e757])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5285:b0:359:8190:eede
 with SMTP id 98e67ed59e1d1-359bb39b075mr243561a91.9.1772730692749; Thu, 05
 Mar 2026 09:11:32 -0800 (PST)
Date: Thu,  5 Mar 2026 09:08:03 -0800
In-Reply-To: <20260224005500.1471972-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <177272547433.1535745.5957268261931442496.b4-ty@google.com>
Subject: Re: [PATCH v5 00/10] KVM: x86: nSVM: Improve PAT virtualization
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"

On Mon, 23 Feb 2026 16:54:38 -0800, Jim Mattson wrote:
> Currently, KVM's implementation of nested SVM treats the PAT MSR the same
> way whether or not nested NPT is enabled: L1 and L2 share a single
> PAT. However, the APM specifies that when nested NPT is enabled, the host
> (L1) and the guest (L2) should have independent PATs: hPAT for L1 and gPAT
> for L2. This patch series implements the architectural specification in
> KVM.
> 
> [...]

Applied patch 1 to kvm-x86 nested.  I'll wait for a new version for the gPAT
stuff.

[01/10] KVM: x86: SVM: Remove vmcb_is_dirty()
        https://github.com/kvm-x86/linux/commit/66b207f175f1

--
https://github.com/kvm-x86/linux/tree/next
