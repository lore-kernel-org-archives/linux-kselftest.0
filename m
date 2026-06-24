Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1282DE70D
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302096; cv=none; b=YzBpot+a3wSRKXJZSy+ZkZjsYgDt8wKWMXvzVauxaMzksE1327LWsQ1d+fKgQt9bpF++xQCs6VHbWDEkOVQrMU0IlPpwnw+0YJ3rorTaYCH/dNAmkE48Vo85Tgkq86jP0DVM2/ySoKPg9zCz0GqOSYUB08Lprntt32rLv5Zna0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302096; c=relaxed/simple;
	bh=TMWGjgzhMSCfw5zila1yJHv6X+TiVrsYoTVEXvWsB08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZTYwJgCImwuLjM3MVNgJPnIp2KYYyUPTZUZbbeQYT0S6mcZHFFjtR+d5on8n9cZPh2K3H06b2IaCAZXbmKov9Olp9YMei8KwAGnunpNITc8VnQO+NXJHjfVYlCYjbHIWfXC/1djNWHylys+acLGHpDIDq8W8eEKTkUNkQTScx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6FK7+8v; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6FK7+8v"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37deb2d3a28so258327a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 04:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782302095; x=1782906895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8Vn96XVnW2krHp7V5/fKbqoj2TgGkav7pxGg+ctypU=;
        b=s6FK7+8vdlP/evJWM8aQW2cyHOMsflq8dKm8WwRbi+F7V8VLeElkpZxFrPZBVC6pqW
         Bs3+6AGNzUCzjWFhm7z3y4mKcDT4SkInzd+tYK1tPxdwOy/Oh12ASZQRtlWFSR9HOJII
         ZW3rkC6prJLPzeeKTmOj5q2ZJ58oKJSS4SYVphU7HGrcuriGpgTZtTsa7gGGOmL9x9Yp
         gtCI92QTrZn9ic5MvuqW2Uz3GeTuR4J0lo09dNXZBFDE6ztKrAA5gE9I/KCbUvh2sbN6
         FGVV4FOKOWT8R9UW6aed3gndS+nfCvR84R+MrFMG7PgHeeNbCOHnsjaZvD7zPRX+leM4
         DDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302095; x=1782906895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8Vn96XVnW2krHp7V5/fKbqoj2TgGkav7pxGg+ctypU=;
        b=MLSmfNg2Tqc7Rm5cWxg72dCYG+yofyAcLxOM5sXBdYvW+XsXaVeL+q3KGuWA9swyhL
         IJoa74Az8XW1yqMHuMl3BXEajGANKdPL588vFYQc9TL99f6o4tvFccE5Dg2F56V6lVYi
         v2cD/y8fRDajW52epfpc4S2CwjTgpcSqqJaZ/IheJkVum+o9ruKfBTqEckS+ytoHHr77
         Vd6clANZgg8SkvxnOqA3KSuAjtLPAheK+o+VcS97Ed5x8YaUOUw5RMMYXvSTGaiEevyd
         FF7tKJ234s/mqk+JQD2U/oAm/3RhFTUWIh7EiD8ZJszOiJaIsB5a3wTFC7Y91wWq9pZJ
         6D8g==
X-Forwarded-Encrypted: i=1; AFNElJ8PmdOwQ9NNZZJRkmU22ajIdYahDJ1aJFQM5bB8bMEB2V/h7Ny68BkG+d3AWKU34ZlAHB+Ch+31ddxQeK6Ejqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy160ZkOZmdw7G9MMbTLQVyhrv/y4/QOlnLD0QdZO1GJStAw7xq
	ytfsdEmD8Eu8POSsx5wiN/dnrZkNxGllqHW+DUCS4ojiH5Ig3O45d+2N
X-Gm-Gg: AfdE7ckDoo2D4wMPONbR+MgFZ3qUdFsjCryw7sC2Q9T9E+Ghhn+5ufe45r2A9h6QuiH
	IRBN66OgXDnKEReCUUBJ5Xo7RvQ4X5m804awQmVcINq62SaP5gXtEUydKI5lYynu7VSPlEevLaA
	Vrx+jSWQMd1gYwAo5EawB3ZMiP77ShzInleATgC9AUGXeyVI0+9MN1aWetMLEu7io7EtlisXvVp
	IIylFVQ/ghMOMl3NuRjxMDfGjS7OBbJmLng7/0rdjNNsp5YT/+9Nvdpz++Y6subvrD4gB/m5Ewm
	dlk/oyQYzC/ExPjTO8P5fXcoTD+GnEGpylBEgfxVHcZOKm+f7JBmWTVnz492Nx88dnCRNGDDqa5
	xLpNS1ODpE6kylsEdr9wp1GgzUAaAs7XJwrN+78WoxHM+wabq1M1Y6s/aSoCXt5vyZs+b8+c+ef
	vPzCy6O9eZZGldXP+C2jQYnozq0obIbMwTn7pQejBBYYEInmbEKOxlwIf8gOkp
X-Received: by 2002:a05:6a20:b7a7:b0:3b3:f46:1ef3 with SMTP id adf61e73a8af0-3bd15239141mr9670702637.41.1782302094539;
        Wed, 24 Jun 2026 04:54:54 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c168sm12708560a12.20.2026.06.24.04.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:54:54 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: toke@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	yatsenko@meta.com,
	leon.hwang@linux.dev,
	kpsingh@kernel.org,
	a.s.protopopov@gmail.com,
	ameryhung@gmail.com,
	rongtao@cestc.cn,
	eyal.birger@gmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	dsahern@kernel.org
Subject: Re: [PATCH bpf-next v5 1/3] bpf: Add BPF_FIB_LOOKUP_VLAN flag to bpf_fib_lookup() helper
Date: Wed, 24 Jun 2026 17:24:42 +0530
Message-ID: <20260624115442.4112419-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87pl1gcmgf.fsf@toke.dk>
References: <20260624030530.3342884-1-avinash.duduskar@gmail.com> <20260624030530.3342884-2-avinash.duduskar@gmail.com> <87pl1gcmgf.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +	if (flags & BPF_FIB_LOOKUP_VLAN)
> > +		return -EINVAL;
> > +
>
> This is fine, but we should probably reject the input flag as well in
> the next patch (for symmetry).

I dug into this and I don't think the two are symmetric. The egress
reject is right for exactly the reason you gave: in tc you can redirect
to the VLAN device directly, so reducing the egress to the physical
parent is only needed for XDP. But that is a transmit argument, and
VLAN_INPUT never touches the egress or redirect side. It only sets the
lookup's ingress (flowi_iif), which picks the iif policy rule and the VRF
table, and there is no XDP-only constraint there for the symmetry to
mirror.

tc also has a real user for it. In __netif_receive_skb_core() the tcx
ingress hook runs before vlan_do_receive() demuxes the frame, so a clsact
program on the physical port sees a tagged frame with skb->dev still the
physical device and the tag in skb->vlan_tci. That is exactly the
physical-ifindex-plus-tag input VLAN_INPUT takes, and it wants the
subinterface-scoped answer. The 2/3 selftest already runs the VLAN_INPUT
cases on the tc path, including the VRF-table-selection ones, and they
pass, so this isn't a theoretical tc path.

So I would keep VLAN_INPUT allowed on both. If you would rather hold a
uniform "both VLAN flags are XDP-only" line under the same
restrict-now-relax-later rule as the TBID and OUTPUT combos, I will add
the reject, but unlike the egress case it removes a working tc path
rather than one tc cannot use. Happy either way, just let me know.

Thanks for the review.

-Avinash
