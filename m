Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442462;
	b=IPC0doXSHep/VJYnjfZPbUCOA2J3rcJro6k6gZjiRdZISt0l8Dgg5tbROsAgTEppBBXF
	 EaPDrqfZhH1awNRUzrq21CBY5YhcEnleEG+nVvdLtp9JmACazg+5cteGfSfcYkAcEh9ZL
	 zo9PS0O7bVUGemZijsW1HWH6+7aHGKKs58c9RvnJEt19gWous6RcbH8LJ0Onz4gSU3GjT
	 PhA+J6qDeb3h1srJPUo2Gz+XDK1QSfwD54SFquWks58mmVyPAHuWRk74ZWRS8iC5XkJHU
	 O/SJ3gwj1+ZYUsUM1Jfgdcj9mcn4XtJGzCpwoxsqBVwwUlw29d77k/dtMSDzzxo2SEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
	b=nR8q713BvXWqXwvzH57bLHM1pC08hMzmgiYbCgwibaiCzszrqNCEeZSVE6SwXom6a3Ee
	 gPHmTqITwrxJUrBtCfppyQKRgdPNaV3PIr81r0fPHMD93K8X2tY3oo17QkQ8lOqsYZwCX
	 OIt+VYveLiCDsVyBnKrnq62uNCSyt5M4OjW5GF97+4L3VARPanuFEfawfZFX9pge4Q0Ex
	 cPcEjYl03JPbtQ9x7jMUbC0mW0CLIO6Y2tXISlxfOTXJt60u5IhjqARrB7kfD8GztioZX
	 oj6Ujoygj9oHONWeWChJ7KAVqVvwDNOtyoWO6zRfoGnAKOmtliWgOslql/6+THXDtnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SDyjaxyb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A44606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SDyjaxyb
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1581a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442460; cv=none;
        d=google.com; s=arc-20260327;
        b=l1Oe0aOLtW76vXrkg+HRvrQWyQ1Qy2pyVmYJiTOcmMt3OL3mxgIuhwaFyI9QZx/dOM
         bO2lpesfv1ptJknjRPU1y0NjLFsIuqh1XVYxVAh3+Z0PaLy6poWO+8WkLqoHGPWaUnX3
         B16yHHXUES2pOPWg0nFhv9BlWzd61PinJVcml0gk1GsxNtSw33OcYwn2NTwv6xcVK93n
         kujmtpgbSAR0UziAhvijRWfaUTcDVuxUANLr/Fw15f9DBBrl6kad0GSSxY3Q86zOwpxR
         79BwDAxIIEr33asTUK3GTUGjOVP+/57ny7kUPU7yXFMUkzgoCnGR0rcwNAPK87rKxoUZ
         eoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        fh=rXJvjkfnhG1PcZfXZLdqjKSYGeqkQRe62Ifjb3rO814=;
        b=F0xKV0+eFUaOLvR4TOqlQmuNlDxT2V3//2F7NUhk6DsRIPbQTFkGRuxdMXAbQ9CXz0
         Qj0HGUNB6gtp0916FS8p8jUepdn5Nm/GLH4+AGXK7YX+cs/R0cQKn4sdE0AfSuZxiO5o
         4k6Q+pqvvMp9XlXRj9mdoVBgp/doG2Cs50qLkxLIQAM1RZhZMNqJC5s5M4nYcJ0apOLG
         mbEtoO2ovQp1+5kxa25uqIh9iiYBbueopDHNreK6GCxOYMiJr3Cm59bCMN6Drytkmojw
         N/OGKEjQMEXIJmsRkON9naFDhafv2yMFLA8AlvcxV1XjDQJqoybiWH2RAdIPhOFoDrvW
         B3kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442460; x=1795047260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        b=SDyjaxybfpDZ+GWIRXwXHRgNXxO+19SgUyPxzBxooYLTFpYqLIiTwWA4lKfCpMdefA
         ADzdSU7SYgKFDnyosvW7whHJ6ZFRKXJswAkYa/ScGcEVt0/cAWuqiv3shn7VsTJdDFUH
         Gayd79YDMjQ+hlLvmp7jtusCjGIeemXeOBh+dZChDXwF0xZfsjg1vt8sxm/z1dT37fAG
         uF3sXlwYAzk7LBljJaLhKboJHyc+MrKQQ7jJPuxiBPYP/Kc3RHhWIvNS7kCumAqjAxJp
         kZjJlWqbexuSuxva3sF7tsLWP3si7+ok/PkDEwCBrX0Mr98Trfvvel6FVCg7CdOnTBwX
         dKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442460; x=1795047260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38yqiB2sXmOQNevupAUQiKNneKLB/boGfQXhDS/dCY8=;
        b=jVDvDD41r+sYmbr+CHcrMapLv4Tnf3b0g7i4kPf2rXl35kfEBXTJt9PMu1Oul9ICSO
         xzzcXT7cV0NP+TMwPk9zfHS9CxSadq4bzEPKOOpN8wNhL/rqcvzB/Wp0KF/BPxoQgrwG
         dJ5OdlnFA0XMCjLDwgNEhnxmONjquhKPpcopheTYgdEBkudjFDFtnfA7Rot27obJkzLv
         N4ZGsqkSP83g/nyRypAI19Dm9Sut5Z2/1V0GYLMjIOZDEBdyu5NWUNhi/uQzA3oIrjhJ
         uVlEE1/GGlez/FijF7wr7iV8ocqmjj6V9zU89aN2i8i6JlNBl9L08w3IdsAT7ZA+rSTh
         GmXw==
