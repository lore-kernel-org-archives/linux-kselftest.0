Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442998;
	b=PWmtPJUgoQtlug280B3DE/ywvO3Wqp4DBIJIXldGcpxIeRv7OcrbkXE1i7YSZIovgED1
	 NQ7KhSKa2XKheyNcz57K7m4qS3rk45UZJHzEfRZTYttuNMZXe3J558Rw34LUiqnj5HQB4
	 5x/3EQP7A3DySPwoYtx5BFEsV8k5o6+LCaoOJ2XSlJaK3w47fScyOcO5wuIK4t/ZSv2lA
	 GgFw7/fNi+XyF2BIvendBuIY6ot/6DNP8xZH3nieRvhDci314Ye9VxxhbuOT3xfAEbUTE
	 9F3kWwCyrvS769XRtD1k1poxh1uE354h1wqggXcDorp8bv5oWtriAxYM2XfOqJo9maA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OVzKGhTc2TdUCcheqmq2vHcetEiudrFJGz5SKyy8AVA=;
	b=OUKVgc6xgsPE79FWzcxKdP/kqpYzA06CchCvHnevy9xLjKQ+iVlBQSZkHIqu/cEv+uxN
	 zKPDmSY40wnIq6qGitZRnrVHbYEsn3S7lQM1LuCTeFTMF6+Rs334/7yj3qYpute+aYV1m
	 OkiNSZstzB58XXKCExXHpImx7THCkSKtSmRcUEv/kQiInz2LHSywYt+gzORBahNVqci8p
	 r2BFQbkYJ3bABoz1hEdP1uSRxVvGmyGSoc74fRCiRyZX3XaQKT5KkHRtq3b8dSFACl/Rc
	 BlMIEi7Ie99+qoJACTZoR/AHqEgdpqc3+xBnm3tjOqEJrpErvYRLMLKdT0dNhqLiTow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WPrbHID9;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F539606A689
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F539606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WPrbHID9
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso2203093f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 06:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795442993; x=1796047793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OVzKGhTc2TdUCcheqmq2vHcetEiudrFJGz5SKyy8AVA=;
        b=WPrbHID9L2Bx69Hoj9aaag8m7Nn82Ch5w/okkhQ85oOKWMS3hLXfKYlXvBZRskWL7/
         U7I35pQM1A5QNmxFmHpVwIryX8R1bmVWKp+yLFY5NPtmrMPaYzdT5soQm8z324suGSJ3
         48d1vc42UH/vNH4/Brsn8zFh1QffNx34CesHcc45DCscRXcrLpte2gZJ/slN+yl98ZkX
         vqDhgnTHIMhveLClYOqXs3DhOKdqlwiec7Aj+5XWH0YUpD2wUZXbv28JRCAWe/xEfAO6
         Oka6AhPr3d+CkXs45tKkclN1vdnzI6YDOkKBVuS+4GkSfds0OpY/FdqvfVtslxkWwULv
         8opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442993; x=1796047793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVzKGhTc2TdUCcheqmq2vHcetEiudrFJGz5SKyy8AVA=;
        b=pSUB83Leps4eALlJFwj2wwKNsokDjUbi4Ue8u5y0v6/btXDFH7exfe1tz+TU37XW0d
         nEu675e9///0vYVOdAeD26PfFYNJqNoGM8LFRQH5VUrZN1khMJboDLd6KEwtJnsILQfN
         qnK73/ilXy3SjTztaG/4mIFxOCoOInZaeIM+vSJ3JLqpf50QOa/JAA5QeiDWAB6cQfN2
         d1yHC9VL7K4v4ioZLE0wZJra6o09xh8gJUiFXIEQxx5I8gE1bwbLzeeWeBAWTuExN/5C
         8d0YOefTx4YaAmJedmZV8naRoRbWuYOujB4DwNVpHP5uzyfeVs6brFziOt7XYAlrgfyI
         Ul0g==
