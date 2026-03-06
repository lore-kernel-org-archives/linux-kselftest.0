Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5913A7F69
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 18:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772821667; cv=none; b=PwfOmAl2wGZnyUmmkZKrLpkxmybvptIXf7BtoKqJfnp32eqplY0KLuMRotTTBnzSAEO1pco9Ia93mFq+O9MP3I2DpbFx/IZl2bxkL4NWlWWsl4H/FLu+UFe3BR1ka3o0W7/w8avAaPX0idNvAC4+/QpIa07jts1UZLcVIdpxP84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772821667; c=relaxed/simple;
	bh=C0FpvF+Eai8YIFcFjlslWeL22N9NQEVFyXAeA99g07Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEW+VoNDHW9TO74dwuCuQwxXkaP5YtgEXm7WkiAUuCcf/paMpM0uXMVsvBWF3jTS3cIeEgqBHYXWxwkgReTQmPjXWu7SevHnd66asWX55SWiuhD984HKvW12/rboMpMdXUnaRjTF4Qs+5FSvAbZGWYTrtgkUCtx9pAGd/XuumOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aY+ApmNy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aY+ApmNy"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9434f706a2so88822366b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 10:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772821664; x=1773426464; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w5lHZOXkujkn3ph72tYgDlAYNUE4LM5JcTk02pGHeUU=;
        b=aY+ApmNyKm9xvh/ldm/7CX4G0uheBAr9ytnYa1gFUVWsrOJWQzUxcMl0pm5CawzKrf
         ZcVyz4LhdFLC5HxVJiMDzaissd07gjJrC6Qg+9gjUNPli7JGPdQV+FHOXBcDyQ8k1cOL
         35roxOUBQ8CZ18hWHiK0pXwK3N05rRQz/eD8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772821664; x=1773426464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5lHZOXkujkn3ph72tYgDlAYNUE4LM5JcTk02pGHeUU=;
        b=DlPcs0SNmj5AN+aE3FkJLGp/SEqaC+qGkWO/aND+sZ22y2tErgaOMmiWS3H8hMIWCn
         IdAjrk2PbGXqdvC8NLaYIWqwgHe0ezsdidJYCBqgKiCbRjbT+prZpNAB2IuDspcNPEV5
         V84tDqa0rdaejyq5eFNXEaZqGSmJVmJ47S1VBYH4OWKQx7pSsHD4rap2SeipPPEC3sO+
         1VuI/cs7VXhz8DhIodP2meD8egh15KgqW7gxbyB5kIuCh/aFkfqD2Oz5EuYk7OhuPH1F
         uJEfuhUgBxyX6RV3X47qjnQNZ/O9CQDN/2kcz/p/fzuljFi8y2++imvWJ+Jlvkx42Ug7
         3lmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW52VTBVKXY9xFmRcDV1YFjwMc3quZaCGBVBA887ejysg9J79nOA+VXMTM8HiPqBRoAJpH8gNQGLcojxDj9VMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ld0FzPaE1g86+Bk9wV6kNx/zOrvsGzXixZ0U7ZwCtT8AlUa9
	on6zqC1555Gc1c9qLDF7C2bMee3BXbMaLlU6mTJY7PbXwkue4uSU0MtiElixvvWFcaiPJWEthVD
	rUFCWg08=
X-Gm-Gg: ATEYQzwc25X2Ens8aX0Eh9glnHPS8VtOCsMZq0gE+DEl5UWmZZoNOXm2Yzwg2VZ4wnb
	m4nP+JTYfVU6yRrg1OryxK4d4Iw/uJ++PsrvAJhRVi4g+YdwY9YXcBm4gxhDCKQPhtM5i0poygt
	FO9uVdxtHwXpOKQqTOv2fhKNda5082bK757O9kemKPt1dZQ7U4sgBuIHPPzAjmTUwFDeAqQRzPa
	KbOjpMu7o6dTTrX+nINI0yBUJ66EbIecEHSP3No9sWY63t1dL74Aey6jxdxhgIlBtLAEapx7Oq1
	4GZmkYGN5gIur8HTUd/O5P/zbvzo8NB6N2veZxUtJuPcRnXtbEU6JktBtl8KwoBck4kb5nx9xVd
	2j/znuGztLl+4AWSJ5V51sbIs8rvg+eUhDoee75NEyNS4zFDzCMUnxv16TaiBUqj1vLaEfI0FdT
	k+j0ONUKCwvlmnVABAE9pMeAw3bL1yFZQXmcGeAkOLi1rejpovTQqGQnXQFgHPbft8XTIWHguQ
X-Received: by 2002:a17:906:6a0b:b0:b8f:b194:e5b6 with SMTP id a640c23a62f3a-b942dbafaa2mr181315766b.2.1772821664368;
        Fri, 06 Mar 2026 10:27:44 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8cc27sm75802666b.28.2026.03.06.10.27.43
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:27:43 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so4471511a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 10:27:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWE8L07Dp0+lHw7W2OgjCsrunqkSLzEQxenZbo9r6vNFdJvyW1sRXsIx8DRahUsNNLT3X6t6koYhDrsTmjK7Bk=@vger.kernel.org
X-Received: by 2002:a17:907:72d3:b0:b90:8016:cfe4 with SMTP id
 a640c23a62f3a-b942dbae36emr189809666b.10.1772821663491; Fri, 06 Mar 2026
 10:27:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1ff1bce2-8bb4-463c-a631-16e14f4ea7e2@arm.com> <20260306-work-kernel-exit-v1-1-8f871f6281cb@kernel.org>
 <aaroReSCj1qXUeQb@infradead.org>
In-Reply-To: <aaroReSCj1qXUeQb@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Mar 2026 10:27:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=whCiPr-cR3hVv=46Qo0Nw_vN422YUxqU0GmNai+KRtg2w@mail.gmail.com>
X-Gm-Features: AaiRm50t8TjmDHmMBt5Sh-GyOL4xotHpUKagWUMEUHoG2sdTM--QAxb3FwfabmE
Message-ID: <CAHk-=whCiPr-cR3hVv=46Qo0Nw_vN422YUxqU0GmNai+KRtg2w@mail.gmail.com>
Subject: Re: [PATCH] kthread: remove kthread_exit()
To: Christoph Hellwig <hch@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-nfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Christian Loehle <christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Mar 2026 at 06:44, Christoph Hellwig <hch@infradead.org> wrote:
>
> More a comment on the previous patch, but I think exporting do_exit
> which can work on any task is a really bad idea.

What is the advantage of a module only being able to do
kthread_exit(), and not able to do a regular do_exit()?

I think the only real advantage of having a "kthread_exit()" is that
it's a nicer name.

Because if that's the main issue, then I agree that "do_exit()" is
really not a great name, and it matches a very traditional "this is an
internal function" naming convention, and not typically a "this is
what random modules should use".

So kthread_exit() is a much better name, but it basically *has* to act
exactly like do_exit(), and adding a limitation to only work on
kthreads doesn't actually seem like an improvement.

Why make a function that is intentionally limited with no real
technical upside? It's not like there's any real reason why a module
couldn't call exit - we may not have exported it before, but we do
have code that looks like it *could* be a module that calls do_exit()
today.

For example, I'm looking at kernel/vhost_task.c, and the only users
are things that *are* modules, and it's not hugely obvious that
there's a big advantage to saying "that task handling has to be
built-in for those modules".

So my reaction is that "no, do_exit() is not a great name, but there's
no real technical upside to havign a separate kthread_exit()"
function.

If it's just about naming, maybe we could just unify it all and call
it "task_exit()" or something?

           Linus
