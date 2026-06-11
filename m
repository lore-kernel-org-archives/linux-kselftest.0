Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987533986F
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165347; cv=none; b=GmfF+vbsZlRNx/SuVhq8RP+bgSBFqnZvYRZ6s4JN57VNo74Qkj39gBrGQ0q/iu1UQQZL8DKXkjo2qDQmkee6/Qn9f3uWPw0ClAa3X76SMmD+peGkT1YFl4ptvIlZ9chVG/nRvDeBJl7fyVSBLdIKNnC2/JK7MgZQY5GZvAa/Yrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165347; c=relaxed/simple;
	bh=43aTg0uqeeQ1d2jMcSX4cwzeXgZpgGmCmaoUiCwIYpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bk6Y5ivodk0kNautdjrmZH3iMyvTPewrTlQmt8ZWnIyoXgJFgRcOl40PK2Fo0wx5hcKPdEFaHruPtk0CrJ/ttK0gApuDrmxazxNMqL1dPNo/BqeXuEow3HwwCKyiTNnvX+QKukTg7ZmWoDZipu3jYR96xvuldS5mg3yZiZipKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByieKP5v; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByieKP5v"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2d792c8so51445915ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 01:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781165346; x=1781770146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez/7YuAJr4Y+RG8kQa8JolzS7h4/ienZb2p4vynCkX0=;
        b=ByieKP5vYX53ZzYn26b8aIuF4w2nt9RdK9oz9i3Pjkcaq6FstjjKqymiWu6abi8/6u
         yN7DVZyQfN04v+PutYDUoEDYakHbmHuVkCabjR0m/gvxbWIDRkROG+xzpqoRMEn4g/EI
         p82Mgd14OMGuthhDvxrz1nPM2XHdkgXE0XYHiXzbvbBS/Lk8WE2P0p1fqiGM6V/sLzft
         Oi1I8NgKVN2ZRPf2JGbRLyANRUy8AssFq6CHQep3eLk/dVAzc/q6hXmfhyslMU+/oLKv
         9lvZJOdYtdtz1nFH/MTmokqrSuAYxUjSSjx0HrW9WwrIhJCMuR/n5u9cCMivJjsPrHBH
         l9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165346; x=1781770146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ez/7YuAJr4Y+RG8kQa8JolzS7h4/ienZb2p4vynCkX0=;
        b=M+fJshDS4tUKkaPcp3B458LVIEgC6PlsWHowlwoTiJNDu8H8jXNyLVrhIgXK9hCVBH
         x5zDNQ4Viz7CZzMJfcQWvXEgqowEGRToU7PcmbDW6Sodtc5Iy6H7Yx2vnknTI3QQ6S02
         izqcB6mlo9RDQKlwCR1PpivNLJZHCdRVyAQ1qTMLHJIg07Kys5DhAD9DCkmD0hD3+jhT
         zxpZ+7crGorIEURYJSjTmSr8bUaI5nIcPb5CAXTBcZ2ymoxJ3SY/nBe3wFQKh+m5hiT7
         vyly48X887XQO77LE2uLmF29Id34FScLylyFhxUctuF3Ohs5n5iVFsjtXjrGirtjEcqd
         A0+A==
X-Forwarded-Encrypted: i=1; AFNElJ+0+uF6Hf9m4/VKDtWCiYjai4Xrs/jJjUJ5FS18Z3hhd8JhbKSKCQUeb+Npx+ay2CT1r9fKPo+2guzIZ8n12Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT+blga0xXg097ewD32/eXedKleuRZ5SHY+QwC28ttUc1KpNvF
	WkeyvmP1sC5v1mpbj7XJS/C0qvcOl7J1WQAtUX09xeIAw/TI8bFwi4Ru
X-Gm-Gg: Acq92OEtH4eXh63Jg+aKNW65/zgIQDKyeqsjXPMDndjoLc4HbRdI4jwFaK+b5Psw2qo
	ftrwMDAB3T8I2YM26Yxn0aSOojC7x4+nAWT7uFDmqUpK9xlMIh5/XS50SqvXoTMdSTVQUeQEzwS
	aFFC+tfLJoYwPOzC6UC5+IwmW0g+h24QsiHlGJSkQ9bs8LYKerOp5PI5/nUmdlmDroHgowuWNeR
	7H+hjY6nSuBa7t/AbzDirdloaIiEV0JhL8jzvaCWFNXp5y3Q7QbgAGjQBcOWza8Mhujp+ynlsg1
	Uk0IU4kjYY78z6OGGp4l01YtPNZk+lcZPEc8LvxjIDvhnNVUaqskUSqwCTuaLP7R5WbcpkgBJJy
	wjEG0qRQcVUa2Rr6jP2iU4LDGYjQ7rbHH2iP0RLi3CW9pfst9NFitBp+K64014azY5rEXGq3ilW
	ZgG6odxDy8mnYLy8/unKzxYSkNDOXYX2v/CN60059AOaG0aDD9WYJ0Aywht8Xb+71MRxM4ypofb
	Xp4VduMomhR+2HZFZIi5Q1o4tYAl6LYQpN5KQ4=
X-Received: by 2002:a17:903:f8c:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c2f2a780bamr19562055ad.31.1781165345756;
        Thu, 11 Jun 2026 01:09:05 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([2a12:a304:100::109f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm277591035ad.82.2026.06.11.01.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:09:05 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	toke@redhat.com,
	menglong.dong@linux.dev,
	emil@etsalapatis.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v4 0/2] bpf: Fix generic devmap egress skb sharing
Date: Thu, 11 Jun 2026 16:08:47 +0800
Message-ID: <20260611080850.536996-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Generic XDP devmap multi redirect can leave cloned skbs sharing packet
data. When a devmap egress program mutates packet data, another
destination sharing the same data may observe that mutation.

Fix this by making cloned skbs private before running the generic devmap
egress program. Add selftest coverage for the last-destination case,
where the final destination runs on the original skb while earlier
destinations use cloned skbs.

---

v4:

* Preserve mac_len after skb_copy().
* Separate errno return from XDP action output in
  dev_map_bpf_prog_run_skb().
* Zero-initialize net_config in the new selftest.

v3: https://lore.kernel.org/bpf/20260611043317.512843-1-sun.jian.kdev@gmail.com/T/#m77fde65437b0398cb470649d4f1feeb85bc134bc

* Split the kernel fix and selftest into separate patches.
* Move the private-copy logic into dev_map_bpf_prog_run_skb().
* Use deterministic DEVMAP_HASH keys in the last-destination selftest.
* Fix the Fixes tag.

v2: https://lore.kernel.org/bpf/08c35c70-a59e-4e0e-91db-22b5ec30b611@linux.dev/T/#m613671b243e8651c47f84bb329f0ea668974c549

* Move the private-copy step into dev_map_generic_redirect() so the
  last-destination path is covered as well.
* Use skb_copy() instead of skb_unshare() to keep caller ownership
  unchanged on allocation failure.
* Add a generic XDP last-destination selftest case.

v1: https://lore.kernel.org/bpf/CABFUUZFimdrZdq=NWi+N-0sJZWvMwY=f4iF6-3TVMS8=m07Zmw@mail.gmail.com/


Sun Jian (2):
  bpf: Run generic devmap egress prog on private skb
  selftests/bpf: Cover generic devmap egress last-dst rewrite

 kernel/bpf/devmap.c                           |  41 +++--
 .../selftests/bpf/prog_tests/test_xdp_veth.c  | 152 +++++++++++++++++-
 2 files changed, 180 insertions(+), 13 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.43.0

