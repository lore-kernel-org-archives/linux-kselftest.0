Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885854611EE
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515126; cv=pass; b=UASE95AbuV4rBb1hZw/ymfahaegV0U8gLOfhibLDEhjFNjy1WC0G2UxvDvKF/pCeJhBt5o8hQgazvHvBsDxmqmAln0t7Ly9azIZh0z4RimSOxRnmhi2zQBHsm6eLeeUfCbpd5kq1GCCY020gSdCXraDOyYbQKTBmh61giuVvj3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515126; c=relaxed/simple;
	bh=LMcsBp3I2AM2BUc5Uv9PZXVaMxtMYi04e37upzRhQOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYpU/vFdT7SHYU9/yiJdZWalwwtQ1I5Dc+ojMeeSaBaSHFicSqSzjy3JhgYAMbPuPHgMyAolG4DbdDwJLKOHCgz0WApaZDtznVEfVuu5Hh9oVPiSmU1AQOIpBW2LvnetOAH9v/hxNilPjIyBoNDwJb3qUWzJ69PKQVE4t3IJfes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ8YmyNG; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ8YmyNG"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so3224146d6.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 05:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783515123; cv=none;
        d=google.com; s=arc-20260327;
        b=NDQGyZHOXW6fe+2di134D5V42cM9ZhFlxk5DeW13kH95XhhT5NrZ9IMlMdwess6M5Z
         IBBU5zJp2YRUg4fkkTiBbBHw4dYidwQYylhR3SwiVqAxQgXmf2XYHLHQ/hoJibft77xZ
         LXpIDBp5vG8IrilZ57VXffvrM31c/Su2I04ZEYAY2F0fBbxMRI+ydLhiVTwef9IcXVrv
         WRdg4zfDBdKN4bIZfuxccbbhibju+xTUm/ODYRuO1AT7TfgRHH0qvCe4ZFPxg5fjjbar
         2ccpTtaQaepTYXYayhj6PLklq4+agrtPkxph6hsiDNdw++YRITr4kn0b0CSQnigSK7tq
         f+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LMcsBp3I2AM2BUc5Uv9PZXVaMxtMYi04e37upzRhQOQ=;
        fh=ZQxMmbJlWzHMSe4ro88IH7iuTKsaNJ8KNZd9JrbVDKg=;
        b=CeolupZX3o29ahebLLowKOjO1aU1L/c7tiIGR5mIprrnTjn5itomdjMdJuUzbt9dlr
         zc2KsISp/orDRXeUw/jwqUEYia4h2khb0VPDLdbSYNoaRpdyxNomlhZ3nSbjQnmQyuJ3
         b/MO5ihsl6WF+Njg5bJ5UC1a54o6lwcvHNP+yQI3S0enJV2LpMsyPsuzyzHbJ/hoo00N
         kU+sX9yud7ZsB7Lrbl0doANrWim6t2ROVivb/qjs3hdGP3mBuBCU5pfyk8b+nf7bQypx
         9erpcI4xfTMuXqo419pv1OOVjNYSXAI/D65OemR4VBPdbx/boEpr5v+Vf0iwGOtzLEIx
         xUwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515123; x=1784119923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LMcsBp3I2AM2BUc5Uv9PZXVaMxtMYi04e37upzRhQOQ=;
        b=cJ8YmyNGzcUVkugDcbDFSV9hG1XDIYcPXiertRg0HgzcUcju9zF9S1QddQvl1IpWUU
         4k5nyw2V0IVysz1RCrUdJrEDo/h/A2qbnGEkhOL3pMSeZq9aNdhek1gxoF3bPioxNI3d
         ggeFj1wflW8RofhZngweDB2Ewf+1+x6kpdbS6g61gDANdxSQ8inNYw98Euig7Tflxz79
         yJ8j6vynosLrChyjPyPwAlM/tzP8CcmxcP2N9+hHViX91g/XicWPJjt9i8qCxLFKR4ur
         hbNv49Trj68z0qWIkUNyQKuPp7su1TchELfMq/n41YFkTwA8KS5WkUEWYHQo3mp6OZbs
         /R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515123; x=1784119923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMcsBp3I2AM2BUc5Uv9PZXVaMxtMYi04e37upzRhQOQ=;
        b=LeCVY4d6pQwOR5eln94cnwfEkJYpRybG+cGZAdUTTx2Ssbq7WePPcfd5p+bc/UdWHa
         B+7mbjKIF79lxU/KckOw2ViJMlO0cuYuunsSQxNtsRqSAFjFM5jxE62wJx2hvKxS/prj
         uhgt6fKmH/EPqBeDpgVG028ZQGIlsZqAn3kzy2cuehcFWWmH/CWLfQvf65S9Pc8lPUkt
         zZYJ20EbeJTg9eIUK/m50Iy/SZ0eAYgT5Vz/6jWubPwffGZeI1C4bTviIsyd3at3COIC
         ICwO8DGN2GeZGkEwEbiXspCuVmJWAOF4iY9CemKY66xqDPGTSWIJst3Z42w8knB6ledd
         SdEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoY2yQkIZAsUuSHTtws5/EtkietlYD8W/BCFRJSua2VlBNM5vBQ6GHz2BBD/qoqjS4JFELOOM33MxXClCmliKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz61c5CpXcFEoDPJK1e/8Ilnk2D7IdqFD6SemgO2XxiEqLpS8+y
	Q1WLo5snEIm9ZBnJlHoeEm2GawYtb9djUwIOlw7vSlJtHLVNwAbIoCEePTcAAjZZcOcgofJgrU7
	2XgC0CoYAxfX5i3UCvSqp9XzjHL7VRH4=
