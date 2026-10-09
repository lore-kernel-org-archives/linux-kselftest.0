Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC003264F5
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 01:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510564; cv=none; b=aR7baiW1TW6Cxhd8tGsc/3rkz4Ok6yhoLG2xB5o23hzm55esvMxVsML6yg/Tzo+J3h1oRjp4fh3wZgxdjvcTswgrW6l6/01qxWeD6FAte91uJxrC5xd73TIlh6GplytbVFEL52P1Wio+aQednCE6qZanYjGmRfa1BSzhGgKdPAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510564; c=relaxed/simple;
	bh=72FAB5TSLVz4Thr0h+bv9d4S7Ew4e+SEyCe2IkscpHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VXKF8u3ixAOWa/vQ3xnAGQBzYkPHTIQtDN8g/QKXzyn/9I4gqXAtB2G6pAKNSxTupBZNi/46tB+M/Vv86WJymDIwR8YlHFxGKthyTVXeeAbx49DyMUCTkTFovn6ibKS2vnGgLmVKx1ZthDie/fBlSci7pQ23Z5zBCf2V0Q/ldPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+5ED6hl; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+5ED6hl"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so893440eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510562; x=1792115362; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LL6VJoesIXgvO6dkBve9nwIrZ4XKjap6wkylrhkf3eY=;
        b=I+5ED6hl2joDxXw1Q5YAxVrOqWE5mWNKYYZckxlLrcNffUcL4SZfe0MueN9l7exYVk
         HxDHhJmGcw46oh6qwL4RTOlOYduNnLKOqb71XzjnK5W5IBgbbalw2yl68k4dHktgziRg
         5yhUj9rpRLjfjdZnAE3hVtmkXg4XMAdQR5DLMW9SGrpOn1LwtfTZezO452jpGqMOYbJb
         eHO6ErGuo5wl9UQUbJ0Nnk5U4wjLC4AuwAI1xJr8rpf18ghBXh8jlVZlXRS+Y8Gqt68z
         +BlkEuQSUwo1lsvspP5jpgMh+6BbAVYfg5A4TCWlwGA4HrRta9qV+84IyOZwrS3Q/2ng
         TvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510562; x=1792115362;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LL6VJoesIXgvO6dkBve9nwIrZ4XKjap6wkylrhkf3eY=;
        b=jSiniUkf+4zHs9gCKzsumzvrcslZOGnLbueQC3a5+z3p3GMl29YuO0VqQYJR/HmZHL
         qEPjF2FJrh6yAA4LWLoPFz9I1cdtDN2SEx/I3NJ/GhEgjJpb1CgFcvljkt4+723GjZSd
         YNRtr5OY1ET5QT2vvO0MssdaQiWh6Wcjlc+85y0DfU6hugJyC0b+HklqeRAOku2wanSF
         p0cP0MQGdWxifIYWXaPJqHM6TO4hPMPpDP3aQPyGuycD+ISJGpDiOZLpkFYHEdnKGcgw
         /RKK6hfvHYwGZlv5i/Jd0e5yZEHb2Jnz7gvRZhXRNPxIZPI5/oUdNhV0ngMlWR0eo5in
         6dkA==
X-Forwarded-Encrypted: i=1; AKwUvBxYoOMR7WAb4SGdos/bUwiuMtv1zjPMAOrQSUBr6CCBlQth9mKJfUE1pmUtGVtRRgEKusiHphXbYru9v1cOMUk=@vger.kernel.org
X-Gm-Message-State: AFuF++m1T8c73FFctfZGW2PyiaeB5HYcUs/2o508BEwOWAaHqIjrJVYO
	UX6GRFP6HnhehFLPQXSNvwTYgpttuO8khJ5+CdQg2xmxBLdYOR0rAdyv
