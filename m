Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.152.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793913105;
	b=PPn5j3nKETH3pPEJySAA5Hl3vfGTlNpBC08wW6Ky4Czhe4cpr9dotYoyP7e5eAkK5AEK
	 1R+Bm5+BmCTvOphdJ3rXRPid+JtncL+wsXNK9YyycKhYd7WaLt+IzuxuHUVH7un8IKy7r
	 hnnUiS2uPBHgEXd3nzUGL4BwYlNeUgzmKL28siOGhWxWdocmq1rJqDlCo6o3d/P0jncn+
	 tSAq1Km7gH5svT9L52dxNvAUUw4/JsQglij7RdyqBjCx1iTWrYRUU03HFLpSPX/8UkOXk
	 w1zM9MWPV9PC5gmuDgZGDIyqxcslRzZJCLUNXsOu/nTGe7qLPNGGQA5TbKg7FKaBIFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
	b=Nyt/cYBjDkz6CuqHOt34e7Gyf7MWeJGgT+IZMViAzbgHh5HbP4oVjoPpCNuaKmUUHT5E
	 fIFiMYou1XNL9kYgBxZbAwR8cnlgTliuqnQAOF4WV9bh/HXYUmCEXZijRhyhNqySMWLOB
	 CFltKzWw64Yh73oAtnfPCFRfFXDBQY0zQWbYBhp26+g9RaDoNHWu847mosb72QRWWBcii
	 659RJZKOTTzn5RUe4Dmq7+FUaqlRDr7XstamycNRmACm9JKeByodWPAtsZyVh4AdV+kpL
	 cx18xzQhXEyaKSrZsuyKkG3EOCsft9laNYOyJpFH8vLbfqLohbA2nLA+sDeYuaCA3KQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crowdstrike.com;
	spf=pass smtp.mailfrom=crowdstrike.com;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=wmuSZD6G;
	dkim=temperror header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b="Hcmb/f/k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.152.16
