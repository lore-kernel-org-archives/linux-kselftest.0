Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878209;
	b=vXj2iqomSYd/P7NGLCFyiB6sNxa8v9VsE+sFrtWXJyjs/yDlFPMSXzwtvQRekFvTgf51
	 qm/GZpVErMlCYstPNVeIQM/Y+QNnafZirhYdxUgxN//qqKlNQc1R3FBevJliZg5D1+9E0
	 p5akW0XfLa812Dd6iZ/v9vTpKbf/KDDOEdnZtEmTlAv9MBK8yqE7PkIE/5r4J41wd+IMg
	 CoGW49ynEcdfM3V2KuQA3R7/r0fLAMOv7iSStYZKp83oD7RFHMJmYU9x/nv3WHX7dg3Od
	 3ls9nge0YA27HePuXXZuYBKoYjCxbHcY4Vp1jkFbPgaH7cT5IUdiNabJGZh9QGk62lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3UXVe85EdeFNcxpcFxDAp5kR4bnXLI0O4+ZpE8jB/ao=;
	b=sbIN6/fO0TBOD4BbmT4aEkNf8TxLstYzxd9lOmoe2Pn88ubNdM+JdZWcXxR+A4ogqqZw
	 Cv8ZBya45ajpcQ45nHYd5M+OejSHRCAkgzgpbc+OX0jn7WxB6RImoewV2wIe9fBqJRN0N
	 IvJ+G+Kb0vti0HOdxhGpRFS0ReWZdfiVZ5hReeFGIxhC+JCZZLnZ0A4jPvAIIT8D3GP7A
	 5nY0x0nEQUNchGq7JkeuQ+Eusmb4oLJz837S2md6J4WJXtLRDrI1g6knODLHOLYiYQlkY
	 IjgIoWu26IhPa7EJnlHCDkHQOyXmUDxR6GUCwCx7d1Vk1JWgES41W4jKgPknnWl9S/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q7nBjGrY;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B49606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 21:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B49606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q7nBjGrY
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso15206057b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792878208; x=1793483008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3UXVe85EdeFNcxpcFxDAp5kR4bnXLI0O4+ZpE8jB/ao=;
        b=q7nBjGrY9g7kt/F4pBV+TbcxWh3uw6vi0Nxk5mssyr9PIfi9EmZ5hFh3gYmXREwPWd
         qsN0PD224j77dsc6FX9Alpbr71uTHDlLWpSCKNPT2WfR0hnnT1TdzzDgysccM6zhGKz5
         dVTbCIHMGnqVsXsejSecTiGiA7WGpWwayKl5LqR4NTrFtAPTHdoz88Da0QoZuYxqOMPl
         fju5eZ3/tIUuWWFdWBPitEWHdEaglsQevXV6TookxF9uU6GYw+1ZGERp8e8nSV9O5JHT
         XrRcuSMsdcp8bF/ixaXe67qNn/x6IjqDF9UAi38eGzxCy0M8S3M6/fLloMoa/OrywNf4
         HPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878208; x=1793483008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UXVe85EdeFNcxpcFxDAp5kR4bnXLI0O4+ZpE8jB/ao=;
        b=OvcG7PIhFSk09VM5lonMpTlTR6sD+RqujTpwhBcxMhQNUcQw/y9njaN9jsvtNmU17m
         mtHEzYtSURuUaG/PPA6pKnIoja0Mq1nIZc8RMYqNADuYHUbYVxKd+N1EOtiL/Ra7xUot
         fMXZeZQzERNFNAKcruRIudZdc1Z9/KjjUgi76Spl46eGNmIz/2nMPhlGDY6mOl/irPhv
         DRaw63nflsiivs6DGA40UOpQ42SU/GpFcS6JrlPgzdY23jiJaMEAibFBucyAKgkUzjxl
         6P7soQtTt5D9JDlwyxnJoi8jymUjx2XOIt8eAFm8yS/cinb1shBg2NoxjgyS9d2jJz6K
         Zzlg==
X-Forwarded-Encrypted: i=1; AKwUvBwFMfPksCTTu7YLHqd2ACgWVcOOkZP8hlkG+YwQDZ4DYizEwb9IMMiGBilFy2FlWeIBG1mq3AhW/jJGxC4fbH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK05qI+J6RXNK4gV8U4N5BX68ElTKR0bZBftwcBP1vebtJURQCV
	XHacXaGjVpJYYOta5P0ceEtF3nfQx71ReWZxLA7T/C8PxcVaUZPRubXf
