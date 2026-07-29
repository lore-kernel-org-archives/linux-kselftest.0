Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9AD3CB2D7
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.148.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785354554; cv=pass; b=J8zR+M2KKFFvPs4/Nau6vmdB2VX+9blMWBfVndr4ypNvFBVg41/Wz6ayRWBYiDdafbDtsk8bkKTxKknWYBcCqfdKlt9FkvbTBiZzbFg4xUrvMCIyPCw1YQSKIA8cfoQF24STVJidggVs6bKUNZJgaQ45cNPB/5Par1zq5FMMg/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785354554; c=relaxed/simple;
	bh=0WW8IB1JX2f94+iPoUzoqfdlDsRGZQ88EgPOwCAJ8y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoGYFU1uAAAUZWWenD/cpJmGFVCNfeeAXEWIWOF58OfpJdNrZM/amDQGrAcx1Tk2eViJlYU76chblIg2w2yPhliX2sZOhtg8EqR3VIETEvGzPrBgLOoZxbqsMud+TkBURPK8jfew8k2fHbL5VdBRBgRyIwH7rMYk0LG9KhzqL38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; spf=pass smtp.mailfrom=crowdstrike.com; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=YK0H0xb1; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=Ct0t1uRA; arc=pass smtp.client-ip=148.163.148.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="YK0H0xb1";
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="Ct0t1uRA"
Received: from pps.filterd (m0354652.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJWCw53107653
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 19:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=0WW8IB1JX2f94+iPoUzoqfdlDsRGZQ88EgPOwCAJ8y0=; b=YK0H
	0xb1DPm9nCDpxbGpqgnswy4YgJeR3BrnGFAshAoVEcGsbUZp76B7dTTDLlwA336H
	r8R+amugj/dUWLx/0DXqETIwgtKrrZZ95h0j6q0abz3sZT5caDP7KVALCpee2Qr4
	uhEyVr0pc2Wvcjp9RwjNzzcGqe38ZcD/nEW+P7UiNNaxvP0Z5mDdGnhfwLu7hXc/
	NvpzLBpd5Wkrtl6Q33yxS4lpBjPRr+yvYUWHtfQpzAWJl0E2rviGI0PwFuO5AslD
	Z5O+3Zhr6qXNG24in8/OTW5yH/CzrvoePvA/wzI3D94//uPKj/wgga7iias7Zxr/
	effjiovKfg3ZLmTuVQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4fq6mcv9xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 19:49:03 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e92ddc199so28694467b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785354542; cv=none;
        d=google.com; s=arc-20260327;
        b=it4jbJR1E0AIFOeEIjTQZhKPvoE7+aBjn3oeQPpzTZ7S2DtHrcKm0WWu/2kmmUnnFT
         zwEUjYuC1iaObs/7aF8CAvKmPQmyiekSo7QiYRUKcPIqweglqcn+fFHlxF/FWyPMCb3e
         XoBblm5nAXbTV8n21pC4MdYBsFhqY5tcZFAG1eU9ym7IFhb3t8+aEoHdtQVFgzlJyLga
         zvZXDuHqEffrpusK9rKxRhshM1vq77eKNqcxdTQMNMA2AYszAgqXx3qlzm8sOz7VXsHQ
         OShN2jrQfKNEE/UZxuwNHDljN89/aCjR+3PbhFntkZiqUFwa95sDnShrbDPPYgngtr8J
         YT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0WW8IB1JX2f94+iPoUzoqfdlDsRGZQ88EgPOwCAJ8y0=;
        fh=mfzpxbDNyqm95RQ3Ua/VVDTb9H22rR58Isjk87gngyg=;
        b=C4g09dCdV1YXCtTFuvC+Nvr1JGESSM09eRH8dhH9WyvjmDIEExDbBNSOGGtKHY3TzQ
         LsfgrAQX3weYeeSdvjQsL/0D9jezRsQWHJMUqLS2Q3QzfrvYnmx06FBQZ+I4Rw9ZEIJp
         IJy4gRXEzwKHwhdKu5jLBRSYFzMX+Jzyr6hLcdGIT0X5Ez0q6r4Zu5mJ31SZnlRl1SYm
         gIopytYPcW7IMExkViZWPvgk4e8ZJJEfu5A+zLdVMNYKEFtQqq1EXyTPTPvFmXzzaWaI
         Jn0kgkYALXCkFm8AnbnG/7Jtzz+1SNne/70BzAEpddfLe4Yr8tAiR1kGN9ibbF1ANthQ
         DLBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1785354542; x=1785959342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0WW8IB1JX2f94+iPoUzoqfdlDsRGZQ88EgPOwCAJ8y0=;
        b=Ct0t1uRAKmNEO6pU2WZjuhEiLI6pnLsHrBXITu9Y3sLBMtCqAKrLBKserQ1xNGkp3H
         qgEE1s8+hL89s8d8/Cwrdn/tVvwD2Dmd0/lAy54ADr7VSWlOQz6l1+dp7vJGPiXk7kly
         5nKFRfVqHmi5JBIn0BOTs5QnPf8usuSlD248mYEoCDgQXrRIHpOGu62+xOk2/Vjnt2U0
         f9AHmkGsflOWZfV8FlfY4v4ROwWPVUJXrlnKYYsavAnNSjs27J2rSAqjs7l3hql4QC48
         Q7UwkRq44+bu69v2Q/QX1aVCq2c9bMD9x7rhUacD7dKH+NTZOASip+2FLwmYiCILt+ti
         fJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785354542; x=1785959342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WW8IB1JX2f94+iPoUzoqfdlDsRGZQ88EgPOwCAJ8y0=;
        b=OkJ9BTTGifo+KzCgQvyZvzZ5LfnIZLaqTvNBN4yMiSUDFeSF2vzGrYqpyolNvFlL/O
         BDTv5VGurIw1YcowjDHBBd/RdIBSpimC6k3F7042ZPjvzHPIet0gqKhEX5Xh0AyjcdT+
         21ktJxYdJ73HXeW0inhCiINdo9rmHFUb5GJhhLn9hbwm9wKofoREk98rKBv2eXsODUFY
         okYdnmE/ssx5wcuXEsLHuQVxQXkb/biZ+tts+lnZE1t8kA8H4v1HCq676OC2akIQf4eY
         Pag0KciHgXHq5do2sjKeNKXdVnUdH5hQeR+ZR/y+FQyGzDA/G4/vqcbU9A+161Fj8sbw
         CWgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRo2nATRjb+/2mz1US6sw43rcgvpbfciSYpJ2BwMaEgQU3lmkZT/PFHRbLfBsOW5wBMwLFyb3Hqj7DBOVnjho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHWRGdGkic8natJM3Jq3cjVC+sAXGg2AtHmi17DgLPnhFbl3k
	4ua15j/XprZB5XkKqZRiLMc1+nGdZGZikICYIwrAutazQoGPk7M4TqZCcBsI/vUp9J63r4NFAPV
	Sw6/UojttWLmjU9gbrvuQeSIM2GimTyKL72WCNgBrdUo96BjadQDg5kcRIYL/MdmEQZMT8oNRFP
	xa0U5+JVv7mxMCsvTNYLdLpsUnJ6rQ/NZxML6dee3v5Nlt
X-Gm-Gg: AR+sD13LNllB/yXlI4c7w+FeDWz3zLLhHwh0ChrnvU7QGsAoqvJ6z/8B+LkWB7ts2wm
	N+DPIAw1tWayTedJj8bTozxkeKwMV7vWBNwToNWtilWJ4Cobmn0d34yZdJZ49kyGER/9uOlskeo
	XIULLnx2KL26ZrBmiLkWw8jiaaTLaIATu0xoYwbwbn706dvkPYvX+dcq2k
X-Received: by 2002:a05:690c:4d84:b0:81e:d91c:29af with SMTP id 00721157ae682-81fb5e5db0emr1654857b3.70.1785354542426;
        Wed, 29 Jul 2026 12:49:02 -0700 (PDT)
X-Received: by 2002:a05:690c:4d84:b0:81e:d91c:29af with SMTP id
 00721157ae682-81fb5e5db0emr1654567b3.70.1785354541887; Wed, 29 Jul 2026
 12:49:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729005959.3853865-1-andrey.grodzovsky@crowdstrike.com>
 <20260729104114.04298a48@gandalf.local.home> <CAOu3gNgc0XHScgEf+yWF5Kr8sAm8Fsa4RBuwL0YE2EscSiBPrA@mail.gmail.com>
 <20260729113136.32af2a4d@gandalf.local.home> <CAHk-=wjzHTuomhTegkD69veDVRxprX8NB=i7A+BEB2-v6v5n+g@mail.gmail.com>
 <20260729133232.1e6c79eb@gandalf.local.home> <CAOu3gNg6kNYp-Sc9Eme6yW7Nu7wV6hZ9=CG0eptROfhQ-H8nFA@mail.gmail.com>
 <20260729154541.0099cb14@gandalf.local.home>
In-Reply-To: <20260729154541.0099cb14@gandalf.local.home>
From: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Date: Wed, 29 Jul 2026 15:48:50 -0400
X-Gm-Features: AUfX_mwF7DC0oGaTu80DDaK_FjjbvMjtCRB7Zz3uBteLMCWzuxKcaF0VD4WX16M
Message-ID: <CAOu3gNj=Ev+gW82_K1LFhjDWrmJ5CXGU26P6Mb8kEZrbGaMdqQ@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 0/3] ftrace, kprobes, bpf: mark
 trampoline/kprobe ftrace_ops permanent
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        song@kernel.org, jolsa@kernel.org, naveen@kernel.org,
        davem@davemloft.net, mhiramat@kernel.org, stable@vger.kernel.org,
        linux-open-source@crowdstrike.com, mbenes@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MiBTYWx0ZWRfX9eWjDda2jGvS
 caPj3gmOxhWuSFS24bPEnSsUbUXXHl6IdebZw1Q3Wgk0FVca1MWbOXRpwLNOMSznGVcUkq7v9u5
 WAxP/XE7j0MIl82iDTI7+eFI6XHBhkvlspc0hbqFdF+pou5M+NAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MiBTYWx0ZWRfX5A6J4Z3ujSlR
 Kezs3N361xl77ZL+CTSn7Cgq4ZJ66hpI3xBCQNhkWZe0OXVYeyi4Vi647psDLb4cJgF9avn8gNy
 Lj28WiiVPLj2xat53sLhbE9b85EJaPH3myck3k+e5ectxIIwLLGCDuAZEhKOw/GJoyUuRp8qI2Q
 46t8XYpaok5uXCt3mRqlZj/WbnoIkkwh93F5yFK+CbyGB1bs1sCVcTVVfsKUERzwAcn8az8EhfY
 cfAqNQbYkBRsn4PdYQiRvI2ZRvCo4do4IXaC1z5J7UcDWQLtYLnVuDvPbCW7qHKeOqSjYDRtVOo
 +LHfCjyoFx9V1oyopbHKr3UkWw8/8yOamZ1Q6/V/04oDwvfb98rr7TF4OOE4rn2pW77LjGLdaZH
 hMznP3ayo4k9+/R2krJWnHu+sZQt6MoTgmansUsSc/WL4QlDeJ9P8G3FQ/VfR1ShvbOd57htG/c
 EkpX5OTsE9OwlEUFX8A==
X-Proofpoint-GUID: 6JEDYmhhryZugoy3uZfRDZVkPi0hGQiT
X-Authority-Analysis: v=2.4 cv=UOPt2ify c=1 sm=1 tr=0 ts=6a6a592f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=2KvRFfd_T_-xjmS8C1aD:22 a=meVymXHHAAAA:8 a=pl6vuDidAAAA:8
 a=jHs7IjXvhldTIRZNGaAA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-ORIG-GUID: 6JEDYmhhryZugoy3uZfRDZVkPi0hGQiT
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11859
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290152

On Wed, Jul 29, 2026 at 3:45=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Wed, 29 Jul 2026 14:20:17 -0400
> Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com> wrote:
>
> > Should I also clean up the entire PERMANENT flag logic we now have and
> > drop the flag itself?
>
> No, because we may need it in the unlikely case that we need to revert th=
e
> disabling of ftrace_enabled code.
>
> After so many years, we can drop that flag if nobody complains.
>
> -- Steve

Got you.
Will do.

Andrey
