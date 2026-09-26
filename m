Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE03126B0
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384907; cv=none; b=SHjIcO2y7wLVm/e1dVNC+x2Z/mcNyhBOdsaPgqO15x1o+gmbHOwhsEmar6QBYxag9u19KBXAm8v5y9M1Z4w48R7+4/g5V0u71UqB9A/T8wk3nzuuYgNnFBITusrotcOi1sb5BL6NmRpfnQOZ3RtmM4xrkUBSlOeq30J9KjjbvVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384907; c=relaxed/simple;
	bh=ucIyPjHyEfDzcgtcZ5SY4InQloL65MTRwkEsaPC0xNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPeT1apoQkA/CMcRya+dCkB2ioY62AqjW+byvTpLb9dqDI1vPvfNp5IiGgfQlXXQJuJT92J/u7uwJTNGaM6jXo/fjO7NkGwTmfHB7cYU1IeV1dPT/bk1/PNZvWZuYxIpkFIJC17r1XuEAeB4VYhsnXFtOB4RG/DCEfz5ydnuW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwoSSEFX; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwoSSEFX"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso976482a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384906; x=1790989706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGJLJUYX098b2C/p5zUf0et0pH8c8hAZraf8w7dpmdQ=;
        b=VwoSSEFXd/gwvOhiJlMe0r5bq5ycT6wXyoeu5n3SaALPFfMIporDR7XjXBexsNMikd
         LGp+Ur9+9KRhf6LFkbvtb8aP5ok4nlntEN8kUmTLq2o0VynBDtHKPEOPapZqmoQ13IDl
         tr4nJUeS2mnbpVCzk76jtOf9AU5Zjd/6+RgLo4vWf80OxdBCMuNA4Kbv3a5lvmLhqa9R
         jA6BfgjZ/NWfIjT0cdPPcBeLCuTB7Fm+7VbHMw2p6IK6aBWue8lxMj7E9AvEkotyJrhc
         ddAbpBzSUpTLb3/GsCypHFOqo6jWlqDvl2jCYi8OrrdjWdLRv6NEiW7w9ZQWCCqxRUv4
         aY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384906; x=1790989706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGJLJUYX098b2C/p5zUf0et0pH8c8hAZraf8w7dpmdQ=;
        b=pP+pLAAUSQ+1v1LXOhWnGLZoh3Po6mTJW700F6RquGsIhHSfiDfg/QuArQofV2XTWj
         BpWU7SrDqTW/TvZBiN8Y/qrQLYnyxXC5sdaiIilaZur8vjYXvRyO/AUd8g8XXy9PF3VV
         eQcCN/dTwGcc+wgfIwnqkllMvJvxwbn+TSaQg+48xNb7f56WIxsvkigl3Kachuoem1TC
         O1fbx9HSEE399o2w2GCEkpAYpVZN616ZS2kuqQ1xmaqDoEYVDtJzh7v6+9p2lEcJLHHY
         J+ckF00BOzz+lOdzazlXHDm+8BBUfbnfGVXgyDJbppoEkB8Ggxye+iB3LDri80aAhAC9
         fKBA==
X-Forwarded-Encrypted: i=1; AKwUvBxAnE8DsGuWTRtv+4YnyQxNzqUssOecUJfbHWVWu8RdwOLLrUhXWHs/YXyFLZ0LI616DJokVvvN32+WosGT4nI=@vger.kernel.org
X-Gm-Message-State: AFuF++kVVoY5RVfT6aks67gnXakhC7JNeL5LyLa8slZZ6R0gqZARe3W8
	fpi+4i04XnB/W762vn1mrlizcLpFFicL818if3EI6aJ7FyKAFYRjxNIm
X-Gm-Gg: AYBFou1mpuxT+MONEA1peaH8KVtztdnHrrUSll3M5eWLw5Mal6QNE4r9/R6zJpTZuO4
	s8yDW0K1ILWabMNV0baPclgSAFSXeZEy1z/XYMjLRle9Rjs+rgScTWe0Hs99mV5QFz4Y0CaQhtV
	QfxQjBNOBeGYFpZSwOX2EQD2HiibXUBI8k50KMZy436EY4yVqgmZ6Fcq0b2rDkYZmhdr5lETmK3
	+Z11JRQNub/Yk7qqWlqLFOI5VkhJc0fr/iieRykx1Z2OsIMsAGqK6+wFgnt0zEaAOXfCUt8hMLb
	olN084zY+FIDuYSVtXyyGYPtIoj2rCH6JoE+kbxwfoZ3lpGck+S4IhbHM7JHWPsbHrF/8AfwPgu
	PvZinYZVLtL+QtDH12e6bsrjCigUruWVRtZdXPXgcOLLU108kBU2RszpjkfUpAp+/r74AzY1jEk
	RKsHfE+nIw31ty4BbOr+FsijZda9IQYnLklg4sHxCy669i5tzPyIh4MGcuJgLyVIW1qdspPXdXH
	NbXpkiWqYk6GN3y+lcKFQSnRStRk4ZRX57/HzX3FG+ljowwwdf0CLMWmV6rldYJhBypXa6n5Nxn
	Tl9PSltRyCK6dYy/FXj7YAIKGlkmfnGezPst1YGq557lnKlQBK72maGdE503cQ==
X-Received: by 2002:a17:90a:10cf:b0:3a0:b7b4:b649 with SMTP id 98e67ed59e1d1-3a0b7b4ba36mr2433638a91.52.1790384905575;
        Fri, 25 Sep 2026 18:08:25 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm13169486a91.3.2026.09.25.18.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:08:24 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 99D8516C9C96; Sat, 26 Sep 2026 10:08:23 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>
Subject: [PATCH v3 1/3] selftests: kselftest: avoid cd - in runner
Date: Sat, 26 Sep 2026 10:08:17 +0900
Message-ID: <20260926010819.604346-2-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926010819.604346-1-thehajime@gmail.com>
References: <20260926010819.604346-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kselftest runner currently uses `cd -` to restore its working
directory after running a test.

This is not supported by the minimal BusyBox hush shell used by some
NOMMU targets. Store the original directory explicitly and restore it
with a quoted path instead.

This also avoids printing the directory change performed by `cd -` and
handles paths containing whitespace correctly.

Cc: Shuah Khan <shuah@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Ricardo B. Marliere" <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-mm@kvack.org
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 tools/testing/selftests/kselftest/runner.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc55a0..8fc1018d6fec 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -130,6 +130,7 @@ run_one()
 				return $KSFT_FAIL
 			fi
 		fi
+		OLDDIR=$(pwd)
 		cd `dirname $TEST` > /dev/null
 		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
@@ -147,7 +148,7 @@ run_one()
 		*)
 			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
 		esac
-		cd - >/dev/null
+		cd "$OLDDIR" >/dev/null
 	fi
 
 	return $rc
-- 
2.43.0

