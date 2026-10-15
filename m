Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC53C3ACF0F
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 20:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096739; cv=none; b=mGMsp/h13wC7rEuhhc9eUFzBKvFcgy2E47cfp+T/nekt4Z8SEQYt6k9S4tbbTjvanDAaoMSmjOEG0au0jnoQveP4CASL+SXzO6tEVdS2JPCHih9Kj3FmzehlCcFj5wSqumm9s73ohkjBkMATwyM33wnn4g2G5UB1s6gJooXTUv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096739; c=relaxed/simple;
	bh=3rrG+Q92Q455fMWmbzRwbTSpWrHcmO5zPh/eLYNKU/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6Fur0vW8vu1r9jPqwoWwzgTUbyYr6+8QQE4qrErLQu0dqQX+IAFe+/I9WoH861vCHWEWxdPI/Ik8OaIjNyLFloRPdLIH4FOjMUzmODvML2pfIbvlp/zYDWn8m9CII3IP7o1u2o5NDQY6QHiG9ahKNCcoNBbSXdN1Val6cnbPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RkFwjWyy; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RkFwjWyy"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9851592ada1so1699608241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792096736; x=1792701536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTVoFwqUnsU0sdHOYobwPK++xcK+Lshjclao26R+uqM=;
        b=RkFwjWyyGGcOoY6DouOyXHC3LNAtJ8dAeNru7LBtn4t16baJleVFyl4E89XgHf28jJ
         Hp7aTVVp7yAlQfdo32JfpRfutievpd/1OSG5nrI4vf+Gmszt/4M67uu0KGjToTCNVRnu
         epZm+WhdCbet8iAHu9uF0DBWrdnQZlg6BIUbMSBjUpn0qmR/FngloZHre3WNle+Y0iur
         OOS3xNvUjhh1Vrpy8yBU5M3V5iH1gx6JMGaLdWQ5VEG9NCfV0gKMMBhGJ09p8bSL9XqV
         mkO8XDg3m8ATyXytg5JsYyVjaF0MAWT4ycgH6kPpZ+ZysJV5ZUFrVcjkJjtvulCAJEtF
         PHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096736; x=1792701536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTVoFwqUnsU0sdHOYobwPK++xcK+Lshjclao26R+uqM=;
        b=zyYe+ArZhegxnsVMqBXFYr4JTRVLtUu1dSHR+DLclkfABK5i9wPLoU/C9Luo5DXh5u
         39Y9eeGnkisCH9bbUMhcJgmeG+IE+trVihpfOljgxB8qBsm/GVBhiKrH5hxlOzttH+W9
         rrrEkargDAHKISHXSHmAih0txXbUgUsRVcII75UYYqKWp6p8ArfJk+0I/hBX7tRnhmHz
         i2I/gJ0cqAE3/aYvfa/51Vd2wmNxlriO5+fsi2haiICIQggcCynsLHP7CNgq2zZRT8ns
         lz52/Y/2Lc7F9YjvL+1MvZ0jDf+nzUaBZQKy10u8fmGD4qsIGYCpvH3dNzQcpEJ3GAAJ
         eYqw==
X-Forwarded-Encrypted: i=1; AKwUvBymu1zYKrNCb/4n1g5g7LOSPpzqM7hsISn6jNEYjKNl09Jij8QStY7LERu1MI06Pqhilzwl+MYYGKkfFjMB2oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsMML3x2etQrcsh09iRKmBpm2Wd5ozrZEdFvBZbI03drPHTEoO
	5etX2GXuRhPIXoBGuBPTvze4wH9+ekiQEPoNP9pY+dQL78zVO9vpUpGlJdHTM/9SyLQ=
X-Gm-Gg: AYBFou3WZHksPu8DoXe3OiBgz0I7FPN4czy2VmrHkpg79a36jFIy8x1LNqZXu/PK5QG
	HwEcP4bmNtL3x6hEkpr1BPOHYF4KkS4nnyN4xG5NA6baqwP+WAa4DSrHuxjbtw4WpDiIFNvviK0
	l5A6n/FlC2Dsb5jIwt8kaxDBOoFTi5R9ezd/ufRAdj8OaH7ngAHufMHjzXTtjRprIIV5pM4oWkl
	o+5qHi3F9Au7qOTP3EjGHvstIOy/PBvT0WDZLoLTkR0t/GjDRoQ2+rPBCmwyW4ZVkDaaO6fhA0n
	/+8buSaDlS0PwhSODW2t2+bxFNEk9PjwTesPYJNijcx1tB2PV8A0hPMpx2LZU48NBYyFlSF1Olb
	2ku+ZoJGUYQESY0YYp3llRJqjEk0UqTfLCNckQrvt9C9re3r5o6vvcRNuqI6Cf+E6/L/R0WF8cx
	3Xqa3tCT6V596kS/v/NphW3zJcQ+hT4MSyMv0n/nv7TZdT0JVe1aICZqJ6KslRVP9B3Coxv5YbQ
	pU6/mHoRU7ipd5/JMcJx62C5aknaZteTk7BT+njVyhvTm3M/fntZ6H61Y5omRmyq50+p4f4BA4=
X-Received: by 2002:a05:6102:a49:b0:7c3:83a9:edca with SMTP id ada2fe7eead31-7cb36886005mr5673629137.3.1792096735597;
        Thu, 15 Oct 2026 13:38:55 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4ae2e2sm114784e0c.7.2026.10.15.13.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:38:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:38:54 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	pratyush@kernel.org, graf@amazon.com
