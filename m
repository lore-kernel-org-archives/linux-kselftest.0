Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681030;
	b=aQvSVOIFevjRe31kCVdpByC15JHyvmxWriKuBEhwxasTCo6wyJwm1QVvu6KBErthNkN7
	 ai8rcc3ih03jvyJZI4bpMwE3oeg+X7WTEj8YQID3dxpO+Q2evObDqnSlqlDnKI1VAQtZd
	 C63oRKR6Xha6D4ZA1c3K24alic0MgtBd+N92XS7PfZNaU6Z2VyS1TJj/59kw9a2swH1Cf
	 lDvLnGHJbaP+AjZ1hsKJEtycCvwk+nBXtq5PB0z0SzCYpXpw8S3G9euMlFHsDdBlDuItF
	 9vTEb7Qx0/iK+pb7YNvElVgw/WKioVWLgpHuVaWVGgmMMX0Pdmd9+PVny8zoQSaY6kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681030;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-ZohoMailClient;
	bh=chm5h2uHfD3RH+9tEQ3/9r/BgZnc+Er/3JnIdSdTH3c=;
	b=EwTQa10EPxBBJj0sC0vmjbEwRn9GuGH5GWPFBSm/ItAyXDfFQDkTqpYz87GhaFuz2d1b
	 /SlGUlu+06hYg88JWKmciU5tNY0K+pHUJlnyt6AaMtStZh0+DUEfv4BmzxhfvbgrWPsi6
	 kD2v1TYH/FU04rGJ1kXL17TycUYXM2ki2sIUtpAptTiTqL4nhx1ZmNMN/BlQAiX9xnDQZ
	 zy86oGO3yf+6332MDgA6ISAZY8IonxPqk66FUS1apuLFwmXEZF3Dm6Hsxo+GDWBm8lEMR
	 /oh9QpNYULEjuEKWfVFGfvjCqtHWJEGJ/BYrSRWNPaOgfXKteYip60TzVuNxqrTHkhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icenowy.me;
	spf=pass smtp.mailfrom=icenowy.me;
	dkim=pass header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b="TgZD9Fm/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.107
