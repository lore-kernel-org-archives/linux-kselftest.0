Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694546;
	b=CuvoPO06N1fxIeWjX9BOO+JVebd9vupDG8dkETRRxXyuocEA6lYpRqkmJp+Wjr51PGB1
	 CRudZKXjd+hC1omcUS2I9GvlCjUp4GzKmc5g+F6YhG2EySfApYHRjrznkZ40cM+PRMVRL
	 tZ8b0IyH6NIElcfPguS5c7CK698658Tt9M12sgZu0mNYt7cuYLCEZyDw0R9NC+3kIIGmF
	 I8wIlzKQ5RcMOuwzAPVArACQKh17tHn7xO4IDTyQJeY0liRGBP8x9MPzbVkkLQILd8ac3
	 gTrZcPTkaoxCjRsSzSxX3JNtTAS3Mltm8NO/cF+uu22KbNmmxcQIJkoszlNlCANJHDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
	b=SxsVSIkWdpB+luRSNfhORHi91EL4d4JfQmXNMfplxOWOCXNI9VEs91LBDAcv4GnITMXK
	 scUYltRlVMrxNSrZ8TtRBMMiVRRL7TaoJzdNDEIKl0ZRrZF9hIMsZYGUo36HYC71M9b6I
	 s7KKaeJLoC6diZQ4TC6MEOKXer99fGJwsLFSWP6znxJtHMuoTGJ8gQMs+R2IRbmA7OF6w
	 nWWWwMV2RtekDtGvQjRaaCHSXv3JclmuPx21Dv9tTM9iWIbvcuH5kPwwqi4G8Px7mCCUt
	 Q+gxcHcgjgbjY28R11tBpmFMJ6c43o5wPlEFnyYwgdRk9wTZx8oHIl5lrXFd82HJaEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4X+qHoj;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76FA606A886
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76FA606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4X+qHoj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491846221ffso2048508f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694544; x=1795299344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
        b=H4X+qHojpx1LYBhdEpFy045MEYW1a0DsOUuqj9IZciuzX2vxbU4HMPTPB/vI/QGdNQ
         SUKKBY3GJ9lznikm2/qJVPbjf49w3pMTL/Px21cLCmvajf4PuwizmPJ/3AKfLyaAdWI1
         AeSWdVdKtIOrPHAURT+zj5mDR5z8qLFRop6mixyWs28i+GYco4APZiDd1O2olKySZ3/V
         hofz0o/vHP+oNT1OEILHosZYGRBibYJHy4Jxb39zExjFqFg7uk9enr4qPN85qNtQi6Mw
         DtUO5su9K9uxFQOEI8rJ+uVj/XiS+s+xPtEtMxHqeMwIhF/0hb3sua2zXeSoh5gvUYx+
         cUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694544; x=1795299344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psCKisTbpJp1WRpTRFiCgMrs5Tc48KteBL0XoQIn2kk=;
        b=pthQMdj3uNY2GSqTLOiuUt5Ne7K6lxB8BH2vfb1D6/K0mUQxij8VaMyiaP8RBjKCri
         KfMMIaxNR+MFnrei+Q1deSHHVP7sTvCs+sgV4jXH8W0TkuXzMFxm5Fzfha7Z/UnPriHD
         7zjZ2d8PguPWoZmPZg0x2r6EM/3svMyQJKRASIue+RFnhE70Z1zmxxz2+e5pDKToo4NB
         L2pJv4/cwkDsZKA6amJR+BFBbgUPtM8+kx6wifD1q4lgoM/KWj4ouyi6OzaBrFC5gcxW
         x44YOZHr2dnKDKOUHSl12ACLFVMu0IpoDWf0d5+TLQwCfSu9Vo6q7DSyA+qdiK2HSOLz
         Hg0A==
X-Forwarded-Encrypted: i=1; AL+hErEfEkdFXZuW1eksi76KzhJYcK5fienwHiC02GoiLPAlNQMNc+q7tarxDg7NihK9KjY6MrD4be3rM7aAPqa2Mcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fhK1WiaqNzGUsMx+Paf1ezTA7gZcpqLSXp8ntEMDykGrnDeHE
	55qvllpLkSDsl1I6iNWtkcj++3PdTf/o/Qwt48nVMezzuL9TSRZu7uXb
