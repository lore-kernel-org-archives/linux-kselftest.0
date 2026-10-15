Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034031E832
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086544; cv=none; b=XYMMt2o0w4QJdFeUWZXQLAnowZnpoWXmP8x+14QyPtRSqYJ673oADG5Mxb+perp6VP14RsYM8yD4W6CVHxl2X2r8wjrc0DNxqfpRvcMdJBFyHkU9MNk/3MKhzLCxbd2PUxPt9xuPZzcMx6nfnTm4INgw0kHZNV6gpktVjgMlExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086544; c=relaxed/simple;
	bh=4O/bKw9XxLrmWnCqNb+nEiSrTkGQi1THgwJJAv7ICAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQgtFHQcgNgFqiE/a4+36neOqsMQ8J3EX5yYNW4eOdPjOxJd+ptRZCxBn8xMWgKYx9P7yS/tR/AmdM5SoNfbEA7DvNE4+w1XYOIOnuYEyBZjdJkPZq1Y2kyKsXBtW7lRC1fJVbGQWzAHK/ZHmgWZbxQEohIDr/QUvg/pIUTM1Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xaq9gpde; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xaq9gpde"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e95b3b52f2so6339415ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792086536; x=1792691336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gmOZqAjPixYY6Ob7IGv/llQqi0+9XdrKezybj1a6U4=;
        b=Xaq9gpdeyIMKtBM4ipDL7uGANYSKeNzb4uI40yTcBlpEo5zK6SpHz0toZMQWYB7Qqt
         YyFQnFdgunyQsVD/ksYuS6xb7j2LloDqEyXXbYGqT/WYw/LTzfy8ZKb96BpyfZgbRdty
         g5p0Hom7FoiASLXHV/enaZ/Y5tug6DKJtY1RQtxKvzwu2v1fX/GF6Saef25+IUgE36Dh
         HowezT0xYYPamX3Pjel7ReZbTmmwsMeGE4XggdP2Id2YpkIV0n+7mcOuR6wiBWgYlfsp
         xiLsI3jq0gB3GNv+AFz8g0vq01841vaDMCMc0dblEJdpuj7w/asz/niWMaMJL953/v7Q
         dl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792086536; x=1792691336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gmOZqAjPixYY6Ob7IGv/llQqi0+9XdrKezybj1a6U4=;
        b=VmtQjVPcaG49A1L3KTySIDkgCEvkxwIFL2iGmjr34itm2E8iPeDWausZjTLcqLdZqa
         u+QpDjK5J6md10LvZqikhHhA2/xQBQ+8d+1rL29qWjdQKtdhg/wimOWS27w8w2O1K+ll
         A6C8e0B5xBU+4KxhTsfpTD+ryZl+OXMcFpPhTUPPIK4eD3ezhLpV6PbltTS6hLGinzh7
         iyKvSnQaC4dt4XWU6tyD/uIBHS4yE39UNRZR4vUkCcjtikUUNL2Qw85Fz54XhARPBsxa
         VqMqe8HvJhubEeSOjufBtK0j9X/lY+WD6nSAg0jWCa9gQEjUXReNKgCVV8dOLaieCt+x
         FgPQ==
X-Gm-Message-State: AFq9FYKnIuiIYMiI7Lg3RCe8/+7McXx3G+RABCLZ88SASxEA6TbmYglX
	P/91mbvhbSJ1V/st4K7MoGgDwsIGiQP8pPTVdI2V8YBN/x8v2sEnqxw4LK1ZtK4kmg==
X-Gm-Gg: AYBFou3IRXM3wnzFrL8kjGfIlPiJlp0cZruzExvHwp2d6n2OUEkUwheiE9jrVt2YC3z
	VUqhMAwE5PbHi0tYUy0sdRMS0ftPxO1rx/p7XZM9ASAf29f+ATdiYEXtEsFCoQsz19t2+Uc41uB
	3Lr4RDWsRHo02I+3/R5D77g+FeP1/0zWkJend199cajjaA0FtRTIp7l1ZCAntZyhyiehcr6nOt3
	blSOjMTjHBBfWNsaDryi2tLC50KVKcGqO6k5IFFQmdxC7p0RV9lSdhF2oQWWUvU8owxOZrjRxeI
	0LDU0qIWV7+yKP9tojzcwQn7UueSdJM4J3iIGr9X2sc7qdW9C6b0kq5ZJBLOas+rvrbWypl2ciU
	n/2grSnFChUYtEejHUojqEEcBoYezI3OSbTb1BomG9pz2WjIlw+qcmz/oavL2lHArVwrSsIaZ4l
	z+W6AvaPyW9vdxM43lhKD4lmYxJ0yrrzKbifg9yBxBY9O5T8Mm/J3UH8wpkoNaTCWlLBjJGiCLi
	d11m3Wn/r1xNT145cAj7CkOv/nTpeyBcCcqyqO7bsnpLw==
X-Received: by 2002:a17:90a:bd7:b0:3ab:f38:2b3b with SMTP id 98e67ed59e1d1-3ab9628e531mr9843506a91.21.1792086535442;
        Thu, 15 Oct 2026 10:48:55 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm5041683a91.11.2026.10.15.10.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:48:54 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:48:51 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	pratyush@kernel.org, graf@amazon.com
Subject: Re: [PATCH v1 0/7] liveupdate: tmpfs preservation and early freeze
Message-ID: <atESAwf17pJ11S9U@google.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>

