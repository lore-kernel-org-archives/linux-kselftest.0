Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6937339376
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748217; cv=none; b=EkP28xIim65jRETf+SOeiUDVd4X+seRomCVZ5OPxKIVIrzRxga9bRiyVUb1pJYqRfLdMfMYdpR/pcwa7Nz+uXiHPDyI605Oa+A8q9HVXy1M++OnnfhYMDE5ajBfjHi6uAj6ywVz5K3GXDvgbfOZYXB98GKHASe0SdZwM6bPxqg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748217; c=relaxed/simple;
	bh=axdDbCUJzEf1U4BkmExcoQBin+GjinUVGoYj1DB4yNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A9pZCbWoVUf/m4VyFXR2HnCJ3cLSf3JyxphvBG80ijacIlWJL5xWqaFbt2aKtei/1a4KioQbpzzR45l49VVXFV4QlQAvPELvFn5/r173LgrtlWR4/zHrfOxwkLi8J8ySlRbHyqEdK5sSmT0Fw4qZhDlwYzKn99JJuNjcjRSTcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKQIjK45; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKQIjK45"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so13225375ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 23:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790748214; x=1791353014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3ttmE9X6/fAonyMgTPG4YUEsTGdFYYGeA/sfbV45M8=;
        b=sKQIjK45wPoS1dNuHPFH3ByFc5m6coPbzzQAuc8gEFd7k6yOoXmNJKc9FsXk6PMS88
         Mzqqgqx4i/UuNZr2Lc4dpqOJg8Ht18WmpkHl+1jwZ7j2601gMNWeSyP0ZRlOC7b7ZGVV
         E4P+yLuNZLVBwj5+o1RLqzOCVZFT8usKP7Sac2j2GaPjgZc2JApop1JrTKLRgK7B+HLX
         WE/Z8xke+gtBJBUEm8LEOxbHjnldneWHVvqKStMkdE2if+kQUbPzaV8rZJ/YUUXBDHUN
         V2XWJkxrL3ZOngYhNS18GJPZGazNobY/mlITvBgD8ge+0cIJ1FdEYGVv/I4aub/eakDc
         TZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748214; x=1791353014;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3ttmE9X6/fAonyMgTPG4YUEsTGdFYYGeA/sfbV45M8=;
        b=dSvvJs5hMkjiaN+zTy9O/GOZfkTW/L87eZBOQie0QMVB3MBD3LtnPhv33HgZNLfIkG
         w1MW/FColELwmRQMBF58oSV2ATmJIFCv9Nwb4hTLT4DfXhvD91jMcp5xHwYi0RaXjo7S
         AzbjrUFKrZqgwgZbRQvxOfWviKE4dYTmHn6aW3RRaIgOLWZw3PfOvU7ayZmnyvp6v8LZ
         UJYfi+57rYGtr1R8Cmq4KoVmNWxuF7MmiBSBby6curqUJ8klz8TllRuWrU68KGYaLFsC
         dwovXGs6K4GT7frw1uOgHMfNbhHHdaike7+Bhi6wE03c1lJgUmF/MX0zBlZ+ewji1Rev
         6NTA==
X-Forwarded-Encrypted: i=1; AKwUvByvE5iHdEHUyqdNClkN3xC5ie28kvuJt3e8lcEqbhU4lLQyqeS9NwOpLf5SXAoaFg64bu8LH0iZNQA2GjM9nr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLtkBMCIqbHzPO/sFkDgl6ctUOCcUJGdi79LWKrmEOgGk8Icwa
	b+nyNecqxIqfJVAdie0V/oHS4hObZsYo03wvG4Jx9PA4W0rC2NZjLkGRSL4PWa7SFpY=
