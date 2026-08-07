Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0A285041
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110356; cv=none; b=X3v1Qj1+JpTFEKf8G/Hn62jGyO57QlncU0Ip0VeQXFVaif26aJ/FopJNDWCaidahGsmlc74vqLXVxP4ptAgYQNouGkyFVECVzO7c6P1Mlqne3kAbwVlEbTBXl2kPxZGC5O9zoKpRDzWAXvAC4xAsUApksUpfileZQPr5lanIJGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110356; c=relaxed/simple;
	bh=Wofetp5Z3P4R5mpun6SHZso3XMYSZwee2HG1xFyV7Cg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dAzAkCknhRaov9EDqOmbRmLOS0h4wWRT/Kv3qfTLaquzitput11hmJ6uVtbF512z69MMzq+XXxIA24/pcpm3d9NYt86V7z+3G+9l1B6/Is6Zqw5B5Cno94+Ls/EoMHUeZ135D3t0gBulYZUUdeM1N5oDfMCny8uHBSjjDCskjIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=uOCa7ZdF; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="uOCa7ZdF"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b01981b541so1096142eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 06:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786110348; x=1786715148;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYHzpticqacgoFvvmKPg0LdzFqxuqRmFxl8tGbCVxoQ=;
        b=hFfXm0UjNLiYGbrSGD8XoBpZ152boiejX3dZoqlFHZ/mW7F26ir34RkM21NDfwyqXW
         bC5Z0xVFIDM5qu7Gg/ycqXbXb0HX1O4XmNaIujF80b8NVztwQPMeABQ2XisVlvlWkx8p
         oKYbI2jBvPCWczq2b3jmVeBfLognnwUM7GkaFPm5GGTryeI/+U6krLsWE2X9XZTa6oqz
         BVYVAWLcpYGS4xSv4QaKiWOYUIYKUUMXpTyx+y5djI6G0NzWj1Z0sU7JnKzCHpzpQNVN
         ioRpwQur9GNPSWVUtKUasuXxKJgFBGygKppvIh8a3wb4hiBkOMgEQnAfOXyqYd2imSRi
         oK9Q==
X-Gm-Message-State: AOJu0YzaZ+hxptFuNxpk4twT3iV6EU4+8H17Sn8RMm9WHaUZuSuHLmPJ
	Rivchl5pZlr4M27QWoUcezgfNMGLNLCeGicNYd/dfAAoPu2HRL9s3KFH
X-Gm-Gg: AR+sD10rx9ksU5TPiBu/4Q5z8NtDNaAKD1loIKbL9kt6fvyVB0h2tiBfITQQUTW3eg6
	z/PFiDeJvXpV7Jz9M01eRIJS8Eb3Ge6BqNNceZ2oPudCQurLTEBp/Jz5mQxVflIsqlqPum3KUeg
	pZFJEY1pMevuaCIei/514Rcfihsfjud1rhL4bICjnUKAs+p1rjaIUkaoopz09CTVmyL3iqaPKlj
	Buq99E7bSgBYIJJIJfo7SNjj5wR9u5/7KDKy/kpAacfDP7BGnWZEzpn7PbooDmMhs00d53LAXAh
	q38E4fXCUSZy48H4V1az4tBXlLhAEyvmnvYWbnb3WejhmySA3+WFfoV+l/CT6f2vcRtveojbXOZ
	2sRjIc7zJtdw2kf1bjlfWe5F6MEnICWGIi+UFZlzB6fLcRi/Lc/ZdTNQOU8yC4hxTakHv7tnIU8
	zRI9GOpxhmLu9igLjCUjXVtXd75CAv1baUN5dFxVbU114OCsO4R0OXZAlEffB39U7gVo1wRdFFj
	es5rTco2QC6DOwcAVu3+4UIjWRa0pWxbKLloT5QbyuJgrW0YtrfvXutfJAzRTUxUWQ=
