Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876617;
	b=FFS11k0ci0y6is9eLJH3rI+/TMjdQszHD7My0vCizk44HA//yFgRZZrnjeiuPrB5wfkZ
	 tIuCOpatZ1U3o0vrj8ILuodqOMJF80BdJXXWt+iaTs8aEtFlOSog0OKSJod411ytmOxmR
	 8p0ZZMjERkrZQ6tVKMtGkc931FlfNkp1i/Lbnu5sMgsDns61qTKzv88hIrOlcLdn95W6J
	 0jmGm26kEJAtkAP6aFwGmTycliKbqCVgF8+Asrc66HYiyn4DHYU8jkDHX7M5w4ownctI0
	 X2VwXTepuxRJOwLycDylQEvwZ8RaKobTyjY0O5YNbdZrz/rflCS9lK0lrwru0aP6c+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yX5s7D9zQjVJIVM16uZ610BYYXHAt3Bx8DUuT1rWOwk=;
	b=dIOQJkJyB4FHPvFK3QMASaJoZg2G+F3ZBSL9lZJ/hVOWULyXQ3sbL/GJl/MVQPOrVkbR
	 33MBj3rzjV8DRbKInz0eX/UM4umjrQTWaZKRzmpY90AH8j1ANaUSKxR0O0ufmwsQnowDu
	 q4nre2dsQKVerYfw3YAlwKpbFBJ7SgrJxvDpH8spOCJtRd7prmEIikvR/FM3ahjfvjxL3
	 l8j0irK/EvPWPMrFqQKo8sUQcuPtCBG2o18sm85cSoDu3L/PBmKWFNhbs199qKiIEkeVT
	 losnbReteWTZabaDamF1Ui/RIx6x2jBVfpMkCuBVUnGtMWPVMKORw2KlC1pIh+mzzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n4HtF/wU";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A5606A328
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 11:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D26A5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4HtF/wU
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1431825f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 03:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876615; x=1794481415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yX5s7D9zQjVJIVM16uZ610BYYXHAt3Bx8DUuT1rWOwk=;
        b=n4HtF/wUtAa+dXD9MvE3PvN5R0dmBuCwH8LXJ18qdQ/5bRA+4dbljhoIEgom3+FESK
         2nWh85oVjoLzpZHMpA0/L3sovQe7ZiDCnUTPEDhbMWDazfMNpbMspUxPucnV/qZDKUJl
         8t0ZZjmaoFqt5WNAK22Q2C54f5/ouNIv40UZZr5dm2jPlet5q+6lu8bHzaAfFcGqbERs
         zAavqTu8AWBewo6LC+jrAb31ehj12KXi17xfOSS8KIC2fPTyEC6KzgKy222X780JY2Ax
         zG6OgtpeUgrFI7pqPjbNjdvkucbxKIq2fWC68+GcPMaC61Y6aswfopL3Zkqildj5Xa+m
         q7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876615; x=1794481415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yX5s7D9zQjVJIVM16uZ610BYYXHAt3Bx8DUuT1rWOwk=;
        b=BEzQmsT8tF5lXXILoPl+wT6a1JMNlmdSSjlfGPgNneS7A4mg6axEgIdE/YZZkCGch7
         U5xB0/ssgSJtHqjYsZk3BBebE+PaZZfZfNtjxcgBokIiVSnViqUoVxf0iyY7B2QNC08r
         VJixztEsvNS14r+1yX8HBZdxOTO6NxD0hli5W73MGfukGhW1Prsl8uC73y7iDZlS+NC0
         h/he1qPHWrnQAuILQt66F0Ibt/JoWKmmy4fPT7CDRogf6pknCyvI4JAQxXlVwimOUH+o
         WXB3kg5oChScxZdsv1Bmhjgl57FElgDAg0w+RJNjI7rPNz1WcNiPd8CrPslEG8H9togW
         9GJA==
X-Forwarded-Encrypted: i=1; AKwUvBwazTxY/leQf/WnknXbp/P1cRcPqYmFhW0+Q42sW8oMJWI8byZ4PNV9tvhMulYi/0mZ84wkHC3O2qbxISopfC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ddmLuqDvZKO3Li3D+ZgZglLmGHicJrMsXwGHhgik4+06fcqiZ
	fb3EAlgBBzCer1CgSA7cz+6ylhQ7pT+wx0rvsd5lJ99F1fvA6nY2jBIS
