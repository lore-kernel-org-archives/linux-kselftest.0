Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E7419ABD8
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109840; cv=none; b=DJb5vwXEjOG6AW58T95TsyIlulbzumaWLpA0JTH+2jvr3hGF1XYuwL5K3cNlEFqAZrGH110QQdrzYg9616gr9WQZovzqH9NsZtir/S5mv90R7mDIndFXF9Hx9Ky7OEaDWDBYLVadMI7frbIID7CYPrsQuLCHt4zpVd2JCS9DaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109840; c=relaxed/simple;
	bh=7eVaNnvr6+NMoVwZ1XGTN+Ahgq44mrPh+LwfEHFmRx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssLSEthLCbkULEGpwjmag4k5YDyGmCRzTPj/WCRI4oGNE6o88SgBnHQauTwdB/96Z3EZZ6f5cncEHwEbgV84Rnf9MfdsjLJlfUzvAx3iSC8VPpq9med9MSDBtPnNYWWFYqqO0p0XtvY8+XJp9b/a1n90tIdmTXyRGM2Avb50brE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOuy7Poi; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOuy7Poi"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845c92bc464so1861149b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109837; x=1784714637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AgO1Y7/Z8Y+7uFpKbTVOxsJZwoB78T5G4gavgAdInB0=;
        b=BOuy7Poi9ZPbh3o2j7lDDR05EEazzLqiGlg6/uy9kiCl44Wj24ZUP772IHL0+PhyCb
         +w4pipwfMpSo+Zb+OeVlCqrjBkdlw0ZO+B0SIH0sftmaQnPmGi+GUKMK3Ww6TZuY8yjI
         w3mHi8aFBTKwTaFX2NE9STwgJ+LpymbqPZOHsENK2UKZ8wxs47gi8dDdpW8PcRVH+Akf
         8cqSerLOeEz6PGFgSq30s4YgoWFU0y+zbkeD38GBnfh9JyU1FcyjFVfaEKboaVhrbiWF
         E6lv14uQHQnEAxpn9MJfHBPgH8gEf1xPx2i9un7ixjazyPBrc7jQsJTom4GDpYznommp
         azPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109837; x=1784714637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgO1Y7/Z8Y+7uFpKbTVOxsJZwoB78T5G4gavgAdInB0=;
        b=osQdFU5B1B4r9PyUQYiYVb6x3vn8IIl4SQMU5jfeX54yMiYQmFzH9HjbCFrP6FJvsy
         mR5FLVOPCee06jvr52TBadOdhTs4QwjO7gvStpOh1jEdSI7n2yYWTzzgfbZuUTZZOrqt
         ti6VRemj1OzdQZUdqIpgVmmDdjdiH7PnhUS/bR8vO9ecKFFBRbaYhlEbR8C/bT2v57Gv
         kECgWUX7PZhywCA+UxcDt2O5SUNV02Y4y3dmVyBaywf/EIS7vozej5DF4mUm1ISJbBk9
         XxXILFbI/ofMKIOgir83aOJOnM7aLxr65gF34QVN8jBEgrc31EOhwgymedFeOYbKSV9i
         zNnw==
X-Forwarded-Encrypted: i=1; AHgh+RoOAGubopx24Ypu56cgkch/QLZwSratrxtm0NXp9aRkOxNLdsT9blX7trIX3GCnOwlYH66zI+Fb2QJfPEu632k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9AJAqCzq4n7rx0HRvnop1/z77QfIGc2cssnYFIyGlngDoylko
	3GgdoWrKIVxtNQ7Cg17/lwq2dUfjVkcMA+vkzoxGxzWfLCGiLiK+LJZW
X-Gm-Gg: AfdE7cmBiuvdn44vZ29xYHgV8DS78IpkAaCZNNhyNT/BboI98ZHWYi32Q3PtzlgzsLo
	iBq7gN83TaD3yd7dX2Cg+d4fcsVQ+D/nLenp99PH2Qqzk50JgHW0RYu6uijoup1B1HuWDiAnlKK
	sQ+xKXiMJE3AfSaRpp4uqjybvYW2Cs6Yc3JKagmioYNZxQsEsLgb9j44afqCiMAHk8DwcgbORCv
	7sbpjX/YG9h3fNRMlenhylWLVVwIK2OGMKfW6dKSqITXxdF7ITPbzcL9y08YfcvuL5XmLIHGFQF
	DlfaWHzA0sblSaeVQstSltJ1JS0UO/hz9iR5qVxIER7FzTglSGVJIj2MGcNngvgt5uKG+rU8fxN
	MWoEAXB6kzlnQWWTNqC4aSiwAPHIHBRU3vKPAeXM25i2tk7i7F3GPqyvQmPZxg54w8WtQIXkTit
	5e5w2VwRt5y+l91cTVAmLdRClz5vxWwfehqkeAhrFwOJ8TLWJ7Eo8WzoHsY4o=