X-Gm-Gg: AYBFou1Fk9IRi2cXE/hOrENA8R22h426a1OISzfhvrpCFcZWiDhXrdk2IFtuzAfpGXf
	bWL1wPR+FgD7M+Wl37WcMrsJhypafkHkc3ICYBEs6BrzRTQohyXyLfBIUrEQXXO2q567Y95ii5e
	MxUVydPEQh12fW7/oGgmE6oIvGOOzWLuC6fq1IoVM6cjMURF1qzuKwjKJvBc3t5hh3T97wd+Kqn
	w/mfJCxEDfkDys5VXEXnndfgxz1F4Eb4JpZacrRANXUdJ8/IUpKhY2qCteEoYbBhxseOY98I7xI
	T8029mbHd8+1Q8KxuN0NIFwfHBaVdBkBx0gyS4JnStwVR8Yc6mbcs3+4f253m0BgAt88opBAuq4
	qhIlSZSxjtRJtKG6AbIhnXd5Z7fL5W0+1BaO1V+L4e8pBqddXmDKro2MIr8UTXQTriy4sSGD1R3
	C0j6D2uveWZEW821bLL8pbMYu6nmQQA/iPyu+or+mAcX4B/tAZ/MW5uWQ7Qt7r874GNDMRpT8j3
	DwIHFYbG+SRZuUVUx6uR39rxulvWz8T66JOFAoVjc1lPY/iutMu2njjJNzB4N5//LBCezGlLeQw
	1/XBsw6Xk6Mufmcbjn+DD9wh
X-Received: by 2002:a05:6000:24c8:b0:49c:9e8a:31b9 with SMTP id ffacd0b85a97d-49c9e8a3318mr13880612f8f.9.1794694544235;
        Sat, 14 Nov 2026 14:15:44 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:43 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 4/8] vxlan: vnifilter: account per-VNI memory to memcg
Date: Sun, 15 Nov 2026 01:14:08 +0300
Message-ID: <20261114221412.255825-5-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_vni_alloc() allocates a struct vxlan_vni_node and a per-CPU stats
block for every VNI, both with plain GFP_KERNEL, so neither is charged
to the cgroup of the process that created the VNI. A netdevice's own
struct and its Tx/Rx queues are already GFP_KERNEL_ACCOUNT in
alloc_netdev_mqs() (commit c948f51c1654 ("memcg: enable accounting for
net_device and Tx/Rx queues")), so these per-VNI allocations are an
unaccounted part of a device that a cgroup can grow one VNI at a time.

Charge both to the caller's cgroup with GFP_KERNEL_ACCOUNT in
vxlan_vni_alloc(). __GFP_ACCOUNT only charges an allocation made from a
task in a non-root memcg, so the sole caller, which already handles a
NULL return, is unaffected outside a memcg.

The charge lands in the caller's memcg: adding VNIs from inside one
moves each node into the accounted slab and raises the cgroup's per-CPU
memory. This covers the node and its stats only; a VNI carrying a group
or remote also installs a default FDB entry, whose allocations are not
charged here; "vxlan: vnifilter: account the default FDB entry to memcg"
later in this series accounts them.

Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: name the FDB accounting patch by subject; after the reordering it
is no longer the next patch.
v4: reworded to cover the node and stats only; the c948f51c1654
reference narrowed to net_device and its Tx/Rx queues; rebased.

 drivers/net/vxlan/vxlan_vnifilter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 127ed5b2a2eb..07aa641f16e8 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -826,10 +826,11 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
 {
 	struct vxlan_vni_node *vninode;
 
-	vninode = kzalloc_obj(*vninode);
+	vninode = kzalloc_obj(*vninode, GFP_KERNEL_ACCOUNT);
 	if (!vninode)
 		return NULL;
-	vninode->stats = netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu);
+	vninode->stats = __netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu,
+						   GFP_KERNEL_ACCOUNT);
 	if (!vninode->stats) {
 		kfree(vninode);
 		return NULL;
-- 
2.53.0

