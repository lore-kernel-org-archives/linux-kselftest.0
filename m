Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924A3A453C
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427223; cv=fail; b=nr3EYnfsev1qFRZvMyez8AiaB3NwrxvNA07E3GAhCCWDiDVOlNu4sQXYsJYllxkSFZdEf1J3sjcam6A9XO6yeKInrvNRbyPhOCIGIkJDUeKU1c481zkfkBMdO6r3dAdiMSeIrxrBgiCvDKLUCC6HbAYF8onbLpVD5CnfCegWg6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427223; c=relaxed/simple;
	bh=PchiZHbJted883YM7Tsx4MCanuIBbvFzBfb6R7sdrLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uc+n3j5Gbv4ABn8Qs1S9btEcbF18zUKuqN6oJI1r6cP+bj2tmHzJHkEcYXmxps1ixww8YcjLrA5MRWMVvMJzZOfoHfmxb9HL8KG4WjykM5NCI4X0mfVGE3/txAXW2VCOPwVRkd/yw6XyZazThuqhxrjqidT98aRz2IUqFo9UeIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=jDY90QfF; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="jDY90QfF"
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 652BuwtT2980759
	for <linux-kselftest@vger.kernel.org>; Tue, 2 Jun 2026 12:06:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=AmdQqVczB19sGPldwgj6uwVjXHVUoAPkK4whM3xvMNM=; b=jDY90QfF/s6g
	fk1kSwdakA2kyRatMGd5fXtiCwXtbKpXtPrggdCmTCU/5xXBhb/ALSCktzJKFzhg
	x59KnhFGSJRROfNHqUx73LpxJLa5z0T2xcwwbZjmCCWkdKxXJTwcR7sopaMSbAhP
	R1eUiexPqWZi9XiS/QR2A0GIfoiXLkfQNRzGG45HeaAV2+yym/NbHznSDRXetfzc
	psTmX7drT0+T8HaK1VX9g/39Qf6zY/VLeKRyOUuq/8UIHPbj9wfauh1YpBkcviZs
	RVTZUscLbU6Pr/z0MVl3NqiD5Bezz1FeFitWXS3roU9WfPtb6lrEmxXKepd8NoKG
	2PwViZfK3w==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by m0089730.ppops.net (PPS) with ESMTPS id 4ehxr4juxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 12:06:59 -0700 (PDT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-bdad545342aso980095566b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 12:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780427218; cv=none;
        d=google.com; s=arc-20240605;
        b=NzPE2goqHNyruFDuKCuJrms9V6E3xl+44ZN3Cx+vOKV7Vma5wGlztAajfU//8L8obm
         uAMHOharJy3PVr/eD2HqCB4+Q1NkmGJQUHsDYGBfAJv3P/0ZbH3EPz8FkGfTLN1s6wPv
         QypAMMKiNUQnTFom6m7dELkukcbxKHpo89u9pLhNTzRuhIpG9IpLNRtp7qwFtvCjpL4p
         utfqDCePNhnI1ctNRXleQsCWgQAA4gf07s3sei9V/r8eK7hIeoanzDaqJGZyKgDk9Xev
         CSXEN17dM2duLU6peFZ4K9TW17NGIG5iX87jWPT9V8gKGyO4YN4q2aUDB1Q3Dcd/doFm
         9RtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=ffyFo/iBrLC5gQgtLpPm5hjGbuSJyPD78waGPloq+jw=;
        fh=JwD/QU/T+KIni7jUNbq5SzgkwFeBrPtlgiCBh9AHeAU=;
        b=fD4cFdPdr4HxQdKsOimB+sQn6WonyJD7xbToDFJ5Pixi1UICod5N5tioKeFGrf8ABj
         iEiwyTRi30Wna31sL6SXvPrcodOAosQhYIRiq4ywUVhbfU41WvZu6ACm/nx9rYlOoG7r
         HkniwtXhmPw/T0W+yWS36Ad6lKyDuJhk2rnycMmVTCmPcdNtCXwFaCcJSztj1AqyTF5J
         FKkGlamVQXmvkHvF0K4B7E2TBDpPBZ1zzr4KZsbedwWlW/lDvi94iUiBPZxdk8civ4ko
         m9PzcyMMF1foDKpIw4XeHUPETg75gKhyTcrX1jRjZRZe5DbRcti0aSfL1j3+j3QW/yGG
         GqYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427218; x=1781032018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ffyFo/iBrLC5gQgtLpPm5hjGbuSJyPD78waGPloq+jw=;
        b=GS7RcENbMQSfRf8xjfbtTlDOy3ZYJp8cYYCu+ZUODa8IproHTMehNu2az82WCFtdRZ
         +/bEvaA21UhM0b5Dk76fCU71Dv91Hgq9y7WDsPqTQ+3vlVHPTp9wiNKNdcZ1GMRGdvlA
         n3J8Oyts2k2xbIQFNlYR775B4FKDzAQwNR6jYrHdAsAxID1XW6IFL0BhcQ9gqWJBRaWL
         KZgh+JK4ZQB9hFgEPnn3/yUUwLjOaIiUE+ctDqXLZpLOQglpOqSeuSHucciJBWS0AvZN
         QqzPFqlS9K0s6iXyVQo3qXX0fDmP4Vjl9/tZplEmR4qXHr22quem1zeqVGD3KFDpYuui
         cHoA==
X-Forwarded-Encrypted: i=1; AFNElJ9O9Q7WmCSxNwY4V/aKbyyxPVqBe+VCSmCfXtBPis66KqN2eJYSkJjrIRzNj1dgt34ZEpNb2HSpfdrlahRBLqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwY1qvls+/JoqtoHuPj+8B/bN+HxZQr7bz95gC7MAQM9ea7vZZ
	qwGbxsKqfgRZ3/Rd+eibvnjC238KcDWrjEj3UT9raCfpD6cFDN+1Ja/21SdB2tpVWgBrHCM30SB
	BIElkU9v83xBUPYVVJ34SCOELc6V063o9nb9Ol2ArpKZUTmdvLvicgLG53iw4cqxZFdjp6OykRn
	NtIk1Hdm0W3Z4q4jxipoB+f0yOmy9yFvQ/PFOqutbgiA==
X-Gm-Gg: Acq92OFlMnYFo8cSdxSfFktMbM3zNhPoIMJB2HrgumIrlsWs5lbcstjWOikK3u60/tO
	WLN2NFEStirciGWW9gJtH/TxQ4jw8VWwm43AN9rhPMjA2sysuVy8D0UZBZjSVj+cHthZqv3nihW
	bh9Vtkc4l1XUaMEF+55gSNUosVnI6r67WMrn79XibnnpKoD7ErZPb9ZR0s9bWqwxuKuJDLFsre2
	v6OozxlwJVX0rs7WQ==
X-Received: by 2002:a17:907:fd8b:b0:bd4:7bed:512a with SMTP id a640c23a62f3a-bf061812fd5mr57148766b.30.1780427218300;
        Tue, 02 Jun 2026 12:06:58 -0700 (PDT)
X-Received: by 2002:a17:907:fd8b:b0:bd4:7bed:512a with SMTP id
 a640c23a62f3a-bf061812fd5mr57145066b.30.1780427217854; Tue, 02 Jun 2026
 12:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602181428.2318919-3-ntspring@meta.com> <8ac88be59633fbdf71337c80ecad1a268a989440e8865df3ef6906d33bbf0837@mail.kernel.org>
In-Reply-To: <8ac88be59633fbdf71337c80ecad1a268a989440e8865df3ef6906d33bbf0837@mail.kernel.org>
From: Neil Spring <ntspring@meta.com>
Date: Tue, 2 Jun 2026 12:06:31 -0700
X-Gm-Features: AVHnY4I9E97vtJNAItNoiDOxUpsvUBDTWw2Z8iM1jvir4KetPOYHnRI2Ix4qyAE
Message-ID: <CAGy2EQajXgkqBbYtwCF9qXquHOP7mkLR8MQ+gg-cDjKw+z51KA@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] selftests: net: add local ECMP rehash test
To: bot+bpf-ci@kernel.org
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
        kuniyu@google.com, davem@davemloft.net, kuba@kernel.org,
        dsahern@kernel.org, pabeni@redhat.com, horms@kernel.org,
        shuah@kernel.org, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
        martin.lau@linux.dev, daniel@iogearbox.net, ast@kernel.org,
        andrii@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
        yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 78WkMBl6dbbdn7KnwgOGLtxxhAN5O-c5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE4NSBTYWx0ZWRfX3lUIVG9pmFUY
 9Qn9oNkWpxmx+ciO0wDFu+4kjcdgO+rSXO2ETdY1habAPTUcRyiXQQB8MDUY8I0GQzL8AcUAuhK
 65Ajjzfrft00yrdeoLax6LSAdivlQwX81cyXhQVq0WdWI2QnqPeis/avFXjhBKzM+sqCaQIRG5J
 B9nvRgo11hQp3rnS4klO7QbQmAP7QRbmgcL2BJ6gOhOJpfd2YA3BXozncIudzrtSla8WN7ALMoW
 xhPdniq6wOBaP6jaExSksqaEtTwyGBN+l9mxGTQ0jXDnmB2DqIawEWw7gtbOQh9vNY/FVY5oTzl
 ZKdtHpu2TSsnlHDySiApHajkK2wO2l0v6Spg44tRsZPSz7GYkMcXrKiEE3mCMCqi1zanmB301qB
 TJabACvAIcX9BQ0c3+YJJILBGDZZWKikHEy1IOlQ5G8xv4yMAOlc9cNWzb/leVGe1Y353SD+wMu
 MkC/PXNFpla+kFKzhoQ==