X-Forwarded-Encrypted: i=1; AL+hErHPQmi2jf4biyTCeIVif+VK9fo0N7mIVU9GJCrLxPPzO74EjodnkfrqZ1Q4c2ZKvywwhwaS/UYlzIJdhFIuJmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+3Fuds1Bm4mf7KTIKAnmrhSWhqtCQeuMdiXQVzWw0bDyO47TV
	hDrMqhV3N695ESs2yoohaSzcHekV6kqCv0MBGevmxPWOt42I/+eAbVwMDxxnz/6upEI=
X-Gm-Gg: AZFdTZcVydiN2IP/3K7p+9tw09BgtxXbekHJ7ZjKXQQTG8jrMHHBBlnNQKF71wYx9n3
	af4usbwd5p2RaRE6RIOY+GOaBgjHQF81oFakW2v6vYxBS5InXhJSQPNTYekV+tbDWwzmh1G7q4p
	1fMBwtCh6oP18R6Ai8OAZ2gLyiRkoa0RYGsaMOcz3jtKk408ZGvdOGAyQ6+fTbE5066Rg20thrq
	cuTGUsGTeFrgjF9IaDS/l7RA8GZnq5aRsCmhZ3xKjg6A1hVyhn1cPfrLFH1fm7EfKLVribnKGQ6
	uv/GQO9Pdy8OYw9iQwzsBeS2DuRly6/av5ObsSycPLv2ObFdHRyAFGMdUuXxFZu2wz3HwsXM64k
	0ijp1RD/5wUzPCyzHbv8h8bXqjqFtlUE6iie4LDKtGUd2/Q8d5czTMQquR/ZfgH60FMKEua61Xp
	mO4tN+gLwiJUPv0UgHp+OZY4z1AkNNX4REfVBXFlXMJioia01uVardrGqU6/xsCMTfWht9yu3bi
	ajwOutRWB6Zlcfyh1O3ArXoI6dfn/iw0yxSi17i5OwWnxTKY84ZnNx7BDfOGshOhltWQblJ8wkt
	XioYcDaJKLQqlRqwQF7XGAvyczaWaMo=
X-Received: by 2002:a05:6000:29d2:b0:4aa:831a:d0eb with SMTP id ffacd0b85a97d-4abb3c37a50mr15526213f8f.9.1795442993474;
        Mon, 23 Nov 2026 06:09:53 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm21645821f8f.40.2026.11.23.06.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:09:52 -0800 (PST)
Date: Mon, 23 Nov 2026 15:09:50 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] selftests/livepatch: build the test modules
 against the kernel in O=
Message-ID: <awRJLs-Ajbacirg_@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-4-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110161050.2451750-4-sashal@kernel.org>

On Tue 2026-11-10 11:10:49, Sasha Levin wrote:
> Documentation/dev-tools/kselftest.rst describes building the selftests
> for a kernel built in a separate output directory:
> 
>   make O=/tmp/kselftest TARGETS=livepatch kselftest
> 
> The livepatch test modules are not built against the kernel in
> /tmp/kselftest, but against the running kernel, using its devel files
> in /lib/modules/$(uname -r)/build. When those are not installed, the
> modules are silently left out. Only an explicit KDIR=/tmp/kselftest
> builds them for the kernel in /tmp/kselftest.
> 
> When KDIR is not set, use the output directory given with O= or
> KBUILD_OUTPUT if a kernel was built there, then the kernel source tree
> if the kernel was built in it, and only then the running kernel.
> 
> The selftests also pass their O= on to the module build, and the kernel
> Makefile takes it as the kernel build directory instead of KDIR. The
> top-level selftests Makefile passes O= even when it is empty, so on a
> Debian machine with the devel files of the running kernel installed,
> 
>   make -C tools/testing/selftests TARGETS=livepatch
> 
> uses the source part of the devel files as the build directory and
> fails:
> 
>   /usr/src/linux-headers-6.19.13+deb14-common/Makefile:798: /usr/src/linux-headers-6.19.13+deb14-common/include/config/auto.conf: No such file or directory
> 
> Do not pass O= and KBUILD_OUTPUT on to the module build, since KDIR
> already names the kernel build directory.
> 
> Fixes: c4bbe83d27c2 ("livepatch: Move tests from lib/livepatch to selftests/livepatch")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

The patch looks and seems to work reasonably well.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