Subject: Re: [PATCH v1 0/7] liveupdate: tmpfs preservation and early freeze
Message-ID: <atE53vmlDeA4cWD2@google.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
 <atESAwf17pJ11S9U@google.com>
 <atEaPuWNOm5VLc7A@google.com>
 <atEhc20Zawj4D62x@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atEhc20Zawj4D62x@google.com>

> > >  - memfd_pin_folios() doesn't require the inode lock, so iommufd can
> > >    pin folios of the target while they're being added or truncated
> > >    away. v1 starts with two patches that make iommufd take the lock
> > >    and make memfd_pin_folios() assert it.
> > 
> > Hm, isn't this mostly orthogonal to the change we're making here?
> 
> Kind of. Today .retrieve() fills a brand-new memfd that nobody else can
> reach until the ioctl returns. Retrieve-into fills a file that other
> processes can already open by path and pass to iommufd, so pinning can
> now race with the folios being added, or truncated away on failure.
> 
> In the failure case a folio can stay pinned (and mapped for DMA) after
> it's been removed from the file. Retrieve-into introduces the race, and
> the fix is two small prep patches.



> > We originally agreed that if retrieve() fails, we fail permanently and
> > leak resources until reboot to avoid memory corruption from ongoing DMA
> > activity. However, now that we have the retryable option, we can start
> > relaxing what is considered a permanent failure vs. a recoverable/early
> > failure that .finish() can clean up.
> 
> Ok I think we are ligned that we need to keep the preserved folios
> around until finish(). I think this point was saying there are bugs in
> the existing memfd_luo code and in this series that leak the folios even
> after finish(). Either way I'll fix them up.

I think we are solving this problem incorrectly, LUO should still always
re-create files, even the tmpfs files.

What if instead of retrieve-into an existing file FD, userspace passes
a dir_fd on the target tmpfs mount where the file should be restored?

During preserve we can record the file's basename if the file was linked
(or mark that it was unlinked). On retrieve, creates a brand-new file in
dir_fd (e.g. starts as an unlinked O_TMPFILE on that tmpfs superblock),
populates all the folios and metadata while the file is still unreachable
by anyone else, links it into dir_fd under the preserved name at the end
(or leaves it unlinked if the original file was unlinked), and returns
the FD of the new file to userspace.

That way:
1. Just like memfd today, .retrieve() always populates a brand-new
   file that no other process can open by path or pass to iommufd until
   retrieve succeeds, so the memfd_pin_folios() / truncate race goes
   away completely.
2. Userspace gets back a single new FD from RETRIEVE_FD instead of
   ending up with two FDs (the pre-created one and the retrieved one)
   referencing the same struct file.
3. Unlinked tmpfs files are also supported on the target tmpfs mount
   (preserving mount options and size/inode accounting) instead of
   silently falling back to the internal shm_mnt.

We can even postpone linking the file into dir_fd until finish(), so
that it only appears in the filesystem once it is fully populated.

Actually, I think, this is the right way to do tmpfs preservation,
instead of relying on user to provide the FD of an open file to us.

> > I do not want LUO to change the type of a preserved file across live
> > update. Take seals, for example: a memfd can be sealed with the
> > guarantee that it will never be modified, whereas a regular tmpfs file
> > does not support sealing. Allowing a preserved memfd to be retrieved
> > into a tmpfs file would create a loophole to strip seals (or bypass
> > mount/superblock boundaries). I strongly prefer keeping the file type
> > strictly the same across preserve and retrieve.
> 
> I agree that seals must not be strippable. I am not proposing to allow
> that. Regular tmpfs files are created with F_SEAL_SEAL, and v1 refuses
> to retrieve into a target that has F_SEAL_SEAL if the preserved file has
> any seals the target doesn't have. So a sealed memfd can only be
> retrieved into a memfd that allows sealing, and gets its seals back
> there the same way F_ADD_SEALS would add them. Only unsealed memfds can
> be retrieved into regular tmpfs files.
> 
> On mount boundaries, retrieving into a tmpfs file charges the blocks
> to that mount, so its size limit and quota apply. That's stricter than
> the unlimited internal shm mount that memfds live on, not looser.
> 
> This is what I mean about enforcing the fundamental requirements, rather
> than enforcing something artifical like MEMFD_LUO_FLAG_TMPFS.
> 
> BTW, MEMFD_LUO_FLAG_TMPFS is set based on i_nlink, so it doesn't really
> track the file type. An O_TMPFILE or unlinked tmpfs file gets preserved
> without the flag and comes back as an anonymous memfd on the internal
> shm mount. That changes its type and drops its mount's size limit and
> quota, which is the boundary crossing you're worried about.
> 
> If you still want the type to stay the same, we can define it by
> superblock instead of i_nlink:
> 
>  - memfds (on the internal shm mount): plain retrieve only, as today.
>  - files on a tmpfs mount, linked or not: retrieve-into only, into any
>    empty tmpfs file, including O_TMPFILE files.

I would like file type to stay exactly the same, I really don't want to 
play the game where LUO can magically change file from one type to 
another even if from Linux internal implementation they share a lot of 
code, they are still a different file types from the user perspective.
