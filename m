Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937497;
	b=5j5aw0u/Ns5qR17DCF4o428UHNQFdyPQ+VOgyZqumpuWeb2gfS2yQB3QYt6OS85Iw/5B
	 ruJprtfd+mK72MaouHiB9DZVppluAAQ92fzYEAxkgazFvjNG8wBpTJNUzSZZ7jlVo7kDf
	 ee6ym0eG9F6PmCLaTxhq8J14x/08YZ8J2keRy5GqJKiKReNVv3xtJb+X+GL2+XT04h/rJ
	 xThl4J2lUppDH33hMV0tX2Mwy9ASq6LV09tFoSoflTR9KAyMLPSPFYjj03Md+og1hxpNn
	 axbQreyEq/lhPM5EmdPPhrIse/aYvI6WNNPIleDp7DyiyGMcfw1v8p27xELRpzVVSnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
	b=JNaAFPT3CxZQ9dhunwZLkl0KQO1Yj7pIYyxhvTirrPQIF3NRSvQ7Ijp8mrNJS97YtQEH
	 1Qhxm9PNVeIOf8/h5Qu80hP4EmiMO/diVubgDlUWh5Da6K7ylGVdwDjVN/dvuVbEGtz4J
	 ksp6YUXLQWi/2mhIrQCcQv75xHMy+UcVg0GHQ5mibCEam415VdO2Sqrb7AlsbCntO5PoZ
	 yzLA6khIDM685yZ4zUqDVh7bQRn6gN77w1WCQLRRTUo8Q7pT32m+tp/5x0MxhbPILWsom
	 9H0+ypH1y0IY9cu7ZJ8KwCZkvdnlkZsKyi/887Ytl0Bptrkl1n2dmwI7WAPbO7GbNdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oAFIhfOA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5A606A330
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 17:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C5A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oAFIhfOA
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae25c846edso1106061fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 09:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937495; cv=none;
        d=google.com; s=arc-20260327;
        b=pWzhazegZ4xfluF0Ijsqb/ZK9u742xlpf+vgpnNb1Bc/MxQP/bgdxsFlCQinpJmLKk
         PYVWzfzk+lrTVm//2OYd42PMp8Lp0f9AqKIn2mAw70Z4r5V96k97qzvPkLgyPxqNmhRQ
         +rucK3Im3xQkueZPAAG+0Xd5HhKPMxXCEbaubV1+gEEnwl6JNpIUhdVVdS1PUBvZDg/Z
         rZjHcMGIux4mbhT5Qc4U/Izj5vUGmUlNnfBvldmIhQo5QAHXY74a8FVkuCx6l+Hwkzpi
         cmTI+TioHEqTz6IPMhG3hrnG9BU5z2Apb+A+l4oZk8VImwU+Q4YI9yLlG/+sEd5T9Y+O
         d0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        fh=aseiSuiZFW+DXmrvls38eramJsv7/YNKmTZESyt/Xxc=;
        b=aJckl/PWnrDYZ4DkCMbH5KTBUUR2RLRaFO00ZR3xPKE3H944NFMbXoQlGWHaaaHDDT
         jAuAgJZLshLz0HsMl2Rt4+S4BgRoS0cc2hvUMiVjl7s62VNpN9p/uHcK7E3mEu3KSlcC
         kyJ3o7MZLJsRGGhMqkUIj2XYxDVKfdyL7/GzEiF5lWkE3OHcROhGC5jutcFmzCEhzb25
         Fwe8T6MHMUgcOQch9G4n7y9cvbVonKw98KjnFXBcdM4ZFEiBjnFO3vNO8Hfh+YzuE/0N
         n1sdQNYpUGkF8Uxl3D1etNGVC7VTjIq+tJwmSCOvm5zvhlHcPb+K/MX5Xn7r6AQt83jO
         jDsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794937495; x=1795542295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        b=oAFIhfOAkcB0Dg4mKVfkuis2uNtcfHHW1ME1slyaFUO4AI5iAHAmrY1Nw3LuN2VQnC
         6IGXyvAYklXrHuXDFIJP+OpIvCKpQXcsR6yhi7y7UMeoYZWd0Rkq8srCeIQr3Ut6yHo9
         s3QMrLw8d+7yQo0fv8lDR6N1UWY7BgFBjya/tZ7WAbd98chUjwhGKhZVz4B8CNKS2JVt
         s01yrFYXNsMtBbhpU0mHCjFVPEb/8RNf03yXDk0jC6t71dtVUAnUQlSNlv3yrv5kFy/Z
         7TcwXV5Nfa08sHn/NIrA4+u1dyH1Y1UL/1CiJgo3Ncba+UeXkhzzSc1rUH+9TFU6YyuR
         ZiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937495; x=1795542295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        b=heC3m4192NVYn3+J/7nF990c71IcwdvCs9x45Sv7UppjfBq2wDtRyeasIvmQnMRXff
         yIGJehqP6bZkLDLsEEG7pOpmjF1a49ymXg+geaN3kNNo4OlAHAZQPAGrKtu+bpdt+7VH
         tAOv59r5Ifvw3F+0OfJ9ajjUbhdK2CMoZncETmJuJotDGLNv1x6mF6NOrfsryovk254t
         lkpHre2QXSFe7YbMoxf4lRMgAG2Wn/Lpt+JfwjuI909kSAxsJjaGVkhglWPDVYDfbq2g
         zTGqHh9szpznCHdGe1RcMJuxRI4YEGnM4x9WP06mteHjRf8p0dnfav5sg+idQPBA4JgC
         7ZDw==
