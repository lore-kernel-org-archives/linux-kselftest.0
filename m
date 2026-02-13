Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59A1684BE
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770997598; cv=pass; b=CPV/mnwl3pNx17JjzYvNdhjqo3tCbWZhvFG4DRTUKj66sq1TK7WXQvjgaiTGzGkBr01yXUNfRbt8XrJBePYeYyb4vN7/fZWgz2THiTlfXWbXMubp7UYZEAQ7e1ymfwTlO42fPWBZ56boXzKLDyTGXl4Quz3KJDsZxr6Avp72kvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770997598; c=relaxed/simple;
	bh=hLk/0I2GVEJZ/LTM0BOWivxJ+N6F6LucVNpkVZmx2DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/hxqqVRYb44wkdqafQoVYq/pXi7JM81sRjKR0FzHBcu+26xsOVDl8rma20jpgmFgP5QBuNBiScYFPW8246kD20pGw8T2VHPqRM+XaaJ4LO9qRLjUmYEIVaLLtD5ZQUPfCrbTW1h8C/CZBNOiQR01Ero79bMVYw4GTOLWnUephk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMtlrD7t; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMtlrD7t"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65a38c42037so9695a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 07:46:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770997596; cv=none;
        d=google.com; s=arc-20240605;
        b=R7i1NrBoNz+mzlpJQMpW0qoEQC+CTrpjgzM1t1QQGZA2/nSxdVGtfB0LZ2TBYAFOzD
         5mXGYV4hrE0k5aN9KvFG61H8JEbac52VN7FeJBtjUhqnFWRdet0g4eZT0HagdqZTH3Fq
         eTvBlHXLKZBwLsiSbU78qdZ5LW69J2Lq7p7U/YWiXzGfUqUyIhHOzX9SWYGIeNZ2x9vm
         Ls8E9BcxiLZ5I+lDaDlr26qgouypS2UUVOGILiQplJ76K5x4GTwxClMW5wlwCM5ymRMS
         hwpQ9QS/Ri0K2j9GOD7v6WL7y4jJE0obMQoAOwxjurYS07ZPRNxKAp+dKrXev2nMDE0W
         Vcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLk/0I2GVEJZ/LTM0BOWivxJ+N6F6LucVNpkVZmx2DI=;
        fh=WJ/jLJYgWrcsaDZY4IRedO4xtyS22zZCzRJ3NtLKxZc=;
        b=YLFOrex9fMv/E/7w2HICv3KpGTiFMlHbRtJLuisMd897ks2fT9s0GXxE/74HUpufHy
         lVdHY4LKIoZVLi8Hyoq2KNEbqbQ0yqgEumQD6a+bSLoCuGXDUFcL1dSlu4ZT2d7IUl6y
         U3lhU1Uw35EThZ3nQouoZHXVpfg0rkfQ3rqDjsxT5ic8wdSZNDC1aIe5P1fDY4eNHBno
         CP/iCb9NPxDOEOO4ThThBDN6aNh7cKjUgquIwqyB14bzqjOF6Zf/TLPcLfdJCGMxYPWY
         nHuVpHDlEmlVihOp1i36XsW1LnN7ANFER4I/2lIMbz2d8vY55WEnNnh+qfVjrCSdn24l
         blqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770997596; x=1771602396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLk/0I2GVEJZ/LTM0BOWivxJ+N6F6LucVNpkVZmx2DI=;
        b=fMtlrD7tZLTiuVXEZv6S2zf+Vs7x8gTZNwVEDcy1aOsjuFENztLz94sRLQFrCKCu1c
         EunQdzpPhyHv3mec++LDVyPnUopyxdmW7S8DvxbXGlAJxZf1VBbdULbpBc3YatAMWAEf
         WIF5VSHZvN+V9D+UlRGJgT9/jIkNOV+jpRQAGzrLpz0fs12wzo/oDwrkh/PnTS4ba2SL
         HErzhxco4IcgAt0JnCvmGHdgDTdRWJYQjfyeLi89JKEKT6DydlXjS5U8AzhB5jpJnca+
         E8fQPrt5kN7nVp0YkA9SNF8zZeXWDFgilpDmPd3R9cBPgFxqZmwfvBx3J0wAEMUkGrJK
         yYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770997596; x=1771602396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLk/0I2GVEJZ/LTM0BOWivxJ+N6F6LucVNpkVZmx2DI=;
        b=Wa5WGNgSRaLLI0fqWx5FBJWsxxQC2uGAFgOCtsZJ1BuwvRPj3TuQY28pYSAnex4TPV
         8JjblgGS+rPybrZHep5boGTMxpuwvkPjlzE621Y1nU1Eb3EOVKDCePBLPc9DAr98jRBR
         LtyN1ozOULF6qhNaQWIaQxAE/14PkgGEzYeExTlxl8kwiUPLeM8Z2ap4FH90nWCxyieh
         1iuherFxfC0ULGXx11RDC1EPGZvxLRoiYCSq2EUU0l4om1MDq6M0+cu1a4WRf161k58B
         e1CK1OBb11UAodBn8vYOXoa3g2dKZdVfk0E2KkRIvRG+UUfO3svtB0FnCAdfDpVaa+7i
         Tb4g==
