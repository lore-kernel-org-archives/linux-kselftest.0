Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5C369D6E
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934909; cv=none; b=eVqO3ZPSQ/Jz0df1hyFtN6dMebF0bqhx6zjfXSgEOCuqT/JORj3c5RLviolj25bZpODzcYTGAtrKkzPSpkz6OVbk+t/y/vFaSRxMPksLKxfVSLpWTRYaOz4ah4dSRAl11k8BEpKW6n7UCFv6lFHNmoiMUFb/ekPs+7Bw6KXkj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934909; c=relaxed/simple;
	bh=sDWk28xBuFZTTizpUURrHrIa51+ATw6mlf2LRdxFbyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pR1gFNUfwAiUBHnRKBSE6rAtT+D6JodzTf/pFckCQEgA35tIRgFi+I8zVeWmMMxGs5qwBmleodFAtIt5yV1uJ2A7aJYyLgw7gwIjExJ5utVhfRGoB8nNhQPG/9yXvHQ0qBzTPccZHY9GurrXQeUW+H0iztv5Z89oFHu73yzr4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4Z76j5D; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4Z76j5D"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1381442a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783934907; x=1784539707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4623BPbRgjIujmWqWQj6M4QygEbpjJiFDAO4rapy8N4=;
        b=H4Z76j5DdsoiZc+sWXEadhMw8YRmgzEHculdvPcoN4TjsemeLPTrFzcxF9utO+ByFw
         79VAWsrjth+iJUw3kQ0D8wVQjon8QsMCFWmEApk7h2ySROjoQQ2ACwb2dDcbNZJ1BIs2
         Pi7cv5SCK5gqTWheJ4WnlKKVnQX32PSuvR9N/+hlOXPlkwUClKQwafwXptjhj2XNhCUu
         Z1bvewx57aFY+7ow4KIVJV6skRCrLA54OZRwuBOy202xZaqEC2y5HtfaAYK5TaYySsZd
         qtAO+xxqLK3RNcvfZGh/oXrU1t6uij18EKVQPod4HbZlqfTpxJD7jmBtfTRN6v8Mjnqv
         Md0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934907; x=1784539707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4623BPbRgjIujmWqWQj6M4QygEbpjJiFDAO4rapy8N4=;
        b=o66nHWPPUm1N7yJW/Z8AvnDaJ6wvKljGqVBEVjvtPqhiRo0eJgz3WmGPthJQpUeXQU
         OA/IcXumO0LdmzGJLzx0ReRV4iWw4js9k8ymLb9JoKwO4EMhGW3jJLrNM9tSjwldM3ne
         1wlPihEoITgnwiOG4VOMKrUD/Lf4XJCYdaBiMc4LXDoBnlpGeeIC+6N+Ubdink9lCc7P
         imOQXdCDQqPWbh8N2O/gKV8heRrTNOnnet6vhMQSk+69ARo8ucmt9Rh1LNo1kS4e7XFr
         Cq+GqrrGPTL6aNm9jG76NA1lihix804s3NcJmAkZXB7HOTnLEtWeblEo2lCZCmaoZTe7
         74fg==
X-Forwarded-Encrypted: i=1; AHgh+RprmI37VUdY9oduqOn4wrAh3L+uzDGQnnweJuPXRUIVgIytq23lm4+WU7OTLFDB8dazS/6lfVyJjchRmOD15wE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUYXmzVkD3MeRtk2HKPM5D7Y8S8Jk0TasibkB4rLaYK8NcDzN
	yR0Xr9+TY1qsbyHwSPPuZiX3A1Yw+oMjLk66pW18pbg5/0PerR+wwRSe
X-Gm-Gg: AfdE7cn/kMklkkW3xBgVCl3P8+zWqhc6Pe0E/EXDUkgIHSfvUJdWDWOneZIrqfi0oYy
	G8BheuifLxHN976ZsJMH6kPSHKO/8eTkIFHIm3wOR0x7sX0j3boe1bX0C2TMSbvqHBFHy1uyqCG
	R++rged7xZAHuU6cfpO0BqoPfhdveEWB8zG7Ldi8rlpmt3SY1NQk3C+o4FzY5ijbXdEpunuQn8D
	M20avd7nStyUOJiXxldGN94pHu9vHu5rdgrXraW+ep1UoKdpz7KB9tC1HkEu6yV6WU2YMkMHYo2
	59CfKjU3xmJ1gtMQ0IyPQXM8HArG+b0jg8eq3jH/vGLUYW8rY7jbk92mqhrjN8zXrmLPM4u0KRu
	Jxivz9MDs5qhcR6cgjC3LdiVHAMfnKEyZx3TOETLuacjhKKAvaio64Em2n1hWVYtQxxLD4WplJq
	dbD9uBDOeOxD4=
X-Received: by 2002:a17:90b:1c91:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-38dc7b81c27mr7444738a91.30.1783934907345;
        Mon, 13 Jul 2026 02:28:27 -0700 (PDT)
Received: from lima-kernel ([104.28.160.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5564f58csm6293039a91.8.2026.07.13.02.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:27 -0700 (PDT)
From: Injae Ryou <injaeryou@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Injae Ryou <injaeryou@gmail.com>,
	Brendan Jackman <jackmanb@google.com>
Subject: [PATCH] selftests/mm: fix on-fault-limit false failure under sudo-rs
Date: Mon, 13 Jul 2026 18:27:00 +0900
Message-ID: <20260713092700.464376-1-injaeryou@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_vmtests.sh runs on-fault-limit as the nobody user via
"sudo -u nobody ./on-fault-limit", guarded by a check that nobody
can access the binary ("sudo -u nobody ls ./on-fault-limit").

The guard resolves the relative path from the inherited working
directory, which only requires search permission on the test
directory itself. Classic sudo passes the relative path through to
execve() the same way, so the two agree. However, sudo-rs (the
default sudo implementation since Ubuntu 25.10) canonicalizes the
command to an absolute path before executing it, which requires
search permission on every ancestor directory. When the kernel tree
lives under a private home directory (mode 0750, the Ubuntu default
for new users since 21.04), the guard passes but the execution fails
with "command not found", and the test is reported as a false FAIL:

  # running sudo -u nobody ./on-fault-limit
  sudo: './on-fault-limit': command not found
  # [FAIL]

Wrap the command in "sh -c" so that sudo only resolves the shell
binary, and the relative path is resolved by nobody's shell from the
inherited working directory, matching what the guard checks. This is
the only "sudo -u nobody" invocation in the script; uid, cwd,
rlimits (including RLIMIT_MEMLOCK, which this test exercises) and
the exit status are unchanged through sh.

Verified on Ubuntu 26.04 (sudo-rs 0.2.13): the test now runs and
passes instead of failing. Verified on Ubuntu 24.04 (sudo 1.9.15p5):
behavior is unchanged.

Fixes: 5d2146a3354f ("selftests/mm: skip mlock tests if nobody user can't read it")
Cc: Brendan Jackman <jackmanb@google.com>
Signed-off-by: Injae Ryou <injaeryou@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a60b9f9f16e..687d115e3bd 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -302,7 +302,7 @@ CATEGORY="compaction" run_test ./compaction_test
 
 if command -v sudo &> /dev/null && sudo -u nobody ls ./on-fault-limit >/dev/null;
 then
-	CATEGORY="mlock" run_test sudo -u nobody ./on-fault-limit
+	CATEGORY="mlock" run_test sudo -u nobody sh -c ./on-fault-limit
 else
 	echo "# SKIP ./on-fault-limit"
 fi
-- 
2.53.0

