Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BDC362127
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 18:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131651; cv=none; b=gc/R4I8SUAo+LMSg5zqgWX69QjBiXdJkzoNRua+Jn0pABAvZwZdV78MpDaMdDquWtYmsHUdmD1Yy8YFNUsewfYbWBfXaVS2PWxRoQciCaTwEAvTEK7rgyf4JOQzz0u4rFgmjqvObVfSt1dzIjrvJM8eO5ehJNXf3Y1Q7q+EOOv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131651; c=relaxed/simple;
	bh=o5gl4lvmo8nTD5aew6xv75adaez1vKzLC90tZuUkeGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKSEfybx0RbQ4wO+KyX+FQuHw3cOGaaMFPDaz6mEaW8XdpT5zxjKz7YovpfI/pB7bgLa7jgMslEtNy1Pa9p3D3QD17J6jBDGTB7fyZV+I9K05tG+YmW0kY/VEBji6/m6P9uzWFiHOVMeh47QRDg1TXncGfd6QI0kWrA0T94JQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DPlwYU91; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DPlwYU91"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8274a3db5e3so177028b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772131649; x=1772736449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jafYfDMXlkNngqCFpdDSXM7Zpv6/tNdLZ8FA9C+kjOU=;
        b=eHD8PsxWz9vx3mq7NEaOJaYP31Lv2HMmNij2ffFUL9Q2ZRv0y1XrayuqxANVe+I66t
         jqPDwkibAnyqgzhBcVVTdzsFVoCxtmRigpfkPeOFxvltyKwjGUVW9XlMPinz6hx7wnCc
         E0hTV2kI99NbR21YYU4x4DT9h2mdPD1TV7skcn9sjapbAIjzjwj3Eocl1V412UpUam2i
         Az/RCYQDO5gGfQZljwi/s3I+U7ADB7hijoUpe9NC26iL5/+a+GmMZx0xE2ku3G+/YDT+
         CCdkZmMBBI3rgYMqyaFpmE8p+zDyjHEWFR4+0RMBxWOT/KhoVxVIgZ+lCZ/H0z++2q/y
         I2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU0epDZE3cUuIcEX6PkFFpExtBjZ+DcFOmyf03fX6Wq68Ak+ovsD8HEjHHe5Uxvyd52vduRvWHZClnzIgUrDq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMgm+pT4gdpel/4BW9xcyNWveFurNOKDPbJWptIP2sAKSI/Sj
	6Kh5FdHAg6LB8Z7LcM312bYfhBfwmpR9r3KVfEDcUkJouqG6XXu/RVNyztMztr32nsH7KkRueYi
	kLDSKj2uwWPDE+jCO8oRVALUfs1oezdxgR8H31APVxiRqze6aY3h8OLEmA2GotYw1pG7f3TzQBM
	yOYPoPSGXuCeCcrsmluAaWghaLi+RvLonycgZCSSkHHQRTUSeWlfnpICKokcsP7mjUR614svDWX
	OD03/OLYCcb7CMaWja3tM+Q
X-Gm-Gg: ATEYQzyGHcCzlPH8m6yL1TkLIkwWhiLbDA/+jsuA1prnU52d92HJOPD6QHqAAA8+qcn
	DmUs8HUZHH6IpnIAqLSBin0A05wJ/juUo7r/uXs9XAVQdj2tsqNP6o8JAhKPOv28L4TyvKp2Sm2
	Ro3t5B8DVv7R1/YlE4uK0ZR10LGLumg6m+7a9C3w0A2p6PHA8Lzj6KcSnq8DqaDHZZKXosM05XV
	B8oeGwOQtxnERJDScEKpSITXl8Sv8rNbSzk6TcayCbiwCTPzJlCKHRCJG7ajkSnjfeSjjq1BK3B
	XDS/bXGTxZoScUgsBE2/of+np7lvWd/07rPKuVXiXdRbzSbtP2sct26w30ioYSfACqu3kEjvjQS
	MqFUFN59ndBobG7X021Mj3CSyPMfml5txyKh5GBWk9YKGTsZDlxg0dNgr7U6eN43fefsIKAm6uB
	MSVdPXwu0/p2k3GQQ83FR521hu0mOMdQdjs0HJoNZXzoUhyH34RRox2MsVpA==
