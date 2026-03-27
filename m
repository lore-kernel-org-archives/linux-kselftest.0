Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716CF283C9D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619025; cv=none; b=ANBPztWqtJp2nuOOQGl6xfSuj4YQYlD+mXvD+U3PhrypMlyODW0rHNvvdFPnHU+YMRh8/0412n7tDW0FBcprK8saIQ8/4dTB9zk7oIWr9uync0pdqPAniNA4qxu+urK+ux851RzSkPnsCnvtvue5/qjh6OCuHIfmuVmV2dDQv9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619025; c=relaxed/simple;
	bh=xnpOtbtAnF6ZHQ8pPCVM9kiHlVMfUfTM5ad6nkFx99I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=py5bPnXTO8ObPNVijPaSBG1kWTcz62GMQVUct4dveVwcy8zJy2bLU33Ov0N/Xq2qoDMhj1EsDzmOaziYTHVCzRT9vwRTkdgtycK89KMKxn91mrwJNEmzSUeQtoKB33qWy9T4fT41K/hdseKcam1ZQChdB82XRbFPib9Dh2+yDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YFLlAehf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YFLlAehf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so20415395e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774619022; x=1775223822; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YKsHeKZ6OpS0YnJ+ugq57cVpBwIG5Py5vDHb5pEObDI=;
        b=YFLlAehfqhLWrlDbgmz/3b4MFjgclYxL70mpBaZSAdYANAetUWX8ea9vC7YqLTUCmZ
         sKyrywoFxcVBKMIvZSjn9CQgJaIU74y8pQ2RdNrN+BPn416X4dgusJP3VmfLekjLz6BL
         1BqyLlAh11iW8UBoppmoNKeaFyhSFkbWCcbZwhEKKQn8WZ1TXWXWeRdiUQBxYHut2Q+Y
         2VmDCL8OF3qRs5ZbhcCGv+uUu9WY305ExTs1ycUIXzPtPiN7YU05V9EasJT0fZwVQETk
         KSdWntCYIF9ATFeVXE78W1du4MSJr6vWDcokdKaLIaAwLqlJYbzdaa5vbLiwDoq50wxc
         ymUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619022; x=1775223822;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKsHeKZ6OpS0YnJ+ugq57cVpBwIG5Py5vDHb5pEObDI=;
        b=IAU8cWVMk67rJszI9eCWGcSwEJYOJpH4PSrty9kGryRSluIFBQwimO4ZEoE9hdFFjP
         XKWOhjKfef8GqwtWWDRx0C3sF1QuJe99OaJa6uuXL1LFT++N0OaUU2+inNzMu6lZsL7y
         nsYqeIrCaH5MJ6DoIUDDvCGCtDkdBajxW5gMUGAb4iv3YknLzN2iDnYTrcaW5uJbru4E
         ZDdZThwuAxtjAZGKDf3ANsBC5IzKib/T2Cenghai3kyxQj7qikMNtFzLXgAY62L5j98X
         GImptRHTqf8mmu389RJIl9xpPOTiMFKENBGGckFdBSCE/GSTnQ8LhpS8Okosugg8J1ba
         k9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCX5A92dtQMMStv32WjZyYFfAsg7S7fAOBI9MRKLxnMxOe1g8T/iFsEqaVRVH2rZicQL68MnsSHYq/0cqp5pnZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDoLNhtQrn8n12gqwjIh5ZgZtNA2ggaLh3TymuDnls6qC8mzQJ
	E4vrXHACRaZSR9DHRVW8ttUHJzDgB5wXM7wR5ldjl6JcrlHACsgpwNDR0Tarf0ayNZY=
