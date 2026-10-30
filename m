Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389986;
	b=uqGv4U133wrD/mWSRkpQVMcjrcM89E86w9fSTphphdyCuPRwsqaGacJxeJAbdHqF4+RJ
	 JCyTRqOWu+q/bBTRdi2ytiIqN/KLUePlfojcCxf5FVvSr4gwnlNVc/bow1aSalmrKjVTV
	 2qZb3FaAHzd8kTbUgCHY8XcHc3OORu5EPB/0xt+wShbvW/ec3yut1CgZYokBeZJZ67NAW
	 9tyF0WB2zDeM8hMmBKYcpG1iLiHsIa2sP5Ry644Wa22GQKpS/dVq2yBO6UFszh24okL4d
	 a2V57w+vII4Gf6W/7kCWajcysF8UovoHBSuJSSymnFRrShtA3+wjJ/YBwvAc+P9xCgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
	b=4OINd5DPF+eqJbYY9J3DZJbU7Xy/xe3vDopISCiQAQYOg8xT/2r13jDKHJ+Vsuv4ZZcs
	 5k+IcdugKJSeNvvvPcZYZDtbiu21AQnPko7cs95ZOBZQf8X0IWNTl0JZB8DEmCDnnlMAO
	 QpfHuA71OwPUFqIr9tlkGBLtXvM4Cv+bk3they5ANXDvTC4L29doWrCg8/lV01YxKphpA
	 GZjgfkOJzzSxoQZ7L9oGudXO//czQqHhmDxPFfzUO8YRK7kCgP+wsTLjeYg8O0Gchk7w8
	 n29OZ/ehzNqZ3/f258vS3G/HX8z9ylfpdevFUzhBWKLq7C9qsufVKAh41xSGEWr4OpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Qe/gAcEi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AD606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 19:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745AD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qe/gAcEi
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5367cc15121so12737841cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 12:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793389980; cv=none;
        d=google.com; s=arc-20260327;
        b=rq11temfvdsX3eCRvhMQaLQYTXAN/2LUopoRnAFIDtlfmtvu1pJO6FyAM26n61RnD+
         Y9lLYMhFm1Zx/B1IdXTO7Rgplcriu+PNIx2ZbAnLNq5kHCBgQFOCHWRixsORTLaUAaud
         4W2ufeGe68EDpEueBrtFcAC1qplsx8DInM0De3+jhmoc1I4JDp8qNd5oX8OKLHHoqezX
         z1ecnMQfILEXv3DCg/Hh8pK3yv4Rs2xo0R5PJkzQOuckqYQLul+epWqk57OM+BahUkZ/
         vkvqWGHlTXs+b8nXjrZbg0VsDNQFTrYS6jSJbK4N6UXNjQfYrdysuBu4BDOr5wudO00a
         dU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
        fh=SqKI554yh2/eyrdjUAqRVeavFlXkHHjj/VTGlMZXtqU=;
        b=ap3VzcUguvGmmm31xqCaGx4+3KfURHBrtrnaPxbgahAvk09zS0q8G91Lc+On5WEfTY
         gUiePHiQ1DAeXhUNzcsR/dM23MVTEuXnZ/OPXZPk+9XHt59wuc/+gxTSN33x21jmtK55
         /kW+8sMA5A2UmyOp0UXThIuH1KK17Pd03rQiHkGfaq1P9FmTmEAX4je4uO0G6B5GmHwy
         474+wNHx9EmwJ1Y80bQIg3ccya8FTLFngxB96QscmQlW+gRTfE1XPFg6LQ0wvnXX6jNs
         AxUqbNdbZIkIZ4x2ciWRydwc6cRWHQOOBPWZvV/LTMCybNvEOXFHNNGxZMwzrhlOvLRi
         tG9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793389980; x=1793994780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
        b=Qe/gAcEi05CmazbVFGJG6MC2y/lEV7BIPbL2moKmqBCgaUI1F0umwaCz7ccXtSM3Nm
         E0Jlp77DRyMTuUTf82/ojtyzo+CDbCzVaywRB/kOgDeOdjojaKSMrwm8R4M1HZ+6y800
         65mX5dfPNYKxwGQLspt8lgAAXSkzCdzoJeYHJ0CmZAlzse46eVRnPq9toAwzBv6D0msf
         PGGRhbir0eSUeuhde/eAv8CsqKwzj8vcXXAUrqC7AsGUCmpxjaKI8BjRkdf6XLOjgJtO
         Xl8FNOUbs7wAtPKFLtgPn6BEquVGDezxdUaLdmxEOvsiOtzr6Aw80PTpSTYzYsLicEsX
         cD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389980; x=1793994780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
        b=epuAziqwf2ibTceJV2feGfK45wlN66QlScBm8Er6Df4FBwS3GCNxPr1j/cKQgmmQux
         pzGYnqLbRo9kltvZEZAgbienvIBLX/MXA92m/6/YMfXdVnCMJ5xlWg9xxORW/iC7tCfg
         2dnJIXisXTDBaqly6AaVihOm6wScR2LakGxVxJx8T7Eq65GZ2/iMvKq0+MqyheOQXVU/
         2CbeUcPFSR4zSkP5AknwMqJT2bHK6l3kHNTVPzJXUSOR/sqwRnFM2C72OJeOf1J+yaXP
         rUNIRWMVfvAzCTMe1ztSVkEBil1zsZId3aV+fQxgbYCPjRIweF5J66LUoQv8TLebp2ou
         bHyg==
