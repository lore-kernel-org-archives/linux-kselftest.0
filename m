Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5833555F
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 18:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149857; cv=pass; b=HEaSUTmej22z9lBP5c2O2CNGzd5Rf65fQSABLZkdkPPj4fpTG8z0MNlcxZCjE3i/gY/Cm6ZA4u3roBCp7toCghVfvuhHa8wqf/eGImokIcWNxDgB7YJ1H1mQOvwXzLg+FnjLgjjXMOPdfmTvXZn/2eGnu4dwFrsSekYLq99YAoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149857; c=relaxed/simple;
	bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChdFGMIU51K0qelxMZ0+2H/t6qpq0656NrRd9ZYILvYzW7RRGIn46eLkBW72/53+0v4w1/LacSuykIVAjJKQH/Jdi5JDnRCb40a5l4yK625McAChMOuclCJ21llVwpSjRqvII0/9WIAD4lg8fe6ybZDUpy+gETkw6bkbl9nqpY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nwlwDK+o; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nwlwDK+o"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ecso39210d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 11:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789149855; cv=none;
        d=google.com; s=arc-20260327;
        b=LoUKytAgb+K66N6QRdXeKe6ulKcSGOKdaAcvO0BrqyiwMgkzHRrRr0weZyF30lp9SX
         SL5P86RunVOnmTIhl1ksE9q+5FPfZdKYYjpdEX25XnGTIs/cpU71WrMOxUOJIesMdyzZ
         t1NE4JPs5pAtqRn3w4kpxDwwltyDpQnP2XMAvFV8h9NAKQwBu/lJImOVspRJ4KAMOBf4
         v0FpP5/N3ac46t+tpJ1pqK0Sa6Pd32lB0uvw+SjBGzB13qVbbLUsu8w+RW3F+vufo0ca
         5VvPGrXSv04BxibutkZDLepLftQez2j2VFLdk2eKMcgw8BSzjwlDTiKWr4ba1MLmpTPg
         so6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
        fh=LotbtxS/AFwN2GfkB5wjnbtsM15SRJ+tvJypydLhp4U=;
        b=dSLc3v8INAZOlDYuqZtfL6d+NB7VFC/qI+/3EFOj0yPtCqhuKFpxS62sWzKs7QiELc
         rCi6AGcbX808YQ38P6+dGSoBgppyZ1oVHtnIBfijpSXkl+3gRqDyvk/+m71AZXuzq5cZ
         plmhlbYJTCquK3+7EmuU8HKJBqHcW5h6yfonbGhDY9FgMjC+vGMAk95SXswJiR3Yrkbh
         wuXlcuT05cqm8zc1CtKcsyXPvFqECR/UiZYd3wBIAdHn7Lni5qJQAJKQw+YaP1kXa+X4
         pZ6QQapfIstCX1B7R5N/g7QmJflGHEMghpRS6giMspmzaPmBJW3BaeRmk6Wtok2ba5rM
         udHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789149855; x=1789754655; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
        b=nwlwDK+oF5rRVt6prlgyTXdPTuANWb3YInC3RLtoRb9DPUL6vmc31XQw2fhjggvB6u
         VxbJgBdoU2rQ9bVGna7CZGI8CtPWsL0QQP9C18FvlGiN0IFOr24NqtyMUdMJ+o9DwfOZ
         4/yKFK0OMJZghYZME+uFpCMD7RekTxJi8+x9I4XK3uqCK+AMZG0SOR8ZcH/fFGrfNLtX
         nOnQDuSrxhhqlwFd86X77yW1qUtSKww9YmjjhdyXUZI693JXY6ipn7ciBIITvXIrVrb/
         7o2YgttRQwfriaN3Et+Uydmq7EP8i8wUt9KGrOceP2YEccsiQD9o/K949AOkIlc/Otk4
         MYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149855; x=1789754655;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vv9o4OWee1pnKi5CCaT/T/8GgHGqw9lOYuHZfnosco=;
        b=SPowetK+e2d2dfjilJJn9ghEuhx6qQvcJ83wblqsFqtjwCd8qOzR3G+Dch8+SJ936g
         ifU8638O813UO6wloIV8lDwQOWHZDdkZTGG9iOHd8WiQsYBoPB1Yk4yBIoTwVzLPTL0R
         IDj9rq9ad4J47kQQBW535xCre2aMoJYcryv7G6Zm+FkfQaotVMhHjASMHLs9OVqLpmt4
         wvB2P2pfDym1bnIi3wFfxIfkzuie4FHyOeQUUKoI1Z8pmF1WmJY+dt4zKIHt+VIeA8zo
         e1dxiEIpIVAjNHTbx172S8dEH0BZ8RZiMmOpmxUDban6j/WpbrMVm3jeIoJzTBv6zTL0
         RbaA==
