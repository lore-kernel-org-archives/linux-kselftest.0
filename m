Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758873;
	b=dKKzTwOPONCJt6aC6onCUnVW5/56NgrGg4sWqU/2Tm+RuytPGRxauq6ROBZm2gWx1vIG
	 JP0GclZ2Ynjx0IWtTv/qEuY2G7cHaqbofEZzdOb3a9vZigXjQBQiu4WahynciXU1T0P/m
	 cepgq5RKahd8TTDWvBV14JizKI9Kmhg+9sbHVV3lwDq9gW8WZp5LJtXZ4YXlTrFUvsvFc
	 6+xlP83BecYRp6GFYZiiHVo6zwhLNoRErQJztjT9jwTNh89hEQWqZxGjgwYPEWe+FXe5B
	 MUsI8d8sFVGi3PgMLGm4+G1gecCUgeiO5xKQOIpQ/c0na2eWCBPyBzspUezm43nW2TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=3kL9nPKcOeNL1nqkLRFVJC2yAbsuis72ch1sU7/sTFE=;
	b=A1z6x3MBHOxVQH0Ho9VGmEgJ3A9hMddL9C8zw76UglNwfYmdM8Ky0SnvRZjEN0W6lOvj
	 oOk3DATC+/n0pzxQ5BexMwt8hTnbZWjx8vGcy2iLVbjiNzV4hEIKoibcvgptotsK8HJtv
	 KwNg4BE8gCMrD1CWQZ7uZFd7uU0+DfdxFyxPEmbM05sSPtwahaQRmdR3wxD2UZHHRWULl
	 vYfeTVVqVPt5lsEKrueittII9qqIcyv8rYFFES37gF+cZ3k4uFsMGhPz8ZQRvv9ovn3nh
	 g1doK/EF6mACheBAfP3YmcC1PcQEVWsC4Z4HY7pryOsJ4iTF82ga+zv0gPSFZ2w9/6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufKTEGLW;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55947606A329
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 02:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55947606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufKTEGLW
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a07025cce4so129367b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 18:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758873; x=1794363673; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kL9nPKcOeNL1nqkLRFVJC2yAbsuis72ch1sU7/sTFE=;
        b=ufKTEGLWP6UzLiCvOprUKER8FGsbqdunjCzIauuX5gywzqqPVl+M04XmyTRhrXyYRY
         OLHdnvsB2Q3L2/l4WIvSgLWPqGq3jbQBp8VKXEuSKCkxD0svr0yCR4LmWr7yryrJc2bB
         YeBWHIeqqmDfWaK1aYk2NE/L/4cR3rj5zLhms+3FPKYh3/Ja/uvm0m3HxJeF28j0WRDj
         DGp9zVTDFdSq2pixbJ67BHxlrsa3M6as7tc/hgtMq2JeTR3ApTTvZjRj3zCN8OhiobmG
         4Yev4utAiH/WQ44huAkHJDNInnMcXRlSSj98SGnMtvV+DWBAYiyFj1/qP2Mu+J97hzkx
         Jdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758873; x=1794363673;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kL9nPKcOeNL1nqkLRFVJC2yAbsuis72ch1sU7/sTFE=;
        b=AbSTZx/09UK+4I7oiDn2OnCNEAqRi2yk0j/clXZcXG5TGGU9Q0mY9HqrwHbmDoOPqg
         m7bN1BTOMCXinJ737r4F1+gs+K8YORl/BkEHWquZWkr06u9ud2e6wnXxuM5N2ilg/lpF
         bKMB0bUpEdNNnHIvao83EbpXV3p4VtoSMfeHxO+AdYn/BDeL+ccuthc8Tvxtbtbe73Y+
         HF/f7H+sP8uVqxpoaUuJoFVLD/neK5gEYwSEAYE0yrF/uh6/8gR+jUnM2DeIyZpsVsTP
         E/JLgW+0ECsF1AceEKhqesVCInlvkUzlV5cc9NYSMgFZEQHKp1+5/9udnSyNJ5XHSUyr
         H8nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz39EhspKIa3YCirItMvFjabPJGaricPQ5MXrxNc6n9/YcNLIeiEhhDs9CHLqM6mGSX2+0GaUqPOaYahWS+cU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OMqls6t4fUziz0kGInP/X9FDxUppCcGvpEmof67Kb4vHXlEc6
	ohcjK94e9cwgrIaTx4T1cltr2kv9iH1MA0QzDHyBZs8Se0gra58YOfz7
X-Gm-Gg: AYBFou0qH6euKEu4tcvB6SRX60s2suxVQ3u2fltnMRVgRC+jmCTlmYJl4V51QxhyIck
	+J0cfQxreMv9x4k1vfULcnqkmgeSM7due+Ita0ep7ZBBYCNXcmaKE9ooBrC6oT7bBk94PDUmFNK
	SRPZ+GH+EDD8w05SbPjGDew7n6exddNPQNHO3m6qnDL2XOaWluzB0TUIagd2akBEwqytZorQvtZ
	+HQOC9698ijqAXirkOG3iU7QqQbOD2uw1F2rJAH4pVsTcJQHluZt3u69NywnlrdQAuqdw0Q0UVB
	ijIpIfNrkM7bw1EPnhk7G0JsSbQieGRJA+K1AmY1RmaXgbPYuTWPDEutAKakrrWUFggNt6VbBLZ
	L6CMGrmYiFyDNddW3x0b/D9zSoc5cG9tiAno+26rHcf73tAd3Po/5Akw5nUI6BXEkSWHGRZGGmf
	/qPtwy97aIOWSWQLplqGwSPICvg1tqiE2ENBtd7gerA0Ou/4TdTISdY24x3HBCqgQHbuBk1Zlms
	aGX3q+SGaD1X4VKVvgOjby+CryYNuFOlujD96jlTXv108VlKoehlh7YsWMcrnP0pIhNM2lRmism
	Sh0zumQ9113Z87xCcMn5fcnWwnx+Hd4rscJH6hGiArxV5t6JjHWXUufe7YoPBRSkc7aXoEeDrmN
	WXof5WmMMlZ1FDKZK8cXkgH40twVR0expVMU=
X-Received: by 2002:a05:6a00:230b:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a9beb6284emr11317502b3a.27.1793758872638;
        Tue, 03 Nov 2026 18:21:12 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b470b7esm233999b3a.32.2026.11.03.18.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:21:12 -0800 (PST)
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
Date: Wed, 04 Nov 2026 02:21:11 +0000
Message-Id: <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com>
To: "JP Kobryn" <jp.kobryn@linux.dev>, <mikeba@sentinelone.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption cause false
 recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
In-Reply-To: <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>

On Tue Nov 3, 2026 at 11:46 PM UTC, JP Kobryn wrote:
> On 10/30/26 3:22 PM, Alexei Starovoitov wrote:
>> On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba=
.sentinelone.com@kernel.org> wrote:
>>=20
>>> Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
>>> preferred fix for fentry/fexit, or would you prefer a different
>>> mechanism for reconciling preemptible execution with prog->active and
>>> the per-CPU private stack?
>>=20
>> No.
>> We cannot disable preemption, since progs are not short
>> with may_goto they can take 1/4 sec.
>
>
> Seeing this issue as well. This patch opts in ALL non-sleepable programs
> with trampolines. Alexei, would your thoughts be the same if there was
> an opt-in approach, like a libbpf annotation "fentry.nonpreempt", for
> select programs? A patch like this could then check if
> program->nonpreempt is set.

I don't think it's a good idea. Try bpf_preemt_disable(), as I mentioned
in the other reply.
