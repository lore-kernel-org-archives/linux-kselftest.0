Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B743803D7
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223670; cv=pass; b=h8AnIDyEx05Wifogvsy2eqb570OnXV1SJwxL6bY+NvjB6AqAku/PQhTphAmc1Xf+jmGwRk7JCzQKRgteyOWFBOfwsSAsYvMuS0QmQEFAoKXlAb2YYkXWjFrfPM6CWZGuMwHqwRwNdXr+rX36NPvdSk/hqGvjtrFuryqAmyxgrO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223670; c=relaxed/simple;
	bh=G67U1RwSbF+mPt7N0lSoGZbUv0SpaaN+gXs+8BGSMz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7f6sNBpTWpg8Gvux1s5qeaPYeF3KIxHBifC6pRl6dZsQboxE0UzoTWujmZx2/RXCVtt3fqkuEnSGAiFaePAbHz3ONtKklohnvC8Rsexor1dLK7gp+qAq9UQGz9qM2WLAWJiiEqNQzLwu5YWXukqmIy/E94txjwl5jJ1GGwWzOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9LNQ4iK; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9LNQ4iK"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e93cd4e64bso2992556a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 07:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782223669; cv=none;
        d=google.com; s=arc-20240605;
        b=kKnF/NAlFRT+tvRR39WI7QqNKsp3mprEjawk352I3Mkl0KS4/NDh5toQP9dTP8vIhO
         XqOEZm2c2gR+j85/g5c7lcKhQ/B+FZuzgNOjThXQa/PIp4d27D6nKUR1Efyi/Xg06F/H
         K8+OkH9LBfRcHbdvSYCyH0ehmMSPi5HK2s7kwtZ1Vk8WwMHrNdTiL+v2Vw6JvZorTj69
         afOKzl7T9fUWNa8Oz6xRdVy9gt5luwoeLZ1duK33T59/YS+3OkPtf3NwIH+psPHMFMGF
         T2kYkxlxuN15aQ9Zo9o1r5dOVqFP2SfhAhV4dbRf+AmZLILxKgN6S3KwD+aLelSEG6DH
         +sow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G67U1RwSbF+mPt7N0lSoGZbUv0SpaaN+gXs+8BGSMz4=;
        fh=WeP+c8ybtf6lsnrSI56zTKZKeu9JoxMbrLt5HYu3QbI=;
        b=Fuu1vrFk5tZRRJGTp50wY5XmHYle6rPBmvE22a6xkyeWixW5+pOAI/PtrN5HJ58gfr
         Jq8RgVsx6GL4i8pEVXy2806uLY4+IdiGrifceOC7JvSmJZvmsGwpJzadsvDUetLWyVnw
         f0K9XiqFH9oR6jaFUFiO/iGXFTMbbrs5fRWvHwCgvzjLT0Gyv2TKTqEeQSnCsee3kHY4
         Q8aeGOL4VZwx/BCbA0kaN3wNfEX+7QKGxwCmbqIx4YF1oAI05t2U8WLm+T5XOzOssQGe
         ePzaSrfSct0/st71+q0WvqSOZT2hFNKdL0SpOrHkfAM23Fs3Av9Ge1meoxcvESEjVV1j
         jg/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782223669; x=1782828469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G67U1RwSbF+mPt7N0lSoGZbUv0SpaaN+gXs+8BGSMz4=;
        b=G9LNQ4iKOngGapFwTTcCg9vD1z8ruMZzeCYxO9kVKERYXNM9gOTaQhZtCEkgT7fEYO
         vmT2sUd50U1PPmG8aBEHBx1wndUsF7JZsK9aU7Ja6NXauG6doLgs/iDShHO3+w+/s2+S
         v5GMLmXDv+/B1x4cBOwkaqrm5qNiaKA0n82JCVUDcz7ZgBpnm0PTgsuJtRTOHnu96vOH
         PyBMtqBQHq6mPVOoPORzr8+Bjq1bEI1eK8A8wHT+9QDwYkPlgzdlT+wT5cJwdGcpDVAM
         XBY+lL4oDt/gs+8EfnbSaPI3KqTvTUU1a07yKkmu1smGE4KnNjfD6YqczZ6qQ7iPhiGF
         smxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782223669; x=1782828469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G67U1RwSbF+mPt7N0lSoGZbUv0SpaaN+gXs+8BGSMz4=;
        b=kIkyfCtaHFASSr9K3/EmZNUvmhpGQQBVSkOu8crNa4OC+cxye0UDh3lJr2xvDvfZKq
         ge8Z0oFJfH6yO7TWXE/Wq06li3FZdLVWOk+94LwcGO8xoylGyJEjnOPVWfEsxuQv+qPM
         +gt65wd6uLxWXhH6Cd8YD/lUDJexG7PtkPAHfpVC/uHAjwbanpSHtogZna00zqkdTBi+
         6+h8TREpVce9vgj6kqysGYm97MLjIPAh5R42QhS2wz72wXpiVubUzV0Jk60fwQcNgCq9
         JiDrVW5+HQQYYadDiWS49Anf9+HTnN/vItooB9zQ00QvQqBAOY0Yyu3NSn1ZvADu5vcN
         32Ew==