X-Gm-Gg: AfdE7ckhnkSpZcjNb8D8YZgOJESipdbhpLI3Cq5IqUQ67hRLDhUkhYUMwgWlR3Gjc37
	wkNddbpc2fOz96EFXGn/36SXhr71KbG/FFQCiXo/Wz64FDqYFC3bRobp5xJ+VtKc5GHqIYOldWR
	cP277cfIFYrYVGMx/X3Ec3QZr0V8ftm5/aFyMGKbw/ZV/ylKSYeXXxFpQ+y9enTXKLRhVtG4KVm
	cW8AZMjglhvGI2evTqVc/mpWRcAeWkwMn80xYsj9B3nNsJw0zH8VWaH1wlm3clq5YR6tAzBts90
	DQNCEQycIdFPwBmkzm5h99aHdys=
X-Received: by 2002:a05:6214:328c:b0:8fd:6df3:b37a with SMTP id
 6a1803df08f44-8fec361db53mr20328306d6.62.1783515123475; Wed, 08 Jul 2026
 05:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708000956.46138-1-dwindsor@gmail.com> <DJSV0P2OINKE.34OCOC34KFEEF@gmail.com>
In-Reply-To: <DJSV0P2OINKE.34OCOC34KFEEF@gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Wed, 8 Jul 2026 08:51:52 -0400
X-Gm-Features: AVVi8CfU37Brxag2yfG62kEk96iHc-RKohKljtHAIy8Sn1Fk6Gh-XV62bqUwhO4
Message-ID: <CAEXv5_j96aUkmSEg4brvk2q-A3SyYzXZ7jyutoXfrc-oDykZYQ@mail.gmail.com>
Subject: Re: [PATCH v5 bpf-next 0/3] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Matt Bobrowski <mattbobrowski@google.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 11:12=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Wed Jul 8, 2026 at 2:09 AM CEST, David Windsor wrote:
> > Many in-kernel LSMs (SELinux, Smack, IMA) store security labels in
> > extended attributes. For these LSMs, atomic labeling during inode
> > creation is critical: if the inode becomes accessible before its xattr
> > is set, it is briefly unlabeled, which can disrupt LSMs making policy
> > decisions based on file labels.
> >
> > Existing LSMs solve this by setting xattrs directly in the
> > inode_init_security hook, which runs before the inode becomes
> > accessible. BPF LSM programs currently lack this capability because
> > the hook uses an output parameter (xattr_count) that BPF programs
> > cannot write to, and existing kfuncs like bpf_set_dentry_xattr
> > require a dentry that isn't available until after the inode is
> > accessible.
> >
> > This series introduces the bpf_init_inode_xattr() kfunc, which takes
> > the combined inode_init_security xattr context argument and claims a
> > slot in it via the new security_lsmxattr_add() LSM helper.
> >
>
> There are various CI failures in newly added tests, I don't think any of =
them
> are passing. Please fix before respinning.
>
> https://github.com/kernel-patches/bpf/pull/12730
>
> E.g. both test_init_inode_xattr and test_init_inode_xattr_slot do not hav=
e
> expected results.
>

This is happening because the path "/tmp" in bpf ci isn't mounted on
tmpfs, rather on 9p:

[ 5.813072] VFS: Mounted root (9p filesystem) on device 0:22.
[ 5.924390] vmtest: Mounting tmpfs at /dev/shm
[ 5.971012] vmtest: Mounting tmpfs at /run
[ 6.096271] vmtest: Mounting tmpfs at /mnt

... which doesn't call inode_init_security. Changing the test to
create its file in /dev/shm, which has a real tmpfs, fixes this. We
can update the test to skip on filesystems where the hook doesn't
fire.

I'll wait to gather feedback from Alexei and Paul before sending v6.

> pw-bot: cr
>
> > [...]