X-Gm-Gg: AYBFou2cbWPRaoH2fh4nxpjmX8x4T+Qa55Mcrm4lKTyvkoRLrFB/b7D/oIxfW6dewzO
	NV65196HSkDGciYVTJMg7fKQoSzbcZVJzsyhBk7ru/orJwOEsIy/6tAbhHb1LZkQjx82p7BT4pU
	3cd9LAmhJolWwCZkO5/6Ad0hz7Pqp4/0WCEQB/0305PBy2Pysdvfv1TlenqTKGo53zZoBTHYhe6
	3TDp8xdPImppUEFbhBz8GvI4EuzbBJ40j8SbKNG1Eu5JDA/NRtuUe4F+IffJs0JkgI0xa3tk9AS
	2JkRW4Lwy0NvE11Um3tnOmV7sB6hVLUqiRQivYMfCfadHI/AScQXMjxpCWy3IVr6zNPUITbpy5M
	d14tzvhDrfdsKtqxfFI9LwwRwO9jmn2VvgfWpO/u/lgNQu4epJR5k5yGG0896ywcj6ni0ifJYx6
	5g49puf7/+D/bZihznfM/LwZ+QR0wVGvX1xTfEejQPzgDdnsYuqacPadwQLKXs4e9dW3X6JoJDk
	0Q=
X-Received: by 2002:a17:903:2947:b0:2e2:d3ef:125 with SMTP id d9443c01a7336-2e2e4edf4a8mr1557185ad.5.1790748213905;
        Tue, 29 Sep 2026 23:03:33 -0700 (PDT)
Received: from omarchy ([2404:7a81:bb40:2400:e077:4928:9847:63b3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c39578sm1465025ad.76.2026.09.29.23.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:03:33 -0700 (PDT)
From: Ren Tamura <ren.tamura.oss@gmail.com>
To: tj@kernel.org
Cc: hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	void@manifault.com,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: cgroup: enable the cpu controller in test_cpu
Date: Wed, 30 Sep 2026 15:03:24 +0900
Message-ID: <179074810117.139422.8287518907118199923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

test_cpu uses cg_read_strstr() to check for "cpu" in the root cgroup's
cgroup.subtree_control. The substring also matches "cpuset", so a
hierarchy with only cpuset enabled skips writing "+cpu" during setup.

The tests then run without the required controller enabled and report
failures. When cpu is unavailable in that hierarchy, the suite also
reports failures instead of skipping.

Always write "+cpu" during setup and skip if the write fails. Enabling a
controller that is already enabled is a no-op, so a separate presence
check is unnecessary. This requires write access to
cgroup.subtree_control even when cpu is already enabled.

Fixes: 820a4f88ee46 ("cgroup: Add new test_cpu.c test suite in cgroup selftests")
Assisted-by: LLM
Signed-off-by: Ren Tamura <ren.tamura.oss@gmail.com>
---
Validation (2026-09-24, mainline 62f4c998b297): ran the full, unfiltered
test_cpu binary as root on a freshly built mainline kernel in a
four-vCPU KVM guest. With only cpuset enabled, the original reports two
passes and seven failures; the modified binary passes all nine tests.
With cpu already enabled, both pass all nine tests in the comparison
with vCPUs pinned to separate physical cores. With cpu disabled at boot
and only cpuset enabled, the original reports test failures while the
modified binary skips with exit status 4.

The guest validation used a writable root cgroup.

LLM assistance: finding small cgroup fixes, drafting code and commit
messages, and preparing validation.

 tools/testing/selftests/cgroup/test_cpu.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
index 735a53bb222ba98812d5c6ace221c3154362d859..3456e3e988c68aa6105a0d862fdc51fa0cb10d6a 100644
--- a/tools/testing/selftests/cgroup/test_cpu.c
+++ b/tools/testing/selftests/cgroup/test_cpu.c
@@ -835,9 +835,8 @@ int main(int argc, char *argv[])
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
-	if (cg_read_strstr(root, "cgroup.subtree_control", "cpu"))
-		if (cg_write(root, "cgroup.subtree_control", "+cpu"))
-			ksft_exit_skip("Failed to set cpu controller\n");
+	if (cg_write(root, "cgroup.subtree_control", "+cpu"))
+		ksft_exit_skip("Failed to set cpu controller\n");
 
 	ksft_set_plan(ARRAY_SIZE(tests));
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {

base-commit: 551c722f40809618230001baccf219193e22fc5a