X-Forwarded-Encrypted: i=1; AKwUvBwteUdMPErX7Chf2rH3jMpxyIs4+MQS2fKEjhlaFLUjVO7KXOGoz0ET81gOTfww7x1xsrRhTin+JNudykx5Wcw=@vger.kernel.org
X-Gm-Message-State: AFuF++lRjcv7yLP6/MuTfAEuyQ/Y31WQmLATWe+KWwjG1l3Jj4oR+jDo
	oRqkLH71Bx85MFr5haJEz8n5iEvG2/Xpdx/wFCy/GcKe6bno39Xgv7rrfeCzJPN7mw7F5uIB12A
	pG4SOQtLDxAjBzrUmdl69kA7ayHM2JdrbZMypS5uK
X-Gm-Gg: AYBFou0u9kpHJ2ebCPzhzMUEzg39T8Jc6op5BfpQV6PQpuTOMuKMn0eWn/fUnKsu9gg
	Ph/AJyfzTGM//8JJzTkPqyOSP8ta4ktDerOQxgjdUWy1MPuKIkjNmylMbn+TrlxtTruHHBFihpR
	CmF833To+WuG0ktRHkNJTdJR4KxTUDOPP2lXX87Tux+V71+QGGpYK33W8mbKSqUyzVN7dCFK3ue
	MbZpEtDXwowAs3v/i9Gz8O/nqVMQY1lFZaZRuVbIXMFr2n48ZMvYFvTjNVSdgz2IdhdzgwtnSed
	BAY9+WeeiY8TwN4GaVrsqcgEP0nv5al5ZGRFKNusQelFXLugyU78enT7btJckUyhikjYOslsSPp
	SfgAeqgdoe7VNGT7HLIVBxngYOj7Sj+LESu6lkKW3QQ==
X-Received: by 2002:a05:690e:1341:b0:66f:c1bc:87eb with SMTP id
 956f58d0204a3-671249f425bmr1974723d50.68.1789149852145; Fri, 11 Sep 2026
 11:04:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 11:04:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 11:04:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260901180713.4185641-1-dmatlack@google.com>
References: <20260901180713.4185641-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 11:04:11 -0700
X-Gm-Features: AcwNN1VDqbMSWzZBtW5WvtCjBXts_71wkcwIE-pv_51Ep9lT2w25BfsfGqo2_lU
Message-ID: <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
To: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

David Matlack <dmatlack@google.com> writes:

> This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
> UAPI to enable preserved files to be restored into a userspace-provided
> file instead of a kernel-allocated file, and uses this to support
> preserving tmpfs files in-place without any changes to the LUO ABI.
>

I'm interested in the idea of retrieving folios into an fd for a
different reason, I'm exploring handling over ownership physical memory
to a guest_memfd.

> The Live Update Orchestrator (LUO) API currently explicitly returns a
> new struct file for every preserved file during retrieve() (e.g. via
> memfd_alloc_file()). This then forces userspace to use anonymous memfds
> for all in-memory files it wants to preserve. This works reasonably well
> for VM guest memory but does not work well for other types of files that
> userspace may want to preserve (e.g. in-memory logs, binaries,
> configuration files, etc.).
>

Does this assume that VM guest memory is usually provided using
anonymous memfds?

More generally, is the problem that there isn't a simple way to
implement retrieval into anything other than anonymous memfds?

> Preserving entire tmpfs mounts in-place would require a large amount of
> kernel support and would effectively make tmpfs an ABI, which is a
> non-starter (or so I hear). Instead, we can delegate the reconstruction
> of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
> to userspace. The kernel just needs to preserve the contents of tmpfs
> files and provide userspace a mechanism to restore those contents back
> into a specific file on the filesystem after the kexec. Hence,
> LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
>

Suppose pre-kexec, the data was in a tmpfs file (and fd), how would the
preservation work? Would the user have to

1. Transfer the data from tmpfs fd -> anonymous fd
2. Preserve from anonymous fd
3. kexec
4. Set up the tmpfs fd
5. Retrieve into the tmpfs fd

> An alternative approach to restoring data to a named file would be
> supporting a zero-copy sendfile() that can be used to convert named
> tmpfs files to/from memfds across the kexec. But this poses significant
> challenges on the *preserve* side since the preserved file might still
> be actively in use. The benefit of the retrieve-into approach introduced
> in this series is that it does not require dealing with two different
> files. There is only ever one file that owns the preserved memory.
>

Would it be more symmetric if the process is

1. Transfer the data from tmpfs fd -> anonymous fd
2. Preserve from anonymous fd
3. kexec
4. Retrieve into anonymous fd
5. Transfer the data from anonymous fd -> tmpfs fd

As to the exact details of "transfer", I think the best we could do
would be some kind of move from one fd's page cache to the other fd's
page cache?

Is the goal of the transfer to avoid any memcpy and fully transfer
ownership (so, not just by increasing folio refcounts?)

> By leaving file and metadata allocation purely in the purview of
> userspace, programs can create the target files where they want, with
> the names and security permissions they desire, before directing the
> kernel to restore the preserved folios into them.
>
> Currently, only tmpfs shmem files are allowed as valid target receptors.
> Attempting to target populated files, or anything other than an empty
> shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
> the future.
>

Is this basically that at some point, all in-memory filesystems' fds can
support transfers?

>
> [...snip...]
>
