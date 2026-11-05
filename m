Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793909827;
	b=QX5Hj9H5sVzczoUH8UiiFh8fG1Zop3bSEW71DoOVIJvwTU1ktDvDgJze0aneS9yhN9dR
	 GbjDGTNHXuAzwVZRMHv/zcbK4DRi2c8yPjndaBFIqjqfOwG36bx5xtWdz4yVJ3Odyo0mJ
	 +qx+DbLRpEP+DlkoNXzDOa+Yr2qPMaQEaup4A8J8jDBMZOKN25Z8D3PTF0Sez10tpd1HX
	 D/G4hEK13RvaSHvLgvpcUEIXcHP5CIwUwt0aD1MfE7aqbDwuImzeppyRQehQNGwX/JDq3
	 IUkdMORyCU+mt8uRKV9cYyub/BLjueKh/Q0H3L1/HFWBS9IOwFaYmLIzEOZoKldfOuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
	b=s9ZDfmIoqY73rDTGj1w73WvRt1XKF+YAUVX/pk5WM1xssMNuov3mq9ZjY0jDk9PorStl
	 H7GBkOKV4wsv35Ei/VJOg8vU3qFfuwPLcz9auubBUkOAMv7/MQX3FZ+a8Dvb/QOtBAi7u
	 H5D3JNnT9NX9UXHOOy3XVZO8S0mUR6JVUJ6YQxVVkGlN38iEkVtki8RDAWnqcxCMxBir9
	 K60NrWbGAxSOMSd9gRr5SsQk86kPJIRBs0hoC/SHx0cH2gUUBwS9V37qMAHZvIltaJe1s
	 WrQWgvX2SliuFf3l8U+hD8M0vOdOfyDo3bG1uEDoUiXKzCESGV4STHaX1kJJSGSHETw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crowdstrike.com;
	spf=pass smtp.mailfrom=crowdstrike.com;
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b="W6zw+k/k";
	dkim=pass header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b="YaQLh6/+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.148.77
Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4E606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 20:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE4E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=W6zw+k/k;
	dkim=pass (2048-bit key, unprotected) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=google header.b=YaQLh6/+
