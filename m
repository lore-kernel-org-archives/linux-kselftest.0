Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD2144237F
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161079; cv=pass; b=BTmcb+SwOnvKJDMlme7mGftm76+2mCFPRYa2zbqz3nSK72UKRz58ZFJVIAVibrtCL5UhH7sJCBesX8KICjQGXnC0NTFc7qs25Qd525ZDJevbOE4OwZ6+XIeOXM/K+ZFwJW21q1oiuPHJBzeLGmbYc05nQsU0Df9IbrGE09xogbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161079; c=relaxed/simple;
	bh=qtfRGgc0150IdS009KTkrjseWK9uySmbmCuWcYChZ9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpZ1m/rp2pHUZ8yoHrgXgJEKx0ixXB9QYQJ291CUbiwedwE/YyPyR3b/RUUT7x6Xhp73C48UO7pd3d/UhsCrIf0mk1+KEHgRr1HzS+Ob9lw+hOfbPZ4vGMthLr5zhIdgbHfPg8E/QEIEURlDoyIQW73F6G+AalcXxP8Ny7RdqB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUoioV8K; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUoioV8K"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so328437a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 14:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789161077; cv=none;
        d=google.com; s=arc-20260327;
        b=Hih2h3OZWa8YUx9rgNVCb6/igJ4/E6SNMtM+0x1ruMRhubJ+6y/KlXb2VS9kHUSl48
         91V7tmDe+6DqKkQF75HTX8qW203uaJxWjf3+hKThUMs0or9vlLhxx+aYL7TdvC9H9zKK
         eS4X+W7b5F/rlnhdPBzUA0qiQ0Lbv7+nFUFi4V+qlJCLMA1kQppas5/9c9dza2P3H3sq
         tzyfoIL8+4gcOncZYQQed7W6NsQ3q/1pQ3ZmXMaXgYJdB61lUw3Hq5/VXxRLWwwk0Y6D
         0MNBRxoXI1V0m/8iYeqTKQ8Nx3gF4FbKLyMD6Ngzcj25I23/U4/VA/Cwq7QUF8qmZN7z
         5nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c6HV8uHNfHnA3I2z6iazz6poKohSe+yKAEsfT8M/ffc=;
        fh=ZluJqMbCiwB5+AJk3cDQaWZdT4zV19kR6GVk6/d3Jh4=;
        b=Pd8WEp6FwV4w+pKeEns3oK5WG6Sj/xOEKo2aUnqzQqlRCfZtSbP39kNu141/PwL/ap
         BaiubNPwJwKMWruPNrTdI1Mu/sii9s7+0W6unFPmlRXaEybXGwRZZ+Rfcp1AEUSLHOmR
         GRqHUshgSAHvOeI7arHzQUuspxwVjjJHHyBcEvy2DgFoO2anDuwccjryLcstwX0V6SeB
         rx9UZ1e+8nOZ8uD2CVrAxLRHwyAbb+Jk2jRGIXhjr0IA6fRvKfZu17U6/2HawSx8fxb6
         HKb8oLPOxl3bU1kvo8NV5K9kOLcaGxH8v7+zwc0NKqF6pvsY0bCasl2l1Ak05ngcM/dE
         5EoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789161077; x=1789765877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6HV8uHNfHnA3I2z6iazz6poKohSe+yKAEsfT8M/ffc=;
        b=wUoioV8KmTCjJby31NYdsmi2gDM8dWfScP6aBTPzSPvTzWkRMWo+sqNJ5Qe07TA2+Y
         FFCQITvw4HrSkjgBpoQ48nr2mhDwNDiJ/zlvlw9Yp2QAaWUPQ2OVBQYhqSGAQ1sRaDPr
         PH7GHWil68hH8D9OHJgyVVxNN4LjpyDLPUT+AJx1yjUIBXceIgjnvBP+gGkA+ixasXHc
         DE2dUnWtjwCcsF/STMUiPGWu6i1RxS8steSH0FSwy6SLhTJTiT+lU18knXI9g+s446S4
         WrBl9XCzcx9yNRE4C5u4kuyHUwxBK6S7Q0bDZ1i8saeh+vyLcFNJvJeERUpCrege3KWY
         UUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161077; x=1789765877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6HV8uHNfHnA3I2z6iazz6poKohSe+yKAEsfT8M/ffc=;
        b=m3dPtLJ8tdPJ2/j5tuJcb5RUNQnXbhG5TfJWfdt8AoPKbP6djPCyg0kpKj3VZ1048l
         sqJETZcL+r7ZlmBD75MIBxz8OGQeNVHyUSHjrqy+bUwrCDZq6cTm8WCw2fz4cVLoC0oi
         9tCIMbtgKynt1LdyY2TcqDe4JDV+KqNFwcIE21g4KFtFXdJZN+s/LtEdWO5z6QYVIPoN
         uaQ4um9r3Jzc9JaLiQOr6KN3aDSCgLwmxHrhhXEcFr6Qr9bLvlFRI4A+iehhg/KGary2
         +KzrndR+VgMO3ivflRVQj6cZ5aKrnyaRpPjPTjGuteGo4X81UuWIlrrKCgiPuHT7juPc
         XJSg==
