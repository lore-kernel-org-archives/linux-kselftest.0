Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C84A2A4D
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468169; cv=none; b=tuPFbxCgAR6oXn7kOps1z1qgD6ds+jzRipIFOMtoOAfQktdWEnyTSD0lX1DuxpsGzCfP4CKZCGvwP5uj954+6mePatE2UjavOIfRkqfSzmaNb0j7GfbVJlDvfsT1mZ4tiln/uSdCV6dHeMnRi57RcKsdqKVSYFjFOHXGKHKSmDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468169; c=relaxed/simple;
	bh=bahwq3zhX8Ly6A29Jjh8zxDv/0A1k+kF3/Q6NsvVg3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mhOe+KdP6vVGdjKOpXcq1oGUawNoTmi0vvV8wKlVo65sJDj65lH+uz1iS5mNdzS1J9bScGttQSGHfzNQ/5AsVJLdW3OWPJthNxLyy/aJ1ptn/tpL/yRwYE/0ieJHfE8MIhi/N0fDamlDHSqhvzF0tKsYQQyit8Hp/F5jU9wSSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOEJ2qos; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOEJ2qos"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1419d3416ceso9996371c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468166; x=1792072966; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xtcAtg9RPe8ybW5E9qQpidKnLoLoxeabdblRAW5zS/w=;
        b=sOEJ2qosSo5uonVOT5O89+SV7jQ1cyqo33WIeCa3OkAdP8zOtbaU/VyCJ6nK+rJxbC
         zAwNehqDbtal0UpjfMUZSD9XnEu3KGxfkgQPCeVSDbGOXhzapopydSiklVPfoB7JGy12
         bvyr10bWET6bsOU1jiluE+PCyzYKzwf5JiORrQNqOo4ovrMc306NkFynVnJ08ztkGEr0
         LgAF4q4q6cqXBXJvmJkTeoA9cTb2Dry9pcFOPEql78fqWfAsf3XFfdZ9PR7SkYOHnx63
         s8CTgPEkGN6/d2yiECLTHUFkFWFNC+N/+D4Q1bE8ucLhBf/cJ9xATZ4N2AQZopcInm5L
         aY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468166; x=1792072966;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xtcAtg9RPe8ybW5E9qQpidKnLoLoxeabdblRAW5zS/w=;
        b=dF9k0uJerviC9DeedTZHGwByBsrYBuNvQR1vUQ1iV9gwr8ve3+ZKea4MRClCWqYR8+
         1oyU0AKm0KkjCzDhlod/HOx7GnBUGJbUcR85SOfp2SjumGxCM70g6xkJBqWdvdGQla8i
         WOObyb/wIRJvOs/PBBI72H0lbf8WDYov32NQTTRJ7nIfwZtxkNk0IjaBGYG5Dh6hZHqy
         19JOOQLZybYR/wPdE20TtxDFjDhuP2muzWx8lXswSe7B4rcRT4oWJsCoTMq5ZkWQL7i9
         StA0rApF7SRGaqppJsY3FqZ07anLnIlUawZF5gFvt6rTdch8iPTFqShJ2s7DGyt6wxul
         6LiA==
X-Forwarded-Encrypted: i=1; AKwUvBzkczrlIjiZmaowVFch61Y6WKR0hpN+nTxdlVUjlKxU62mjMV1bHeXRHNXOmPNbvwjIHBmr08KI89SpTULZvpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nozoWlUoTOInzWqOOD0EnZx7Th3mSUxfiL9whbkizcyjtuN2a/
	BTs8rz2D+ZSOcrSjJPmyNjJOpgnXhBNr6y+8Fayx9V0lfOPBh2fS/VmG
X-Gm-Gg: AYBFou1+Suv6wn7sKpZLxKaIACu0sjnxZLQdcKT0SJM2GVZLN6wyiCd4eQVOl491jnJ
	XEazG5T8VGGYsclpRI17iHAPs3J8aaE+tzhkia+N8EQrkTQ51VcZFErSePV2n/6Kwio65XF1NIc
	nB7AKfEzvIXaGIfxQYYs4sMgprI3CyZJGzwxvVuqJGImBoBoDSn2vluAZicYqVEuA+ijNTwaxaz
	wh3sYaNOIWA/rCQkIEw9ctD95u4iARQM7F5tvJ2QmcDXxVs4JPn0TUWxJJ2Bf3L7vwiQlYEVNN7
	VfXsyoCA5gdYnh8qAyGFQSo2n8pFwErXAn1RgC/BQDQvfEH76lFev0aOsbxqNzWbi/uFqoqXkeB
	1bd8O1OFg9aav+qlVpBIAAJDA2pBwgO9ecdHUh3Xfiuq2uH+KdVHLv0Kmv7rkv2z6TG90j4IdYM
	hQsGbUJaxOY5/4b6VHja2JjRRkD/8ERmI/NGHywPXFzncH22q3pHICFPuqSjctiEWJM6am7SvNl
	21W
X-Received: by 2002:a05:701b:42c2:10b0:143:297c:276c with SMTP id a92af1059eb24-1620665f4f8mr7308989c88.33.1791468165887;
        Thu, 08 Oct 2026 07:02:45 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16375a1f898sm11460637c88.0.2026.10.08.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:02:44 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:02:39 +0800
Subject: [PATCH bpf-next] selftests/bpf: Use its own netns in
 flow_dissector_skb_less_direct_attach
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-selftests-bpf-flow-dissector-netns-v1-1-5d9889aaad84@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH6ix2oC/x2NzQrCMBAGX6Xs2YWk9Q9fRTxo+q0ulKRkFy2Uv
 rvR4xxmZiVDVRhdupUq3mpacoO46yi97vkJ1rEx9aE/xhDObJjEYW78mIVlKh8e1QzJS+UMz8Z
 p2J+SDBEHidRCc4Xo8p9c6WdlLE63bfsCqJKqc34AAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

test_flow_dissector_skb_less_direct_attach() and
test_flow_dissector_skb_less_indirect_attach() each create a netns to run
in, and test_progs may run the two at the same time.

Both name their netns flow_dissector_skb_less_indirect_attach_ns. When
the two tests overlap, one of them fails to create or open the netns, or
loses it to the cleanup of the other one.

Name the netns of the direct attach test after that test.

Fixes: 2b044dd186f0 ("selftests/bpf: re-split main function into dedicated tests")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/flow_dissector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
index fb48926814647..f6fefb14cda3c 100644
--- a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
+++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
@@ -706,7 +706,7 @@ void test_flow_dissector_skb_less_direct_attach(void)
 	struct bpf_flow *skel;
 	struct netns_obj *ns;
 
-	ns = netns_new("flow_dissector_skb_less_indirect_attach_ns", true);
+	ns = netns_new("flow_dissector_skb_less_direct_attach_ns", true);
 	if (!ASSERT_OK_PTR(ns, "create and open netns"))
 		return;
 

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261008-selftests-bpf-flow-dissector-netns-c347cf31e5f1

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