X-Gm-Gg: AYBFou0OPG86U7/CWKZyeweQtMSqhiQ+rLT6ADnhID+2epPb8Y+qbzfGxI7iuoGA8vs
	ZkCTlLvTBKBOVXcQnKW7gizUOk9tBKOy+U/Kda0nuvMxwOFcjx6iFHoW5kVlls5DehGS3PbEgtj
	GaovQ6J865tTa0mvkp2A8dYZ0y2+wti+KepuAKFWMjeuy3+rmC//nIJ8OrChucJtbSp822ktVvf
	jalAdqF+3iq2ZYXm1LnPAA1JwizEQ39s4u3/7WDOc8M/948N9nxrCzy7gR/dAqG+rA234xFV0Yt
	qzsk83J/S7QtCHKEMJSlWl7ZtPHzpKzr8wxwKvHocW2C6OFxTzBtW+OSdzN5kII+EjAKqiaJnmc
	AZLWey4zb71l/xihxO+F3g8TAkQsS5pUdPPAv5iRmvc5gGxDk/QgqId8CqoxQc8O0vSa9o/t0j1
	Ih/A8JLCR+SVKBhi8zZj4QnUuf7ZdlAAfgmtaZkNNiNaUMx1kmGt27lbp0SV3II+o6LiCekQpWr
	jKhp+KvD0RpwPg4gw7adnVn9Q47cwoZTo1nqOq6WeZiQwZi6JS72+CXZmIFmbAn/cVSBkQ875qq
	Kys=
X-Received: by 2002:a05:690c:fd5:b0:8b0:a8cf:f46a with SMTP id 00721157ae682-8b166cd9439mr22677767b3.69.1792878208273;
        Sat, 24 Oct 2026 14:43:28 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f15a:4eed:c4ba:3585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166dcf529sm13199467b3.12.2026.10.24.14.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:43:27 -0700 (PDT)
Date: Sat, 24 Oct 2026 17:43:26 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Farid Zakaria <farid.m.zakaria@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	John Ericson <mail@johnericson.me>, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
Message-ID: <at0agiPbtxz5zD41@zenbox>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>

On Sat, Oct 24, 2026 at 01:39:16PM -0700, Farid Zakaria wrote:
> This is a proposal for an idea to add support for landlock to work
> better with build systems such as Nix where they want to apply
> restrictions but the paths may not yet exist.
> 
> TL;DR;
> ========
> 
> Landlock rules attach to inodes that exist when a ruleset is built.
> That makes a directory shared between trusted and sandboxed tasks hard
> to confine: the sandbox may create entries there with
> LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
> time, and granting read access on the directory to cover them exposes
> every other entry as well. This series adds a rule flag that grants
> access rights on the entries a domain creates in a directory, instead
> of on the directory.
Hi,

I'll chime in since I run nix and have a little bit of familiarity.

Looking at my (admittedly bloated) nix store.

[justin@zenbox ~]$ ls /nix/store | wc -l
259356

That's a lot of inodes. And a nix derivation creates hundreds if not
thousands potentially throughout it's build.

My main concern is that rulesets are generally considered
immutable after enforcement. This allows for well-defined semantics on
inheritence. This from my understanding would mutate the ruleset after
it's already enforced, so changes wouldn't be copied to inherited
domains automatically.

My other concern is with the overhead of automatically generating an inserting
a rule for every new inode that gets created. It seems like a complex
way to tackle this problem.

But beyond that, let's go back to your usecase.

....

Basically from what I'm seeing you want to grant some access to certain
subdirectories (including newly created ones) but exclude others.

Presumably in the nix case, you want to grant /nix/store/{abc,efg,hij} and NOT
/nix/store/{xyz}, but still allow /nix/store/{foo} (the derivation
output) to be created and written to. This would allow the nix build to only
have access to certain inputs, while being able to write to the /nix/store
and produce an output. This is a valid usecase that Landlock cannot today
accomplish.

There was this NO_INHERIT series I proposed a little while back.
[1] It's sort of the inverse of this (removes accesses inherited from
parents rather than granting new access) but would accomplish this
goal.

With NO_INHERIT, you could grant whatever access rights you want by default on
the parent directory, and place NO_INHERIT on any specific entries you
don't want to have inherit those rights. 

So for nix use case, you could grant no_inherit on everything except the
inputs you need, then add READ/WRITE/MKDIR etc on /nix/store. The new
directories would inherit this by default, while the ones you added
NO_INHERIT on would be restricted.

Additionally, you should also examine the mutable domains proposal by
Tingmao Wang, which could also facilitate this usecase as well [2] (i.e by
dynamically adding and removing rules with some fanotify/inotify glue).

That being said, neither of these two patchsets / proposals are merged,
and the playing field is still open on this.

So the problem you are pointing to is legitamate, but the solution still
needs to be considered carefully to avoid complexity.

