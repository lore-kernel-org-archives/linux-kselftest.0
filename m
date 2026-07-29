Received: from mx0b-00206402.pphosted.com (mx0b-00206402.pphosted.com [148.163.152.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1145638DC69
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.152.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337254; cv=pass; b=GNUoII7Cy2FFoHT+tmZCiIslbT6vNHmi1JziSewmywbSjQqskPFsUyVHVTljV7LYGeg2YANQBJK7Pirw+kX8lRpLIcgxzsJseRxdpCYKu+pW2vaTzbROSPWyRWJG6/b/1DuRdVPq5bO9ck+DZZaGjYsAJjAWVpS7j4AoaF1qfcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337254; c=relaxed/simple;
	bh=WoRDoEi0VL1vigksALz/83dPkS3F5vPYjkl8rzXgfkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEywT8Bdb58MgCDMNFdGvLux57txrGeb9z7pY23wJxNnMLcBcSCOcR5lTo1sBc7M+WBHjzgwbPfCj1It/wpltV1/FlH6SYsM4uMZ3Ja0xonJkOeyZw2mKkfnvx+WQYW0XjoPCYSL4gHlH0YLHqscl1BEzKT1QASQL98jdVHbAvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; spf=pass smtp.mailfrom=crowdstrike.com; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=McQ1nMx8; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=dGJjpI1A; arc=pass smtp.client-ip=148.163.152.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="McQ1nMx8";
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="dGJjpI1A"
Received: from pps.filterd (m0354655.ppops.net [127.0.0.1])
	by mx0b-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD0qOd3477879
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 15:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=KNsIs+LJSh7r0iAi+d65HQSOE09/M+m4FY1F+mUNWXY=; b=McQ1
	nMx8M7wPOjuOLAkLDA6WuHxFcrcAStnEaL9XPowHaB61V31/WItQ/KdjBYstRpwK
	P+O5TLQc91sUMJSjuMaWZyc8qd1Aeg3A7MrBzuKtAkVZ9D2TEjrYp75iz3jQDOja
	WFnbMcZOrkrsE4DyxHhfuFuY6UhCfcM9qYgnJBF5r88ZTN1MSo+1YXmC8nwwX6ud
	fyvDRcg+iKR2WyvT8SjElYxyjfR9i80ynYuEp4yEzjRI44b5nuM3wy6zlupaiH5Y
	eslsUCM8lDphmgvIYrnuVGF0Jb4CsfC8FFNXl8wPmf/x5yjgfL3pdJtA2FWBQRUG
	vw9r71nevvUHAXnFvw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0b-00206402.pphosted.com (PPS) with ESMTPS id 4fq16fbuc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 15:00:47 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80ee3cb097eso19092127b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 08:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785337247; cv=none;
        d=google.com; s=arc-20260327;
        b=j9BRoZzw13KO+iHBjPBuFU6bJ1p2uylv/Z7a/Ov2QhyKag84bZsH7VtvsjeCCGDhDV
         H5173PeNscqSo+I14R40Crrm9aYEkPyWnjP7NhZ/O34SLzzqCS5G3AryCdh3c9JV0X1W
         eEXEztUmv+vQOCGwfThs7dbh9bPgai9dXhNamCUviG9tMzoZ2mDmF/CmdGWbljmhXPUf
         Va/r0qV+3YX9ch5SLUpcUrNZwM6jC0z68cwNUwS58WiUPiYWH5S3TwxnCn7bMlppltdX
         h2SZLFwWpYS0RSLSuLyJddt+ikV3zFUcieXgULvxU2QZSTjiAluS3HLXOiRRKk8L61x+
         pgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNsIs+LJSh7r0iAi+d65HQSOE09/M+m4FY1F+mUNWXY=;
        fh=EpenVzGlkzLqmsR/OW35tzmwCOMlDRqPN/DgFqFT+oA=;
        b=HhJMV36p+AeW8cowIfplbzVPfbkXkSkdlMCR4qOBDNBwt691YBVR2iFG/3kVB9YJjH
         PXsvrNiXMNOIdatq8i477ygNntu1MXfO16+c1TPD43jU0yKnlwWbqPHqN8c8YL4BExUZ
         bmn+THopzbLuAwvnvDkP3iaJlqkB2oW/EYwYeZp0ld/tz8opViXoaP7L4sIUDD88DiMt
         3ylYWV3kAeVU27Vmj78naVPjqd/HONDTTgu9IUXkaZaWp2xL0NRdjv3eNeuU3hRLTIwg
         5bYZoBP2P5Yme/HiO4z5BgVelOO3uT+KaSnaZWriIpIH0nQ+K95nPKLppjQ0+pbFJS70
         nZpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1785337247; x=1785942047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNsIs+LJSh7r0iAi+d65HQSOE09/M+m4FY1F+mUNWXY=;
        b=dGJjpI1AVGKoZGyCNIAymOFvjW0XpgDQwWB4OlZatsGfSDuWuDirUMbI0oUwjCO9JH
         2lA1cL3ca1pJtRnQoOhCXTkuvc9GmuU1ygAsVYcO0MLkzkzM4yYTx0Ub5iV1Q5MrMor1
         tno81zTuXBjQZQcTAyeuiErJicF5HBI7ZQ9kOIJrGn6xHIbXLmjCw6hzlUaU6+sPS/1+
         CuvL/Y02hWEnqKU37ERKwqjWBxmGsm2lvClR29XT6oQJI6e5sNzI6k5PDod0wOCR5ToU
         BipnDwWRRHrBC1Z2nso3Z5kGN7Dsov6IJcQFnpYwzU/g9pfXum9YmGacf/K62/Ug1Tb1
         +VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785337247; x=1785942047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNsIs+LJSh7r0iAi+d65HQSOE09/M+m4FY1F+mUNWXY=;
        b=nDpDK2LxwmGsG1Jh4XFHmVp69zzWJp80+LlLlRBNQY9pUkeH8CgvYAp9HQgZPfY2Od
         I26u1iafkHHpVb3EbDQKCfqAb3iKhHflxwaw7llw7zfCbvPE3zKiYzWnAdmKAFiSnzBh
         oRLKgpnAxHgM5ObWz/5sLOCbgxdODNy/LJsTl8qKLCbXkZx98xiFSFOtNDOF7s4Vg6KK
         X206Zyzet9dVOYfzYXRMaH7V4G2GJ+Ni8dtnZFZ69zHJK8gtZEYSBR35l+LPxIirO4Il
         EyYVDuU9rWUbESNHLwm42QgDS6UhEwLYPbSwYZubEbc6kzg3s5YYxJulftaBLkb1PQ+l
         tXxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZGQj/1t0bIZtSTVsgiAKTlbApcaLouJAc2GUgkhlbM2fplN4WLjOd/hqA6PwbxOcKAKKiolPveerv4726k44=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoNmP9zVX0aWrG7OJ3OF92+KY2yFHrGW7l4waskMV5Ya6ql17+
	ad6ScO4DJJQxbV9S5b//WgL8s1hF2OppDa/0VgwZU85MhemlF0vGdIs3IfGjYov9aZT86m4XR8W
	Ei7MGyPWPELj8Me4CG9scV/qRk46FaAzHNA+7ahryLyfg/N/EOP3M9aVPRJ2+WejtH98ZcTMQQz
	bh1onYjhxmjb+bYtLXOM9tzz1k6by9wp2uID5DKdzXNYfxi+yyOVnU1pI=
X-Gm-Gg: AR+sD134sWq/Y+OF7lQ0tWMuJXGG+JriAQt9lPNF12/EhJKQa3TLyyAdbRUHAGu759o
	sTWXQ5vUHl1vc/8W2wC/gMC4Z8zLWiSJxU/n6iTkwHfBlU2Z4deiZcJyHs6RpVZMwPjskaNmhde
	PVrI0gEicI/+RuRDg2o8C60axtw7Z7orcBJw1iokFIXTfOVriNi+ys4c+M
X-Received: by 2002:a05:690c:6a85:b0:7fe:1413:f6b7 with SMTP id 00721157ae682-81f993340e2mr37633117b3.48.1785337245089;
        Wed, 29 Jul 2026 08:00:45 -0700 (PDT)
X-Received: by 2002:a05:690c:6a85:b0:7fe:1413:f6b7 with SMTP id
 00721157ae682-81f993340e2mr37631177b3.48.1785337242714; Wed, 29 Jul 2026
 08:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729005959.3853865-1-andrey.grodzovsky@crowdstrike.com> <20260729104114.04298a48@gandalf.local.home>
In-Reply-To: <20260729104114.04298a48@gandalf.local.home>
From: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Date: Wed, 29 Jul 2026 11:00:31 -0400
X-Gm-Features: AUfX_mxePSJcFU2kU3VYl-YapXlBxTsM8pdNfueUNu8RCOjDR26LSYERFFJr5l8
Message-ID: <CAOu3gNgc0XHScgEf+yWF5Kr8sAm8Fsa4RBuwL0YE2EscSiBPrA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 0/3] ftrace, kprobes, bpf: mark
 trampoline/kprobe ftrace_ops permanent
To: Steven Rostedt <rostedt@goodmis.org>
Cc: bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
        andrii@kernel.org, song@kernel.org, jolsa@kernel.org,
        naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org,
        stable@vger.kernel.org, linux-open-source@crowdstrike.com,
        mbenes@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMSBTYWx0ZWRfX5kVDTQxoS4jY
 jo02ZFmvbUWZvCbRn/2BTfofN9T/Um9NKsFhtp6mntRQxLG9VGcqbHd/RNcrl12JDeBf0f9rLXO
 UM2RIbTq8JGvGVC46IREXUGXb1FflG3EZk0gyTSXLfNFjlbzjayR8VG5aSIOza8k5Bix7Wgp1z5
 Q9rmnTYMIJQoEea1pdCjQkVwFT7xFjKzDpqSBrCKqRrcHuPnTF5WYlIdYcyZNnU70D7Xlb/v7c/
 MIOrGIx1SUAjKJ/US0Nl6XAqZDSK00+GUNFP6I+/334yMj/SEqzg4+K1HOJ2P+XZr7H1O95ECf3
 qDbWtYsQuFcTXFbeeXrl+U4hwSZOdUC3XNYk47B+397P9yPl6K0oJ2mWOO3lJsaGcGRaKGKVvFx
 4RambPhGQtfxGg6FWtCxYM5V9MzxOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMSBTYWx0ZWRfXxVu5QgaCoocW
 nxWMzvLyjILxV5yPjqF8aj2AadPqjh/18Txk1TinVHz1X0eESUBkqarvC6l1JLJMsiRC07YvukR
 I5F3evgThTpKQx4aShbZ1r6ev+evUE5QONY/5J1iz8Dvao5g0822
X-Proofpoint-GUID: g72tAm55k61s-kJG8KmaO75i967LddZ1
X-Proofpoint-ORIG-GUID: g72tAm55k61s-kJG8KmaO75i967LddZ1
X-Authority-Analysis: v=2.4 cv=HZwkiCE8 c=1 sm=1 tr=0 ts=6a6a159f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=vDKVRhTs-M86Ea50iKLw:22 a=VwQbUJbxAAAA:8 a=meVymXHHAAAA:8 a=pl6vuDidAAAA:8
 a=FNDBzpQLrQZLHPu8S4MA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11859
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607290121

,

On Wed, Jul 29, 2026 at 10:40=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Tue, 28 Jul 2026 20:59:56 -0400
> Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com> wrote:
>
> > This fixes a long-standing issue: kernel.ftrace_enabled=3D0 silently
> > disables BPF trampolines (fentry/fexit) and ftrace-based
> > kprobes/kretprobes. The write succeeds, the hook stops firing with no
> > error, and re-enabling silently restores it. Livepatch already solved
> > this for itself via FTRACE_OPS_FL_PERMANENT, which refuses to disable
> > ftrace while a permanent ops is registered and refuses to register
> > one while ftrace is disabled[1].
>
> The /proc/sys/kernel/ftrace_enabled was added as a "safety kill switch"
> back when ftrace was first added to the kernel. It's addition was namely
> there because live runtime modification of kernel code was new and we wer=
e
> worried about how stable it could be.
>
> Honestly, I would love to get rid of it as today ftrace has proven to be
> rather stable. But as it is a user space ABI, I'm not sure what will brea=
k
> if we do. I wonder if we just make it a nop, and print a message to dmesg
> saying:
>
>   "ftrace_enabled no longer does anything. Please report if you need it t=
o."
>
> ?

Thanks Steven, if you and/or other community members would approve such
approach I would happily do this instead for a few reasons -

1) Seems like the more correct course of action if idneed this switch
effectively became obsolete in usage instead of piling extra logic to work
around it.

