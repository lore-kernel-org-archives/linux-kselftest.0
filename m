Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09DA455176
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160354; cv=pass; b=TBC9k4x2wRrNo7fJvymIaaxrNRwTucFAuAgSSsLDSwLVx57KdeDUzv2+vqgJ8ph2+U6MueFT87SKCewZ88nrvzbmVEhFcnJ1HbPuihtau8D7Yu/J9pZM+fXWXgOvPscN4zmGA9KcfUCCIQZ78/HMzQ2haQ366J5RPE4pIlQvZ3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160354; c=relaxed/simple;
	bh=mKPHrWNmrKgczw222t5+R7j7QSjX3I+NtdJQy79SCIs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6dBTwcRi+dgE+5RWHJsLf+A8mZdfmoY6BM2NXOUQ9FkcwWwplY9D7y5SV8AYR1mVfqIbjfoJglUDF6VQNKUq2x7qR/WZeGly9mMhr7TtTEqAm2kkOPGt+s8toW+QHSiVZV6J2+8DUkar6LfllEfnyp+HewAPcKWjWuLGaiCRpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kjbKZJug; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kjbKZJug"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91053c27a91so13362576d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 13:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789160351; cv=none;
        d=google.com; s=arc-20260327;
        b=QNdVb1itaV9UAhG8R4j2YAW0mNro3I0NrHDR/e+GvB3sAPdwK59WbGs6S6DBkp1gkL
         EYT3y+nDny8/degqz8zdlne91cue4h8ZzRGMiF/GPkwrvy9QelCNn5jt6pqQr5Frojxr
         jmccVVsqyvEoikyQFGn9b5IMxu0lH5HIwiq0XIYZ3+KJWDvHVisri/1zqJpFP/9gsnQr
         F4u88pU07zJi7vZhWs+9nno1iTN7lnOnSswlzkxKwxSmwtmG+OInNQQPNT91k1gazcnD
         0PnBj57+sSSjh9Ke5mt7HTPKefBTKXMWUDA2evtOzbu5SS642cCERSioTJUoAqbM3fX5
         NffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=9mIQ6jM8juF2PvO8eUkaKKIYpJrRvH5Gc2fB112shtA=;
        fh=IiJT9Z0JWK18k+LUGbBS98iNHQ+J5baAvPpVBI0Ru4s=;
        b=FZvc962dgRnzdWh2QQw3cPvaNL2cekGg8+Mpgb17upGXig6GUsMkkPpUl9PKDUPxET
         dLq0PFTvO1HTJeImBCcPZKq+zJ/P5KXxCsmdBKzwMnOTb3t/VbUK3Rd0qmFvA8p00JfA
         qudXg75Rn7fvgEYTfY88Ob6AGn36HDY9qLa5YA1t1w5gthmXVkc6nQ2tcCsFTk+lFPLX
         2FSHdZ6QpejPKRrzDbmSGagxHDwB+Ql0iro2TQVsLkn1WX1FlBrK/ydRITKNhNklzs2e
         vkX1oe+nX9oV1313hteNK+RQZkfnyFd+wDzVT+lc/BUSRsfWA+EtJmLqwTEimZ4Wxgil
         z0sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789160351; x=1789765151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mIQ6jM8juF2PvO8eUkaKKIYpJrRvH5Gc2fB112shtA=;
        b=kjbKZJugfTsOrgBsGtrZJ0JG2GPvuKZ8VQEYu+1lkImZQE+Qq23E9Kh6HmVrQbGBrw
         YMdXvAzx9NASG63M6s5kKAO8aQZA5FIgYNe90xt8qot6lwDHFonQX0CYGv8zkTeKiaOv
         zIal7+oJYpi1ER9H2k7ESnhhrV2ltGFub4jyF557ZXU4UhCMic8wMfMq3DS6nGTr81CA
         eCicXmsDzP433O58VzitrrfFtNSmP6XkTl8G4CRKkQDaDpqJO70JKJ6L+xLFJSdBvkPk
         BaH8E2JiDPSWYfI8JhWBdrf6MZpeQTRajAbTnUIHIWezTLaUhzKSFf2XwEH0r+GlpfFX
         E9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160351; x=1789765151;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mIQ6jM8juF2PvO8eUkaKKIYpJrRvH5Gc2fB112shtA=;
        b=b0Vm9Jr7lYUuzhejOOc0AcK/CvRU+sPuNijt44ENTaD6gEau5wF/9i8caQvEWVFMiB
         A0zvJwsVqcwYbuLvqqwYzib6hqvzLDSE69syJ9BSxV7PzoYzOXUg+oQz6GNcsOxcJlv0
         TsNQh0v+vDr4SeetJcz3z/IbShfDu538QnUrbl6npk/WVfwI6zL9LshDA3/3Uqmj0h7f
         7Ae7Vjhgwf3Bw8RPvk3p7jytAyUNXxOxINQZgT10B6P0gowjSNgfvjuNI+7sMJlabWP7
         iMENIzZ3dFtPjiMgMDSk4hpsB7Na6pYk2BV3y7XzGDve8CVu5lPRjnP99VJXd6K2CG2r
         Eo0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxa9gfzf63VnVmftoCq/aQzwwKgq87Q4JabMvH4cnGb8LEIOJ+UkAZvWkdNOoEhQWB82mY56Uc1ixNFNwZhk38=@vger.kernel.org