X-Forwarded-Encrypted: i=1; AKwUvBxUKmBJ18KfUWb6W7aNAl3ihvWZtDDKVhsQrM3cVmtp2cj9SKHBRDADi9mDIy+9ltGFh7zEb/P0CFBX78ElRMc=@vger.kernel.org
X-Gm-Message-State: AFuF++meS2DLCqizk8qDpDjpwgi+48+M95ctkhdFmge9SASBkWMhBuCG
	y4Vg63hvRyFhCv0zn1G2CyWAqnE//MdGssP4mrOKd8GIGGHOiE9Gf0u0sn8JQpM7Qh/xIFWLdXA
	OV0xbEePL22Unens51KYgDU9/FfjQfBuyJg3+ktIW
X-Gm-Gg: AYBFou3fNXN5s7zd9V71Qn4c8+ywOBPTfe+rsuAeX5ZCKnveEXD/jfEJKTObEv4EML3
	XAJQmbYGxBdlw0wdn/HmbzOboPz9vCeEDsQnwOFROgCyPh/j79SBju/svBxNuwVPib4Cc5EgR20
	6dvTmtVlTdv6/pVydZJ90QeFMNAJJFApkcczEPQ3tNJeQeWzJluYnI4mzV8TaacOITcdOGrG/oJ
	IjRKadjstDa3jdKhzFeiFJWSLrYjV8GEXq7iCrtDaPlDgQLT8tzt9TC/XD3hWMQZSMNtN4j1r9U
	D9TsxbXFW5KiVrXhF/6fC+jFbiN6pyKzH0agmwPXQIXI9V6Kv/KhzaLZ
X-Received: by 2002:a05:6a21:a95:b0:3da:6bdd:2c74 with SMTP id
 adf61e73a8af0-3daed306372mr12662047637.10.1789161076494; Fri, 11 Sep 2026
 14:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com> <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>
 <aqRFSiicubfsw3N6@google.com> <CAEvNRgFCrcyk6F0vJ11pgj2EDSUAXj6Zw-oEdZpfj2SrH1Cv9g@mail.gmail.com>
In-Reply-To: <CAEvNRgFCrcyk6F0vJ11pgj2EDSUAXj6Zw-oEdZpfj2SrH1Cv9g@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 11 Sep 2026 14:10:45 -0700
X-Gm-Features: AcwNN1VPqi3zVmYZAELfBj-CBxTUTXJC8KC_tY6rHii958hpSbyM_Grda2-osHc
Message-ID: <CALzav=cKG9hXskFgQfub3Jg5O-rKUWBe8TBcPdJz+tBKzenFrg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
To: Ackerley Tng <ackerleytng@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:59=E2=80=AFPM Ackerley Tng <ackerleytng@google.co=
m> wrote:
>
> David Matlack <dmatlack@google.com> writes:
>
> > On 2026-09-11 11:04 AM, Ackerley Tng wrote:
> >> David Matlack <dmatlack@google.com> writes:
> >>
> >> > This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a =
new
> >> > UAPI to enable preserved files to be restored into a userspace-provi=
ded
> >> > file instead of a kernel-allocated file, and uses this to support
> >> > preserving tmpfs files in-place without any changes to the LUO ABI.
> >> >
> >>
> >> I'm interested in the idea of retrieving folios into an fd for a
> >> different reason, I'm exploring handling over ownership physical memor=
y
> >> to a guest_memfd.
> >>
> >> > The Live Update Orchestrator (LUO) API currently explicitly returns =
a
> >> > new struct file for every preserved file during retrieve() (e.g. via
> >> > memfd_alloc_file()). This then forces userspace to use anonymous mem=
fds
> >> > for all in-memory files it wants to preserve. This works reasonably =
well
> >> > for VM guest memory but does not work well for other types of files =
that
> >> > userspace may want to preserve (e.g. in-memory logs, binaries,
> >> > configuration files, etc.).
> >> >
> >>
> >> Does this assume that VM guest memory is usually provided using
> >> anonymous memfds?
> >>
> >> More generally, is the problem that there isn't a simple way to
> >> implement retrieval into anything other than anonymous memfds?
> >
> > Roughly, yes.
> >
> >> > Preserving entire tmpfs mounts in-place would require a large amount=
 of
