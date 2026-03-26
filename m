Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DFE40FD98
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542672; cv=pass; b=ZjrhKHfXh2bUC/m6/5VyWKZRxSj/Xp4wfZvuEK/3IJeo9had+4UP+nBGMzWD11Qdvgw+VLYElNmna9Iq+YFbFj9yEnUMq7/94ZFoKSP/ET7Ah4jy/ASx7ihZz6f4DUq1GMJVmTeS/oYADBjnsHVU2oEv4r8aPGk/hlcGzG8KpeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542672; c=relaxed/simple;
	bh=BZbMBwHrp8whhIaCRPg1ZjbDngDwiMRAEfXI7t9rAFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVQuKBHTt8pkSywdA6PaAJy/IaC1qQ6ba0SAO58u5B+MGHtiU44njcZk5NWTka7HyIu01VCMatMUzTiF9gNCB38WxHN2AOdCwMV88tFShZMQPD1q1A8klWlPwTR2sxi68c/yjpqZp4AeIM1MrPCgR3fEQKOaZKejp9QIjwjhJT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEcoCK16; arc=pass smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEcoCK16"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43b41b545d9so1201155f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774542668; cv=none;
        d=google.com; s=arc-20240605;
        b=W2i9Sd1dS8o1yj7369Z5dBd2wVB0oVqbMlpwiKUs1QYtg600rEygTsIgeNF5lp4exb
         cENqtx7VlPgfLN4+T6Yj3QdijR2fa3BLxQZav4ohiDPsbQybnXIl/ZPQhIxDulgNhKz9
         i1CN8FxVSdpJrIuqKqhY+d13lz4ZQWR5fdCOaAAaTBotOraM74r4n4X2ck9tGe2J8MrT
         H5plXHXR45QFJZCc5hjn6plYkX1eQS3+vA9zihBiwfdg2uGj+96Ze4nfWnECFCM8UFFl
         Fsp0oxZQAjJNx8WO8wop45r0UYkL4YO+qaHPM3947z1WXJ3nHhRns7v4448hR7+Cjb67
         O6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfNm/O6t2ZnE/ns6CNZugk+zk3ym9aOAJX1Hxzo1H/I=;
        fh=hm5RzgnN9y1QEpp+bH8MnwL3ZKGHFULQ0NnUb20T+CQ=;
        b=KkBB0w75n9fXEcWQ9nhNC73ggR3CiLp9pZKGYqCQvRMnEb6XFTk9CtwVRbFKDZRokd
         GTudl4PibCyPpCALf9MRtbaxkdVpUPVooAJt/kxa8WoXK6ufk1Ims4YW73XlStPED1ue
         Xsw4LFIvGJi9ufhyZxvrgEj6knSHc5LJj4/nBXfH7kFK/PRkbGXTxCdQbi1EqZnwkWth
         A31EPIMyagnPTI/VfcX+5WD3jTwwXRhmX/mVFG5OfvDQQDFD68sAbSsi/MJFBSbtNbhu
         AVg+hKK3i1bW9d74gdGYr9jid11hfF2FFOQWPPKJO6BASiyk9+2Q3werMCmilSJPrijw
         KZ1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542668; x=1775147468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfNm/O6t2ZnE/ns6CNZugk+zk3ym9aOAJX1Hxzo1H/I=;
        b=UEcoCK16VvEhwgTWUb7DEymNbHkAuR2Bvi2cRcfRLUatm9fDCEXXSn8Q1V5742uhGA
         R6gnsW/rzrdfHepwh8x8bUDEfG1PwsO4eZIKmsKf0R37H2z1qr1yJT+XpjIWxxmZe3Q4
         aO0jysZgUPMJoJTOdUCI513mPtjQQ8wCW8tquZI8m0A2npiIMVJ/2ES7daPpw5KGm4pO
         vp0/yopINYEQMkxzRODW5jy546/II9ylviTu32nBNRUJ/CXC3Homjh449HkD8nAOs4Yu
         syrK23a6PHKQONTsYTfmjEeOFgKwFu9frvL44O5HCjxeUW74xyozGobyRbOPXfPUjYMG
         CG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542668; x=1775147468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfNm/O6t2ZnE/ns6CNZugk+zk3ym9aOAJX1Hxzo1H/I=;
        b=ElDPjrRhTsyJuBYIGI+am1P7eaK/alL4RuuGsG40/jAUWTP8Od71LCHzPwYegINROV
         2pv0yElpE79lTASRDDIcHCLBWDtEW+N8whtyZ5Ez1pfD5lvaq4du4mYVGYvGYgQpehHM
         x/2hHYno8uuv6793e85r4T6TmxMOsBMK+gedfbdcqkR1mtHH3PcMWRan1Sian+mpSYTw
         NqC/LPYXScD1m5uYZ88srvD5d5PJcyGhIkdcyTnCJNXOaFOSk80GJqVqCVGyceKACGSG
         TDpKVbFzz9YEX1QGm032QE5s1rJGKskvMvcv/h1rVV3AOgWsenIlRAhfHcD7q+jpvCfQ
         rC1g==
X-Forwarded-Encrypted: i=1; AJvYcCXqiOmzFXG45/l9dTuOYif2o7HJWrfujoUz1dMbeQ/MMyvuI6AB0uUwHH3mjO/5KNfqauQeGcyH9igzTNgTwCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvrdEpmcI5cJ1K0AdTgvX6j7NiBwpI0V0+IQNshkD/9hoyJQvs
	7IlZ6ApdYuJKHmvzvS/w5Ssv/a6wPe/d08K/vHi8Nus26yxcDWCbvoMlLsTpgjqZ1eq/blsuBdv
	FBQQK7a6+7e4TxiuR0VNlAffLOrJsOS4=
