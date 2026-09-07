Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F1400963
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763373; cv=none; b=WirLqEqLQwFSPDYqP178GKuH0RHafLku4kudnN/n/ZjVF08KwGEmV8f+jyqVMQInXDDq8qkouEwc0wC/l4a+VuoeYTt4h2XjzZ61j3FG5cHs5Ik4eG0wp633RBYWL+Cs0GFsDzmcBMs5woOxPgJ4qovO7Y7Z9VhvQV5Cs4/hPaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763373; c=relaxed/simple;
	bh=obCt6dFIrhqK0L3cVGv0aYy1LeuBf7kuUudz81Z9e3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7qzdHUswd8YhxyHEpLtF1i+f/OAzuhiJak0sBoWK6dw1FPwT/4tWRfXlQuz9FmtKzoW8Zz1Q4HmcEtPvYwBqhHJH3rLQjBxLjTwRrY5ePxEU8YWC6XQ987DUViWO5E18Fr4IIDsXa7XaUwCR02lKS7Syl8OUvEapRMW9X8tnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2CM20xR; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2CM20xR"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so3151335a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763371; x=1789368171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ar25cKs1gH5uWsuIBDWcu71MwwQW4FbjSNAQqbQcxuM=;
        b=R2CM20xRVjgggwT6RZ9dSkgejffFNsFnk969uwIletslHRlWM2AM0Cr8kzvGwf0yIl
         KwcsFLjVvcdoDeCfOsMvAm3K8Bs5OVwPjV8UDfFU0Xzggvboue9dQHK76Z5jdfGzpHXu
         BCZRG0b0yewzeZP5AsHry0GMqg41JJeyKlT9JtQR2UTY51q01WcvdTmvV/SMUorTz49I
         lpQoRa5E5ThOZc03Ojhal46F72whX7RZr6teukT5BaQPcxImtFYlzRS8+UKvJL7sO2E7
         Lo0ejR9ivA8OWn1sKu06ohAqoIt8XJC/6cdTjVRfF0plg+mgmkLOgxnHU1/jkuEGPf2A
         gQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763371; x=1789368171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ar25cKs1gH5uWsuIBDWcu71MwwQW4FbjSNAQqbQcxuM=;
        b=AGcutaQ2+gM1IDi2eQjZExHogArOnvlIulFmAq9/XphFfjp6PZfuP0cdEA3nEBsf0A
         9xraUBiV32EYSjc8kHdFnUwu8pJgrs+iES+IOwhzKYVE90GXJN8CE5arjTYEf0C5Z8WM
         +FSCWT8u0tREoabQkBAqJtUrfIjbW24O00+fKPriWm+w+wNaW7UoARPqCQ+b0/M5bYT7
         +E+Gsj8AyRlohb0qQc5/21Q2q2tXWCldNJzxnXuVl9qI/0uJtHA2bbatOpvBzSwpaQtx
         nCC+Z8vi3kq12EzjoYu1X0Xxyrqhnutvdu58mhX4AGRi0AgczIcoLv/IP8D/ApIx/Qso
         JUyg==
X-Forwarded-Encrypted: i=1; AKwUvBywsyHQgJ0FIHsVmQ358BjhUHyd067Nkm5Mg+yK6/BdXVQm2BLRjLT2kATlb14BxIdkRLwQu0usNLbXKwgNfbs=@vger.kernel.org
X-Gm-Message-State: AFuF++myck90eKfu7qyPLq/7NJ2aJJFqtjiOaDxRxPpoJ4L8+Axzy69b
	DSVvSrARM1GEPDw2/aVZZVBfb5ZDKl3JTIk0fHT2STrskgvSIiIGmBU/
X-Gm-Gg: AYBFou29yB3aVVPwhEVb508cll94MBj/Xpxs9jdCBf4M7crv/Dfn/JgZFsJTpzOviw2
	1RbswKHkbqfHd/yTZt0jmRi3kZhDkt/RyUWRyUeY2AdG4yy3ABR6eLk/ZbTVfETYh9BeZ/SjvsT
	TuI4PBOvX7JC9oHoTmBWOyDVsR6UfiaN31Y/9pWcRIYPx78jZ61Wrrfyo//iSGgQjKIdWgXwqC/
	MW0fwr8XSAc7hW8Kr0bum1wFiJgibXWxRxR0MeSIpCoxPsPdW7RjzrmHo7p/ruOLuTrXJB7ntZt
	BsbHiR3kY96Nr3+qURe+4GN7Qd1rMbMnw5AX5kwZmRCa7cAAGrcqTeROZpBtqsjKXPUpOelbznZ
	U3Yk9vLFAYudf6V/xr82ksf/8ntRM2GZ6Yj9VEZ3Hmwl+uU+KdpOKY5xoB4GzRn+1wQsqxvj85U
	CF6mjYhig+s0rGz8Cuqbjz5rrKKZbWY9Yigk4NhMIAKE6QHlVuY6F5nY5rOp7oGGd+Hkd+Mm23C
	3bJ3HhSG+YJjA==
X-Received: by 2002:a17:90b:4ac5:b0:398:9beb:a2ba with SMTP id 98e67ed59e1d1-39b087fb503mr30411442a91.28.1788763371277;
        Sun, 06 Sep 2026 23:42:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm14377817eec.8.2026.09.06.23.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:42:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/3] net: ipv4: fix typo "alignement" in comment
Date: Mon,  7 Sep 2026 12:12:36 +0530
Message-ID: <20260907064239.39910-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064239.39910-1-hemanth.selam@gmail.com>
References: <20260907064239.39910-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "alignement" to "alignment", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 net/ipv4/netfilter/arp_tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index a87e07e80d0d..b680bd14d329 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -59,7 +59,7 @@ static inline int arp_devaddr_compare(const struct arpt_devaddr_info *ap,
 /*
  * Unfortunately, _b and _mask are not aligned to an int (or long int)
  * Some arches dont care, unrolling the loop is a win on them.
- * For other arches, we only have a 16bit alignement.
+ * For other arches, we only have a 16bit alignment.
  */
 static unsigned long ifname_compare(const char *_a, const char *_b, const char *_mask)
 {
-- 
2.48.1

