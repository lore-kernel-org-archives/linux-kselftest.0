Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950958;
	b=m6mp8ohaPcU8sjycwR+1fGbe+l8b/w1g9IoHPYxtFG7Q0CGVL94T1MxOU/Xy5YbOEQmV
	 51PYCF9Tyk3jgSp2xhKoc6QhNSPk6DreteZa4XexcNxrz3rZFeZxr8Z2Rkzh0vI+TtRwb
	 ZezJiKf9ZKYHOMzciwcpVJJij7ahEy8Kzb80CuH5Oqb9r36hUuNNUaxhiETGIZaA3FiLr
	 DKPqsitJrXXChZkXYh4KKfSqXH2VEJM2OSGiUlwSvS96fmeziT5UHMX3YVVgkGhm3nKm0
	 3KruYpDwTD+qo46aXBtVhcoXNdWnemsyTiZZ3zfNT7odfiFPFZrilL//qVsoj8KI+XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=k/zHIlbS7HpNMcPoXs44Ak5aro3LTzXQpC/j4Q8xm3A=;
	b=LCa5JyNnSYWjss2B0IZ0oHPsjZDtKUr3WPFdcHgxMG1/kESY7xGchp9mTT1pAAK8r4JL
	 7LsfluRsVo2WXwNuy4dMT2ujsw5Gxn2mgr4eqdbvLumkx7LKTPqIt09ABztr7uyhlOUD9
	 cwcR32D7wO7ggQ0YkhIWVkOeNmI3mel2vX+QUhLve5kTKTZ4kEQ6milXNidcJYiebfrF9
	 J5HLBfXb/LM5fE9sj5hsX959oT+rNngD9wCYfOHVE/RwducAo155P5Ungxmrl9zE3o01v
	 Siq2daT5NHxJpFogE8DXT6BCR8HQTn1yYmf+9Im5kdA0AcKaKR7ugmAxoPNzNY9V/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1dRIJPQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7969F606A320
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 17:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7969F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1dRIJPQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so4386708eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792950956; x=1793555756; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k/zHIlbS7HpNMcPoXs44Ak5aro3LTzXQpC/j4Q8xm3A=;
        b=d1dRIJPQY4nRuWjHc2YFqK/jzpEg8uWajCvMyGcWkSQqm7+47TNXFEFnYcj71rQlJN
         qyyC+vUrYtianrWS/CF6B8EfFr4ysPbGFFzkFtjSZz9sWauf4H3kiNThZO6TMQhgNB5c
         m6OF+dJAOADx7Od/jfyWONdeGVg5YmpU1z1f/waO/dVdmRbaJ4AWZZNmPh2b+Wo7dCZ5
         4/CUDmv4gN103pJfd1ZVNezoxOdO9gYcBrkljbCi36lDpWdCWfs4t+oGkIsOWRXhRurH
         oEMKwFCGZu+56NZAQgHbM8k2ittsjguylJKCIIhFheJQ+zpdXyuV9AM6av8fJDHYRYyE
         hD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950956; x=1793555756;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/zHIlbS7HpNMcPoXs44Ak5aro3LTzXQpC/j4Q8xm3A=;
        b=lLnMpyiUwTnFFoaSGzk2285qPx213MqfqtFaos14LrFthZp6vlqmYFvFHlzmIJwTix
         H+nv9fOnsEOruPx+4I3+Q6QNf1MbYCYm8IBHve0KpduHUsLgQ7uLSp9Ek+Wub01Gl1hJ
         SyQAeCbOY1nmgtJrLjZszX0ENfLGRdOvKad5EQ/O2xZxUNdUrNYhLz/H5IOJu7UG6/KR
         PV0OY1xeTkreKgMi1F8vzHqFGmLTYCEe8Yh/SjkJEPfQXu1bF/IPAivdmdYalA3uzunr
         NjF8Ox/Rm9aF4hbZoTEl2ontukw5OXxuxwgj4aARgqUtEHivWP10pShCIwwA4l0Y1AU6
         wB9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqavrNsEALf0Yn0++Dr0Pm61OESFaV7j6/rtTkZ0zzE2Spbt3iY47/22sQ/vEJzMkQxu49VzTgq2hV7OeDgLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2mw2x0rRQlf1rrNy5a3j5o/Sc4GvUzPE9PGV4ndYCj2opjiSM
	LoAOdItgiOz005WM1Kuz15wTP3Y2Of8b3XEZ0nzfO1YQw5cSQKkcX1Dl