X-Gm-Message-State: AFuF++mtHtcU+Gr/e2uPGhCpERkgDQiZRo58eveLw+xAax1pJ4OSSXjJ
	olfFo8TR1mAE35Zh7eKjWT7mfNZRf8Z4FF45oLgYdLkeZBfCjs27fzbyA3k/44KsF0HQ4jPwi+s
	u808OSekYYlt/xTkJnUKTO/62atNgIV+jldqDdEYo
X-Gm-Gg: AYBFou1OfBYXuESTg4nynMFVbhI2/th3M7YIPrGHWKdLwejE9/FEzJegLHkK6IrVmMP
	l5KM0fAysg2+bdka+P0GP7ge8tgq+DCPLW9tm8cvTjEydHJzwJKhNg9iD2/yGfasbpYOfMLYz+J
	2NXf9CbiSQTeN3zlTCcTT23RqYU3hfsklqjdK7IVKh0A1iroArgvhNKdYuoZ4DlVYTgNAYk9Bjp
	AmUDBesX4FAW9B5QgSlB0uV1ViT9a9c7Bmp7wl3pGRkzcflKHmXBCnPEiMO4PxCIJUn7j5/tCUE
	PUVVUeMxWEOQMqeWvRy3h3GMVkUzfQd0pcT//iQjjbOd4Y5vXhxx4kz3CD6pqZtm2SwPLtYdMHF
	QTJjOAnOipgpdQGX6wWm8bv4Plz7x/ugbhb9QLvMfeg==
X-Received: by 2002:ad4:5f8f:0:b0:910:4c56:76d8 with SMTP id
 6a1803df08f44-9121207d6d2mr79542346d6.1.1789160350811; Fri, 11 Sep 2026
 13:59:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 13:59:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 13:59:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aqRFSiicubfsw3N6@google.com>
References: <20260901180713.4185641-1-dmatlack@google.com> <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>
 <aqRFSiicubfsw3N6@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 13:59:09 -0700
X-Gm-Features: AcwNN1VXiGYQy4JW0rBuiz4KjYly49Wx8Xl5G5ezJF-9TY2IawBLiOKUcfGow4s
Message-ID: <CAEvNRgFCrcyk6F0vJ11pgj2EDSUAXj6Zw-oEdZpfj2SrH1Cv9g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

David Matlack <dmatlack@google.com> writes:

