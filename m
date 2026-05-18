Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F55A36F413;
	Mon, 18 May 2026 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136754; cv=none; b=SEsC+Q1KECUs83iaslxakEvGW+jA+MZKp7nJrVLgUv83K/CwES/vs0ePSceU1eCN8/TYH8GrzvZx+zU3/ZgSBoOeh6ovEOuh5IZHPjxYME/a7IzqgZmAcThJP6ngONHWXga20+3QmTlWBIZY63zV7U6H2vzTxNauT21h98mhCtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136754; c=relaxed/simple;
	bh=j8l70kevZbw9WJ/nAYucOtDN4WHanokXjvs8vr9D5+4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VEU8WkQ5M2S9iZ+ZicUoF7XzvWxkY78qvCy5CoBikFeLsnjCqfjqaXlWdz7kL+g6a8UlIYgNcPdZqM1WI7Qt34IeQepWpVcu/mZfkYGO1V5LMSnmQkg+4AhDv6HL7HdRGxEYJWG+8/7KurMLsmpU5/bFOQfrsAAtonrLPXdwZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=N5a7j9vh; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="N5a7j9vh"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 64IKMQvw2327773
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 18 May 2026 13:22:26 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 64IKMQvw2327773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1779135747;
	bh=d22rrup/77nnsw9mcNXM+lLrmw1694c4z1kAYgwrbwU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=N5a7j9vhpwP3zBAMjj780rZyFdsYLrghzt0q61nkXpQarhJfyXzki/qhiaNRjYuOU
	 efCju9M4rGLsL/06E3cblwwv38ouxoketIgId5TUQArEBb1kXCEqAN03ca4joAQBnF
	 cW1EKuTTEnTdghJUidDVjHVaEgQHFx5K/7Ax0jPdtBO5l43yOQKz+x7+CjZkCB190Z
	 HwUNoSTKTyE537VQFJpAsZqfXASTsoXV/4+nUSr4syD3KfdD044Kd/K5q0I4G9Wr29
	 M3Zv2PDn2aOkD6LVj0WmDC714Nht4FAjKPXrqEwg0UfHFQavwNjiV1ifdk6ezriKdU
	 mr4VheuP26BRg==
Date: Mon, 18 May 2026 13:22:19 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Richard Patel <ripatel@wii.dev>, x86@kernel.org
CC: Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
        Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] x86: ban 32-bit sigreturn when user IBT enabled
User-Agent: K-9 Mail for Android
In-Reply-To: <20260517183024.16292-5-ripatel@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev> <20260517183024.16292-5-ripatel@wii.dev>
Message-ID: <F10D66BF-C851-4B14-81D7-E5F1E15A325B@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 17, 2026 11:30:21 AM PDT, Richard Patel <ripatel@wii=2Edev> wrote:
>IBT enforces that indirect branch targets land on an endbr
>instruction=2E The CPU enforces this by setting the 'WAIT_FOR_ENDBR'
>bit after executing an indirect branch/jump=2E
>
>The only relevant edge case with user IBT is signal handling:
>When entering/leaving a signal handler, the WAIT_FOR_ENDBR bit must
>be backed up/restored=2E
>
>IBT is not implemented for 32-bit and cannot be enabled using a
>32-bit syscall=2E However, a 64-bit thread could far jump into 32-bit=2E
>Therefore, 32-bit sigreturn must be banned until IBT supports that
>environment=2E
>
>Signed-off-by: Richard Patel <ripatel@wii=2Edev>
>Based-on-patch-by: Yu-cheng Yu <yu-cheng=2Eyu@intel=2Ecom>
>Link: https://lwn=2Enet/ml/linux-kernel/20210830182221=2E3535-5-yu-cheng=
=2Eyu@intel=2Ecom/
>---
> arch/x86/kernel/signal_32=2Ec | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/arch/x86/kernel/signal_32=2Ec b/arch/x86/kernel/signal_32=2E=
c
>index e55cf19e68fe=2E=2E7cb76d794366 100644
>--- a/arch/x86/kernel/signal_32=2Ec
>+++ b/arch/x86/kernel/signal_32=2Ec
>@@ -143,6 +143,11 @@ static bool ia32_restore_sigcontext(struct pt_regs *=
regs,
> 	regs->ds =3D fixup_rpl(sc=2Eds);
> #endif
>=20
>+#ifdef CONFIG_X86_USER_IBT
>+	if (current->thread=2Eibt)
>+		return false;
>+#endif
>+
> 	return fpu__restore_sig(compat_ptr(sc=2Efpstate), 1);
> }
>=20

Dumb question: is there any reason not to just enable it for 32 bits? It d=
oesn't seem that it would be that big of a delta to Just Do It=2E=E2=84=A2

That being said, I suspect the number of users will be very small if any=
=2E 