X-Received: by 2002:a05:6820:625:b0:6a3:7af2:90ef with SMTP id 006d021491bc7-6b03505ccebmr1978913eaf.6.1786110347530;
        Fri, 07 Aug 2026 06:45:47 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02be475b6sm2333477eaf.11.2026.08.07.06.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:45:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 165D060A63;
	Fri,  7 Aug 2026 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786110344;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NYHzpticqacgoFvvmKPg0LdzFqxuqRmFxl8tGbCVxoQ=;
	b=uOCa7ZdFZyOvwZGap1qpbPMuVcmmLLPoNrMffIIb0u6nv1YTNAfvJTCpuDyNAd18HpZ+UW
	vv78CXtGT6PwjyoBDQFyNpy+Cjk0BRGDlyGnfCINvcrG6TlVg+zBu3n3k/dljeP0HKo6Bt
	CVHGspSRtubnmNexUly8pgJyr9O/Sq3s5FO7Hb6yB6aAv+eNEaK1nWBNH/VDS4zEu1iTUd
	eYqQJrDN4VKATmQMjTmXDf//n4EKE+ma+aVCbARDazZnft/XrBqSJrz0vtUEMTPS00lHyA
	0YGriyzAihC4SUYHixgc8u7pygJhmkmm/gJPi5DkLf1PiLrd40vJdM8cXZOWaA==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Fri, 07 Aug 2026 10:45:27 -0300
Subject: [PATCH] selftests/bpf: Fail unbound UDP on sockmap update
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-selftests-bpf-sockmap-v1-1-8c4936fa03cd@marliere.net>
X-B4-Tracking: v=1; b=H4sIAHbhdWoC/yWMQQ6CMBBFr0Jm7SSlIQJexbjolKlUsTSdYkwId
 7fV5fv57+0gnDwLXJodEr+9+DUUaE8N2NmEO6OfCoNW+qwG1aPw4jJLFqToUFb7fJmI/dBOpEf
 bubGD4sbEzn9+3evtz7LRg22usfogI4yUTLBznSQbWhiO4wshFRNtkgAAAA==
X-Change-ID: 20260807-selftests-bpf-sockmap-781db29c4f94
To: Shuah Khan <shuah@kernel.org>, sashal@kernel.org, 
 gregkh@linuxfoundation.org, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Michal Luczaj <mhal@rbox.co>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Sitnicki <jakub@cloudflare.com>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1786110339; l=2195;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=k0iKUTHaUwJH+lfQYJ0uFk2Hw3GHTUfbUqkLQYeb3Xc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLapkuTD1Pc2A9FxSADnN+MRQOVf6Y2X2KjShkDjUiDef/GSlF7Dxthz9YVZ2GWhKNqY1uiG9U5
 6dfX4A+U/lwU=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

From: Michal Luczaj <mhal@rbox.co>

[ Upstream commit 203b06932777b9ad5085319389dea566f5c2ca63 ]

sockmap now rejects unbound UDP sockets. Adjust test_maps. While at it,
check socket()'s return value.

This effectively reverts commit c39aa2159974 ("bpf, selftests: Fix
test_maps now that sockmap supports UDP").

Signed-off-by: Michal Luczaj <mhal@rbox.co>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
Link: https://lore.kernel.org/bpf/20260707-sockmap-lookup-udp-leak-v4-4-f878346f27ab@rbox.co
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Hi, backporting commit 66efd3368ae1 ("bpf, sockmap: Reject unhashed UDP
sockets on sockmap update") without this one broke the selftest in openSUSE
CI:

https://openqa.opensuse.org/tests/6147940/logfile?filename=test_maps.tap.txt
---
 tools/testing/selftests/bpf/test_maps.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/selftests/bpf/test_maps.c
index ccc5acd55ff9..d194b44ff8be 100644
--- a/tools/testing/selftests/bpf/test_maps.c
+++ b/tools/testing/selftests/bpf/test_maps.c
@@ -748,16 +748,15 @@ static void test_sockmap(unsigned int tasks, void *data)
 		goto out_sockmap;
 	}
 
-	/* Test update with unsupported UDP socket */
+	/* Test update with unsupported unbound UDP socket */
 	udp = socket(AF_INET, SOCK_DGRAM, 0);
-	i = 0;
-	err = bpf_map_update_elem(fd, &i, &udp, BPF_ANY);
-	if (err) {
-		printf("Failed socket update SOCK_DGRAM '%i:%i'\n",
-		       i, udp);
+	CHECK(udp < 0, "socket(AF_INET, SOCK_DGRAM)", "errno:%d\n", errno);
+	err = bpf_map_update_elem(fd, &(int){0}, &udp, BPF_ANY);
+	close(udp);
+	if (!err) {
+		printf("Unexpectedly succeeded unbound UDP update '0:%i'\n", udp);
 		goto out_sockmap;
 	}
-	close(udp);
 
 	/* Test update without programs */
 	for (i = 0; i < 6; i++) {

---
base-commit: 74b69060ba6e44e20c2e4dc1847eca21db6e4a7c
change-id: 20260807-selftests-bpf-sockmap-781db29c4f94

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

