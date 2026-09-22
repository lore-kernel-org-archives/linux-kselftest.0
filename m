Received: from mail-oo2-f12.google.com (mail-oo2-f12.google.com [74.125.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BE44973A5
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 18:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101898; cv=none; b=sSzsOtiuOoZCkMFlx7Gu2RsOS8gFqIZTN7FFwxv6Mhzu/MOLPEbeanfUBPvNq7o/1nTkm0L2ebipQBzCQ63ia9APLzIA6lk6KDMbQz1Iyv1sBfPt6USkZrLhw6/BPXIECU5LVS4VJHGx4w/aZWdQ7p3SfmyJx/yTW7nAT7yPEvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101898; c=relaxed/simple;
	bh=yWlRsj2VmYWLEwsE7rqPaBEfZ0LkFJBnk3HvMYu8raQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BpKj0L//vxGX5azPssm/nRoMGTbAU8o2gI5vGe8g/5ufPlqOLAKmuaK94UQW1trig2uAP38lxRSsgsZQ7G643uVGQ2lX+Sw7jga1eJQ9Z9gLj5qZiYZeJc4ziWmbyB3RUlOl97oAshhgRph6/5JbDCfVUoZe71osWFbU4k4XgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=p+jsXQLT; arc=none smtp.client-ip=74.125.231.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="p+jsXQLT"
Received: by mail-oo2-f12.google.com with SMTP id 006d021491bc7-6b1ae6f5fc5so92291eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 11:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101896; x=1790706696;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yWlRsj2VmYWLEwsE7rqPaBEfZ0LkFJBnk3HvMYu8raQ=;
        b=nTwU3r+TfZI7Aeobuv9cVbo+IgysIAbx9tmal3g84aAusrr+lSjFX/yTv8aUJLsDEi
         RrSwbCVaF8TnEI53RaVKzPVtexmy8+s7f7NPKFjZ7+pwrfTPgiuMnOHn1tqyTqNtxrrI
         Mtr58o03F4XKCaHNH+nEfB/+8OD41179KEwzfUMJCb0a2/8HwaqpA1ya0GJtlzo9jPeX
         Jz1MxZ4iTP5LDb1IeEzzPDlpxB7c4ll61OFZX9LgA1icZSFDNJxCDwHuL5GhaLUF66qm
         atEJtenUP67fQi0Ql2Fv/Dtfe+t1dWyBxANfE0/aJfI7EKhzX6PbHAMKyOY6V2m82lNt
         FWug==
X-Forwarded-Encrypted: i=1; AKwUvBz6mjVFtBwxoGJRObaYRaZi4TaKkjgyGWR+x9dlwIH6rnc4E6f6nYHYnNRME9ZgRCUT7NitruJ1ReJcCeCg1rk=@vger.kernel.org
X-Gm-Message-State: AFuF++m3XfHDB44BouX8iM/8ywfUqOHCHnIpTuSptCXqeKtNxdPwkSkx
	fRH2rGS4g42shh5HlAQygvkqcnK6LX1gtDAGrXUiHOVkz1f6r5lVBWgA
X-Gm-Gg: AYBFou0+/k4zkbzAGSdK9t8rVDAZo9pvAzQTJjlnzgDWPmymLDMrFEncm8pvzptpJID
	TI6JIGaIN91f68rvtkCp2MiSlter7rEtbHKbU/W+ZG2OAIW/RzCcFRWfdZrnYoNxmlr9iTN53pb
	0YRlgNtx/OEc7dmOcTBSi9IQmrRev+NYjR49Vt43hesJ+VQQh/x8BkkGwrl3H1YPB4gkt6oInvp
	mT2vorhRSBNr2Ph4YHUYS9irmeFKSSU6eahEpIaDGuHWNwrlmKVrvRIcmF189Ba4Bj6NYldEBhJ
	W6oCrkL8ndiexwdPa6D1djoeBpDCaFs0kGYWRx3F8gu/JXcGYpGjkY/mOQ8ZKM98XgyP8BIbPFw
	TGQOMeVxQa7Xe97HQ5IisnsnFJ8/lfAd+/p1UCx+ozHPx3ur03U93U83A1KBENV4fNm756yHHqE
	7fxBv30DPjYQwHkZzzPgiuSUm2MD2qmfwom+Vf373iY5NnEZnCNkzcJKxyAAzyBm9Sd4aEdmI4s
	YqVxKNLaUFewQR4hwy6sp7EgXOUZsWnpR8XLUpo5E7k/jv44Rn4glcyp1wb4cR9t6tt0z+snbz6
X-Received: by 2002:a05:6820:f028:b0:6be:7782:5a51 with SMTP id 006d021491bc7-6d2d00467cbmr250934eaf.10.1790101895616;
        Tue, 22 Sep 2026 11:31:35 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908efd733bsm365466fac.18.2026.09.22.11.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:31:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71C4F60C83;
	Tue, 22 Sep 2026 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1790101892;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yWlRsj2VmYWLEwsE7rqPaBEfZ0LkFJBnk3HvMYu8raQ=;
	b=p+jsXQLTluWpAJryr4dItCOuD5oOk7c0F0XWrvwH8KuPw1Uo7Aoo1Xkhyllm/UlJNsKRKl
	KQKeLR/aP9kkfHLTTTJon3wSf/dbQ68sFzUWJKdleVN6q1hQpZKMNCH6jXmRMPDTA/LXpF
	qdfRU3hEqou5I2Xim2B0X61qErlldZQkSsGsxhoMtnsgDsN7fI+YGEq56l/WuiWTCgPrWa
	eCYLSa8fSDDZgU3Dhp7X6V6XtR/3Jyq9/AYhDL5znrK5u/QZgwIv83c6u8dFClMysUC+Vi
	QiEoa/qARYboYVuizRS+UEgWXbf4WlGrOowF2DU+WhNNdqygt8F0ZEFSn5CohQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 15:31:25 -0300
Message-Id: <DLM25PIKJTE5.1Q1IO5PAM6VBD@marliere.net>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Song Liu" <song@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Nico Pache (Red Hat)"
 <nico.pache@linux.dev>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>, <ihor.solodrai@linux.dev>,
 <nickolay.lysenko@gmail.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-16-ge144528849ba
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
 <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
In-Reply-To: <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Sep 21, 2026 at 6:04 PM -03, Eduard Zingerman wrote:
> On Mon, 2026-09-21 at 14:40 -0600, Nico Pache (Red Hat) wrote:
>
> ...
>
>> Given your series was defferred, and there is a "rewrite" coming, what w=
ould
>> be the best approach to working together (between us three) to get these
>> fixes in that series too.=20
>
> The, "rewrite", as you call it, had landed today.
> So the series in question can be re-spun.
> Regarding your patch on top of it, it appears you can just post is separa=
tely.
> However, I am inclined to be confrontational towards changes like this on=
e.
> The purpose of the selftests makefile is to run selftests as appropriate
> for current tip of the kernel tree using a very specific kernel configura=
tion.

Ideally, if a Kconfig symbol is needed and the kernel under test does not
have it, tests are skipped. But with BPF they were simply not built,
rendering the tests useless for anything other than in-tree vmlinux with
tools/selftests/bpf/config*.

> Main users of this makefile are BPF developers and BPF CI.

But they shouldn't be the *only* ones, IMHO. Enabling distros to build and
run the tests is also valuable to catch regressions in their kernels, don't
you think?

> Support for distros customizing the makefile is a non-goal.
> The "PERMISSIVE" change done enough damage already.

It's ugly, I agree, but what damage has it caused? I see that it's going to
be reverted anyway, but I would appreciate if you could elaborate.

Thanks!


