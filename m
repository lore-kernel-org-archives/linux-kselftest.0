Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017613;
	b=WrsfaIE0k/S+cKjcVRqGxUA9uhMQJhyTTfc6GlHKwVdWdVntsldkJFBpVUuAixp0KFxf
	 PsXMLHrViJ4lsviJhAAyDdPgeGyZcoH/FAtd/Yjn6Gb6xYO3OVFNr9nBy0LhTk4A8Yw1T
	 65zE9qACBTmuGQ2ZrePSWTbeFdgaGqwsvhCWrxMtv7ojoaGB3JdklNVsNXSCqwpIngLDq
	 mj0FRvDsNFoxk5Us5osHwyM24MYRYOFjUsklvOCViY5W+B3efbYdMVjxHwVYNoU+SAu1v
	 uYO+Ns8MryYOP53IVviogfR+ZBfdzBlDcYX3r6q5dk8OrqgHHa+3n8Y5y7t9plP2T6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gN7nvCApkpNJjBBl+gdS00SQSe9taX0A7DICocon5Uk=;
	b=T3NakQ+Llz7zkEvIiUmDukoSFotsAK4WEXq92WXKelhx0hpdsUsv9SCD3DesPRU8hoyQ
	 k1xZ0/FoF0vggx3ZQHZu3Uprzp0wuel/zg7omP+jHRi0vsrp0xRu9wttHWs4qcZwZjfro
	 7EaCWtcU1C+l7OuqTg8BTcxJ4CQFsgZrdgJK6V1/Zjb/G+hCKJHLe6dbcsXvVZzswpgiz
	 dB8SVn6rSvEfNn2AFqZwHBJnaGXTVUwYtcrHwBwc0hhKjpFSv5bDtRk2QLzk/b9TO/cFP
	 ha2dtuv/Is3GJkGGA0YWqiWeeJXUMWC3RzLquTxVYUdBSWzb9GnYAbsWbp+dCim6Qkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NsaoKX6E;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB7606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFB7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NsaoKX6E
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so810812e0c.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795017611; x=1795622411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gN7nvCApkpNJjBBl+gdS00SQSe9taX0A7DICocon5Uk=;
        b=NsaoKX6EAyelKGC7l/g5UCQwSZxT96lYF7VFxnW5gSG2311qNRFlOqNKdjyxXJKTqR
         35qBeVSVK9m+dZiXVDJiEshyPwANzNbvsSbLVHjyQRJpEr99F+JM6h7XhzWzI4D1wHe6
         /Iss+aCOeivtGBs6O2ef/O4ssse4QU60KE+KBhlHL66dvHloRnS8CDdDDyzR0ZNrGVSe
         OzrOqDkYGUAgn+f0n1btObMOFOB5Ep7+bjDAiVsVnkDNAU4xi/Fn5HLCpXxmSmSbS4Mq
         2ypX/3wo7vOIxcHZPc16/J1ASVucuZPlGKn7YuIREhosIdqy/jmzbv9DdnHLiWCmIKeY
         J7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017611; x=1795622411;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gN7nvCApkpNJjBBl+gdS00SQSe9taX0A7DICocon5Uk=;
        b=kgA2ZIORFlRyU6HtiwgXKAeromGbwKa/CN1E1pnyJNJXzEpuz1rCABgdjKqcGi3351
         YfbuWXFmDL+U1MJPxZLaa1q+5v1xKvr1p7R8X3NctcbsuKTjgZOkXgz+pGrubArXZw5q
         1nw59w9L4goblFhrloLMO7SNqa8lX02mjLyyRRHl8HkjaUgUe26GdeHs/a0fPe4Mh845
         TRT5Vj48iaTX/BioEsCPkd+XEp8DBLY8crHNWZoggwD7D/ZdcAk+jZH2uxad3QQwcsXK
         Z64sTGyfIUZDplxzcYMB8P3f2VH2EbaaTDjXmGBgS6Dp1+fNrnxd4zQaHoQZ6TMryAA9
         6kxA==
X-Forwarded-Encrypted: i=1; AL+hErHV3g/nINuKsyxjx7pJ6ak1aN6LVGC+DlBREeSxrCCZPkcCkdEjWIRnryorHFJFHz0fqME9rfhqPM0TLWM6lE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pysZR4dIbQTGrPCfKap1jEfRo2KvUadCyavsbEniJioqAFZHZ
	x9EqFYOLlNP7+3+Ex3AzQd6LUNB5uvyT2AiERK2r7f+ruQ7Guondax3KCw5vnIqOORI=
