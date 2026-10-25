Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950737;
	b=Rrog+28pM9VsUdaaLHxvCaNyja0Q5YAmurh0kPMZnJ3gWHoE8tUmdw3sruNWF15gBVS9
	 zywcmeHLro5M0+AqdcnHPSY/fmH1JJvgYJPo8HqQRcqD8l0fNiTFplpCFyNAH31+7MZE+
	 xOykHMZdxPAaMYJRpJ/J/UP1wDpngIWDKXGVuiTI2bjyzOyTFF+IjUCRAwPutvMhpL3Mb
	 9G9764+BeELtvndvhS5UZD5fc3A7yHcrNYoAw/lET141bx2UHnk1YwlwtY0fsRVfN2gth
	 8teFJ6d+hAXZ2KE4JxUQnHywKoOrY5bMKNV2qJR+iMXxepmnoP8JOJKadmGk3LhFKxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=yEmuPuDD8UK5IkZalmUOKJ7w1yR3lVP8uGzhXUXIML8=;
	b=yxTDG+aqvnnbeZ28ys8B5gZAP22f93QX6KBTQszW2O0jGEj21NP0g9kooBLUuN7yTGgS
	 snnnoL/rclcDAA2ukDcd3PN5BitCoRgyHhuKicoyqn9CIVbgRaxgY7rHoTIRO84XW/I0Y
	 phwv65FJjyS2CuruF1aNwbDh76bTlV508SsFI+UZk8LOgJ8NRe6RT8BLX/0zY/5KvBqTy
	 W5a/x/HMSqa2pz0dxNhXz9HNynhA3nPFom3ZtiIt4y0az+DJYAHMRLjSYIBFAZUXAeTF3
	 KLeEkZc98lkd217T4wQgG8pz5UqfnFyjE2yikwX0b4GpELqhV9gEwTo6yY8XTTNsvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qa6bIIhI;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5179E606A31A
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 17:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5179E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qa6bIIhI
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35d0be18c71so3985671eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792950736; x=1793555536; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yEmuPuDD8UK5IkZalmUOKJ7w1yR3lVP8uGzhXUXIML8=;
        b=Qa6bIIhI1zo3p2dQWKhj2tR8pnLI8Zl6m0mWyMLnSmPhQLxVUnu4fcOkdUUT056diK
         KGkkH3Qjq6CcF4SOsLCQd00vYbcrT1g4QhKIielEjpkQ6I60pmJixMfUzfeSFp9frTfB
         bRlNv9B6UD0jwOxsfAM/f4+k8LocdAfBbdEGabstyrmfmZM6qo6GsDycOYPYajrLCK1g
         +yhV60oSbn/GH88u9gU+mcUTc8nInQjyBQJdOgQKnpAH4Mpa/JEZ32N6M0EsVfuwPQL6
         FfnDqUpneeuzoHqYtxMOgYIVDnM2agcI3+iPFA62lKUnWE3uYqcgEv5ZEqKRl8APDAwy
         ab/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950736; x=1793555536;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEmuPuDD8UK5IkZalmUOKJ7w1yR3lVP8uGzhXUXIML8=;
        b=0it6fx44/ovdaAjuSIl0nw0HpPsFx+LPISKpG+zmhsQ7HRx2i0iutkeH6K3HDjiMfx
         U2vp46CAwkUHgoiDSimRx8yF5vMnbELMEzYbqk4Pd7626W6QLa3gE09fShQwX9b4rPSD
         tWqm3aXJk5Gd9RhBW7g+m50SkF1QYBwdJCq0Fbfs7jYRSrmcQfJCJADHlSTU7XdNLnJw
         c4y2JjpcNUU0KCoMIIoH7sXLBbrbO9BTQmQJhHEQOf/1TE13VPv9J+hTa2LRdhRDsM90
         UeUJ8qSzdtoFyC8C4nmUjiMeXHu7+l3aaRbcNVEtSbieDOBfQ8xYb5K8hcm5h/YbNmnB
         jdjA==
X-Forwarded-Encrypted: i=1; AKwUvBy7o/eEU5qDJLUp6b4ISKyhKJN67I93fyAa5D3+7guBi4hwZdHHlMnxXaIQhsibuhaRr3kM6DKlpFWZprZ1KP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrCgIMUcY0qjVJ/DF3tTgoEzlY6a835JAmyI3aFxjLx5Z8MSYR
	rhZ4oy3JuS7fvZJhvy5LX67oQIx5AVH8WFhemS7WdMRC2XBAtZt8bUCu