On 2026-10-15 05:38 AM, Pasha Tatashin wrote:
> This series allows preserving files in tmpfs via LUO to survive across a
> live update, and allows userspace to decide when to freeze a session
> instead of delaying until auto-freeze at kexec time. Once userspace is
> done with a session, it can freeze the session immediately (and across
> multiple sessions in parallel), reducing blackout time by not postponing
> this operation to kexec shutdown where all sessions are frozen serially:
> 
> 1. Early session freeze (LIVEUPDATE_SESSION_FREEZE):
>    Currently, LUO sessions are frozen automatically only inside the
>    reboot(LINUX_REBOOT_CMD_KEXEC) path, where luo_session_serialize()
>    iterates through all outgoing sessions under global write locks and
>    freezes them serially during shutdown.
> 
>    Add the LIVEUPDATE_SESSION_FREEZE ioctl on session file descriptors so
>    userspace can freeze a session as soon as it is done with it (and freeze
>    multiple sessions concurrently, since luo_session_freeze() only acquires
>    the per-session mutex). During kexec, already-frozen sessions skip the
>    late auto-freeze step; if an early-frozen session is closed before
>    kexec, its files are rolled back via .unfreeze() before being
>    unpreserved.

Thanks for putting this together. I'm on board with driving
retrieve-into through a per-handler argument instead of a LUO-level
flag. It's what Pratyush suggested on the RFC too (sorry Pratyush, I
never replied to that). I still need to review the actual patch but
I think the idea is fine.

However, nothing ties the arg struct to a handler, it's interpreted by
whichever handler owns the token. At LPC we discussed letting userspace
pick the handler in PRESERVE_FD/RETRIEVE_FD, so that it controls which
one is used when more than one can take a file. If we do that, the
handler name would also be the natural key for which arg struct is
expected.

> 3. Tmpfs file preservation and retrieval:
>    Using the file handler retrieve argument, extend mm/memfd_luo to allow
>    preserving generic shmem-backed tmpfs files (not just unlinked memfd
>    pseudofiles), recording MEMFD_LUO_FLAG_TMPFS in
>    struct memfd_luo_ser.flags so that preserved tmpfs files must be
>    retrieved as tmpfs files and preserved memfd files must be retrieved as
>    memfd files.

I've been working on a v1 of the tmpfs preservation since LPC. v1 fixes
a number of problems in the RFC that I think this series still has
(sorry for the wall of text, it is LLM-generated):

 - Failures that userspace can fix lose the file. The folios are
   restored, charged and added one at a time, so if the target's mount
   is too small (ENOSPC/quota) or the caller hits its memcg limit
   partway through, the target is truncated, the folios are freed, and
   the failure is permanent. Only bad-argument errors are retryable.
   v1 restores all the folios first, charges all the blocks and memcg
   up front, and adds all the folios to the page cache or none of them.
   It keeps the restored folios in private_data between attempts (LUO
   needs to pass private_data to .retrieve() and keep it on failure),
   so the only permanent failure left is losing the KHO state itself.

 - memfd_pin_folios() doesn't require the inode lock, so iommufd can
   pin folios of the target while they're being added or truncated
   away. v1 starts with two patches that make iommufd take the lock
   and make memfd_pin_folios() assert it.

 - The target has to be opened for writing (FMODE_WRITE). Since LUO
   holds a reference to it until finish, that means a restored binary
   can't be executed until the session is finished (-ETXTBSY). v1
   instead requires mnt_want_write_file() and file_permission(MAY_WRITE)
   under the inode lock, like FS_IOC_ENABLE_VERITY. That also rejects
   immutable files, which a fd opened for writing before chattr +i
   doesn't.

 - There's no file_modified() or fsnotify_modify(), so setuid/setgid
   bits aren't cleared and timestamps aren't updated. The normal write
   path does both.

 - f_pos is set through fget() + vfs_setpos() without f_pos_lock, which
   races with read()/lseek() on the same open file. v1 uses
   fdget_pos(). (Sashiko called this an ABBA deadlock. I don't think it
   is one, since vfs_setpos() doesn't take the lock, but the race is
   real.)

 - Early failures leak the preserved folios. The seals/flags check
   frees ser and records a permanent error, so .finish() skips the file
   and the folios are never freed. Sashiko flagged this as well. The
   new MEMFD_LUO_ALL_FLAGS check adds another way to get there. In v1,
   early failures don't consume anything and aren't permanent, so
   .finish() cleans up.

 - If a token was already retrieved, luo_retrieve_file() returns the
   existing file and ignores arg. Userspace that asks to retrieve into
   X gets success and an fd for a different file. I think LUO should
   fail with -EBUSY if an arg is passed for a token that was already
   retrieved.

 - Sashiko's WARN_ON(liveupdate_claim_file()) report on 3/7 is valid:
   xa_insert() can fail with -ENOMEM there, and userspace can trigger
   that.

One place our series are not aligned is MEMFD_LUO_FLAG_TMPFS. My
thinking has been that RETRIEVE_FD should support retrieving into any
shmem file (including linked files, memfds, and O_TMPFILE). It is
userspace's choice at retrieve time. The only thing the kernel enforces
are the fundamental requirements such as exceeding the file's mount's
limit.  When I think about it that way there is nothing special about
retrieving into a memfd and MEMFD_LUO_FLAG_TMPFS is just artificially
limiting how a shmem file can be retrieved. WDYT?

One last thing is my v1 also comes with a dedicated tmpfs selftest with
much broader positive and negative test coverage that I would like to
land (things link O_TMPFILE and read-only targets, executing restored
binaries, exact block accounting with statfs() and st_blocks, including
large folios that extend past EOF, etc.).

Maybe what we can do is keep your 1-5/7 patches and I'll rebase my v1 on
top and send that as a replacement for 6-7/7?

Thanks,
David
