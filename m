Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A8372B58
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632328; cv=pass; b=kuZBFs7NEfxxwg8lvd8qJwTSVOTffgIsWHB4YSQ0g2Kh8dlkhfUSvnGrfqAGiCcfwtrtdGMxVXZZrLBppIuoBlx2arfRkjSrtwTBZIr2wWm+IRDBaF+PDMu8xKmT3Rzu3wLgq9t55NLiVePrQ544dcE8bOptCkTSznbbf8yvS58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632328; c=relaxed/simple;
	bh=808hQIDw8HXuF8zg34i2s1I0VMLdN4AzGhcnwG8lblQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yl2QZZTzk0/WFG9nnpJssFPRZa8V3SPfHWI1S2z/50SA9dpEPhWkwRaPBLKAOMB2FPxJTkunpD3xsDuiTdbd5h9fEKifKhrr/MLrcr8Qu8kBN/Tti4BFGeh3blaT4ZyYfLfu/RZBiUstaIpmMLGx6JSSqZElr5Vz7BZpVziiTjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUTgv8V3; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUTgv8V3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432755545fcso204515f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 12:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769632325; cv=none;
        d=google.com; s=arc-20240605;
        b=XgMcZlBUNqpKvWIFoHsug8e8fbSNVX2OqXJH7D4RQ68/+85pTN9lLnFkgszWgFNfIj
         XkH+NPH5U1lOHgvJUjGSxq115EffKsGo8lR7fypK1yHbbrmfMUNdo7LSSZyctVbu0kb8
         pwXSQq+Q2uEqMZAZ40cJ4Y4MUD5J8FCNp7n0epjIVIBgNj8+kd24cKhdyMZa9oKtGLi2
         ZWr/TOoAHuUWzbAV9v0KZeXtN9e+t62WUdKxivVq+CkumZ9XeQ3OFSfuYIj9tasZ3dCk
         mNPRxditkrmLwmPv+semYGJGc1FzK9l+O+8CYfkQ1yUJWOdR0u+qCh42/js7JOXWtv0d
         z7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=07rf/uTuwqt/mx7z+xU8g3Kvog0c3ZDUc5m6W+iA6DE=;
        fh=suWSd6+br7+OSC/REf7WSyVI+dogu6wuHYeYJJ7NmPU=;
        b=lsZ7Rn2R7o3NPfUjC/dejSwznfkCAfm4C27pHEujYL2c1rlYn5XuaBZSnTuoIiqAfa
         ncopdSfhQyP3Uw4pDG6xyArhTW7vwYsgXzsw4IAZWrA3DzTBJxtmABf5vtFVCfednJJH
         4jdboRelvpI9i/9kFZqW0ehPRnP6RQsKmqnRuzRebHh5hiag9nwvLy0jYMsHM4w37D+2
         5ODQMU790Mfsc2Mxtzul9c4bIdxd4PxovSJq/1onz4tYBYcjEKC/2SceZjQMrMfzNGmc
         IjUp7RXWfII4XvGDEDBGnzqCuedqIpnkyiXU0aM3qi7txMz8aYfqNqr9+c9uo8zyutK9
         IrZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632325; x=1770237125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07rf/uTuwqt/mx7z+xU8g3Kvog0c3ZDUc5m6W+iA6DE=;
        b=MUTgv8V3qcslf2OJAwqMbqAa5Wc0GJYvnYwhfsYuSMreQAuFL1wkJElStmcg6+JqWW
         ZjJbhceLwllEP89QvD2JTFcvQyh0H1kNEp8dMUnZBouQoYkGac2l9RV1eyNOBQYWMRUw
         8V8mfsk6A7KTkN1dULpd0cnzMAF6M7xNkm+8nywZdBXlqfCsShOWCJym70VPz7EliIwA
         rYxEJNvGt2tlyrM+KIzQHLdVZ3wsZtRQI9nI8qVLhiWENd1tFlPHZ77Re6/jMWYjTzlc
         i65MrWoWBhvlHqNhsE6Fup6vgaQO4IU1eB1a8L7KPg6nxWtdMnEA3JnnjcRMoe30h/BT
         /0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632325; x=1770237125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07rf/uTuwqt/mx7z+xU8g3Kvog0c3ZDUc5m6W+iA6DE=;
        b=FmxD7sEeiWdlcL2UK4jeq6aCSe8MOipCEbGSdJV/Ex8bS1xkeisjVMfYRf0ZtTbH1j
         J1cE/n7TqgWB1N+nNerYubz9Ix3evPUZgPPzBRQ822xG/gC7Z3fMIevDMpy7ZYp8V1JA
         AjJvsYqLsN0yr0Xjo1LDsqHJ8Ig2iq+Q0FNBdzHUszNFcEa9yiTfAFdSwSZ5t9ycj134
         nOglNuIvzvj4R9YjgDHDjbGCjrWTyp+UdPUAZPTL1xg3vBdm7oRlCj/LC9uCLB6OMrJa
         JHMd2nnLaGZo/Vx8vvgikvWHHHWKPrAJGuYUvA8ZZqN+NQYQtpHZh2czHgqw6Lp0HzMC
         AdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsH/yFIxZN9Qe3ALLmUoS6iqEhBD5NSNbv0f0zpe3e+n+ReOT8N7YDhRyzS/TcL3bIinTl9UofbLzUE2XcxwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGR9q22NQYqfktxZ6t+/EPgnEMvDK/yEpYH2oNO1XbiT/O1Sth
	O5oOG1C0NEeLfSUxJQ3K+DE1q3Ag4oyAPGArzrvuwQxF48WILiN4J7uTG+dHW7DdW/1RraTKXDb
	ek09n6U4AK7iFlDcAKxUOADLygoLVOeA=
