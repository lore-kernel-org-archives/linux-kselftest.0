Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285382;
	b=CcWt2inv/O2g7RKcZtpgc6JKY6zJX9j1MLC/y+Ib41wQKP5n71PFh84QSym54xDA0Bzi
	 vybHm3AA4TLDmXIrqQUG1+OLwNVeXAHSX5hS0bTXSBcsWT27c1JG0j+mwPtFT5jHRHoyI
	 Oui2BQX0TNTkwT60S3seggeUsMr5pioGgrGjGsfyj3Lf3M2NIJJoyM/Wi1OqygDEld70o
	 GJuEy91YAhMufL/+fKJTcI/hcx+RB8sS92+us+50yUYfsIoAs3tXXG9eL/4x0oJC6c9KL
	 d9WelX6fsq9uYa0bf/1PLEcL66sOH4TBr1zBDJWxIM84XrMaVABiyB0W6BpcY9bepmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
	b=eqRLtzgFygWBw12gHzfw68TP0acuRvMqxn6qVvlqCGDABODTsAV7BQHjKUwyNE9B44St
	 bv+5YXzlRHceOgUeXY11I9cDN4e+1sJzZEzimMhDdKQtCwzMoVqHYyk3hnJEzlSaLHvjt
	 Uu5zU0nxEKuhWKa+HFEyL5N82Y1bZyMNjyNg2n2IoGyAEUp1PR9ZgZXku9WrzRSQYi99g
	 TfFI5DYk8+5PJtVwJvM3OOugHv9gs/uMoO4KrYmczgxjdRsSoGMiqnKHH1cVs1/N6kxrr
	 9wiePR12FmNHzU/uoeqT3OqNGgxuJhVvHOjJr09f63YEl0D4H1c9cKw77sXZe6soPLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+uj6aRa;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68822606A32C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 18:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68822606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+uj6aRa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb8ecdcbb8so1082195e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285381; x=1795890181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
        b=d+uj6aRa0JypX9ox6qZscWxSUxC7fqg0E+T3t+0FHue6GwYr0GnyLPk0milV6Qx2sG
         gZ0Yk8Q/1UC38PopKspEizuRHpxviyq0By6uWAwW008Tap/ZGuTO/Q4J55OXrLmBjNpZ
         37Ba8lvXdMc0XdwkvP0A2GIIII5oZlzqGOigeYK6wRmJbqVTd0MvYqNS5MdV361f9vQ5
         kc1Kyj31ddNQ4eUf3KbDLmmzUUkIt3dw1D2kCS+sSK05KrXgz3CvI/1dA73mt2KmcRZN
         J9mW5kvXkzgQ4i02o9lspKbFcjuns+2Cc/CI0EFUTn6e30E3RlWqrhdczIjKvql5KEmW
         mTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285381; x=1795890181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
        b=ZUr4VQg18vfilXMVSgcY8934f/KB/4oOkx1r3qzFFccycbOfGukMZ0gytBMDpIBDU1
         dUEkBXP7ReGEMFkMixp2z8TfxeEAyzwz/x49jsr53mcIZTZTtmaLt4TEWTUiKfDdSgZ8
         jk/z5uEth3+3l9BZIyiD+9jMzYiglCMHAzU4x2gRdLaDgw+nZBKbHa2DTPPLPRqTlpOO
         S+tImlgOXpBC6k6snTCzY2MSnFXplxStP7eKy6kLLsVGtU8kiL9pCLKJvamL9vIDkm0k
         crvngRf3BHbosc3Z1ZihW0M62qmcz4l2vFBF8Ag6F0e9sD6K1nlF1S9cT/y4WypysYDm
         XQRw==
X-Forwarded-Encrypted: i=1; AL+hErGAV5QQGVlgpTGVtpwwYK7BoMlH1TGWqsePp/7X+bFs4W/vtv0tB/q24mUmd1qFSdAlEV65I02tErOLHE5gKyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++JnO5vuE4wqhs5Xc9CpTf1Z5u45L8gdaZLs356wf9awP+eM6h
	pTwE1NLquG5XdORb7KCLZEq9lGI3Hw+56n18gfKQEYoG9Uh3wpsL+1ul
X-Gm-Gg: AZFdTZcx3aHmFvgZ/rBZSk1VCQHKcYDq/cnAlnd8hkIO++Zitithetfu9+7taYt7j/b
	idHc4JH7rWZ25evVpjdvXfPXHSoHoqwQ7uZ36asL1bIhrnFBQBkkELpxlfmZz1No9fVbYXDuZHW
	S6NXbb822kfATG8ZwFMVECFoSQBIm3WNglLNaA9qUgbWL8lOEycGw75XgUBkLmz9pWQFmm/OjTx
	nvyjrgXfX7jIq44XK92Ug6xCu5apHh318B1fHd1rHZO4BloJdH6KwTSv0DdSLbj90zEuGGf1ZVt
	VQ0ULRFsLMqRnvZXkJ2f/XPKDcZhsBQ+yiuTRK+DisJoWcnfG6dvkmf+qH2zJh1hS8A5H0UD+2l
	ubZls4C0ojlwwer/RtnWiQTFpgLePGv9xNLu1id/1gwMSsSgBaSSyPiaRio942QUuqRQZ+21+IA
	O545CUdRBev/h3hQeifw7Uv22DDegIv4c1hE8g37g++Zy/xv06nxW2nskGXiLtKyVekj9T9m8NU
	oUOTKXrLU3YfrtYAXroeIrMfZ8eXfoxFirxkKXoFDI8s2dIIH0qmWu2Qx+fR5sqW+QDXSKFbn4U
	Rx4EveOG6uC6W4T4kHis30YOOK+BQi7PhK28OfRxhZ5f/S6L33B0OP0rerVPKFYnuy03KA==
X-Received: by 2002:a5d:5f88:0:b0:4a3:45b4:f0cc with SMTP id ffacd0b85a97d-4abb253e271mr13430436f8f.3.1795285380632;
        Sat, 21 Nov 2026 10:23:00 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:23:00 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v5 0/3] selftests: net: veth: propagate check failures to exit status
Date: Sat, 21 Nov 2026 19:22:14 +0100
Message-ID: <20261121182217.4609-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once earlier patches propagated test failures.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v5:
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1.
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (3):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