X-Received: by 2002:a17:90b:4e8d:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-35965c93b26mr137822a91.19.1772131649212;
        Thu, 26 Feb 2026 10:47:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35900db9555sm899458a91.2.2026.02.26.10.47.28
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Feb 2026 10:47:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb37db8b79so1385186085a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772131647; x=1772736447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jafYfDMXlkNngqCFpdDSXM7Zpv6/tNdLZ8FA9C+kjOU=;
        b=DPlwYU91pHG2TRP+TouWPRpfSuo9C80R0NunXO5UE1Z3LC4rKwcLv5r8hpXC9AV5rc
         w60UZiEzzsmaqXnyCxJefJ1mM+AWND1ASYGpTpqDD+uK+bjsbkupRKEkVqRVA8KzvT0C
         H3SGu2SSPANPdbKgXREpqsa4rPj4k1Vrtzpmg=
X-Forwarded-Encrypted: i=1; AJvYcCUdsPI15DC/XJZmtY2Gt9rkw0LthKiKd9jMI0dZMssWokJaNfYiZ7DlSDnJaSjeuX2TjYP9YWmOP1qrDVIlz6A=@vger.kernel.org
X-Received: by 2002:a05:620a:710b:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cbbd04021bmr612526485a.59.1772131647541;
        Thu, 26 Feb 2026 10:47:27 -0800 (PST)
X-Received: by 2002:a05:620a:710b:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cbbd04021bmr612522385a.59.1772131646927;
        Thu, 26 Feb 2026 10:47:26 -0800 (PST)
Received: from lvnvda4076.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f5c41sm255721485a.24.2026.02.26.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:47:26 -0800 (PST)
From: Kiran Kella <kiran.kella@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	daniel.zahka@gmail.com,
	willemb@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jayakrishnan.udayavarma@broadcom.com,
	ajit.khaparde@broadcom.com,
	akhilesh.samineni@broadcom.com,
	Kiran Kella <kiran.kella@broadcom.com>
Subject: [net-next, v3 2/2] selftests: drv-net: psp: add test for VLAN sub-interface
Date: Thu, 26 Feb 2026 10:46:54 -0800
Message-ID: <20260226184654.3180648-3-kiran.kella@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260226184654.3180648-1-kiran.kella@broadcom.com>
References: <20260226184654.3180648-1-kiran.kella@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add test to validate that the psp device information is propagated
properly from the lower device to the upper devices so that
the PSP transmit validation passes.

Signed-off-by: Kiran Kella <kiran.kella@broadcom.com>
Reviewed-by: Akhilesh Samineni <akhilesh.samineni@broadcom.com>
---
 tools/testing/selftests/drivers/net/config |  1 +
 tools/testing/selftests/drivers/net/psp.py | 81 +++++++++++++++++++++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index 77ccf83d87e0..e03676f1d993 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -3,6 +3,7 @@ CONFIG_DEBUG_INFO_BTF=y
 CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_INET_PSP=y
 CONFIG_IPV6=y
+CONFIG_VLAN_8021Q=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_NETCONSOLE_EXTENDED_LOG=y
diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 864d9fce1094..b3d00bb01816 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -9,6 +9,7 @@ import socket
 import struct
 import termios
 import time
+import types
 
 from lib.py import defer
 from lib.py import ksft_run, ksft_exit, ksft_pr
@@ -18,6 +19,7 @@ from lib.py import KsftSkipEx
 from lib.py import NetDrvEpEnv, PSPFamily, NlError
 from lib.py import bkg, rand_port, wait_port_listen
 
+from lib.py import cmd, ip
 
 def _get_outq(s):
     one = b'\0' * 4
@@ -570,6 +572,83 @@ def removal_device_bi(cfg):
     finally:
         _close_conn(cfg, s)
 
