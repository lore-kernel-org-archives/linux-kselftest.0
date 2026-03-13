Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAD43D5255
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435560; cv=none; b=p2d6JAdDxBRnmJ2qOzvhHcmbmmc7OOeZXTQG/kt3IinUmQaEs2uRgzeySGuFEKDnT1A1YV4T1gUCF9MMxe9AVfyl77i5xIChtAtjIVnjmS3zeEHPK3+v+Zp9+WJWQbee9FNpXp7tUyQ4qHOBitSmKUM9tRN6MJQAPF6Vejeaprs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435560; c=relaxed/simple;
	bh=csQBdTnyzr0JSm7zjXTuth96BuITEbEVBybFpbpIwyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqKCWuj+l1mdvV9Ebx7iZKsUB6cI4cy2z7yAp6nsRj5iSi1l4Vqz14ZqitQX5W64iy3UHHi9SmImhEOAlbUxVdAntNpcAjw7xMaXDAsJeFNLKkGAEVoOU2EJlYCFCfVsJ3VuenC+9n1Aw55GLKqZyrhzlVNoLNYK7Ai1E0DqJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D3Uwbq4C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D3Uwbq4C"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so30093985e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435556; x=1774040356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dCEg0dd6B9Tjl1kgEu3NhdDbbVSDX6h4iOv2b5vp0o=;
        b=D3Uwbq4CEtNyw1GcsJQB8sOGJX5Fa4kmaGYo+SHnQeb4vdlB7BV+VhAunyHWi7tNce
         qGpgY1sX67tu1JoeRP5NPeTBhX3JjzsJQLo9ehbGEnsBPI3rKdJsQKqOHdvxHVrbH2rU
         mYQJ2o817IsuNWxZIeVpevWdOS/BSOaGVd/yTX5nwurbhLIIt7hdWolBDfuoIXuPxSW0
         lz3Gn6UWzhNQoHJPKYS1Vw802Wb8u3QKqIFQIDdkCcWvpRVbbBq1DiUCLzrWnSokyHv7
         V9kibxIjF9XJzb84MvGw/zR2fDjUF+bUZ0QX4zRqrVhfUAoApGwbreaALFrGp+foEMX0
         Jrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435556; x=1774040356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dCEg0dd6B9Tjl1kgEu3NhdDbbVSDX6h4iOv2b5vp0o=;
        b=Udn/1POxQIVlSxzi00YgdiOJEBPLDUpJzusFWzXhZU1BbKY7zlyShlXM6uHRtts7we
         PBG+HkbPh5PwS5M+xoBYaD5oIV6EV7iKnBoaJjpeGnYwLi1DQZUuMBUZSWSLMcjIuSws
         U4ZYO9ltx5GToBl0fyOCyw+s1ku6E6e+HmEj/msSrULk63jF5rkD4vb+TxnTERXlY4He
         TXaex1w6HjfSyHcaIIuPOj67vSnY/LMbrngF4f3ZB+IjPvgzzJCsUkCfyEw/RYUKG2CB
         mimzBhhFpaUO3qYyjXcD8ar5JLh7Kj4QTCAu6U+KW4JYwje2rq0sJr5kpfI+kXsCn0dc
         5iSw==
X-Forwarded-Encrypted: i=1; AJvYcCUTn734N9EIN2lYwvE8nqLERnlfK7cXFIA2QvXP6PmVcq72EekFb8FrZ+iKQblrns/S2W2+/ldo7aCZ0Mi6lhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7geFQtDJZe/5ircL9diwJtcGc+wUzXJZcYFk9bRLTiBMIbBJX
	2VD7DAjkAZkFuRtfZWUJD+Qqwdbq1+liT0iAVCC9bYATrFRSBBW2ZcpYYcWvwrK3IZt4ob8IRCA
	oo2G9JP0=
X-Gm-Gg: ATEYQzzT2P/+DqSXdU+vFROK9YUe9uhKHNGX/nZGH4prr8HBtCLGoxmu5yJGHVEQjeJ
	yVd3voxMQs1foFe3mJ0npK5XrreQ/86we3N9AE/fDx3q7e2DiFWR0mf21J2XFj2SaSTCLiSzgp5
	lcZwTg1f7aRWVqBi86dr2ZESW4jdC51VpkSUwi2SMn7UiAOYewtnADfFQN9Vdwlh7YVx6mfqSlm
	MXwePyCqllQFwbUAE8mo9U6PKNULQ8sPsrsYKTJhNKp5h5QgMKpUMV/ec7e6iXksa/Rhu8VGypU
	o7SNXN2CbGizhQE2mGUTvLdJ84w0A/aXCkFYedfDe9tRG9NthEhKN8PuwW0C4INRivNHYKCzqfk
	/5s/2fqwmrSVJyisqxbfECJ+/Ru6V+4xV67VgIcbrzKNKXOgJ15dJWzyZIug5LWerjSQfOVsuO9
	U7sJUqoF3Ve6YwXqoFQx3O
X-Received: by 2002:a05:600c:c0c3:20b0:485:5981:1411 with SMTP id 5b1f17b1804b1-4855981166bmr45853985e9.23.1773435556207;
        Fri, 13 Mar 2026 13:59:16 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:59:15 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 13 Mar 2026 17:58:39 -0300
Subject: [PATCH 8/8] selftests: livepatch: functions.sh: Extend check for
 taint flag kernel message
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lp-tests-old-fixes-v1-8-71ac6dfb3253@suse.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=1115;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=csQBdTnyzr0JSm7zjXTuth96BuITEbEVBybFpbpIwyk=;
 b=GZFkqsGQmRtJSxuKY0Pl1xY69C7WZjWhDrYyBHAZcepdSz5AAxV1bkP9VYtsNctvJ/lXx7vQA
 zFraRerPgyFCgu8ZkptriwDws9SBHSt1Pf6+hqhdMjA4CoGvDgEyv7+
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

On SLE kernels there is a warning when a livepatch is disabled:
  livepatch: attempt to disable live patch test_klp_livepatch, setting
  NO_SUPPORT taint flag

Extend lightly the detection of messages when a livepatch is disabled
to cover this case as well.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 781346d6e94e0..73a1d4e6acaeb 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -324,7 +324,7 @@ function check_result {
 	# - filter out dmesg timestamp prefixes
 	result=$(dmesg | awk -v last_dmesg="$LAST_DMESG" 'p; $0 == last_dmesg { p=1 }' | \
 		 grep -e 'livepatch:' -e 'test_klp' | \
-		 grep -v '\(tainting\|taints\) kernel' | \
+		 grep -v '\(tainting\|taints\|taint\) \(kernel\|flag\)' | \
 		 sed 's/^\[[ 0-9.]*\] //' | \
 		 sed 's/^\[[ ]*[CT][0-9]*\] //')
 

-- 
2.52.0

