Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589843;
	b=H4OrJ38TqP+beaLlTrz+BopvCOq0sJowz6x6trljH43ZzXHlyXDzOgmcTYsMFbOi7vc5
	 S1OWj0g+hCwUHgBr9dizjsB1FgIYzVgZBdbNdEs9QpJjC6qqI64LXewYl+GFc1TYlywq+
	 PPbprgUuYDm/jU+3K9pR+CSb9nWa5Wl6rS608vymPl364FTg6qnRE0bUMauZejJoDdkBT
	 xpHbl750boonlstJ43lz/JBRa1V7hvDLpozXnCWNHWAH50CgPn791WdjG40ihBvW6PWiA
	 0YQ9N1iqS6ESs/T9r4bggDAfV+uD8Uefmmr8XzWaDnbRXTfx6y31TPVTrIzycsBsfYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=E0HYZnvoFY2cqYeGKLL4I6ESGkmMzyISge4rNBKOPnQ=;
	b=FJ431+G3iwvv+vy+QuiJXrq48UBmpjS/NgezjoXTI766XCkTVY5ya3pVvGP+ijeNypMU
	 cj5m8kdJHuuepNBTLIjGj3rcq7U8s1px9x5UcY2a4c3rkmIa1k0LMkuBmvx5XuAi+SabH
	 v8uuyed7MlNqD/k/LUXKK6cWm+/UT5c2KmMor83Z8fqbuOd0ROh/8WdvFSRfy81CkzpSQ
	 j5ve/maS21xlerdxrspinrH4cnENOl2Y7eeHUUJ3yh+fvIc20V8qWT1eVzBFokrcS75jI
	 st5yjiknfuENyJxnEYKH7iZi+vYI61QD806iVmTq5SBhz/Lk88wNQ0g2gCd7iv3deYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ajpn1FZU;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F08D606A32E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 17:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F08D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ajpn1FZU
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so1397472a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794589842; x=1795194642; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0HYZnvoFY2cqYeGKLL4I6ESGkmMzyISge4rNBKOPnQ=;
        b=Ajpn1FZUD6fdphGL4f5vUwF219i7l5zDYRSDn5qpvopjTucfLpwhBi+V32T8AvbkT8
         RWsRiKmQHMtZ0Y4DXyBIIzisa4aOm9Kpqn6zXnFueVRXAfSBqYFfjwXDeU+cneX/ZUV5
         HefkxbOejcUXxKGiEy7KSwSP4IBU4fi/pKYMHUBYcv1mvmdQpwDaw3KHI/5S1lKhvGqr
         Aqh8AaNox3wkrdcHJzrvSIPrPnnwYPqODX7othykMRmXizjKVDeUsrh370Tsh+29iDXB
         +uM/wdIJpMXmJ6KUDCozEHrN42Uj0kEx3LPWxPBB1gb3KlpwfgJe+HUqqMPUhgl2ikGU
         KuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589842; x=1795194642;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0HYZnvoFY2cqYeGKLL4I6ESGkmMzyISge4rNBKOPnQ=;
        b=JEZQglfigtxdMGMxPM3rQpJINEn9Qig0A3591MXJFFOj7ubYgi8zLyPvRzcwC7kXPu
         9GmpTfIPzasYZGgedL+ewJiRVGGmu+DhaUswA7IPYunPTZRdCeL9NRVbztuzpO/pEWox
         +/sYEtKosEnb0d0IsWWQcbNcY1uEmxO5LXLV+J65LDt/w/M/tc0N/o5MyU+/mU4KSGQF
         qNQ2k8CrBOjoa6bIfzPGGZ/JzpmL1vO1k/cQW+ofgOXfYlqvy5QDMhyYa0FQIkTxkSkc
         OtqLexikBoYn10lym+bEfOuniODdS5idfpaon0BPRV71DOafmAD8WzxGRbYqkE1OisBS
         jPww==
X-Forwarded-Encrypted: i=1; AL+hErHbI1356QVY0Qeo6bq8Z8SEwyutCMFiZhZTUpkCsku+Zpi6+quvwiriJnH6gmslWs+WG4QDBbJLlSje/k4tYt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eh3zxFaZC1EeCA5kxhXlJUaDINWdDu9OlvjumAofufyseVrSp
	bmnYaoe1PfUgDEkgcvyuB+k++edxPH1dqCJ1wLpiouV7F0pQSaR5oxiUIWF0XR/Kd9p2ya86pgL
	vuD2l3A==
X-Received: from pgbda3.prod.google.com ([2002:a05:6a02:2383:b0:cc7:dd4c:a852])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a10:b0:3d3:ae50:97ce
 with SMTP id adf61e73a8af0-3f7a7bc23c1mr3448497637.27.1794589841765; Fri, 13
 Nov 2026 09:10:41 -0800 (PST)
Date: Fri, 13 Nov 2026 09:10:40 -0800
In-Reply-To: <20261113170535.79246-1-dwmw2@infradead.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113170535.79246-1-dwmw2@infradead.org>
Message-ID: <avdEkNbqPWamMErl@google.com>
Subject: Re: [PATCH v2 0/4] KVM: x86: hyper-v: Forward unimplemented
 hypercalls to userspace
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Thara Gopinath <tgopinath@linux.microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Michael Kelley <mhklinux@outlook.com>, Nicolas Saenz Julienne <nsaenz@amazon.com>, 
	Nikolas Wipper <nik.wipper@gmx.de>, Mushahid Hussain <hmushi@amazon.co.uk>, 
	Sriram Nambakam <snambakam@linux.microsoft.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, 
	"Radim =?utf-8?B?S3LEjW3DocWZ?=" <rkrcmar@ventanamicro.com>, Liran Alon <liran.alon@oracle.com>, 
	Arbel Moshe <arbel.moshe@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 13, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> KVM implements a fixed set of Hyper-V hypercalls and fails every other
> code with HV_STATUS_INVALID_HYPERCALL_CODE. A VMM that wants to
> implement more of the TLFS, such as the VSM hypercalls Windows uses for
> Virtualization Based Security, never sees them.
> 
> This series adds KVM_CAP_HYPERV_FORWARD_HCALL. As with KVM_CAP_XEN_HVM
> and KVM_CAP_EXIT_HYPERCALL, KVM_CHECK_EXTENSION returns a bitmask of
> features and KVM_ENABLE_CAP takes the subset to enable, rejecting any
> bit the kernel does not report. The first feature,
> KVM_HYPERV_HCALL_FORWARD_UNKNOWN, sends the hypercalls KVM does not
> implement, and extended hypercalls in fast form, out through the
> existing KVM_EXIT_HYPERV_HCALL exit, whose format does not change at
> all.

I'm not a fan of fowarding unknown hypercalls.  It seems like it would be quite
easy to end up with a mess where it's difficult for KVM to implement "native"
support without breaking userspace.

How much code (and ongoing churn) would it be to add an allowlist of hypercalls
to forward to userspace?  And then obviously require userspace to configure its
forwarding "intercepts".
