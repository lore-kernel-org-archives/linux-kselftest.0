Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91AE3D301A
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077300; cv=none; b=If0MyJTkVnhHdS78FRiSZw+wmJnFjDs2VPdUV/dp92qDdYQ2SKaHXsboJpBLRk4Dp6mVG+v76Rpov39Zg9N1AouikMwPl6xT0x8vijzfM+1nJdP4/OSsYcqxrNlrh7gc9vz6vHXOP+0JpPZDk8SEWirawYe3tKQlNzU16+q8Rdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077300; c=relaxed/simple;
	bh=LcKBSGkUJ4jOZjfNY8MJfZV+UOABBnNyslHE4iTDcoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1v8q8GTxYWWvsGAs4e4qlyhyDDzh6xhtgdndIex0Po+QPsGKju6QlKEnELbMpRHUaTGw4WeycxEVnnP093fqG1uWd9QExQ8EwC5ALt0BhHpHEpDfTAV7ybDTtQcnE5nE/2/nOC/f+gC3kQN1XcWBYFMKlSy1YNr4rBk0MavBYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RFCQ4RrK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RFCQ4RrK"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6615c766e60so6820355a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 10:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1773077297; x=1773682097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y/0fgmHhC0VOep6ZWbqzX4YfecogO4RJ08oTSaCn8/k=;
        b=RFCQ4RrKEULd0kQR9j1Dlfs8W8mcLUoGXUqv8QlK2KRAkudol+dq5yBmDKWD6k8PFV
         Rb6KNME5+ac7pxg8VUn+69aOICx5++rxBZOc+D3mo6rnPhXEUDkqlpJh9nHKbp1YqhYL
         rYRrrj8tNMlDsy0MQmJJrkMWPLYwq0gfQwPLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077297; x=1773682097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/0fgmHhC0VOep6ZWbqzX4YfecogO4RJ08oTSaCn8/k=;
        b=GHq0c9ff4ZgcZTICOvQU3g83KjHyvoAWFnsuB7fWxnwoouAVGw2G6wL2Sps0mcbxU2
         hg1x10V5tbtPgavfOwHHjouOsjfuKfNVPUc6GVrTLEETSl5QjWrYAjuyVN3/0lr9HfqO
         kvDnq0fuCKwW8yh4ZdBqcla9PtVJeNlABjWEBy17BfbJBTYID7j4tK9IerR2NOUq287B
         ylfN3a0JcoS16GwaTJoV8RtDn4k6ptcCRaniKONCPPiEKAupyktlo9kcxfC/zGcWiiXi
         XxQVe296AHdUOPpJFNxphtXBQg3PuQoN9bSCaFfq+QXBlC69cqPOCa6+fx2/Pe5sA6gW
         K6VA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Gqsxf5G31GW5JLlVCkEQsfsVMze3IqLR5cHPXfkvV0Lg2XsfB/N+15odpVjDtTl2KsC4QjzI2r8I8iYGQFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtZfuyVW+A9voh9T+PoUg+LkLSH5ArBK3vjEySGUzcpIXE1KX
	kXb0n9zIZEbZqQiFepRgtv4Sp2gbFfgbYWyaQrA5wxTH1u8dbQaSblDM9zspwJEUdB8O5tVgppf
	7NnYCjfA=
X-Gm-Gg: ATEYQzz4NBQlaWtljQRx6oJdKGd2soAAxgFCPpudph2edy3DDgB5LWe/qY/Ell4PGJP
	+54bGj+AL2Z+sAwLHL4ceSJ5GPMMDJOv8eSxepoEO88af4ARejIME8yund8bk86ZuRBwMpKWC3V
	VnmAFxJRSovivxXGGbSvt+t1BHMtyWmKyQMmorld/0UDqz9ZLUQj75jxlbsJmPQUisAl36Yzmmf
	Cq36j2RlyJoxCMpg2riBcl0cVjFPUWWT8ast8deNCgEIyx78CEppjenCFHcYCMUxXhP3zuoEUxz
	79I8DGbe3GKEdKxV3wanQ5GMGtQbUYFhRZidaOLILWykF0CkTIp1L3P4sZNoWRk9+bmssYV2lWj
	ll2SPuD51odMpCPt84NpMmgltrSsAGBb+6sJzRSR+ANtGFFldR3JwZkzX5HOLoWT7qoeLhkH5qb
	aU0eFT9AmfOu42ol6ARrObbZp2TIIMywhZOzg/rhtcEbaBjAyZCo5uJYzUkZU8GefVWqjKZNDg
X-Received: by 2002:a17:907:94d3:b0:b93:c5a9:a5ed with SMTP id a640c23a62f3a-b942da4962cmr701172166b.10.1773077297045;
        Mon, 09 Mar 2026 10:28:17 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942efb5bc4sm402254866b.30.2026.03.09.10.28.11
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:28:16 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-662b933f8d1so384858a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 10:28:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCcs9pM3EF8XHHtihMQ8mudOgWs1xnDV5M0jR8jjVpDSlHgzgS1aLEv/4WlyQWVhFRCjg5FAYUWO+tW81b1Y4=@vger.kernel.org
X-Received: by 2002:a05:6402:50d4:b0:65c:23f0:a80d with SMTP id
 4fb4d7f45d1cf-6619d4e3738mr5814793a12.19.1773077289768; Mon, 09 Mar 2026
 10:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1ff1bce2-8bb4-463c-a631-16e14f4ea7e2@arm.com> <20260306-work-kernel-exit-v1-1-8f871f6281cb@kernel.org>
 <aaroReSCj1qXUeQb@infradead.org> <CAHk-=whCiPr-cR3hVv=46Qo0Nw_vN422YUxqU0GmNai+KRtg2w@mail.gmail.com>
 <aa7qson15uJpL-BL@infradead.org> <CAHk-=wi_kwtWt4Swi=k2zJTnStoBaw3vneHz8ccVNDyVD1nvWg@mail.gmail.com>
