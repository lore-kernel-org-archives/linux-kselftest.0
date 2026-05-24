Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328437BE64
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779666645; cv=none; b=Mpop4ha3Qw50hlrDQVIGKweZuj3EeycH3dZWCgAjYuUWXWONr1vLJ3U+E1OtN3pPE3GZGovYN9FJ7YXTZUx4ZZg2isf4fWaC4WBjjI85LE6siPe435Nvfd3R7loD8MfGUb8Dp41p3gWATpVC86GzfKMY1w09i7QuLq3g8eEa/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779666645; c=relaxed/simple;
	bh=+6S3KWYxjE1OVCE70/0Kx/ID8QCiK7g1o1wMXFKquBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=boIEvDHJQH4W0JON4DIFwHkxv48NGlpBN+t0EA7NCyWkB9r4TD1m5gTuwv7/ghjIQ5P9mYSu0f49GY+OpBoLTqsi1zirmGFUlWJaBgUKGrfKXyo2zOAuyBSgLS9Z/sLDibxe1H4c1/A2T/79D5YCvXDTm5zRN8VKlyS6A/TQE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MQWhS1j1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MQWhS1j1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so6901922f8f.1
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 16:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779666640; x=1780271440; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Du48bloKPi85NDz7Azm/z5kCCgy901q6Y6frP0MyLM=;
        b=MQWhS1j1Pq5bCEtp468lDty9P56YwJdLHVQmHjqUlL81stLBRyaIkpPE6IqHEYv675
         CXzrE1s5GX0ylyZoNWa9XZWz6wVyLjQWWQoKli0xIlH58i5jLuInuhQxxKt6umXyOgHz
         kx6aIoalItto2tCErIeoTbCa7gHNXROmmqqBk3gh6VPkuE5MIbhVzPlTh9vNv4PxTseJ
         gQkL2r8TTShELdFiK5dRihinvABO0sl2+LWIJsFnkglM5fGRncRzuq5+havY8ikHaag4
         wvaXGNbjoVKFrcJeSSeRKieMAbJ26bzm2benpfayAhVQS6iMkPEFMDH3/oqEatgccnzw
         PfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779666640; x=1780271440;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Du48bloKPi85NDz7Azm/z5kCCgy901q6Y6frP0MyLM=;
        b=RTuxwrsvFAybA0zyzHdlrRI74CzM8usITuEREP4IfkiMCSmA9weeXGoZ54nHlC5Ztm
         bDbqrns2AyRyk0vYMbaYV6E2k2dBMZQgAGrdg6Xo83MKABrzr39qLZnXTfHfC4q77mnB
         VCm/Hk+jW5XSm6NEKMTCOZ32cIcgapHCEeRR8Kdapc/VBxDlNVxefnCINafLuPud96fv
         AIT404IzodFTdWpVC7mmlpJrY8lchMRr6lw0VyGdfv58eYRLhg7wJT8P4niPaFKe/GEt
         w+G75N4176AOrHU3h0GJ4OPpFNNubldQEqZoGry+LuDchYfl8VDh8vSVjt1CH55ohsKk
         RxDA==
X-Forwarded-Encrypted: i=1; AFNElJ+GQ/9NyVGhaI4PcVMVQFDNIIHk1zMeENaJ/hLOo6AM7FwOtWSX5dRi/+SkWBPeKVlD3pwX0cndp/NN8B+rUt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/T7spGLDmcl6myx8zSvk4asb2sx0yE42iOqNCXlZ1conzGGlQ
	BQeInknWqBCfZmf6AN8r3FwcU1S2Px5TjhSskE1tib9tSe7WSK7qYpAXViy8/Nc0BWA=
X-Gm-Gg: Acq92OFzJy7zWLenao1oDAwnm4N/+Ls7A6IwvVs16tS61NeAoDP6xV4GsomXEBrYtaU
	bFgpZr0AozVBePoNx4JbxXFHcx8zlJRZBGalIZONf4eh0/laX2At6idgDFEhFi7lbG6rvmbZUOd
	pI7ko0mqccizcQsgmFy+bBSrtRU7Uk4Gym9HHgcN5jNP+jQqaQQ7o5fgfkp8By/ctrt+uags7Gf
	VFL4UgDNtWzR5cdIDUo3hpRyWpdJ8iB3Q7t0TkttTKavMS8HiTICdVAMCiILIcR61/kfhnFdDO8
	1sBAUt4C5pd5KNGnXNJjBlP8G6R47LpyDSbc5uljOqKogxlT6765cJDq2c9tz/vltP4evFxo8uw
	Iz7eFZb9m9CPMYgQBHYGlFUwFPp/LJAnbywq3fcde2dB6Mk9GVh1GI91kqmyBp/zBcQeF8QT7iZ
	jQJCLZZD7AKyRfA1GmsEQI7wQ=