Received: from pps.filterd (m0354651.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5GKpq23184063
	for <linux-kselftest@vger.kernel.org>; Thu, 5 Nov 2026 20:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=; b=W6zw
	+k/k4YX/v09rDfDHhSHoxIruPkCZtWCkkSujL/PN9DDRH3HuoqT851AP1kcOmh/w
	QkHxJFdhng6lJ1K0WQUFNf2Bo7q4RXedv3lg6EgvpEOBkZoUk5Hapmigsc2ZUsdP
	tQ/gGoVTWKJFS2UV6xokQggdjp+Dbin2V18IQ3q2EFEFNV9Tz38aqZFRnQZRFiEM
	5Kv3il4E5uBmkVmr1MtlJVROBri5CIBsAczkPdl8wk2sQeYeY7fdaj5zPswf+Jty
	SiwqVnbMFeNZ93mW3ul7O5N+a4i8yoxfIIc08f6AUrJhRWdNm9hn++ZGkf20BA1d
	Ocb9LL7d0tA5i5H+5Q==
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4hrmsaavw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 20:17:00 +0000 (GMT)
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1e00100eeso3026185a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 12:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793909819; cv=none;
        d=google.com; s=arc-20260327;
        b=bxGY5YVtuTl5rJYkD0k5as9xbXpEwpzxzA2oKMfLblP1XRjwjbNPYEJXz1pY5kFkKL
         QEP14sgTCfi3sXlpxDJStihMzpuzCzHs5r9zUS4zZQ22ug+/h1NCyONXg5lRRHuSi8P6
         9v11bQPe2eR/BtmRfIfdxtlnojnTGH6+s3n9GgbZSxu1tqvfuyP3x6SsjuXwSQNnIUVf
         /xlj51d5z3BXV5Fn3xJjsCLlLRyV+x6+F7KoCAe2FTzcZfch/k74dhSh/No0889aLf1V
         lgVLx4JDzQK/3Aai/1I3DYpzOofBVUrVUZ7Ij1BdkkeeVbyeGY1310kOj81yWmkCD/pc
         ZYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
        fh=q2pHNMVbnSplRRaiZkIvk97UObVi+KpJNTHHEQ5jCxc=;
        b=qMpXDVX6jWLnq2VbGyaFuxEkynX7PVMW24jCj/8lTNnQY77H7FZz9tNQ7tMm8+eEdA
         SPXW3HMp+qYMB7N+RuEfQaGvaiWuvB/x9EdQLpaZ9gC0mcrym+mGFnnCtDr7bjwse3xg
         5i3m47fnqHYTjHZ0oCiK0hoPYHBizMqiM0NaremHP6a4wE90VkJre3eJc/hMYa0j2HxZ
         An0qpDFJFMsmGjXigYKO+uKV0BYCsEbFCgWBnBD9n7OatsGWlZ3EDxBDRWrvKb/+2zKF
         QlbjHTiW3lVVBgnr+1Ky8D7da9+gc8WOqz+pKDNgchedsGcTsq3kPGvnYfQwm7HRzZfp
         /87w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1793909819; x=1794514619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
        b=YaQLh6/+K8sPtKjGPQPOAziPmomRkm6opHGV8g26+gImx/ackxhZZnPiBfm6x5KN1z
         nmrQtA9w+WUeAQDWuQzXoZPYeS+/xFwF5hhqTlpPS0rIPum8aPcrbPIl5Bp+exFzmZgC
         1ar3PYSlhjpv/RsFL9NMgjEqDSE44qoXpTaOf6vbNkdq+Tod/t3EjzdcqaQYvKudQV4J
         Kg34j/2HdqQ/P7EbreavUnSX9QALo3MKiezpY4ZYUJY0gFtxEL5rcpooplcMfuJnrDSA
         S5uh/6GESv5ALq39c30/+La08rTgx48CdAw/8Ymz+DmnFRgHYmhkqhxBZ+KRq3HI2gv+
         A5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909819; x=1794514619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTfu7W1DkYeekq0IooSfHUhC1cbKjXYHdVcAXct22yY=;
        b=GEEmD0XGbIQ0U+PmEk/laBDmbMDOri3w5dTazFkUx5s/w+Kxj+bMkTtJ1ZNJwZ0yH4
         FpGxjvGFMq1FzMdqrmTRDX4NUSHMp4e1YSCCeJ1b0COOBu+BuH8TE6n9MuWuzKi893md
         EBs4OpZ4IOHUrz67gwvRKj1cQDqDT9VUQQvUnCvU4iucBvuYTwggM4+3qYbJRvHia3cF
         6NB7bea+7PlyT+QGckABrTX6PXsVoJiBzqFASW4CT+bVMBg6gkZZhdS+iyMDX/i9lpLw
         Hhe/gri8yJqbSzif97+8rbn9OPCWjznOH63UCPyqgLLLKQ6YI/eGYU/Iax5uEhY9Hx0M
         I6kw==
X-Forwarded-Encrypted: i=1; AKwUvBxZTQVSP3HNWn4HMXAnWtV9LRT3/Uf8LVDOGGvvSvPwd8ZI/8BaxyClvgHnTqD9+WC0PnWokw687sneMzC8Jng=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PZOBSqe6ig1xCSEe4Ox3tUWI+98ovVmF/YC7Z9ediN6O5Mu7a
	MYbkXc+Z1e7Nx2AKvaxkgaPH+mBMNqf9KvLdo6HovWJC/QioppQjjv7NNJZoQDekIlKFaZ+sewY
	UnCoTtUIWxCcttrMs3rhfBQbwnppea+rSoXKkEwyvigFBtBsDWRN8zoroM604R9nUPmwpM4hEEH
	y1sXY+UnjSmnDaRh4NHH6QVZqBkI7BUK2SVxtMiShJLjQh
X-Gm-Gg: AYBFou1r0/On/S/IYEwn9NaVcmZ7xwWQi2e67s8foi7zHGfEiWN+dpQwArRE8nS52JP
	w/fNE0ZeQyhRf0Q6D0piiAo72LnQK3PbNMveJfqdVgX1WuxwK4R9IlrOwaWIXJFT+HwiLxcHMjD
	XgFZvDb64Gc4njDmZyMEAIACNuK/HvSyWOEUQqUApvfRlc4fSa4+bP5Mvj/wwmp/wSNjrlB/78Q
	bB4I2/ZTZIsLlgIuvQgvqljI7vTZMZCdMUSQacaqGw30tpHltXg2hcey/e9TfWuQXqNo39sUR00
	Ew==
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id a640c23a62f3a-c4d35519e9fmr43190466b.27.1793909818820;
        Thu, 05 Nov 2026 12:16:58 -0800 (PST)
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c4d35519e9fmr43187366b.27.1793909818311; Thu, 05 Nov 2026
 12:16:58 -0800 (PST)
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
 <DMN0USP1E59A.34N710IJOO0PJ@gmail.com>
In-Reply-To: <DMN0USP1E59A.34N710IJOO0PJ@gmail.com>
From: Martin Kelly <martin.kelly@crowdstrike.com>
Date: Thu, 5 Nov 2026 12:16:21 -0800
X-Gm-Features: AclHuK8JgYiZJpf7c-VRiUqEK3vIdAU7ZjKP7fLp1Y2VHxGJrDEumK1dGFkMIGM
Message-ID: <CAH=2mMCmmmjq0HEA9xxtFyaupDy++zJmd=aAJeitEHtSmoXxyw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Mike Bazov <mikeba@sentinelone.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfXzWiR0eaQEyu0
 +XKzgwh50tmu875lKdvYWT9zRUEHI7ztRKrGFfur/dnpGqUlH6ydmHRzBpup9YwCkf8NJmcjVBq
 MCiFy4DorGKAGjR268RNP/N1VMeaivuc3jzxIoY+Z0L9TIAMq5tH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX+QXwFc2A3jd8
 A6bsn6dhDBKKXqX6YuSce9za0ksJGx2NiMiSfPLHCpq2O82tpo0M7+4+dfPRCXTs/NyG427EmsR
 yuaXzj38yOZpKmVA8D4DgYnuc/dT+jG4/OiSKwBrW06Gum4ltoMtZWzP1C+JfdZKqHWr/x9s1O5
 l8AqN+55J9MQpmV+4Jdf4kqMHSRQBP9j8XurncxmqP16em3rkSKEXeG4HkKHP6W132qrhdbxOAf
 8OveEFegmZDsN8WObV5CF6WJ8UUI8TfIvs6MY4nOgnZUWfFgSwIoIamKc3UhbQMNr1QIQpjjKzU
 NJdL97tpu1ECKZcDbB5acsJXY7nlHDG0xdjZafmBNBH8GNFvkIZVsY5dhZ9VeYNd4SUwJhCOeWQ
 6NSYCJ9ZoVkTy95hyFLw82ZHWzPRgZ+lSX/W77olna1dj1iVfHmEcTWgc9GcmUC1kZkQi/JmwG7
 gqYo2fsczhN10tufZrQ==
X-Authority-Analysis: v=2.4 cv=D8fSufRj c=1 sm=1 tr=0 ts=6aece43c cx=c_pps
 a=CYpx6mtW7qE8U/l5VCnCPQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=b3B37AjAgz0HnGB3MuNd:22 a=pGLkceISAAAA:8 a=BM2dtbHZsqdhYTBwM7sA:9
 a=QEXdDO2ut3YA:10 a=22KAYETGZJnyhCxlFjxL:22
X-Proofpoint-ORIG-GUID: C71AAroOFpYbjDkoTpqFKxpQI4AnFijp
X-Proofpoint-GUID: C71AAroOFpYbjDkoTpqFKxpQI4AnFijp
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050080

On Wed, Nov 4, 2026 at 9:18=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> what do you mean? the reentrance prevention counter works on PREEMPT_RT t=
oo.
> per-cpu array are not corrupted there.

Sorry, I should have been clearer. The issues we hit were with using a
single per-CPU array across multiple *different* trampoline programs,
not a single program exclusively using a given per-CPU array. The
verifier doesn't prevent this, and we hit it on RT kernels, where
trampolines have always been preemptible. On 7.0+, this issue is likely
now exposed on non-RT kernels too. The per-CPU issue doesn't affect us
since we stopped using per-CPU arrays, but the recursion_misses still
do. Since prog->active is per program, the per-CPU exclusivity only
applied within a single BPF program, not across programs sharing
maps (which is very common).

> Thanks for the numbers.
> Are you saying turning off HRTICK is not an option for your production?

We support many different Linux distros, so we have to work with what
the vendor provides and cannot change CONFIG_ values. Since it's now the
default, it's starting to be used by distros, which is why we're
noticing the issue now. Changing it dynamically is up to the customer,
and if we changed it on their behalf, it could affect their other
workloads. Debugfs is also not always mounted, and it still wouldn't
help with the increased drops on 7.0 kernels, since we have misses there
even with HRTICK off (1 in 61,580 on security_file_permission in the
above data).
