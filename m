Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808438A70A
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777579786; cv=none; b=MzdK0DzLC0Kzgs2FcTPaDDU0uG3bkMc4uW59w0uF/k7mvgnPJLJIf2VzfTYrgvS4DFUL4QvlnyzpLryZpPi3aJ5Ey9qVnK+VHs9z+3fqPLy/EA6oLrESGLlauKsLja1VUgAqEGVmaXRMir+J3EbT2lDOlu0gS6lHot5FrXQMF7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777579786; c=relaxed/simple;
	bh=VD18TQCJb+UvimBYuvfIE6T/IibWEdZ2EJLJM4gP79E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e+g6cvOZM0E6rVZOxZpvO++k8QVUomDRXHrK0K6iWJCgor7RUYB5CNqtu8s+FB985fH2DP898vP8r5J5JvV/u37Oon/l5zqQP5fsATbtEibC9w60aDopnmD7nqxTfS0I3DcZsYPK2D7lcDkpBsuY/a7xM5aHUx9oi1hAwZZ7hNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sharmasagarika.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BWMB/C8t; arc=none smtp.client-ip=209.85.219.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sharmasagarika.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BWMB/C8t"
Received: by mail-qv1-f74.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so22055056d6.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777579783; x=1778184583; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dBJRCGaM7qg4vs+OULvt1tqKlI+D/Ob+RbwxfUm/5d0=;
        b=BWMB/C8tMmWGka4vmaJXW9zTs9dWvaN3aUkJSfoSmk3mapYWRv8BQZghOOzYhSocyP
         6L4aFURQeEyT9icIcEfBnShmzExZzBuEzTzHTRzPVfQ58aqra2065HJhvQAzFpHu7qbf
         YLGJWCyJufvwfVET5Ec7JLlMOMTG6QvDQyCazCMRPmLRG3YX2uN1i4VIy3081c8GtxEf
         5YobZfpHirBakf2N9ibdZ6xWzMKT0FEAeJ84ldOtrPle76h2bE51bIoX8aaEYCxz63Fm
         BgH+8PSWnxUOF/0oLjYNfb4qwdV8cH5sDdcucCyzaxma/g2pWy6cATZUxch3z/Vb1Ccn
         ITKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777579783; x=1778184583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBJRCGaM7qg4vs+OULvt1tqKlI+D/Ob+RbwxfUm/5d0=;
        b=cDycC/2iMkMFL2ZGkMqAfCvIUHARjGJChlTgl6bMoSYZhOGmTTjpNML94rpOzLtIau
         WTgJ0xdKPoJxVqCw1J+ScBYUlJ2NyRH/W5hgtAtNmeTb/Mx84fxbioxB/nEb29tK+sNo
         BJahh0mcu9FsWdAInyynczoGXe5jZ3gg6YGuuB8DNubw7VmmO6sWmtKUZUEVXDTSsLdM
         W2jGOJgywm3SA0kQOnSQNs4TXvxECov0Imoz6MVqg/bmdL4N5HePFIpATwYYjDDmcsaq
         JNf33irn3r5jbCSi3IfoVNfT05YQWFIE7qZrOTtMSmJ/nhpnvp74UVooeGwm7OOemOw3
         Ccmg==
X-Forwarded-Encrypted: i=1; AFNElJ8QATWFl4A3zAr0AkhFhNutoB2HsBh50mabu/8/0vo1CsjUDqcSA6nudgMDaamLxfwrM7cj29VXFI3APLQjI+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eWncdmhSqYcJSbRfVpqV3o2bL769ialdfYg5Lu/bAazpx1iM
	EcKNLgzT8LnmtY/CVt9Zz+LHG30XrstBkkYy0qGD9dvYQjh7cUs9J+V7N2xuQsquWoQK3CT+Wjj
	orCZC8MViexT2OREcXSW5mK3wgUo4RkvFJAJypQ==
X-Received: from qvboo32.prod.google.com ([2002:a05:6214:4520:b0:8b4:f68b:27ab])
 (user=sharmasagarika job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:3303:b0:8ac:a744:7789 with SMTP id 6a1803df08f44-8b3fe6e6686mr62510266d6.5.1777579783398;
 Thu, 30 Apr 2026 13:09:43 -0700 (PDT)
Date: Thu, 30 Apr 2026 20:09:00 +0000
In-Reply-To: <20260430200909.527827-1-sharmasagarika@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260430200909.527827-1-sharmasagarika@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430200909.527827-2-sharmasagarika@google.com>
Subject: [PATCH net v2 1/2] ipv6: update route serial number on NETDEV_CHANGE
From: Sagarika Sharma <sharmasagarika@google.com>
To: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Sagarika Sharma <sharmasagarika@google.com>, Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

When using IPv6 ECMP routes, if a netdev listed as a nexthop experiences
a carrier change event (e.g., a bond device generating a NETDEV_CHANGE
event after its slaves go linkdown), established connections utilizing
that nexthop fail to fail over to other available nexthops. Instead,
these connections stall or drop.

This happens because the IPv6 FIB code does not invalidate the socket's
cached destination when a NETDEV_CHANGE event occurs. While
fib6_ifdown() correctly marks the nexthop with RTNH_F_LINKDOWN, it
leaves the route's serial number unchanged. As a result, sockets with a
previously cached dst do not realize the route is no longer viable and
continue to try using the non-functional nexthop.

This behavior contrasts with IPv4, which actively flushes cached
destinations on a NETDEV_CHANGE event (see fib_netdev_event() in
net/ipv4/fib_frontend.c).

Fix this by updating the route serial number in fib6_ifdown() when
setting RTNH_F_LINKDOWN. This invalidates stale cached destinations,
forcing sockets to perform a new route lookup and fail over to a
functioning nexthop.

Fixes: 51ebd3181572 ("ipv6: add support of equal cost multipath (ECMP)")
Signed-off-by: Sagarika Sharma <sharmasagarika@google.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
 net/ipv6/route.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 19eb6b702227..0dc0316530ca 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -4995,6 +4995,7 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
 		    rt->fib6_flags & (RTF_LOCAL | RTF_ANYCAST))
 			break;
 		rt->fib6_nh->fib_nh_flags |= RTNH_F_LINKDOWN;
+		fib6_update_sernum(net, rt);
 		rt6_multipath_rebalance(rt);
 		break;
 	}
-- 
2.54.0.545.g6539524ca2-goog