X-Forwarded-Encrypted: i=1; AKwUvBz9o2QxtwsH1N3dAD1eRk+5X94XlsEBIfwatr/fVF3Jn2RwVH6uNGtOFaZxeVNrlPjRsjcIXlHQZmGWOMkeTL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLJMJcf0EWk0+NsQssVUl4LEWHRoGi5pL9yUme8KoDo+DbDEwT
	fmdOv6VQpxDFWnP8lqxeMipfhbbtmWVRFmjuOoVDPmrEtmOB6aHVhL/nwelVz/01sV4EB9YFSsf
	UvFDdWctuxEr42nWso3paG0hQoJXK0oSnVM57X9lE
X-Gm-Gg: AYBFou3kVRLb6BHnQzYdVU8UAI6EIcme6omgr3ydn7IaDnM9+RoR28xShkDM3bjK0Zu
	ZqrNtY3aDkZ1/2qh0KIQ4Vd6EV10cNYbwjxYXZIlKBwaJfQtr8lOn0T3CQco+sioucz/lAulnzc
	X7SDy4WZIyl8btawt5dTAhq+rZhtOrQ7hzQ6DpfMtaCR1k9ui5kFVa0W0HjXwNBvDMl+Yu8sci2
	rrBP6SeIthZcNqX9Xpv/sSb5/OGVgfu3U8tlwIXVcLkL2H3I+s/oK3UJnx+5UnDtknHd0ZOwZGR
	XzZfpgx+vWza77km7nFRt89UV23lSh6HfGBkC8wrDJnDCm8a/7cV0iit/p5g63ppkbdPV1A0HO9
	+lvXl/R0SjWm679syJKpbzW6p86LqAQ8aDlcsIKeXZl3aPRvG1hRj7dw=
X-Received: by 2002:a05:622a:34e:b0:536:43d6:2a94 with SMTP id
 d75a77b69052e-542b7145036mr51380891cf.34.1793389980143; Fri, 30 Oct 2026
 12:53:00 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com> <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
 <auEksxfAi9lHFXmT@google.com> <CALCETrXDY2e8x2kdr-FQvFLs-Y7FwNozXGDvqqM6yvVA7QLV3g@mail.gmail.com>
 <auPKfqh_YjRU9Ui3@google.com> <CALCETrUEyfvaEGxMHo=c0ia3CDgSxg-YW0_=Z7T31Ou+pvicuQ@mail.gmail.com>
 <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com>
 <20261030121259.GC3889730@ziepe.ca> <CALCETrW6RUgTGFuqx+cxV0c+Oq4d-P5C8AQ2ja0ESMP_8JGpxg@mail.gmail.com>
