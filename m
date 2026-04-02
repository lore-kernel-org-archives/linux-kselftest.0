Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D92F9D98
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136083; cv=none; b=Crgl4MT7sHnAh2P99Gtemcs3wMFX0q70ekvoGZWJOb4/+ZX0MVEySrKC5JbQaPpeEdRpJ1TkpzM730bkOmVidPLafNsZYMVglobUYnaM9rEXUsuxLEM/hVFkFVktlF2Pnh0XpmduhV6qPKvwqLVk+FaRHe99W++lO36+6/DXdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136083; c=relaxed/simple;
	bh=Fpml9Ca0aYBQ/ERTX7SDsJmf9PGcm2ioxOcYaWb08YU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lwD9QPS2YWtS+eoWI+pT3nDSoZkRoAxEDrDUz2zg1E2DKDUqWKduc1gzP6wmrCh8thWHEw7VhLhMZiirV//2mvGV7vNeW0mn2gWX8U2LyONpCiFlZvFCi3LLerJBTx5VY28rheVWqGr1JK+BfDfbzngSNeX5dZ/AI5AVHigzeCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxbvLZGJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxbvLZGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE92C116C6;
	Thu,  2 Apr 2026 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775136082;
	bh=Fpml9Ca0aYBQ/ERTX7SDsJmf9PGcm2ioxOcYaWb08YU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qxbvLZGJJsH8b2VjsU2tnA42wuaXzWZdHVgXMxltXJLh1UAY85axi9eMAZRYUkKrW
	 4SPA3S4OyZZk4a9MowcXh6SBkmterPDuCNDJ8fhaScrMWX1sqkPDLW71XWjLEBGnx7
	 Mi8bmUhjbIxBFapjWEpJTW7T7KRAid2X104ZPXMQsJWil8p3NEqJWi40j5vcjyaSVX
	 5CER9xX+yFSSkDT+gvaaYp+A5HFHntUchnKH55FiRV8+6kXtlzAOXcB0S2IIS8sM+u
	 2MhWREJ9OIhC7m7OoKbZMfNMGrLBWz3CqWHtr06znSS7RdnzWTEk+/dVmFWS7JYoWA
	 CY3Ifp5mFY/dA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 956B9F4006B;
	Thu,  2 Apr 2026 09:21:21 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 02 Apr 2026 09:21:21 -0400
X-ME-Sender: <xms:UW3Oaf8BIOZaFMwBa1KOcquUw38vQU6JXhuawkNVNQlTHETyUBlGgg>
    <xme:UW3OaWjHDpJCSA63J-UvsFty4tY0WNhIjFCQ_J8jOcaWkb9rPATRpzcPX3TkZr5HC
    nNfjXcwbu9-l3y7atOi-3X5eof8vjzLfi6eV7w82XIkbV33YbCVPif2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehnugihucfn
    uhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejvddvtdehffdtgfejjeefgefgjeeggfeuteeiuedvtefgfffhvdejiefg
    uedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudekheeifedv
    qddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuhigrdhluh
    htohdruhhspdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheprghnughrvgifrdgtohhoph
    gvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopeihihdurdhlrghisehinhhtvghlrdgtohhmpdhrtg
    hpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghp
    thhtohephihiuddrlhgriheslhhinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:UW3OaSvQPgXKIYdqzV_di97v7SWaJ3F2v58MqrD5OK8k7N9KPKh9IA>
    <xmx:UW3OaR1ZnmOR5wtbE-WNKKcUbD4-IQOS-j-lM4pm_rDRUiJwswQm2w>
    <xmx:UW3OaT6f_qcfg3Zs1RSKYeOqIRRDnNymlExb5Cp33-0R6wAVjIRTVA>
    <xmx:UW3OaYWlCvcUN1UfJcOF_96avoeTqZfxZvmFz8qNY7O1WuxUEMGsUw>
    <xmx:UW3Oabj8BEFH2v-GIv3SY7WvOLEABRn5WU-mFVPEtIed3crI-hIH_XnV>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 65BE1700065; Thu,  2 Apr 2026 09:21:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AjLN7vUTjgbo
Date: Thu, 02 Apr 2026 06:21:00 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, "Xin Li" <xin@zytor.com>
Cc: "Yi Lai" <yi1.lai@intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, "Khan Shuah" <shuah@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
Message-Id: <bd0caa85-f92c-4c06-ba8a-0b3a80f00f5b@app.fastmail.com>
In-Reply-To: <C318F823-C3B9-49D1-8048-C57E34538F4D@zytor.com>
References: <1D8D9EE4-D652-4E09-86C2-2D3FAB151100@zytor.com>
 <B916BEC6-D778-46FF-8271-D6BE6EBD042B@zytor.com>
 <C318F823-C3B9-49D1-8048-C57E34538F4D@zytor.com>
