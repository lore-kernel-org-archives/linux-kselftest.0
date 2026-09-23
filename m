Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937983AD52F
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174988; cv=none; b=ohRY+rHMbzU8mpdha8eQazMWPENxzfSmwOBPcRKmbb71gXgzSiwrAzA4Z0JMTVdFaT9PtPaG5lXPs0nRATtxdqu0ns0jtF7OAGJhJQ2j3T/zJH5dd0p4FgOyZglCKgRf0Skl9BWTFKy2Z4DB9hCPhux53mSN/eulQnLgO5pYjFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174988; c=relaxed/simple;
	bh=gfEequ5h4M8nOx752p9+V+yKr/bMfkzst5fdeEdSG6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BaxnKdxuc29fG0EfKCj1rbc7X+QhvylVbZTTCZSfeZqOfcXcZeanZ12qZr44f/z3izAUysVHJNpDeKziDal9tp8kebZ6QWh1jSGh3Rlmnu0oj1ygyxyA4zzTC/pz2+IZmjD5rHS0I0gnUXeyFsxuDRbtfHppHNGTsWmWYaDCTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+LodU5s; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+LodU5s"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so755052a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174987; x=1790779787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6r6fXqXYQF9f9eR7w46g/DoztkMVGuog+jM74AKklwU=;
        b=P+LodU5sZYtkT2sRUolAS58SIGPfMnazoXkm2Fh4pm8OjlgZwSE7QIb8rIAdq2OTUa
         ixkLstqjXy9NmLEr8PosoTuhPOn4Y6iVGUxu4e8qLyW6eHaCgfkLKC552tC67yb7z0jo
         pQbQIDyuBCFWxff9h7F73No3NjHaR1Oh2b5etBxrFYD53TX+a/Cj4I4Dy8URsJxqfxFp
         nWiTeGfi4XFOIgpBZucNQhcY99immHuD4W+0UMvfUtkXrUcpWZ3hgE64flaMst5LGgZn
         u1YKE/FBXKwtKIpxugUGYAN5uLEJ+FKl7coGQxl2ugFTd4JlQPS7QQ1jOUA+qVoZoSy7
         dd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174987; x=1790779787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6r6fXqXYQF9f9eR7w46g/DoztkMVGuog+jM74AKklwU=;
        b=dP/Uu9MC1XcVA8e2dVPO0A1WgcDeAnuLpPPzBgnMDK0hqQbozSt0nmaqVpasXYb/wj
         n+6zgTsUMxKHamTNUQKQIoqCTDY/dvCuuVBYGo+WByDYhBIDHrpz7ZOIjDdGWVAs7T8L
         0irqc0TmhwaJ/sxMamDfRsTu3r3w7tBKAjB5w3fcOuzMPxy/0YoJa/2Cq2oLXfkOTE3q
         pdEadynIN/H7UIUd5LamZwGercDdCahoRaZ093nGh2+C02v2aljOHPtncfdYsrafduPe
         EHMUE+z0Zo6ccGCsp1n4a+kFfk09f7ytesnwV+p2zNvsib2ZDBN7GKWGChPGtnCbj+ns
         rZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBw6Dwk3ncaUZ/jAk5X8QFW/9n3u5izuFYvk6C1wO70cZbbQkBydo3utY73nSm0M6HL4L2QQgXQR9ekzvHwDv9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mWEhp7HEItERF8/v6KFlzphEMzU0qvhVX7gUM0Ja8GN2kBgrvd
	NQpSpBNom2OVrTncziHAeDp+7g/DfpTCCQUedvUJozM2mvWrtMcnj7ri
X-Gm-Gg: AYBFou1wGqgH6pSY9ITpVpfoA9PhKlvYYXiKfWz+EGQVyfjmW66b0KQPDp2qzRI6VED
	emo0OtuLhsGDz1B9wxOeXv6KGDTOIprEPonlagGXyRUOGaKJ0+/IZfhnD/ZxNghljPT7F6S879a
	q0ZmHsQNOgvgjzeAlgAJLaZMsLytZJE5MV/sIseep4noEgzd51NhXdHsDBVh++NAfZ4bhK244Ie
	58FixsE2Q/Ot32IIbvYrmHeKjYhK2y4Wfq8k1U5p2RL9vaO+79eQNjMLXI3QnUNFZynt3qme6vb
	YppVvLiLURkGQ4XLH+0OltPxvuctUMNhqWcdb6V1WJOW6eyCzN0R79wO+0VH8C95y4s47f3a+JN
	retqfgmevEFovGBhDdQ8YNpG0f3k7Qn5F3ug9rhi6GXaLQ2IiIpu9NePJSmTf8k3CneTDopz7cL
	6vopWqVnaN+1m2+Q9ae+CCv3NVhIou4yFR5BXAqYa+Xr27y/5mHFG9uKmewk4WtxNqjU7crvteT
	IUJqIiD83YsMG7/gBK9EQ==
X-Received: by 2002:a17:90b:3f0e:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3a07e5606a5mr2414557a91.24.1790174986717;
        Wed, 23 Sep 2026 07:49:46 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc4109dsm6469824a91.14.2026.09.23.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:46 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] sysctl: Cover the jiffies converters in the selftests
Date: Wed, 23 Sep 2026 22:49:35 +0800
Message-ID: <20260923144940.3712965-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Joel asked for a test for the negative read path fixed by

	https://lore.kernel.org/r/20260922031229.2300283-2-zhanxusheng@xiaomi.com

These apply on sysctl-next and depend on that fix; without it 2/2 fails,
which is the point.

While writing the test I noticed that fix's changelog is incomplete: it
names proc_dointvec_jiffies() and proc_dointvec_ms_jiffies(), but
proc_dointvec_userhz_jiffies() goes through the same
proc_int_k2u_conv_kop() and is affected too.  Measured on
net/ipv4/neigh/default/retrans_time at CONFIG_HZ=250, unpatched:

  # echo -1 > /proc/sys/net/ipv4/neigh/default/retrans_time
  # cat /proc/sys/net/ipv4/neigh/default/retrans_time
  -18446742229035144246

I will correct that in the respin.

Tested in qemu at CONFIG_HZ=250 with CONFIG_TEST_SYSCTL=y, and built as
=m.  2/2 reports "not ok" without the fix and "ok" with it, and the
pass/fail counts of the other tests are unchanged either way.

Zhan Xusheng (2):
  sysctl: Add jiffies converter entries to the test module
  selftests: sysctl: Check the sign of a negative jiffies read

 lib/test_sysctl.c                        | 31 ++++++++++++++++++++++++
 tools/testing/selftests/sysctl/sysctl.sh | 23 ++++++++++++++++++
 2 files changed, 54 insertions(+)


base-commit: c5c4ca25387e3cefd1af64edf9187546b6d06787
-- 
2.43.0