X-Received: by 2002:a05:6a21:60c3:b0:3c0:9c19:b272 with SMTP id adf61e73a8af0-3c110bc1ed9mr17125283637.64.1784109836934;
        Wed, 15 Jul 2026 03:03:56 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([160.30.85.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8fc7c088sm37241071c88.2.2026.07.15.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:03:56 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	shuah@kernel.org
Cc: eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	toke@redhat.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] selftests/bpf: Fix fib_lookup VLAN tests on hosts with forwarding on
Date: Wed, 15 Jul 2026 15:33:49 +0530
Message-ID: <20260715100349.2684391-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VLAN tests assume the test namespace starts with IPv4 forwarding off,
but a new netns copies conf/all and conf/default from init_net
(devinet_init_net(), with net.core.devconf_inherit_init_net at its
default), so on a host with net.ipv4.conf.all.forwarding=1 the devices in
the netns come up with forwarding already enabled. IPv6 uses compiled
defaults at the same sysctl value, so only the IPv4 arms are affected.

Two arms break as a result.

The arms that expect BPF_FIB_LKUP_RET_FWD_DISABLED see the lookup pass the
forwarding check and return SUCCESS instead, so fib_lookup fails:

  test_fib_lookup:FAIL:fib_lookup_ret unexpected fib_lookup_ret: actual 0 != expected 5

Pin forwarding off in setup_netns() before the devices are created; the
existing per-device writes still enable it where the tests need it.

The netns arm has the opposite problem. It checks that a VLAN device in
another netns is not resolved and expects NOT_FWDED. The lookup runs
against the caller's FIB, which had no route to the destination, so a
kernel that resolved the moved device anyway also returned NOT_FWDED and
the arm passed regardless of the namespace check. On a forwarding-on host,
where the resolved device clears the forwarding gate, this makes the arm a
tautology. Add a route so a resolved device returns SUCCESS and the arm
can tell the two apart.

Verified by deleting the netns check from bpf_fib_vlan_input_dev(): with
the fix the arm fails on both a forwarding-off host (actual 5) and a
forwarding-on host (actual 0), where before it passed on the latter. The
real kernel passes the full suite on both.

Fixes: e54a87872e34 ("selftests/bpf: Add bpf_fib_lookup() VLAN flag tests")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260713163826.D70201F000E9@smtp.kernel.org/
Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
---
 .../selftests/bpf/prog_tests/fib_lookup.c     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/fib_lookup.c b/tools/testing/selftests/bpf/prog_tests/fib_lookup.c
index f7361f9a3459..8f4779dd802e 100644
--- a/tools/testing/selftests/bpf/prog_tests/fib_lookup.c
+++ b/tools/testing/selftests/bpf/prog_tests/fib_lookup.c
@@ -419,6 +419,19 @@ static int setup_netns(void)
 {
 	int err;
 
+	/*
+	 * a new netns copies the IPv4 conf from init_net, so on a host with
+	 * forwarding enabled the arms that expect FWD_DISABLED would see the
+	 * lookup succeed instead; pin it off here and enable it per device
+	 */
+	err = write_sysctl("/proc/sys/net/ipv4/conf/all/forwarding", "0");
+	if (!ASSERT_OK(err, "write_sysctl(net.ipv4.conf.all.forwarding)"))
+		goto fail;
+
+	err = write_sysctl("/proc/sys/net/ipv4/conf/default/forwarding", "0");
+	if (!ASSERT_OK(err, "write_sysctl(net.ipv4.conf.default.forwarding)"))
+		goto fail;
+
 	SYS(fail, "ip link add veth1 type veth peer name veth2");
 	SYS(fail, "ip link set dev veth1 up");
 	SYS(fail, "ip link set dev veth2 up");
@@ -897,6 +910,14 @@ void test_fib_lookup_vlan_netns(void)
 	if (!ASSERT_NEQ(parent_idx, 0, "if_nametoindex(veth7)"))
 		goto fail;
 
+	/*
+	 * give this netns a route to the destination: the lookup below runs
+	 * against this FIB, so without the route a kernel that resolved the
+	 * moved device anyway would still return NOT_FWDED and the arm would
+	 * pass for the wrong reason
+	 */
+	SYS(fail, "ip route add %s/32 dev veth7", IPV4_VLAN_NETNS_DST);
+
 	/*
 	 * input: the moved device is still in veth7's VLAN group, but it
 	 * lives in another netns, so the lookup must fail closed

base-commit: c314bcaa9d5dc34b0c643eac85f675fb8c8bfbaa
-- 
2.54.0

