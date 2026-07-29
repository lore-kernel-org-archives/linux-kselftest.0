Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A0328B4B
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.148.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345379; cv=pass; b=ApO2kxPZ9tS26BQ2KKUlWannrUxNsD4B+NhOOlo70nl1aRLbfQ47lYzbwKidKIysUSlT9CfIKlbVtn/G3H59Jdlqn6Tn5djseYKzk4IOsuSAdkbIzg1b4+gEnJFrDHcycqJjodnMJAFYp58p3Y4QP6zGSRoj85WfdCNhIgLZZmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345379; c=relaxed/simple;
	bh=CxgVNu8OIzKW/N6Y+uKIInjNOw5NxAfNeZlPCXslq1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ku4tuQtQ8DoN9BbPZWQ5hvErEfUtthmzpxZ7n6hMm35zAegCUKilp0hP2AtaIXeRWWtRWQVNxojMne/cPwjBhWYdip68jFlEjSBnvdFXIO1mV7bJa9ej/Ndv1kiIHuHhYRG5PeO5PtBnSFBLl+EBsgwk3jquRy/9IaiQDp3v1+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; spf=pass smtp.mailfrom=crowdstrike.com; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=e4GRIUdY; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=gkVcSTk8; arc=pass smtp.client-ip=148.163.148.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="e4GRIUdY";
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="gkVcSTk8"
Received: from pps.filterd (m0354652.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TGEfQL2677242
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 17:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=fb8tlbgkpHVbx7GRYrC8ZiHMMxx20Ma1OyZcf/SyMEA=; b=e4GR
	IUdYEC0D4NyHMgg2dA+/CR0Y3qyp1HDioC86H+HL+4cMmqBxfbqEHVQXQUvmynp5
	bxjSB1GMxKiQZj49wxcHaf2jk6xUtn3pmn7f6LAyEOAZprMR/mW2pJRtHOun0Krp
	l9mDmnaoa4EmWUyxg+416Hy1+mt1bIrCzCFdCBCemy8D0dGwm7SpWc0fGXGcke7x
	8UiH4zcuInfrnsTb20q7aGO6LvLnQgEF5w/gvxdi480Ov28XKEJjgnvKLe5gZKRU
	PKMXglDnEkVjj8XK36ueFo+6Fyiy+z2KrxcRQsTkT38mk8nrde2RZTUBox0mRLei
	l3qgcvnTp5v2lgl9MQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4fq6mcuh6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 17:16:13 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e8653ad27so24050207b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 10:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785345372; cv=none;
        d=google.com; s=arc-20260327;
        b=iilbPL5as7R9ORFGSTx80sKflt3UcODjOsA9oFVs6TRlM7P4u1ZJy/VVYmUJ5FGphv
         Dc4PGVPpBVw/6E3+eY4ys697jgqr2GD2f0WACs4tMsaxBWZiY5w97pj7bLdpGO0lgAvF
         lgBNbN8oOwZ0Nk/pTaqYd6vC5FYz9MZ2HwijU3CjnglB58+pb9n+W5/znr3lD8c+7HO4
         or80F8WxO20X+3wJNoleR7lseypzlUnvpIagdiRFOk3Yce4hi87uUKg0uU3zgxyTfWm2
         tSgXsTjfYagHM6WRptGBjd7IjduCSgcBIJb4GI6aNJX6YkNBxP9Chel9gbHx7Teg54Hz
         7cVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fb8tlbgkpHVbx7GRYrC8ZiHMMxx20Ma1OyZcf/SyMEA=;
        fh=lb2m/fhq4yPD/Qphx2Ce1INubk8fElZaeDVxtoQCKok=;
        b=IrJQZY2pd44QvC7BMF5xRdiJ0ijaV4+aRk5S7Emb8eQY3BYAN1W6a5ISKe8RaunL5w
         AOsa3oPhNULrqdoZghMb5reaHRhXPzhc0/0wqlQ21468TobWIvTPRMJCZNh2J56E1lNb
         yiQOasYBGRiHNlwmGjIro6797ILQGhQoxWSR6AavoXxe4nACLf/oU6DuAtFeC+kvoa/L
         lmyeDRhaLE1rfop+o3cc8Cf+Rehhwn5jeleHepe4fKYhu6tEL4s8qMzO5r1B4fiC03A5
         qDURyKpLI36mAiZ3owyBfCf22CMIDSD62NKWERilhlEWcR0fN9qVze2ew+Z9fdxpelV3
         9Pzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1785345372; x=1785950172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fb8tlbgkpHVbx7GRYrC8ZiHMMxx20Ma1OyZcf/SyMEA=;
        b=gkVcSTk8/9qeOJBSPPYPuy0/Uju9l1knImQXn/ZdAgB6umoiHynoNGSnBNYrro9pLT
         kdahEAP+MQHH5pIYjEuCKE/zbxIuQCxo/27rLdVqsyphJBcFSYNuwcE/rsh5GJunn1Pa
         jL57loQNJ6kmupKMfwQIHIRr+aMq4oJQ0JM0mdp7BbKdmwhyCsnEnOLM4D3QRCRE579r
         iq5Pg86F1NkF7G5Iw0qdIu4gxe5i7+8VOqd5VQaz90hYa+pnrVLKcoQV1Ix809GI5iCb
         eWJXITcjnHkfozd0w5wbiCZZosjI1DAYX7VJq61MvjjH0Nnln5Kv1jfI7zJrf1L6YCqV
         PVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785345372; x=1785950172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fb8tlbgkpHVbx7GRYrC8ZiHMMxx20Ma1OyZcf/SyMEA=;
        b=aqL2om/O41wWf/4zAd82eyEnSZ9mSS00vxFak1XY0kgZNavRUKVLmG3uvK2ioMKCz3
         q5E/WsoGtbd3eUrK6l9nqPot/YPhSnRvNTXwCg5CstYrBNU1UvJmPA8G6vJ7nSj4T6Sl
         EbTc62UJG+z9CJlNSBTuG9sqwbNvKz7QDBBFbp1Di/8uo1wnH8QLRKay1sYIqWABHIeX
         rTOMp8Eo1oXuziV11FahG1NZq2UMmvJMvpCi8XbNWjx77fWLQLpvdGGI8XgfoGcBxNup
         43KZUxCFrI61A01AYrulQea3UGgR2ZleKLmVpXKdqDFINyjhq83wbcHER+Wz7aeKBDi5
         rmFA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw/K71sBX4DTvDWUOq61q/eEjB5h+3SKVHOnefsk1NI7I4i9MBrhQai4UKxbTQEX+Zco7TN9SH6nH9Wt4NGwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Dj6lomwNhLF1GocXO7TaGrEaeyXnajN5dGeGtpCjTMAqg05u
	NGdcz9/u7pUt7xUeftfpHe5d0ndz9I86imKXQ4LJCHpH4YWKdCoTOfF9utbJHtLkjk+63gB64xe
	e5N+ltwcLS+VlIuP+QS2Ch4/Mf2VDgffoOD5VveqtLs41mNtvF/NlfruPOeMsOprIOVg/Dmo5l4
	djcXCGsT31NG2lsWq8Nbao2soUS+jMLVFJNVO0UMsss/Gs
X-Gm-Gg: AR+sD11W6Msfn53ykom60HJfGbeblAARIl9A4UWEHGc56RPhxNYCxA+okmMqxluYL+v
	XLCLGjvWgLoZqqGBQ56kzDxy/l13fumPVRiq76FuL3NV8iLNKWpojPfi6ZMiEl/zhG9S+zGV4Uk
	F4iZFkZrGhbgRNndL0nlCjb7xTGGfQHKthiqXnA0p40S/ed5/+eGbCygwH
X-Received: by 2002:a05:690c:4b0b:b0:7db:ccda:a409 with SMTP id 00721157ae682-81f991858eemr37532507b3.9.1785345372449;
        Wed, 29 Jul 2026 10:16:12 -0700 (PDT)
X-Received: by 2002:a05:690c:4b0b:b0:7db:ccda:a409 with SMTP id
 00721157ae682-81f991858eemr37532107b3.9.1785345371866; Wed, 29 Jul 2026
 10:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729005959.3853865-1-andrey.grodzovsky@crowdstrike.com>
 <20260729005959.3853865-4-andrey.grodzovsky@crowdstrike.com> <amn-vbX6AitcIcC0@krava>
In-Reply-To: <amn-vbX6AitcIcC0@krava>
From: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Date: Wed, 29 Jul 2026 13:16:01 -0400
X-Gm-Features: AUfX_mzHJi3wnVv2DObG6kIdUJfhyQomfor8B8-bBUF9HAk2TMES92n1JyZbzHI
Message-ID: <CAOu3gNiThogqw_RzEOujeEt3dMqz513ZJdjCDp3nFr3GxvVumA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 3/3] selftests/bpf: add ftrace_permanent test
To: Jiri Olsa <olsajiri@gmail.com>
Cc: bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
        andrii@kernel.org, song@kernel.org, rostedt@goodmis.org,
        naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org,
        stable@vger.kernel.org, linux-open-source@crowdstrike.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEzNCBTYWx0ZWRfX9PwUfg/Sszq/
 zG8KxGFj2GfOuhO1pmyyyImM1PHe0EnZwIdxrZcXAccXfonQRgs63hgvxvVCQmRsvr9kDBKmCBF
 T7AmDLPnKgv7R2V0hreKToBgbTJY7NAj6Z+S8Z1baRuw8RE81UeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEzNCBTYWx0ZWRfX0IEXnWVwxDtL
 3/YTOzegJhPf7BUAZjVWFE08jakJiT+hSdsfKbOPihVbwls4bX0G/N6Y2wO5edb4WgSenk1V8IY
 tZr3oxZiudi0+aIKhOlqIBd4RnjOVJV4m5XcSqbm+5YNmxhxkf+V49lmTNocXoBS77Sk9uZNL5x
 aNxiGAg1ZZp1bSDMEi+or+NwXgtRMS230l6EAuGJMdqIa12QcvUVbKLUOMEiBBiJiormFKZTXh3
 kX/OYXu9JMpuLc2vJ+y26tdu69O5YuESDpmD5TLM9IqZ6y9J6JBHYVjDPL14Y6evNEiyMcMdvIe
 YmhCwPafhkfbz+pwdmswjY7g0o6s3nOPYhp6OmhD6qYwk+441cT7XUVGcJgxwsPsIcu6EbkBYpm
 xhxYpp1oUUgUXBNSAYL+kMj1Da/gqfN67EZMLtavsUKAfHHVdSbwnmXZwKiV7+5qKyWFhAgkL63
 Hl9OhtwZ94+sv0m2EEw==