X-Forwarded-Encrypted: i=1; AJvYcCWeHVj/Nbt3RQM4uSE3IendBipbDla1FhoVM+bsUmhqzM72vWYP2ExfGnc56itKaizXASQCMK/+glnf1DjO2Bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhR/9R9KjaA2imPsQfuDLBLfmhEpQJ/3dbVnkBwfy72GBXZI1+
	DdV6eLv145szi7zc6UMHYkr3L6GDjk+KjDeycpRk8bx3op6Glh0K9rLIbFTRO1LHwST+z7Z1meQ
	tAYvwILIVhLq9nDtAF28o0Ny56UBJWtyf9Qex7uAF
X-Gm-Gg: AZuq6aJQtr+BdVRitKPEb9/g//tu4Cu1yRLvoDDoSwg4kxGVY3I0a4pQl9GmTqq6d+7
	9fARP7aipU0RIYYPXCQaa4kacAjTnDxC/kMh/+zIM34F/OFJ46nolu+aiqjYPcuxkaBkbVSMnxX
	oa/HvHUAabXltNYslwfckuuhX0GII+78RTOB/9oNlXVw4qa+280CylEodplyA9LvYgPQGaPE/dJ
	VOFfzBTaO2wW3edu8s9fEI9BXWA+2ddq49EkL+q+aY17T8HWHihm4+zd/lqyVGJUqmKrhqcT9Tx
	BkSUh+0=
X-Received: by 2002:a05:6402:332:b0:65a:14a1:b1be with SMTP id
 4fb4d7f45d1cf-65bb072a035mr23356a12.7.1770997595564; Fri, 13 Feb 2026
 07:46:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com> <20260212155905.3448571-2-jmattson@google.com>
 <f72gve6ia3aqcpkqxzuwnleaxzxmesapzmoaus6bwaibsq5f2g@hgq4z5mqxykh>
 <aY9CqmlpZb2Unh0y@google.com> <phcxxcpm2uum4pa4ny3icvy7u2d5kp4ctey6mff36xnz4u3hzz@oyjzgp2eobry>
In-Reply-To: <phcxxcpm2uum4pa4ny3icvy7u2d5kp4ctey6mff36xnz4u3hzz@oyjzgp2eobry>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 13 Feb 2026 07:46:23 -0800
X-Gm-Features: AZwV_Qgmauvz2wqqAPGDahWgOEuXYp-qk86-LEGu_8x9HXEZulNLXMzBZa6DLWM
Message-ID: <CALMp9eSrV+G+8kDMehhMk5r2ZNugbkbxxnNUwqH5XiTJNL=nXA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] KVM: x86: nSVM: Clear VMCB_NPT clean bit when
 updating hPAT from guest mode
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 7:33=E2=80=AFAM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
> Funny enough, I removed all usages of vmcb_is_dirty() in my series, I
> just didn't drop it:
>
> https://lore.kernel.org/kvm/20260206190851.860662-24-yosry.ahmed@linux.de=
v/
>
> So Jim was cleaning up after me :)

Sorry; I removed it when handling the merge conflicts, thought about
moving it to a separate patch, and then forgot about it.