X-Gm-Gg: AYBFou3VjBjMFpSkDdmrq0XioBdjbDTiFUMe/TxKqbGXNlWecOkkLFz0/SSMELtwT33
	NvSdKYM/y2ZgISZepGoEDsH1k9H9+Eg5jBNCw+CPHrXFoge3Gn8s6L9+9qfNOyPgFxSU+YY/Pn6
	U5i6LUy/CzPU0X3V8L/+aS+JuX3Z2m7BX4x6W9z9wYRFJFFTdn/b1Jvto7H64mCWQitSzeLe0s4
	7GUMogCzM4PYjPCm5IRisrKLbAA4TO54FCy/EF5tKi8UVBQT53hvzdcV78O6Lg+7ohrDk3SGQq5
	wwMJrMiNUnFbaj+g9ro0Vnt0014+TVNwLp24YVr+AmMmWxDmNpPWIsiSzq8awQYs7BwdIeeV63c
	mYX3LCjs2T6u/ciY2AQdBf9QVAi5F8jOjO6cBvr4TVZAugBkSfv/Vy7onhDu+Kkpy6CRoxe/Kii
	h8FWFwnuGrIE5d1s+F5RvywBYmkoKtqeBZ0cp6tBLqV1GA352yIve6KOzQPCGo2T7bu9dUUIpTi
	8Ik0iw8I73JYvZ1SKcHnz1PFvB0Xina9FLsApYZ2jkNdmPqsKkZnnAuGhk=
X-Received: by 2002:a05:693c:2d86:b0:35c:707b:acba with SMTP id 5a478bee46e88-369e8369d86mr11493153eec.3.1792950956371;
        Sun, 25 Oct 2026 10:55:56 -0700 (PDT)
Received: from localhost ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a005c0188sm3065197eec.9.2026.10.25.10.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 10:55:55 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 10:55:54 -0700
Message-Id: <DME42HRSRKWQ.2FMOK9VWSRP32@gmail.com>
Cc: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Paul Moore"
 <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Shuah Khan" <shuah@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "John Ericson" <mail@johnericson.me>,
 <linux-security-module@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
From: "Farid Zakaria" <farid.m.zakaria@gmail.com>
To: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>, "Farid Zakaria"
 <farid.m.zakaria@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
 <20261025.769b43a39e24@gnoack.org>
In-Reply-To: <20261025.769b43a39e24@gnoack.org>