Received: from sender6-pp-e107.zoho.com (sender6-pp-e107.zoho.com [165.173.180.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C730606A31E;
	Thu, 26 Nov 2026 08:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C730606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=TgZD9Fm/
ARC-Seal: i=1; a=rsa-sha256; t=1795680952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d28bMu5UbSY+z1mtwa0xXUQcF8yk9IUj5LS6t3JrWYwOHkC+hr0xyrmXnVk3XefB4U01tg4JY9oUmJ2pmwwQCC1w07+PN9rroRizAPz8r/3hJdFLNw+HGhtlYwvnbKFLKJK7PbkGOwRI88tonwdDzqe3MNiyEPSu5buXesM3Ig8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795680952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=chm5h2uHfD3RH+9tEQ3/9r/BgZnc+Er/3JnIdSdTH3c=; 
	b=R5uXGTCQd1wF0QQ3UjnjxlyZ6Ou4OegdQH3DOVcQLMpBxIXaXFYEotwzmN2jwiBN9E9TVlxeC40GnTaly8SkM1nAaxJ06qM8vwsMIJSRxMuDV/9F2bA5ulF5SlvBsT7fIQRcQT5KeM+XDYof5Mk6dzMwTbfY7+oaikpXfI1KIF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=TgZD9Fm/kI6BAnhbIxWr2/n62K2qAEesbhtgfUoLbKty8IEP/wm51K9zk0vpaQDVxeq0QYDiaT+xsSrkEzauZkrfMM0EvmTgBaXRQ1U+8O3rx6DjPmq79+Ch2Hd4YdKdwkcvquUcAV5TamtUVJKbQMfgi/np9/GeBqlHSISaGG5yvTunk4quLux579CabkCN603iLPUES6cgfmcR3r1+TLc3y3LVyQ8kRrh6NVknF0TtqrD3zw+ENCx0r+OvLkKdIKHiBFEIDd6pV0dDKPcHVxoYmCXqd+eNq8ZTcqAS667REextyAijtYFS2JxR2NsDSB5nok/gTbzLFLyXaGv52A==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=chm5h2uHfD3RH+9tEQ3/9r/BgZnc+Er/3JnIdSdTH3c=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795680949924288.2188422629731;
	Thu, 26 Nov 2026 00:15:49 -0800 (PST)
Message-ID: <dd22bc951015aabf3bcc86d3c16074d3eb23a070.camel@icenowy.me>
Subject: Re: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
From: Icenowy Zheng <uwu@icenowy.me>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Randy Dunlap	 <rdunlap@infradead.org>, Radim Krcmar
 <rkrcmar@qti.qualcomm.com>, 	linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>,
 linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>, 
 Florian Weimer <fweimer@redhat.com>, Peter Bergner
 <bergner@oss.tenstorrent.com>, Zihong Yao	 <zihong.plct@isrc.iscas.ac.cn>,
 Mark Harris <mark.hsj@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 26 Nov 2026 16:15:37 +0800
In-Reply-To: <4ea9d48592dbf0e1120f7db7305aae37.guodong.xu@oss.qualcomm.com>
References: 
	<20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
	 <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
	 <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
	 <4ea9d48592dbf0e1120f7db7305aae37.guodong.xu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-11-26=E5=9B=9B=E7=9A=84 00:16 -0500=EF=BC=8CGuodong Xu=E5=86=
=99=E9=81=93=EF=BC=9A
> Hi Icenowy,
>=20
> On Mon, 09 Nov 2026 23:56:47 +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-11-09=E4=B8=80=E7=9A=84 07:47 -0500=EF=BC=8CGuodong Xu=
=E5=86=99=E9=81=93=EF=BC=9A
>=20
> [...]
>=20
> > > +enum {
> > > +	RISCV_ISA_BASE_IMA,
> >=20
> > I may have missed something, but would it be worth to add a GC tier?
> >=20
> > I think many Linux distros have GC defined as their baseline.
>=20
> Thanks for raising this.
>=20
> A single bit for 'RV64GC' seems to have no user to me, so I would
> prefer not to add it. Allow me to explain.
>=20
> G is a combination of extensions defined in the early days of the
> RISC-V ISA spec: the unprivileged manual defines it as an abbreviation
> for IMAFDZicsr_Zifencei, "our standard general-purpose ISA" [1].
>=20
> I checked, and you are right that it is the baseline in practice: GCC
> defaults riscv64 to -march=3Drv64gc, and Debian, Fedora and Ubuntu
> (before 25.10) build with that default. But my understanding is, G is a
> build-time baseline only. Nothing checks for G at run time; on a core
> without F, D or C, an rv64gc distro userland just takes SIGILL on the
> first such instruction.
>=20
> Anyway, what this series intends to export to user space is the profile
> level (RVA20U64, RVA22U64, RVA23U64). For example, a glibc-hwcaps design
> can fall back to rva20u64 when its run-time check finds no rva23u64.
>=20
> PS: In those terms the counterpart of rv64gc is RVA20U64 [2]
> (excluding Zifencei, which the profiles mandate only in the S variants
> [3] and which, as noted in hwprobe.rst [4], is not intended for direct
> use by user space).

Yes, I agree that RVA20U64 should be exposed instead of RV64GC.

>=20
> RVA20U64 and RVA22U64 came up in the LPC26 discussion as well [5]. I
> would like to add them in a follow-up, probably not in this series, if
> the reviewers here agree.

I'm glad to hear this.

Thanks,
Icenowy

>=20
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/modules/unpriv/pa=
ges/naming.adoc
> [2] https://docularxu.github.io/rva23/rva-mandatory-extensions.html
> [3] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc,
>     RVA20U64 section, the note on Zifencei
> [4] Documentation/arch/riscv/hwprobe.rst, RISCV_HWPROBE_KEY_BASE_BEHAVIOR
> [5] https://lpc.events/event/20/contributions/2626/
>=20
> Guodong
