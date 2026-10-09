Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A527B340
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510581; cv=none; b=SIv6BRmisPMQ4k/yNtwACX/VCN/ByReIYsfVOuY2vu6msLJFq0rIPCy1lldoZpksN+CsQ+jLjzDbYvUYqcJk2q4cfZFGYaCWfk14grLdoBTWC+lPzhGFgYKWj+su11qVyFJqJf/rnXCtvqAr9xFxAIAlo3/iCKqyUZoCRy6BKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510581; c=relaxed/simple;
	bh=THhfXb+U+XP7ZYgwkXJ/3sH7l2Fn4g3IOzyG6H+bmkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mu/j2fyAbZerJufdi6o73yjkpPOIFYD5BTbgIx1omvvP6m3B4QTF2Q29+U2P4rs3+I/OR97MxsiOnlX4+dCKMu8kj1FoOaIntay35TsEqL5gK9RqmKOAm+zDarynqtEIaO/4di8IUCjWMJa3ZjOdvdw1O8IeYEoH3ovMAhu0l9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUro7FXb; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUro7FXb"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35115b52125so4831709eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510579; x=1792115379; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xfjq8Lb4LixkZlBGmvrpE+e8LfVmt7BcDqgbPU9H7wo=;
        b=WUro7FXbQ7dwAZo5ZRV0i4OqcZX+sPn+6poJdr0sKeFTMeV0YC5k/sVjIer6wf60j4
         kMt4G+WPYfO5EW6DN2Z6DpQpVhqtejdXiBGZD9RGgafUfQimoXbLXlqDnDtB50OOMs5r
         yo5X9nMJNtvI/Df5w+7PuUK3TtOAY2UWcq2Wokwi9ER6B6Eozw4RpsP57qyMy3O3J/Zq
         spDdFa+WerOufW+J9Etyya29mNELW31ZdraORHQcCceKHEEEggsme9eAEfGK8dFAfZVi
         QZyrncyStk1y0JRGPO/e40ZqNfUjD0LDPBUimQq2dtpcAhOPIpqPMfViZcGKNO8fuA56
         ygDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510579; x=1792115379;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xfjq8Lb4LixkZlBGmvrpE+e8LfVmt7BcDqgbPU9H7wo=;
        b=P+iuYZYjrLQ9WsCBINSabWTuaR5O0NrtdE6rRKBSWEjaJA6/O0f0GlADTdIiZ0aGP2
         lTUvmbQURFv1oBtTaFyi6b1qhqPiZUlBrIDn8UQspW37n/9nAjS9/34IHjcThisl6/sC
         qjTDaKfqFpUvPlKOMeu8N4DGre/Raq0I6TiFYs4nsZRFSalsklzMq5l5fk+tmFzdiAfi
         Ydd3pTgehhddK4jjyvbCjcDdKfM3mJ8wATVHWTDoMik2AMxrOpKLLIYr1zC8iobc+kdS
         SWeokrYBwLJoES9FDVb6pg/BnBm5fKmtp1QBrx8bA+S0ChimXEthmT8t7v2aIfJ9+y3v
         AazQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfZdVKsLxr1prvYoqs7sSwgQ+cLTYtepWxfJjF/Xcn4r+xpFCgA7dcX7sGKqZbqcOmunU69mGqRkKAXau3m6c=@vger.kernel.org
X-Gm-Message-State: AFuF++l86ULSNj+WfJWEAhmYZaKXlsxbopT4gwrklSXivRTB3tCOqd9T
	And1DGaG/dMS8sFRKR13InotETaZ9syIAf3FjCgx9zTJ5r9bowvM8XCS
X-Gm-Gg: AYBFou1X2q3027C7OJX6w+z6rla00CgVZtEtgOTAZYRwBTADblqPv4S/hqYY/vTBYoX
	A9k9MjZBfxRvmvAjrcaxacw/EIJJtl9K/p1rAwMFYu6pzVb6LvW6aM4dMWAdRTeu8P7D8TtSzAt
	lyKgntQFSjXpFjiH1w9Js2uAyHU8dT5m7M0vqAk4nfB3xy2zXUlxqH9jxEQ/64ofUKIs8Hbw8pI
	2JJ7iuHqZN+yJrKmDnC8+y5HnP1H0kyBOmG95CVFERVAUn2KQlub7Fu4HS0Vz6ponIpKlm8vhIa
	IYTfujeNRWf8fbQg24tc39gctgQDjiL0ENYW9Yp+d9smUJ/t7TKHX6jTTRNELNXhlymbBD0X3eg
	8WcgocAG6ZrQQ9aDP++kyPF0cyPsiPGOx6VxXUDkbXzqTbzbRjOXa1P9ulMOiYYmSN0SeWtlFb3
	mPMPtrtHcdZzOq+z2ox/hHbNvWJ7PuNrU7Qa95Gj/ps0Ms3hz9Vdd3Orpd57YtlS7tvTUPDrcbE
	/gs
X-Received: by 2002:a05:7300:de0a:b0:351:248d:d63b with SMTP id 5a478bee46e88-3537dfc6a6bmr800021eec.11.1791510579152;
        Thu, 08 Oct 2026 18:49:39 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm2009262eec.16.2026.10.08.18.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:49:37 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:49:32 +0800
Subject: [PATCH bpf-next] selftests/bpf: Run the cpumask map insert tests
 only for the test task
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-cpumask-insert-filter-v1-1-3249218594d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIACtIyGoC/x2NwQ6CMBAFf4Xs2U1aSBD8FeOh4qtuxNp0F0NC+
 HerxznMzEaKIlA6NRsVfETlnSr4Q0PTI6Q7WG6VqXVt750bWTFHg5ryNUee8vIK+mRJtWMcZTY
 U7uM4IHTDsXOeaikXRFn/lzP9tITV6LLvX1xT3HF/AAAA
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 David Vernet <void@manifault.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

verify_success() attaches each cpumask test program to task_newtask,
forks a single child, and expects err to be 0 afterwards. Most programs
return right away for other tasks than the test one.

test_insert_leave and test_insert_remove_release don't, and insert a
cpumask into the single entry of __cpumask_map for every task created
in the system while they are attached. test_insert_leave leaves its
cpumask in the map, so a second task created, for instance by a test
running in parallel, fails to insert one and sets err to 3. Two tasks
created at the same time can do the same to test_insert_remove_release.

Return early for other tasks than the test one in both programs, as the
other programs do.

Fixes: 7b6abcfa15cd ("selftests/bpf: Add selftest suite for cpumask kfuncs")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/progs/cpumask_success.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/cpumask_success.c b/tools/testing/selftests/bpf/progs/cpumask_success.c
index 36f77b9732d46..ddaba4318c574 100644
--- a/tools/testing/selftests/bpf/progs/cpumask_success.c
+++ b/tools/testing/selftests/bpf/progs/cpumask_success.c
@@ -460,6 +460,9 @@ int BPF_PROG(test_insert_leave, struct task_struct *task, u64 clone_flags)
 {
 	struct bpf_cpumask *cpumask;
 
+	if (!is_test_task())
+		return 0;
+
 	cpumask = create_cpumask();
 	if (!cpumask)
 		return 0;
@@ -476,6 +479,9 @@ int BPF_PROG(test_insert_remove_release, struct task_struct *task, u64 clone_fla
 	struct bpf_cpumask *cpumask;
 	struct __cpumask_map_value *v;
 
+	if (!is_test_task())
+		return 0;
+
 	cpumask = create_cpumask();
 	if (!cpumask)
 		return 0;

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-cpumask-insert-filter-6f98ea387301

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

