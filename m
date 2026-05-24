Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627353B83FB
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 23:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779666647; cv=none; b=snCNxkTp2IIZ0BP/w9TvucQIRBMBBGuVTFwcGPov36tcaIdfwxBvty7x4cbElU6gN7Pz4pCSIJlKyzeOrYLNa2SjIdlKB2iIo/G4jWHWx05N6SG1DwFd7NVg8c9AUgKnwE0C87A3D2jZwc5NjZVu43rkV7CHcTVnjvQZDQ1oBT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779666647; c=relaxed/simple;
	bh=lrUQ+ASPU3xAum/aWZ6YpYQB/mezdh2Eah+p4RDAlFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXu8o1WlmFJ0YUT5KKN9eSOtTMHrmDnWF6mN8RGwbDUhvaqsx9tt3KOyI32FrGwjBSaJeFH1oIdZTex8bDnIi0a9z8/ofwHHbmGmMfxegXqvVH6h8tjlvqQA+k/X+Aic+eV0NrhxI67B8BYV9J+l9X01vvlmtPdVXFJxX/Yqcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Cp+7TWTU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Cp+7TWTU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44509921fbcso5730260f8f.3
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 16:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779666645; x=1780271445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIsAnhC13Ci6OZvSY3IyfdrGYvDfHjgHhajtnryGtOQ=;
        b=Cp+7TWTUPHOVA9zL2NzFZxmvJGDbs6LdKd9ZUNWNJaDjlkJ2/CjmhMgZa0v+jNBIBc
         PQ8XJL4ZYcmqy2Oy18Vqi5mzVml+ZrIcD2Zg2zR+SftFu5FWSKti4n0OvzPAqXXjOjf3
         hScbm/WMigMJStPaZV2exCrqTq7c1liOkKAoJVWzko8lboPXVSCvChpmNXqZvvwPNJNO
         u+kkEI88i07L79j/XK3kJ42F0HJH64MwU6nu8HxEnrF1N14hQuNnbUlEOvYF45WQCdjH
         OrFsMRt5wNHcb0MpRRd2EgKZzLTWpEzdA0hS/AzLyjT6Avco0XSVzJh+PyDtFAkd+JCT
         wN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779666645; x=1780271445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WIsAnhC13Ci6OZvSY3IyfdrGYvDfHjgHhajtnryGtOQ=;
        b=DrxkK9orst3J0qGCpBP38ovAfzGRMGUzFmb9/0Nx4WSF9f+7pjWI1PoZVdLGoSizFb
         mVIubXQ0TXphZaF9IOdWdSZQ4mblQ2eOJDhx/VRMG+odFX5v2bE9kh6MHaCAE7Chgbp/
         KtEIMZWzh6U6ce0PmaIbzkoCdrUfy/1gzVNamQNCw+MdwXY2Do5Q9dze0p2Ha23goekt
         dlAwaMx13pJ2Ize674RlB6cuG83Hq9YtZTQohscOT++ptnnH1bohTa8MYjDBf/7j/l+B
         bJnwVWFMI2ONJXgKrDCwdx4d3UqD/WHh3XgDcEOse2iEAVfyCUfRCN6HENAa0hKIGU68
         qjvw==
X-Forwarded-Encrypted: i=1; AFNElJ9baVqvZqRiiXO5o7DHhOaeZCuA4CsnJQGoqAwSJdYPOY4iTBVH1CvxfxR+mqN22NbLkcxorWyDWDMIXRHCx2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLHIPkbjbepSCJJZBdW3U3pIxslt+TdDsWW5qjp6Tgu0xFHgt
	9vLqilKtnlPa5xFxEe3/eeR2GzRSsM2aCFylhlmPJ1O5PAV1eJBqMULtMU09Jxd/Kgk=
X-Gm-Gg: Acq92OHESqIfRP6H2Oe01FHGlanPIzz5oIUwUBqyYc7yGW9J4692r/ykYFmL+Rm/uaX
	H7PjEAwfmJFeDwt5SZUy+Ed7VeO7lOe0V1Gx5w/c7Zt34AccPDqENv/f9130dTX4QwGpjArw5zX
	ezQHBeZNjmTqgn5WJbk589upQxc4cs7lbdcVV7tRALFBtiQetuixmpF3/YTputciUReGSnATQHy
	xg1NIIfsA3F+wwLFjpffXtMqw4grJfHFORYoGKSiGxsypP+vB6oxk2/9c/GVFUqj7QxpJLntmsE
	qftmTY59YnaW9+anVeb2fKoJzBbyQrXReHRvSjA3xikUUWdS7CK+IxWYluialnou0u9YIMMjJi5
	4noGK/EYctcG546ddN4QFrypKYDvyc2egxTLBoGmBpRTVRwwAjxZWSgYP/zlqhvqhJsLWA6I7mN
	bprtx3pTneCBVhmwiExMfBl90=
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45eb3673319mr21805862f8f.4.1779666644786;
        Sun, 24 May 2026 16:50:44 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9de2dsm21698074f8f.4.2026.05.24.16.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:50:44 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sun, 24 May 2026 20:50:30 -0300
Subject: [PATCH 1/4] selftests: livepatch: Introduce _remove_mod function
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-livepatch-unload-on-fail-v1-1-7465de7f741d@suse.com>
References: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
In-Reply-To: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779666636; l=1399;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=lrUQ+ASPU3xAum/aWZ6YpYQB/mezdh2Eah+p4RDAlFk=;
 b=EYzbJCAGfZmnkCH3w3VcEoq2r+ahV3xg5Tgv81iN5gabPMRVlxE6dwmHqn2nM86vBNPXlKCsg
 yhqpacu1krLC/hwUllBDrlnA5U17sV8RlabxL9iEDKvL+T74Q/qfkzI
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

This new function will be used in the next patch to remove loaded
modules when a testcase fails.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 2bc50271729c..3ec0b7962fc5 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -241,9 +241,10 @@ function load_failing_mod() {
 	log "$ret"
 }
 
-# unload_mod(modname) - unload a kernel module
+# _remove_mod(modname) - Internal function to remove a loaded module.
+#                        Use unload_mod() instead, which also updates TEST_MODS tracking.
 #	modname - module name to unload
-function unload_mod() {
+function _remove_mod() {
 	local mod="$1"
 
 	# Wait for module reference count to clear ...
@@ -261,6 +262,14 @@ function unload_mod() {
 		die "failed to unload module $mod (/sys/module)"
 }
 
+# unload_mod(modname) - unload a kernel module
+#	modname - module name to unload
+function unload_mod() {
+	local mod="$1"
+
+	_remove_mod "$mod"
+}
+
 # unload_lp(modname) - unload a kernel module with a livepatch
 #	modname - module name to unload
 function unload_lp() {

-- 
2.54.0

