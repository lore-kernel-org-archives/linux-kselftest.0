Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D5423160
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612301; cv=pass; b=dOBu1EBuCzOFk4P+QmYJ9zKYpMacpf7tlSVi3aysyXVsV4JpzGRqUyyNS6WgLGYEClW4eHDgZ/3I39HiicEw7ewjLMFLC0pasv74NlpsRIbXNQsAhTpuHTg0CEheBaGWtpOy63j0qTA01PtQYSZun9d5kKxIoqyQvdujho+CBIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612301; c=relaxed/simple;
	bh=CnOR5RamZJxR2OSD6C6EdtUaJE3sBF8ndNgsESSRB5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YA/5K8V7TWLgXPujMIH8uWd4seaQ8ypfZ5bqeyS1Oit4bIn6DYc/PidbbNWposVarJdofE1Rg5fwVb2GC5auP2JULwhNJAo0huL4htuEUJ6xmD3MGDkRrkUjEPHb9TeJ/YlECDi+OXOte7mJP+LX5e9gl6K8B3rvswvn92DrDxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eMc1jOq8; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eMc1jOq8"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so1660185a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 08:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783612300; cv=none;
        d=google.com; s=arc-20260327;
        b=gbXhpldQp0SULlv3vzc+x2EIFtgM2lZGW+a1djM0/RjFNsbVrX9SD6lM6KD3YeuF7a
         6JPziw9I8iW6peeuf5oZR9jnVY70wVstjMHicZgturfaj1+61btLEXwLu/+ckL7ALFZ+
         +N3CU032prRm9YroLrH9UJSjY+/tnyONQT4WSZYaGky4ZqWEoBwe61J71mEf2MpdL55y
         740KgsNxJwTOod9JEMpPYmbSAMWryubLlhJrZbdzQZxO7DhQmwrltNXfxiMWTfIcGNnf
         TnCgO5xch2Mc2RdY/smbmprRf9UXIvwYk+R0OTSC/BG4Y9ZkCxTb/E9Xi8ggaoR+sQhf
         gAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYq7+F39g3Uh2HbdpTybELtY+tupvf/1ejmIDLIb7hQ=;
        fh=jQsbDF71GJKr92Vyx+X4ydib8kvnZphl9+Tm4IbgsFY=;
        b=B1XBz/qwG0KL9bvde20acxg75XWzPO8yTdQkRbDLKvgIpW5VYlNWpJ5e23SVgZkBCE
         IDIg/CWQsDUINbWeJPYJa4ABDaLs2fy/yOR+HBbxqPJTdMbaB/iprQYm6z/KMCN+AvIr
         a6/H9OniIweyA1ifi4Jl5VeyWYSEpyg4Jt5sZzH5PVBwPqF7uXVD9d4z90UQNiDD/0yg
         nsfw6xR5vQByyuURSPAmM5xqMbHtktrD0peN5fgrsVsZzBkmzS6h0z7SqYIAUVL8gIdc
         WqrKN+jyYFRTY0hoROdZAZUh9UjqT1Xct71D1+0UwHOheikISe11hO4C3gQ9vmeezg9/
         tDyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783612300; x=1784217100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYq7+F39g3Uh2HbdpTybELtY+tupvf/1ejmIDLIb7hQ=;
        b=eMc1jOq8TDxaW9BjAF+TgUMtJtDglYCmQ7IIsYQ05Io9mzOebWrhexHbJd4crx3x5Q
         twQVC/+AOiFQgBJim4Txj9FQbhgAM0Fxy+at/YYVU57M6bj3CC2QDYnDB+ZS9BJ0xK1p
         sfks8SZ3ENOclIWGGcEM/m65jzIlioxc8I36xBpbpzkGgBcoDQ8qO+uIL+FBp5EH3NHF
         oclvWLrhnJLTkJa6ayUuBWexlckWddPdiLd7jDo5CVhixVXqUgbJ5AtU08clT1TuQpV1
         MYl3BN1MZCIyg0rae5RmIzh3OS88/fGcR5qktZFpkEgqMLM0wsVSZGD7Fq1g6BKt0fkZ
         KKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612300; x=1784217100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYq7+F39g3Uh2HbdpTybELtY+tupvf/1ejmIDLIb7hQ=;
        b=ZVuNIE1x/uHDxJNikG+0WeftNfVqzSpisbIkOVtVQY44SOIZoVYZqyMkToSvk87SmQ
         BqB/WrQuVzVLRkUIt1VgHElrL34T3cBGR6gWnfMRfwUKzIBQ12cCeU54Qpk+r5xvYm6U
         cCA9dzActNDePGE0aq49Y+HT6JRyFf8Z8aemVXhcGJHoDZ1sjBRYcujCjGRFMf+DhsZa
         GUXyUDdzqqnqKqotBhRKn2aGg04Zd7FOXewXwKIE06Dnx4PA5LMPb6ChbLFu3x9U94k5
         vFDHZDB+8UM5UOlpS/uKNxOpE6X3nj3IFB89bFSMrT1aR/jNJ/CX7SsO0wtckcNcjYhM
         vv4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpTujni1NJOEEw4kOplwWGdoGGkWNqyQh+7Dwl2/ua0e14x29w79PsO02Op2JyLX9gMISPDRUF2Y8Z5w0WFYMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh1XnqVwrwTXC9EcN3AEHZKMtEMzWq8wAD3t3VpGygH2IfWzBW
	cSdFudBdHxA5ApqGq/U/PKMQE38NOH4dBQ7VctgKCc3aNsR59n8Fz+jbc8BR2P/WeBfhZX4jkzE
	6zMk5cXG3+W+WPsH9ypv8oq9NWFQBd4+zFLGTiuGwtth9DN418wLEIvaQ