X-Forwarded-Encrypted: i=1; AL+hErFsk9IaU/ZW8D7t6sZsKkpV25fyhO4iw5uLe9bV5Ky7Vv+W6Krz+USPthEoEnQTB+WOOhvYubfYIhErDOGb+AQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GZw1rggxPE3FW8azQLLmiuV8kJ1sPCm6VNBhaicJNdb7WpRC0
	oLMGy2kc5d7juawFbACpZ4y+2tI+/gtXbKCxhtYNTlFvbwIIgtE2ZKDAPZZ1nohZ701I8Lzy6qQ
	4X51YzCaA/6y3kXDM3rGZWYu30ioYd7//ZQs8G8RC
X-Gm-Gg: AYBFou3H03KFkcV+6NroQRn0ZD6+uWtE74jAjAY8/UrvauYFqhsSwQ6NxfG67WQhW5P
	PBMnKS6zUhcZ6Hxq3KQhqX5W+NVduLUV4YpCBWdgPsA1AiojHyXuea7Ut6X3nsVDVvpYPCWhcr+
	nAZYo0cyMGGmp8m+fwR+Qh/l5X9VSqTp+WuJInMiyZ+ORUkO3KQVamW+6hTm7uCIVwAtpDsbr4b
	PhZ2RmQyUc2ByRszm63qoindb147qXH+oMU3rZXROH9x2oTkZOrcgjFMG+YJZdkEd3btBQjIJRk
	2b1vhe6dyiO7YBGxGyplD01giMVcSOeXnQ7nFctcZNJhBOPZQFNn610iJgnWOgmEPkhT5BjtYhP
	BQOWvyenrzBhaeme1Cbf5GVId8Ov4w0TZZ2WVsG5rdmk438XmDW1BTK2O1BnYPBg15X/xLAT9
X-Received: by 2002:a05:6402:911:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b7a29d3f71mr25280a12.9.1794442459610; Wed, 11 Nov 2026
 16:14:19 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <07581ff5998d40092c2f171ffe1fb05ac48f9446.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <07581ff5998d40092c2f171ffe1fb05ac48f9446.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:14:07 -0800
X-Gm-Features: AclHuK_DBL8YBFb4m-FcpIKCAISr9plqpjdioafs2WWldumLjrzVfpqUvhMg3BU
Message-ID: <CALMp9eQ8ihM7LKSUHHOf-i=R+Gx=7ETZ3r_83P3SGovBEFX87w@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] KVM: x86: Move VMware backdoor support to
 separate files
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:02=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Move the enable_vmware_backdoor module parameter, the VMware backdoor
> port and pseudo-PMC definitions, and the VMware pseudo-PMC and opcode
> helpers out of x86.c, emulate.c and pmu.{c,h} into new vmware.{c,h}
> files, and add a MAINTAINERS entry for the new files.
>
> KVM's VMware emulation is spread across the emulator, the PMU code and
> x86.c, and both vendor modules read the module parameter directly.  The
> following patches make the VMware interfaces a per-VM setting, add a
> userspace exit for VMware hypercalls and allow compiling the emulation
> out.  Collect the code in one place first, as KVM already does for
> Hyper-V and Xen emulation, so that those changes stay local and the
> code movement can be reviewed on its own.
>
> No functional change intended.
>
> Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
> Link: https://lore.kernel.org/r/aIEwOToiAkKfQA-4@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
