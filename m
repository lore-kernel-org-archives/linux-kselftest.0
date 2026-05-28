Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47333EFFAF
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972943; cv=none; b=WZqPdnpn4GzIucf22t6IgvKjPWFMrNTMkZLvp91Yqhqz9ekkcs8E3OfHp1wNWzOElgfgKYhl7T479EeF1a6iD8n6/2Keu1HFTOgND9kIJewX2E3NUdUns+Z1Ui9ceyY9YMjvsW6wuD5Xr/gXsYUKs5cJIbL6t6QdgDtJDeImWyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972943; c=relaxed/simple;
	bh=lpz+Ddv9Dl9ska+aj8bD+cCJIeYa6uuABpLxyLqfJLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irswI3p0wEuCx1BN1jpei58TOrAh9LBP9gX1oDT//D60XB1qA6cj4vE2zmLxbmK9rrypRltgdactBpkMsfBrjmzuSkDwMRkQCMs+/GEGZ109SyIqS/gP2kVP3Kk5oSQa/AKWeH7LJtFXtU7/dTaVRwsB6Utp71f//GgBfESSjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ooAc9vXK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ooAc9vXK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so57309755e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779972940; x=1780577740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PXV0iuW9R5esuigYUQ8OuX8X2sJ11qfHxNpdIBfn54=;
        b=ooAc9vXKTuWNLbW73kK7SI6/DjKAmprG1gDhOZvUPX7L9NjiuoiHzkLckbSCXjT1pS
         b4E3zbPWxU0hUq0DF0YFzGPkKQ6LbluWhB+kIyghLHkkPVwoEe2NqecAvYHYb3ms5pQE
         Ds4FUzjYHN21+ndFwLAuZf3Yk8IhKmyUzigZrMXtqsOZaJvSP5DakL588L4dx3RTruxn
         0uKsYP5eymAc2GlzfhbwxR2Dge0DbqBZ4wzuGUyLAQO3aYe0OTlWZTC2Y2pVuNft4V3V
         LchsorJGz5BTYp9YXp8M/ygOxzxdZLTKf2/kkzjtxVRiAYT5LZmwmDZAxKqibSVCYoxa
         Ffmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779972940; x=1780577740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PXV0iuW9R5esuigYUQ8OuX8X2sJ11qfHxNpdIBfn54=;
        b=s0F4wLcLUvpgjkutagBPS/38/W7FIBcCaHsGwcb/+8GTwSlM/ODOIhl0SXbnRx6/Mz
         N28AQJXlbxdAgz4htfK59iwgDiVjizcIwqA5WxUWC9U4tzd3mV/ZFqFnWmYiodnKA6mJ
         gAnG7Uu2kwHMg7uEqGVN+/zKg8DrAmS4c/an97d9bN76kFK5LE09lneulGt013Uz5lIm
         GQkXj8vJVhCJMj20czoUmxXhr+2oh3ALO/N+nESk8RNRu2L/xtUfsPk4wYd1ScoEIYGx
         kM0oun3B2VnpQ1Wu1Kp3MsVssm+JoN35KzTAh3qCkm2eXCjt9N3yfd9Wsz1eiM+oE6OX
         vvOA==
X-Forwarded-Encrypted: i=1; AFNElJ9URt9Lca1njXyJnG2+XOXppki0R8HkKouPo/ZDihT96xrKL2YslVRaAeTI559gcx7Q5XI4TSentqfHpcGf3Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh8Q9xO9Pt/WU5DxP4tNo2DuZtRUtgjUUX95/RFuxcV0jIDPIO
	tHJcRca9tqw34WW0gnAN6nCEqOzzRliSqy8rpewfUBz66JC7wvZS10gu