Subject: Re: [PATCH v3] selftests/x86: Fix sysret_rip assertion failure on FRED systems
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Wed, Apr 1, 2026, at 10:54 AM, H. Peter Anvin wrote:
> On April 1, 2026 7:36:48 AM PDT, Xin Li <xin@zytor.com> wrote:
>>
>>Thanks!
>>Xin
>>
>>> On Mar 31, 2026, at 8:15=E2=80=AFPM, H. Peter Anvin <hpa@zytor.com> =
wrote:
>>>=20
>>> =EF=BB=BFOn March 31, 2026 6:59:06 PM PDT, Xin Li <xin@zytor.com> wr=
ote:
>>>>=20
>>>>=20
>>>>>> On Mar 30, 2026, at 11:03=E2=80=AFPM, Xin Li <xin@zytor.com> wrot=
e:
>>>>>=20
>>>>>=20
>>>>>>>>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>>>>>>>>> regs->flags'. This check relies on the behavior of the SYSCALL
>>>>>>>>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
>>>>>>>>>=20
>>>>>>>>> However, on systems with FRED (Flexible Return and Event Deliv=
ery)
>>>>>>>>> enabled, instead of using registers, all state is saved onto t=
he stack.
>>>>>>>>> Consequently, 'R11' retains its userspace value, causing the a=
ssertion
>>>>>>>>> to fail.
>>>>>>>>>=20
>>>>>>>>> Fix this by detecting if FRED is enabled and skipping the regi=
ster
>>>>>>>>> assertion in that case. The detection is done by checking if t=
he RPL
>>>>>>>>> bits of the GS selector are preserved after a hardware excepti=
on.
>>>>>>>>> IDT (via IRET) clears the RPL bits of NULL selectors, while FR=
ED (via
>>>>>>>>> ERETU) preserves them.
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> I don't really like this.  I think we have two credible choices:
>>>>>>>>=20
>>>>>>>> 1. Define the Linux ABI to be that, on FRED systems, SYSCALL pr=
eserves
>>>>>>>> R11 and RCX on entry and exit.  And update the test to actually=
 test
>>>>>>>> this.
>>>>>>>>=20
>>>>>>>> 2. Define the Linux ABI to be what it has been for quite a few =
years:
>>>>>>>> SYSCALL entry copies RFLAGS to R11 and RIP to RCX and SYSCALL e=
xit
>>>>>>>> preserves all registers.
>>>>>>>>=20
>>>>>>>> I'm in favor of #2.  People love making new programming languag=
es and
>>>>>>>> runtimes and inline asm and, these days, vibe coded crap.  And =
it's
>>>>>>>> *easier* to emit a SYSCALL and forget to tell the compiler / co=
de
>>>>>>>> generator that RCX and R11 are clobbered than it is to remember=
 that