X-Gm-Gg: AYBFou1Tax82IEINar7/DxTxwWwV21kRUUuFXAiSBrSvy3Zba05l0J6qmbY5jZpfxVV
	nVXNMt4crAZNx91SZK3AcuoG3VD4udT//4JlkGkn9gdUoTTnEwpwIPxMJ2hNk3KBr7tQ7wBBo4+
	JBYsnhIbYEAPGLQBMIKWJJtJDwEPM2eB9pKz+0WuhUb4+SgRFwmSurCNS7yQTKGUI3Pv9PjSdMt
	O/M9wnLFU/4bX18y+IFx31KDrp/7hCf46gm0VYf4JsUjMNVEq7/RHBQOqNrSJvsmZuZ0KtCPoIF
	Hdrly4GHEZnQX43XH5KbUlCSbWmZTce/xh92c7ZXwT5G6QcJ4Wt9Sac5bW3U59tNSyTgxMLXnLW
	v5KgGZVlsKKgd+9b3+qQ+0pF/yXIprH2o8zd5cal0QmJxFz/tLt2IeR+4AnREaWZ1/eGMGCzHL5
	gszcXmXEIpG0tHZB/1EhH5D3D3qlKcunzo1vS2TvnbparTtrmqbwqXelhsRoXSlAnFkcKY4lam1
	CbN3gOSmCjv0aBlcEWxmBsEQI1ENNIa+wd6IivxKPJG3hZbl36qIhCzzZIT1oZ0jT2LaTUE2nx1
	iJrT0K5Q4cqhdrnGsagm+W9ldJ5yYgTSGjJgCl2ePmHfqIG9Uou2vibJuUmbSmfm2SF2x4zhfbr
	mNUkTONVSH1L2CkQU2eO2DiH2lUcxe9NzyJ2C0LOD5CxFY1A+p/d0QEaQZPrm+UWu+U5w
X-Received: by 2002:a05:6122:3a15:b0:5ea:389c:51e4 with SMTP id 71dfb90a1353d-5ee645faa03mr1663031e0c.2.1795017611348;
        Wed, 18 Nov 2026 08:00:11 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ec2730sm2002506e0c.14.2026.11.18.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:00:10 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pratyush@kernel.org, graf@amazon.com, shuah@kernel.org, 
 Chen Pei <cp0613@linux.alibaba.com>
Cc: guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261118091603.979-1-cp0613@linux.alibaba.com>
References: <20261118091603.979-1-cp0613@linux.alibaba.com>
Subject: Re: [PATCH v4 0/4] riscv: Enable kexec handover and live update
Message-Id: <179501759947.250261.1712117569683645423.b4-ty@b4>
Date: Wed, 18 Nov 2026 10:59:59 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=yx/6YU4ftdolIH+TM3tFCIqxwpFna+tV5pnuszpTgAM=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq/cuKW1Ven/TsYWcH9R9JVtNZvIr/Wrzbj9eUF
 VZnu673CJ2JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCav3LigAKCRC7dyhM23N6
 3l0zD/9GkT2xiw3xOPo4dtrl50v/Zo+28SEOr65ml35aBi52o28TK4homX8OAljUtDYygGhutpM
 WxnvBmRGuzLI5PV5A7/SV+WgkIZ52fXibj+mPS9LI2vYsbaTB7qWpXD/tPjUXOLL3sp8s0nWgA/
 xzgDZjJbri0YhMen/qMzef3v9u09p3Wn4uVIdtlK0LLcBqgYpEtW1xCFKqg8Plgdmm8VzBkMBqm
 201gts8eO1QmJ87giSN1+mgcvDTecZXC7TLBmWsfh6zueYb2h7iy18luOHRy2FcgK/fG6x6oK+/
 q5kb3mOX9vuWeOn4JfkYG9JvRemmTyttU4mvzXS7wc56lZd8ObMBpcWCRJaliTNo4Fwky6rrbSU
 ubyyFqvQGzUjfL2/Rp3rc+Cie1RnXgh0XXw4RSGXf6YrqAi8dVFfXKbWikrk5D9dqJ+2t6zEbFK
 +GHKpssJeeElG+UOr2KEGjpeWljj+Alhh73XBEVezYA9oWQYDth78nJKELwFtPq8Xcfc4Br9O1V
 Iu1DpxwaZOV4fUHtQpY9XdoUQSLklPkalqeaaIppy2vDIKY2IMWWeLNhVX7XrCsNIO3L/BO4EIS
 BjJYaBZ3qqGAfTeisqH8//T8U/uQq7h8rHx7J2zXA1bXqN+ErinqAopKFwtALn0trP8D1sYJivX
 Ntme4+UlYo8oAIg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 18 Nov 2026 17:15:59 +0800, Chen Pei wrote:
> riscv: Enable kexec handover and live update
> 
> Host kernel updates in the cloud should not require draining the
> machine: next to live migration to another host, replacing the kernel in
> place while preserving selected workload state ("live update") is what
> KHO/LUO were built for, and LUO's documentation names hypervisor hosts as
> its primary use case. This series closes the gap for riscv64 and
> validates it with both upstream test runners.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=liveupdate-7.5

[1/4] riscv: Call early_ioremap_setup() before parsing the DTB
      commit: dc821c9badf7b2558e206804c2adaae28d25477d
[2/4] riscv: Add support for KHO
      commit: 48ea610913a6d6fc513d082afad04ff342120931
[3/4] selftests: kho: Add riscv support
      commit: 30c6fc85b4fb89fc867bdea413403bf169e7e194
[4/4] selftests: liveupdate: Add riscv support
      commit: 9615c5074cdccb651684e61cd8872ca8b0b30e52

Best regards,
-- 
Pasha


