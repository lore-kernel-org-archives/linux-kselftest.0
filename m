Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2233F8B4
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 03:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786590484; cv=none; b=S2dS9iPnlzE0BzSYSLwL7GLW1dxKGKhprU/W1xrq930jGOLbyf0IZzmVbXBnsMAadq69XXePPkN91Y0QTzCLbwXm0ccqFutGs1d37nxTt0U6c7N25z1vzuQr2bGP3lKRBEMY7epN8ck9l4GJfPz70d+9cRhelJR/Fh7XkxBAIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786590484; c=relaxed/simple;
	bh=mTfz//S02D+E9NcyVZC2mIxi+/sJfzplMtuwvDmQTqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GhNMHEQHCCWxr5h1B2MXBXlkArvfKrfG5e3ZRcIaee4hwwuhZ7MLvfTCM6JGapME0wRrdTNmIVrfT/AYDotxi2HZBn0mwrhM34Xo+FffiMLUkL8O7KFJstGF8KfJIzkcz+sQFfya2h6G1MySaPNPNTkMCoxPUFeY2LpBgDEk3ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/1E7ZtX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/1E7ZtX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso22974865ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 20:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786590482; x=1787195282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXT+TFtZILC9kput4/TKXz12rDzU5NmQQ01pk2ZkiiM=;
        b=c/1E7ZtXhTxAU7LBzJ/jc6CV3MntOLb6efK1YKAxvzqWzCJ9gsngiwiQML9eJ/UUlK
         +IBYINDtt4Z5KVmB1WToHAjrHomB1I5W3QTS/4p0FiYVIpOjrktGWHywE+VnHiAHztzI
         RP9WBOpWUba3p2oiakG+R5NVEicONAR8SNQ78V8IsXpHjVtZXnjPBVHNjaxiGxYmiefA
         WAT2o6rkU7VR90YhvYWMNY0VzBlQWay7Gu47rKmQz2NnM7ADDT1DuCKnWzDQSSXUUGY1
         VgYTu/id6m+GDBSigDfQYXK7RhuOVkt8qn5u99o0OB9XVrhlnp99i4OXrzfd+zSZlIet
         KbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786590482; x=1787195282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXT+TFtZILC9kput4/TKXz12rDzU5NmQQ01pk2ZkiiM=;
        b=Fqr2f9Cb0Zwvdo+0hkdhx4qoMHhT1Bwoiq6fSa0DgJGTKS3KFMFQ/N2zt1HGXJWCx0
         4De2bREjneuR83NeUtpz/SK0mNbxsceGF3DDage+fl7n/5wIIuZQE3vPScejzpfGgdu5
         YphNwyxoU4mUuOM5jijlYk5xm171O4bMLjV7tZxXE+b7RyjoPC/EAsYceP/8VdezTk5j
         sT0bDAtd9rv+bYQuJsoAfdJURWX1y3ZZefry6L5KeJywCzEl8DoLY9iL0iNwkvjTy56N
         ylkOq+xK0Lk0G5b8R5Tl0GPNjvZ6Eg3MXBjEaa5D73sdYlnkY8CpvRFWu8bEd0bq/2uf
         4wOA==
X-Forwarded-Encrypted: i=1; AHgh+RoKo/K2Bd2EL5ybUaM1k6e3U6835SMtIjihq4JzbngcIIOrsBeIBf4UC6dQXFD/KMpwdhIh5TkARObxUsCrptk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXYzrLBlmOt3Ll98LIzeIXtJw47bgVMIGApQ1fiUphpFFgSjML
	bWQ0wa+Ak0nbJHBvuMBObH6XetoqUkSToMJGP7ufdBj1Kq8TWcPK5HO1
