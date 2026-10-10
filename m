Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46649369972
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 21:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791666190; cv=none; b=WHYazPf4VGJvqX+IiQvk5AsEgX+A4Zji1GE3JT0n7i+yAM9Nlfl/lj+1kRxmHpshLIVOY6FD9tZVIyQVbpDmxWON17c9BeiDBmW7tdLiEPAbWrMnRsczwne+K0lWO/wBzt/VKRyCpCiZhkT8edR/iYq+H9D+YdknIcEP9uVlLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791666190; c=relaxed/simple;
	bh=v/XlPMN4fPBfmAxkgYIsWzQxkY2uLOFx2Hx425yLdCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cxec3tKS2BzvzPpX1RQg/zv6UwW9RfymGjMUCYov4mMUMu1iZz5LkayOJ1EpTy1iXYcWWy/YVVcQIOrlQdcaiumEci164X0RXGQZ0pTPGRcmNhquauJilNsJQSVNULXLQ+c8FtnQNpx6gu6NEzKasOfRQhwbueitUebnSydgnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=WzislntM; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="WzislntM"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e762768f3so103891785a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1791666187; x=1792270987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jz2Hc1XYfp2QYZMfwSM35lC+Lb6h+/doZovOemukty0=;
        b=WzislntMaHvjSpMec8Vc4/i1wBjX75zqKLRZm8lu7uOqz+NWFO7XkasklP/+dZREZi
         uDbltHc4CpnJC5bQaR2Gppt6X4OPs7+AYqq5K02IdmxhRllw7n6h279iavp9ibm2MIg8
         NtSzaICuv3MnSEXaaIHBfkkcEVJ7SqfmA3SfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791666187; x=1792270987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz2Hc1XYfp2QYZMfwSM35lC+Lb6h+/doZovOemukty0=;
        b=WyUvS1PYnopVNSoFAlFdkXO2oIgoa57Ivktil1u8GP33POUoCZvewcbbfbz6UAPuWA
         NGPsGopRWUgdCMz9paCKm6lQ5MqEPVc388e88QGLeKYbeucZeOI0bZoMrWj0yN/MlAS6
         Qw/F6/upEsWc1IkcFtB7iDoooItZ/NB8d2CAfQe741X9YszYEIr8fSoYUQSJshdWHnoY
         6IjMi1YSZK6GVMkEaJTHgvrbeX4mhS3855R6f49jMXuRQ1PcHvrJ1wz1EHAhrvPhCkW0
         F/ds5W19R9hBf6xF8VUDsjes8Tx0wyEY/S0WZACXGvalQAqGn3e6RUAwTiN6S45UHbOm
         RecQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ+rrDo4xXOJuR46YVUgGz2E7BMeKbg4Wh5b30bg85Zh5KOzLEYfDZgCNkAQFQ3v2azFAwDkdmRJ/CFpTRYKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE1glE97x8I9g0MDmqBHVSHpgcDomtCgbY1wQ6pwFkaWd8zPzg
	KQej7wLkRK27xw44+ubSc1mPMoqHCJU8BCLR1rP3tEBY7UU2aOoYdBHQQMgqgceoRA==
X-Gm-Gg: AYBFou3IPPZ3AA1IqtOqOAo6suDlyjsfgcdXHkGMB37Y1G6urFGZr0tphxkxsTUw2ee
	S0VZ0CknhSptRtisEFi8DdMgpKe6wI6tG9ZTJDKoKY5Cev9VgjsUkmD/zRTIOy5gWs+YFctyosR
	Z7SoyL5ppDX9hFNJp+fhhXTG+GbAixZq7ExcvGKp76+QwV9VtfwiraMfT+CQY0KE3l7CFsIIviB
	NbGsxmABu1jAwPPL8QQ37oNoxtOvlL6GPh2t7hiIyt7rJZqSaOiqUECu8nX6tRueWHEVZ39kyBP
	5kNCQsFswWIf2pF1m2l7HkWXphcfk8jeYaRWe+oqgH5n8vriIWVu/Kog9/deSKC5mHaOnHUL3h0
	ToOPo6VJ3NB6FIr7hXQCoDxcQTKHqhFKQvvL0qK3KSb3zX/xGaN5yNOAvEw7caRPCXQWEdAyVWD
	+lUIulx0JoQa9z35c4f9muDW3F3art0ysjwXHYAnz68yzpuyDUeEHfu07Ki/5H8AdYGvvXRt0Z1
	x2gMya6avhSEI5Nxo54Rv10zqnGuzTZ3WsxFXb5iSo6
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:f13b with SMTP id af79cd13be357-93ec12d085amr843885885a.69.1791666186988;
        Sat, 10 Oct 2026 14:03:06 -0700 (PDT)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb984845csm498538085a.14.2026.10.10.14.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:03:06 -0700 (PDT)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	bpf@vger.kernel.org,
	victor@mojatatu.com
