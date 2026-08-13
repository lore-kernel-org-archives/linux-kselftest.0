Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00F236403C
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658421; cv=none; b=mLcWu7bFhpl40lB5Sm/cUVOm378jviHd6TPcZKy4EhOiCgAJqqnFKX/Otj7Q2yshVLF6KegTxb/wiGiGv9WCLdGvFy9p+KYNGireP5pAB4/rug8JAEO8bzLc3bjP2w+1LLUtNXQeyZLtWhbJcbEjcorCoJ1NPOENxk7piTteE+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658421; c=relaxed/simple;
	bh=9/sQZpI1gQNflmGl2+wtCghsABNs0cTgc4HTGo/59bA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T9o5wGRn2DHwEXQ8tQ5PZYEltondGA2reo8HbRmyN4niwSlghyncmM2quArL6rCXXdKa64v49ZL8ddDzqDktme5wgqjTDmdCLRaoHMj/1qJq6oDZUvipwN60/a50t5afWJD8dVIt2aQq72FvySM4X5SfDWxJcRIhmuDe02u2OyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=JpdbzHlc; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="JpdbzHlc"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-451fd21113cso355764fac.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658418; x=1787263218;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZLDjUMvBFdgbs8ZTJktZdHjUGj8/OSXLCcY4tmjsIM=;
        b=T2DPhy3uuSULlJcIkK/EvMFXktW9+qqGTsxFb+K3ClfqES2JSjU+TiT4TEo171iaeh
         3TIcrxKFtI17RwxqhPigJQouSM5cBi3Wo1RJMbPBSeMb7I/zAs5yGUH0rfrgShWzg4IX
         T+y+BsLjdLUlNqoS+RD5DvCeGSitQwq8WEnJ3d1g+MgBPOQ0/N2ZaNRaudM/aMgxZWaD
         cSadKaElvbyGYYcAfXJj5EeLtmswSXwklx4evpOdCUvdu11yqTwFpDUWVqY6Tb8Pd+rg
         qaT4TVvaeBPj1eu/ca5fVltI9/KeFz/qeogKq6Be+Y0Bct2sHRi4zfGGjRsmFfyM1+4r
         LbPA==
X-Gm-Message-State: AOJu0Yzf/xxuxuz1ogeaQV0CS6/R9c9iCt+JLhukUCrwpBWdv+coycYl
	c4q+q29VoHILgHDYARsUPR4RTkeU7WwA3YzPZRDbDE6oIWRU5D98tTVF
X-Gm-Gg: AR+sD12NFZ4szqn5FHJSf+1pIY8gpeHjMmcHBvsua8OPqlmncSHlVYB3yRMmZrlR2Sr
	xDOBNotajuuEtV/NVKC/kCm0uxXBzI4i9kWhOFD5PuyyZ797rqHhZjTwbBrsLl7xwckBebHy7wp
	qerdmYN7nuw33+EcSDEuFbKf/UbvOxDS8mENBKkNthTn2zZ/9mhuiWImhUTUfX0ybZo7HZS7xUi
	8xWuuIoW9XBp2QbSTHTKMWahDtcN1c9vhlj1QIg/yV377pOj4xZuukDg+ZobB24b2x5TSmciM1J
	0eEEtHBhGr7usTWiWmDP/97tSKELvup+nQ6P2nW1rOkPz7iEwKtnuM68tawvi6FjBGdyOg6jYeV
	mAe5crWBp7qM2ryVqLtXe38RrxmNTWb6Xf8swwtlVY3Qv2RWwLhm7Na/YtS92vJ00twBGnGMGd9
	mfMt38CbPfaZKDx0NjXIHcG4yK1KvYD+6m0h5fYr9aNAQ3x4g+lvaC5Luy+qx52JTPLIXgM5WpX
	0rzZGNUb4GQXdIzGatZEIup1qasYqcLBAlioqy7KphtrfrysZEKH2EVjCc4EsKt0g==