X-Gm-Gg: AYBFou3Kx/9icW0nfv3sOcpSz9vy0ggKEcb/RhG0I2DJtztFRY71dmOHl7aOWS6I+ne
	8K9C4jRmABHbKdbWWxsCSPaBI0Du3vlFQbqlsZPLVW7YdxMYQx2aoUJWZ+5+MWe6r8XjavLkFCi
	Z6Yq2uo/VINp5g3bAIJmLEhJGnJzWA0CF+oayqwenNRCCUUrZXlexPDXB1gMtmMI7/GHfPylxHJ
	uoYYTCYepGYvp2CmAAkgbREeIocZNTz3ul3SuglraEjAvQOl7lZGeq6WumclXedo4qoNl4EGTQH
	jriAfrY+VDkoUn4IDmftfZKDVKGPBbK19be2B0O26CJKtA6NsbIpR9hhXXGSFof7TPhXKi6iJY6
	9Q1I8KORx4zA+jr8xbTBlc+RepzG75WgsXfy5QKDxduNXI4ZXOQfvs+Ol8jrozEOb3XqioEUHZt
	OFAl0RJimdzhs/1ISkZTV7mXb+DwnwPdrwFKadXPDKkjzGqZNytTjVDg4SympzuQ+PvQ==
X-Received: by 2002:a05:701b:2908:b0:14d:ef19:246f with SMTP id a92af1059eb24-16a6309ce64mr422027c88.45.1791510561936;
        Thu, 08 Oct 2026 18:49:21 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm3500357c88.13.2026.10.08.18.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:49:21 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:49:17 +0800
Subject: [PATCH bpf-next] selftests/bpf: Record only the test ICMP echo in
 tc8 of tc_netkit_scrub
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-tc-netkit-scrub-v1-1-f46c07a40e7c@gmail.com>
X-B4-Tracking: v=1; b=H4sIABxIyGoC/x3MQQrCMBBG4auUWTswLUWJVxEXJv2jgxJLZpRC6
 d0bXX6L91YyVIXRuVup4qum79LQHzpKj1u5g3VqpkGGYy8S2PDKDnPjOGf2xAX+VGdL9RM5C2I
 IMk6STtQec0XW5f+/0C8oWJyu27YDgujyHHkAAAA=
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

tc_netkit_scrub attaches tc8 to the primary netkit device, sends an ICMP
echo with a mark and a priority through it, and checks the mark and the
priority that tc8 saw against what the scrub mode lets through.

tc8 records the mark and priority of every packet it sees, and the
device also carries what the system sends on its own once the device
is up, like IPv6 neighbor discovery or the mDNS of avahi-daemon. When
such a packet goes out after the echo, it overwrites what tc8 recorded,
and the test finds a mark and a priority of 0.

Record only IPv4 ICMP packets in tc8.

Fixes: 716fa7dadf11 ("selftests/bpf: Extend netkit tests to validate skb meta data")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/progs/test_tc_link.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/test_tc_link.c b/tools/testing/selftests/bpf/progs/test_tc_link.c
index 630f12e51b075..3c44ee06cfae8 100644
--- a/tools/testing/selftests/bpf/progs/test_tc_link.c
+++ b/tools/testing/selftests/bpf/progs/test_tc_link.c
@@ -4,6 +4,8 @@
 
 #include <linux/bpf.h>
 #include <linux/if_ether.h>
+#include <linux/in.h>
+#include <linux/ip.h>
 #include <linux/stddef.h>
 #include <linux/if_packet.h>
 #include <bpf/bpf_endian.h>
@@ -119,6 +121,14 @@ SEC("tc/egress")
 int tc8(struct __sk_buff *skb)
 {
 	struct net_device *dev = BPF_CORE_READ((struct sk_buff *)skb, dev);
+	__u8 proto;
+
+	/* Look only at the ICMP echo of the test, not at IPv6 ND or mDNS */
+	if (skb->protocol != bpf_htons(ETH_P_IP) ||
+	    bpf_skb_load_bytes(skb, sizeof(struct ethhdr) + offsetof(struct iphdr, protocol),
+			       &proto, sizeof(proto)) ||
+	    proto != IPPROTO_ICMP)
+		return TCX_PASS;
 
 	seen_tc8 = true;
 	mark = skb->mark;

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-tc-netkit-scrub-f0eb9904d0c7

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