X-Gm-Gg: AYBFou2pV91SQaSvJFtznSXCylM39CdnBASNj750ETzMl0Bd5awNo9tQu2MK6JFi6kT
	4YgdexGdEsp/eMpOAG2jd5mDAWJTGhFqtvaR2yNtOsGJZI67xUY67TE4RE0SKXQUNlNFCGDXbSV
	8fiox8hnAxHdXFyIjx+GTI7dhzcfx/bqgkqjLM5iqyqAjYj2QeT/PQYZtlx6jmEUlptBIPRsg/4
	nb9rTvoRqE8OAzf58emPcjbphpqf+W3PE0FNniA37I9kXhC4xzUILQXHwu5ll7t/E3fJst1WmpI
	Vk7BN2yxJNoGz0uz3z1vDc4I8X8M3tw0MhznNK13/VT7H+GQs3LXJKWS8QmPo5Rob+V5WrMPge8
	tj94jo9yLhYmZtw9ysMXi2KiQTWZI7MtDruu2F33insI5fOSjp91Pl3IA3+hbNMQEtCG5QZWwqZ
	JwlyNsmnHq0r99BkOrjty8q0qJkKiSUlQYDbZsakeBANtHSzlYg0YXxxyWxEjyisUpOdHyE9cLY
	jTadj7U0920XQZc74dQz/IBlpVoOYbqaykaGf3gFgeZZsJEidEqfPfzV+uhEuCOjZtpu4b2GlSq
	KrfCujK+DdlzPLEmGw/mqHUwNFwghw/j2/pC1ZZYJa4zV72JOvzYS6U7w+fdee9K
X-Received: by 2002:a05:600c:34d1:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ac183d136dmr405416325e9.24.1793876615021;
        Thu, 05 Nov 2026 03:03:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed084f92sm9474430f8f.29.2026.11.05.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:03:34 -0800 (PST)
Date: Thu, 5 Nov 2026 11:03:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Beau Belgrave <beaub@linux.microsoft.com>,
 linux-trace-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/user_events: cast pointers through uintptr_t
Message-ID: <20261105110333.0fa21741@pumpkin>
In-Reply-To: <20261103163913.640876-1-sashal@kernel.org>
References: <20261103163913.640876-1-sashal@kernel.org>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 11:39:13 -0500
Sasha Levin <sashal@kernel.org> wrote:

> From: Sasha Levin <sashal@kernel.org>
> To: Steven Rostedt <rostedt@goodmis.org>,  Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Beau Belgrave <beaub@linux.microsoft.com>,  linux-trace-kernel@vger.kernel.org,  Shuah Khan <shuah@kernel.org>,  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org
> Subject: [PATCH] selftests/user_events: cast pointers through uintptr_t
> Date: Tue,  3 Nov 2026 11:39:13 -0500
> 
> The tests put pointers into the 64-bit fields of struct user_reg and
> struct user_unreg with a plain (__u64) cast, which warns on 32-bit
> architectures:
> 
>   abi_test.c:182:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Cast through uintptr_t.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
> 
>  .../testing/selftests/user_events/abi_test.c  | 10 +++---
>  .../testing/selftests/user_events/dyn_test.c  |  6 ++--
>  .../selftests/user_events/ftrace_test.c       | 32 +++++++++----------
>  .../testing/selftests/user_events/perf_test.c | 10 +++---
>  4 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/testing/selftests/user_events/abi_test.c b/tools/testing/selftests/user_events/abi_test.c
> index b71813eaf5c04..21e1e3cca1979 100644
> --- a/tools/testing/selftests/user_events/abi_test.c
> +++ b/tools/testing/selftests/user_events/abi_test.c
> @@ -179,10 +179,10 @@ static int reg_enable_multi(void *enable, int size, int bit, int flags,
>  	}
>  
>  	reg.size = sizeof(reg);
> -	reg.name_args = (__u64)full_args;
> +	reg.name_args = (__u64)(uintptr_t)full_args;

I'm sure you can't need both casts.

David

