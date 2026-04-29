Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D376367F23;
	Wed, 29 Apr 2026 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461134; cv=none; b=KgFqoe6RgDWlbBxau4pjqPPu3kB4OMmoZZ4QSUtQcCKhKkxJSpGjeOaYKaP2g/CEvok6csf2mENFxNSQyfayw0IoKvDSgmL6NshlcTlW6z6C+THQL0BeSNVso5ktwiWb3ORphiC3xy5mjcscW43Lpvn3XhKQ5vjcSKHX3AWmB/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461134; c=relaxed/simple;
	bh=UN/LpUGSq6uZdTullGI7kJ0DDrotboVgoBXQrKinqks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKxCkWHq91q23qo7afFzz06Z1AYhyoYVhil3HIEHFVNeL7t2rdhKXIJ7YfKiMaQdUGVT5SikSvvpe+HAmXlgrcj6teZyESoUqH+kO7CIRN71j6e/JLV9kuaHa5ZOwcWjL3zgRAfCVKKhHRvM+6PQFfEkpV6lk4bAJD5KIb70YUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jm5wtqlz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fMPRPIYb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jm5wtqlz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fMPRPIYb"
Date: Wed, 29 Apr 2026 13:12:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777461131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9OKrTvKyi1qF4R4Y+hqmG5tXCihSSMlepwODhvAnzo=;
	b=jm5wtqlzgO7IJVhJvVIM24re7dvbpBc4QGlaOha+IEPweRJLjcVk5ZNoFhVEqA65x+e5UX
	M2ByKzHRCTxumUraK/vhlxuN5C66VvjAMbobI+qyuAPsXzMOFgmcLFRDJE7nFEqaCAhVg7
	iiLUXnmX36DVgshKEoPdsZjEP5OgyFFMlHIQYDSbzD3qUXmm03xQs386p48gpuG0HjpvvT
	Ufe9ToLzO/0J30qip1DLLrVY/Xzt5Yh3sxjoR26QMWPuF8aawL5swADpM+PN/+pkWy8QV+
	Yqlk60QqQ/E8GAHltt3PpjvyyvlS5CYehIOK64Zk9c8QQusz79Aw33WSVyaOJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777461131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9OKrTvKyi1qF4R4Y+hqmG5tXCihSSMlepwODhvAnzo=;
	b=fMPRPIYbx45V5hR3DiyEZQSvhm6qeBWkb5ilPAHGhycpeg2rTZZKbDXK1FYfdemzy0AEXM
	U/12GnXt6vNiAEAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Yohei Kojima <yk@y-koj.net>, Shuah Khan <shuah@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: runner: Avoid spurious warning about
 missing failures file
Message-ID: <20260429131021-f3cf0fba-0944-4a58-a69c-34df628c42d7@linutronix.de>
References: <20260224-kselftest-fix-failures-file-v2-1-2bfb8f5cb6a8@linutronix.de>
 <ader8C3F2uOY7ro6@desktop.y-koj.net>
 <4915db6e-5bcf-4f70-b510-693f5d5b8678@linuxfoundation.org>
 <f4a213da-7016-4d87-a93f-ea205ab05aae@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4a213da-7016-4d87-a93f-ea205ab05aae@linuxfoundation.org>

On Mon, Apr 27, 2026 at 10:20:43AM -0600, Shuah Khan wrote:
> On 4/22/26 08:51, Shuah Khan wrote:
> > On 4/9/26 07:38, Yohei Kojima wrote:
> > > On Tue, Feb 24, 2026 at 04:37:56PM +0100, Thomas Weiﬂschuh wrote:
> > > > When runner.sh is *not* executed via run_kselftest.sh, the variable
> > > > $kselftest_failures_file does not exist. This triggers a harmless but
> > > > annyoing warning from runner.sh if a test fails:
> > > > 
> > > > tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory
> > > > 
> > > > Silence the spurious warning.
> > > > 
> > > > Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
> > > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > > Reviewed-By: Brendan Jackman <jackmanb@google.com>
> > > 
> > > Hi all,
> > > 
> > > It seems this patch hasn't been picked up yet, although it already got
> > > reviewed by Brendan. This bug is also mentioned by a netdev maintainer
> > > and several developers [1], so I think it would be nice to have this
> > > patch merged.
> > > 
> > > [1]: https://lore.kernel.org/lkml/20260112135326.7ce71119@kernel.org/
> > > 
> > > I confirmed that it still applies to 7.0-rc7. I also tested it by adding
> > > a failing test to net and namespaces selftests, and confirmed that the
> > > error disappeared.
> > > 
> > > Tested-by: Yohei Kojima <yk@y-koj.net>
> > > 
> > 
> > Sorry for the delay.
> > 
> > It disappeared in my Inbox - I will pick this up for Linux 7.1-rc2
> 
> Please rebase on Linux 7.1-rc1 and send it to me?

This actually doesn't seem to be necessary anymore since commit 2964f6b816c2
("selftests: Use ktap helpers for runner.sh"). So let's drop it.


Thomas
