Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82BF3F1ABE
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391835; cv=none; b=ibJ61GnQmP3qeiy/HXFfcvYPi9LLRX0FM/2JQDE2bGVLYlK6QqCtZLe2iVD47TMANcsOIsFp/SlaZxhx0aqR3fWRL+5oh0uPTqzGX1Pz+NzQCmKYMdfMpv3exT5nGuD83lg0N2QJcrvZ82ZbZQFbHpq9sMb7zHn+R9RWCN/aZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391835; c=relaxed/simple;
	bh=1vEKNs1Lv8s9RlC0dYldCjP9Clmvu1wr0qp2xUuHHc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8ZJzsv+8YxD518Ksv9ESH1ZJSr4vlFaCIE6BAc6SnZ6uZX9yWkSabNpQekHr3qa4DfuNMMmdptk6dbYCBbd6/G8ovjfV/uUUGWa1VDNfSpB26svKlOx9uk18wgPH6GfPBZNxJCIkgLyyIgY8m3+e8QvEWvdoPIps0L2uTiFx0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EltVEAue; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EltVEAue"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso3393731eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792391832; x=1792996632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKqh3a+klgRP2nrDDzvAYEDMhzyw7ysI9kOxZXjrT/4=;
        b=EltVEAue9+qEdZCyEXhFXWuM+w5R9aaFVdIOHoJnqbVHyCmt5nJDmj0cLPD4d0nru3
         XAE3Q79HfNOjKwJ5LiJVRLARO/nwaNMkmL6HxDL3G/5RSHpA6BVSpU2/Tzm+X86GH+Ri
         +fCbuUh2CUkHFf9V2ZMK41zTA3LWDPiZH/msDrN3WTyaLA5vK9ZK5aa+6b6enlNxMQ+f
         dwP3OPOqJnFWoEFHfJihzJvjHPntzkiC39iPARN3mCmeouB+GggaoV3UWnIvPdy/E45o
         q+ATdj36oQdbGXy6Bg1iGeGxY7y8oTUajP3+jYJhpu+RmtZptZyLkfTYAsbpYumA8KfE
         RgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391832; x=1792996632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKqh3a+klgRP2nrDDzvAYEDMhzyw7ysI9kOxZXjrT/4=;
        b=ApqHjgHH4DT+2hFBbKCAPOBZjXUoFbRyoremVV4L7lia3KDrh7aEf5TRSBimOU3nyS
         Tx80BZrqPtve1hNBU29qh0RfsmRyd71zrSGLQsbLLwkRiY8GlfaRr6SS/cCmgpiLp29p
         X0/fuu/xPne6wtMq2DdrN29M1EsSILVe2csmsFurgBUebj3F74InnesfHCzZBtbZ/wHZ
         bTZRCunIXg4GCaaG4tOtDePP4kO418jVPL4FvyB6i9+o9d479p8DcQCLBlZ8zIwYehzP
         luRhm0TPfNuW5Bc8X+QMaMk8a0sC6/WRv4QGLk2CIrYR8Z9qYdNnxQ3DibvthRDWrK4H
         ddqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMt3CQwI+ep65sEjNoqg+e/qhC9sSo2tEpi+Z0j1VDaZ+L+stvXFEaJL3gpuURWckL8uBlrwuFWMDVAb/UgPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmcs9qkFxxnYOcbxTHd3wa/NMlOvlgz1UO+V0/WLaDbR4A4w1z
	9lemjxoRu+SVDbYMPKtCdWuWoSQBgDpKz5ImwEW3UEhFUYNVWcrjpy+1
X-Gm-Gg: AYBFou2J7aNpgJpV8cMHeBPExXOUBOi5Gzqf7pInU0UuBa8uT0DGra9ebKy/Of+FAts
	UwDgEUiKfDaYdFMlHhVPsthx/q+QLSsJ40Sp+OJ1zmFilADXjsUqR/YL0HKt2Vm090osKFv0L37
	NnATd7EPJr6rdywBOY10gx1mmqM87PEqP+N9W3mmkQaTKqba13TiJe1hh9I9kWABzmCyB02ZzNg
	VWxFBy2YKYGYpu2HMPZ5tsTJyehjLyvkIMQkNWneATkPYSKal9fr7aw49jkLi4XZ70Qfa/SekqU
	QF6GjAQAeGW+oAel97FLy9oMGlTkFJS4cGcl/7UcTxzzzLe6ZJw6pXFgf7zuimze9WZHkwfqOLb
	gmUtm2wNXHbqjpTweciShEFxDy+XkDCdCFk4uMGb0efalsKjYOfl8hFZ2VDlzwvK7t9Bmpv/JjI
	JxnKR5Vc3MXxroOseoRcawBob/T0Tqyf8EYjTdRzZvbQ73H0k1nKEC9s+c0zV+cXo=
X-Received: by 2002:a05:7301:470e:b0:358:8bd2:fda1 with SMTP id 5a478bee46e88-361a2649752mr9635115eec.30.1792391831387;
        Sun, 18 Oct 2026 23:37:11 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm53697748eec.24.2026.10.18.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:37:10 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Run tc_edt serially
Date: Mon, 19 Oct 2026 14:37:03 +0800
Message-ID: <20261019063703.2144943-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DM6E35SUH95A.2B7HJ5XOTFJHS@gmail.com>
References: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com> <DM4FOVA9PW2E.1WIY5HRJWA1QP@bootlin.com> <DM6E35SUH95A.2B7HJ5XOTFJHS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 4:05 PM UTC, Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> The test is flaky without -j too.
> It's in DENYLIST.s390x in CI since Dec 2025:
> https://github.com/kernel-patches/vmtest/pull/418
> and it fails on x86 with ASAN:
> https://github.com/kernel-patches/vmtest/issues/503
> Both jobs run test_progs without -j. serial_ won't help there.

Right. I timed the parts of the measurement on a KASAN kernel, x86_64
VM with 32 vCPUs, 30 runs each, median (max):

                 before 1st data   shaped data        after last data
  idle           0.7ms (0.9ms)     200.08ms (201.9)   0.4ms (0.7ms)
  32 busy loops  1.0ms (4.7ms)     200.08ms (200.4)   0.2ms (0.8ms)

The shaping itself is accurate. What eats the 2% margin, which is 4ms
of the 200ms transfer, is what send_recv_data() does before the first
byte goes out: creating the sender thread and accepting the connection.
That grows with how busy or slow the machine is.

To Alexis' questions: the misses are small, the test reports
"actual 2 > expected 2" and -2.4% was the worst here, and they do come
from CPU load. Widening the margin would only move the line, though, so
v2 [1] starts the measurement at the first packet with data instead,
which the BPF program notes. With 32 busy loops, 100 runs fail 3 times
before and none after.

[1] https://lore.kernel.org/r/20261019-selftests-bpf-tc-edt-serial-v2-1-41c3813e7916@gmail.com
