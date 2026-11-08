Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794144005;
	b=STTIpz3tfRNnovD8ipRgzLc20qhRic6BdfrExBiscK8UGCHpnzMzo2FaOmh8ynePN/fn
	 y+zZsrng2No6/+DrWdXAOtTU5C6vYlWeEuv2L/P8wF+w1BAhymeTEjzrcIxkrhbEnNxjQ
	 MGm0yuhDe5kuwY5pfp/8DGRHyQJUm7a6dRsR6oBMCI8R0I2fXS1HCU9Pxc89k7rXV6yH0
	 9uAcm+2XSs3Ibrn9LczlCJxxZEmrxXdQf6GgNR3QIO3x8qPExUI8lw+AWj2zJqm4uuUEl
	 1pGpkDa334EybLSnQcgi3du2VDOfmS6rvr+dQBGBm1+U1oQZyrepkWGC4bXqfJmUKQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794144005;
	h=DMARC-Filter:DKIM-Signature:References:X-Lms-Return-Path:
	 Content-Type:Content-Transfer-Encoding:Date:Message-Id:To:Cc:Subject:
	 From:Mime-Version:In-Reply-To;
	bh=glAGYBxr9sTII+Z0+FTDJt+J6Ci+v2krTtxy4Ai80mU=;
	b=bJWux5+E4cdzoHcOkbSgJU/WWQja9qgxR4bbWK2ZVzrq7HE/Yp77JvQMeHwwa5fqSLG8
	 UfP5I5WuiVCiYZuThCcAf+pQ5/2g8VF9KgtQbYEoU5LNAuwXJzBsrl4+BL3mUvNDpvpUA
	 Jwh82TC+T6doR8qqwkjsAM53ON+yS5lT8KLxyIaHVs0s34m25n/XunXGv9FmHYqou5bBe
	 MD0O9lWTzIR9eBW2MXsV8SAuJbhCsa8Oruatl/GefOolrzJUudv7/Ki0u3qrlm+WB2nxj
	 dYd+to+xftVZsZBREuVHOJatm48p/lxEVO9694OAgLSeSPvFVFOOPOVz1lTdlUTtL9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ghfWUstJ;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E11606A335
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 13:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E11606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ghfWUstJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794143996; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=glAGYBxr9sTII+Z0+FTDJt+J6Ci+v2krTtxy4Ai80mU=;
 b=ghfWUstJZXjjA03UMOezExuNjOlqxQin4oay+mC/Q2cD8//ZBP41m91NYYNsj5rbPAUwG9
 xit7MQQIBFkrOShE5Z5XtmIEecQ3K55WPR/05whzi/Yf7XdX9Yxl70eyRtRSQEQXBq/W44
 IDheuMaRBDdq+4dM3XJ/0IAj3HdbG76dGQFGDL6yQb0lfxpN/VsKo01SN6qyRVlwQJxOx6
 XeMthFW7awi0NBGkXMkOP+M3p9iywQZZOWPdG/r9AGHmQxWDuWyHjB125wUoka8hrCaJy7
 +6L/xP+AOHFu6JSe1Zrx+xXYmew06tG+EerM4bUmdLCdqlj/tCRp6DUDRwMFgw==
References: <cover.1793604327.git.weiguixiong@bytedance.com> <4f21cadf18325a5829a27a8cd7107240e8e92c7a.1793604327.git.weiguixiong@bytedance.com>
	<ab483f3d-e036-452e-bf58-6c87e59ae3bb@intel.com>
X-Lms-Return-Path: <lba+16af076fa+e6cbf8+vger.kernel.org+weiguixiong@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 21:19:52 +0800
Message-Id: <451788d5e97cba38274e663d2b7952c593e959be.48cfd4ee.a91f.48fa.aaeb.1a775cee80d6@bytedance.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: <x86@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, 
	"Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"Chang S . Bae" <chang.seok.bae@intel.com>, 
	"Shuah Khan" <shuah@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, 
	"Guixiong Wei" <weiguixiong@bytedance.com>