Subject: [PATCH net v2 3/3] selftests: net: exercise dev-bound cls_bpf on shared blocks
Date: Sat, 10 Oct 2026 17:02:50 -0400
Message-Id: <QDISC-PYC7.v2.20261010165947-4@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-PYC7.v2.20261010165947@mojatatu.com>
References: <QDISC-PYC7.v2.20261010165947@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issue:
bpf_offload.py only exercises per-device ingress qdiscs today, so neither
the shared-block accept path nor the late-join replay is tested.

The Fix:
Add a test for a device-bound SCHED_CLS program attached through a shared
block.  It loads a dev-bound SCHED_CLS program for a netdevsim device and
checks:
  - the program attaches to a shared block owned by its device, and the
    filter teardown leaves the device unloaded;
  - a block that also holds an independently backed device rejects the
    attach, because the offload path broadcasts the program to all
    members;
  - an independently backed device that joins a populated block is not
    loaded by the bind/replay path, and the driver's extack is asserted;
  - a second port of the same netdevsim device (same offload device) is
    accepted together with the bound port.

The program is loaded from the existing sample_ret0.bpf.o with an explicit
`type classifier` override, so no new sample object is needed.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v1 -> v2 (v2 of an on-list patch; v1 posted 2026-10-04):

- New selftest: shared-block + late-join coverage in bpf_offload.py.
- Split the single v2 draft into three patches; this companion carries no
  Fixes: and no Cc: stable (a selftest is not backported; it depends on
  both code patches).
---
 tools/testing/selftests/net/bpf_offload.py | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tools/testing/selftests/net/bpf_offload.py b/tools/testing/selftests/net/bpf_offload.py
index c856d266c8f3..87e244d8ff05 100755
--- a/tools/testing/selftests/net/bpf_offload.py
+++ b/tools/testing/selftests/net/bpf_offload.py
@@ -452,6 +452,38 @@ class BpfNetdevSim(NetdevSim):
         self.tc_add_ingress()
         self.wait_for_flush(bound=bound, total=total)
 
+    def tc_add_block(self, block, fail=True, include_stderr=False):
+        return tc("qdisc add dev %s ingress_block %d clsact" %
+                  (self['ifname'], block), fail=fail,
+                  include_stderr=include_stderr)
+
+    def tc_del_block(self, block):
+        tc("qdisc del dev %s clsact" % (self['ifname']), fail=False)
+
+    def tc_add_block_filter(self, block, bpf, op="add", prio=None, handle=None,
+                            da=False, verbose=False, skip_sw=False,
+                            skip_hw=False, fail=True, include_stderr=False):
+        spec = ""
+        if prio is not None:
+            spec += " prio %d" % (prio)
+        if handle:
+            spec += " handle %s" % (handle)
+
+        params = ""
+        if da:
+            params += " da"
+        if verbose:
+            params += " verbose"
+        if skip_sw:
+            params += " skip_sw"
+        if skip_hw:
+            params += " skip_hw"
+
+        return tc("filter {op} block {block} {spec} bpf {bpf} {params}"
+                  .format(op=op, block=block, spec=spec, bpf=bpf,
+                          params=params),
+                  fail=fail, include_stderr=include_stderr)
+
     def tc_show_ingress(self, expected=None):
         # No JSON support, oh well...
         flags = ["skip_sw", "skip_hw", "in_hw"]
@@ -629,6 +661,111 @@ def test_spurios_extack(sim, obj, skip_hw, needle):
                             include_stderr=True)
     check_no_extack(res, needle)
 