X-Gm-Gg: Acq92OFrcWTWtXUcxROpuDAlllm3aOmHaMuk+FRX1ptvoJjWLXT4ss2uFdJ9YX5ZK/D
	pOKthyPnP3Saxv3DuN0quOS25FDGPGmN7Xdbcwg9iaPRCcYU6ELN08B3pGrTPf+yd3/fxCl8HF2
	FHrVKk0kfl4FopJXBfO3OjMLWUY8y5tmtGCpfL5VglCpfF3fAG1CVnVEEkwm4Hspjt1asypqBr/
	x2cUZf4r4oUWlOGU6wF3l6rKJW31P4Q754x/LftE6hC2cenDqe/qITCzBgX1u5kuY+ihR/LTvr/
	VUOgPU4pusaXrNxt0FVokn3BV7O5vh/4DjnsnmmE6JH53/2jDjkTYgDQSkMpjyRH+piihFNGoSK
	CS0iTcTJ3euWPzV0t4MOENf118aF6WMaLT1iFPPJzYOW2HPprRAxZIwb4G6tywZdx2AA+LGdfHa
	gDggvL8fZZB6z/FNAxGcBPvB3zCCaj2v8i7cKqK8yV8MqUJWtMiUsSePlSVwGIq2rB8AuycmMuI
	As+olsjhg==
X-Received: by 2002:a05:600d:640f:10b0:490:3d45:48d7 with SMTP id 5b1f17b1804b1-4904248d296mr326000915e9.6.1779972939903;
        Thu, 28 May 2026 05:55:39 -0700 (PDT)