On Sun Oct 25, 2026 at 4:07 AM PDT, G=C3=BCnther Noack wrote:
> Hello Farid!
>
> On Sat, Oct 24, 2026 at 01:39:16PM -0700, Farid Zakaria wrote:
>> This is a proposal for an idea to add support for landlock to work
>> better with build systems such as Nix where they want to apply
>> restrictions but the paths may not yet exist.
>>=20
>> TL;DR;
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> Landlock rules attach to inodes that exist when a ruleset is built.
>> That makes a directory shared between trusted and sandboxed tasks hard
>> to confine: the sandbox may create entries there with
>> LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
>> time, and granting read access on the directory to cover them exposes
>> every other entry as well. This series adds a rule flag that grants
>> access rights on the entries a domain creates in a directory, instead
>> of on the directory.
>>=20
>> Motivation
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> The motivating user is the Nix build sandbox. Every Nix build runs in
>> its own sandbox, and a build may only read its declared inputs in
>> /nix/store and must be able to write and read back the outputs it
>> creates there. Nix enforces this with a private mount namespace: it
>> creates an empty store directory and bind-mounts each input path into
>> it, one mount per input. Nix has paid this per-input cost since the
>> sandbox was introduced [1].
>>=20
>> The cost is paid per build and grows with the size of the input
>> closure. Nix is moving towards much finer-grained builds (many small
>> derivations instead of a few large ones), so the number of sandboxes
>> grows while each build's own work shrinks, and the sandbox setup is
>> becoming the bottleneck. A typical build has hundreds of inputs; large
>> ones have thousands.
>>=20
>> A microbenchmark sets up and tears down a Nix-like sandbox (user,
>> mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
>> removing the chroot afterwards). It compares one bind mount per input
>> with a single bind mount of the whole store plus one Landlock rule per
>> input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
>> ext4, 16 cores:
>>=20
>>   inputs   bind mount per input   one bind mount + Landlock   speedup
>>       10         3.2 ms                    2.3 ms               1.4x
>>      100        11.6 ms                    2.8 ms               4.1x
>>     1000        79.3 ms                    6.4 ms              12.4x
>>     5000       400.1 ms                   24.4 ms              16.4x
>>=20
>> With Landlock, an input costs an O_PATH open and a landlock_add_rule()
>> call: there is a single mount, and no mountpoint directory to create
>> before the build and remove after it (removing the 1000 empty
>> mountpoints alone took 17 ms).
>>=20
>> The single bind mount is only sound if the store listing and the
>> undeclared store paths stay unreadable while the build can still use
>> its outputs. Without this series, covering the outputs requires a rule
>> on /nix/store itself, which makes every store path readable again.
>>=20
>> [1] https://github.com/NixOS/nix/issues/179
>
> I have not done a thorough code review yet, and will focus on the
> general approach.
>
> I am generally in favor of this approach where we keep track of the
> directory inode plus the file name.
>
> Other projects that have run into the problem before are:
>
> (1) Justine Tunney's Landlocked Make experiment
>     (https://github.com/jart/landlock-make).  This one shares the same
>     "build system" problem, I believe the topic came up during code
>     review at the time.
>
>     So I think this is a general problem in build systems that use
>     Landlock.
>
> (2) Michael Stapelberg's Go rsync implementation.
>
>     https://github.com/gokrazy/rsync/commit/f85bc9b98cdda705ff8e76ebcd8fb=
a03c6560467
>
> In the rsync case, the issue is not a rule for *creation*, but for
> *reading* files.  But it could still be resolved with the same
> mechanism: When allow-listing the /etc/resolv.conf file, the policy
> works for a while, but eventually a system-level network management
> daemon might exchange the file for a new one with an atomic rename,
> changing the inode number.  It would be desirable to express a policy
> in this case as well, which is tied to the /etc inode plus the
> "resolv.conf" filename, for opening files for reading.
>
> The same problem also exists for allow-listing of Pathname Unix Domain
> Sockets, where the common way to restart these is to unlink the socket
> file and recreate it during bind(2).
>
> In both cases, the best current workaround is to grant the access
> right on the parent directory, which is arguably often granting more
> than necessary.
>
> Do you think your patch would generalize for the non-creation use
> cases as well?
>
>

This is covered in a separate follow-up.

>> Series
>> =3D=3D=3D=3D=3D=3D
>>=20
>> Patch 1 lets an LSM observe inode creation through the
>> inode_init_security hook when no LSM provides an xattr. Patch 2 adds
>> the LANDLOCK_ADD_RULE_CREATED flag for path-beneath rules and bumps the
>> ABI to 13. Patch 3 adds selftests.
>
> I only had a short look so far, but stumbled across the words "package
> store" / "store" etc.  In other packaging systems, I have not come
> across the term "package store" before.  In the kernel code, please
> let's not assume that readers have a familiarity with Nix, and let's
> please explain features in more general terms.  (Note to self, on
> review, grep for the word "store".)
>
> (FWIW, I suspect that this wording might have been put there by an AI.
> I've observed in the past that AIs sometimes have an unfortunate
> tendency to blur the lines between abstraction layers and
> cross-reference implementation internals across abstraction layers.
> Maybe something to watch out for?)
>
>

Feedback understood. I reviewed the wording and it sounded "fine" to me
but your comment makes sense; that this shouldn't mention that. I guess
I wanted to articulate the motivation or example for the feature,
but I can do that without mentioning Nix specifically.

>> Testing
>> =3D=3D=3D=3D=3D=3D=3D
>>=20
>> The series applies to the Landlock next branch (3e271a27c46f) and was
>> tested on Linux 7.3 with that branch applied.
>>=20
>> Without patch 2, the five new tests and the ABI version check fail.
>>=20
>> Open questions
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> - A created inode stays pinned until the layer's hierarchy is freed, so =
a
>>   sandbox that creates many entries in such a directory keeps them all i=
n
>>   memory. Should this be bounded?
>
> Is that a preexisting problem that predates your patch?
>
>

This is a fall out of this design because the inodes grow after the
landlock rule has been applied based on what the sandbox does;

If we go forward with your other suggestion, this is moot anyways.

>> - Creation is detected in inode_init_security, so on filesystems that do
>>   not call security_inode_init_security() created entries get no rights.
>>   Is there a better hook?
>
> We are already hooking into hook_path_mknod(), hook_path_symlink()
> etc.  Is the feature not possible based on that hook as well?
>
> In fact, I would have assumed that you would only need to change the
> logic in the path walk so that it can pick up the special rule type?
> Does that not work?
>
>> - Through overlayfs, created entries get no rights either, because the
>>   upper inode is created with the mounter's credentials. Should overlayf=
s
>>   be handled, e.g. via security_dentry_create_files_as()?
>
> Landlock does generally provide the normal semantics when you use
> files through an OverlayFS mount.  We have exhaustive tests for it in
> fs_test.c as well.
>
>
>> - A file renamed or linked in keeps only the rights it had at its source=
.
>>   Should it get none instead?
>
> Please see the logic and discussions around the
> LANDLOCK_ACCESS_FS_REFER access right: When linking or renaming a file
> to a new location, we must make sure that a landlocked program can not
> move it to a place where it suddenly has more access rights on the
> file because it is now accessible under different parent directories.
>

This dos follow the refer rule fwiw.

Thank you for taking the time to respond :)

> Thanks,
> =E2=80=93G=C3=BCnther


