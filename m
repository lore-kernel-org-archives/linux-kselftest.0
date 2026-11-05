Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793911482;
	b=LuzN+3aTcQjE2IhKimHQfMNdC5jhZBKvlQy+9pAUOHo4RfaiMHyNdx3UlPENCsGYUcnC
	 dqgpySgYczs/7ZeqAkkCSf09ChhR3VNVg9sqr76GxEH4NMWqXCQHStRfDahiSeifQNP5C
	 wPtyyh2Sq6KqtQCUK64f1j9KcKBL7bKJKF3s5IJvmwXOpVbRQuP6LoUA5Q/ftyRuZN4ri
	 azaHvYvLLVNMajhncbI7MSx+/ManPXgCtTcL6Ar3B8gKsE611OAy4dxImO2WpoZ516oke
	 NlFMtxqgE3lB9AqFYnxSeWsmUg3038fzvZWWHQAG4nUBh0G+RQ5aVzUu0BC87BnZ/TA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
	b=4dxUsMHnSHhlcVZspd3Xq1nMRX+m3hmrZvBZWT4U5+RvCaODvV6KJnSsqeCE89lRx7PO
	 TY4uFnwdAk9+mS3FHH7Lt9LAryjdqT355Y8NRchXMLRUn+egc8L3ajj+8ZW2pwIsmspdi
	 XJ0rB2NWefpAYX80zlg0EOl+TgTzoLLxsGhrlH8q9O0bgoaKMcKnYIkX8ORuv2dlwPg5F
	 THgghS8u4Heraw/y49qr3YbFqVFXXzYHfIBxQ1fGle8cyjRc4UydJe1j10jPXDcLD5Fqg
	 VjPz6mFUysZ2uCbLqMsJQ5mmQbRwez3sxXo47noDaW39pZ8QjI3fUp16nowUgz28OUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crowdstrike.com;
	spf=pass smtp.mailfrom=crowdstrike.com;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=BJ6Vc4Bn;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=BG038r1d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84F606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 20:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB84F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=BJ6Vc4Bn;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=BG038r1d