X-Gm-Gg: ATEYQzxt0LGobfunnoex4m0pTJwVJTeV+VSMc82OaZK4IwTnlOV/sxbWV5US713OAm6
	GKdym0m2tsauC72edK5PjzZn2ummEU09cIoNCozV9xywKouniVUDjpg3B2tnzRREK3Qd5G0ZTUI
	iqBxXjo0vdlPKEgVhLvwihv0/q1arB7ElarMOHw70w6ITIzC+7E0ql9HNIuOnOM6o07ANIxlZgj
	vmPUZn1G0j+Ef+Rtl8Ucvk2X4/2e7FzMzTD0G6/qGfe9Y84E5m1tCc1ni2SnL3NnfIXil9e2MuC
	heS+vuvpLdUPlWSFpNmQuylOnQPw+rmgl/IxJuQZCTpAl27vTDLaMWa117GS3jMEX7YREe0FIsF
	emb6jrfrGzZZJHIGNm+E9UAktpabC8MIQLo597I/D48APT75nrTOF1RfUaAcmsKrzkGnhKcadnK
	2gB6Q19ocrnaODF3Q8mO1SzhEl/CmK8ln4Ooz/kItRqn5NvGpabKYgxVc2wAW0DSRoieXGgg==
X-Received: by 2002:a05:600c:3510:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-487280abccdmr37007085e9.28.1774619021707;
        Fri, 27 Mar 2026 06:43:41 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:c8ca:fb24:208a:b63f? ([2804:1bc4:224:7800:c8ca:fb24:208a:b63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270c3393sm25085205e9.4.2026.03.27.06.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:43:40 -0700 (PDT)
Message-ID: <47ef161f2574a49e591b87948ecaa635210c9b39.camel@suse.com>
Subject: Re: [PATCH 3/8] selftests: livepatch: test-kprobe: Check if kprobes
 can work with livepatches
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>,  Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Mar 2026 10:43:35 -0300
In-Reply-To: <ab0wiEuokqDwq5_v@pathway.suse.cz>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
	 <20260313-lp-tests-old-fixes-v1-3-71ac6dfb3253@suse.com>
	 <abhqRTBtF1hLDmPq@redhat.com>
	 <c4249fb8b36aba8649e4dcdac022f2d646413756.camel@suse.com>
	 <ab0wiEuokqDwq5_v@pathway.suse.cz>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-20 at 12:33 +0100, Petr Mladek wrote:
> On Thu 2026-03-19 11:35:16, Marcos Paulo de Souza wrote:
> > On Mon, 2026-03-16 at 16:38 -0400, Joe Lawrence wrote:
> > > On Fri, Mar 13, 2026 at 05:58:34PM -0300, Marcos Paulo de Souza
> > > wrote:
> > > > Running the upstream selftests on older kernels can presente
> > > > some
> > > > issues
> > > > regarding features being not present. One of such issues if the
> > > > missing
> > > > capability of having both kprobes and livepatches on the same
> > > > function.
> > > >=20
> > >=20
> > > nit picking, but slightly reworded for clarity and spelling:
> > >=20
> > > Running upstream selftests on older kernels can be problematic
> > > when
> > > features or fixes from newer versions are not present. For
> > > example,
> > > older kernels may lack the capability to support kprobes and
> > > livepatches
> > > on the same function simultaneously.
> >=20
> > Much better, I'll pick your description for v2.
> >=20
> > >=20
> > > > The support was introduced in commit 0bc11ed5ab60c
> > > > ("kprobes: Allow kprobes coexist with livepatch"), which means
> > > > that
> > > > older
> > > > kernels may lack this change.
> > > >=20
> > > > The lack of this feature can be checked when a kprobe without a
> > > > post_handler is loaded and checking that the enabled_function's
> > > > file
> > > > shows the flag "I". A kernel with the proper support for
> > > > kprobes
> > > > and
> > > > livepatches would presente the flag only when a post_handler is
> > >=20
> > > nit: s/presente/present
> >=20
> > > > --- a/tools/testing/selftests/livepatch/test-kprobe.sh
> > > > +++ b/tools/testing/selftests/livepatch/test-kprobe.sh
> > > > @@ -16,30 +16,19 @@ setup_config
> > > > =C2=A0# when it uses a post_handler since only one IPMODIFY maybe b=
e
> > > > registered
> > > > =C2=A0# to any given function at a time.
> > > > =C2=A0
> > > > -start_test "livepatch interaction with kprobed function with
> > > > post_handler"
> > > > -
> > > > -echo 1 > "$SYSFS_KPROBES_DIR/enabled"
> > > > -
> > > > -load_mod $MOD_KPROBE has_post_handler=3D1
> > > > -load_failing_mod $MOD_LIVEPATCH
> > > > -unload_mod $MOD_KPROBE
> > > > -
> > > > -check_result "% insmod test_modules/test_klp_kprobe.ko
> > > > has_post_handler=3D1
> > > > -% insmod test_modules/$MOD_LIVEPATCH.ko
> > > > -livepatch: enabling patch '$MOD_LIVEPATCH'
> > > > -livepatch: '$MOD_LIVEPATCH': initializing patching transition
> > > > -livepatch: failed to register ftrace handler for function
> > > > 'cmdline_proc_show' (-16)
> > > > -livepatch: failed to patch object 'vmlinux'
> > > > -livepatch: failed to enable patch '$MOD_LIVEPATCH'
> > > > -livepatch: '$MOD_LIVEPATCH': canceling patching transition,
> > > > going
> > > > to unpatch
> > > > -livepatch: '$MOD_LIVEPATCH': completing unpatching transition
> > > > -livepatch: '$MOD_LIVEPATCH': unpatching complete
> > > > -insmod: ERROR: could not insert module
> > > > test_modules/$MOD_LIVEPATCH.ko: Device or resource busy
> > > > -% rmmod test_klp_kprobe"
> > > > -
> > > > =C2=A0start_test "livepatch interaction with kprobed function
> > > > without
> > > > post_handler"
> > > > =C2=A0
> > > > =C2=A0load_mod $MOD_KPROBE has_post_handler=3D0
> > > > +
> > > > +# Check if commit 0bc11ed5ab60c ("kprobes: Allow kprobes
> > > > coexist
> > > > with livepatch")
> > > > +# is missing, meaning that livepatches and kprobes can't be
> > > > used
> > > > together.
> > > > +# When the commit is missing, kprobes always set IPMODIFY (the
> > > > I
> > > > flag), even
> > > > +# when the post handler is missing.
> > > > +if grep --quiet ") R I"
> > > > "$SYSFS_DEBUG_DIR/tracing/enabled_functions"; then
> > >=20
> > > Will flags R I always be in this order?
> >=20
> > 		seq_printf(m, " (%ld)%s%s%s%s%s",
> > 			=C2=A0=C2=A0 ftrace_rec_count(rec),
> > 			=C2=A0=C2=A0 rec->flags & FTRACE_FL_REGS ? " R" : "=C2=A0
> > ",
> > 			=C2=A0=C2=A0 rec->flags & FTRACE_FL_IPMODIFY ? " I"
> > : "=20
> > ",
> >=20
> > So this is safe. I'll add a comment in the patch to explain why
> > this is
> > safe too. Thanks for the comment!
>=20
> I would personally check also "cmdline_proc_show" to make sure that
> the line is about this function. Something like:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 grep --quiet ") "cmdline_proc_show.*([0-9]\+) R"
>=20
>=20
> But I am afraid that this approach is not good. It breaks the test.
> It won't longer be able to catch regressions when the kprobe
> sets "FTRACE_FL_IPMODIFY" by mistake again.
>=20
> We could add a version check. But it would break users who backport
> the fix into older kernels.
>=20
> IMHO, the best solution would be to keep the test as is.
> Whoever is running the test with older kernels should mark it
> as "failure-expected". The test is pointing out an existing problem
> in the old kernel. IMHO, it should not hide it.

Makes sense, thanks for your review Petr. I'll drop this patch from v2.

>=20
> Best Regards,
> Petr