In-Reply-To: <CALCETrW6RUgTGFuqx+cxV0c+Oq4d-P5C8AQ2ja0ESMP_8JGpxg@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 30 Oct 2026 12:52:45 -0700
X-Gm-Features: AclHuK9sB5PkTPxFH6Td3Meg7Fy9jFpGf4zpslN407GFn3D8So9__FrNUMzsHq0
Message-ID: <CALCETrUGa4zE3Zx+5Dw_UYEFgMmgDYQUeCxvPKv_-u56hQ1W7A@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:54=E2=80=AFAM Andy Lutomirski <luto@amacapital.ne=
t> wrote:
>
> On Fri, Oct 30, 2026 at 5:13=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wr=
ote:
> >
> > On Thu, Oct 29, 2026 at 07:11:25PM -0700, Andy Lutomirski wrote:
> >
> > > I can't shake the feeling that the problem here isn't so much that KH=
O
> > > + iommofd doesn't like this but that the behavior in question is
> > > nonsensical.
> >
> > It has been this way for ages, like David says if userspace shoot
> > itself in the foot it should not be surprised by this illogical
> > behavior..
> >
>
> I dunno, a couple weeks ago I tracked down a 20+-year-old bug, and now
> it's fixed :)
>
> > You can get the same nonsenscial thing with just mmap too, you don't
> > even need a memfd.
>
> I feel like there are multiple levels of footgun here.
>
> mmap anonymous (or MAP_PRIVATE), pin the pages, munmap: okay, mmap
> creates unnamed private memory, and munmapping is maybe like unlinking
> a file -- if someone else is still accessing it, it's still there.  In
> fact, you can mmap, fork, unmap, then mmap in the same location, and
> your child process still sees the original memory.  It's not clear to
> me that anything is wrong.
>
> mmap anonymous, pin, MADV_DONTNEED: okay, this one is starting to be a
> small footgun.  But at least it's pointed at *your own feet* (unless
> you've forked, which in which case maybe it's pointed at a related
> process' feet).  I would still argue that the kernel could notice that
> it's false that I "DON'T NEED" the memory and fail or ignore the
> request.  And the kernel's pages are still anonymous.
>
> mmap a named file or memfd, pin, truncate or punch hole: who says the
> footgun is even pointed at my own feet?  If I mmap a named file,
> SCM_RIGHTS it to you, and you mmap it too, and then I punch a hole,
> the rmap machinery had better invalidate your mapping along with mine
> (and get the TLB flush right!), and it would be an unambiguous and
> severe bug if this didn't happen correctly.  After all, what you have
> done is to assign a *logical range* within the file an address in your
> address space, and nothing I do should change that fact (except,
> sadly, truncate, which can give you a SIGBUS, but your vma still
> logically refers to the file).
>
> So why is the kernel exempt from keeping its own mappings coherent the
> way it keeps user mappings coherent?
>
> What if that memfd (or tmpfs file or whatever) is shared between
> multiple processes that don't trust each other?  One of them can cause
> it to become incoherent from the perspective of the other one's use of
> kernel APIs.
>
>

I'm contemplating what would be involved in fixing this for real.

First, there's a scary code path in shmem_replace_folio.  AFAICT
memfd_pin_folio() can race with swapout, so a pinned folio can be in
swap cache (obviously we won't *free* the folio if we do this).    If
we then decide to replace the folio when we swap it back in,
shmem_replace_folio() will not notice the pin and we become incoherent
and no one needs to hole-punch the file for this to happen.
Fortunately I haven't spotted a reason that shmem_should_replace_folio
would return true in a case where we care, but if someone does what
the comment suggests and makes it start respecting cpuset or NUMA
policy, this could easily change.

Other than that, I think that hole punch could be made to be fully
safe in one of a couple of not-horribly-invasive ways:

Choice A: Make hole punch work like migration.  Unmap from page
tables, do folio_ref_freeze(), and tolerate failure -- either just
abort the hole punch operation or zero the contents instead of
punching it out.  (And contemplate whether this could be made slightly
more permissive by tolerating a swap entry that still has a live folio
if the live folio has the expected number of references.)

Choice B: In addition to tracking references, mappings, and pins of a
folio, also track a new type of reference that keeps the folio from
dissociating with its mapping or changing its address within the
mapping.  Most code that pins a folio would be changed to take one of
these fancy new pins -- the main thing I'm thinking of that wouldn't
need to is writeback or perhaps non-long-term pins that are just
reading the contents.

Choice C: like B but instead of deciding per caller, treat exactly
paths that take long term pins as also pinning the folio into the
mapping.

For B and C, a big open question would be how this interacts with
truncate.  I think the idea behavior is that a mapping-pinned folio
that's past the end of a file would remain and if the file gets
extended then that folio would represent the portion of the file that
it covers again.

--=20
Andy Lutomirski
AMA Capital Management, LLC
