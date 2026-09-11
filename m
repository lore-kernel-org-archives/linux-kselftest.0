Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260B04AE8A3
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150546; cv=none; b=eP+QdVBaVk7aIfWEV5mrXiqeeybBSP3jcDliZUy8izmNlX4S6VBNAMqI9QwN0+A0gLYRA93/N6JKvGNi84rN1rS6ima3l01DvrnTr0vGYFHMsrsfU5Q8ftCjrYyaYjj/Y6VNzAKD4OaWjs/6pxN9AvFD03jiGA4R4SLGmNByU5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150546; c=relaxed/simple;
	bh=XuC6duna+ypAsjn/L/YAakjyZHi8UyQ73AzKSXoYD5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m49nq4FmC1Pt9n9vuzGBicy8P4gXM5AFihOGyg75vNb5dQLq4jzDOrFkP2NZAa+oESOT3j8GIiR2MCndRgoNg8rGe8CObZwf+qLzGD1TZwxXkVBoR4yqc0CHR/3CyclalNb0Ns8FHdvkWrBSlgBd/5bkW7LobDcHFvJk5r7bEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UHULIT43; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UHULIT43"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1048318a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 11:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789150543; x=1789755343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UoB/yhujSeic4Z83ePKaRXKf1DWcrbuqnOKvr88NN90=;
        b=UHULIT43P3sXegu9tUDZhAJowJYm/8k6XTpQPjf7NnEsNPuUqvdZNtKufclNlESmyc
         SjrCsj5O900VMwve5F8MqX2Km2ghl1k3zu4mqxKMPvQgWXGTPIkD5U3NRKdz4fdKdSw7
         dYKPXxnuv/6KcVcAw//4VWEvJ8PbeD6tr0wxx7IcOqHU4kYsyBjniDTQmIwxKeYl0Lvr
         fFyqd9ylnnZtrDx9khwEPosoVLCU4clFTmqGJ+SJjtx5daZYeUdfHPcuShdWGmVSh3P/
         +on6EoUnp4x6qcKTkeGEeLIGSj+bXdEUGR+N509wYbWNcQsjhzbwl3PMf3k/WULNm1MW
         AYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150543; x=1789755343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoB/yhujSeic4Z83ePKaRXKf1DWcrbuqnOKvr88NN90=;
        b=T6bYnn6Nme1IHoUoTz3JclLclbBi/XandHzT0mU7TExn2qLWMvF6fteDCLPl4hHDGj
         S02R8Ni0Waw9CP9IMM0/SM2lntLR5bnL4OCGRPGdiC2Bjlxj2OfWAG/SOLOa5nUZdzzD
         UmnnRNM+FAXoxF0WEvuLqAHeMzO2EPzCARB0Ekzenmy4yw0KD8AIvIeejsGcFFB1RWf6
         mzuwFYPerMhlIaC3RZZWpi+gS/GpuEPFYOM6HkJ0o/8BTq3Ft05ea+8owWiIU1TsImET
         M2eXtrxHJeVug8ozxKyYAOrYHAHqYqO54JGoXZ6UWnk2ShOpi5MKaVveR5wQlgo8odvo
         R5pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSNdG7aqLXSwCDF4wqtGm0/YLRRM7Q8vN5oLTYrFxhlaFMuRuB0ra5auT5wLwQGN+uHJACp0G4YaT3dfO6tA4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+hiG2ieOJ4JVZCvxdkb45zG85fRT27VGAylZTJjDJxfcYYiJ4
	A3vDk0y+jJZgJZlMRyq9pUQ9csIRQRykbCLtvaK1+7a6NOdV2jFbthPbazk+U7sVAw==
X-Gm-Gg: AYBFou0fnDFQbRmo4o4FBQ7olJD98ydyOEHU6JmspDkmH2EtjNrR7oP2Vj9Kc5DdUWT
	TiOn2G3qGWOKR934jzdC69XNHK5epDbeRVYFcy908NWcFHPz+mJuRXYDklsqa3VpoLMTIRUPsxY
	Yl33nP1kDiDra4sLcI45HlF0Za8I3/oP1KS4XvU8MfJv6iFczHPC8C95iOl0wobWWZfeIYb0yDv
	4tkQ8V+jzIVTXcpWun1LrwQP+eAmfGQ2sb1qyluFb8/8ZXZK8l88JTaD3lkuUTxtzs1VnS0dDHO
	OE7Am4pI+NHV3QRz36WTEPQeC5TwgaO7Kl5aNpjhOz1iuViW5HnOkIYMOHmtLnuT9bqgqO7lsN+
	l808nVXDbGGYXk6aE/WYEMxeksBjlam3ypJmfGE4rvmuvoM+NdYuMDv0bGTDFO8AM0gWg821K0y
	MB5ZcDI8u7s5v7gQdg/dQBvh+JVdwNfP35PxvVNJQLUJp3YgGDFMLSbF+sEAnWQ0ziVlCmuFWsx
	rSUL5YRRLB91TXLDTqlScXHzltsChRh49++uDF6