In-Reply-To: <CAHk-=wi_kwtWt4Swi=k2zJTnStoBaw3vneHz8ccVNDyVD1nvWg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Mar 2026 10:27:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi-QpnBHMH4Oa6tsYVhp+Uv+hKU_oedAUnt4icMqwPtzQ@mail.gmail.com>
X-Gm-Features: AaiRm50OcoxR7YXKVzqClnrYq6PJcpS66d_jgF8-UVsQY5IDs7VWWvYFcU4JSa0
Message-ID: <CAHk-=wi-QpnBHMH4Oa6tsYVhp+Uv+hKU_oedAUnt4icMqwPtzQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="0000000000000491e3064c9abac4"

--0000000000000491e3064c9abac4
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Mar 2026 at 09:37, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, there are real exports in this area that are actually strange and
> should be removed: for some historical reason we export 'free_task()'
> which makes no sense to me at all (but probably did at some point).
>
> Now *that* is a strange export that can mess up another task in major ways.
>
> [ Ok, I was intrigued and I went and dug into history: we used to do
> it in the oprofile driver many many moons ago. ]

It looks like it should not only no longer be exported, it should
actually be static to kernel/fork.c. As far as I can tell, that
historic oprofile use was the only reason ever this was exposed in any
way.

IOW, a patch like the attached is probably a good idea.

Somebody should probably remind me next merge window (I'm not going to
make 7.0 bigger, and I find examples of people using
kretprobe/free_task, which *should* still work just fine with a static
function, but for all I know if the compiler inlines things it will
cause issues).

Or just add this patch to one of the trees scheduled for next merge
window. I'm not currently carrying a linux-next branch (I actively
deleted it because it caused problems due to messing up other peoples
linux-next branches, so if I ever introduce one I will have to come up
with a better name anyway)

                  Linus

--0000000000000491e3064c9abac4
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mmjgdgcc0>
X-Attachment-Id: f_mmjgdgcc0

IGluY2x1ZGUvbGludXgvc2NoZWQvdGFzay5oIHwgMiAtLQoga2VybmVsL2ZvcmsuYyAgICAgICAg
ICAgICAgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NjaGVkL3Rhc2suaCBiL2luY2x1ZGUv
bGludXgvc2NoZWQvdGFzay5oCmluZGV4IDQxZWQ4ODRjZmZjOS4uMGVkYjM2MTA3YWM1IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L3NjaGVkL3Rhc2suaAorKysgYi9pbmNsdWRlL2xpbnV4L3Nj
aGVkL3Rhc2suaApAQCAtMTA2LDggKzEwNiw2IEBAIGV4dGVybiBwaWRfdCB1c2VyX21vZGVfdGhy
ZWFkKGludCAoKmZuKSh2b2lkICopLCB2b2lkICphcmcsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCiBl
eHRlcm4gbG9uZyBrZXJuZWxfd2FpdDQocGlkX3QsIGludCBfX3VzZXIgKiwgaW50LCBzdHJ1Y3Qg
cnVzYWdlICopOwogaW50IGtlcm5lbF93YWl0KHBpZF90IHBpZCwgaW50ICpzdGF0KTsKIAotZXh0
ZXJuIHZvaWQgZnJlZV90YXNrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsKLQogLyogc2NoZWRf
ZXhlYyBpcyBjYWxsZWQgYnkgcHJvY2Vzc2VzIHBlcmZvcm1pbmcgYW4gZXhlYyAqLwogZXh0ZXJu
IHZvaWQgc2NoZWRfZXhlYyh2b2lkKTsKIApkaWZmIC0tZ2l0IGEva2VybmVsL2ZvcmsuYyBiL2tl
cm5lbC9mb3JrLmMKaW5kZXggNjUxMTNhMzA0NTE4Li4zODVkODA0MzJhODkgMTAwNjQ0Ci0tLSBh
L2tlcm5lbC9mb3JrLmMKKysrIGIva2VybmVsL2ZvcmsuYwpAQCAtNTI2LDcgKzUyNiw3IEBAIHZv
aWQgcHV0X3Rhc2tfc3RhY2soc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCiB9CiAjZW5kaWYKIAot
dm9pZCBmcmVlX3Rhc2soc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCitzdGF0aWMgdm9pZCBmcmVl
X3Rhc2soc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCiB7CiAjaWZkZWYgQ09ORklHX1NFQ0NPTVAK
IAlXQVJOX09OX09OQ0UodHNrLT5zZWNjb21wLmZpbHRlcik7CkBAIC01NTUsNyArNTU1LDYgQEAg
dm9pZCBmcmVlX3Rhc2soc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCiAJYnBmX3Rhc2tfc3RvcmFn
ZV9mcmVlKHRzayk7CiAJZnJlZV90YXNrX3N0cnVjdCh0c2spOwogfQotRVhQT1JUX1NZTUJPTChm
cmVlX3Rhc2spOwogCiB2b2lkIGR1cF9tbV9leGVfZmlsZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
c3RydWN0IG1tX3N0cnVjdCAqb2xkbW0pCiB7Cg==
--0000000000000491e3064c9abac4--
