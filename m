Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833E314A84
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969923; cv=none; b=r8coP+K8Jwkb+50yeBNh3iGLFF6/UnJlIfRdzlDj2LL65tVjo6RaOt1jfaxE1g+nVzRtuMriRt917OW+dXgjYXfQWoH3BQL7TVYx8T0pp85mMvsFoWU6Pp1Ew27dKGX8yYz8ulEmgxnsFeUEvOllivOx39z0Y/cvClTlyNzMlcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969923; c=relaxed/simple;
	bh=fFbx4L7c5RG8MsSh64xUKulTqmO1Wn4GpSHiz4YrwzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2WPD38Rsl7NB6xIA5VhSYn28jxEa6WgoxHm9mzwjW1zWYqlY1eIDy8JuOr96AD1hhj295fxa8M2hEDBNbNLlQXU4/+Ed0mqCbHefFotaZoLms3GR51HgzAiLufKKTpu0N972pd5xwjC3KJP7KuRjXfR1Ppas/5ZIGcIOX3/v+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so1407681eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969919; x=1774574719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LwI56IvSstpXQXaX8+DYC8cYl7ak5TMhpM2nnpgQBwA=;
        b=B+WkzCOzl2eCqw7XMkI0N/TxDqPWwgYxBUUXpWkz36Iw7IbrGJqDx76x91FfXPWTQd
         MwKfr/9c9A2GnFdqXXs6TMr+uhAiIRF9SodVJOyH2af0taNcgLbjclbosnGAawjvZ1HE
         nMD4fuf62zB/W49HOTfHWsPQvq/hBN6Zwe7GisbPsPVr93WZBBErrYEzTAWfEArOQbPf
         M69oa6CMOY76o60y5EJwyYESDyesf8gtcnnfPWlL5z8M1pMU+oI9RPQSscvl5rMP4CsS
         O7zOCnIC7TJ1VN7dZTQT6LKHNZDXs42ec6bdIrqhugL9Z+OAcFdaigT22Deps56P1jWm
         vyFw==
X-Forwarded-Encrypted: i=1; AJvYcCWu5ujncQNN2T+KTGfZrKh+gn/d4eu2FLymA4XuRouiLoUw5ECfNmkSofkBi5J0tVHi8oW5+fZ1n2Q+mmC4F8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZIaiM5MRQjtg2XJQMbhEMB9unP8p9zNcQ20ZLEJ2YGIgMZp6w
	64bIK5zFPzE0DBar2E8DvlBlxe6ImZRLCBUtaHIZqZKBRJkjrRccjNM=
X-Gm-Gg: ATEYQzxrISfOidtC88Xnm30mykyaf6ipt1aSNePWQ8qwiW4DeeAxAv8saiyOJJmF3YP
	deDx7+cAPvCON984h02GR1poYkI2ruCSqEO8XU0DapTEP9HHn23ma3YhkX0lOmV9aJHkP7XPJQP
	QiWCQnI+NZA+n0mQuyYK7IHC0DI9h0YZ2QVFAKL37YBErj0qjkwDXCPWF6hPaJivVdsbSzYN9Is
	+1AJiOULeYvOVc1NfTxQutCtN0Eb454ojnfMjkvArvxgGMeXeAYVauXujdq2aF+/Lx0Oj52Vseg
	WRhnodxU/ie1jfO0Ukw7Wb5AFMoGQpqy8YAvyD4No7ChzDvGGxro2ntOaf4jYqhG+D5GsdHpeZM
	t38syAAu3+wfhYcvcDVn/bHMt+MXv4jyXNH6Isr9jzktJO/Cpobm+JcZbuCiLNRBXh164A6LT9V
	PxZydaK2J4EXKil7izcNZRHsha2YQWT6GND6dnpibwkMokqAP3872rogx4pOYHbu0Z00wdCt0Yl
	ruxG0ySBrQoRao66g==
X-Received: by 2002:a05:7301:4198:b0:2c0:c415:cfd0 with SMTP id 5a478bee46e88-2c109666ba0mr851744eec.15.1773969919058;
        Thu, 19 Mar 2026 18:25:19 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29d28csm1378065eec.19.2026.03.19.18.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:18 -0700 (PDT)
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
Subject: [PATCH net-next v3 13/13] selftests: net: add team_bridge_macvlan rx_mode test
Date: Thu, 19 Mar 2026 18:25:01 -0700
Message-ID: <20260320012501.2033548-14-sdf@fomichev.me>
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

Add a test that exercises the ndo_change_rx_flags path through a
macvlan -> bridge -> team -> dummy stack. This triggers dev_uc_add
under addr_list_lock which flips promiscuity on the lower device.
With the new work queue approach, this must not deadlock.

Link: https://lore.kernel.org/netdev/20260214033859.43857-1-jiayuan.chen@linux.dev/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/net/config       |  1 +
 tools/testing/selftests/net/rtnetlink.sh | 44 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 2a390cae41bf..94d722770420 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -101,6 +101,7 @@ CONFIG_NET_SCH_HTB=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_SCH_NETEM=y
 CONFIG_NET_SCH_PRIO=m
+CONFIG_NET_TEAM=y
 CONFIG_NET_VRF=y
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_OVS=y
diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index 5a5ff88321d5..c499953d4885 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -23,6 +23,7 @@ ALL_TESTS="
 	kci_test_encap
 	kci_test_macsec
 	kci_test_macsec_vlan
+	kci_test_team_bridge_macvlan
 	kci_test_ipsec
 	kci_test_ipsec_offload
 	kci_test_fdb_get
@@ -636,6 +637,49 @@ kci_test_macsec_vlan()
 	end_test "PASS: macsec_vlan"
 }
 
+# Test ndo_change_rx_flags call from dev_uc_add under addr_list_lock spinlock.
+# When we are flipping the promisc, make sure it runs on the work queue.
+#
+# https://lore.kernel.org/netdev/20260214033859.43857-1-jiayuan.chen@linux.dev/
+# With (more conventional) macvlan instead of macsec.
+# macvlan -> bridge -> team -> dummy
+kci_test_team_bridge_macvlan()
+{
+	local vlan="test_macv1"
+	local bridge="test_br1"
+	local team="test_team1"
+	local dummy="test_dummy1"
+	local ret=0
+
+	run_cmd ip link add $team type team
+	if [ $ret -ne 0 ]; then
+		end_test "SKIP: team_bridge_macvlan: can't add team interface"
+		return $ksft_skip
+	fi
+
+	run_cmd ip link add $dummy type dummy
+	run_cmd ip link set $dummy master $team
+	run_cmd ip link set $team up
+	run_cmd ip link add $bridge type bridge vlan_filtering 1
+	run_cmd ip link set $bridge up
+	run_cmd ip link set $team master $bridge
+	run_cmd ip link add link $bridge name $vlan \
+		address 00:aa:bb:cc:dd:ee type macvlan mode bridge
+	run_cmd ip link set $vlan up
+
+	run_cmd ip link del $vlan
+	run_cmd ip link del $bridge
+	run_cmd ip link del $team
+	run_cmd ip link del $dummy
+
+	if [ $ret -ne 0 ]; then
+		end_test "FAIL: team_bridge_macvlan"
+		return 1
+	fi
+
+	end_test "PASS: team_bridge_macvlan"
+}
+
 #-------------------------------------------------------------------
 # Example commands
 #   ip x s add proto esp src 14.0.0.52 dst 14.0.0.70 \
-- 
2.53.0

