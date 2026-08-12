Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3275B3264F9;
	Wed, 12 Aug 2026 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568031; cv=none; b=tCV1Nod+0K8tt4M/FDjqMYmgvPdbc9mFBZN5J2n/PZOvWiA02sOe78I+nHI8jgIBDFbpzKu6QJ2Ebqa722WEQh0vsixf48aYvwzepwJvWVXN2ybg5NVlMNB7cgus4bpeuSBjEokmD0zCDBefINjS2qtWMD14gIg1gJZN3EzriBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568031; c=relaxed/simple;
	bh=M9QGDM1KqLTdFla2wm974yLTeHfJqV3ygrQdvB7+s24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R4uskLHbF7CSzDsnIXPWMn2VF3gqTJXZNcmZj+BlerWOyBl/H4CmseevDF+3TtS/AH9R8dL336ZAbNUXWsrKX78TgyFytioarCjUdq1W/8+znWFDxFbrHfgCs5wRyb+yRYO74/TS6qLV9DGqJ0yRUQYMtn9RaukrzpM0psyN2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=iXIlaaTT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EmOk8re1; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="iXIlaaTT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EmOk8re1"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5E16F1400085;
	Wed, 12 Aug 2026 16:53:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 12 Aug 2026 16:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786568028;
	 x=1786654428; bh=bQ9m7Q7dmHdZ5MJcHJrqRP+h3SPxy4zVB57uYgvnnQw=; b=
	iXIlaaTTHz9geRMm9yPtmjEpLOGhWFK7FtrvyHomxrbIUuRgJ4PENuojr191/O4y
	JDsud07p74Lka820811M19E8YueeTFjzTCIj8nNiI0XRaL7rAiTKJypM+5r0yEi/
	kkYbKn7m58/DbleeIr77/MqNQl497nAM9Dj2+pmqPUcr3KZOHGqImpbXPyucCYN9
	oHTtHJHEa72rN53pNpZv4tW2+FjBKjMxssZ2ZgEZay1PLc40X6CYg2szTZgxtnol
	95ynZzMiKWmZcE3ULic3YGS1nL9DrjtQFbx/uEJ78oP5iW31iMO+RG3GMoQI0MvJ
	altqU+l3UZbBNrGDGd1sIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786568028; x=
	1786654428; bh=bQ9m7Q7dmHdZ5MJcHJrqRP+h3SPxy4zVB57uYgvnnQw=; b=E
	mOk8re1lXgcCjB9P3MPrwC4y3qfaFf9tmdFuDcuFQOM8Kgsr1B3Id7PN4Ayy0UP5
	Iazs6wbJ3u3lqx+gj9Dh2PSkDvs0GSxCZ01l/T4booubT+LDGJIs6tNUFxGJMBqJ
	hZBgeT0inOr3/pOK/GTRqbhPRXmmp9Fnhp+gkCaBQnNtWlAqhMCpZnbal1HwRhxP
	HsVtIdkgLfkw5k56pYaCf6ZSdFFaWzXnIZwl4f7DyjxsCQ0uIkw1tiof3LSVBT89
	gz+owz/hF/NenBR6w/PPdXkMVY7HVWZg663VQRc6DLVc8Dp2pU13I+sPmeUirWaQ
	L+qjtgaZgnu3E6lOblmdA==
X-ME-Sender: <xms:XN18aoq0NY1bztjQMSF_TY9ZRkXo3ppSqyg6q-72erXp21OZt9Khdw>
    <xme:XN18akM6_S46itdwCbeO5vp5dY8PZ0E3_CkuxfS-7fLQsJxqQs5frA7j7xRRdIpc0
    rQSoSIDBMplF3-HUfh92YRl2J9F1_earaecCoEkBanmnMGf3hjqP5Q>
X-ME-Received: <xmr:XN18amyIP2hQjXQ04hiBqa6iPJGPkQfOnG6L1LE35tuHlYPo8E5Q7Htbbdnq_Q>
X-ME-Proxy-Cause: dmFkZTEIeVv7ilRNPS5NobhNyyujXSUBm8WRveEFl9t0zXAVuv8YKhZumruJPojImqbrg8
    qonzMOK7WiVnb0QkxJrQqYbTolkroKjAeLvbuNLa5AwxfRXQFu2WQoizdZKbAMejq+ybRZ
    TTeEWFX6RQH+nWL8X20u/cqFC3YNuKrErb1QXUIvrtY2eWAnAtRhV6JqGeq8axYy4/Fwsa
    cVjChW3ycxBJ8l9QCRtI1SJrazY8hWznvJplLl2BMByhysuDZ80mJims4jXSz5NO6kS153
    d3jiOAty8k0URgPNwxkzVKCig7cRQmzoQzWYn56BTEEYkpPGzP/49PmQ0/AiP2w7QL3cZR
    yWPamyoBYSY1N3+E/Ouxuio+98wnzobhPCDSNwPdL+aFUpCH7OiAVBtpvHZbuLJeYpyF3x
    OfSXd/UxPpYlbghKenhq/FS+9uoOfYgWkE1l+DMqOj2cRaWqN6qjf9z4vtB8VClTYJv6YH
    GFgyPFOmUMbNykvCsgxWfPRs3SOgr4I98SXJBRyNLnQUtZDbOjdCCe4UVYlq5st6J7ykLF
    qc67+D+fMqoFMkKtIewtjWiihu5Bd3Kt/A5un5JhK1d/Nx7LW+ldgro1aLFCMljntuu9Ot
    QfoblQkrIX/PeuIf2fB8oEYG1A2LKDWNribIowULsWUBxWMHrhmxhu9OA9lA