X-Gm-Gg: AYBFou3aNkBGv8BQsxi690/nnufXEKYlmENE2IQDd1yZqawiG4PqWBXUcEXm26NxX0/
	t5COAIZoYT5uqQVh1js+VHzh9n2R2pb6zKzsKgjxK0w4BgtNO7TpAirNR2RVzQVM+T/FizXy467
	VQ+/s+NJtZ0dBALIglGpYcfM/zGdg7+XDaKKk5yP2PJhzmcsg4xWaojoJIeY0EX6a9w94eshYBR
	/Cvind9veBWEJyB9Gvnbetp3O98DiJvLyweNjctGrQCm7YPArqAzpxLTJY/0UsTmI8ktN41aHv4
	URlpl1BP3vmxOezxg3Wvx9dvcPqL8WzM0ntjpDTNy8GE65E0okBGzgJyBAEZomxc1LxXkxjIEZP
	9//Wjj7hbW/j0CCrzXfWA2LymIU3tqRlH+KPWmN+SUwVbnsV5RXLPmmZ4ct4IWrtcPjN1GmPOR/
	9zrr9FnWtox2gYjF0WjsCAO3zxZcFdAjjd2pcgHeo5Z8m6qOyuXArl3bBoLaXxGPnQwABKEcA9L
	+h0PBu3YjQOjsbHQwJvMrHDHdT8YHBHirsy5TkbW/EVi716wD152aZRXo1n
X-Received: by 2002:a05:693c:2502:b0:357:ee3a:267a with SMTP id 5a478bee46e88-369e866a7dbmr6307920eec.2.1792950736269;
        Sun, 25 Oct 2026 10:52:16 -0700 (PDT)
Received: from localhost ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8afd64fsm21569336eec.0.2026.10.25.10.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 10:52:15 -0700 (PDT)
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
Date: Sun, 25 Oct 2026 10:52:14 -0700
Message-Id: <DME3ZOI3Z6VE.1XGI920DJV4LE@gmail.com>
From: "Farid Zakaria" <farid.m.zakaria@gmail.com>
To: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>, "Farid Zakaria"
 <farid.m.zakaria@gmail.com>
Cc: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Paul Moore"
 <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Shuah Khan" <shuah@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "John Ericson" <mail@johnericson.me>,
 <linux-security-module@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
X-Mailer: aerc 0.22.0
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
 <20261025.769b43a39e24@gnoack.org> <20261025.8e22954c9c47@gnoack.org>
In-Reply-To: <20261025.8e22954c9c47@gnoack.org>