X-Gm-Gg: AfdE7ckwF/qQ7NmfsNT+292DBA0fES9no6j9/kMIiZ7MC9x6V4ouR8f22JYaA1Exwtn
	e3GqM0T1LlTO6kMkh9yXjTZB5VFsc78PAyco6pVZOTLW6wiykn5YLbEcY/Au5BrozfzKtCREgcn
	/oCn+wzjP+vX9VU+HEnAzOf5+4PdXLs2hLkYoGrcdJIkaw6Mx2dglezeZAKOdG1+o07M/3B9zyf
	/me2IMVQ1CwxnULyo5ZWUgJKr0kAJE34oN2WUbLJO3ySWZfM11omvyf3rR4Qwp3WiprJXhR
X-Received: by 2002:a05:6a20:430b:b0:398:77ae:8d8b with SMTP id
 adf61e73a8af0-3c0bcf163d7mr9590607637.10.1783612299159; Thu, 09 Jul 2026
 08:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703032806.40946-1-nnmlinux@linux.ibm.com>
 <akwyZvbv7Fg8mfB2@google.com> <afb9bf4d-2258-4731-a28e-7f4eaa01ee0b@linux.ibm.com>
In-Reply-To: <afb9bf4d-2258-4731-a28e-7f4eaa01ee0b@linux.ibm.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 9 Jul 2026 08:51:11 -0700
X-Gm-Features: AVVi8CfpfsqwkcJZWry_SVaBgp7lq6qU6G2-M-O5llXVY_AFh-tgNmotP1cgLe8
Message-ID: <CALzav=eB5NwrHNq4bm2ooSFmTtGk3sfUk7_k+iE+Kwm+Jc9LFA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] selftests/vfio: Add sPAPR TCE v2 coverage
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: alex@shazbot.org, shuah@kernel.org, amastro@fb.com, rananta@google.com, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com, sbhat@linux.ibm.com, 
	harshpb@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 1:49=E2=80=AFAM Narayana Murty N <nnmlinux@linux.ibm=
.com> wrote:

> >> Feedback is requested from the VFIO and PowerPC communities on:
> >> 1. whether the sPAPR TCE v2 helpers should remain in the common VFIO
> >> selftest library or move into a sPAPR-specific test helper?
> > Responded in the patch. Let's move to their own file.
> Will do. v2 will have:
>
>    lib/iommu_spapr.c         =E2=80=94 all sPAPR logic, compiled only on =
powerpc
>    lib/iommu_spapr_stub.c    =E2=80=94 empty stubs returning -EOPNOTSUPP,
>                                compiled on all other architectures
>    lib/include/libvfio/iommu_spapr.h =E2=80=94 declarations

Just one small thing here: You can put all the stubs in iommu_spapr.h
as static inlines, then you don't need the extra C file. e.g.

#ifdef __powerpc__

... prototypes ...

#else

... static inline stubs ...

#endif