> >> > kernel support and would effectively make tmpfs an ABI, which is a
> >> > non-starter (or so I hear). Instead, we can delegate the reconstruct=
ion
> >> > of the tmpfs mounts (directory structure, permissions, etc.) post-ke=
xec
> >> > to userspace. The kernel just needs to preserve the contents of tmpf=
s
> >> > files and provide userspace a mechanism to restore those contents ba=
ck
> >> > into a specific file on the filesystem after the kexec. Hence,
> >> > LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
> >> >
> >>
> >> Suppose pre-kexec, the data was in a tmpfs file (and fd), how would th=
e
> >> preservation work? Would the user have to
> >>
> >> 1. Transfer the data from tmpfs fd -> anonymous fd
> >> 2. Preserve from anonymous fd
> >> 3. kexec
> >> 4. Set up the tmpfs fd
> >> 5. Retrieve into the tmpfs fd
> >
> > No, the proposal in this series is to support:
> >
> > 1. ioctl(LIVEUPDATE_SESSION_PRESERVE_FD, {TOKEN, tmpfs_fd})
> > 2. kexec
> > 3. tmpfs_fd =3D open(..., O_CREAT)
> > 4. ioctl(LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, {TOKEN, tmpfs_fd})
> >
> > No transfering to or from an anonymous fd is required.
> >
>
> Cool that preserving a tmpfs_fd is supported. How is that done without
> preserving the rest of the tmpfs stuff?
>
> Why is it possible to preserve the fd without the rest of the tmpfs
> stuff but not retrieve without the rest of the tmpfs stuff?
>
> Is retrieving into an fd a bit too much of a shortcut? Would preserving
> the rest of the tmpfs eventually be required, and hence retrieval of the
> rest of tmpfs should also be eventually supported symmetrically?

The idea is that the kernel is responsible for preserving the
_contents_ of the tmpfs file in place. Userspace is responsible for
setting up a new tmpfs mount, configuring permissions, etc. after
kexec and telling the kernel which file should receive those preserved
contents. Userspace set up these mounts before kexec, so it is
responsible for setting them up after kexec as well. I see no issue
with that.

There is some nuance that this series doesn't handle though (it is RFC
after all). Pratyush brought up offline that the tmpfs mount might
have allocation policies attached to it. The
LIVEUPDATE_SESSION_RETRIEVE_INTO_FD handler needs to confirm the
preserved contents do not violate the allocation policies of the mount
it is retrieving into. But that seems easily solvable to me.

>
> >> > An alternative approach to restoring data to a named file would be
> >> > supporting a zero-copy sendfile() that can be used to convert named
> >> > tmpfs files to/from memfds across the kexec. But this poses signific=
ant
> >> > challenges on the *preserve* side since the preserved file might sti=
ll
> >> > be actively in use. The benefit of the retrieve-into approach introd=
uced
> >> > in this series is that it does not require dealing with two differen=
t
> >> > files. There is only ever one file that owns the preserved memory.
> >> >
> >>
> >> Would it be more symmetric if the process is
> >>
> >> 1. Transfer the data from tmpfs fd -> anonymous fd
> >> 2. Preserve from anonymous fd
> >> 3. kexec
> >> 4. Retrieve into anonymous fd
> >> 5. Transfer the data from anonymous fd -> tmpfs fd
> >>
> >> As to the exact details of "transfer", I think the best we could do
> >> would be some kind of move from one fd's page cache to the other fd's
> >> page cache?
> >>
> >> Is the goal of the transfer to avoid any memcpy and fully transfer
> >> ownership (so, not just by increasing folio refcounts?)
> >
> > Yes this is the alternative proposal that has been proposed and
> > discussed a little bit off list, with sendfile() and copy_file_range()
> > being the possible mechanisms to do the "transfer". I think there are a
> > few fundamental problems with that approach on the pre-kexec side.
> >
> >  1. iommufd requires that fds mapped into it are preserved. If the file
> >     mapped into iommufd is tmpfs, but then we transfer that file to mem=
fd
> >     for preservation, iommufd will fail to preserve because the tmpfs f=
ile
> >     is not preserved.
> >
> >  2. Even if you only use this feature for files not mapped into an
> >     iommufd, transfering the contents in a zero-copy way seems
> >     challenging. What do you do if the tmpfs file is still in use when
> >     you want to transfer it?
> >
>
> When you say in-use, I suppose you mean folio is in-use by some IO and
> is mapped in IO page tables, and that the IO must continue while the
> folio is transferred?
>
> Are you expecting guests (as in stage 2 mappings) to continue to be
> functional while the folio is transferred?
>
> I'll have to think a bit more, I was initially thinking of just
> transferring folios where I could unmap from everywhere (processes,
> stage 2, IO page tables) for the transfer.

I was imagining a userspace process may have the tmpfs file mmap()'d
and is accessing the memory. I guess you can argue that userspace
should stop doing that during LU. But I think the iommufd use-case
shows that that is not really possible. The whole point is to preserve
the memory mapped into the iommufd throughout the Live Update.

>
> >> > By leaving file and metadata allocation purely in the purview of
> >> > userspace, programs can create the target files where they want, wit=
h
> >> > the names and security permissions they desire, before directing the
> >> > kernel to restore the preserved folios into them.
> >> >
> >> > Currently, only tmpfs shmem files are allowed as valid target recept=
ors.
> >> > Attempting to target populated files, or anything other than an empt=
y
> >> > shmem file, will trigger -EINVAL. HugeTLBfs files could be supported=
 in
> >> > the future.
> >> >
> >>
> >> Is this basically that at some point, all in-memory filesystems' fds c=
an
> >> support transfers?
> >
> > Yes, theoretically.
> >
> >>
> >> >
> >> > [...snip...]
> >> >