Justin

[1] https://lore.kernel.org/linux-security-module/20260621035223.2651547-1-utilityemal77@gmail.com/
[2] https://lore.kernel.org/linux-security-module/cover.1741047969.git.m@maowtm.org/
> Motivation
> ==========
> 
> The motivating user is the Nix build sandbox. Every Nix build runs in
> its own sandbox, and a build may only read its declared inputs in
> /nix/store and must be able to write and read back the outputs it
> creates there. Nix enforces this with a private mount namespace: it
> creates an empty store directory and bind-mounts each input path into
> it, one mount per input. Nix has paid this per-input cost since the
> sandbox was introduced [1].
>
> The cost is paid per build and grows with the size of the input
> closure. Nix is moving towards much finer-grained builds (many small
> derivations instead of a few large ones), so the number of sandboxes
> grows while each build's own work shrinks, and the sandbox setup is
> becoming the bottleneck. A typical build has hundreds of inputs; large
> ones have thousands.
> 
> A microbenchmark sets up and tears down a Nix-like sandbox (user,
> mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
> removing the chroot afterwards). It compares one bind mount per input
> with a single bind mount of the whole store plus one Landlock rule per
> input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
> ext4, 16 cores:
> 
>   inputs   bind mount per input   one bind mount + Landlock   speedup
>       10         3.2 ms                    2.3 ms               1.4x
>      100        11.6 ms                    2.8 ms               4.1x
>     1000        79.3 ms                    6.4 ms              12.4x
>     5000       400.1 ms                   24.4 ms              16.4x
> 
> With Landlock, an input costs an O_PATH open and a landlock_add_rule()
> call: there is a single mount, and no mountpoint directory to create
> before the build and remove after it (removing the 1000 empty
> mountpoints alone took 17 ms).
> 
> The single bind mount is only sound if the store listing and the
> undeclared store paths stay unreadable while the build can still use
> its outputs. Without this series, covering the outputs requires a rule
> on /nix/store itself, which makes every store path readable again.
> 
> [1] https://github.com/NixOS/nix/issues/179
> 
> Series
> ======
> 
> Patch 1 lets an LSM observe inode creation through the
> inode_init_security hook when no LSM provides an xattr. Patch 2 adds
> the LANDLOCK_ADD_RULE_CREATED flag for path-beneath rules and bumps the
> ABI to 13. Patch 3 adds selftests.
> 
> Testing
> =======
> 
> The series applies to the Landlock next branch (3e271a27c46f) and was
> tested on Linux 7.3 with that branch applied.
> 
> Without patch 2, the five new tests and the ABI version check fail.
> 
> Open questions
> ==============
> 
> - A created inode stays pinned until the layer's hierarchy is freed, so a
>   sandbox that creates many entries in such a directory keeps them all in
>   memory. Should this be bounded?
> 
> - Creation is detected in inode_init_security, so on filesystems that do
>   not call security_inode_init_security() created entries get no rights.
>   Is there a better hook?
> 
> - Through overlayfs, created entries get no rights either, because the
>   upper inode is created with the mounter's credentials. Should overlayfs
>   be handled, e.g. via security_dentry_create_files_as()?
> 
> - A file renamed or linked in keeps only the rights it had at its source.
>   Should it get none instead?
> 
> ---
> Farid Zakaria (3):
>       lsm: Call inode_init_security hooks without xattrs
>       landlock: Add access rights on created files
>       selftests/landlock: Test LANDLOCK_ADD_RULE_CREATED
> 
>  Documentation/userspace-api/landlock.rst     |  42 +++++
>  include/uapi/linux/landlock.h                |  18 +++
>  security/landlock/domain.c                   | 182 ++++++++++++++++++++-
>  security/landlock/domain.h                   |  28 ++++
>  security/landlock/fs.c                       | 176 +++++++++++++++++++--
>  security/landlock/object.h                   |   6 +
>  security/landlock/ruleset.c                  |   6 +
>  security/landlock/ruleset.h                  |  14 ++
>  security/landlock/syscalls.c                 |  20 ++-
>  security/security.c                          |   9 +-
>  tools/testing/selftests/landlock/base_test.c |   2 +-
>  tools/testing/selftests/landlock/fs_test.c   | 227 +++++++++++++++++++++++++++
>  12 files changed, 703 insertions(+), 27 deletions(-)
> ---
> base-commit: 3e271a27c46fd591d1011c7de5a644a41e2010f1
> change-id: 20261024-landlock-created-rights-9340b00a8c4d
> 
> Best regards,
> --  
> Farid Zakaria <farid.m.zakaria@gmail.com>
> 
> 