X-Gm-Gg: AZuq6aI5B6yv6nwJA8MuSRRQYUvP8oShTbnJD2a9aR2RYsX72FJjeMa/RdIThHhk96n
	Afa//ey6ZTlH+BD4m26q5MrZmjLPvNOVfoJZs7WROlIL7h+GpThSHbzAGisvQnm/kksmAamVIC1
	b40fxObeLqVUpn1MbJRvdxS4QRthavSBeUugdpAvCRQHG4WacP6yFU+oJonyKBCZiT85p7b3aTr
	gn9k6LWBRL9gZWdyLH3zqIQD5AjmM1Wq0QS1IuEBXGqwexR+5N1vs8qzzxD4gPXlh5XId5ySOwC
	NXxTfY2buEJGIYvSxmNj/jfNBGXa+sMOmnVCa2ZSpe0WcNzj5KaA+MyFuZC6fHcPAAyyjZcarYE
	FwNZeYftvfZTdKA==
X-Received: by 2002:a05:6000:2404:b0:435:9653:e154 with SMTP id
 ffacd0b85a97d-435dd074b2bmr9812358f8f.27.1769632325304; Wed, 28 Jan 2026
 12:32:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128150112.8873-2-leon.hwang@linux.dev> <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
 <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com> <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
 <CAADnVQJV=e2VgQzkpsUQwexhaVZMs7uXHCe1Fa6VwbVNUMPghA@mail.gmail.com> <7dbcc5d5-476b-46e5-9e4b-b260d24a51a1@linux.dev>
In-Reply-To: <7dbcc5d5-476b-46e5-9e4b-b260d24a51a1@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 28 Jan 2026 12:31:54 -0800
X-Gm-Features: AZwV_QieHaFto3G-1e8bEUtCESnVn4_ZZwARjehTdXUH1XxE0kv7X3Eh3iZgKp8
Message-ID: <CAADnVQKdZo4Qm0z-qedkfQHZhq+tW4MuRSzM5-zAGYX-ZQTiaQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Chris Mason <clm@meta.com>, bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com, 
	Martin KaFai Lau <martin.lau@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 11:09=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux=
.dev> wrote:
>
> On 1/28/26 10:49 AM, Alexei Starovoitov wrote:
> > On Wed, Jan 28, 2026 at 9:34=E2=80=AFAM Ihor Solodrai <ihor.solodrai@li=
nux.dev> wrote:
> >>
> >> On 1/28/26 7:35 AM, Chris Mason wrote:
> >>>
> >>>
> >>> On 1/28/26 10:26 AM, bot+bpf-ci@kernel.org wrote:
> >>>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_com=
p.c
> >>>>> index 5a075e06cf..070ba80e39 100644
> >>>>> --- a/arch/x86/net/bpf_jit_comp.c
> >>>>> +++ b/arch/x86/net/bpf_jit_comp.c
> >>>>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
> >>>>>  {
> >>>>>     return true;
> >>>>>  }
> >>>>> +
> >>>>> +bool bpf_jit_supports_fsession(void)
> >>>>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>> This is the actual function name in the code.
> >>>
> >>> Ihor, I think the script parsing review-inline.txt chopped off the
> >>> part of the review where AI was complaining about the commit message?
> >>
> >> This is the email body pre-processing in KPD, yes.
> >>
> >> At some point we decided to remove the commit message before sending
> >> an email, but now that AI reviews the messages too, I think we should
> >> just send the generated review-inline.txt as is.
> >>
> >> Alexei, wdyt?
> >
> > I think KPD is only supposed to trim the header until 'diff ..' line.
> > In this case there is no 'diff', so I'm not sure why it trimmed so much=
.
>
> There is. Here is the PR comment with the review:
> https://github.com/kernel-patches/bpf/pull/10868#issuecomment-3811930805
>
> KPD trimmed everything before the first "> diff" occurrence, as expected.
>
> I'll try to fix this up in KPD. We should probably search for the first
> line starting with "> " (a quote start) to trim the header correctly.
>
> Alternatively, AI can be prompted to avoid generating the header in
> review-inline.txt, but that's probably less reliable. And maybe it is
> useful for local runs, idk.

I see. let's then strip the first 4 lines ?
(commit, author, subj) ?

tbh this one was unusual. If it repeats then yeah '> diff' is a wrong marke=
r.
