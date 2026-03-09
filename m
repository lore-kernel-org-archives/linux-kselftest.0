Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B26238C23
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074267; cv=none; b=KBnSZvnTvKAth7sqUyNn/eKA81b+tqLuWn3YVohLSW09BXQ9XXK5VppSW7iIf6gCsmywdovxgRBkhUveahx/4CEdQRd1VM59+nNvxl/ixcVxmixyUvkgr62GuwhfAv6+NFAn+YcOVXZaGvgN9nt0kJ++jCYVyGU4hOA72vsRaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074267; c=relaxed/simple;
	bh=zAR72wDXdxq5C9PjPsyeD4QQxyEK/1hXtEl2Xpss9d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJY3XaedeTxJl78heb5gFquOpnbW+CTbdLuLK34Ns6mp+9BGT5SSk7+P237O1KpUmKjA6ovgQ1aBAhJcXI2HpTdYSw5YPf/qIazoWdsyDSHb0cUrC8dXKOxjunwlUMy1qfH/N7y71TZp8gNvtRmx6dw45QWItQ4nhUotmgwojGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=c7PVcu0/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c7PVcu0/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b93698bb57aso593890366b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1773074264; x=1773679064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5aGclf2D5Ad+FZRYNo1Igm1i3XSKWX/TJgjzbw+i9o4=;
        b=c7PVcu0/KDh44ncc8WgM8otk/Wz39ZXNXnHffV5yYG8mRRBJGX+KhEcWutxfRWVZuG
         86bWJI61yTeHLjyOBBbK+9L9lAk2/3O7V7ZnYfZUxShjN5DtdDz48IyouxM8FWkpbQNU
         +GTUbyN808liIox5qb6c52OG45yK0EI0f/mFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074264; x=1773679064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aGclf2D5Ad+FZRYNo1Igm1i3XSKWX/TJgjzbw+i9o4=;
        b=nF8tZj4BTBndXWbV07M3cq23UsXm+5/I/5eoog2O0YfgItbFlnjB72h5cqcJR+dxp2
         jHnRtuMQYf387ifFWQc+ITFPxWIrBSHlCqMpjq6OiZDfjOkJ0sUjriEna9xZAVWBZL3r
         FDTyV4Vvd551QQe/uWrVCzLne84eLEsH+2DM2q/DPvWDjhsb3FO82EdNiVERIVa9C5zz
         f8/79Ev4M1CCGx/yTy+wwZN/FekfAQx++OR9yYrcNiWzkmPRmUPcMrvT4NS3pVnupOGl
         9Sk7hfF0AVBmzmKzQiDSp9B0M8MyrTXUhFRqJ9J4sc1z278DBDl4eUdJ+bAuSK0Ds8F5
         pwOA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Vy0hI2FUFeNY1Ov8KQBKjIoDS2eqjm0DWgwfrDYCBz1A33X47yfGOYFJ6humNPK/+ftsZlVGi0QerJlsyP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuGF/tpkna8Z84kU4kJxvxOUfhuVGVJbVZ4LMjkYh4YVKgJDgY
	FVTeXu4tfBMemarL3bPmsniRLIw5R3NGK52wrdUBcYdziWmLPGgpkOqLVmduHq0W9lieBNn/pRA
	/U96hddw=
X-Gm-Gg: ATEYQzxUkuJzilWLAjIoIQS8wMj0laxM0CeQ133wLicpPxSSFIHCHspP2lWYpKrR/x3
	k6EJ/NZeAhFwUOgcMv5Y6Z+pIrt9emtbr8E+jONf9d/iK34B7K1IwKpha3z3wm5bg+v/WvI/H0r
	MjwBCixmkAxJSUbgVfZUxX9KSkpvpVeoIPNUEJRCJ5z8Ye0qkjRDw5HwiypboGMxKXWCQhMwSCs
	i2gDF5utWDKTwjHA/zzX4R11LLSEYQ0+66IUYAn1FVgIn7mXOhk/Q5R8pcubiEi8MEIWg2IH2tj
	kGa3FBIVRKWOLMGMsHeuW3t+vW9Z4gJgD39BQuFhPoRIiFx4tGYuCFOSGI8piHpggtyaHCgQTWI
	o7ZZs4WRQIugAlRej945HpgFbOURTz1gz9DNaM5+Y7sOZRvK9N75WrMJKqHkNGdAPDwEjE9h9ZD
	TVrIFnokOjFz8+bd5Eu6CWZ04jL1glnxHeUZHXbGNJkrQuDDovAqIgmTFiqhm5bd/GfEruCdXOs
	gbkFv8TOcQ=
