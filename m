Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A71734C14C
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596772; cv=none; b=BMfoZaBx5Hae++HJgoJ5Hixh4azKNO7oopvcFbkxLAoh/W5+HW/JLXIa5Lb1fbLHVgDfmCvyJ9NqyGC1scLJgTqbxXt9/+U6/W2K+L7bz7Pe/7+Eb0cPpYXHTIZkyrKUB6TByvfLoR4fco7hTgVx3eyoNQn2zbl/EButeGHG9nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596772; c=relaxed/simple;
	bh=2md64ytofqgo4G1D1UhLCcPUCs8ETnPv72SPqDzXeAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5t/n6HY3jFRLl2IBEmimmseziyys+OWAcfEJb5/71vzmFYKbw5MxxhDx1reBNf1nOkpjpaa9V7QPEwwvHtpgTkt+HuzvUQ90Z5ugt5PfOJLzcaJP3ph64kMa9FdEQ4rWPKSQL8oXYU/9xYcdhIthgsliyzVl+fqtmtQD7Ps+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ejbJU1I+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ejbJU1I+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43770c94dfaso2205303f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771596768; x=1772201568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEEkPljREG0e6yeuCAp1Pz6C43CVga8vk+uSTyLXLvk=;
        b=ejbJU1I+EDffYC4ztHgn2DdZQ3dslZuJXk3xlAx2WewUYHyuC3vVpnIPV74yVnRc6g
         KFqjPlaSxtWZBN7U9diJ0wSrDssOfPQ6z0/3c3ZbmH1bgAK3BUl4y8oPq6aTHL/PTJYG
         0ViDY18lySXKlpwYBPhxhCYXfoMEc5NLk9r9+7tKWXG2BPKzONqXp7u6aGeBFNndN6y/
         vOW+oFa/TUXC9huonzdLDwBScqOhjKwaLzVdi+5jxjlWWx40GlSCFxIKSSz0hB7v8y6b
         oZ6lTtwLDNGLaDBT0iSUwAV2Wf1mZdbDXn4i+ztE0CD/h2sUVUuVA3sUHBqysYA3f0Mb
         MHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771596768; x=1772201568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jEEkPljREG0e6yeuCAp1Pz6C43CVga8vk+uSTyLXLvk=;
        b=kPb/gaSKJJ8a2ZU41eDoAf8Po0sNQVP/n8RXlG4PCGqvOyNIEvdUOhFJACwUS3JUB+
         TzMhk20LLbVK4UmMEF5vr40ykplwKZP8O0YJO+lrQi/jFy3/TBueOPMfFhZi15uTPoNB
         YQJWbRET09Ykew5txanFKMBpIJJ8Ai/vvApGUVVADhpCnPRiIJ4NNwaDk7aHgk6yLXdA
         hygnhpewmACiTaPUdUbapBBxFCqE9293n4Gcvyyuvn8GaVUwkCurnK0TDNephbE9G754
         ZIPwLARtcaH5l+AsdHTNjfJTXLpTVp4P+KZJKtg2+TXUpPrDBObNit0hbGeC8a8QMO28
         AFOw==
X-Forwarded-Encrypted: i=1; AJvYcCX8BEVcQA+EnDg8mn0VDbJdYKXjQGJ1Zrlkv5Cge+f/iZNcJbS3JUfN7xZwm/B+d8DmeP6a5i92m5Jl6RXs19c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/JzVZBCvE4lM9lRznnsUxGoE+0i0SHBDgvuptwkfK8uYOoJem
	jIqOPSg6ccsMUabkjyEbDHh+GA4ge/bnOpjUdOWJJLL4/sTrq1ltIaD5doGv7R+qLSg=
X-Gm-Gg: AZuq6aLiS0rUNM8NJJ5RosJVUR+juzck1s8nP1Q0XT5yRQ8ApNcq6e8AVgMUcaGtWkp
	hJTIN2qIuFD1QFaeglzvzuUDkbKiYycArhOosG+0qCM1PvGqhvpmuvoGYUO0C5vCd+1MG78mJJu
	rAXS6Gi+9GUuKOS2chO3cANt9kpIgz2/P62De2/vhnBypy/0eqNPSw4FOpmLwZ9C5kF8R79Ei99
	2vhRwUH/XGfyJJaBAd7tHovcb8wcuh/t4roFrToiVNbKdWobanQTp6f8pTbtN83x0FC+Hp8VkRo
	s1krNgKHLqiqXUW2QluaR7UAxObSHHRUWEwycn/LSPBduatQCno49Co65Pefr/Yw1l2V8JxoaK+
	JJGqKNnAE6CRC57cll27LegxdqsnqEU5T7EB38WrHoPxbn8nvZ3KDn2VnnQcyVOLA9iw9Ai2FxA
	0ha5wT+yAv7Hsq/9+rZ2hx
X-Received: by 2002:a05:6000:2301:b0:437:678b:83c2 with SMTP id ffacd0b85a97d-4396f189eadmr19877f8f.54.1771596767842;
        Fri, 20 Feb 2026 06:12:47 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:822:3100:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b2d1sm60119173f8f.4.2026.02.20.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:12:47 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 20 Feb 2026 11:12:34 -0300
Subject: [PATCH 2/2] selftests: livepatch: functions.sh: Workaround heredoc
 on older bash
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
In-Reply-To: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771596757; l=1061;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=2md64ytofqgo4G1D1UhLCcPUCs8ETnPv72SPqDzXeAg=;
 b=HHrucUUJHPEYEpVG0/tc4hROqI0nwjtNy9OQC3i47BR+EGbsZw8+fl0tzRFfiFRTi/PSRtxL0
 YDBcY5AvBogAdMushsXKWxg9JGQjV0TQHeLldsIsgUrJNndK/VXN7dD
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

When running current selftests on older distributions like SLE12-SP5 that
contains an older bash trips over heredoc. Convert it to plain echo
calls, which ends up with the same result.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 8ec0cb64ad94..45ed04c6296e 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -96,10 +96,8 @@ function pop_config() {
 }
 
 function set_dynamic_debug() {
-        cat <<-EOF > "$SYSFS_DEBUG_DIR/dynamic_debug/control"
-		file kernel/livepatch/* +p
-		func klp_try_switch_task -p
-		EOF
+	echo "file kernel/livepatch/* +p" > "$SYSFS_DEBUG_DIR/dynamic_debug/control"
+	echo "func klp_try_switch_task -p" > "$SYSFS_DEBUG_DIR/dynamic_debug/control"
 }
 
 function set_ftrace_enabled() {

-- 
2.52.0

