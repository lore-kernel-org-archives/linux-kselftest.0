Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920416;
	b=RdZb33s2iOMb1BhBZfWegDi4AfL0Ai3BBpSyIB9yE2SbESnJp3+eozN5j21oBVCqc0dU
	 xxDcwkI8zDBeKxEavqHAboBWgWZBWTO0aaQ+JaRibouV+nZS4st/4qALzKIfSCd4EGGAB
	 hZq3ikqALEJ7o13gxDQNUznkHLFCvnVSpcE0YVcPQ5XZoy+M3vKqOu7F5lWKLHb3njMpx
	 4WdEuHMmUwx4wSXTBjIBlqodoVxMA5z6LHo4e65Fx9VCqfuTgCl6me/KUrOnk4EvKvGLd
	 ZAlMLtCM8DsUSWqQwJocwchZsQ8R8lxnW6Zv/VxGYf4FHw0qYoFYUslLETd9/O1Os/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
	b=sFSdV+mMelVIVMZABPsxOFy/4yZmjDktkRZgG+XJBHKtRTb7yHZR1vlTHP0Ijxt+5bcn
	 9yJlhnjv8Wk+tpGsGfseHJwjAvhWGHunqp4IyhzSYtEzvXZbeKl1vN7R8iEqtSqx1qlBQ
	 SaP+4YSpUh7nfs2N6teo1XBYn9bcjtmek6ax1OkZV3jA2GxvfxkCz+ydJ4CBejq5NwiWA
	 EgTFxHm0dzZDSLHA1hWacOM1e8Ti3j8HekFxjEmiLZ8BnY+xWoDh64Gl38BqghYNB4YHo
	 BIhEo3fTWT3YiFJvH+769nArW/noDCvQvSeAvxm592CrU1IA0Ti2Xr6JJA5XATG3D0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux9dP6cx;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94280606A8A9
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94280606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux9dP6cx
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a358881793so543525f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920415; x=1795525215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=ux9dP6cxGHchfy+unLDQ6NmKaVT3R8pW2Zfa/bLFviUfqW7T1JZLWOGkLeMvqz7iUB
         zLW7dje3QrA7HvFJ9Z2e/BsWN7PkFukCWLlCC2sfZfe4C42kw1BD7+xJ9+K8ykHcfJhN
         xuB6p0p675+Q+8Ab4VBm/lPttSQUOT9MfXiQdtBTxIq64JfVXTUc/LJnriMOJrmqWlqr
         pVJv7iS/suULfBRGTO/rXud1wwmWfwrXIjLdPTrqTKyk72/ZF/FYEeTqn8YrQOIG851+
         XstWyYcmlUsM5ZYhKgaD6JN4csYJsgqj8fKhGxAJTKSZDhJpxLk/Ya/RZa7YSEnQfkFN
         FNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920415; x=1795525215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=qvqNIucjOLOqCdx4hwN41r6uIUPoxCs+BRcwv7G0DqohXet7jcHjPs59d/Quq0bsnz
         WVtmpcDfbHW+lcBEqGk3PC2/EMXU5KXWyKqMQRxQGO/6w9zYwKBg/Nh8Z72ZYvStEL61
         DO/R96QHdFN7W3FUo9EsHtg4msv9HP3NC0OxGTmVXHNEoMa5PWccVI651us2WXQW7CBl
         IV/T9JiKBGtLLg8FloR3pjjBEpvPt+ECqz14kpQ8G27mlhH+y0PoIxaUEmKI6kCPXRLm
         HbxBwNz0fbRDNqYZmy68EBifbEhH75LwAjZzpLtUywhMQ8zLOa9wl4EuCSBs0HcGfoIG
         XQvQ==
X-Forwarded-Encrypted: i=1; AL+hErHZlbgt88j/NjtAHzF6slEnuI0DbPHhgcAhr3hcmrNm2FSVjGi8Lct6vw8l2TjIiixaRb0+dFBKnicpCopv7ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gveITRyIImiFinkOdh1BL4Ha4m/NKoM1KyJ2H99vNerwR56vK
	JX1v+bCsxY8Fsbb+6PxwVEjrFze+FTAYYYQiw+7QjN78+pp6DGd527bP