Received: from f (cst-prg-92-135.cust.vodafone.cz. [46.135.92.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a82ea2sm68894895e9.9.2026.05.28.05.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:55:39 -0700 (PDT)
Date: Thu, 28 May 2026 14:55:32 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Li Chen <me@linux.beauty>
Cc: Christian Brauner <brauner@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [RFC PATCH v1 00/13] exec: add spawn templates for repeated
 executable startup
Message-ID: <vealb52tv5suireenkke4lul2l3wbnaul2rp3ea545ly5wa5ty@yk3aksvp7skt>
References: <20260528095235.2491226-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528095235.2491226-1-me@linux.beauty>

On Thu, May 28, 2026 at 05:52:21PM +0800, Li Chen wrote:
> This RFC adds spawn_template, a userspace-controlled exec acceleration
> mechanism for runtimes that repeatedly start the same executable with
> different argv, envp, and per-spawn file descriptor setup.
> 
> The main target is agent runtimes. Modern coding agents repeatedly start
> short-lived helper tools such as rg, git, sed, awk, python, node, and
> shell wrappers while they inspect and edit a workspace. Those runtimes
> already know which tools are hot, and they are also the right place to
> decide policy. The kernel does not choose names such as rg, git, or sed.
> Userspace opts in by creating a template fd for one executable, then uses
> that fd for later spawns. Launchers, shells, and build systems have a
> similar repeated-startup shape and could use the same primitive, but the
> agent runtime case is the main motivation for this RFC.
> 
[..]
> A typical agent runtime would keep one template per hot executable and
> still build argv, envp, cwd, and pipe wiring for each tool call:
> 
>     rg_tmpl = spawn_template_create("/usr/bin/rg");
> 
>     for each search request:
>         out_r, out_w = pipe_cloexec();
>         err_r, err_w = pipe_cloexec();
>         actions = [
>             FCHDIR(worktree_fd),
>             DUP2(out_w, STDOUT_FILENO),
>             DUP2(err_w, STDERR_FILENO),
>         ];
>         child = spawn_template_spawn(rg_tmpl, rg_argv, envp, actions);
>         close(out_w);
>         close(err_w);
>         read out_r and err_r;
>         waitid(P_PIDFD, child.pidfd, ...);
> 
> 
[..]
> The cached state is intentionally small. The template fd keeps the opened
> main executable file, an optional absolute path string, the creator
> credential pointer, and the deny-write state. The executable identity key
> records device, inode, size, mode, owner, ctime, and mtime, and is
> rechecked before cached metadata is used. The ELF cache keeps only the
> main executable's ELF header, program header table, and program header
> count.
> 
>     cached in this RFC          not cached in this RFC
>     ------------------          ----------------------
>     opened main executable      PT_INTERP metadata
>     executable identity key     shared-library graph
>     main ELF header             VMA layout metadata
>     main ELF program headers    cross-process metadata sharing
>     creator cred pointer
>     deny-write state
> 
> This RFC does not cache ELF interpreter metadata, shared-library
> dependency state, or derived mapping-layout state. Shared-library
> resolution is dynamic linker policy and depends on LD_LIBRARY_PATH,
> RPATH, RUNPATH, /etc/ld.so.cache, mount namespaces, and secure-exec
> state. It also does not share cached executable metadata between template
> fds created by different processes. Each template owns its small cached
> metadata object in this RFC.
> 
> Performance
> ===========
> 
[..]
> Workload     Calls  subprocess  spawn_template  time_s       Delta
> (workers)    calls  calls/s     calls/s         seconds
> 1x16         6144      411.04          420.32   14.95/14.62  +2.26%
> 2x8          6144      666.78          690.08    9.21/8.90   +3.49%
> 4x4          6144      955.61         1003.25    6.43/6.12   +4.99%
> 8x2          6144     1048.25         1069.18    5.86/5.75   +2.00%
> 

This problem is dear to my heart and I have been pondering it on and off
for some time now. The entire fork + exec idiom is terrible and needs to
be retired.

Is this vibe-coded? I asked claude for in-kernel posix_spawn for kicks
some time ago and it generated remarkably similar code. But that's a
tangent.

I'm rather confused by the angle in the patchset. Most of this shaves
off a tiny amount of work, while retaining the primary avoidable reason
for bad performance: the very fact that fork is part of the picture,
especially the part mucking with mm. Creating a pristine process is the
way to go.

Additionally there is a known problem where transiently copied file
descriptors on fork + exec cause a headache in multithreaded programs
doing something like this in parallel. I only did cursory reading, it
seems your patchset keeps the same problem in place.

There are numerous impactful ways to speed up execs both in terms of
single-threaded cost and their multicore scalability, most of which
would be immediately usable by all programs without an opt-in. imo these
needs to be exhausted before something like a "template" can be
considered.

Per the above, the primary win would stem from *NOT* messing with mm.

As in, whatever the interface, it needs to create an "empty" target
process (for lack of a better term).

In terms of userspace-visible APIs, a clean solution escapes me.

Some time ago I proposed returning a handle which is populated over time
by the parnet-to-be. One of the problems with it I failed to consider at
the time is NUMA locality -- what if the process to be created is going
to run on another domain? For example, opening and installing a file for
its later use will result in avoidable loss of locality for some of the
in-kernel data. That's on top of the fd vs fork problem.

From perf standpoint, the final goal of whatever mechanism should be a
state where the target process avoided copying any state it did not need
to and which allocated any memory it needed from local NUMA node
(whatever it may happen to be). Of course if no affinity is assigned it
may happen to move again and lose such locality, nothing can be done
about that. But pretend the process is to run in a specific node the
parent is NOT running in.

So I think the pragmatic way forward is to implement something close to
posix_spawn in the kernel. It may make sense for the thing to take the
PATH argument for repeated exec attempts. I understand this is of no use
in your particular case, but it very much IS of use for most of the
real-world. The initial implementation might even start with doing vfork
just to get it off the ground.

The next step would be to extend the interface with means to AVOID
copying any file descriptors. There could be a dedicated file action
which tells the kernel to avoid such copies or something like a
close_range file action (or close_from) -- with a range like <0, INT_MAX>
you know no fds are copied.

For the NUMA angle to be sorted out, any file action which opens a file
or dups from the parent needs to execute in the child. And frankly
something would be needed to ask the scheduler where does it think the
child is going to run, so that the task_struct itself can also be
allocated with the right backing.

I have not looked into what's needed to create a new process and NOT
mess with mm, but I don't think there are unsolvable problems there, at
worst some churn.

There are of course other parameters which need to be sorted out, that's
covered by the posix_spawn thing.

This e-mail is long enough, so I'm not going to go into issues
concerning exec itself right now.

tl;dr I would suggest redoing the patchset as posix_spawn and then doing
the actual optimization of not cloning mm itself.
