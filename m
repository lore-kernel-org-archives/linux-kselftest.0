Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3A10F0
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788837003; cv=none; b=F/sJvYVcxS2/35nbvDskyg/PHzE13fMeHnmpYbQSlpkEhwOixQWh5tzqA+0A4FiqdsLDheYCAbJWofTzkt0COG87vqsj2ZulVGekayCZceavBzdZd8N1RVnhpwMHzWoei3o+yzdedNePdCoECK4b/Dmpc0L/Sd9P9ZHoAoVOe6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788837003; c=relaxed/simple;
	bh=NIZ40nNzsbeeL8cdyy6ZKPpOyXaqocZlHwIU4WgHUck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXBNqRpaa9PtIyc7Ki2zrycR/BeJfFgp+08J+62svJXE85idcHM9YK2eUJ2IJZ2DX7Rsz4MAZlVDzyAnaYFIpMXW3Z4T5JVimNiIL538u3PLvAovjIgAv8oOoBMp9x7JCMlo80jdjG3Mg8t44LQKflUI5OZMZP3GvtQzX2qfU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/NFaiyt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/NFaiyt"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d942c7cc2fso33775645ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 20:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788837001; x=1789441801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5udmBuXlTT1GwJow6bPNXuqCwSBhZgjyh+ECHMZW2WA=;
        b=Q/NFaiyt0R/bL+cvpQ0D5PaxfS/njeOH1Jqycs9RrJj65O63iB9yBlZxCETd+uttaW
         f6lKbbKrdeiA/eTJbydj97Bhc55S4wzidP/cChT4D8/7jkviHA7VAbxwh+YwWxQmXH+z
         xQk/XsGiOplS+2Q5NJqQJESnKC8cErb8IAsFcPegb8lfwhflYkFPSzGQ+5GQn/BujXFe
         TPOId7vkUHzeKeaBdLuKranmAx4HjcZej7Y0KtAKNKaW2xyRtmg0bMaB/JmFHZddFHrx
         zakmmlPaN1TXnhJxj8zo8s1u/l2tVlb7xwt2Re6RVZb1nLIQ33+Bc464g4YjAFntW5Nn
         HiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788837001; x=1789441801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5udmBuXlTT1GwJow6bPNXuqCwSBhZgjyh+ECHMZW2WA=;
        b=TyaxEpgv2g7IHk2hqjFvpHPWL6CmhmA+OBrdIjwx+WVtP+VjiuWTl/OHCnLDlSvTJf
         +N2Qhz4MHw+/TuBOA0pDZ2arGsUnHYpB8Nm4Ee4CrWAdisAx60FWIXI33Lufrjhppu6/
         D1UtaZS62CLcKSNwg8ZHw/6rP7Pvw+oXaWraDndqRfbwP8SvuuG0EtgBzQr1+eroVHQF
         ZGJ+kxcTs1SamrJwGTvE014CD/KzMxKeswCvtM98WGhLxOscHLMEZNSieu2BNkf/5vmL
         Bri6YORQX4EGALEMTuynNcr6k4rfTVHk+Q/4p78ksb06SNd0KBR+yfsQ10WHgKva2lvc
         bfKA==
X-Forwarded-Encrypted: i=1; AKwUvByYIGmmWtpXM9gDALiZyKNu+pTKHlZXIqKz+hHNEr0DBSKnAKMWmOchH7w+aKekql7yBjf3wPHQ4aWLqf4xjwI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6OApivh+peMGd9PR7/rq+svUVwPlb4HB53ak4cTQanAKPRYzQ
	4dmAq4qy4Ss5tvR1EffnK3SEWjPw7qe1ycmlWf6aWChMQ748jQhH2Zoi
X-Gm-Gg: AYBFou3GEgRnZfbbkbX52sb3pl1slTfkwl74bsMq2X8iLudmq+mRT7wtngDU/7r8RLI
	kHitZFPymsNSFyFbIWw6vU+10jc7VkCZB478YTA37s2BsBU3cedJmNzsKhADBo1KUBezNv0Pg5j
	w9yy2VBYUV6AowpgEKgrfjhTg/1P+VNZPk/wMz14x603bUW/VMaRlOE+Ht8/UHeUKgwqncIwGxw
	eR3FYOeMW9BZHNHPc6Q8u0YdZJsewNQmIZRyTRru3QoMZjK1kOC0KbW17COUieuJtFz9Hq5scUi
	F5HYXF9QH+uu7PxdfUDSfc9za9ragxVR+etXJYgQIAhXtPQXD84zI7M+UrKun21NkSxs80A0qeb
	1aLBxJQs523QNQQXlV7LK0vbzBA/uKxXWPjt9+xlxZz5p9f/pIte3+R5LZBMUN6yu81e+qtDa+h
	KMtwE9W4RS88Zj/gse9sSJy1Er/xWRl+RHoySqa+TS5yXTg4KSCI06r2tIo9HAcCU0J4peG636k
	0o=
X-Received: by 2002:a17:903:22c8:b0:2d7:5ebe:a588 with SMTP id d9443c01a7336-2db126d6e31mr377723085ad.13.1788837000864;
        Mon, 07 Sep 2026 20:10:00 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:3fb3:b562:896c:1ac7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cb603sm51255985ad.68.2026.09.07.20.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 20:09:59 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v6 3/3] trace: add documentation, selftest and tooling for stackmap
Date: Tue,  8 Sep 2026 11:09:38 +0800
Message-Id: <20260908030938.14046-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908103514.a1c61f51b84b8d67d6f0f511@kernel.org>
References: <20260903132409.270195-1-lipengfei28@xiaomi.com> <20260903132409.270195-4-lipengfei28@xiaomi.com> <20260908103514.a1c61f51b84b8d67d6f0f511@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 10:35:14 +0900 Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> Could you decouple tools/docs/tests in independent patches?

Yes. v7 splits this patch into the documentation, the userspace parser,
and the tests, each on its own.

> If each test has this volume description, it is enough to split those
> tests in independent patches.

Fair point -- the three tests cover unrelated properties and each needed
its own paragraph, which is the same signal you mentioned on the cover.
They become three patches in v7:

  - basic functionality: stack_id events are produced and the map fills
  - reset semantics: the map is cleared while the ring buffer is not,
    plus the binary ABI header check
  - instance gating: a secondary instance exposes neither the option
    nor the stack_map* nodes, and writing the option there is rejected

Each lands after the interface it exercises, so no test references a
tracefs file that does not exist yet at that point in the series. The
reset test's ABI header check follows the binary export patch, which is
being reworked to a streaming seq_file export per your comment on 1/3,
so the check will match the final header layout.

> > +    with open(args.file, 'rb') as f:
> > +        data = f.read()
>
> nit: Can this support input from stdin? If we use this on android,
> user may want to do:
>
> adb shell cat /sys/.../stack_map_bin | python3 stackmap_dump.py

Good use case, and it is the common one on Android where pulling the
file first is an extra step. v7 makes the path argument optional and
reads sys.stdin.buffer when it is omitted or given as '-', so both

  adb shell cat /sys/.../stack_map_bin | stackmap_dump.py
  stackmap_dump.py /tmp/stack_map.bin

work. Reading from a pipe also suits the streaming export better than
the current stat-and-read pattern.

Pengfei
