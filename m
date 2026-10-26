Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030706;
	b=ZMElDvddfCgDYvZgypc3jsKAHxjL3K4uJtdPZJRz0klYO05wy9BsQU61oaBFQbmiaP7Y
	 tmrmXd5Gct4tF7wiIzewBuBWlZdVCx/gebPnVioELC39QJy8wm4gGRJi2/zCYIMkSKSbQ
	 FEtbNIAj4kCfbG8KNsT8K7maVmM9EYk5B8gcgUl9cOCjGXE7WzKF5nGoqGnsPoX76QpsF
	 KjtXI9UYyitLRye/HUeDiRiTEiqJlkojz/4KESbngC+tn2jHbdMERAx/Gerqb0V2O+nib
	 iZluTWRbzflKzVrannBlqQV0j+ZOIvqgi7ULfq6m6yXjHUXE3PdByLnwfestLz4vujw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030706;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+mbVUoKBdE6KSwCa1KjlE4qlF+uVW0Yn6RGdS8Kcq3Q=;
	b=Dr+zhBTjM1Kw5ufSyH92Ux3OjgOOoq+8SU1E+rvSlNVKEXr6GlmuLGvp+K+L3Blcj7Cj
	 i7kCWAX92XOpkASgk8BYluuXYg+XFTz3PcWWayyjrxZFLwAHMMvw3S65fZQC20pKY9RtR
	 xh3wr2/jmLYy4UMb0R5ctvi4Qv75NuYE0xmxjB+ieGXupmj4/WCIvwIqNU+T9ijQH7R/C
	 VBG3p1Hy8t5cvCR8dzbZZQYCM7lkQ5eb+5UFwsqppM3AZzxkK80qORZXO5429nZtzEfxk
	 rOMdQgmpVnAwy/9bfrJ1xZ+65st3/xdqTuDZYrxB9KC/g0O3dthOMgK1VdUzBN9h7fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=exn0Di9p;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MkCg8maX;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CFF606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 16:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=exn0Di9p;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MkCg8maX
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F32237A03DF
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 12:04:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 26 Oct 2026 12:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793030699;
	 x=1793117099; bh=+mbVUoKBdE6KSwCa1KjlE4qlF+uVW0Yn6RGdS8Kcq3Q=; b=
	exn0Di9pL4Oj2HSLmiYGdEjCEaSSZKCvnMxdKvPGoJkwqHJAlGdEs/iLaBSEbPbA
	1tvQAc3FysQi30gi9BNgGK/X8O9LooHssgi1wtrmE70+EXdK6nPYxdZZcmL07sgT
	3HMNhTCZreUKbgbv9lkeBDz62RxiLeqhH6wrrdUMJkx4XSHoypnjKf933BWV5+3Q
	yAlAgqXWiStyiyOz3WfNc1lsHtqrbe8IXpi+eNKX93I691nCRYbZgD4cjil48r/v
	VXzBp4a6kX5RZPUzx2wwGrx7vc1whttoaLyh3nOqIKl+2iuPMn8dju0AK5Tt5PjT
	hurCoAjGTOEIhqvDN5zsNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793030699; x=
	1793117099; bh=+mbVUoKBdE6KSwCa1KjlE4qlF+uVW0Yn6RGdS8Kcq3Q=; b=M
	kCg8maXoAyUX2upOhxJbSPimRW4ZzL6xM2cdI7X1gdMQFbOsDCpjx19xweMcpP5p
	7Pcni18cdVYu4KjTEnyBpniu0wO9ZH8EEzcOpS7HBPwMUQ8OYNGA+XYJpo0BjKv/
	L+pdyGsFmXQ1zrq215RyeC9Y91A919SOoQ337V0NcbPgkjF9mLbaVtgQHJI5HNyl
	vhkozWO0j+S5AYpm5Oe2GplA/SdwGhdiNdThQ5yZdT2eeonoOVxZJgDFKa2Ex5Kc
	YZVJsVNFaZSdIhK9OMDnnJcwkDd3SZ2WMGo7rclypzupMGnX6yFY8j8v8BDhszF5
	03YsduPMNXALdxAlDirPg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793030699; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:jyFP7HCIHJToq2AgnesELQuHFU3rJfK4Qlnzk2MNJDlrN9q
	3a5WA/XJfr1a10byxCIAFCsh+t1Lklw1SPCRmhw2fn6+y9WIFrW18wRKZj3kvkJP
	6joT/Ni83LXvASfzHEmqkiOo6WrpmCwB+TXQ596HyX2N3rxxfGvTonwISBZwz4Mq
	MlH994ojxTjx2sclGc2DasKZi3949VRd1eXyR2e6DaODW/8qxZOsiSooboY1B82C
	/3lw/huNiSaCRKLEPmg4s5Jm+gJPW8fRbnxfgXbwBNwkHg+81jSiDY0krD4Xcr4Y
	JRFW3ZT+//j+oWmMTLHBgu7Z8dqsroghsrRqh+Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:tTFMYvSqapPZOB/UKLUWFxsjGzfu3KZ6J5FWIIXY6F8=:OwGxQ/9A6oVbYPHd+uTXkjuOSw1etK4j06eXrgoQykE=;
