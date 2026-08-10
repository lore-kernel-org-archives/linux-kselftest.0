Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4D427FA4
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 16:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380150; cv=none; b=c2PnMhVPPF8ViHJbk68BwWttWyyt4ATaCXp/oa1Z1skFdB4Sbtyxqle95deAtIBEdMLsI/GcUgXVs3gNoxg/WrWBwYIEEh2Ct2+deBEZBRIFrdByfoyR2P6Wjxh/UpEB5Ps/wj/dWFXex+wIOVcE8cDmWIGYyb4p8BGpdkYIEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380150; c=relaxed/simple;
	bh=18EoA/xa5wu6UGPt1xX3ZYgfinL8Hx9sPGkt/lCoJjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ge6nTpR1fRh1n1SNhRsOjnjfYA0xwxtT7gB/UdWjLkf7rRyyevF8Il07WuJXbYOCh72/lnU0Q6VCkrGhAySrT/bwI9LBpX0/x+vlhIM0V6ovJuRqvfcVqVXTLOM6kUjBgj6eCfckK0jHjK3eFx0f+OE9EbkWKQULInl+3UOW2bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jpuSgq4m; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jpuSgq4m"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1855379a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 09:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786380148; x=1786984948; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1aMkrKlnySSkZTh98FOauiGYQlFOQqftaK5JuEjFP4g=;
        b=jpuSgq4mBdoqDIqBu5MWtjnrFjX+rRG+cXZfpPrMFu+h9Zt80jvSDNDr25dtPqKO2C
         aeXSUzqrbH0KgnizB6oQrLw4eJXA0YvUzretg3TGcV0LTH+eRQGubU4KcD6qwb/dLiGA
         y7YOo1dO5n/cQxT/1gN0jUnFJCxqE2cGWfbYeSaBD3B/s6e2WRGyTcR8M0aovjeFxfYP
         h8ZbmFHdCp12b/irvKmAUwxU3rh4/JXZNJHMWhz324MsTN7I4IShITZoQT95fJUw3yG2
         cwdotsxzogUPJhNPbtMGhwYSpvfstsVeJ6C4ArV1aK8cIc5+61atGvrMR0w25Th7zLZc
         KqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380148; x=1786984948;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aMkrKlnySSkZTh98FOauiGYQlFOQqftaK5JuEjFP4g=;
        b=B9vVEjgyRxxDWgujb7zaWEA2/LewRJw/QnKRynpC6Uf1zk4U5n2hgpE+Ax+3RZIeTw
         x9Gmbjq1KHW5VkrHJ3sBVm0pvF06UsuJgEOsXBZmVROQEkvo/t5u7LlhyWscQHeS2aEw
         WTQ2PPDmgDTWXQnQRlzcrCI2s5EbuVhFbeMwSyG/H/tD/wIWplGYX8QgGknDXBG/6hZh
         /u5CT+G7fw7tXXhy6T4D7wl3K5eumXNqdr8cs8ouyyufkvZABuHUV/+4p5GpPLahFSCM
         TqmE2+IfIBXAh+R6o7yAFEcgreRYdhQibV0bcShibLipqxD1iz014SPYhPcVB7w88gR0
         DFfg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1w0ok/RURXH5vfUfsoDe15asQ1J4/qlETYmoWu0cUp9sleUQNLCzbb39owXyk6rXjyRIl71G4q+hH+NnXfC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySFzwR7im/KZ9TTHOFJliP4HEvhoZNAUs0l5dA7Ic2pVsdOuql
	zk4eGgVoKzk1zZslUJ/6ylazHtxp9v4Ay7LLFbCACNUW3Ul+1v8gEE4iyjLYM99GjeNqJWx/szc
	Ik0EhaQ==
X-Received: from pfbkr10.prod.google.com ([2002:a05:6a00:4b4a:b0:848:569f:3464])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc5:b0:847:8dec:1427
 with SMTP id d2e1a72fcca58-84f4fd9f647mr32987651b3a.8.1786380147208; Mon, 10
 Aug 2026 09:42:27 -0700 (PDT)
Date: Mon, 10 Aug 2026 09:42:21 -0700
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <178637989949.703398.16006467247639187150.b4-ty@google.com>
Subject: Re: [PATCH v7 00/36] Cleaning up the KVM clock mess
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"

On Tue, 28 Jul 2026 15:39:40 +0100, David Woodhouse wrote:
> This is v7 of the series to clean up the KVM clock, rebased onto
> kvm-x86/next (patch 1 of v6 is already merged there as commit
> 710b3a30f407).
> 
> The KVM clock has historically suffered from three problems:
> 
>  1. Imprecision: get_kvmclock_ns() computed the clock from the *host*
>     TSC without applying guest TSC scaling, causing systemic drift from
>     the values the guest computes from its own TSC.
> 
> [...]

Applied two more Xen patches to kvm-x86 clocks.

Given that KVM was updating the wrong sub-leaf (which amused me greatly), I
didn't see any point in waiting for the new uAPI updates to yank out the CPUID
updates.  Holler if you feel strongly that that change in particular should be
bundled with the kernel that adds the TSC scaling uAPI, omitting these changes
from 7.3 and waiting for 7.4 is trivial.  I'm just trying to reduce the number
of in-flight patches we need to keep track of.

Thanks!

[20/36] KVM: x86/xen: Prevent runstate times from becoming negative
        https://github.com/kvm-x86/linux/commit/36a85200643e

...

[22/36] KVM: x86: Remove runtime Xen TSC frequency CPUID update
        https://github.com/kvm-x86/linux/commit/7d3bd21e457b

--
https://github.com/kvm-x86/linux/tree/next