X-Forwarded-Encrypted: i=1; AFNElJ9LmpaX4IHt5yebA7pSSuU2wYzSHGBm3coUm5nUpgHydEps2ZOZMl1zv16IdixREPw9bi32lHvddjIuVKo3Qf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJHkiatgEh41KY/G41AjhsFA/O0HXamSqFepDcM970vbcJPea
	TFnsskxCwJU3aPN4DEfyQtQR7sNPHmgDpu1pLNodoWucIKo8d8wsBY97hXGfLNiqkhIxCJ09dg5
	o0GofxVaXrFLSlM023DltX/v1TDmtl9Y=
X-Gm-Gg: AfdE7ckEsG2/IFROL1K+v9TKI4LvCHjSmSbHzdidBXEdRsxeD1ENfauWNdjBpHNRgdB
	mvK9Nkf/RcIbjxmJJV6mfvxu3a/dTDb65f2qNDhrkRB4F8DxR08htODF2Y1mn1S+VpV/zUqd1cn
	uF7aVhr9GCiAEPCWh5qqckJgFLF2fbhMRC2P8tMzi2q82wfxXodt+wwlG4rtrBkO0/AroQyCoHi
	f9iGXAjPGY4VgeBgCbqALgK0lKPCBTFNyAVlCRJKTHWoF4d7363TfaOqzH/dFpU4V/ym6OUrGSJ
	bRBcJSmsmxt213Q5LqTI2/jPO7hbpSKWbcghGPg=
X-Received: by 2002:a05:6808:1b06:b0:479:eb19:6e66 with SMTP id
 5614622812f47-48f29eb5fcamr2080626b6e.38.1782223668359; Tue, 23 Jun 2026
 07:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622183109.1137245-1-dwindsor@gmail.com> <20260623084327.GU48970@noisy.programming.kicks-ass.net>
In-Reply-To: <20260623084327.GU48970@noisy.programming.kicks-ass.net>
From: David Windsor <dwindsor@gmail.com>
Date: Tue, 23 Jun 2026 10:07:36 -0400
X-Gm-Features: AVVi8Ce4azXvS8RMtuB5ZswOmmVhWcuumJwHulSPO1SroME3hfaP0NykDEwpcDg
Message-ID: <CAEXv5_g8NZ+dBxH_towkEzJAH1emabsmmnCiX2gzikOqoAso7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/uprobes: Keep shadow stack in sync for emulated CALLs
To: Peter Zijlstra <peterz@infradead.org>
Cc: mhiramat@kernel.org, oleg@redhat.com, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, shuah@kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:43=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Jun 22, 2026 at 02:31:08PM -0400, David Windsor wrote:
> > Uprobe CALL emulation updates the normal user stack, but not the CET us=
er
> > shadow stack. The subsequent RET then sees a stale shadow stack entry a=
nd
> > raises #CP.
> >
> > Update the relative CALL emulation and XOL CALL fixup paths to keep the
> > shadow stack in sync.
> >
> > Fixes: 488af8ea7131 ("x86/shstk: Wire in shadow stack interface")
>
> I can confirm this patch fixes the included test case, so yay for that.
>
> However, should this not be:
>
> Fixes: 1713b63a07a2 ("x86/shstk: Make return uprobe work with shadow stac=
k")
>
> ?
>

Hmm, this commit appears to only be concerned with the uretprobe case?