X-Received: by 2002:a5d:5f4f:0:b0:43d:1bf6:30f7 with SMTP id ffacd0b85a97d-45eb36a1ef3mr21051631f8f.18.1779666640500;
        Sun, 24 May 2026 16:50:40 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9de2dsm21698074f8f.4.2026.05.24.16.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:50:40 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: [PATCH 0/4] selftests: livepatch: Support 4.12 kernels
Date: Sun, 24 May 2026 20:50:29 -0300
Message-Id: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWOE2oC/yXMQQ6DIBBA0auYWTsJtcLCqzQupjDWMQQMKGliv
 HvRLt/i/wMyJ+EMQ3NA4iJZYqh4tA3YmcKHUVw1dKozSiuDXgqvtNkZ9+AjOYwBJxKP2rinop5
 7bQlqviae5HuvX+PfeX8vbLfrB+f5AxlyUe98AAAA
X-Change-ID: 20260506-livepatch-unload-on-fail-56d30a4e45ca
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779666636; l=2415;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=+6S3KWYxjE1OVCE70/0Kx/ID8QCiK7g1o1wMXFKquBk=;
 b=dJrcKsyzQ2StJTfooGE/3C1VmZTXxX+T7CKLABL3pl0JNL/BtH/OwwPOOdxbVR+fOZ9FxYCUu
 rjcV5kjQpMYDuoZyABorIpBx4cASq2uHViMb7q5Qznw3gaLIcWRddsV
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

One issue that exists since the inception of the livepatch selftests is
the capability of recovering from a failed test: the tested livepatch
modules were kept loaded, interfering with the next tests. The first two
commits introduce a simple mechanism that tracks all loaded modules,
and if the test is aborted, the trap function will disable/unload
the remaining modules. With these changes the test
"livepatch interaction with kprobed function without post_handler" fails
on 4.12 kernels (lacking the feature to have a kprobe a livepatches
to be used alongside), but the loaded modules are unloaded, not
affecting the next tests.

The other patches adapt the test_klp_mod_target.c file to use
module_param_cb and kernel_param_ops structures to test livepatching
of functions in modules. This was done to allow the test to be compiled
on 4.12 kernels. Older kernels lacks proc_create_single function, and
to adapt the code for older versions would require ifdefs, which are
not desirable.

I tested these changes using the current upstream kernel and kernel
from SLE 12-SP5 (kernel 4.12). The test-kprobe.sh test fails on 4.12 due
to the missing capability of livepatch and kprobes to be used together.
The result is that now selftests is able to unload the modules loaded,
and continue with the next tests. For the livepatch target test, it works
the same for 4.12 and current upstream.

Please test and review!

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
Marcos Paulo de Souza (4):
      selftests: livepatch: Introduce _remove_mod function
      selftests: livepatch: Remove leftover modules when a testcase fails
      selftests: livepatch: Adapt mod_target module to pass on 4.12 kernels
      selftests: livepatch: Add information about minimum kernel support

 tools/testing/selftests/livepatch/README           |  3 ++
 tools/testing/selftests/livepatch/functions.sh     | 35 ++++++++++++++++++++--
 .../testing/selftests/livepatch/test-livepatch.sh  | 23 +++++++-------
 .../livepatch/test_modules/test_klp_mod_patch.c    | 11 ++++---
 .../livepatch/test_modules/test_klp_mod_target.c   | 22 +++++++-------
 5 files changed, 62 insertions(+), 32 deletions(-)
---
base-commit: 8f7168335cb2e438668c5d94eea76621c9a10edd
change-id: 20260506-livepatch-unload-on-fail-56d30a4e45ca

Best regards,
--  
Marcos Paulo de Souza <mpdesouza@suse.com>

