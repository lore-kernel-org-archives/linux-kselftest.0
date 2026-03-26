Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6C3368B6;
	Thu, 26 Mar 2026 22:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774562787; cv=none; b=TWWYu7oY3OUE+E1MMUeSiYj7MnPW1ktA0tvCVGz02VYf7AKtS53CMyJcvU3EnNcRQ7lYT7kTn1mQi49wcFVAqlye2YnlN49wr4kzZomp3dMODUY8rz5K5kUoYLwcjLIYpb0xqJHJ3/nFXHL14CsUJdjXniHSu67HPIOXkPplA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774562787; c=relaxed/simple;
	bh=Lnwmfbf5vBpYXgKjI+zDsZF3co68qnnxzniaPkU060w=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tbVOM6uEDynM57TX7HRzokMLMRnextF396Z9JKBEOYokHd71b9HsTFs207z2OF6XpUF2vkFzNymgoeSSdlzZkRD5ox2hw/mnAzr3SpBwmuihTtkD5CHr3HiYoag/2fbOcNihHrGN6Bp/mkPHvDkPSDQ7adCUryJyN11MdkbYYgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN9kqgd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN9kqgd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFBEC19423;
	Thu, 26 Mar 2026 22:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774562787;
	bh=Lnwmfbf5vBpYXgKjI+zDsZF3co68qnnxzniaPkU060w=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=VN9kqgd86dXTFsiak6qRd9AumFtlkwHJsVtk0lv0sBTD4JsM6aLfvqPMPHBoDtU/X
	 G7qaHf/2K2SUBL7FriJPWnO1xIqcYQjmVlTNWxNmCo6z+B9V/uWqN//EXdFNSCS9td
	 d8ALG6QpyT+WNeHqEal4gTTDrR3zZ0imwUHQEGTC3rY/csIZsiNY7FAGuwen0Goliz
	 pz9GEIw2KuNBcn/ZKOaooy3FKxWRTipulrHe7IfnNoHK6Gc7UnkCIeEe+zBkgJ+7lL
	 5QVKtctur7B11uYahlYdwJLXLBdCs/EVekor0EtUSsnyuf047t61TYb3PwDc//iMtH
	 eY0KOmnaq0Zyg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id B5E7EF4008E;
	Thu, 26 Mar 2026 18:06:25 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 26 Mar 2026 18:06:25 -0400
X-ME-Sender: <xms:4a3FaaYrnEshMLYtG5qMqUZfe0XOMPFvMogLQEma4ebqtnKu8cBKjw>
    <xme:4a3FaYONTI0YBYbI8DncP4DsGkqBHU2xiYCxIED1yTp-0-7Tk_26fU6FVWx0vIIrD
    eAecopC8sD5X9A3bIZv4NVKyKekF7_6EKKIqxNbYXELb5edsrARQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvffkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetnhguhicu
    nfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejteegteevheegieegveelgedttefhheegvdejveefgeegkedtiefhveev
    keejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedukeehieef
    vddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugidrlh
    huthhordhushdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegrnhgurhgvfidrtghooh
    hpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohephihiuddrlhgrihesihhnthgv
    lhdrtghomhdprhgtphhtthhopehshhhurghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehtghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopeihihdurdhlrghisehlihhnuhigrdhinhhtvghlrdgtohhm
    pdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:4a3FaUy8c3_xvCxopILVc0Uwk7GiMJ94_0NH-s9it-9u2L93HqGj_g>
    <xmx:4a3FaX2zoVuo2W5BCGtdpYk81EQOL5A9mk9488_KgqXJ2eD2upR6FA>
    <xmx:4a3FaapN0wq_vNP5fBhbMdOa32Y5CX8QXwHfs70l0pcH4WFPJ_lrCg>
    <xmx:4a3FaVBNV7nOW17Yrw0c9YC262s7pjl4Gw3STRQdHKzUCq3WGkV1OA>
    <xmx:4a3FaTpcHUIoGYvi8AIKdUC4qUnD5_9jMW_6RG7pagz3qxXtZbYHlnBd>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 88F6D700065; Thu, 26 Mar 2026 18:06:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AjLN7vUTjgbo
Date: Thu, 26 Mar 2026 15:06:05 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Yi Lai" <yi1.lai@intel.com>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xin Li" <xin@zytor.com>,
 "the arch/x86 maintainers" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Message-Id: <d0560111-a999-4024-aadd-f0d468d3744c@app.fastmail.com>
In-Reply-To: <20260326094423.711724-1-yi1.lai@intel.com>
References: <20260326094423.711724-1-yi1.lai@intel.com>
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on FRED systems
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Mar 26, 2026, at 2:44 AM, Yi Lai wrote:
> The existing 'sysret_rip' selftest asserts that 'regs->r11 ==
> regs->flags'. This check relies on the behavior of the SYSCALL
> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
>
> However, on systems with FRED (Flexible Return and Event Delivery)
> enabled, instead of using registers, all state is saved onto the stack.
> Consequently, 'R11' retains its userspace value, causing the assertion
> to fail.
>
> Fix this by detecting if FRED is enabled and skipping the register
> assertion in that case. The detection is done by checking if the RPL
> bits of the GS selector are preserved after a hardware exception.
> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (via
> ERETU) preserves them.
>

I don't really like this.  I think we have two credible choices:

1. Define the Linux ABI to be that, on FRED systems, SYSCALL preserves R11 and RCX on entry and exit.  And update the test to actually test this.

2. Define the Linux ABI to be what it has been for quite a few years: SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL exit preserves all registers.

I'm in favor of #2.  People love making new programming languages and runtimes and inline asm and, these days, vibe coded crap.  And it's *easier* to emit a SYSCALL and forget to tell the compiler / code generator that RCX and R11 are clobbered than it is to remember that they're clobbered.  And it's easy to test on FRED (well, not really, but it hopefully will be some day) and it's easy to publish one's code, and then everyone is a bit screwed when the resulting program crashes sometimes on non-FRED systems.  And it will be miserable to debug.

(It's *really* *really* easy to screw this up in a way that sort of works even on non-FRED: RCX and R11 are usually clobbered across function calls, so one can get into a situation in which one's generated code usually doesn't require that SYSCALL preserve one of these registers until an inlining decision changes or some code gets reordered, and then it will start failing.  And making the failure depend on hardware details is just nasty.

So I think we should add the ~2 lines of code to fix the SYSCALL entry on FRED to match non-FRED.

--Andy
