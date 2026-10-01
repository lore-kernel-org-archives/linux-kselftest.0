Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0F4A7C9B;
	Thu,  1 Oct 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844177; cv=none; b=UdmtB6B3Z5YJ2SKEE1qByPKYA988q95sHwsVMMFAOFClOO5ivh7jsbpFMQg2LrytDWuIiEEUSlamUcnQ+YVTbw+VAiKe7HEeZ1c97aNNLtcqGAf3UO+qP7E8CYTRboSHst5WfHRihQn5JTicPjIWe8bhpkrhGfj+xf5u8laBm3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844177; c=relaxed/simple;
	bh=NAbC+qPR5/Vl9qeDYieSarvWy2HoqYd60EYVgH5co6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=or83aSk5Wke4MglP182Yky3cJ1mfT+w3bfAWJFr260bsu1tzSCosEHAqRQlQ1dWWRsJ2IKY8MrKVi6TotdVsPMwQ1ddfmFcGtzcxOtk6AsL1AcN320ToZqjMxQkplGkUkGWoR/2sLw7DIT0GFoaouCVKlxznGVDFuaqJ6oVvPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRf36Abp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRf36Abp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A82A1F000FF;
	Thu,  1 Oct 2026 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790844172;
	bh=TnzQmvC3sunYN3GNXk1Foa5cJ0VirJG5aSp7n+hYENY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRf36AbpG/tNmQziL1i7biGBsDrpNwePS1Hc7bPUNXRDlTe3JSL7h4VZXHkc5TyEK
	 /LsnOg34Y7B6NJ7Utc36TMCrNNJ1IuFksJEww5Np8KSmDpMzXijdqOGzdBlV5JFoej
	 UMJkCwMeXRkpF0Nj/QP/dbokZ9eFfYuu/3WJwWBwsdni72HmYC+TO7m3ofNPXvO5c+
	 XBaIlWGwN6T63hTPLEDp0qi02TKmljR+MmaHpPRcd3kqFtJ9y5Ru7GuFI2pf8OH0Da
	 itxDrLPVB9H0NKre8mVDdg3f8loxIEv5w19+TIXuUG+6eTu2yJcVnA+yQxqi+3BPJZ
	 OiasMCzsukuIw==
Date: Thu, 1 Oct 2026 09:42:44 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hajime Tazaki <thehajime@gmail.com>, linux-mm@kvack.org, 
	liam@infradead.org, rbm@suse.com, akpm@linux-foundation.org, luto@amacapital.net, 
	brendan.jackman@linux.dev, liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, 
	broonie@kernel.org, mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, 
	surenb@google.com, vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
Message-ID: <ar4br2vW7yZGd3gt@gremlin>
References: <20260929235711.2287931-1-thehajime@gmail.com>
 <20260929235711.2287931-2-thehajime@gmail.com>
 <bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>

On Thu, Oct 01, 2026 at 09:08:33AM +0200, David Hildenbrand (Arm) wrote:
> On 9/30/26 01:57, Hajime Tazaki wrote:
> > Architectures lacking MMU don't support fork(2) syscall and only
> > vfork(2) is available with limitations.  Thus, we cannot run kselftest
> > on nommu architecture as is.
> >
> > This commit addresses this issue with the following changes:
> >
> > - on test run stage, avoid calling timeout command when NOMMU=1 variable
> >   added to environmental variable, since timeout command uses fork
> >   syscall which nommu platform doesn't support.
> > - describe the difference of nommu tests in the document.
> >
> > So command line to build/execute tests for nommu should be like below:
> >
> >  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu
> >  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
> >  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
> >    -c nommu
>
> Is there a way we could derive that from the environment in one of these cases?

I thought maybe uname could help but our LLM overlords tell me no.

It pointed at something though.

In fs/proc/meminfo.c:

#ifndef CONFIG_MMU
	show_val_kb(m, "MmapCopy:       ",
		    (unsigned long)atomic_long_read(&mmap_pages_allocated));
#endif

So MmapCopy in /proc/meminfo tells us definitively, weirdly enough.

Therefore you could have:

function is_nommu()
{
	grep -q "^MmapCopy:" /proc/meminfo
}

if is_nommu; then
	...
fi

>
> I'd assume once could compile and run the nommu um variant, and within there
> simply build the selftests and run them?

Yeah be nice to have something that made it easy.

I'm quite excited about nommu uml in general for the purposes of easily testing
nommu stuff!

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