Received: from mx0b-00206402.pphosted.com (mx0b-00206402.pphosted.com [148.163.152.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323F606A329
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 21:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3323F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=wmuSZD6G;
	dkim=temperror header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=Hcmb/f/k
Received: from pps.filterd (m0354655.ppops.net [127.0.0.1])
	by mx0b-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5KM5mF2435081
	for <linux-kselftest@vger.kernel.org>; Thu, 5 Nov 2026 21:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=; b=wmuS
	ZD6GJgOLyd9o3FxMzCIWfh/isB98pMHOKECgcbilgrNptojIzJa88Fntl8SAKgBy
	7H79EMg9VJaA8qHLYrLktT7RCTByV8pDfGTKiub9g+96E+cR3LhnVWwWtaMOXVZ6
	7UgFDRhReTbkLqFj/8XW8fxIRABa+UaMuGN56w1C79bYx5kFgRGh+nYFWQVp2FgH
	ygNNq46gKOBD/j551zQah9c0c9TS1dd15Azgo0wkSkZWhldBzpZqjoYy5A/F+aq8
	J0b5ydWnNlsXQ162gJ4TqSbwkjsDEX/rLVq3bXP8972y1Fud0LiG+WqWAa0W8QiH
	yGFX5zUlNeJVcqIotQ==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0b-00206402.pphosted.com (PPS) with ESMTPS id 4hrm99b1nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 21:11:31 +0000 (GMT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c41e4057335so100143066b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 13:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793913091; cv=none;
        d=google.com; s=arc-20260327;
        b=YGMBfP122XziUMhXIXxuqYzTbFp0r67hErjJfSaB9ULZSam40GtCxRbBos2FtRCYIW
         5GxG6SKMTZZwyq/oT8AWDcKrSeMHofBJlH6PbNXDZPumRWBkUnvUMD6g27zDErhwHqsY
         kQw2hv9BRhUUfjXHY39pGLX6rr+uEyD2xhFy+qRTBm1xMeV45IMT9aoX0C7vr8aBbxcN
         iNdlwktU5coZg3yC9GDPWVSIoJPJo1xIGDsL8yA0gpkUL+3ptpfmYKH6M4YfxEE0UcTC
         uDcNgFFzlw/87GSq7C3cWDXSdKolmIMelv/OzuZ2eUuvsj/LyMW5nP/eeikSdBWoW8VX
         814Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
        fh=ZqiRIaS+ltMbVSHe+5l3vY2XoLsdNqKKpWAv6sV0iFA=;
        b=Rc3X2Fz9beic9dVt1Kv7BiIPhoibGic2mgRTxiFuVr6evNCLR4iqnc809U5ZXSRrQf
         JtRDupdqYH+80unKr+4wJ1FWX3fJukstbnHADaDXPP0i8EaIx3nWoUHIzpr1K1NZZerl
         RvWd56R8VLuqBqtUodjodi7Qm4SjOXsgE+Zhb7GHAZqEv1riqpWXBiYav0xdFV/OfqnE
         38+Y4O4xPnpvRMpKHcAI8FKJ6qtxEBI8n+X/izUIUg7TUQpMLyfbnPzK9vk2XL4BxJQM
         5mS3GODAAqrEQnO2rRW9VAxBnP+FB1OF2pLkO8QXiXD4PMBuMF+eVUgIYFmFsd0FkP2W
         DLrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1793913091; x=1794517891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
        b=Hcmb/f/kif60JRaO89pC7K6vrAeZqaS9XXmio+c77pBbfy/RTNPa01K8I0mh8oPYI0
         L9c5Gp6aWYIZ7YA75PPrMLB0CGqMgUb2rSEjOM/Xu9NG1/ToVA4LISRUWLQ8siwn8Ow4
         Rn9wzEG3cHERVPD4VdaurcO2x0DptX7aUq7uvZ6pv6UyV4j943KXnMdtlnqOhn1329hg
         7f39RpyZT2LBhhmb6IcA+zfyvmhHwJPTgJF88sEWMja93e+mi8hvMk9EZVtTU5qB3QN4
         Ck59u+gSJ1BzJpjB66yshJe7g8WVh9U6X0daHf/Mmx2fXqS+0CjIhtVH9m30P8mPMIn7
         Rmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913091; x=1794517891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww/Ky12z8kY0m7ktU2CqeMinUpnlKKPyaD44um6v3bw=;
        b=r7crLrCAxw3eVuRobY0JRGx+e+1I5SLDJI38UNmcIWWEyHQ+C/sqYC7JE5FEQVSayq
         /zecRFGGleWMni1+9j7Dmqh95eQruABNTCMKH6rAaH5n7LTrUX/TRzgDkZ3lmZ5ti3Mm
         qScR5SVqTn2G5AmpjNDZ6ZwpRJagmmFfSGKM7+xXhlpCTRM+RPxae2I3hqqeTWQUKZR9
         msNoyPyh1uwaUR+6ORRXEpNwpWFt7aKt0v90d/j1vN2bQlayt0teaSnOj5+E+yZdSsiS
         ReJuLpZFqRErxoCfLEsNVBGdRWiqM/HteJba1r6I/RUYHqHjb1WXs1AiYlU9Ym/tD6bw
         2nvA==
X-Forwarded-Encrypted: i=1; AKwUvByOubxAx/TaLgsLpDZ0BWU9nOEQeqSOTM340LBo9AFCLP8K5qp2foGmzkK5noBjn+6BEz2pG6k3HfPvJ8iNdVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rtSSHjYYDupNobWZ0s5pWxSsI8aiZmOhkV/8KvOItMiodxuna
	w0kWiUI55VEyRm0Q5z3combLRqJe7vEEBfTGmRNY4A1dtSVCgoKxJ4ry+ZVdLG1nkdC9Tvzy+9z
	GisOnYpPCoH45iR2xTB9Erx3OMDiFoQF21XVLfGVh45ISmRmLxAcyN7GcgeWVzANy/5G/7nLA2k
	YVmIEo2mbZvNG+9XtQlk4tPlsXFokFjMi3gyibhOvqTohw
X-Gm-Gg: AYBFou2jsySUUYmmlw2Lxk30dTup78Y4BgFgGidoEUINI6D2C2KpGvUxRW/EaeHrkiu
	g3bv1rWNarbwDDcNDRs8sBd2mcz0lE3RWMFE4f7WuOJGXcRALcWKNjncJXBLSXbpTpettBQWmB1
	IWj/o+gvryHUlzLcH1JuJ94jMsBSDRALmyeowsdIkbBrweB4jTih1BWbnMB1w2juYzSHmDKYIRo
	YfxTv+TRBeDhUHAAD7ip6IrVhjck5L41s4VDfQme/ZTeOvm/AwgjhQ9HlnlKGQZDnFqqbunt2BT
	qw==
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id a640c23a62f3a-c4d35519e9fmr51347466b.27.1793913090713;
        Thu, 05 Nov 2026 13:11:30 -0800 (PST)
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c4d35519e9fmr51345666b.27.1793913090205; Thu, 05 Nov 2026
 13:11:30 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
In-Reply-To: <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
From: Martin Kelly <martin.kelly@crowdstrike.com>
Date: Thu, 5 Nov 2026 13:10:53 -0800
X-Gm-Features: AclHuK80YOzI2BQNU2ehKijMeyWHkLC1DDyHgXW5LfR8ObnEvZ5A2mjJk9W6SIw
Message-ID: <CAH=2mMD-N+JXZR3eeXf3cOf4snnjkAHjRditS1o1Fb_oxNQEdg@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Mike Bazov <mikeba@sentinelone.com>, JP Kobryn <jp.kobryn@linux.dev>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfXz8k4niWhifGm
 s0UlFwn32I5bn/PwawFQqDBMXnvE12W10MUnqJ1n1Y7g1sHXuUxpd0sbxDVq9RtLSNCMmAhRxxF
 OeRI2eLqaktUobQbxXV41IRCCvBEm5MHjNmfNOxTrMt2FnlHCWcUtmz71qI0PBzrhhOa70UECZn
 ht0SAzz3lieWDCo6nfWIAPWOt8lJJ5N2WJE8lsu6pLLIVDTr1YvNLyI5tWmRcGOP+UhRljDdJpj
 Zs/D9GdBq9qk4FB+cG5bqDZA3+jP4/CtLKIOSttcx7xgZLVDynECZtVgB0ce09S3+5Kxwbu5RVV
 7i49oHHkTejJtCwJWjrdAiSnM+RnDsWjGhRB0QrXmYpYktkPILz94RHC/QFBVmKA6PRvSoBsuWt
 sN6lYN2MROVe4AyqvMMGDyD37Er+6kYtqXQlstuXRKWLsL0HWndiltsFgv2TQ18o/TTnn23Ao8V
 gnVqtd6ZAm89J4tBpYw==
X-Proofpoint-GUID: lTaXp709Dnv4SMx8_4mLTFZhGGcq--T-
X-Proofpoint-ORIG-GUID: lTaXp709Dnv4SMx8_4mLTFZhGGcq--T-
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6aecf103 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=vDKVRhTs-M86Ea50iKLw:22 a=pGLkceISAAAA:8 a=FZbjhw69-ufqTzFgkyEA:9
 a=QEXdDO2ut3YA:10 a=PsfoTyiJ_72bb7xyA04f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX9k88XvNrVBSX
 7i0BsD8f5npHYmkeSn9OjxloBV5doj9ioaimPm3Qr/b4lGFgAIYLbh59IX+g2uUidqBIMRbMNqB
 dwxmtqKLxR35taN7Yz6tF+VJ5Wf60rBv8Fg4s6LTqHVXuIZbni79
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050084

On Wed, Nov 4, 2026 at 9:21=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> >      run_cnt 38040015, recursion_misses 4063
>
> hmm. you really cannot tolerate that small drop? it's tracing at the end.

We realize tracing programs don't have a full guarantee, but prior to
7.0 and HRTICK, they were still reliable in many practical cases. It's
less about the absolute rate and more that the same workload had a
~35-300x increased drop rate (depending on hook) in one release, and
that behavior is now the default. Since the long-term direction of the
kernel is for more preemption, the recursion_misses issue looks like it
will keep getting worse until we can move away from per-CPU BPF
recursion counters.

> Also it needs to be per-task + per-prog. How will it look like?

We're going to look into options for per-task + per-prog tracking and
let you know how it goes.

Thanks,
Martin