2) As I mentioned in the end of the cover letter, I believe for some cases
such as fsessions/ksessions and multi opts retprobes, this patchset is
not effective and the issue will persist, requiring a more complicated solu=
tion
for them anyway if we want watertight resilience.

If you approve this - I can try what you suggested, this would include
making the
knob a NOP with a message, dropping the FTRACE_OPS_FL_PERMANENT
flag and reverting/cleaning what's possible from the original livepatch pat=
chset
that dealt with this issue [1]

One question is what the correct set of tests to run in such a case
would be to verify
we didn't break anything. For this patchset I ran BPF and livepatch
selftest suites, but
I wonder what else would need to be run.

CC Miroslav for Livepatch.

Thanks,
Andrey

[1] - https://lore.kernel.org/all/20191016113316.13415-1-mbenes@suse.cz/T/#=
u

>
> >
> > For trampolines this restores a historical property: from 2019-2022
> > they shared one global direct_ops, marked permanent the same
> > way[2].It was later lost as a side effect of the 2022
> > per-trampoline-ops split (patch 1's Fixes tag) and never
> > restored.[3][4] Kprobes never carried this protection at all, so
> > for them that is long-standing issue rather than a regression.
> >
> > Patch 1: trampolines. Patch 2: classic kprobes/kretprobes. Patch 3:
> > a selftest covering both directions for all four hook types.
> >
> > P.S
> > I initially implemented a per-record opt-in flag[5], but dropped it
> > as over-engineering once I saw the original blanket restriction.
> >
> > P.P.S
> > Open question: kprobe.multi/kretprobe.multi/kprobe.session
> > (fprobe-backed) aren't covered -- return-capturing fprobes share the
> > function-graph tracer's subops manager with unrelated tracers, so
> > marking it permanent needs a different, per-record approach. Perhaps
> > something along the lines of [5].
>
> Honestly, I would like to start deprecating that kill switch.
>
> For the series:
>
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>
> -- Steve