On Sun Oct 25, 2026 at 7:57 AM PDT, G=C3=BCnther Noack wrote:
> On Sun, Oct 25, 2026 at 12:07:10PM +0100, G=C3=BCnther Noack wrote:
>> Hello Farid!
>>=20
>> On Sat, Oct 24, 2026 at 01:39:16PM -0700, Farid Zakaria wrote:
>> > This is a proposal for an idea to add support for landlock to work
>> > better with build systems such as Nix where they want to apply
>> > restrictions but the paths may not yet exist.
>> >=20
>> > TL;DR;
>> > =3D=3D=3D=3D=3D=3D=3D=3D
>> >=20
>> > Landlock rules attach to inodes that exist when a ruleset is built.
>> > That makes a directory shared between trusted and sandboxed tasks hard
>> > to confine: the sandbox may create entries there with
>> > LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
>> > time, and granting read access on the directory to cover them exposes
>> > every other entry as well. This series adds a rule flag that grants
>> > access rights on the entries a domain creates in a directory, instead
>> > of on the directory.
>> >=20
>> > Motivation
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >=20
>> > The motivating user is the Nix build sandbox. Every Nix build runs in
>> > its own sandbox, and a build may only read its declared inputs in
>> > /nix/store and must be able to write and read back the outputs it
>> > creates there. Nix enforces this with a private mount namespace: it
>> > creates an empty store directory and bind-mounts each input path into
>> > it, one mount per input. Nix has paid this per-input cost since the
>> > sandbox was introduced [1].
>> >=20
>> > The cost is paid per build and grows with the size of the input
>> > closure. Nix is moving towards much finer-grained builds (many small
>> > derivations instead of a few large ones), so the number of sandboxes
>> > grows while each build's own work shrinks, and the sandbox setup is
>> > becoming the bottleneck. A typical build has hundreds of inputs; large
>> > ones have thousands.
>> >=20
>> > A microbenchmark sets up and tears down a Nix-like sandbox (user,
>> > mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
>> > removing the chroot afterwards). It compares one bind mount per input
>> > with a single bind mount of the whole store plus one Landlock rule per
>> > input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
>> > ext4, 16 cores:
>> >=20
>> >   inputs   bind mount per input   one bind mount + Landlock   speedup
>> >       10         3.2 ms                    2.3 ms               1.4x
>> >      100        11.6 ms                    2.8 ms               4.1x
>> >     1000        79.3 ms                    6.4 ms              12.4x
>> >     5000       400.1 ms                   24.4 ms              16.4x
>> >=20
>> > With Landlock, an input costs an O_PATH open and a landlock_add_rule()
>> > call: there is a single mount, and no mountpoint directory to create
>> > before the build and remove after it (removing the 1000 empty
>> > mountpoints alone took 17 ms).
>> >=20
>> > The single bind mount is only sound if the store listing and the
>> > undeclared store paths stay unreadable while the build can still use
>> > its outputs. Without this series, covering the outputs requires a rule
>> > on /nix/store itself, which makes every store path readable again.
>> >=20
>> > [1] https://github.com/NixOS/nix/issues/179
>>=20
>> I have not done a thorough code review yet, and will focus on the
>> general approach.
>>=20
>> I am generally in favor of this approach where we keep track of the
>> directory inode plus the file name.
>
> Apologies, I think I was jumping to conclusions here when I read this
> too superficially - I realize that you have implemented something
> different;
>
> If I understand correctly, your proposed patch set is granting the
> access rights on every file that you are creating freshly, but not on
> files that were created by other processes in the same directory.  The
> semantics, from what I can see, seem like a Landlock variant to what
> the "sticky bit" does in /tmp -- you have access to what you create
> yourself, but not to the files created by other processes.
>
>
> ## Alternative suggestion
>
> I have been discussing the other approach with Micka=C3=ABl a while back.
> This would also work in use cases where we want to express a rule on a
> path whose underlying file inode might change, with examples being
> /etc/resolv.conf (recreated by a DHCP client) or Pathname Unix Domain
> Sockets (commonly recreated when services restart).
>
> In that approach, we'd add a rule like
>
> /* pseudocode; name and exact layout TBD */
> struct landlock_path_beneath2_attr {
> 	__u64 allowed_access;
>         __s32 parent_fd;
>         char  *basename;
> }
>
> During the path walk when checking for an access right, it would match
> if the parent_fd matches an inode and the name of the next path
> component is basename.  For example, to access a (potentially
> changing) /etc/resolv.conf:
>
> struct landlock_path_beneath_attr2 attr =3D {
> 	.allowed_access =3D READ_ONLY_ACCESSES,
>         .parent_fd      =3D open("/etc", O_PATH|O_CLOEXEC),
>         .basename       =3D "resolv.conf",
> }
>
> Or to allow the creation of an output file:
>
> struct landlock_path_beneath_attr2 attr =3D {
> 	.allowed_access =3D READ_WRITE_ACCESSES | LANDLOCK_ACCESS_FS_MAKE_REG,
>         .parent_fd      =3D open("/output/directory", O_PATH|O_CLOEXEC),
>         .basename       =3D "mymodule.o",
> }
>
> Would that be a model that would work for your Nix use case as well?
> I'm imagining that you are declaring the exact list of output files,
> is that correct?
>
> =E2=80=93G=C3=BCnther

Gunther,

From my reading of your suggestion and the code, I think that would work
for Nix and maybe a little simpler. Nix does know ahead of time the
output directory (/nix/store/<hash>-<name>, one per output), so
a parent_fd and a basename that we walk uptowards would be sufficient
without creating inodes.

This sounds like a good approach to me and my research upon your
suggestion is that it would simplify the proposal as well (drop
a patch). Should I try to implement this and send a new patch series?
(Disclosure: Will use AI to help me write the code, but will review and
test it myself.)
