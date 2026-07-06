Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E5C407576
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328136; cv=none; b=kgVmOwDs0sCmns9vmrSQmkUswD7IKdknXDZvh0vN+ypBRIkSjBZPemCidYP7sZTVL2gqhe/urxo0NMFo6FzaHe1vge7kFEm44KILZjIsGdT7dNgGvGSYFW5LOWxToxxTBKlg7XAMDEHuQ+u9uOeXzaVkjOYA31BBkdaH5/aBsRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328136; c=relaxed/simple;
	bh=bpYuhahQxSh9LrOGKBTOyfmIRDnue+zLmdcwJtnlxQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSOD2Wd/t25MAcp5LqCjh03CS+bZLZV6OkwqXw3Af3+TsWQbgVm0xI3x3w2S2rbCl2Cln9AVwN7MIBrcOSXgESHm481I5i53HGnsmOjhNqDD/uqtaoMkIQgvM8u63+2ZlyWF1V+cDKKYcxh1BMKhjiA7KRVXRThgw5bLE7RnwQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffC0JBXm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffC0JBXm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8482074a000so241197b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783328130; x=1783932930; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3v+HDjcgZfmVu7uYp2p3M9sp3YfufYRorQ2bJY9UiY=;
        b=ffC0JBXmIMjuoiRWf+Skv4TgFQmmvfAkrrRJ7543e4VH0ZpzWA8l/tpOP6dkcdNPIx
         JJAYKGSzJvl49lXJgeabBJN5d7hUuSnBMuqQF3YpiRxdSfooCs+UeNrZ3Vvbwj3jAdKW
         3nfj1D9HmrR8QqLCHEudnDBCxKYozMp9C2Wvz8wrRAWgAKtxdLENyEDLyUpxIikb/LEY
         ma/p5ckGNljBcfIbh/hD3DVbLpIUCT9Lhr/xm9c/Bq7+/A2oQb+OyChJzdCAIXk8GM2E
         x8cWuQFQE66z95QNsXXqhifx3hHAGgcRmbs8V0XWXycGmZhfA6qwZ+0BBJELCFYa9K5o
         TJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328130; x=1783932930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3v+HDjcgZfmVu7uYp2p3M9sp3YfufYRorQ2bJY9UiY=;
        b=B+CUCN0zBfKNxDIbkq/kxr0gW3MC98/garlHZoOzSjOBkg3TrIuQPEbI/S/AiS31wK
         T1Jdk12QAah+tyevqbFWP+bxZAqQMb36R1i9LdgU+sLz0dIax6deMfbVj55+dm8eTYLx
         +gaOhOvGzjoYgrjDdHEcXnbV8Fwk0lmb7YpDkKQUVMdT9Ai8AXFzX/s8dTymMiU2wXty
         GwjUOVp8vwG4jeAmTit+IU89P3emc/r9DJBOHZfHODE0ufHhkCYvD725qfBkxTVP+/iL
         udduLsWJX258ky88RG9hgTEFFwlguNe8ZJHiDYVh1Mqv7EQo0KUYUwBO///2FsSGH7Vb
         eqxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3KI8YWHDk67TX7Jpa6Tj1UYi67gyj7DMmAGl4gteBHzCnMZLyyacvA/VAQxqzXhqp0ewcwMjHYPt6NEGx6lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRuNw99dmpRceatCVjD8x+la9MIEn+1EgpVJz8WlVNmE8ERrL
	iU95ZGGniYaqrCanoCvGiRLLmvOfVBle2z6UqemZ6XHo97hHB7vNIit8
X-Gm-Gg: AfdE7cmG9B0jXtOqREj4Xxxh+GsqoR/5+8jxmqWJR+ccJ8vgi3NHA5zV2VhzeqdQdlY
	nJ7Km9lO5AhzP87Fm09bNKaVhxyAm3WZ2baqwAGU4qMnT5bHo9oNtW2x8uaxN4dNigTlKOK28NK
	M6KUWS1COUATYFXRF3zmT+N+q2KHVvoaRg3GJoaLPyU7rzduPlOtTf7Xd79Hgb1xptdM0FCz/Pw
	tJC5ToQNN6CqLwV5s+2bDLjA/oJBVXcua68krkup5gVIiMC5Rsp8Vaw8bS3SzyWYeFLUbT2mNA8
	Dxk9hhM+J2a9t7nPwmPTHFMZa1R8Bozlpcd4n82lsOaw/TvZ//D2bDz+GQSsFc6uOOoInMlueWj
	H/1xL1AozZannIL8SU9AGb9DPGzqrCioOYp+iu1FOotZD2X7OtNsGVUia0rFpzSkat7HIMIJdWU
	N1kMCYZwAZXWkFR2UO0chTs00bSylq1PpGQOj5os9bh19XwImR/ogHchiLrg==
X-Received: by 2002:a05:6a21:32a3:b0:3b4:b24e:27b4 with SMTP id adf61e73a8af0-3c03e1ff0b4mr11851439637.1.1783328130255;
        Mon, 06 Jul 2026 01:55:30 -0700 (PDT)
Received: from computer ([2405:201:d015:d26b:41c5:151e:6e02:36c7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm79992955c88.9.2026.07.06.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:55:29 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:25:19 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, pulehui@huawei.com,
	alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	puranjay@kernel.org, shuah@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 3/3] riscv, bpf: Remove BPF exceptions from
 BPF CI denylist
Message-ID: <akttdwZOqvgj4h39@computer>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
 <20260628081710.113333-4-varunrmallya@gmail.com>
 <878q7yy28o.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878q7yy28o.fsf@all.your.base.are.belong.to.us>

On Sun, Jun 28, 2026 at 11:00:07AM -0700, Björn Töpel wrote:
> Varun R Mallya <varunrmallya@gmail.com> writes:
> 
> > This patch removes BPF exceptions from riscv64 denylist on
> > BPF selftests since support for exceptions has been added now.
> >
> > Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> > Reviewed-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >  tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
> > index 4fc4dfdde293..9268351ce4c1 100644
> > --- a/tools/testing/selftests/bpf/DENYLIST.riscv64
> > +++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
> > @@ -1,3 +1,2 @@
> >  # riscv64 deny list for BPF CI and local vmtest
> > -exceptions					# JIT does not support exceptions
> 
> Hmm, reading your cover the kselftest run still says "#113
> exceptions:FAIL", so from a CI perspective this is not much help. ;-)
> Can we restructure/split so that we're not bitten by the lack of
> BPF-to-BPF calls and tail calls?

Yeah, that was pretty foolish of me. My next version won't include a
denylist change, but if [1] lands, then we won't have to
worry about this anymore!

[1]: https://lore.kernel.org/bpf/bf647816-d292-419c-b79f-fc048122aebc@huaweicloud.com

> 
> Thanks,
> Björn