X-Gm-Gg: ATEYQzzSfcasX1GSbumIorKsxKxUvuED6TG9LNEWViTZh0g43xAHCcI1gZG31mq6kBR
	eexol3CvP/8UgAGJ0FA9SObAYgToiJWleuceB7wQMhBNY1k4AGB+kJN5bGn2F/soLJ+IWLEqOb9
	sKKaqAjBDYt+HIiFrQdvg5h3XG6hsCUFw3KBnjl3nAzixRlS9/6QZuA9zF6DYLE1JwBFTSiEX32
	zY3Ncqqe9GXzByS1tDpqaa4a7j1GeIVJxnvER6kASoFkGLAlvJ1umEnr0rQuUxmIjDh6UGI6BMq
	C6/lOHNAeIcylSC904NsVt4nQZoryQBY5WT0c7oLyc0PZLot5v5j9oiOZyjL
X-Received: by 2002:a05:6000:2481:b0:43b:801e:488e with SMTP id
 ffacd0b85a97d-43b889a8389mr12816871f8f.15.1774542665963; Thu, 26 Mar 2026
 09:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326112521.2827500-1-wusamuel@google.com> <m2v7eig4ue.fsf@kernel.org>
 <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com>
 <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com> <CAG2Kctqd4p4pJtH=tSfKT57qfecQrpcoYu3SsAzJ-zGEiYVSQA@mail.gmail.com>
In-Reply-To: <CAG2Kctqd4p4pJtH=tSfKT57qfecQrpcoYu3SsAzJ-zGEiYVSQA@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 26 Mar 2026 17:30:29 +0100
X-Gm-Features: AQROBzDVtUgfqATd7rCHJdNRaOBCw4LGtIxgfT_E050yYf4i43poQlTnNZclS14
Message-ID: <CAP01T76nRgXf9XW+6SGaJ-N2iZSFj6E8--p5mtBB__czwvDUag@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Support BPF traversal of wakeup sources
To: Samuel Wu <wusamuel@google.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Android Kernel Team <kernel-team@android.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Mar 2026 at 17:26, Samuel Wu <wusamuel@google.com> wrote:
>
> On Thu, Mar 26, 2026 at 8:02=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, Mar 26, 2026 at 7:54=E2=80=AFAM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> > >
> > > On Thu, 26 Mar 2026 at 13:20, Puranjay Mohan <puranjay@kernel.org> wr=
ote:
> > > >
> > > > Samuel Wu <wusamuel@google.com> writes:
> > > >
> > > > > This patchset adds requisite kfuncs for BPF programs to safely tr=
averse
> > > > > wakeup_sources, and puts a config flag around the sysfs interface=
.
> > > > >
> > > > > Currently, a traversal of wakeup sources require going through
> > > > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls=
 to query
> > > > > sysfs is inefficient, as there can be hundreds of wakeup_sources,=
 with each
> > > > > wakeup source also having multiple attributes. debugfs is unstabl=
e and
> > > > > insecure.
> > > > >
> > > > > Adding kfuncs to lock/unlock wakeup sources allows BPF program to=
 safely
> > > > > traverse the wakeup sources list. The head address of wakeup_sour=
ces can
> > > > > safely be resolved through BPF helper functions or variable attri=
butes.
> > > > >
> > > > > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing=
 ~34x
> > > > > speedup (sampled 75 times in table below). For a device under loa=
d, the
> > > > > speedup is greater.
> > > > > +-------+----+----------+----------+
> > > > > |       | n  | AVG (ms) | STD (ms) |
> > > > > +-------+----+----------+----------+
> > > > > | sysfs | 75 | 44.9     | 12.6     |
> > > > > +-------+----+----------+----------+
> > > > > | BPF   | 75 | 1.3      | 0.7      |
> > > > > +-------+----+----------+----------+
> > > > >
> > > > > The initial attempts for BPF traversal of wakeup_sources was with=
 BPF
> > > > > iterators [1]. However, BPF already allows for traversing of a si=
mple list
> > > > > with bpf_for(), and this current patchset has the added benefit o=
f being
> > > > > ~2-3x more performant than BPF iterators.
> > > >
> > > > I left some inline comments on patch 1, but the high level concern =
is
> > > > that encoding the SRCU index into a fake pointer to get KF_ACQUIRE/
> > > > KF_RELEASE tracking is working against the verifier rather than wit=
h it.
> > > > Nothing actually prevents a BPF program from walking the list witho=
ut
> > > > the lock, and the whole pointer encoding trick goes away if this is=
 done
> > > > as an open-coded iterator instead.
> > >
> > > Which is fine, the critical section is only doing CO-RE accesses, and
> > > the SRCU lock is just to be able to read things in a valid state whil=
e
> > > walking the list. It is all best-effort.
> > > Open coded iterators was already explored as an option in earlier
> > > iterations of the series and discarded as no-go.
> >
> > kinda best-effort...
> > the way it's written bpf_wakeup_sources_get_head() returns
> > trusted list_head. It's then core-read-ed anyway.
> > Ideally it should be trusted only within that srcu CS
> > and invalidated by the verifier similar to KF_RCU_PROTECTED,
> > but that's bigger task.
> > Instead let's make bpf_wakeup_sources_get_head() return 'void *',
> > so it's clearly untrusted.
>
> Thanks all for the fruitful discussion; this is more rigorous. I'll
> update v3 so that `bpf_wakeup_sources_get_head()`'s return type is
> `void *` and I can add a corresponding selftest that directly
> dereferences the head and expects a verifier failure.

You could also use bpf_core_cast() instead of using macros to read
every field, should be equivalent. You may still need the macros for
bitfields but it should work otherwise.