+def vlan_basic_send(cfg):
+    """
+    Test PSP over VLAN-to-VLAN traffic
+
+    Network topology:
+      Local VLAN (nsim0.100) <---> Remote VLAN (nsim1.100)
+           |                            |
+      Local Physical (nsim0) <---> Remote Physical (nsim1)
+          [PSP configured here]
+    """
+    _init_psp_dev(cfg)
+
+    try:
+        cmd("modprobe 8021q")
+    except Exception:
+        raise KsftSkipEx("VLAN (8021q) kernel module not available")
+
+    vlan_id = 100
+    local_ifname = f"{cfg.ifname}.{vlan_id}"
+    remote_ifname = f"{cfg.remote_ifname}.{vlan_id}"
+
+    # Create VLAN interface on LOCAL side
+    ip(f"link add link {cfg.ifname} name {local_ifname} type vlan id {vlan_id}")
+    defer(ip, f"link del {local_ifname}")
+    ip(f"addr add 192.0.2.21/24 dev {local_ifname}")
+    ip(f"-6 addr add 2001:db8::21/64 dev {local_ifname} nodad")
+    ip(f"link set {local_ifname} up")
+
+    # Create VLAN interface on REMOTE side
+    ip(f"link add link {cfg.remote_ifname} name {remote_ifname} "
+       f"type vlan id {vlan_id}", host=cfg.remote)
+    defer(ip, f"link del {remote_ifname}", host=cfg.remote)
+    ip(f"addr add 192.0.2.22/24 dev {remote_ifname}", host=cfg.remote)
+    ip(f"-6 addr add 2001:db8::22/64 dev {remote_ifname} nodad",
+       host=cfg.remote)
+    ip(f"link set {remote_ifname} up", host=cfg.remote)
+
+    local_ifindex = ip(f"-j link show {local_ifname}", json=True)[0]['ifindex']
+
+    vlan_cfg = types.SimpleNamespace(
+        ifname=local_ifname,
+        ifindex=local_ifindex,
+        remote_ifname=remote_ifname,
+        addr_v={"4": "192.0.2.21", "6": "2001:db8::21"},
+        remote_addr_v={"4": "192.0.2.22", "6": "2001:db8::22"},
+        addr="192.0.2.21",
+        remote_addr="192.0.2.22",
+        pspnl=cfg.pspnl,
+        psp_dev_id=cfg.psp_dev_id,
+        remote=cfg.remote,
+        comm_port=cfg.comm_port,
+        comm_sock=cfg.comm_sock,
+    )
+
+    s = _make_psp_conn(vlan_cfg, version=0)
+    defer(_close_psp_conn, vlan_cfg, s)
+
+    # Create PSP associations
+    # The socket's device is VLAN, but PSP device is on physical NIC
+    rx_assoc = vlan_cfg.pspnl.rx_assoc({
+        "version": 0,
+        "dev-id": vlan_cfg.psp_dev_id,  # PSP device on physical interface
+        "sock-fd": s.fileno()
+    })
+    rx = rx_assoc['rx-key']
+    tx = _spi_xchg(s, rx)
+
+    vlan_cfg.pspnl.tx_assoc({
+        "dev-id": vlan_cfg.psp_dev_id,
+        "version": 0,
+        "tx-key": tx,
+        "sock-fd": s.fileno()
+    })
+
+    # Send data through VLAN interface (VLAN-to-VLAN traffic!)
+    data_len = _send_careful(vlan_cfg, s, 100)
+    _check_data_rx(vlan_cfg, data_len)
 
 def psp_ip_ver_test_builder(name, test_func, psp_ver, ipver):
     """Build test cases for each combo of PSP version and IP version"""
@@ -624,7 +703,7 @@ def main() -> None:
                 ]
 
                 ksft_run(cases=cases, globs=globals(),
-                         case_pfx={"dev_", "data_", "assoc_", "removal_"},
+                         case_pfx={"dev_", "data_", "assoc_", "removal_", "vlan_"},
                          args=(cfg, ))
 
                 cfg.comm_sock.send(b"exit\0")
-- 
2.45.4