>>>>>>>> they're clobbered.  And it's easy to test on FRED (well, not re=
ally,
>>>>>>>> but it hopefully will be some day) and it's easy to publish one=
's
>>>>>>>> code, and then everyone is a bit screwed when the resulting pro=
gram
>>>>>>>> crashes sometimes on non-FRED systems.  And it will be miserabl=
e to
>>>>>>>> debug.
>>>>>>>>=20
>>>>>>>> (It's *really* *really* easy to screw this up in a way that sor=
t of
>>>>>>>> works even on non-FRED: RCX and R11 are usually clobbered across
>>>>>>>> function calls, so one can get into a situation in which one's
>>>>>>>> generated code usually doesn't require that SYSCALL preserve on=
e of
>>>>>>>> these registers until an inlining decision changes or some code=
 gets
>>>>>>>> reordered, and then it will start failing.  And making the fail=
ure
>>>>>>>> depend on hardware details is just nasty.
>>>>>>>>=20
>>>>>>>> So I think we should add the ~2 lines of code to fix the SYSCAL=
L entry
>>>>>>>> on FRED to match non-FRED.
>>>>>>>=20
>>>>>>> Yes; I'm afraid I have to concur. Preserving the clobber on entr=
y for
>>>>>>> FRED systems is by far the safest choice.
>>>>>>>=20
>>>>>>> Aside from this selftest, fancy debuggers and anything that can =
transfer
>>>>>>> userspace state between machines might be 'surprised'.
>>>>>>=20
>>>>>> Thanks Andy and Peter.
>>>>>>=20
>>>>>> Indeed, making the selftest branch on FRED vs. non-FRED behavior
>>>>>> is not a good practice. The selftest should validate ABI consiste=
ncy.
>>>>>>=20
>>>>>> I agree with Andy's option #2, so this should be fixed in the FRED
>>>>>> syscall entry implementation.
>>>>>>=20
>>>>>> Li Xin, does this direction look right to you? I can assit with
>>>>>> validation and keep the selftest aligned with the agreed ABI.
>>>>>>=20
>>>>>=20
>>>>> Yes, consistency should take precedence over hardware-specific var=
iations.
>>>>>=20
>>>>> I would like to hear from Andrew Cooper and hpa before we do it.
>>>>=20
>>>> Per Andy=E2=80=99s suggestion, the change would be:
>>>>=20
>>>> diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fre=
d.c
>>>> index 88c757ac8ccd..a19898747a2c 100644
>>>> --- a/arch/x86/entry/entry_fred.c
>>>> +++ b/arch/x86/entry/entry_fred.c
>>>> @@ -79,6 +79,9 @@ static __always_inline void fred_other(struct pt_=
regs *regs)
>>>> {
>>>>    /* The compiler can fold these conditions into a single test */
>>>>    if (likely(regs->fred_ss.vector =3D=3D FRED_SYSCALL && regs->fre=
d_ss.l)) {
>>>> +        regs->cx =3D regs->ip;
>>>> +        regs->r11 =3D regs->flags;
>>>> +
>>>>        regs->orig_ax =3D regs->ax;
>>>>        regs->ax =3D -ENOSYS;
>>>>        do_syscall_64(regs, regs->orig_ax);
>>>>=20
>>>> It adds 4 extra MOVs on this hot path, but I don=E2=80=99t see it's=
 a problem here.
>>>=20
>>> We discussed this over a year ago, and at that point agreed that res=
erving the register was the desired behavior. Why has this changed now?
>>
>>Yes, that is technically cleaner.
>>
>>The question is, is the RCX/R11 clobbering behavior an established arc=
hitectural contract, or is it an implementation detail that software ign=
ores?
>>
>>I think Andy and Peter want to be on the safer side, which kind of ass=
umes that this is established.
>>
>
> Clobbering is never an architectural contract; clobbering is always an=20
> option. However, I understand the concern that a developer who writes=20
> software on a FRED system which breaks on a legacy system.
>
> Last time this came up, the policy we decided on was that a system tha=
t=20
> clobbers must do so in all cases (in order to not leak internal kernel=20
> state) but a system that can preserve (FRED or IDT-without-SYSCALL) ma=
y=20
> always do so.
>
> I would prefer if we could defer this policy reversal for a bit. Since=20
> there is production hardware out now, I have been working on actually=20
> tuning the FRED code paths, and because the Linux kernel is so=20
> efficient, details matter in surprising ways.=20
>
> I *particularly* dislike clobbering registers on the way *into* the=20
> kernel, though. That needlessly makes them unavailable to a debugger,=20
> and one of the benefits of FRED is improving debug visibility in some=20
> specific cases.

I don't really agree.  For quite a few years now, we've tried to make th=
e exit path uniform, and we have this logic in syscall_64:

        /* SYSRET requires RCX =3D=3D RIP and R11 =3D=3D EFLAGS */
        if (unlikely(regs->cx !=3D regs->ip || regs->r11 !=3D regs->flag=
s))
                return false;  <-- fall back to IRET

and this is not just an aesthetic thing -- it allows us to have deliver =
signals and implement things like sigreturn without needing to track ext=
ra flag bits that mean "well, actually, we're in the syscall *code* but =
we're not returning from a syscall any more".  We had that a long time a=
go, and it was extremely difficult to understand and maintain.

So, on current kernels and kernels going back, I dunno, 10 years (I didn=
't try to dig out the git history, but I did write much of this code...)=
, the semantics have been that we return to usermode in a state that mat=
ches pt_regs as precisely as we can arrange.  For the one case where we =
have a very longstanding divergence between entry and exit regs, we have=
 orig_ax.

So it would be at least a fairly large maintainability regression to mak=
e the non-FRED SYSCALL behavior modify rcx and/or r11 on exit.

Now we have FRED.  Sure, it would be nice to remember the entry RCX and =
R11, but if we want to avoid the footgun where the effect of SYSCALL is =
different on FRED and non-FRED hardware, then we need the context after =
entry completes to have regs->rcx =3D=3D regs->rip and regs->rcx =3D=3D =
regs->flags (or perhaps RCX and R11 differently poisoned, but that seems=
 a bit silly).

If we really want to have the option to fish the original rcx and r11 ou=
t from somewhere or perhaps to have extra-bonus-efficient many-parameter=
 syscalls (I'm not sure why), then we could add orig_rcx and orig_r11.  =
Or we could invent a time machine and fix SYSCALL when it first came out.

--Andy