+def test_tc_shared_block():
+    """
+    Device-bound cls_bpf program attached through a shared block.
+    """
+    # A shared block has no qdisc, so the target device is derived from the
+    # block's bound netdevs and the program must match every member, since
+    # the offload path broadcasts it to every callback on the block.  A
+    # netdev joining a populated block later is replayed the stored filter
+    # before it is inserted into block->ports, so the driver callback must
+    # enforce the device match as well.
+    simdev = BpfNetdevSimDev()
+    sim, = simdev.nsims
+    sim.set_ethtool_tc_offloads(True)
+
+    start_test("Test TC shared-block load dev-bound program...")
+    bpftool_prog_load("sample_ret0.bpf.o", "/sys/fs/bpf/tc_shared",
+                      prog_type="classifier", dev=sim['ifname'])
+
+    start_test("Test TC shared-block dev-bound attach...")
+    # The pinned program is dev-bound to this device; attaching it through
+    # a shared block must succeed even though block->q is NULL.
+    sim.tc_add_block(22)
+    # err is kept (include_stderr) for post-mortem value on a failure.
+    ret, _, err = sim.tc_add_block_filter(22, bpf_pinned("/sys/fs/bpf/tc_shared"),
+                                          da=True, skip_sw=True,
+                                          fail=False, include_stderr=True)
+    fail(ret != 0, "dev-bound program rejected on a matching shared block")
+    fail(sim.dfs_read("bpf_offloaded_id") == "0",
+         "dev-bound program not offloaded on a matching shared block")
+    sim.tc_del_block(22)
+
+    start_test("Test TC shared-block broadcast to a foreign member...")
+    # Add an independently backed device to the SAME block before the
+    # attach.  The program is bound to sim's device only, and the offload
+    # path fans it out to every member, so the attach must be rejected.
+    simdev2 = BpfNetdevSimDev()
+    sim2, = simdev2.nsims
+    sim2.set_ethtool_tc_offloads(True)
+    sim.tc_add_block(40)
+    sim2.tc_add_block(40)
+    ret, _, err = sim.tc_add_block_filter(40, bpf_pinned("/sys/fs/bpf/tc_shared"),
+                                          da=True, skip_sw=True,
+                                          fail=False, include_stderr=True)
+    fail(ret == 0, "dev-bound program broadcast to a foreign shared-block member")
+    check_extack(err, "Program is not bound to every device in the block.", args)
+    sim2.tc_del_block(40)
+    sim.tc_del_block(40)
+    simdev2.remove()
+
+    start_test("Test TC shared-block late join replay...")
+    # Build a block owned by sim's device with the matching program
+    # installed, then let an independently backed device join it.  The
+    # join replays the stored filter to the joining device's callback
+    # before the device is recorded in block->ports; the driver must
+    # reject the replay so the foreign device is never loaded.
+    # sim2 is created here (not inherited) so the TC-offload state it
+    # depends on is explicit.
+    simdev2 = BpfNetdevSimDev()
+    sim2, = simdev2.nsims
+    sim2.set_ethtool_tc_offloads(True)
+    sim.tc_add_block(30)
+    ret, _, err = sim.tc_add_block_filter(30, bpf_pinned("/sys/fs/bpf/tc_shared"),
+                                          da=True, skip_sw=True,
+                                          fail=False, include_stderr=True)
+    fail(ret != 0, "dev-bound program rejected on a matching shared block")
+    ret, _, err = sim2.tc_add_block(30, fail=False, include_stderr=True)
+    fail(ret == 0, "foreign device joined a populated dev-bound shared block")
+    check_extack_nsim(err, "program bound to a different device.", args)
+    fail(sim2.dfs_read("bpf_offloaded_id") != "0",
+         "replayed program loaded onto a foreign device")
+    # The add above was expected to fail, so the qdisc may not exist; the
+    # delete is harmless and only cleans up when it does.
+    sim2.tc_del_block(30)
+    sim.tc_del_block(30)
+    simdev2.remove()
+
+    start_test("Test TC shared-block same-offload-device member...")
+    # A second port of the same netdevsim device shares the offload device,
+    # so a program bound to one port may legitimately be offloaded to both.
+    simdev3 = BpfNetdevSimDev(2)
+    sim3, sim3b = simdev3.nsims
+    sim3.set_ethtool_tc_offloads(True)
+    sim3b.set_ethtool_tc_offloads(True)
+    bpftool_prog_load("sample_ret0.bpf.o", "/sys/fs/bpf/tc_shared_multi",
+                      prog_type="classifier", dev=sim3['ifname'])
+    sim3.tc_add_block(50)
+    sim3b.tc_add_block(50)
+    # err kept for post-mortem value on a failure.
+    ret, _, err = sim3.tc_add_block_filter(50, bpf_pinned("/sys/fs/bpf/tc_shared_multi"),
+                                           da=True, skip_sw=True,
+                                           fail=False, include_stderr=True)
+    fail(ret != 0, "same-offload-device member rejected on a shared block")
+    fail(sim3.dfs_read("bpf_offloaded_id") == "0",
+         "program not offloaded to the bound port")
+    fail(sim3b.dfs_read("bpf_offloaded_id") == "0",
+         "program not offloaded to the same-offload-device port")
+    sim3b.tc_del_block(50)
+    sim3.tc_del_block(50)
+
+    simdev3.remove()
+    simdev.remove()
+    rm("/sys/fs/bpf/tc_shared_multi")
+    rm("/sys/fs/bpf/tc_shared")
+    bpftool_prog_list_wait(expected=0)
+
 def test_multi_prog(simdev, sim, obj, modename, modeid):
     start_test("Test multi-attachment XDP - %s + offload..." %
                (modename or "default", ))
@@ -1349,6 +1486,8 @@ try:
     ret, out = bpftool("prog show %s" % (progB), fail=False)
     fail(ret != 0, "couldn't get information about orphaned program")
 
+    test_tc_shared_block()
+
     print("%s: OK" % (os.path.basename(__file__)))
 
 finally:
-- 
2.43.0