X-Proofpoint-GUID: mSdNaCgqZTUWDcD8B4y3a3b-IdrPNkuV
X-Authority-Analysis: v=2.4 cv=UOPt2ify c=1 sm=1 tr=0 ts=6a6a355d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=2KvRFfd_T_-xjmS8C1aD:22 a=pGLkceISAAAA:8 a=pl6vuDidAAAA:8
 a=JqPfYqdnCgMSl0vctSsA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: mSdNaCgqZTUWDcD8B4y3a3b-IdrPNkuV
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11859
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290134

On Wed, Jul 29, 2026 at 9:23=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Tue, Jul 28, 2026 at 08:59:59PM -0400, Andrey Grodzovsky wrote:
> > Cover the FTRACE_OPS_FL_PERMANENT fix on BPF trampolines and
> > ftrace-based kprobes/kretprobes: attach a fentry, fexit, kprobe, and
> > kretprobe program in turn and confirm kernel.ftrace_enabled=3D0 is
> > refused with EBUSY while attached, then succeeds once detached. Also
> > confirm a new fentry/kprobe attach is itself refused while
> > ftrace_enabled=3D0 is already in effect.
> >
> > kprobe.multi/kretprobe.multi/kprobe.session are intentionally not
> > covered, matching the production change's scope.
> >
> > Skip the kprobe/kretprobe subtests when CONFIG_KPROBES_ON_FTRACE is
> > off (e.g. arm64), read back via skel->kconfig->CONFIG_KPROBES_ON_FTRACE
> > (same __kconfig idiom as progs/test_fill_link_info.c).
> >
> > Assisted-by: Claude:claude-sonnet-5
> > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
> > ---
>
> hi,
> I have some links active already after boot which makes test to fail:
>
>   [root@qemu-1 bpf]# echo 0 > /proc/sys/kernel/ftrace_enabled
>   bash: echo: write error: Device or resource busy
>
>   [root@qemu-1 bpf]# ./test_progs -t ftrace_permanent -v
>   bpf_testmod.ko is already unloaded.
>   Loading bpf_testmod.ko...
>   Successfully loaded bpf_testmod.ko.
>   test_ftrace_permanent:PASS:skel_open_and_load 0 nsec
>   check_blocks_disable:PASS:attach_fentry 0 nsec
>   check_blocks_disable:PASS:disable_refused 0 nsec
>   check_blocks_disable:PASS:read_back 0 nsec
>   check_blocks_disable:PASS:still_enabled 0 nsec
>   check_blocks_disable:FAIL:disable_after_detach unexpected error: -16 (e=
rrno 16)
>   check_blocks_disable:PASS:reenable 0 nsec
>   #145/1   ftrace_permanent/fentry_blocks_disable:FAIL
>   check_blocks_disable:PASS:attach_fexit 0 nsec
>   check_blocks_disable:PASS:disable_refused 0 nsec
>   check_blocks_disable:PASS:read_back 0 nsec
>   check_blocks_disable:PASS:still_enabled 0 nsec
>   check_blocks_disable:FAIL:disable_after_detach unexpected error: -16 (e=
rrno 16)
>   check_blocks_disable:PASS:reenable 0 nsec
>   #145/2   ftrace_permanent/fexit_blocks_disable:FAIL
>   check_blocks_disable:PASS:attach_kprobe 0 nsec
>   check_blocks_disable:PASS:disable_refused 0 nsec
>   check_blocks_disable:PASS:read_back 0 nsec
>   check_blocks_disable:PASS:still_enabled 0 nsec
>   check_blocks_disable:FAIL:disable_after_detach unexpected error: -16 (e=
rrno 16)
>   check_blocks_disable:PASS:reenable 0 nsec
>   #145/3   ftrace_permanent/kprobe_blocks_disable:FAIL
>   check_blocks_disable:PASS:attach_kretprobe 0 nsec
>   check_blocks_disable:PASS:disable_refused 0 nsec
>   check_blocks_disable:PASS:read_back 0 nsec
>   check_blocks_disable:PASS:still_enabled 0 nsec
>   check_blocks_disable:FAIL:disable_after_detach unexpected error: -16 (e=
rrno 16)
>   check_blocks_disable:PASS:reenable 0 nsec
>   #145/4   ftrace_permanent/kretprobe_blocks_disable:FAIL
>   check_attach_while_disabled_refused:FAIL:disable unexpected error: -16 =
(errno 16)
>   #145/5   ftrace_permanent/fentry_attach_while_disabled_refused:FAIL
>   check_attach_while_disabled_refused:FAIL:disable unexpected error: -16 =
(errno 16)
>   #145/6   ftrace_permanent/kprobe_attach_while_disabled_refused:FAIL
>   #145     ftrace_permanent:FAIL
>   Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
>   Successfully unloaded bpf_testmod.ko.
>
> jirka
>
>

Thank you, Jiri. I will address this once the decision on whether to
proceed with this
route or, just make ftrace_enabled obsolete, is made.

Andrey
