Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1163C339376
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748221; cv=none; b=VMFQmhq8NbfyVAu0JiisPnPkxfLe1jRUWKi4VUj67ELAyM5sqbtEilPuyli/LFlMNsCTl7vFhLGtwcl2+he3E/tmZ3Ua/hZ0Duvfyvd/4+ZkXz1LL/T233o0IH+c1kWE/vXqJx1fP+of21L3/yKTlOIapLey1+BD0WA9C/0+WiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748221; c=relaxed/simple;
	bh=UARglUKAvqBq0oxbnGvbQklaKOcZCNUwsD/ukl9WrKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SGp8NORfpCti3hH0OfyVcqOZGkSmk1oBym/kewlE0nNngjLZDdNQBch/tgh1BIYmP3pOipznksRRexDXwXIQ644Fb5DIQl3uxJy0xAdC+nOqNqpMPf8MpYnnGjoUrUvXTNM7Yy/ew+9dwLn/PY8RBaixoh9/TcKA16rMoQGg3CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UL08RL5J; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL08RL5J"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so16340795ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 23:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790748219; x=1791353019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnB9FKIKFzNu1Po5I3Gn7uovAY3H37YHyKqyanOeRws=;
        b=UL08RL5Jh3DrD968l86xLqCF+DqjZAj0uqyWfUYyBjs9yXitkSB4FL6Wtg9ZuERqVB
         FcIKjar3y7l/ZEbt/asvO2M6xiE5kihLoTFLqQJjY/ix7WJI58pQ26d9L2an3Pwzl/ft
         y1FarPqEn+Xwd1kJjqlo5m/vS2A+30tZO2APCFV3Wp3yyOD2gmvCPkJmniMUuDOCVIlB
         6KLfuNQTkz+dYzWFjJPZas5EaU2Uq4/CRWzBV0lJombzf5MKA/oq3EtapUiAqEusUvqb
         NSQ3naEp9ldMyPiMAr5M6KO4cLs4/ZKUHuPtLmNVpILEtKDztXwxM1KjYBkzyVtCtiN7
         oWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748219; x=1791353019;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnB9FKIKFzNu1Po5I3Gn7uovAY3H37YHyKqyanOeRws=;
        b=YA+i9x9FVqI5jUEN3rNxo6sQ1GW0/0anwAcdWh1f/FFqfgiM8jOs/HCuTBFSx81nCB
         etHBWtlPbdZv1PMA/+kXGMmfG+UoW3NUFg3p4S90RKHN0JohXzAwMB92LveH8ewGXD1n
         u04DwK60KWB3kdeyATOTjUfKPvYlwrXkUlVnoMvvH86DkFcOX085PSOmoMxuOujkBLXy
         aUPvuts2FHLYNpOTo+M7+yyA07BFwTyBVA+Y8yGQetTGZQaF/4ez6TI9KuImF1n2ig6V
         xZCbBTFWnIWfRGX8EziV2FZd6d+KcRNlsQ9TkKDLx5TSb60wKT5yAtm7BmKtGiWttFF8
         yL0A==
X-Forwarded-Encrypted: i=1; AKwUvBxKNOcb4xit6yujPyGk6yTa9dUt55Ch4ElUBI1hA74E/NGZvCHg8bls+18GOjyK66OMGD8FxFpmexq7vHToq2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ62bdg6qIA7+0DWspPoORSXABPGNAcsroRjiHsEb8HsCv4u0gt
	ksNf/+y/xAylBUewSRLPQaB9XGc7qhY2U3IVRclbWpKnH1OdiXB+GwF5
X-Gm-Gg: AYBFou1A9xvSIo1tx8lInGlIYhtjvY3uYqkzKc1gnlsC2m97ebxFZGrjvmPH6qVxj88
	HIMNWPirxjnAoOIWMspoA2Cy91wWpaWjoWDYrBf+WNCZdT0S+wwHhHSvjlOmls78h9tQLVj7sa+
	SZvzhnoKnaZqiG5DPiNJAE2B26fTRrGCGVP3MfM6nuUJieys10s+wkIHeRSGEXp97U/FNznfEWR
	w+grTBVj88rSUHAu7WnyN+3st1ZU1afZF9PsIviy2KZWrIIuy0uUTT3ywdNQWvrz96yGnnOM51p
	8uZh0x37abwvLW8YtrsNTUzrS4K05qh+dbfj6A44RKxygoIVsK8naA9HOZiXsXv4eI/+jIp/3jm
	ukMfgwGjOqb8O9BEVwLOgbXgSibPRg3rgtuP2+p/U7bfHBgLL1b8bZ5d3sw4r9EezWp190JQPCD
	X2GGbfste+SxbydJ3OnamBZF4tl1OLTUYNboWKOpzinpo8mlg0jZBPXDsYDxSCm23/fwobIZgRZ
	E4=
X-Received: by 2002:a17:903:b4b:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2e2e49179ebmr3989585ad.6.1790748219186;
        Tue, 29 Sep 2026 23:03:39 -0700 (PDT)
Received: from omarchy ([2404:7a81:bb40:2400:e077:4928:9847:63b3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5b89c89sm1509225ad.15.2026.09.29.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:03:38 -0700 (PDT)
From: Ren Tamura <ren.tamura.oss@gmail.com>
To: tj@kernel.org
Cc: hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: cgroup: preserve command arguments in with_stress.sh
Date: Wed, 30 Sep 2026 15:03:34 +0900
Message-ID: <179074810121.139422.1170111592692928081@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

with_stress.sh invokes the requested command through unquoted $*. This
subjects the arguments to word splitting and pathname expansion:
arguments containing whitespace are split, empty arguments disappear,
and literal wildcard characters can expand to filenames.

Invoke the command through "$@" so that the command name and each
argument are passed as supplied by the caller.

Fixes: 1a99fcc035fb ("selftests: cgroup: Run test_core under interfering stress")
Assisted-by: LLM
Signed-off-by: Ren Tamura <ren.tamura.oss@gmail.com>
---
Validation (2026-09-24, mainline 62f4c998b297): ran both versions of the
actual wrapper under Bash on Linux with a fixture mount listing and no
stress workers. The argument boundaries, empty argument and literal
wildcard are preserved after the change:

    Input:  ["two words", "", "*.txt"]
    Before: ["two", "words", "match.txt"]
    After:  ["two words", "", "*.txt"]

Ordinary arguments and the child command's nonzero exit status are
unchanged.

LLM assistance: finding small cgroup fixes, drafting code and commit
messages, and preparing validation.

 tools/testing/selftests/cgroup/with_stress.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/with_stress.sh b/tools/testing/selftests/cgroup/with_stress.sh
index e28c35008f5b7a0f66654b10d8fccf4678120f6e..a95fb387464460ba24775a3e947a91875b743bc9 100755
--- a/tools/testing/selftests/cgroup/with_stress.sh
+++ b/tools/testing/selftests/cgroup/with_stress.sh
@@ -87,7 +87,7 @@ time=0
 start=$(date +%s)
 
 while [ $time -lt $duration ] ; do
-	$*
+	"$@"
 	rc=$?
 	[ $rc -eq 0 ] || break
 	time=$(($(date +%s) - $start))

base-commit: 551c722f40809618230001baccf219193e22fc5a
