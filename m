Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2267C37F8A0
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 02:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611208; cv=none; b=oIJKDvp/SpPekcTiN7nnrM1MMkcpJUY7oRjMqln3CBULQk1y/9Qj9jdSexOnt+ohn/VkCZIU227K+34MCcILtShx+3C4vO98BMW+FwBbCtwIgoMrtgiwMP2ELvr8i8oYORHHiiMgqlTwLJNc/CHcc9BZigue7DjNTOC22KDjckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611208; c=relaxed/simple;
	bh=27JvdaM8KVg5NMgGg5WqEucr2iQAjqA1fdc+FK2gsvI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=rYB/oZHmxgAfdzfIunT5NmZ/0yMb2SP5ZGQAYGmNtdygwAqzC3P9RO/6GffFXWvLiWcpNQDkF4YqQOUpS0TvzasRV3nJAm7usIqq7Q4Xl6xrqR8qjIM+Kx8aV/Q7+w2c3gSOJOrYQUwvxSLrQ2AiNIYXNPZ9gTzNgk7NTf9dT5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miw4STgR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miw4STgR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba92so269786a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 19:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611206; x=1790216006; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8ZIqDfKScffiOQ6mnRDy/JSG8BKfdrJqzxEUV+If2k=;
        b=miw4STgRACi5f2486fFJnz9uvGRtxQAKFT1Sg7BYyqomu0slKk96eAzy3KcY0T1+ns
         srb30WAuBEfOqY1bCBhhMPrB7CrFtLirf5a6Xg24y3QQdgUJcAjOH1cCffcg7xP3tRh+
         hOGS0jaZRqNNyzoEdI9gCd5+PfxdoFkw4MzZIMNLekK/goeouElWFK6HdYo6fut/QMSV
         WsusLMsFEX9VRvP77wBuJq0Y9aR7MqWzY0/s+2pr7IJHvjsEb2z5qGZ4P8FigiXMfGmA
         bhDmRg4IuhtfnOvGTzEt5l+A8LRDhQQvZTOY/7q7ZutdTj+9iroNgEkjHquYp/jhFS16
         +xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611206; x=1790216006;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8ZIqDfKScffiOQ6mnRDy/JSG8BKfdrJqzxEUV+If2k=;
        b=gPISWIb6NedloRrGCrQ+HNHf/czzaB1+mB4CI3D3fGAMxlZLBFA6EAw+ZOHKG6l4Ua
         jcdEFTRGH1O3aPQCDLYKSuC61Z3/X9IDWQW1VjhIZCBDBHu/LM7R1/fjBdxsHQA4TMHo
         UTyQCotQQfsUl86DQYxTMNooqE9KWUmfGpiuUqFPxo1w+Go24lY5ryhAXxfhkDbNCfIW
         uqT0OX0ekQVvOOr0uidhltVlQDiTKxzCHKnX3XaKmaF8H2QKODutwRx+1Eexj0yBSF3w
         pMB98tL/M6TcGpG/okM5KiHm3HdFF6WT3+ojDxdHWVgEJZW2NobKy9O41vTnlsYaSZal
         x0Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwHRH+3VLAL5/9+A4wgYhXP+kjdk2CgE8q7OwKTvVLXCrbj2CqKGnEj9/KLnAmecuhmh7ogPNzqHtdW+0OrtUs=@vger.kernel.org
X-Gm-Message-State: AFuF++k0Y9Mpyo9N9c7Cj+agzNcqRFGCP7K02ww1P5YmQ9yMldx/ReWP
	OKgnQl1kXayDuobbCD3aA7bU+f/6UBJ/4/8iSAiDwF9VIE4TLDEwezaQ
