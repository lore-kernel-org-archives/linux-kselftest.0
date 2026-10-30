Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793372065;
	b=MB0oiVLW6Gel8W6PCXt9OMNhYR1WFIJxpOh7OS8F7JUMCRXgCkNae+ojnuEFu5abDGth
	 jp+LgN3oarJ60YHlz7OKOj+fnA2F3KDPMVpMVzK1OqoDQPBiGew0H8SB9gjCsSPYm0dlY
	 fk1k6b8RATf5yBL9UJUHFjfjsl+1UwVQxT8yui9dYlqhFU3bfFcCV9tP4jqwlafOG74Vb
	 SqJcQ8GXCLrngsRIxdnSlUj/jy1t6s5g7zvv+vuCnTgdpSF8+I+iwFY3cOqCAkgs2vEsT
	 JD84qI01k5h7Z4cBpubujxWKgLL1I7iuJ490+4q8o4pTQAB/AU+li0aoy8xzz1g3XQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
	b=ZihM1Ks2DRGNHZBmU5sFBpanrMomSowavVkPPrKj05UPPwSeydF3Zfo/aP2Y5YbCL/q3
	 fXeEO93RbLENN0o9Jv+BuLXhwe/fW7V10Dm2wDXkxa5SXlmGX1jQRFRh6N04XLNUT7L2c
	 w3EcdQW4KO1npcjoRT0ri4Y0HqyggMPum/GnAthh4B0tRm4KL4VBcL1TH9K1XVxOiT0M0
	 q7QMv3Taig5zlv61MgWhSp8O4XaUoQdTKlXYYoYJ2G90lJG9kLCFEMrLniL7C3rOUrUeV
	 gNCCJ1so/ySrXC8Ela75xA1RZsB7tuS48PPlE7gPVWv/kKMqtxw1HIa96n03bwQE/Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=llSAjB83;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5AF606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 14:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=llSAjB83
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so797746e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 07:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793372063; cv=none;
        d=google.com; s=arc-20260327;
        b=ry5JOgMnGNdKaV3tZCjJmi6uyqK693mCkfeAlcvs+/6BlU+9yok+2GkGVWMqipONuc
         bG2OvAFeuRLrL865qkw/bQyle2RBbdA9ZnpUcStOjhroSjmAgVjdixTa9hBuJAI9ez+x
         hnvtLTg+LcEK0UazcFz12L8FZErz0fZrRAoDbDjQik5wBK+Ut7y/s0kJfmioooLyMWyt
         5MiDdkBltgGUC7i7x75elixtvl4fT2ZOEe8vcLdMWZPKSbrgwmTtbQtmWJVBd6WguP2E
         hbBrk000vSI28txpqpNlq5Z7Ul9PupLlFCYGnEVXafNxZhIuji2Eaqp7Evph9Q696Aot
         fVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
        fh=4OriJu+gjmjZHMKulRzjFv52VzOp6bpfjpUO477U+sU=;
        b=pcPnGINAtoHYpl3c4UI1EHfy9kK0I/mW+xPoawPQ/2oL2v9I1qLOVfSyBrxlZOiQOs
         uHhBRtOFD1P+P9Bk00PTFelJEW4ncWojchQxJXEFpM0ftpFI/1zCt0OifLa6FY9Ebnrg
         YSe9AVE7oKNW7lC/G0acvCs54NIS9VLs8HBNvF0emxc9agVesfVBbBkn6DOntorbsDs5
         R6IRULqdJ09RGOHccLRJrTE9CQkTKu8mSZ22+SF2aade/aukjEJ/1d3WZ9Z7yS/f44Ky
         K7Vt11184W3u1gSwgCMlQfDKCzQMyDvVhnHaP17EdnJOnAJAjG+kX7ycAbxgmmhM3mFL
         +WkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793372063; x=1793976863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
        b=llSAjB8353GhiWJmW3lo0k47FpkVKUdOxkuIOEucyL686RRVtqlcVe+w6TaigBAncs
         RuBiEjJ5RrmdukHl9fbglfLqkd2Dg+gjSdyMfUNinYhI7lTg3SjhAWHlmdLd+D8lytl0
         M1Rn3HwniQdcK7QDZQC67l3ULytWecMDkddi/H2Av5rBgVEioLJ5lIUl6VdFcNi8F8Di
         ZlrBvbaHyHBGra4g6QxFHMA0e8cVrMPmfnPiJB8gTSMYPlzsJT2zqxQo9dExYOy/fmGw
         DBqyFbwKfTBpdLVueOJy00qtFaDWF4VRQSHd1hnmI3eyBv0v9uPa3/SYP6vznJSqPqAm
         FduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372063; x=1793976863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMsUz0CmedXWqrdh2TheB4BjYFtAJcIsl6CPDLvVdyA=;
        b=DajmjquGYumg0GoOd/MPEFm4meCZroCdmNDDyiXdwgu9Lvd7JIZO1UrqjH9pOe+0Su
         paWYWBueXbxPWVihJFLM+4DbcWx9MFgyee8wmsWYaTEmnXrlkcdkC9UUYjB1u1pLzfZy
         fE3e0xGYcqgpD3FDSxKIRPvgoEizBDxSBvS6KohRGfET2k4tsnQBieJMSUoTYNmej1a8
         A+qdTVLGsLLLMoaxqqAUdBvfs5Egyu16R4sE+en90/bt97aOpZvgOMw2UpmFYjTnFnML
         xuOW3bXPbDFsJBTd0CAGYI22CpFEKAcKIMFEvaIO3W9/bLYm0mfeh87uHfRWqApSa9+D
         S4+A==