X-Forwarded-Encrypted: i=1; AL+hErG86p5ql3PWoGRDP+hBQydifyduJ12m32NTVjdnpIKnJX3wmiLYDtRPm2o0CPtLmpyVi1GSw/Kq3PHo5TeJzyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O4Nndq9H+BnYcZKPhYXYRAIdkAa0oIDuGDG2xTrawMBrSsqd6
	+PHMrCoTq+UVbDxW5PnIKzl0KIqQ165di8xByDv8K09M5QB88z9YINQnTvu7lPI8UQBgfo/S5CG
	xX1km5plQ7a2FT/cBFqU0NWDGdEpRQ1emWKsSzdvl
X-Gm-Gg: AYBFou34r+RxGSHM++1j1GbYupGIrQqJ7MpDLDTYUDOrCc93vAiBbGtsV7QcKNagwoV
	ctBODgv0lF1ZEwk6T22TF79UtphWlxcgaq9MX+OcvIpSLNFRRV7wH1LK3KE9j5uHV1ZB4wfPwaJ
	Ece6dy1KxIiw2VKcT903k5yKrEzn5F1jcScJ5egeYVJ6oDFnEVIVaZ7fKVWPDsOlEXyy6Y4by3/
	yt85U+aIrOMyq+oAyZTUBXstJCTTGyMMPNvZ7FM6l566DXJ2w6Pv5d3XQOziVKcak/2IJFzL4bS
	0y0YFVdH11GuEO3cK8rTzOf5lteZEDK3zvssIMHKS47W91HufErPICvS+QF4i+UoURCUAOjPqQv
	Cc19EN+b0Ob+2fqNkPnSpJpAnRJlqqlncxQCazWmf4zRYWgSqe00KLsE=
X-Received: by 2002:ac2:51c6:0:b0:5bf:b945:4334 with SMTP id
 2adb3069b0e04-5c170a15b78mr6210350e87.67.1794937495491; Tue, 17 Nov 2026
 09:44:55 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org>
In-Reply-To: <20261117050841.3289652-1-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 09:44:43 -0800
X-Gm-Features: Aa3M54pzaE332pTi53D1YpA5VO7WahNUrZvzEHccu8lFNhASVJD5SKW-Zdzq05g
Message-ID: <CALCETrUBUnJVhiMkft6hTZZMe8nTpMBRTGY2v=9x5ETBSvmPZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Namespace for namespace roots
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:08=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> OVERVIEW
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> The problem that root namespaces try to resolve is starting a container
> from a root mount tree that is pre-populated before any process is allowe=
d
> to run, without inheriting any host mount-tree ancestors.
>
> Work on this feature started originally in 2025 from David Howells'
> container object patch set [1], but I turned container objects into a
> namespace of namespace roots and built a new implementation around this
> premise.
>
> In early 2026, the patch set was left to gather dust in my kernel tree
> [2]. Then, the other day I saw [3] as was shocked by its over the top
> complexity and thus, here we are.
>
> Not doubling the number of container frameworks inside Linux kernel is at
> least a benefit over container object based solutions. Parallel plumbing =
is
> an inherent flaw of container objects, and it directly affects on
> development and maintenance cost of container runtimes.
>
> Also, thanks to better scoped implementation surface, verifying rootns
> correctness is factors easier than with container objects, and even my
> early kselftest is meaningful. We know what and where we are testing,
> which is always great.
>
> Finally, it is more compatible with pre-existing container tooling
> whereas container objects would have much higher cost.
>
> [1] https://lore.kernel.org/all/155059610368.17079.2220554006494174417.st=
git@warthog.procyon.org.uk/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.gi=
t/log/?h=3Drootns
> [3] https://lore.kernel.org/linux-fsdevel/20261105-b4-cells-v3-0-bc909593=
7a84@toxicpanda.com/
>
> IMPLEMENTATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> rootns_create() allocates a rootns object backed by a pollable anonymous
> inode fd, pinning dedicated empty mount (CLONE_EMPTY_MNTNS) and PID
> namespaces along with any optional namespaces selected in flags.
>
> Before entry, a manager prepares the mount tree through the control fd:
> FSCONFIG_SET_ROOTNS binds a newly opened fs_context to the target rootns,
> and move_mount(..., MOVE_MOUNT_T_ROOTNS_ROOT) installs "/" onto the nullf=
s
> root once and attaches relative submounts beneath it.
>
> rootns_enter() forks a child directly into the rootns credentials,
> nsproxy, and root path without mutating the caller in place. The first
> entrant becomes PID 1; once it exits and zap_pid_ns_processes() reaps all
> members, poll() reports EPOLLHUP and rootns_wait() returns init's status
> and rusage. rootns_kill() walks pid_ns->idr under RCU to signal member
> thread groups.

Can you clarify what this new API actually does?  I've read this three
times, and the best understanding I've come up with is that you've
designed a way to create a group of namespaces identified by an fd and
you're adding an API to configure and enter them cleanly.  Which
sounds very sensible.  But I'm completely confused as to why a
namespace needs to be owned by a "rootns" or why that ownership
affects even newly created sub-namespaces.

--Andy
--=20
Andy Lutomirski
AMA Capital Management, LLC
