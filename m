Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE92D131D
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969909; cv=none; b=r9S82JbCIcvF2h3NITS6SA+Rui2c8eaUByO4w3N8eBmZzUynnN0OauYxdRJ+zg6fPe2bVCThC37QURguAfOiRRDSf2AV47Go5AH/JsItVndvKIsxDJ4SLGJCmohdxjWl5t76guBKaowJW11Ey2Qd+sOm8tpR34rqcse2nWOLE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969909; c=relaxed/simple;
	bh=fiWuZ9fcbL8sdigaSwTTvp8tHDm8kXTBMV+vvmAza+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNv54WRr63YdrfBMkBIa2DmdJyTsf9HtOjRsziHmvTtkRdxx5My9mtYoFdHWlBRDHy2qhI81AqerWX4giqW+pJexg9iX/b/itwcm7d81u0s/GMf0tSSJUyX7VvXZik6jm7Dcbv+DlZJ+JmP+sv4v9IQJVL+rmOTZeRfCYOjnlEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1279eced0b9so216980c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969906; x=1774574706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7EJnW3kdUcA/mWdICiYp+Buoz7NoSHqg/f92gpxvDwE=;
        b=busWn/IxhNl8hmZZgV5r/NY96SkyeR3N3nvsx7lKBC5qhLjOHnj/SLZ0dBqfdatISY
         AEAKlgeXNcOKo6uOfQjc7U8kfFSqJLRplgmx6dIQQkEDNjLSat7eG5n2QGXW573XayP0
         +3c/nb1eeL4qmZ1FvjH94EpX+iCkSIOE6u3eb6msnEEqUWGB+0hmb5BO6LjGesnggx5Y
         Nx26OhL2hRcri+qErMxEYIMIfE5oHahE5dqsvMhUkhboV2cEIe197g86lPk2S13GSJ0X
         X3AKICJ+Jl9vAC1ZWBHTh11zhEsbYKTcDIT4dLiUBvCdqU8nEBJ8YfXeHZOYd9Y/lXsa
         ZsLA==
X-Forwarded-Encrypted: i=1; AJvYcCWrEf9aGML4W3p/+/N5hZO8WZKMAxOCJnhmRlFT/OMAOQgQZrY27OI9acQbsEv4I6RD6sWRO66J1VVR5hTcIIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlC2w+FUHptE1TRL8IR5sHrlHKJtCajQaHSOROd6KqnQGGF2N
	7BWXl7CMkH7NLWgNLzbGuuw7ii8iangVPkbAdWbTr1EUvvXdoxxWagc=
X-Gm-Gg: ATEYQzwiPKL7S87PneUhUZDQdsDuJvEsXSZSq1gtOji86hqcsdRXkhqCtrT5fEwF4tw
	jM6adlfow4vhrsaKK0sA/5C7GDdO739l4D/z87z/YwYQnJhxhYbNP1OR2p4eoCpK50NjGjmOoY7
	WnALGMGC0l6B3JmMt2dXulfHzHeawtcCQHAt7lZ/zM+pcGG+J/iUt5i2hAdgb3MUk0u09p+rczu
	P+T+6NkLGP69Ld6RC6BOP1mTNldB1TZnE4dVZG4RdV7XbcmBoDf5tNP8TbrbDBtaC7sQl+jJJxi
	EWTmiXA41rgVIiVNPyJBdCI4aao7w2RGN718Thfbh2MCTThno7bML+bSuhxtUMRiNwbHVdhwlCi
	DYeZRKFxcDt1jFlfOxMfht9QF24hesfLH/6UJxtZut5e0+55Am42xEIy0iublyY282ET+AZI99v
	AFKpKlBG3clmqspGpuhhHi21psQLqJS1QiZSr/6WyICDnb8SRleX75TafJSv6kkMWrv+bGm7gCy
	SqnG9zTg3Uf33/ruQ==
X-Received: by 2002:a05:7022:ec18:b0:128:d17b:e7ab with SMTP id a92af1059eb24-12a726f6573mr546108c88.36.1773969905386;
        Thu, 19 Mar 2026 18:25:05 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a736b952asm749391c88.12.2026.03.19.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:05 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 02/13] wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit
Date: Thu, 19 Mar 2026 18:24:50 -0700
Message-ID: <20260320012501.2033548-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nl80211_pre_doit acquires rtnl_lock and then wiphy_lock, releasing
rtnl while keeping wiphy_lock held until post_doit. With the
introduction of rx_mode_wq and its flush in netdev_run_todo, calling
rtnl_unlock here creates a circular lock dependency:

  Chain exists of:
    (wq_completion)rx_mode_wq --> rtnl_mutex --> &rdev->wiphy.mtx

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&rdev->wiphy.mtx);
                                 lock(rtnl_mutex);
                                 lock(&rdev->wiphy.mtx);
    lock((wq_completion)rx_mode_wq);

Switch to __rtnl_unlock to skip netdev_run_todo in nl80211_pre_doit.
This seems safe because we run before the op.

Link: http://lore.kernel.org/netdev/69b5ad67.a00a0220.3b25d1.001a.GAE@google.com
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/rtnetlink.c   | 1 +
 net/wireless/core.c    | 1 +
 net/wireless/nl80211.c | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index dad4b1054955..b1bfb4a4aedd 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -150,6 +150,7 @@ void __rtnl_unlock(void)
 		head = next;
 	}
 }
+EXPORT_SYMBOL_NS_GPL(__rtnl_unlock, "NETDEV_INTERNAL");
 
 void rtnl_unlock(void)
 {
diff --git a/net/wireless/core.c b/net/wireless/core.c
index 23afc250bc10..a78a9b613c94 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -41,6 +41,7 @@ MODULE_AUTHOR("Johannes Berg");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("wireless configuration support");
 MODULE_ALIAS_GENL_FAMILY(NL80211_GENL_NAME);
+MODULE_IMPORT_NS("NETDEV_INTERNAL");
 
 /* RCU-protected (and RTNL for writers) */
 LIST_HEAD(cfg80211_rdev_list);
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index e15cd26f3a79..f8ed8730cf1c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18203,7 +18203,7 @@ static int nl80211_pre_doit(const struct genl_split_ops *ops,
 		__release(&rdev->wiphy.mtx);
 	}
 	if (!(internal_flags & NL80211_FLAG_NEED_RTNL))
-		rtnl_unlock();
+		__rtnl_unlock();
 
 	return 0;
 out_unlock:
-- 
2.53.0