X-Authority-Analysis: v=2.4 cv=dsbrzVg4 c=1 sm=1 tr=0 ts=6a1f29d3 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=855S8uPTkML1Oy45N9_h:22 a=VwQbUJbxAAAA:8 a=iFABrAoMAAAA:20 a=NEAV23lmAAAA:8
 a=2M8aKpgkrPwFO8N7dvUA:9 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 78WkMBl6dbbdn7KnwgOGLtxxhAN5O-c5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_03,2026-05-28_03,2025-10-01_01

On Tue, Jun 2, 2026 at 11:43=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> >
> > diff --git a/tools/testing/selftests/net/ecmp_rehash.sh b/tools/testing=
/selftests/net/ecmp_rehash.sh
> > new file mode 100755
> > index 000000000000..ffaacf1d9513
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/ecmp_rehash.sh
> > @@ -0,0 +1,1066 @@
>
> [ ... ]
>
> > +tc_filter_pkt_count()
> > +{
> > +     local ns=3D$1; shift
> > +     local dev=3D$1; shift
> > +
> > +     ip netns exec "$ns" tc -s filter show dev "$dev" parent 1: 2>/dev=
/null |
> > +             awk '/Sent .* pkt/ {
> > +                     for (i=3D1; i<=3DNF; i++)
> > +                             if ($i =3D=3D "pkt") { print $(i-1); exit=
 }
> > +             }'
> > +}
>
> These per-device tc filter counters match all TCP IPv6 traffic on the
> device, with no isolation by port.
>
> [ ... ]
>
> > +test_ecmp_syncookie_path_consistency()
> > +{
>
> [ ... ]
>
> > +     for r in $(seq 1 "$ECMP_REBUILD_ROUNDS"); do
> > +             local port=3D$((PORT + 3 * ECMP_REBUILD_ROUNDS + r))
> > +
> > +             ip netns exec "$NS2" socat -u \
> > +                     "TCP6-LISTEN:$port,bind=3D[fd00:ff::2],reuseaddr"=
 \
> > +                     - >/dev/null &
> > +             local server_pid=3D$!
> > +
> > +             wait_local_port_listen "$NS2" "$port" tcp
> > +
> > +             local srv_base0 srv_base1
> > +             srv_base0=3D$(tc_filter_pkt_count "$NS2" veth0b)
> > +             srv_base1=3D$(tc_filter_pkt_count "$NS2" veth1b)
>
> The baseline is snapshotted here, after the new listener starts, which
> handles leakage that arrives before this point.
>
> [ ... ]
>
> > +             local srv_tcp0 srv_tcp1
> > +             srv_tcp0=3D$(tc_filter_pkt_count "$NS2" veth0b)
> > +             srv_tcp1=3D$(tc_filter_pkt_count "$NS2" veth1b)
> > +             local srv_delta0=3D$(( ${srv_tcp0:-0} - ${srv_base0:-0} ))
> > +             local srv_delta1=3D$(( ${srv_tcp1:-0} - ${srv_base1:-0} ))
> > +
> > +             if [ "$srv_delta0" -gt 0 ] && [ "$srv_delta1" -gt 0 ]; th=
en
> > +                     path_splits=3D$((path_splits + 1))
> > +             fi
> > +
> > +             kill "$client_pid" 2>/dev/null
> > +             wait "$client_pid" 2>/dev/null
> > +             kill "$server_pid" 2>/dev/null
> > +             wait "$server_pid" 2>/dev/null
> > +     done
>
> The client and server from each round are killed at the end of the
> round, but the loop moves straight on to the next round.
>
> Can asynchronous teardown traffic (FIN/RST/ACK) from the killed client
> or server of a previous round still be in flight after srv_base0 and
> srv_base1 are snapshotted for the next round?  Since the counters match
> all TCP IPv6 traffic on the device rather than the current round's port,
> would a late teardown packet on one path plus the new round's traffic on
> the other path increment both srv_delta0 and srv_delta1, satisfying the
> srv_delta0 > 0 && srv_delta1 > 0 check and recording a spurious split?
>
> Would a short quiescence wait or filtering the tc counters by the
> current round's port make this check more robust against late packets?

Yes, thanks; fixed locally and will appear in v12.  Each round now waits fo=
r all
active TCP sockets on the port to close before proceeding to the next round,
preventing late FIN/RST packets from polluting the next round's tc
filter baseline.

> > +     if [ "$path_splits" -gt 0 ]; then
> > +             check_err 1 "$path_splits/$ECMP_REBUILD_ROUNDS had split =
server path"
> > +     fi
>
> The same pattern appears in ecmp_dst_rebuild_loop(), which also relies
> on these global per-device counters across rounds.

This was less of an issue since ecmp_dst_rebuild_loop had a threshold number
of packets that a stray connection termination packet would not reach, but =
the
same wait doesn't hurt.

> This was raised by an automated review on an earlier version
> (v9, https://lore.kernel.org/r/20260530004914.C05121F00898@smtp.kernel.or=
g )
> and the counter structure is unchanged in the current version.  It
> affects test reliability rather than kernel correctness.

Apologies, my error.

-neil

>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/268394=
85409