X-Received: by 2002:a17:907:96a4:b0:b93:56a4:d6d3 with SMTP id a640c23a62f3a-b9711850f94mr15957366b.1.1773074263747;
        Mon, 09 Mar 2026 09:37:43 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b943cca3c0asm342742666b.34.2026.03.09.09.37.43
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:37:43 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b942b36de08so503910366b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 09:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRrThKwHrQ1kqyat23lASwIRJJdeAwFSCOTMNs+mZV31646R0gipLNMssmN4LsEoSxIwuQ4on5K3lzolgK9OI=@vger.kernel.org
X-Received: by 2002:a17:907:3e10:b0:b96:e1de:db04 with SMTP id
 a640c23a62f3a-b9711a1fe33mr14904266b.18.1773074262570; Mon, 09 Mar 2026
 09:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1ff1bce2-8bb4-463c-a631-16e14f4ea7e2@arm.com> <20260306-work-kernel-exit-v1-1-8f871f6281cb@kernel.org>
 <aaroReSCj1qXUeQb@infradead.org> <CAHk-=whCiPr-cR3hVv=46Qo0Nw_vN422YUxqU0GmNai+KRtg2w@mail.gmail.com>
 <aa7qson15uJpL-BL@infradead.org>
In-Reply-To: <aa7qson15uJpL-BL@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Mar 2026 09:37:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_kwtWt4Swi=k2zJTnStoBaw3vneHz8ccVNDyVD1nvWg@mail.gmail.com>
X-Gm-Features: AaiRm52k8FmvIAxaWFSwelL44z7-IyhgZowK3grBWDh2zbSjeLnGfYwalrLVlLs
Message-ID: <CAHk-=wi_kwtWt4Swi=k2zJTnStoBaw3vneHz8ccVNDyVD1nvWg@mail.gmail.com>
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

On Mon, 9 Mar 2026 at 08:43, Christoph Hellwig <hch@infradead.org> wrote:
>
> Because it can't f&*^ up the state of random tasks.

Christoph, you make no sense.

"do_exit()" cannot mess up random tasks. It can only exit the
*current* task. The task that is running right now in that module.

And exiting a task is about the least effed up you can do to a task
when you are in kernel mode.

Compared to everything else you can do by mistake - like just
corrupting task state randomly - it's a very benign operation, *and*
it is obvious both in source code and in behavior. It's not like it is
some subtle operation.

I'd be *much* more worried about actual subtle bugs, not somebody
explicitly calling exit.

So what is the actual problem? No more random rants. Explain yourself
without making wild handwaving gestures.

Now, there are real exports in this area that are actually strange and
should be removed: for some historical reason we export 'free_task()'
which makes no sense to me at all (but probably did at some point).

Now *that* is a strange export that can mess up another task in major ways.

[ Ok, I was intrigued and I went and dug into history: we used to do
it in the oprofile driver many many moons ago. ]

And since I looked at the history of this all due to that odd export,
that also made it clear that historically we used to export
complete_and_exit(), which was this beauty:

    NORET_TYPE void complete_and_exit(struct completion *comp, long code)
    {
        if (comp)
                complete(comp);

        do_exit(code);
    }

so you could always do "do_exit()" by just doing
"complete_and_exit(NULL, code)".

And yes, that function was exported since at least 2003 (it was
exported even before that, under the name 'up_and_exit()', and that's
the point where I couldn't be bothered any more because it predates
even the old BK history).

Yes, it was indeed renamed to kthread_complete_and_exit() back in
2021, but that wasn't due to any fundamental "it has to work only on
kthreads". It was simply because nothing but kthreads used it - and
because that was also the time when kthread_exit() started doing
*extra* things over and beyond just the regular do_exit().

So it was a practical thing brought on by kthread changes, not some
kind of "exit is evil" thing.

And that "ktrhead_exit() does extra things" was the actual bug that
needed fixing and caused nasty memory corruption due to subtle lack of
cleanup when it was bypassed.

End result: we've never historically felt that exit() was somehow bad,
and when we limited it to kthreads and made it special, it caused
actual bugs.

            Linus
