Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796313;
	b=lbsiY2IpiJbY3jAEMJK54Q0ydgRQJir9Yipq58orHpbfa1HHq/qPktih48/0xQ2/UN2M
	 D+PmSoI6c/FP01YG/A+buGRet8Yw0pegNwwpQO4HsCniRmrK6yufXpB2vI1pJxRZz4+Ce
	 Mo17+il2PtwT0bHDHV8BdFZyfJrEgXd+T02xbTMEJcEfG731D4k+wz1FLyOS5ZUW2qLYT
	 XDRMhfYEOf0QF8XgIPAJjJIpnWNenDARxIfgwpOOL/uShPoafaJ6T4cgjF4O3Pz0GpK87
	 l0XoVCxeoAGboMhir7jlZqYbdNk9aHtCnNEz8PtkS+uk0tF/O1ISzPDDPu8/AVC9CFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796313;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6gHWPvZNXm1/ip60eIFXciIe68jdkeSrwUtnZT7TE2Q=;
	b=22JgfYPKv3vLHe9M+LLJuUfdEmG5urhyinFqLIlg0CmqESe1TD22PVAdGykHCbg28r8b
	 Loc8PDSTZMOWReBWSeNQDTXGQxq14PESJd+pm7nx1oUKhK4aL6EgK3qJBruAhX2fW8dUN
	 mTZzTcyLyjcrf1HR8/pOP3OVFNSa5kPfLJvf9X5dJUz4x7Ptm62BKDPWgHez+tQI3xVfP
	 fZLbld47Y+blSt6fPwiYE621PAIk71U98zwQakEPsFXi9YPr0X0z83Qs52yJcZkLBOhXw
	 aq+tJtbZKC4N5mQ9enB9NEcdOTX9TQEaUagjJdHQnlzJndKCIUIAr7sDYOEKM/mNDyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=OrYqVjJ8;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE25606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 02:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE25606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=OrYqVjJ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6gHWPvZNXm1/ip60eIFXciIe68jdkeSrwUtnZT7TE2Q=; t=1794796312; x=1795660312; 
	b=OrYqVjJ8vXwCtJQhS2iY16HmsnZJNLksEnOnV00Fn8V3UWRVnBmQy8/wjv5Er+U7OglpQ3ZKyMr
	yehbBC3vEmZashV4weiO610rS3kVvTBx4Fp8eBzwXoa/WgOLk+/goswMBwREKzzEUD7HFUOuuWifW
	LerHwW8AvgTUFG+HruIW8k5X7/6gCankf06wCXdFlCNyxECbv3pQh3c5OOE/cgSB5ur1wvQnz0xKT
	WU2rNZyNr/0zpuW3WaLGUzPsqP7Fxvs6+pGMCyw37EIr6+M+FOE22c8uUsWAEMzawMvW1AYTwf65w
	15HseUnNG99ENynbL+LZINnZ0CWYUulGtUQg==;
Received: from mail-dl1-f51.google.com ([74.125.82.51])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmVb-004DGr-Uy
	for linux-kselftest@vger.kernel.org;
	Sun, 15 Nov 2026 21:31:51 -0500
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3ada81853so2550882c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 18:31:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGKxe6G+ORxDz6rpRADPnc1G3uqxAGGOkXCw5r27IhfXoaZ265iZpvAAXjn5xwWa5VP++Ktv4oNgq4qNTvKn5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SCDb3yZdtBuFEMYGpCpuCTYiKv0JQPrwGyipjBwdf9jONa6Qt
	rYJtEM+i7lVueDGUyLkj/YkU8jCH31ccCCUaPv7DrTKCnQjGTLTEfSX34uOqguNPXjRnZRHYCLq
	0SUnYwLWI62hGIXUnblJs6GRNjgHesCM=
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id
 a92af1059eb24-1b503068235mr8029692c88.1.1794796311011; Sun, 15 Nov 2026
 18:31:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031161826.858908-1-nickolai@csail.mit.edu>
 <20261031161826.858908-3-nickolai@csail.mit.edu> <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
In-Reply-To: <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sun, 15 Nov 2026 21:31:38 -0500
X-Gmail-Original-Message-ID: <CADGQE7HyKgMpUojhmFJBRD1xLiPaBrc4_60yj=9+4Q6AFC4G=Q@mail.gmail.com>
X-Gm-Features: AclHuK_fTJKor30RYSxlkDn1OTApsOaQoTALBaQe3huilFGKC2-TOlZHcinNap8
Message-ID: <CADGQE7HyKgMpUojhmFJBRD1xLiPaBrc4_60yj=9+4Q6AFC4G=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests: riscv: test FP state restore when
 rt_sigreturn() faults
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
	Guobin Zhang <guobin.zhang@intel.com>, Deepak Gupta <debug@rivosinc.com>, 
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:59=E2=80=AFPM Andy Chiu <tchiu@tenstorrent.com> w=
rote:
>
> Hi Nickolai,
>
> On Sat, Oct 31, 2026 at 12:18:26PM -0400, Nickolai Zeldovich wrote:
> > Add a test for the previous patch: the signal frame sits on a
> > userfaultfd page that the handler drops after dirtying the FP
> > registers, so rt_sigreturn() sleeps in the middle of copying the FP
> > registers from the frame. The interrupted code must get its own
> > registers back.
> >
> > The test is skipped without the D extension or when userfaultfd is not
> > available to the caller.
> >
>
> The test is failing on qemu, with or without the patch applied.

Oops, thanks for catching that, it was a bug in the test (clang
preserved the local register variables until the inline asm ecall, but
gcc didn't).  Sending a v3 with a fixed test that doesn't needlessly
rely on local register variables.

Nickolai.