X-ME-Proxy: <xmx:XN18agxctMLOwm5M_bKKReoWdZ33D62xOb_DnqE_2LvXRRcj5iGQHg>
    <xmx:XN18avIUiqo6B4q8Spy685vCuuFxEtSxUMT7QUcZJCsx79vqoHQvwQ>
    <xmx:XN18asiiGqgExuLljob-gdYCiP-Zh4CWmc1xNnIvSImuiFLX87wtkQ>
    <xmx:XN18agM99tEEjPkH3PzU2SQsuX-PnqUBMRFHoGoSc6lJprqFUTmhgQ>
    <xmx:XN18am7Xi4DnDplbuWKKCPUHGSB6x8mRHUHCCvVR8J8E8a2ZuIOm10WQ>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 16:53:46 -0400 (EDT)
Date: Wed, 12 Aug 2026 14:53:45 -0600
From: Alex Williamson <alex@shazbot.org>
To: David Matlack <dmatlack@google.com>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, Andy Lutomirski
 <luto@amacapital.net>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?=
 <mic@digikod.net>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Shuah Khan <shuah@kernel.org>, Will
 Drewry <wad@chromium.org>, Kuniyuki Iwashima <kuniyu@google.com>, Aaron
 Lewis <aaronlewis@google.com>, alex@shazbot.org
Subject: Re: [PATCH v3] selftests: harness: Mark test fixture objects
 __maybe_unused
Message-ID: <20260812145345.6d987e91@shazbot.org>
In-Reply-To: <CALzav=eV_VBDqwko0Qp3kALK0fW5Ad_SHOdn+Gune8Nps0Opyg@mail.gmail.com>
References: <20260706183154.2660394-1-dmatlack@google.com>
	<CALzav=f3KaNQd2NgCTxU=VSXWujV+qjyQuNJp_hy1-U36RMPpg@mail.gmail.com>
	<202607150902.F17F8DE5@keescook>
	<CALzav=eV_VBDqwko0Qp3kALK0fW5Ad_SHOdn+Gune8Nps0Opyg@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Aug 2026 13:21:37 -0700
David Matlack <dmatlack@google.com> wrote:

> On Wed, Jul 15, 2026 at 9:03=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> >
> > On Tue, Jul 14, 2026 at 09:24:36AM -0700, David Matlack wrote: =20
> > > On Mon, Jul 6, 2026 at 11:32=E2=80=AFAM David Matlack <dmatlack@googl=
e.com> wrote: =20
> > > >
> > > > Mark _##fixture_name##_##test_name##_object __maybe_unused since it=
 may
> > > > not ever be read. This pointer is only read in XFAIL_ADD(), which t=
ests
> > > > are not required to use.
> > > >
> > > > clang made a change to -Wunused-but-set-variable (split out into it=
s own
> > > > subwarning, -Wunused-but-set-global) that causes this warning to be
> > > > emitted for various selftests and can be upgraded to an error in
> > > > selftest that set -Werror.
> > > >
> > > > VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> > > > selftests: Add -Wall and -Werror to the Makefile"), and the net
> > > > selftests builds have been noisy due to -Wall.
> > > >
> > > > Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between fo=
rked processes")
> > > > Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Reported-by: Aaron Lewis <aaronlewis@google.com>
> > > > Reviewed-by: Alex Williamson <alex@shazbot.org>
> > > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Signed-off-by: David Matlack <dmatlack@google.com> =20
> > >
> > > Kees and Shuah, is it ok if Alex takes this through the VFIO tree? [1]
> > > This fixes a bug exposed by recent VFIO selftests commit ff556bd98348
> > > ("vfio: selftests: Add -Wall and -Werror to the Makefile").
> > >
> > > [1] https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@s=
hazbot.org/ =20
> >
> > Yeah, please do. This has ample review. :) =20
>=20
> Thanks. Alex, can you pick this one up for 7.2 if there's still time,
> or for 7.3 otherwise?

Thanks for the reminder, applied to vfio next branch for v7.3.  Thanks,

Alex