X-Gm-Gg: AYBFou2+Nthmqjq2BDyFp0CkIX13FqhRvFldfsa+WmoiMF86deNobGI/sUknory/FWt
	IF0p1bTHL9scOa2TyJSpWJe/ZTaEf332OosWAn/9YK1yiL1m8xEJwfCjbx5tLe91KDy1Qd6puBy
	rR3gzNLdRZxuLgdzQ8r/JBQoj1l0P6AIypdiK0En2ZsBv4M4ByOTalwe4KmvIVkwQiI2Y3YJO41
	5oOaAXN4HLD54Q71ZvjCLyNEVK9O2ChKvDKm2W8YU0CskbRG/5CRlNXiZzykpxWvxYt3IuX/EgJ
	kZy+BtXjEfhaKksh65lV4vKaCW05ST1UJ7yIdXF03qbpbgFh7wZ/078YgZL3b7foOq/PcM2AhPE
	cZJzjRSSObUsc3h+ScibEYVDDHn/IiO6kPiFmUkdENQcI3iQn76XMkRFp55APDDpb4tDRkbmA/U
	KumApOZFX8y/o8AfBVtVHUMST6wW1BNkIdF5WtLiUYZdMHe6zhy7JwLlkZMroq9xP0kurPO/mjC
	sz0p1m4qUibmNTfHUggFfdQJILFLo6BRg7wHCj5oUIWgN6aPrgts1PjflcPf7Lb1wTLDo6YMck2
	+lDd
X-Received: by 2002:a17:90b:4ac6:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-39e1e26599bmr10747977a91.3.1789611206357;
        Wed, 16 Sep 2026 19:13:26 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e4e0c6sm2319034a91.8.2026.09.16.19.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 19:13:25 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 02:13:25 +0000
Message-Id: <DLH885YMOP9K.3AH1G96TD81UL@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/2] selftests: bpf: run test_xdp_features in its own
 netns
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eva Kurchatova" <eva.kurchatova@virtuozzo.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20260917015605.2464043-1-eva.kurchatova@virtuozzo.com>
References: <20260917015605.2464043-1-eva.kurchatova@virtuozzo.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 04:55 AM Eva Kurchatova <eva.kurchatova@virtuozzo.com> wrote:
> The test creates its devices in the namespace it is started in and binds
> an IPv6 socket to talk between the two ends. Both are unnecessary
> demands on the host it runs on.
>
> The device name is fixed, v1, so a host that already has a device by
> that name cannot run the test at all. The IPv6 control socket depends on
> the host's firewall rules, and where those reject ICMPv6 or the port the
> test picks, the two ends never meet:
>
>   Failed connecting to the Device Under Test control socket
>
> Cleanup is trapped for signals only, not for a normal exit, so a run
> that fails leaves both the device and the namespace behind. Every later
> run then stops in setup, before it prints anything.

This script is not run by BPF CI and it's in the middle of being
reworked and moved to tools/testing/selftests/drivers/net/hw/ via
net-next, see Bochao's "Track test_xdp_features DUT processe
s" and
Daniel's replies there:
https://lore.kernel.org/bpf/20260904-xdp-dut-process-lifecycle-gmail-v3-1-5b7eee4f7009@gmail.com/
https://lore.kernel.org/bpf/10886894-081b-499f-abce-fca62b120615@iogearbox.net/
That patch already switches to trap cleanup EXIT and tracks the DUT
pid, and this one conflicts with it. Pls sync with Bochao and netdev
folks and, if the netns part is still wanted, send it against net-next
on top of that work.

Also patch 2 has nothing to do with this one. Don't send unrelated
patches as a series, and use a proper subject prefix
(see Documentation/bpf/bpf_devel_QA.rst).

> Re-exec in a new network namespace, where the device name is free and no
> rule of the host applies, and everything the test made goes away with
> the namespace when it exits.

That last part isn't true in the failure case you describe. unshare -n
doesn't give a new mount namespace, so 'ip netns add ${NS}' in setup()
still creates /var/run/netns/${NS} on the host and nothing
 deletes it.
And when the tester fails to connect, set -e exits the script while
the background './xdp_features ... v1 &' is still blocked in accept()
in dut_run(). That orphan keeps the unshared netns alive, so v1, v0,
${NS} and a stray xdp_features process are all left behind on every
failed run. They just don't collide with the next run anymore.
trap cleanup EXIT is what fixes the leftovers, with or without unshare.

pw-bot: cr
