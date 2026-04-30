Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E93D0917
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 23:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777592341; cv=none; b=sCmLWubHp/e/oM5Dodw4DqDgWmAcyTF/WIDdoQi3ypuj2b4q1hFMqB5CSmSvY9gl+KYqR+PGgTZ+4rK99B8NEjp0+dXjthoaXCOVeEIkHhKiYX5P4g0zxTH/lFio170lUAwrOZqURtHB+iG/Tx05j6dTUKTACH8o46BZtpYy4QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777592341; c=relaxed/simple;
	bh=ebHuBoW02qHmf08ncQRJXUoPQIQLHDcgiezetLfnhO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pC+QIUxCguH3x5I7VCECEaHis0yqzw3KFXPwASQCx22gGEGdB5nlqfqCvvZkRbvXSDxTQHeyvTdGs8JHMWEZ8VCDTBvz54Ymk6Uuvf/ZO4Vi8sqdEsioJxvpP4Y0f//hJhYFmLQuryunJRnyT7FUdla7s1NVDvvQ+ouoIL/+9xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-50e594413c2so9536601cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777592338; x=1778197138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XI5s/gjPC8JmnFz7SoHnBZF2JdcqfzQbMV/kK5cvcdo=;
        b=KI77uKoYiYzoMEWj70vpN9M179aA5sB9/NrdSR2YLzM4sZlmcrnGbp0JNmyXptXAJM
         pJwARyuYE6MCNYueJrg8jb4Z3kHvW4djKrPOp+hQMU+Ln6CdE6CdLIdVIuNy0A3IpPC7
         BlG2fYAmj0QCp/IyYxrDrD+QoiqBubgjnZWPiSw+RoIZFSnYiKsSqrV762raES8SUg3A
         2HrLoMYK5ueKxbwDK/V6YUqSHeK08/J2/VSTKmkjempGHgL02ZS2VGwEX7Z7FlzqnbEW
         m5BnQ+0VgtmgB+HmgedUDkvGEl6WOydT/drxIAy5DpTJErFuO4z1/a7hpbv5ZZqK3vCZ
         0ung==
X-Forwarded-Encrypted: i=1; AFNElJ+mtrC4OGwXCV/kY4+AFNfgu28M0+pfMLHyL5A+Yd3Lhln3eXqxn3W1ijpOokkiwTl3iPZ9jYv+MxBjqsRH6x4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjbun1PgzQOgRUON9eJbkW/aIrlt0vMOvQ6gEQvznAO/+533gx
	YF/9lABKUma68mJ6tqA4ztlLpru42ZlOaBETcOl1h5ufVWAMCNkAkCqq
X-Gm-Gg: AeBDieuxafkCyEYPbI2ubqVtyUlUoQ+gCi4fOAvIyfqqkQAQ2z6c+xYrhnHY+1Sr4Rj
	vXOiQDPpmGgs6a7D0PnzZlze4NOKs9liOntLTM6gCSjbfX/jVDlpsWnyJ9RU3Gpj0neTbyNsXUq
	5rEgCCONcLAlHt/Wtmgrh5627RzdA28OS7cIl2OcpZ3XFvEpmQqNidF9r5s9XN6KZzCowQEyT0Z
	1+1PIP+UKvuCmaWKyEZ2s+XrQFd2+MFYKrqPG3vkScwIkWOIv2sAYugVqwIwcjm9nndhZHFwTp3
	WXDwAwpG6EMtcNGimCHd6UVwGSMj6A5OgrrpQWXvItEZxOhuKRbaOwuhfp/akDWiqyS7pZpjAq6
	cUstJ3/ZD3yp7tVC7FWx7aj7omYqJvp7qnrqbhuyICtDWS+g7z7oGrTEGV4/GIv5hhGIa8cNzXY
	Ej+IH9dM3mZPguRpfCgchm3uolh62tgF9CzwbptOtqgStAb/SqIrXy/ccG9DphkdPjS9/sN/ahg
	l6z3bOq
X-Received: by 2002:a05:622a:248d:b0:50f:bd19:657b with SMTP id d75a77b69052e-5102d13e8ddmr62263561cf.10.1777592338555;
        Thu, 30 Apr 2026 16:38:58 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040934199sm221cf.13.2026.04.30.16.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:38:58 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuan Tan <tanyuan98@outlook.com>,
	Yang Yang <n05ec@lzu.edu.cn>,
	dev@openvswitch.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 0/2] openvswitch: fix self-deadlock on release of tunnel vports
Date: Fri,  1 May 2026 01:38:36 +0200
Message-ID: <20260430233848.440994-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two patches - the fix for the actual bug and the selftest that reproduces it.

I missed the self-deadlock in the original patch that introduced the issue,
because testing required code modification in the ovs-vswitchd to force it to
use legacy tunnel ports.  I thought I made the change correctly, but apparently
something went wrong and the tests were run with the standard LWT infra instead.
The selftest added in this patch set will at least prevent this kind of mistakes
in the future.

I mentioned, however, that these tunnel vports are legacy and not actually used
by ovs-vswitchd.  RTM_NEWLINK + COLLECT_METADATA is used in conjunction with the
standard OVS_VPORT_TYPE_NETDEV instead since 2017.  The code to use the legacy
tunnels still exists in ovs-vswitchd however, but only as a fallback for older
kernels and we're planning to remove it in the next release.  I'll be sending an
RFC to remove support for these legacy tunnel types from the kernel, as they
serve no real purpose today and only increase the uAPI surface for CVEs, but
we need to fix the known bugs for stable versions.


Version 2:
  - Added Ack from Eelco to the first patch (not to the second as it
    changed a little).
  - Removed now unused import socket in the dpctl.py [pylint/ruff].

  - Regarding comments from both Sashiko instances on the selftest patch:

    * The background process is not waited for / not killed.
      If it hangs it will not be killable anyway, so it's not a problem.

    * The 'gre' choice for dpctl.py --ptype is not fully handled for --lwt.
      While this is not needed for this patch, I agree that it's not
      fully consistent.  Added the proper handling in the TUNNEL_DEFAULTS
      loop in this version.

    * Python version concern for argparse.BooleanOptionalAction.
      Python 3.9 is the oldest supported version and it has it, so it's
      not an issue.  Creating extra detection will only complicate the
      script with no real benefits.

Version 1:
  https://lore.kernel.org/netdev/20260429151756.4157670-1-i.maximets@ovn.org/

Ilya Maximets (2):
  openvswitch: vport: fix self-deadlock on release of tunnel ports
  selftests: openvswitch: add tests for tunnel vport refcounting

 net/openvswitch/vport-netdev.c                |  6 ++-
 .../selftests/net/openvswitch/openvswitch.sh  | 37 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 19 +++++++---
 3 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.53.0