X-Gm-Gg: AR+sD10mHIjIj5L9t9t9znz5XbVfpbD62HD8mUrfhiRROLgP/Vxfk7bJRp+3cdCqHN6
	Do9D+/2fogA2iQ2hW5I+1M690O6LTnJdVC2/x5iD7+6pYHjNYN7GfM8ME6Tg0dqWDnIPA0/q/Zu
	JGaictW42sY6HM3qxAqpPD33KmqYBInu5f91fRC2vXWC3W2n1h1puVZFqId4a9z1/FCHsaCFr1w
	w6cZIQQDqcR70R8/+1YzMhRJDxIhOJJ/Cjo13uMUzRcaUd8eC3fGl3tlxaOgvxdsdk0kXZUOz4g
	xu49iiTBFm1JLVW+i+gN80eccBtpSyg1ob9jxpgrnzqFftfjWExexdVjh9T0GgKcNQTV/h2iID2
	QowsM5pAmAvI53g71hYqxjOqlaBRAkZdXoIQTDeO+EOhtMQnJ659FU1VjOde06JQYCJhW+LRvpH
	AwamNDWFALu4+yf0fSQYIVi5mbDCjplwD6Z2mQ4Lvg4fSmRVyEGMGR5GLQHa8Q8PpDJvrKvobL+
	Kxg7P8vvNOwW/GI+w==
X-Received: by 2002:a05:6a21:7002:b0:3cb:eca6:ce5 with SMTP id adf61e73a8af0-3cc5539af60mr3994167637.24.1786590482312;
        Wed, 12 Aug 2026 20:08:02 -0700 (PDT)
Received: from sdklog.tvstore.opera.com ([2804:1b3:a8c0:46f0:6d62:6c3f:1af0:ff3c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf731f95sm2249048eec.15.2026.08.12.20.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:08:01 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next] selftests: net: separate ipv6_flowlabel_mgr test
Date: Thu, 13 Aug 2026 00:07:05 -0300
Message-ID: <20260813030708.37609-1-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipv6_flowlabel_mgr used to be a component of a broader overall
flow label test, defined in the ipv6_flowlabel.sh file. This wrapper
script called tests defined on ipv6_flowlabel.c and
ipv6_flowlabel_mgr.c files, using predefined parameters and enforcing
the in_netns.sh helper to set network namespaces for each test env.

However, the ipv6_flowlabel_mgr.c was drastically changed recently.
These modifications led to the mgr tests becoming a self contained and
independent test suite, enforcing netns creation by itself and
not relying on the ipv6_flowlabel.sh wrapper for proper test execution
anymore. Therefore, remove the mgr tests from the wrapper and update
the Makefile to handle it as a standalone test program instead.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 tools/testing/selftests/net/Makefile          | 2 +-
 tools/testing/selftests/net/ipv6_flowlabel.sh | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index ab890e6f79dd..0f5c178bc224 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -150,7 +150,6 @@ TEST_GEN_FILES := \
 	ip_local_port_range \
 	ipsec \
 	ipv6_flowlabel \
-	ipv6_flowlabel_mgr \
 	msg_zerocopy \
 	nettest \
 	psock_fanout \
@@ -183,6 +182,7 @@ TEST_GEN_PROGS := \
 	epoll_busy_poll \
 	getsockopt_iter \
 	icmp_rfc4884 \
+	ipv6_flowlabel_mgr \
 	ipv6_fragmentation \
 	proc_net_pktgen \
 	reuseaddr_conflict \
diff --git a/tools/testing/selftests/net/ipv6_flowlabel.sh b/tools/testing/selftests/net/ipv6_flowlabel.sh
index 2eeda39bf64c..5d1b5464c54c 100755
--- a/tools/testing/selftests/net/ipv6_flowlabel.sh
+++ b/tools/testing/selftests/net/ipv6_flowlabel.sh
@@ -7,9 +7,6 @@
 
 set -e
 
-echo "TEST management"
-./ipv6_flowlabel_mgr
-
 echo "TEST datapath"
 ./in_netns.sh \
   sh -c 'sysctl -q -w net.ipv6.auto_flowlabels=0 && ./ipv6_flowlabel -l 1'
-- 
2.55.0

