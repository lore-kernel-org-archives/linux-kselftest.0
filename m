Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556440;
	b=Nm89MDcQQrztpF1YQ+Z5f9+Ldpeg/TckR8HLPOh+ffAKDa8DLqRV0WPsFP44c1EEdZgh
	 WmIXWs5Sk07SYKjotV5Ci8UB8AkyElW7KsbyzEZFafxywGHnf0dx+HgR5pXfPV4jPkBN4
	 hN0PTJ7IIYFLUlSFlHDC5uEmj5kiiT7qI+dqAK06xiH5su+HCHY2JswPg3LjtYGzgMLpl
	 v0k/f07egrTYJcwIenIyvkIo3Q8p6sXV63z0yhV5WtsdpcKsN9ZoMtPUU5YvI+bUrB0rz
	 WnJjYGGfFbuY4VOTYXJk6ui2sePCQPlb7+AsTJsFjtwxpy71WYJJ0AenPL62mXhyJVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
	b=rnVZsgF60TaKrrThduw9blNrNWnYq7rFG3/iS0tEZrCJC1rDThawkl31ymPRBLJxWTnG
	 LS9ZRcGxgkpjr6IlH6+A7m7V2+2ZAkTjlR/dWAcElE2HR+6lblVJI1cOmHBtBL59h58Ir
	 MwQF21CcspEGH16et7yD02MrSTxZKp9AsocGwL6Ql3zXdrtSj+Jdw3Gqx3zigc3pFr8V4
	 rPpY4MWufTAhjwVwdgaFVbhTI+Ym2q61fr4n7biImAFINt+hCT3n+ZuhFgXrDP9xavqqZ
	 z12SePHggz+dWMTF+T4SE2FT1BuWh1x3k8v9s/WbA4znQKjZQlMYpVFfd8U3u36CO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi8EGLvw;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E9606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi8EGLvw
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so5460635e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556438; x=1796161238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
        b=Mi8EGLvwatR57ciZPnajH53XIycar73TLMvtuIgZrwr8o59gtggQQ12mCJ91lZsq8u
         hmGmFwVYMPA83aVk24Xo4veC+N8ONh3aWgqYZaZoz4Rhy9FAgEDUPPVsJmp8wl4GM3cL
         dZYyW2R8epRb2L0WJ3JORZ52Taa2NIbTM1aG9RIXISLhYWq6D6F+2jkiqBUz0rVeL33V
         gjPJBdJRd4sdJZwTjxdQxtzokdIxRo6OkKAQzVKfINPVLgmCW9YJ5dVdo9qV+ccr+sB9
         rAbO/DsbVfBFUSsTo1+IRd9DBn5E4y82XPqJYb6REWyfmJ46mh0zyH6v6LgS5tVwjcie
         fvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556438; x=1796161238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
        b=XMQUDQZIFLS8LbL0wkvRfbLHNhbsbZ4fmV/caJaGMUcUEJsr2t8QDikuGWU4JiZ1QW
         g/pZdgBDtDqTVlncokkKjzjE6+zY5cU8UTYa0kP5JIf+5sAq7GW/TTpFZrCoiY5kDWUz
         OeeClMAKqUvwgLisbpNhjtWSGW4z1OfvmxgpE3nC8x5qYFOZG/M7sFHuezd/QbDsu2vd
         7ICdLDinjIIYd8zqw09ahoDSVhEQpiLlwPejbybTIx8lt5nvi8cbSn0OPU2gFLbE79W9
         yo4wtZ1SEIMsXs00PqV9DXRzHJp/vD/jMQsg9W1IK6YjpuDnc6Uy8FMhgGmxS+DAr0/+
         Ojfg==
X-Forwarded-Encrypted: i=1; AL+hErHJnSfA5kPapaIIV8GGifKc0oCGyT44eNfBS92GdYWmab7ldJpdjcRYXaTfrg8ozRtI1cK+hLO4yFDIIGOHG3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GJVFZ5iMLYrxT6VoxkMLyqMQfChwa59ZlPOPnUSK6Irk4SUij
	duqZsUY8vTgWP/HF5AH3qzYoZCcBR1jbkGBgmmxFXCdt/IKbYxL6jn9l
X-Gm-Gg: AZFdTZeQo1jyRKtWq1UaKAFro5WBkK6lK2DLyV2mUdZ12hsL3eb0NpdmhpHWWDjQisV
	vUZTX1okK92Bmr85G8qc8mjs3CksenmQwGhK/lm/pAgHpvakL1RtgSPiM4TsGJLMbzS18wMB8Za
	jeTcgRaE+jjEvmzQE6GtdK8zUQ5i2XfrtUCAeymKN4jfO+bWUJkCRSwVYTIwnl2ifLgJjfgbeAA
	A2wHegdwREM+ag3qgNVhyjDS7GOXv4PrzHSQmLy8WUQ1UVdQQDMzHyLbva+8r5SfFcIlKZ9SpRO
	vZJknpUh0pvCsX+9HJMYWRezHA+tFTwFfwSQurPztjwEKRnDCaKP4zn6bHc8kCj9muMkqXw3bvX
	bAVpztnHJ6mITHLWaEk3lvjx712RIQKH4av0MjlxmwUxnHO5At0wXz0aV8vbXyDc4tBp87yVdsA
	EFcWFvWChK7JAaTNszWltcFLAn/dQkgdtKub1oVQ0xReGbrUv/G0GFRw66tMWWPs/PqpcuhfAV2
	TnJtHm87Xn33XhBj9BtZWx4WGB4JSd8+YqJeGep1UlRR/ZhNJueCE27Kc2ru3VTE6v2sJ6PrjeJ
	lbyeZtGNCP+eh6tZVWXIYT4mMjbG4Ko4REBKL4CFG7CxbeVfhOEZ3PLWRTyJVfTULky6GIqNgUT
	CBcTDtM+RdzY40Q==
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr239453505e9.1.1795556438029;
        Tue, 24 Nov 2026 13:40:38 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:37 -0800 (PST)
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
Subject: [PATCH net-next v7 0/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:40:23 +0100
Message-ID: <20261124214025.11603-1-emmaonana18@gmail.com>
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
kernel once the propagation patch makes failures honest.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v7:
  - Fix [1/2] subject numbering, lost in v6's send
v6: https://lore.kernel.org/all/20261124211645.5751-1-emmaonana18@gmail.com/
  - Squash the two propagation patches into one  and add
    Tianyi's tags.
v5: https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/
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
  - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate check failures to exit status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0
