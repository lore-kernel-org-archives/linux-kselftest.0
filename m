Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB140B6EE
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119094; cv=none; b=V6Nj8D/I37luUKv1kQU8a+Lr3GFSBfykkUbTTVVR6B18MVob5FMjK6HK1ehzr8UlfN/qurcJV7TmGARr7s+5XBxj9QtxS1bVfpaCgLBWC5hdmghMJBPcO4Xf1A8fYbsuiSS8O4RZpq4FsuudlRbX5WYqz98tpkweo8vFOLhpZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119094; c=relaxed/simple;
	bh=UtOhj8tACoqtlw1hMQBUUKvYaf1dX1kM+5j0nTLO5r4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f/CIrOb2BvGY5UZicTgatk+MuqGrJIJ/mgVZ7+ytnAhW4N7tbFBsmPH9BjXffwiwniQ/BpocnG7mLC8O60wny/5taQXCOE+sFZmvjUdI0dICZxzFcn64aY9bRgrX4c2oLoX9WXbNSnTlgPSnariCpE1keQGByM/mOXccAcBJfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuXU6Kbl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuXU6Kbl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48372efa020so8449485e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 07:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772119090; x=1772723890; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXMv97b9KNqAU0cNnpTqpEvgdSSxZvM5f/4DMEg70Dk=;
        b=JuXU6Kbl6tU+d/b4+DTt1+J3xPCTEDSaGo5UBHdD+R/fWLWO9+G9Yzxn3q7owIdON/
         uNKFykF/JfkFiAf/VJsoKH04vdwVQZAO0HlLQ60bQZPI1Wa5wHGQ0Wji7LkOOZIxnW0+
         YEvKPJt/dZjAKPitMpvkmBxL93y+RJr6MbJv9XFa/K0usHYpphbGm4dCaO//ful6R4sg
         GsSHHncBsSztba1jRNOUTI9DP9y0pb63uHBRhVrXCcEUuzXziT/jNaGV18wKx/EB9oiY
         Q65VBPCjJ9G6pv+tyyvcw7QJeZ0tUGI4Nrf+YOTZ0GrKBYLtiOo3R4bftG+bN+PsEnH9
         v53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119090; x=1772723890;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXMv97b9KNqAU0cNnpTqpEvgdSSxZvM5f/4DMEg70Dk=;
        b=QwQaPI15ml2DSL1f1+yxysQn4LRYWR55TQLQohVjcSiSVmMBFOEIYMlB82vbGINXTC
         Dik8ioQHv15ZViKHGrhznIpcbGBkZ2sc/Hs/PjXI5Af9fr/XfEngVw4LyYqBAHKjC9oy
         XD4YfV7Htl50Xnslak17TwFoB0EJSQvIw1z3nLaz5F/k6JGqa1ofRpDWjW7AzCqB3Zr1
         Dxa2SCcrs1uqhqlwUzIGzo9GgGyMXxkUce4h/QxAhv6273WHhaUTKPtflCPp/BcGdPek
         7qBg1mkEbrdSIsKVjSEav/kamgezlTcN+cc96A2SDoAJyYJQwdreF96l7RbIh/jYTIeo
         kQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrJb+Nh8Y12DMDh850fJDZVTfJk/9iSevM442wir8hmCRd73/pGxNAK8Kbj397i8nE91NZ0hOxej8TfdB+rvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWt805/cESU6tsFPtloxQisTbtF+PGHETAeWCDh34WMu98mwZO
	PuuLxEnlqWa3YODIqqC/UqDZuiE1V8zqtMEy9MpUJKeIarhZI7fL3/im
X-Gm-Gg: ATEYQzzp8KK8vWfPVmegOEiu0dxhKXDmuY5iXo6akj2Q9ubLn9Dqb6EoLdWnefn0Yro
	189mjLiRWUiDfGp2KeQGRqOnMB7z3RyB+oYWDX03+JOxqm30B98YAAmy8Km55HycHYL52mvfpLf
	tInLsCWBDusL0bF+gAW0DbiI7rsudVxtDiiHEk96cetXzzPw1IzVJMJnqOxM7oMZ94EoSRSTWxx
	79s/b8sEYc0ysfgUNhb/1Y6ZVnkePHlmQiH2AdakFptMjkmnphhkTTong0sS2YcMcYOn1XP2KN1
	w4VsjV4+AZpMxYyKQzhK6vZ4Mmt55NWEKj2Cbs9qS7ZadERAliBNFLlGPksmbgt2BMSmgvRICm/
	QzyCcWT/xDegZZGPdAOpxLsCIvElIpnha6O+BGijSON/4Fjx1P/XScZS0U5dEbqt1I+uiu0Gu1h
	VwTolOsXIHFj32AAGrdK4=
X-Received: by 2002:a05:600c:628d:b0:483:7020:864 with SMTP id 5b1f17b1804b1-483c21a59aemr62238595e9.25.1772119089813;
        Thu, 26 Feb 2026 07:18:09 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::5:5405])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm162765655e9.13.2026.02.26.07.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:18:09 -0800 (PST)
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sun Jian <sun.jian.kdev@gmail.com>
Subject: Re: [PATCH v2 1/2] selftests/bpf: probe_user: filter by pid to
 avoid cross-test interference