X-ME-Sender: <xms:KnrfaqU7r2QCJQC6u5oc4G5Bujd1Hqu_DEBWT88P1cyge33UKBiFKw>
    <xme:KnrfarhY222LQMrWAvmFxsdT-4_gZ9dS0GwkhkA-IbLE3UOJXc0RQlX9HfH80tZ9y
    66KqaNvOUH6y_yxJNq9hjY9Uf2Mm65adwhESO327jHoZevz8zBDAA>
X-ME-Received: <xmr:KnrfaipGOrPoPqIYhdzos5bq7mFD2-gHB3yixH6KkS9iIZEY90vtVZlZUz3KCz1cYPVrMax2_Azj4QL2HTUKC-g8rUhXZz-A5glQBP_eCURe-VD1MA>
X-ME-Proxy-Cause: dmFkZTEln/Sje8H1mMXRlZ8t8Jcq8lNad3Mi0AhTuZx81p/TbquQVrsbxjLERSTSHsuJEt
    VIuLokm2IZXQUUsIm9+spq4I2oEqkKw1BwJnZdWzRBgqNy3ad3FN1gZ7YSCAt151Geqb2P
    WZzzO5s+yb68QEMDE8qkzsghu10IGHdWYS9Gmr+IeUGTyOJ2gtLYpM8B77B0n395wXU0Bo
    Pj8pP7Vul9ngCRszVSxKq2H6NIb8SZGeniRqoVJwMwdkBQNOiq7p97SV7eUw/ikwiTPKUy
    oVzsV/R87nRUs/SlnzUEZVcXm35f/D3qjySyq5pjAhgLX5cMe+Z5fz1pyWxhGGZNGNtnHt
    BjOm5KO1JhHeOXcJzXXXW8VnKrv8L1Km/lR8SzaEubhQqmAyMhYyh8MV8hsPK4JsqKbI+k
    1zRjM3OOF+4u7zuV3ONQGyHTYPwm5SVOtawUjrUw4HvrgfLVpJuJK6GMQW/b1NrNgBA7Gg
    bDoLI0UOz+kOD73b9PIi9X07WNe9JCDOJg+F7xaI0qSFb91WEdTpqAW5tHalmfI0xlhtHr
    z8mKqdsZiMfRtujirBi5WL7ncIT9FZg+MlqqK69DOzXuoKKg69x8ysh5oRk1Q6CT5UYNlg
    feigEl8rwE0Utr3opMcAn1EEyz6XkEkOCNYRbbyF6fksLE6XtbHhE2Jjk62Q
