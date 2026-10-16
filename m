Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DB25A2A2
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 00:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110681; cv=none; b=cJtIxzVwr9y5PJSBmrZ33uQGR7KgtRzahJCWxdwHOxCgGn0zrx9L11OnQmSvLotHJ2wmDEpbbRSNBGynT02y7eQkRJhI2OI+VwAZcqEpVGOqnV9cl45qk9GLQu4O8DEjgv/Dea4Xy6WIiljyDyCV0r6d0irpWmPz0IctBG3lmv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110681; c=relaxed/simple;
	bh=pPpVYZE37MEdXM4A+LvUAcPCWE74zNQfH8gS2u8rINM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=bpEEYbLQguPXHnFKr6NhUFROqFmZPUEndXYYDoy6O7fRKlAveyW21l2pO5xXekQVuFnu6p6IsO2iEyZvL2JB9eQ1a6mTLY/kjDb1iuG6Pu8W5bLVK9WWJ6QwmpnehA6PV0rx06ROYhOscdaaUDvBkPK9gGdLgrnsRzrpaig8Ybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA54Ps/7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA54Ps/7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89d6bd67045so314029b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 17:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792110680; x=1792715480; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPpVYZE37MEdXM4A+LvUAcPCWE74zNQfH8gS2u8rINM=;
        b=dA54Ps/7pR0FU9wNDr9tY3+FpNTxC29Ck0g7Lx9551UcjbWRuergvCfYwqHsLcci0k
         psV0muIX38K/9zdQFoVCKZE1QuBHSNFSNJcHGrfhYSkHKdbgpAR/k+6dEMK4jXpl6CeR
         dfOsI3iMB0v9G3k+hGqStjHifMQklrv5V3tG7rT6Pbl9WQl5Nd747zoKFCwZvskD8vcx
         By3uujNiVzEnkZnMcewEvCnuM9nwy5SvP8+Z2Yr+/OE+OmmWeJ89NDzyy7U4r8Y25AKT
         3UJ8/pWZLrLw6U69XeNrydWYhGkvQHY9JPqNx6eNd5x+xdTMs/o2QPCc8f1Z/n9d8dHN
         PmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792110680; x=1792715480;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPpVYZE37MEdXM4A+LvUAcPCWE74zNQfH8gS2u8rINM=;
        b=FtdtBtuf/izefXAAr6TZHY9dYGChL3S///pCgCxSW6bBUubZhaf5kf+XKJEfFTQ/zo
         7IHHei2jQtpIp+FQ5zvgmTfr1ZpV21gOtJst6+8uAevqxeC9XhX56rcWzC95QFETvBe0
         AZtb2Rlkk6+kZD/a3eGL41sklbRDzUoRLbwWticN8Sy6HvgFSg4yCQrqB5mwEE704Rdq
         aCFvXEC40Dzb4WKnhWRjP3cu3sAy7Lg8KrYdgbSc/XccIhozQG5aWiqpaSqLOwIXCPz0
         q21ZuiLimOvEXF9YpdRPTt5jpkLkPS6olCD4hs+SnyOswwRKwVJye+SKjj8vzCAbLxpN
         qjyg==
X-Forwarded-Encrypted: i=1; AKwUvBzs1uCLDBlE6wPMMO8VYpg1QuFN+/O+4QaXll4Uv6GlkuP+fkGwyilNquw7VnMdueZ5OLoLsNz+D2rmt2K/pl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdxu46LDuseYlglKJXE44cgHkDv2jNpn9Xf+6NjC8Ys2/dYwPe
	+tx8R0f1utsZSnfF3AxCh4McETbY36y7MaoRIEEFiIp9RWfDcutcl6Nl
X-Gm-Gg: AYBFou3RzEZtuusE1ldI+v8uYWW8d24Xu7SBPe697V64G235Z4SqsaEueUd3NI6czNN
	JuuDgHyNU41DLRSeKqCH8zd6WG9VwcrINyGkH//9W7pJ31Ygsxn3G8rNJuBMzB/Wph/J5bWqssZ
	4gJ4add9J67h9vJkOcKJ/W6FFLH0Dxr+TGvMbOvqkyO9IUIUCw/VEPzKhnmcrVXQp1zi2mTj/j+
	BCK2hZ8ldv3mYO8VgrU9GKIzyR0bSDt97nuMaGPKwtpqU86KTMumuM1jBgy+MoVGozwLx+BW0Gj
	bFO3KqAbAfK0xauRWjpo80Gh8ORwLAsgy1dTsqXTOI72VKx92SEZvJBaNaMaktNElHB14T9+dT4
	2FJJ5ZY2elELokdgWdKBlh4kUfo3txi29sAoUtwBQw5fJhyM4JmvZtuOikDDbVlNjaXEgAbRrWH
	UDroZE7oXMq/ViF2/JYxbdf2MqxkVtaUGJWadM2FVfsu/OaHqBBiWZrkJrKlQvx5/R5YI6F32yj
	EQarP92gj0sc75BmM6lbAOPVOL1LKW6Ft4w6kJPqYkT0+tpsk1323S4qH2UEMlexH/sTatR+Vhp
	JJ8=
X-Received: by 2002:a05:6a00:230c:b0:877:ce59:bd6 with SMTP id d2e1a72fcca58-89f1e9a1c35mr1115329b3a.1.1792110679891;
        Thu, 15 Oct 2026 17:31:19 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57947a64sm275547b3a.41.2026.10.15.17.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:31:19 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:31:18 +0000
Message-Id: <DM5U7S0WO4CB.72E73EAOUSGZ@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <jakub@cloudflare.com>,
 <jiayuan.chen@linux.dev>, <kuniyu@google.com>, <willemb@google.com>,
 <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 0/2] bpf: Fix iterator link update target validation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jan-Gerd Tenberge" <janten@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261008161309.8179-1-janten@gmail.com>
References: <20261008161309.8179-1-janten@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 06:13 PM Jan-Gerd Tenberge <janten@gmail.com> wrote:
> Runtime testing in disposable QEMU guests confirmed that the resulting
> out-of-bounds access can reach kernel-owned metadata of a separately
> allocated live map and cause a deterministic kernel panic. Corrupting a

Way too long.
The prog needs CAP_BPF and CAP_PERFMON and it writes past the end
of the map value. That's all that needs to be said.
See "Length" and "Impact Evaluation" in
Documentation/process/security-bugs.rst.
Trim the commit log of patch 1 as well.

pw-bot: cr