X-Gm-Gg: AZFdTZd5A6u1WJzf2cd5RI1zSD/SttW3ro0XO/b7O+1SNlDyE/oKH329Tms/UO2YHJH
	Sprp8ft4VoH1H0K2UulzSG6ti2JS/BCHZHkrUZoXs+EkfiNbyCSp09I0pt+y3+/69Kr0mrJuwwq
	qazUjh/q14gu8BIToW5F/3IU42Ue/UpRqZxmMlSibJ86MfA5HfRcmi1Du+lRtsze3IqMwOTS//Y
	37cTGwjonE7WnI6oV8xJYzlJLN1b6R/ABB+ssYaAfGdhFP6t3zUbU3ERfg1/RquKRtBYfouzfFr
	mgKE5H7WXmh4URn88H1U81XsVZkoqLsUGmigRjdQqJaLFfGYa+x6KX5crMcOpdCcs2FCiPlJub6
	+sR7wcpHhyMmN9za15zDSpiInqNT8W2k/3WuQcOzkR5EnsoTmmp7TNTgEL4RPVUs3qFDdWhSUzj
	GHskR817wQHXCwGvs/JPU4X0Dn0L+C0fdVlQzR7U32lyfB2CY/WvId3J6A6JOYCFqMWWntjAy4M
	GZbBiWyTllnVQzbwamY9p3g+mehgCBkLyXRO+gAXtRUkDq0z0TFgjuNuukQSCcEXJC8rONlor+T
	U0RQ3lQEUb+/PQ/g5v2BpMaM5xwiAPwBHN1ZFb+K1MiRW8C9yoOGj33rw0vaRC6lqvX/DyU9art
	HC2CxNk8+s60=
X-Received: by 2002:a05:6000:46d0:b0:498:2754:6a80 with SMTP id ffacd0b85a97d-49c725e538bmr20536616f8f.28.1794920414596;
        Tue, 17 Nov 2026 05:00:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm28207005f8f.28.2026.11.17.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:13 -0800 (PST)
Date: Tue, 17 Nov 2026 13:00:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261117130011.05eee0a9@pumpkin>
In-Reply-To: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
	<20261115142431.1587690a@pumpkin>
	<CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 19:15:11 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Fri, 13 Nov 2026 14:12:45 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> > =20
> > > /proc/kallsyms is the primary interface for userspace to query the ke=
rnel
> > > symbol table. However, resolving even a handful of symbols or address=
es
> > > requires reading and parsing the entire text file, which is often sev=
eral
> > > megabytes and takes thousands of read() syscalls. =20
> >
> > Separate from this, I've wondered about separating out the /proc/kallsy=
ms
> > code from the code that actually handles the symbol table itself.
> > The two parts are pretty much separate.
> > IIRC it uses a static function to get the symbol type (which does most
> > of the work of getting the name - which it also wants) so it isn't
> > completely trivial.
> >
> > I'm pretty sure all (well almost all) the changes will be lower down
> > the file than my changes and won't cause (hard) conflicts.
> >
> > I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> > in userspace for testing both, but had to cut the bottom off kallsyms.c
> > to get it to compile with a sane number of definitions.
> >
> > David =20
>=20
> You mean separating the core symbol code (top of file) from the procfs
> interface (bottom of file) into two separate files, right? If so,
> seems reasonable to me, especially since the file is approaching 1000
> lines even before our changes.
>=20
> And agree, even with both our patches, most functions can remain
> static in their new homes.

I just tried it (on 7.4-rc1).
Only had to make kallsymbols_get_symbol_type(), kallsymbols_expand_symbol()
and get_symbol_offset() non-static (added to kallsyms_internal.h) and
split the file before the definition of kallysms_iter.
Then tidied up a few #includes.

I've found a much bigger problem though.
All the sprint_symbol() functions do unchecked writes into the caller
supplied buffer (no length is passed).
While the buffer is (usually) long enough for the name, there isn't
guaranteed to be enough space for the "+0xoffset [modulename buildid]"
that might easily be another 60 characters.

Some of the people who have modified that code recently really ought
to have fixed it.

David