X-ME-Proxy: <xmx:KnrfahFSM9eBAZbKdKsN9qpsgo3ktruh-pxdRo2Kt2ZimaACbCdoqw>
    <xmx:Knrfan4zSOtHy1K9E5fjYZ0S121CaTyBvFHliaGu-T666lV6kOsbQQ>
    <xmx:KnrfapcH9T_GNdd_UWM30lKC9ygMjx190ryTA9yguQYRRZC0mXmDgg>
    <xmx:Knrfai4eAMUXF0FmX-QsMN3_JTCcmn1QT148B43FpuWDgCLaEpvT3A>
    <xmx:K3rfaszh-jK8FayBdJs1dIbgmk1qpYWNXxfzU-UC1rn1JXqTGzgIoQoN>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 12:04:57 -0400 (EDT)
Message-ID: <1c71c9a2-e3dd-4edc-a467-36b389b02d92@bsbernd.com>
Date: Mon, 26 Oct 2026 17:04:55 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] fuse: atomic open
To: Jimmy Zuber <jamz@amazon.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jim Harris <jiharris@nvidia.com>,
 Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
 NeilBrown <neil@brown.name>
References: <20261026151828.562870-1-jamz@amazon.com>
Content-Language: fr, en-US, de-DE, ru-RU
From: Bernd Schubert <bernd@bsbernd.com>
In-Reply-To: <20261026151828.562870-1-jamz@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/26/26 16:18, Jimmy Zuber wrote:
> From: jamz <jamz@amazon.com>
> 
> Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
> performance. A server implementing FUSE_OPEN_ATOMIC will look up
> the name, create it if O_CREAT is supplied, and open it in one request.
> 
> The reply says whether the file was created, as Miklos suggested in [1].
> The overall pattern follows his sketch in [2]. For a cached
> name, the kernel compares the returned nodeid with the cached one and
> looks the name up again on a mismatch.
> 
> A server without FUSE_OPEN_ATOMIC replies -ENOSYS and keeps today's
> behaviour.
> 
> Tested with a new selftest under UML and KVM.

Hi Jimmy, I will try to review today or tomorrow. Did you see the
Sashiko reports?


Thanks,
Bernd

> 
> Changes in v2:
> - Drop the d_drop() before d_splice_alias() for an entry-only reply, and
>   use d_splice_alias() for FUSE_CREATE and FUSE_OPEN_ATOMIC replies.
>   FUSE_TMPFILE keeps d_instantiate(), as its dentry stays unhashed
>   (NeilBrown).
> - Describe what the server does and when the kernel checks permission
>   in each case (NeilBrown).
> - Check in the selftest that an O_TMPFILE file has no name in its
>   directory.
> - Rebase onto fuse for-next, which has f1ac607f786f ("VFS: enhance
>   d_splice_alias() to handle hashed dentries"). Accept a fuse_open_out
>   without backing_id_64, as FUSE_CREATE and FUSE_OPEN now do, and test
>   it.
> 
> v1: https://lore.kernel.org/fuse-devel/20261020141647.3271341-1-jamz@amazon.com/
> 
> [1] https://lore.kernel.org/all/CAJfpeguEK4JsFo60=yHkpLL6XkDGS7cQ5GOhiFL379KsYk0TsQ@mail.gmail.com/
> [2] https://lore.kernel.org/all/CAJfpegvXtXY=Pbxv+dMGFR8mvWN0DUwhSo6NwaVexk6Y6sao+w@mail.gmail.com/
> 
> Jimmy Zuber (3):
>   fuse: add FUSE_OPEN_ATOMIC
>   fuse: open cached files with FUSE_OPEN_ATOMIC
>   selftests/fuse: add test for FUSE_OPEN_ATOMIC
> 
>  fs/fuse/dir.c                                 | 354 ++++++++++--
>  fs/fuse/file.c                                |   4 +-
>  fs/fuse/fuse_i.h                              |   7 +
>  include/uapi/linux/fuse.h                     |   8 +-
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   3 +-
>  .../filesystems/fuse/atomic_open_test.c       | 518 ++++++++++++++++++
>  7 files changed, 841 insertions(+), 54 deletions(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/atomic_open_test.c
> 
> 
> base-commit: 9b1da7b4a4e197072e630c3b85d4100a399752ff

