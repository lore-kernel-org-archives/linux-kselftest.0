Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1680E3ED101
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846214; cv=none; b=AH4S4h4eRELG8zS4GNtD1KCO53Y7ZQ23LK0RL4snIwRURsO7yphtIFTFBntu0Y7/cGcZgqmSTosVzcrWI9UBSAXVv9O8chlj+gJyEx6CWVCIiMdwFsgqM6Qyo75XZHpc9QEOKnAPPE2/Wa6lYMyAL3xJH0z6GdKIUzMM3ovhGpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846214; c=relaxed/simple;
	bh=fFbx4L7c5RG8MsSh64xUKulTqmO1Wn4GpSHiz4YrwzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzS9EjKd/HtOY7oaQipdsuvPtOiouylfi/bV1tmYdyC+Hc9rQmnsUJgwlN0vUi5sLdTrwB8EGQd497jWh4O1Ea3C46wgam3EhsvtHPoRtVRVdgqe0YzzwAAK8NQL92Dbd45XosD9NuG9X+Xbm+EpMm9LQjWirLptk7FE0wI+MCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-127380532eeso192907c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846209; x=1774451009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LwI56IvSstpXQXaX8+DYC8cYl7ak5TMhpM2nnpgQBwA=;
        b=i4kkTqVxqkhIN6jQ8UOOVwo9GzWK3V3MHq/2XW5PytPdpHTcFI+HI5BjAj7HNySCk0
         R8H8T6usIXJHP02lPORARkV0nABXA0i4Pbl+ATMxamUYJ3PR4CAS24Drr1X64wCEPILi
         4l3yLogbza8sDrnEXsDrJqVPDu3YBvhypLsvW+LTbbDFVlQnYBjyPM3ldXTLrSf7IYlY
         U1lKH6KHb950bO1kt3GLIoAz1uOTXTY2cXg53Lq+JA8YJWbCO4Zvbyo7I613RFmTq36C
         WZdkKlt+fgrZ6biTZG8sAq8wC0uHGKkKwW8+Btd//HEb6mvimnU71FjgjWK92nkTxBPL
         l5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiZZ3q+Vm6lpXaGhf+QDf4uhMTZvmqA+wKqKU/uJIQqyqOeh1mxYMcQ2IrON2Ro5JD2kalJ1CPct+ih+nXPLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMV46RqkMAWWn1CuTQXfTL7k3OdeisMijkkD+FUbhhEHs8l6m
	QNFyfFBnSUXydaOJY2Ozq6otWlc8bVVvR/sI1P77nwyX9o5Qh6XkjNU=
X-Gm-Gg: ATEYQzz3BLRsJDMWPb3+nvQOu1nDFWvYnAMQJiVj0P90PleyFiEHsFgL5pQAUbQATGe
	zko0Ez+Da2liTM6X4gnzG4UtFMQM6MFLQVFlH2uUtZ8KNhPp/3clPo0sNOOwGDd4IGBMmBlDqSB
	m19rKF/Ww/f1hbigR8k6tnaF221SM+FtEfekBkP9+nkDquYuUiC2T35CMD2a4x6NrT58+XJ1GmW
	Jja4Q/zdekoA/Wix93lxiDVQwYb7tWDwtuavxjXIlyB7wtv3ta0zk6LMkTu27Pz6uLjpNphTPZ2
	ayx9UrliRFQY/dAjccZygvZwJLZQADcMI0/8rVT/sNEAwveOpP2mBjJA8fet2ZY/4rqmUGkmL+O
	Ty4mu4mjpF48jh0PC4pA7Ay9I1fzQa9RxDnMVdau27fdmYrS/DQe0qRVaEXm3y/5Ldu8rIgrVmt
	kAhj7C1ohhQ0o1GKBA49emowoLdxg3aCs18MJm/6hfkwh2S2PYkA/xLb7jrqvm6nWmk/zVKLIj4
	Xt1SPytOFFXvu4EXA==
X-Received: by 2002:a05:7022:43aa:b0:11b:c1ab:bdd4 with SMTP id a92af1059eb24-129a70eab62mr1700585c88.38.1773846208379;
        Wed, 18 Mar 2026 08:03:28 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a7256263sm3541023c88.4.2026.03.18.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:27 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 13/13] selftests: net: add team_bridge_macvlan rx_mode test
Date: Wed, 18 Mar 2026 08:03:05 -0700
Message-ID: <20260318150305.123900-14-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
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