X-Received: by 2002:a05:6870:8a0f:b0:424:801:49fe with SMTP id 586e51a60fabf-45e91f35ed3mr729847fac.8.1786658418555;
        Thu, 13 Aug 2026 15:00:18 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e8f8f23acsm761611fac.2.2026.08.13.15.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:00:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD26360CF1;
	Thu, 13 Aug 2026 22:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786658414;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WZLDjUMvBFdgbs8ZTJktZdHjUGj8/OSXLCcY4tmjsIM=;
	b=JpdbzHlcKwbLkHojBUzzeFmBtNAUjIxJO8KauGl8gUUHNRbijKCR1ZgSqrfSeSVbF0u/GP
	vcttUaAuBwrzNQr5GsWIxKdDfr2HQDxOgQwpiMhXISY8S3xglgUhJ/UYdlDK9/ygPlqedx
	hq5ZbMRN9IJiQRidJKNw2Gjt02mIOr/0/KeX0Eq8sizfkN1ewevaNeZHxibV0VIY3i3x9T
	6Fxfl9JgoBsH5gGpp0aJOuGZCho7BLzy3l8Tvjj6SxGUqFThlMTT0cnngPHH9T6IVNjN7Y
	pvV9wDmkfztlh6bp9Uj72DAHQiC4QeRp0AT9p3kQzqLRpACcsopcG1mrKf7wMw==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Subject: [PATCH 7.1.y 0/4] selftests: Fixes for BPF
Date: Thu, 13 Aug 2026 19:00:01 -0300
Message-Id: <20260813-7-1-y-selftests-bpf-udp_xsk-v1-0-cd5c51e7dcec@marliere.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGE+fmoC/yWMUQ6CMBAFr0L220WKCsSrGGPaskC1KU23GAjh7
 hb5ezN5mRWYgiGGe7ZCoK9hM7oE4pSBHqTrCU2bGMqirIpGXLBGgQsy2S4SR0blO5xa/5r5g8V
 V1424VUKSglTwgToz/+sPqHORL/A8NE/qTTru5f2oJBOqIJ0edsVRKktna9w0YxhtGj0eErbtB
 8H+M1a0AAAA
X-Change-ID: 20260813-7-1-y-selftests-bpf-udp_xsk-04c781561aeb
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, sashal@kernel.org, 
 gregkh@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Jakub Kicinski <kuba@kernel.org>, 
 Michal Luczaj <mhal@rbox.co>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Sitnicki <jakub@cloudflare.com>, 
 Jason Xing <kerneljasonxing@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1786658405; l=1422;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=9/sQZpI1gQNflmGl2+wtCghsABNs0cTgc4HTGo/59bA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPBW41qmmEFf8qVQY8Nn5MQdGg3RdJsb2RcsgWh3OX1bTHQBhNFAoIkVu3V3wTnrAvyqG7UCybE
 wzyZMy+wc8Ag=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Please consider merging the following patches, found through openSUSE CI.

[1/4] and [2/4] are for test_xsk.sh:

https://openqa.opensuse.org/tests/6159071/logfile?filename=test_xsk_sh.tap.txt

and also test_progs (subtest ns_xsk_skb):

https://openqa.opensuse.org/tests/6159071/logfile?filename=test_progs.tap.txt#line-3186

[3/4] and [4/4] are for test_progs (subtests sockmap_basic and
sockmap_listen):

https://openqa.opensuse.org/tests/6159071/logfile?filename=test_progs.tap.txt#line-4034
https://openqa.opensuse.org/tests/6159071/logfile?filename=test_progs.tap.txt#line-4212

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Maciej Fijalkowski (2):
      selftests/xsk: fix too-many-frags multi-buffer Tx test
      selftests/xsk: account reclaimed invalid Tx descriptors

Michal Luczaj (2):
      selftests/bpf: Ensure UDP sockets are bound
      selftests/bpf: Adapt sockmap update error handling

 .../selftests/bpf/prog_tests/sockmap_basic.c       |  6 +--
 .../selftests/bpf/prog_tests/sockmap_listen.c      | 21 ++++-----
 tools/testing/selftests/bpf/prog_tests/test_xsk.c  | 50 +++++++++++++---------
 3 files changed, 43 insertions(+), 34 deletions(-)
---
base-commit: e2466b32e02a49318b99520c40b397062c65c84c
change-id: 20260813-7-1-y-selftests-bpf-udp_xsk-04c781561aeb

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