X-Received: by 2002:a05:6a20:3ca8:b0:3da:bb98:b1f9 with SMTP id adf61e73a8af0-3daed4bba1dmr10454732637.9.1789150542427;
        Fri, 11 Sep 2026 11:15:42 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6550e06sm1594193a12.14.2026.09.11.11.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:15:41 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:15:38 +0000
From: David Matlack <dmatlack@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
Message-ID: <aqRFSiicubfsw3N6@google.com>
References: <20260901180713.4185641-1-dmatlack@google.com>
 <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>

On 2026-09-11 11:04 AM, Ackerley Tng wrote:
> David Matlack <dmatlack@google.com> writes:
> 
> > This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
> > UAPI to enable preserved files to be restored into a userspace-provided
> > file instead of a kernel-allocated file, and uses this to support
> > preserving tmpfs files in-place without any changes to the LUO ABI.
> >
> 
> I'm interested in the idea of retrieving folios into an fd for a
> different reason, I'm exploring handling over ownership physical memory
> to a guest_memfd.
> 
> > The Live Update Orchestrator (LUO) API currently explicitly returns a
> > new struct file for every preserved file during retrieve() (e.g. via
> > memfd_alloc_file()). This then forces userspace to use anonymous memfds
> > for all in-memory files it wants to preserve. This works reasonably well
> > for VM guest memory but does not work well for other types of files that
> > userspace may want to preserve (e.g. in-memory logs, binaries,
> > configuration files, etc.).
> >
> 
> Does this assume that VM guest memory is usually provided using
> anonymous memfds?
> 
> More generally, is the problem that there isn't a simple way to
> implement retrieval into anything other than anonymous memfds?

Roughly, yes.

> > Preserving entire tmpfs mounts in-place would require a large amount of
> > kernel support and would effectively make tmpfs an ABI, which is a
> > non-starter (or so I hear). Instead, we can delegate the reconstruction
> > of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
> > to userspace. The kernel just needs to preserve the contents of tmpfs
> > files and provide userspace a mechanism to restore those contents back
> > into a specific file on the filesystem after the kexec. Hence,
> > LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
> >
> 
> Suppose pre-kexec, the data was in a tmpfs file (and fd), how would the
> preservation work? Would the user have to
> 
> 1. Transfer the data from tmpfs fd -> anonymous fd
> 2. Preserve from anonymous fd
> 3. kexec
> 4. Set up the tmpfs fd
> 5. Retrieve into the tmpfs fd

No, the proposal in this series is to support:

1. ioctl(LIVEUPDATE_SESSION_PRESERVE_FD, {TOKEN, tmpfs_fd})
2. kexec
3. tmpfs_fd = open(..., O_CREAT)
4. ioctl(LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, {TOKEN, tmpfs_fd})

No transfering to or from an anonymous fd is required.

> > An alternative approach to restoring data to a named file would be
> > supporting a zero-copy sendfile() that can be used to convert named
> > tmpfs files to/from memfds across the kexec. But this poses significant
> > challenges on the *preserve* side since the preserved file might still
> > be actively in use. The benefit of the retrieve-into approach introduced
> > in this series is that it does not require dealing with two different
> > files. There is only ever one file that owns the preserved memory.
> >
> 
> Would it be more symmetric if the process is
> 
> 1. Transfer the data from tmpfs fd -> anonymous fd
> 2. Preserve from anonymous fd
> 3. kexec
> 4. Retrieve into anonymous fd
> 5. Transfer the data from anonymous fd -> tmpfs fd
> 
> As to the exact details of "transfer", I think the best we could do
> would be some kind of move from one fd's page cache to the other fd's
> page cache?
> 
> Is the goal of the transfer to avoid any memcpy and fully transfer
> ownership (so, not just by increasing folio refcounts?)

Yes this is the alternative proposal that has been proposed and
discussed a little bit off list, with sendfile() and copy_file_range()
being the possible mechanisms to do the "transfer". I think there are a
few fundamental problems with that approach on the pre-kexec side.

 1. iommufd requires that fds mapped into it are preserved. If the file
    mapped into iommufd is tmpfs, but then we transfer that file to memfd
    for preservation, iommufd will fail to preserve because the tmpfs file
    is not preserved.

 2. Even if you only use this feature for files not mapped into an
    iommufd, transfering the contents in a zero-copy way seems
    challenging. What do you do if the tmpfs file is still in use when
    you want to transfer it?

> > By leaving file and metadata allocation purely in the purview of
> > userspace, programs can create the target files where they want, with
> > the names and security permissions they desire, before directing the
> > kernel to restore the preserved folios into them.
> >
> > Currently, only tmpfs shmem files are allowed as valid target receptors.
> > Attempting to target populated files, or anything other than an empty
> > shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
> > the future.
> >
> 
> Is this basically that at some point, all in-memory filesystems' fds can
> support transfers?

Yes, theoretically.

> 
> >
> > [...snip...]
> >
