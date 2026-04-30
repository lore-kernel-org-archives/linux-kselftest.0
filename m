Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4033D1710
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 23:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777592347; cv=none; b=fvn8CIGmusaCT5ekBX7MagFIDA6VgAwK4nDvfG/+7QYScrvECoZ+6/+ruSim5tnVPW9Z1j6BdSSQDbO5/f6CqJ7Yk2JsSqFEzsFv7OrBXa+xitNu09nU7VBG9L4NhNDMZ/Gc2/p4odSn3frlbM2MxKnBE82Gs5+tMVoboGPMLxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777592347; c=relaxed/simple;
	bh=RosUM6xPRIY1oTK9LeKQ/7oZG5o9uW6w4P5hZC7Uc/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZZe8pn6/Zwl7XbzTU8LEJPpyP+YXKOSsz+/YjXORxw+l6pt1r373YxLgjiZBAFIMEpHwIEs+9VEjqJ9mQxDM7kkNruLzbbVJtkq9EJlZ+i+5X+4VVXyuwun+0we9EEm5aiENUHXMZmxg2m6OntiZUaeMpGUpafgSRfZ/KiqlLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8ed4dd182efso87470385a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777592345; x=1778197145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SA+eWHMkILjGV4lZwdF0bh9/zh8ox7+jWKzlWflnjB8=;
        b=NaxFVWzweHMw9BbJLRt9AIdOVTXj9a16qkr72RZp7OxhCBBux85itqum3S7D8aVTR0
         FUN0hj6x3V44YLMunhtJv2Wzz+uI0mvfpx3eHJqJnmdwEHAQFhw7fCnB0UrT0O/23UEp
         0cZrPd5XNCHmE/vWiUpzU1FcTL9gzb6EPa0NUYrshiIX5lcsCqembMI69UvP8x3rcuCV
         Gwq5Bg7+MUD43M47tJZ4NawvEyW/K2Bx9AIgWIHi3o4jjLZkL2MFj00ZJKE4AuVaEuNu
         RB2IfPQo9NNB93IXM5pvVxEuFzh4b6ZyRwzyAofjPx+xt7CZscS9sYcWz430j1yp/VlH
         PbTg==
X-Forwarded-Encrypted: i=1; AFNElJ/8+WN4b1uxN6D/nbNbxb9FgdlWszvh5UN2PXLXE1qkSg3MEAr9zCh7lY5VA906GFyRhwrvqUSztnqSjHcz/OA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMpfhXKcTVcQCSJW3079tLOY8SN3bPYLEGnRfkd6Vcwpm8GMV
	ConRi0WbVNI6VMmdaG+uOrk10SR/pGSuf3IoNNz0mNQhzpP81kwTeZCziI8XXAs7u1c=
X-Gm-Gg: AeBDiesc2b/yiI87UaHFiDrNUi4XtsFGjWhvUNfWzoSG+p1zIEQsDouY9b438Qv7qeA
	nIb8UkX1IJKxtHmlCih2WaT3mcFLuSbYhi7qh5E0U0hpmZi/nrahF9IZ9+CKNTSabsjyCIGO4kH
	NPNOYPCh3wIKMz3nPONla3dy09AIv6+dyQnnP718wsVcqQQVDbjaBiD7j/B3nL9UgAkYcUuVAjX
	Yt0Pci7V2ygUkoY4M6fNb2ZeG2YruRSU/1Cuj6Ly6g2RhdfO7PXiAS5NCGrCradwpi68FvAY2u0
	d5fmnCLdgi43SsQ9vnGGEb4kSK01ui6bku83v78U4DsohiL9W/96+KGAUrMJtlA38gm2dISX+s6
	X/tk/P36sZ5xWMLGcQSMwtu94saCEb4mJq6/5TwcIfreTJVcA4c6iAffBXTwrP+3j3eWTdcgJCP
	UVrHL71LUKuIj7nk0tZuRZ3sRxD4WUdutlZjvWEjzav8bUYiPERd8EGKkadY1/5wPK8Cur3Q==
X-Received: by 2002:ac8:5a0e:0:b0:50d:8db0:7abb with SMTP id d75a77b69052e-5102adc9563mr74431601cf.42.1777592344891;
        Thu, 30 Apr 2026 16:39:04 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040934199sm221cf.13.2026.04.30.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:39:04 -0700 (PDT)
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
	Ilya Maximets <i.maximets@ovn.org>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] openvswitch: vport: fix self-deadlock on release of tunnel ports
Date: Fri,  1 May 2026 01:38:37 +0200
Message-ID: <20260430233848.440994-2-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430233848.440994-1-i.maximets@ovn.org>
References: <20260430233848.440994-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vports are used concurrently and protected by RCU, so netdev_put()
must happen after the RCU grace period.  So, either in an RCU call or
after the synchronize_net().  The rtnl_delete_link() must happen under
RTNL and so can't be executed in RCU context.  Calling synchronize_net()
while holding RTNL is not a good idea for performance and system
stability under load in general, so calling netdev_put() in RCU call
is the right solution here.

However,
when the device is deleted, rtnl_unlock() will call netdev_run_todo()
and block until all the references are gone.  In the current code this
means that we never reach the call_rcu() and the vport is never freed
and the reference is never released, causing a self-deadlock on device
removal.

Fix that by moving the rcu_call() before the rtnl_unlock(), so the
scheduled RCU callback will be executed when synchronize_net() is
called from the rtnl_unlock()->netdev_run_todo() while the RTNL itself
is already released.

Fixes: 6931d21f87bc ("openvswitch: defer tunnel netdev_put to RCU release")
Cc: stable@vger.kernel.org
Acked-by: Eelco Chaudron <echaudro@redhat.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/openvswitch/vport-netdev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/vport-netdev.c b/net/openvswitch/vport-netdev.c
index 12055af832dc0..a1df551e915bc 100644
--- a/net/openvswitch/vport-netdev.c
+++ b/net/openvswitch/vport-netdev.c
@@ -196,9 +196,13 @@ void ovs_netdev_tunnel_destroy(struct vport *vport)
 	 */
 	if (vport->dev->reg_state == NETREG_REGISTERED)
 		rtnl_delete_link(vport->dev, 0, NULL);
-	rtnl_unlock();
 
+	/* We can't put the device reference yet, since it can still be in
+	 * use, but rtnl_unlock()->netdev_run_todo() will block until all
+	 * the references are released, so the RCU call must be before it.
+	 */
 	call_rcu(&vport->rcu, vport_netdev_free);
+	rtnl_unlock();
 }
 EXPORT_SYMBOL_GPL(ovs_netdev_tunnel_destroy);
 
-- 
2.53.0