Subject: Re: [PATCH v4 2/2] selftests/x86/amx: Test dynamic fpstate cleanup across exec()
From: "Guixiong Wei" <weiguixiong@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <ab483f3d-e036-452e-bf58-6c87e59ae3bb@intel.com>


> From: "Chang S. Bae"<chang.seok.bae@intel.com>
> Date:=C2=A0 Sat, Nov 7, 2026, 00:41
> Subject:=C2=A0 Re: [PATCH v4 2/2] selftests/x86/amx: Test dynamic fpstate=
 cleanup across exec()
> To: "Guixiong Wei"<weiguixiong@bytedance.com>, <x86@kernel.org>
> Cc: "Thomas Gleixner"<tglx@kernel.org>, "Ingo Molnar"<mingo@redhat.com>, =
"Borislav Petkov"<bp@alien8.de>, "Dave Hansen"<dave.hansen@linux.intel.com>=
, "H . Peter Anvin"<hpa@zytor.com>, "Chang S . Bae"<chang.seok.bae@intel.co=
m>, "Shuah Khan"<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-=
kselftest@vger.kernel.org>
> On 11/2/26 02:30, Guixiong Wei wrote:
> > ---
> > =C2=A0 tools/testing/selftests/x86/amx.c | 251 ++++++++++++++++++++++++=
+++++-
> > =C2=A0 1 file changed, 249 insertions(+), 2 deletions(-)
> >=C2=A0
>=C2=A0
> The code looks an overkill to me. I also considered using kmemleak, but=
=C2=A0
> this vmallocinfo looks to be efficient.
>=C2=A0
> The other way would be adding a script on top of a small change to amx.c=
=C2=A0
> file. See the attachment.
>=C2=A0
> Can you please try running this on your side and see if it works?
>=C2=A0
> PS: I sent this yesterday but it didn't go through. I switched *.sh to=C2=
=A0
> *.txt in the attachment.
>=C2=A0
> Thanks,
> Chang
>=C2=A0
Hi Chang,

Thanks for the suggestion and the test patch. The AMX -> exec reproducer
does exercise the leaking path and was useful for validating the fix.

I tested it on an Intel Xeon 6519P-C system with AMX support.

On the unfixed kernel, three runs of 10 execs each consistently
increased the __xfd_enable_feature allocations by 10 entries / 163840
bytes per run.

With the updated fix applied to v7.3-rc5:
=C2=A0 - three runs of 10 execs: no increase
=C2=A0 - one run of 1000 execs: no increase
=C2=A0 - 24 concurrent workers, 500 execs each: no increase
=C2=A0 - the existing AMX selftest still passed

I noticed a few issues in the test harness itself:
=C2=A0 1. test_exec() waits for the child but does not check WIFEXITED() or
=C2=A0=C2=A0 =C2=A0 WEXITSTATUS(), so a failed exec can still be reported a=
s success.
=C2=A0 2. $NUM_ITERATION in the single-quoted awk program is interpreted as
=C2=A0=C2=A0 =C2=A0 an awk field reference, not the shell variable. It need=
s to be
=C2=A0=C2=A0 =C2=A0 passed with -v, for example:
=C2=A0=C2=A0 =C2=A0 =C2=A0 awk -v iterations=3D"$NUM_ITERATION" '... iterat=
ions ...'
=C2=A0 3. amx_exec.sh prints "[FAIL]" for a detected leak but still exits
=C2=A0=C2=A0 =C2=A0 with status 0.
=C2=A0 4. Failures while collecting /proc/vmallocinfo or running amx_64 can
=C2=A0=C2=A0 =C2=A0 be converted into "[OK] no memory leak".

So the reproducer idea looks good to me, while the harness needs the above =
fixes.

Thanks,
Guixiong