Received: from pps.filterd (m0354650.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5KLHaB4124521
	for <linux-kselftest@vger.kernel.org>; Thu, 5 Nov 2026 20:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=; b=BJ6V
	c4BntNkjkkda/UZwOgHQybgHbKBTf70duMytHISYD8fZlPFOC7pQ3KtB2H49YY2j
	fA/Xq2vBz9pOEeGea+zUbDowvp595UQSG6MbSz2v/xM17+TQvdbo7pBRazaUJiJF
	xbhLrxm25HQLAewoZEMRYxNz7Ir9g9dh1kKNDAImZI5bBoTGwpAnxLMwyvdr7hM0
	Y1LqB5zisPwRkA1q0WkIIIgb6NSy/ZceUacOrW9yP8GnRvUoY95AedCtDVsnsjPJ
	1sZFqgFcxfwGr+44douE2DzuTzn0AR1M2BMzjUmmXhjrjrFI9rT0YRzd3VJ0jmdf
	JuXa6lwJwR+pJymZ5A==
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4hrdhfm75m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 20:44:40 +0000 (GMT)
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c293e604f0eso71456966b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 12:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793911479; cv=none;
        d=google.com; s=arc-20260327;
        b=RfXbEmNtyk8Wx0funBPrV/bN4RWCto6N+ByO9wqPKTQVAtF+pz1aEHrZIvzj6NzVYT
         UplSQCkUHlsA4rqoEN+1nHMCWzDKHR7YzuwgYs1dxr5bKB2PuqLGwY8ul/qNXhHJG3Dk
         tRrvkwvGNO2zRG9RaTWiYhlruqgjyo+nu+SJwbJawBsYhBBg5Ij6/IjUKybpMskAvlwB
         idpy3c3bGcGq2ahwOBCcq3yb8BDPc+fGXE4EuyvllDisYYxiIk/DzZV8UxKQnMNs6Qre
         Mc031jJ0M6tw44tUHj5oaqDifwwhxPosWWsvqDJ2zEgiqxx8I1fo1htt3m3e2JaPgfrk
         +wKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
        fh=1UT0HF1vNP431tsSXaCFT2TjoGtrpggdCK4V3mZtf9w=;
        b=lZpvqCgOg0hpQ077GobbA2fqE2x35qmOOeZZLrslfMq6b2yhhY2DtCGrF7YW1t2kgH
         NU/nViQDzDLdLGrtaR4R6iFSgoZT0KHuT6DCBShaK8kSq+eA8EAEm9KpEkoMLFgMI+41
         EYKlp5LfOhn/Y8sWhhrjXyKCLrpFw229osNBLl8Q9cUoNXBSZGQqLc6NbAkxtvoMUC08
         DfcrcK+SWDkfUiNLfyedIXFoXTFQVuV51kvwRwbWYNq9QeDruxH4R+AdLPrj525mLsy/
         yWe6B7EchzJcU5MDWIrfDRGMomP5yeUeOdMLqjV8CKJRtU5BHcPnXdMUzmpz4JvBrVw3
         IFxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1793911479; x=1794516279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
        b=BG038r1dKbdbDwE9apXSFD1bmbsBgKa2kmPasGPXI569Vpb38f6s379Sd2whmzKLC3
         uALKWgsbCrDc7BwSbrY/4efKL8b1XwtzfUktWNGinx/dH5z3uDEm5g5iEdkWxDgaXILe
         rjhEj4QpHqA8mFDhLsr9h/RYrxo5ra17zCxxX1p8jrYMAyjoa+Z0Y1VKpTww2Ku0QCN4
         HMaWLL+0E+IaIJfoHGEaH8Q9KTIVrgKxXGt+4mY8/qEa8pZkFWiLFtx+sL+d+g6xwkU/
         UCTVr3pNl9inYrdCO8Oza+rFEzs54SLnuhzHhLSFKJufNeyA2WLENvLzRcmMvnYnw18K
         wFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911479; x=1794516279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao5vTyt0f88nNNdXkQb9TlB4+Hnk+6IPL5xnEoHdaVM=;
        b=xk7gdYU0rI9A426iraomefWpRcLvXYMGUIkS17ZWjAz89ePVkP/uAiT2/ygA/GL78Z
         ZOUlLnXWIX23nMTZz+M9ZSt+fSJTil7VU9PQV2yRj2mctkTay4kZDiH5U4lcpRAtWOmM
         vZV5VSoIz6XzBF5lthzG+zum/4ermumO+cFw2oHFxhZBW8RZSWnyZtlROI3X7h0kl7bi
         FwJa+fBtY7Vkod47YDh3iKnH1oEISdUcL7ZsZRxZfahRUUCOmRGidjG49k6YK37O3rwC
         YWaZXsM0TmyH7YG3oGkYhNhQmP9ugoeWtDmsQx4IlI+8DEO+QPrl0sYzromgKkGZwntO
         oMbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHKJNlvRzGVhriWLy71TA1f1aygIUaRdCNWFTQuulY95DRfjOOsVz4Xsopr8+ChvAnHmIM7SP2HduT11IGTWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8juya6wk2LgIlVk2eqx7Jte9teHz+YiHF1WlVX4rSMi81wP2BR
	/JhGZCAZAcgiZkKJe3I+zf+7IRvHKC82cj2y3z4zJ1hwRCQvmZYWZtPEtq7SYH4bUPA7KtobfWT
	R7SlrQ8LL5BNMVcuJtdtkcHa/9cYtYMA2T/jteBgGgs98prsohV2pB9Euv1p46vmiD7oL02sji9
	QiFKE4+wt1uRmix/HcOVl34iKZLC0Iu2QCixlYpGR3j0JoBC+Jzz7y0o/T5Q==
X-Gm-Gg: AYBFou3KZ/N/DrihgreKF+g4xjcLPTUipCB05W5medFLO4oGFuuIF0WXqBuLv31EJQe
	EZN4/cROr196iB2iU5UwsLkmzhbD3Jh9GwfVUBLf6AF/MuYy1/akGyp21dG9gYMUyNCQ8P/Syjg
	tTnP0hVX+Rx0t8OWffGwsK+RwRQ9ngLhK4w8HhchT3kibHWY0X2UNO/wTU0EgiDXXTsRgVvuBDk
	pwrJObKqmM0Nqxqek7FHowpIrz3+GV6mXxBksssJkLxJAaTiBpdUc6KAP6wDJSCH2+GqYyB9biz
	XA==
X-Received: by 2002:a17:907:3d4b:b0:c46:645f:ced7 with SMTP id a640c23a62f3a-c4d3550b4e7mr52050366b.39.1793911478958;
        Thu, 05 Nov 2026 12:44:38 -0800 (PST)
X-Received: by 2002:a17:907:3d4b:b0:c46:645f:ced7 with SMTP id
 a640c23a62f3a-c4d3550b4e7mr52049066b.39.1793911478527; Thu, 05 Nov 2026
 12:44:38 -0800 (PST)
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
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
 <DML75890DWIX.EYB690LPBM1O@gmail.com> <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
 <DMM2FJ2SNYYO.24TEJ05OOR08E@gmail.com> <CAH=2mMABxvf+GNr7vUKNkGvyU-gmaXKMGNJHg4URUCW_eyuxGg@mail.gmail.com>
 <20261105122604.GB1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261105122604.GB1779021@noisy.programming.kicks-ass.net>
From: Martin Kelly <martin.kelly@crowdstrike.com>
Date: Thu, 5 Nov 2026 12:44:01 -0800
X-Gm-Features: AclHuK-QbtNDfOwcT6C7zf6IVXI9cH4b0FGauUAGbW7YvuxTYSfVQ8tmszmGMLk
Message-ID: <CAH=2mMBDMjex_oGm3Fj7F2P=kxgh79n7w4+hW7b1UsCCfx8V+w@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Mike Bazov <mikeba@sentinelone.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
        Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX/vphOhqfyc6k
 1C9ZqkAKURkSKWbq82MS3ILy2NegIJU0cxIqcIqJF9deHznhPb79HgGbAKGIv7ddW7PAHN6CBCT
 2i7I2lTiZVpg1DhIFQNm27p3Q8oF9W32Xpi+iZgjPtGpSg3kgnnboOlTJL41AVaexZVpjcvN2iM
 jFqosFxUqC5JlsP5wRd8cpT/3v/lq1IX/Vp/WYn/eM2qQPxvoEAIXtPZmyZ/p1wCW847mBTViih
 zPeGStlmhy2vHVulrARQMi0dvELZOz0K+jQrZa1/KtIO16a1CopaP+lNue/Wtnqq4DGSlABU/CU
 dUYPjcivCzviqk4qgAcPrEM4tkPUpnmiqdF2aMYihjJUe2FRq6eZOY74rsPnrGlRbz8r21cgYTk
 VglAyFuiD8oOmOfrmWBvUf+OZpHDtNvMOoFIkyEXrEgNFL77KQ2yUm9fJS8C8nb6HvDqajqcJ9t
 sOKOrAE303SHBA1WSjQ==
X-Proofpoint-ORIG-GUID: bkpYfkimjjcVKPNwNsY4LFpIk2z7xsMI
X-Authority-Analysis: v=2.4 cv=L/6I0OT8 c=1 sm=1 tr=0 ts=6aeceab8 cx=c_pps
 a=edIAN7ErZTGbxav20d8A7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=t04HzT_fAfAF5W-3wVZy:22 a=JfrnYn6hAAAA:8 a=3KWSPp3VrHgpKBhhfMwA:9
 a=QEXdDO2ut3YA:10 a=nIuFr-8touD1a-RngYHT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX6kHxgYDei7Fs
 m8CBHOWVUxJ8dndV/ksHg/OnwU56/dS+OcVp9SPBKiPltlkBCDT4LN1X1b6lrF9B4OE7MCSkD/l
 tnYSpeQKQWE7V+QSHzsmGmaJeJGHFropsqTeipNwRkq/BjoW6zKb
X-Proofpoint-GUID: bkpYfkimjjcVKPNwNsY4LFpIk2z7xsMI
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

On Thu, Nov 5, 2026 at 4:26=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
> This seems weird; your task-B bpf prog would never run due to the
> prog_active thing.

Sorry, I misspoke a bit. The issue we hit was a per-CPU array shared
across different programs. Since prog->active is per program, this
wasn't safe once programs were preempted.

> You've not mentioned your CONFIG_HZ setting? Anyway, something daft like
> the below would make promotion less aggressive (also, clearly I couldn't
> come up with a decent name for the intermediate step :-).

The 7.1.5 system we tested had the below settings. The 7.0.9 system was
the same other than CONFIG_HRTIMER_REARM_DEFERRED.
CONFIG_HRTIMER_REARM_DEFERRED=3Dy
CONFIG_PREEMPT_LAZY=3Dy
CONFIG_PREEMPT_DYNAMIC=3Dy
CONFIG_PREEMPT_RCU=3Dy
CONFIG_HZ_1000=3Dy
CONFIG_HZ=3D1000
CONFIG_SCHED_HRTICK=3Dy

The 7.1.5 system also had these:
$ cat /sys/kernel/debug/sched/preempt
full (lazy)
$ grep -oE '(NO_)?HRTICK(_DL)?' /sys/kernel/debug/sched/features
HRTICK
HRTICK_DL

> I would strongly prefer all BPF programs that attach to known
> preemptible sites to use a per-task recursion counter or something of
> that sort.

I agree; it seems to me with per-task + per-prog tracking, we could have
arbitrary preemption without recursion_misses. The question is how to
implement this efficiently.

> ---
> diff --git a/include/asm-generic/thread_info_tif.h b/include/asm-generic/=
thread_info_tif.h
[...]

We will test this with and without HRTICK on and let you know what it
does to the miss rates.

Thanks,
Martin