X-Forwarded-Encrypted: i=1; AKwUvBzVidr0VtHpwgUQVv2lh4JJssBAGuARpwanLAdKOs/MASCd86svjpApDdZ+sOEWGTHjNkN+Ahjd4dnpIMVxGSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiUNIuIJkDv0ULwKbs4s8TmtSVGJsYoKcbkelDUq7NI/PnBZKz
	xZ5y/bZtKIqL9BDAUhnKd+dS2Vr6rRqOW+R/iPXNMy453QU76hWLKsE097vPKDBw+KmGoI+LySj
	Je73G4+j+BxPNw+uoL15CERWkdMGEkV+dSvVnzMn7
X-Gm-Gg: AYBFou2e1YNGCtKBBRYO6qG5uTDR6CPb5/0Cpjl9RfvNR4a90wl5eB/IRnf50Yqe47k
	2jX9JnBMlgSqEuDf2k3GnLnbTFqbuJOwha0sCIfHC3VP1dlc62Vr4/2te/vra5VktiycXdPgWkY
	czx5Q6XjEVhXOqoJFVay3B5Z7O2KSyPNDdWQ2BlUT3MxGj92VW0aOJo/T/mKHfHAWMcc531JGWJ
	I1rvc2izhkqo80NAXLKP0RXAST2oNc6DkFHv1ITmhfSfIpeOkHiMcnvEzFZl7dmaoFl2LGMko++
	eH2WWZ5SgWjN2wO7+TsiyiDHY64g42mft+Ew2T2/FSWGiiEul9yVW8GuU3wZdAFOfXdSQ+L2UnX
	UkgFC0TymTuY8mqTgllDPw4DL7vLXefbDrw==
X-Received: by 2002:a05:6512:3402:b0:5bb:7b2a:5b2d with SMTP id
 2adb3069b0e04-5bfd9566d37mr824353e87.35.1793372062806; Fri, 30 Oct 2026
 07:54:22 -0700 (PDT)
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
 <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com> <20261030121259.GC3889730@ziepe.ca>
In-Reply-To: <20261030121259.GC3889730@ziepe.ca>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 30 Oct 2026 07:54:08 -0700
X-Gm-Features: AclHuK8DrMlKsyKpQjiDV0_C05DMTWGTaa3ilPqU973TM9OhhHNjeL5jGLxSymM
Message-ID: <CALCETrW6RUgTGFuqx+cxV0c+Oq4d-P5C8AQ2ja0ESMP_8JGpxg@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 5:13=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Thu, Oct 29, 2026 at 07:11:25PM -0700, Andy Lutomirski wrote:
>
> > I can't shake the feeling that the problem here isn't so much that KHO
> > + iommofd doesn't like this but that the behavior in question is
> > nonsensical.
>
> It has been this way for ages, like David says if userspace shoot
> itself in the foot it should not be surprised by this illogical
> behavior..
>

I dunno, a couple weeks ago I tracked down a 20+-year-old bug, and now
it's fixed :)

> You can get the same nonsenscial thing with just mmap too, you don't
> even need a memfd.

I feel like there are multiple levels of footgun here.

mmap anonymous (or MAP_PRIVATE), pin the pages, munmap: okay, mmap
creates unnamed private memory, and munmapping is maybe like unlinking
a file -- if someone else is still accessing it, it's still there.  In
fact, you can mmap, fork, unmap, then mmap in the same location, and
your child process still sees the original memory.  It's not clear to
me that anything is wrong.

mmap anonymous, pin, MADV_DONTNEED: okay, this one is starting to be a
small footgun.  But at least it's pointed at *your own feet* (unless
you've forked, which in which case maybe it's pointed at a related
process' feet).  I would still argue that the kernel could notice that
it's false that I "DON'T NEED" the memory and fail or ignore the
request.  And the kernel's pages are still anonymous.

mmap a named file or memfd, pin, truncate or punch hole: who says the
footgun is even pointed at my own feet?  If I mmap a named file,
SCM_RIGHTS it to you, and you mmap it too, and then I punch a hole,
the rmap machinery had better invalidate your mapping along with mine
(and get the TLB flush right!), and it would be an unambiguous and
severe bug if this didn't happen correctly.  After all, what you have
done is to assign a *logical range* within the file an address in your
address space, and nothing I do should change that fact (except,
sadly, truncate, which can give you a SIGBUS, but your vma still
logically refers to the file).

So why is the kernel exempt from keeping its own mappings coherent the
way it keeps user mappings coherent?

What if that memfd (or tmpfs file or whatever) is shared between
multiple processes that don't trust each other?  One of them can cause
it to become incoherent from the perspective of the other one's use of
kernel APIs.



P.S. You can access the offending APIs from a VM guest using balloon
in typical implementations.  If the host userspace does not strictly
enforce that the guest doesn't balloon memory that is not ordinary
host memory *and that is absolutely not in use for any sort of
kernel-side pinned-folio IO*, then the guest may be able to cause the
host kernel's or hardware's view of its memory to become incoherent.
Heck, host userspace could literally use a memfd to share memory
between the guest and a separate host process that implements a
device.

P.P.S. It's possible for there to be a legitimate security boundary
between user or guest code and a future version of *the same*
userspace or guest, via DRTM.  Someone should build a guest that sets
up some form of host-kernel-pinned-folio IO (IOMMU or simply a
host-side emulated device that works this way), then
DONTNEED/REMOVE/hole-punch the memory, then do the DRTM dance and
attest to its state.

--Andy


--=20
Andy Lutomirski
AMA Capital Management, LLC
