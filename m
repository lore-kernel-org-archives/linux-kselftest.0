Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2118E14884C;
	Fri,  3 Apr 2026 17:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238423; cv=none; b=ERWtgxCg73F8Aw8rlznFGvkgkW3zFzB7emyCjAXOfIJFFGzGnSgGeYvsSEG5vt82pZVK1lOGku6vUPh6YyE9K0neRTQaxQzx86ZwrUS2apWw2+f4cVD4KPWUMOtragazCEq093L7zb+PY4qeiQHLjCZ13TktoAL6vXBz/dNSJGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238423; c=relaxed/simple;
	bh=+VwpswqaaiwBaK6+QDNWGhUo7EoQ39AbAVV+PZHtYxk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HyUqjTOWFCphbdGhfLXb+UbpOYQHCpzLzKonMSUVdaqM6kWoC5w21QDfR6AqR90DhLDOaBGOnH2ivSRmeJH6dCLB4RFlSlNUTRVxgV8noUZjLdxZ5ATYhQ/to3QwTGX4BEPNsXiTG/ycOZefasr6x6N/j2ENRRfc9etQNqPLvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCGuCY3e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCGuCY3e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89258C4CEF7;
	Fri,  3 Apr 2026 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775238422;
	bh=+VwpswqaaiwBaK6+QDNWGhUo7EoQ39AbAVV+PZHtYxk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QCGuCY3ehFpVJpwa1ZhKEVOkgLwnGiCvMIrF1lkS60M60cbRMiWSaXaKJwPxXMX+y
	 14v2lJTi1i9uzpYyzz0ye/4dLAmqHSPZv5L1Ztq2fVV0jX0vSLnzk1nezKF1oa5B/r
	 nReVNeIsB1fY96br2+OIpaoJVjEuzLt2DvZJeyXXCC1FRHEnfnm9Iu4e029cH0jgOE
	 0d9t9ClKNtPb+4dHTEZhBOUNPPA4K6nWuo+cNYu5NGj/K2rs/jsWdo7t4JxCyunJwD
	 Cm9uNRVfTrf1GINu+PdlHh4UbFgE1t16+9A2TtaEqoimM3eB/12USMTP7o8+ohe17D
	 exfqTgw6+tSXw==
Date: Fri, 3 Apr 2026 11:46:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
In-Reply-To: <d79b23d2-f8e8-b92e-cad4-5cbdf7690f12@kernel.org>
Message-ID: <34fbc75a-ae74-8337-3107-80957707bc8f@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com> <d79b23d2-f8e8-b92e-cad4-5cbdf7690f12@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2069827645-1775238422=:751248"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2069827645-1775238422=:751248
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Mar 2026, Paul Walmsley wrote:

> On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:
> 
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > 
> > EXPECT_EQ() expands to multiple lines, breaking up one-line if
> > statements. This issue was not present in the patch on the mailing list
> > but was instead introduced by the maintainer when attempting to fix up
> > checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
> > even though checkpatch suggests them to be removed:
> > 
> > validate_v_ptrace.c:626:17: error: ‘else’ without a previous ‘if’
> 
> That's annoying.  Can't the macro body be wrapped in do { ... } while (0); 
> instead, rather than adding these permanent checkpatch warnings?

I guess you haven't had the chance to take a look at this.  Or maybe you 
took a look at the kselftest harness macro mess and just decided not to 
say anything ;-)  I did look, after not hearing back, and the way those 
macros are used would make it a big and painful lift to straighten out - 
definitely not something for the -rc time frame.

So in the short term, I'm planning to take this as a fix to deal with the 
immediate issue.

checkpatch.pl clearly needs to be patched to assume that these kselftest 
harness macros don't follow the rules.  Care to take that on?


- Paul
--8323329-2069827645-1775238422=:751248--