In-Reply-To: <20260226093132.437206-2-sun.jian.kdev@gmail.com>
References: <20260226093132.437206-1-sun.jian.kdev@gmail.com>
 <20260226093132.437206-2-sun.jian.kdev@gmail.com>
Date: Thu, 26 Feb 2026 15:18:08 +0000
Message-ID: <87ikbjpm8f.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sun Jian <sun.jian.kdev@gmail.com> writes:

> The test installs a kprobe on __sys_connect and checks that
> bpf_probe_write_user() can modify the syscall argument. However, any
> concurrent thread in any other test that calls connect() will also
> trigger the kprobe and have its sockaddr silently overwritten, causing
> flaky failures in unrelated tests.
>
> Constrain the hook to the current test process by filtering on a PID
> stored as a global variable in .bss. Initialize the .bss value from
> user space before bpf_object__load() using bpf_map__set_initial_value(),
> and validate the bss map value size to catch layout mismatches.
>
> No new map is introduced and the test keeps the existing non-skeleton
> flow.
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
Acked-by: Mykyta Yatsenko <yatsenko@meta.com>
> ---
>  .../selftests/bpf/prog_tests/probe_user.c     | 27 ++++++++++++++++++-
>  .../selftests/bpf/progs/test_probe_user.c     | 13 +++++++--
>  2 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/probe_user.c b/tools/testing/selftests/bpf/prog_tests/probe_user.c
> index 8721671321de..280dcdb5ddef 100644
> --- a/tools/testing/selftests/bpf/prog_tests/probe_user.c
> +++ b/tools/testing/selftests/bpf/prog_tests/probe_user.c
> @@ -20,6 +20,11 @@ void serial_test_probe_user(void)
>  	struct bpf_program *kprobe_progs[prog_count];
>  	struct bpf_object *obj;
>  	static const int zero = 0;
> +	struct test_pro_bss {
> +		struct sockaddr_in old;
> +		__u32 test_pid;
> +	};
> +	struct test_pro_bss results = {};
>  	size_t i;
>  
>  	obj = bpf_object__open_file(obj_file, &opts);
> @@ -34,6 +39,24 @@ void serial_test_probe_user(void)
>  			goto cleanup;
>  	}
>  
> +	{
> +		struct bpf_map *bss_map;
> +		struct test_pro_bss bss_init = {};
> +
> +		bss_init.test_pid = getpid();
> +		bss_map = bpf_object__find_map_by_name(obj, "test_pro.bss");
> +		if (CHECK(!bss_map, "find_bss_map", "no bss map\n"))
> +			goto cleanup;
> +		if (CHECK(bpf_map__value_size(bss_map) != sizeof(bss_init),
> +			  "bss_size", "bss value_size %u != %zu\n",
> +			  bpf_map__value_size(bss_map), sizeof(bss_init)))
> +			goto cleanup;
> +		err = bpf_map__set_initial_value(bss_map, &bss_init,
> +						 sizeof(bss_init));
> +		if (CHECK(err, "set_bss_init", "err %d\n", err))
> +			goto cleanup;
> +	}
> +
>  	err = bpf_object__load(obj);
>  	if (CHECK(err, "obj_load", "err %d\n", err))
>  		goto cleanup;
> @@ -62,11 +85,13 @@ void serial_test_probe_user(void)
>  	connect(sock_fd, &curr, sizeof(curr));
>  	close(sock_fd);
>  
> -	err = bpf_map_lookup_elem(results_map_fd, &zero, &tmp);
> +	err = bpf_map_lookup_elem(results_map_fd, &zero, &results);
>  	if (CHECK(err, "get_kprobe_res",
>  		  "failed to get kprobe res: %d\n", err))
>  		goto cleanup;
>  
> +	memcpy(&tmp, &results.old, sizeof(tmp));
> +
>  	in = (struct sockaddr_in *)&tmp;
>  	if (CHECK(memcmp(&tmp, &orig, sizeof(orig)), "check_kprobe_res",
>  		  "wrong kprobe res from probe read: %s:%u\n",
> diff --git a/tools/testing/selftests/bpf/progs/test_probe_user.c b/tools/testing/selftests/bpf/progs/test_probe_user.c
> index a8e501af9604..4bc86c7654b1 100644
> --- a/tools/testing/selftests/bpf/progs/test_probe_user.c
> +++ b/tools/testing/selftests/bpf/progs/test_probe_user.c
> @@ -5,13 +5,22 @@
>  #include <bpf/bpf_core_read.h>
>  #include "bpf_misc.h"
>  
> -static struct sockaddr_in old;
> +struct test_pro_bss {
> +	struct sockaddr_in old;
> +	__u32 test_pid;
> +};
> +
> +struct test_pro_bss bss;
>  
>  static int handle_sys_connect_common(struct sockaddr_in *uservaddr)
>  {
>  	struct sockaddr_in new;
> +	__u32 cur = bpf_get_current_pid_tgid() >> 32;
> +
> +	if (bss.test_pid && cur != bss.test_pid)
> +		return 0;
>  
> -	bpf_probe_read_user(&old, sizeof(old), uservaddr);
> +	bpf_probe_read_user(&bss.old, sizeof(bss.old), uservaddr);
>  	__builtin_memset(&new, 0xab, sizeof(new));
>  	bpf_probe_write_user(uservaddr, &new, sizeof(new));
>  
> -- 
> 2.43.0
