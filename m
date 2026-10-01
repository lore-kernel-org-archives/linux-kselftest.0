Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AE4BD782;
	Thu,  1 Oct 2026 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848925; cv=none; b=RtI1fHXmAS3q+gIxraOTQpnZaq4BOASHs9OtRCGO7QN6r5xPtVheCz3M2VqN+meqHOmlG62jIEfRxGs7gCcScJ+x/kVg8D0vm6go3pIgAomjCQBv0PmyhhAhoy4Cga4aNEa+1j63l5mZsMaeZS9pxVibMptIXiKsWA5Uvm1PmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848925; c=relaxed/simple;
	bh=NHzN2YXmU8BLXeWCHs+b8V0pYB1gKOyCtkBAw3USOmI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JVWv9MWt2wX+oZBfv2cJ6bDN0irUZWTynX6rGvI6k5EjopZfwk152nSLzxboXdRh1lgfrT99FxuR+LPk1s4CoCyXlZwLVdmR3mv5+vBFaXAo/1hRYGZwvqCK8F4O9nxYWHQ3o42RtyaZ5QfD06F9WBKGxxxMm2GK7V7UIsav7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=J+9bbUt7; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="J+9bbUt7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Qhjkz5LGIQ5OQf96jD8ObHxGuARoVZWuTiE3aF/pzBw=;
	t=1790848923; x=1792058523; b=J+9bbUt7NCRMVmDoA+WX+CejOgMkWb4zv3BPoGnZSkOshpI
	9wYlhVfkAfrwH4xe0TTjexQX366zFoPm36psDG9WfRQUhFvinTBG30MQq2/px/QKNsgGSUXxigtBg
	oIaRdP9rzmq3rLJslCqJ5haCTkUGEyRIN41iIYPMPa+fKLiSPkHRPN7RTkPHGHTkAiD7CFPOKToUA
	oV+Q5i4NVECUftXjxrwZ71n20Y2viTmSeDhLzoHCpJ3shdTy8S9NZsH/r9B1gCvCUqk4w92YTK1/A
	CAcbyIl64s+M3BiqnXuG56FZg+3A8o3RM3tTP50E9/uYdStTu7wZjdqGTy+WSvXQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xCDbn-000000001cC-1VvD;
	Thu, 01 Oct 2026 12:01:47 +0200
Message-ID: <94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
From: Johannes Berg <johannes@sipsolutions.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "David Hildenbrand (Arm)"
	 <david@kernel.org>
Cc: Hajime Tazaki <thehajime@gmail.com>, linux-mm@kvack.org,
 liam@infradead.org, 	rbm@suse.com, akpm@linux-foundation.org,
 luto@amacapital.net, 	brendan.jackman@linux.dev, liuhangbin@gmail.com,
 corbet@lwn.net, kees@kernel.org, 	broonie@kernel.org, mhocko@suse.com,
 rppt@kernel.org, shuah@kernel.org, 	surenb@google.com, vbabka@kernel.org,
 wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, 
	geert@linux-m68k.org, daniel@thingy.jp
Date: Thu, 01 Oct 2026 12:01:45 +0200
In-Reply-To: <ar4br2vW7yZGd3gt@gremlin>
References: <20260929235711.2287931-1-thehajime@gmail.com>
	 <20260929235711.2287931-2-thehajime@gmail.com>
	 <bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
	 <ar4br2vW7yZGd3gt@gremlin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2026-10-01 at 09:42 +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Oct 01, 2026 at 09:08:33AM +0200, David Hildenbrand (Arm) wrote:
> > On 9/30/26 01:57, Hajime Tazaki wrote:
> > > Architectures lacking MMU don't support fork(2) syscall and only
> > > vfork(2) is available with limitations.  Thus, we cannot run kselftes=
t
> > > on nommu architecture as is.
> > >=20
> > > This commit addresses this issue with the following changes:
> > >=20
> > > - on test run stage, avoid calling timeout command when NOMMU=3D1 var=
iable
> > >   added to environmental variable, since timeout command uses fork
> > >   syscall which nommu platform doesn't support.
> > > - describe the difference of nommu tests in the document.
> > >=20
> > > So command line to build/execute tests for nommu should be like below=
:
> > >=20
> > >  $ make ARCH=3Dum NOMMU=3D1 O=3Dbuild kselftest-all TARGETS=3Dnommu
> > >  $ make ARCH=3Dum NOMMU=3D1 O=3Dbuild kselftest-install TARGETS=3Dnom=
mu
> > >  $ NOMMU=3D1 ./build/kselftest/kselftest_install/run_kselftest.sh -p =
\
> > >    -c nommu
> >=20
> > Is there a way we could derive that from the environment in one of thes=
e cases?
>=20
> I thought maybe uname could help but our LLM overlords tell me no.

Hajime originally wanted uname to indicate it, but that caused
regressions elsewhere, so we dropped that commit. I guess we could put
_something_ back?

> It pointed at something though.
>=20
> In fs/proc/meminfo.c:
>=20
> #ifndef CONFIG_MMU
> 	show_val_kb(m, "MmapCopy:       ",
> 		    (unsigned long)atomic_long_read(&mmap_pages_allocated));
> #endif
>=20
> So MmapCopy in /proc/meminfo tells us definitively, weirdly enough.

Hyrum's law and all that, but I guess it's not highly likely to (want
to) change :)

johannes