> On 2026-09-11 11:04 AM, Ackerley Tng wrote:
>> David Matlack <dmatlack@google.com> writes:
>>
>> > This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a new
>> > UAPI to enable preserved files to be restored into a userspace-provided
>> > file instead of a kernel-allocated file, and uses this to support
>> > preserving tmpfs files in-place without any changes to the LUO ABI.
>> >
>>
>> I'm interested in the idea of retrieving folios into an fd for a
>> different reason, I'm exploring handling over ownership physical memory
>> to a guest_memfd.
>>
>> > The Live Update Orchestrator (LUO) API currently explicitly returns a
>> > new struct file for every preserved file during retrieve() (e.g. via
>> > memfd_alloc_file()). This then forces userspace to use anonymous memfds
>> > for all in-memory files it wants to preserve. This works reasonably well
>> > for VM guest memory but does not work well for other types of files that
>> > userspace may want to preserve (e.g. in-memory logs, binaries,
>> > configuration files, etc.).
>> >
>>
>> Does this assume that VM guest memory is usually provided using
>> anonymous memfds?
>>
>> More generally, is the problem that there isn't a simple way to
>> implement retrieval into anything other than anonymous memfds?
>
> Roughly, yes.
>
>> > Preserving entire tmpfs mounts in-place would require a large amount of
>> > kernel support and would effectively make tmpfs an ABI, which is a
>> > non-starter (or so I hear). Instead, we can delegate the reconstruction
>> > of the tmpfs mounts (directory structure, permissions, etc.) post-kexec
>> > to userspace. The kernel just needs to preserve the contents of tmpfs
>> > files and provide userspace a mechanism to restore those contents back
>> > into a specific file on the filesystem after the kexec. Hence,
>> > LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
>> >
>>
>> Suppose pre-kexec, the data was in a tmpfs file (and fd), how would the
>> preservation work? Would the user have to
>>
>> 1. Transfer the data from tmpfs fd -> anonymous fd
>> 2. Preserve from anonymous fd
>> 3. kexec
>> 4. Set up the tmpfs fd
>> 5. Retrieve into the tmpfs fd
>
> No, the proposal in this series is to support:
>
> 1. ioctl(LIVEUPDATE_SESSION_PRESERVE_FD, {TOKEN, tmpfs_fd})
> 2. kexec
> 3. tmpfs_fd = open(..., O_CREAT)
> 4. ioctl(LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, {TOKEN, tmpfs_fd})
>
> No transfering to or from an anonymous fd is required.
>

Cool that preserving a tmpfs_fd is supported. How is that done without
preserving the rest of the tmpfs stuff?

Why is it possible to preserve the fd without the rest of the tmpfs
stuff but not retrieve without the rest of the tmpfs stuff?

Is retrieving into an fd a bit too much of a shortcut? Would preserving
the rest of the tmpfs eventually be required, and hence retrieval of the
rest of tmpfs should also be eventually supported symmetrically?

>> > An alternative approach to restoring data to a named file would be
>> > supporting a zero-copy sendfile() that can be used to convert named
>> > tmpfs files to/from memfds across the kexec. But this poses significant
>> > challenges on the *preserve* side since the preserved file might still
>> > be actively in use. The benefit of the retrieve-into approach introduced
>> > in this series is that it does not require dealing with two different
>> > files. There is only ever one file that owns the preserved memory.
>> >
>>
>> Would it be more symmetric if the process is
>>
>> 1. Transfer the data from tmpfs fd -> anonymous fd
>> 2. Preserve from anonymous fd
>> 3. kexec
>> 4. Retrieve into anonymous fd
>> 5. Transfer the data from anonymous fd -> tmpfs fd
>>
>> As to the exact details of "transfer", I think the best we could do
>> would be some kind of move from one fd's page cache to the other fd's
>> page cache?
>>
>> Is the goal of the transfer to avoid any memcpy and fully transfer
>> ownership (so, not just by increasing folio refcounts?)
>
> Yes this is the alternative proposal that has been proposed and
> discussed a little bit off list, with sendfile() and copy_file_range()
> being the possible mechanisms to do the "transfer". I think there are a
> few fundamental problems with that approach on the pre-kexec side.
>
>  1. iommufd requires that fds mapped into it are preserved. If the file
>     mapped into iommufd is tmpfs, but then we transfer that file to memfd
>     for preservation, iommufd will fail to preserve because the tmpfs file
>     is not preserved.
>
>  2. Even if you only use this feature for files not mapped into an
>     iommufd, transfering the contents in a zero-copy way seems
>     challenging. What do you do if the tmpfs file is still in use when
>     you want to transfer it?
>

When you say in-use, I suppose you mean folio is in-use by some IO and
is mapped in IO page tables, and that the IO must continue while the
folio is transferred?

Are you expecting guests (as in stage 2 mappings) to continue to be
functional while the folio is transferred?

I'll have to think a bit more, I was initially thinking of just
transferring folios where I could unmap from everywhere (processes,
stage 2, IO page tables) for the transfer.

>> > By leaving file and metadata allocation purely in the purview of
>> > userspace, programs can create the target files where they want, with
>> > the names and security permissions they desire, before directing the
>> > kernel to restore the preserved folios into them.
>> >
>> > Currently, only tmpfs shmem files are allowed as valid target receptors.
>> > Attempting to target populated files, or anything other than an empty
>> > shmem file, will trigger -EINVAL. HugeTLBfs files could be supported in
>> > the future.
>> >
>>
>> Is this basically that at some point, all in-memory filesystems' fds can
>> support transfers?
>
> Yes, theoretically.
>
>>
>> >
>> > [...snip...]
>> >
