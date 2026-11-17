Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901124;
	b=GA2CZW9tIQMaLugrrKgokA8vfDnMKIMq95oAFTI/XIsYWbrxIW07Dh6b0JFNTlc7GXym
	 ZWwxbhzvoYOQvxe2rSMAggDKrrIunlg6wVHSn/Wf3m8TXom+OjE1FXKn+bT7YXO/SYkal
	 Wkbg20PSnQAKI1YcUK3sxnSo4ja0Lkq49y5kDwLfdcqPncPdlWPiDdC0LRnf06pOcY2fN
	 hVikKvZIzBD2vf9aZa/mLDvhTgav81hN5FsPo8xyQ6rPocDVf8yB+8+AIreRwu6jlur57
	 FapzWyIKn9arXy0Au9seyjrtyAgOzE36oZvW7vBsVt1SQ81Z9HEuuza3eSuE/lV9R1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
	b=MUZQvAi4pM+Ra98Sb/EM8e378I8UdY0GG8RVzUwIux1vL1LnMJLPwSBg/fCkO5TnSxHZ
	 qcO+WJosjUDUqW9xxa2sn9h2tVzBHkNZM5mK+IjXoQYoVtRzH3jCp8SHKwp2ljEhilKj1
	 SnvwpmMO5P6y29bFeW8L+xK3nFex1ILdman0y4ZqqRKx01P8gUdXaM1fitxXIK74YQlwg
	 tBhpwlW06WBHxwADMefBzEQ1yBfo1QvjnXXYWzOh3oocZODlKNteuw+2DnC2e4evJdr3O
	 odALtybC5yAKi6BWA1+XV5vTpFTSP51Y7/Emoi8AzDMKh6o0Rl5L6F8dfRd+d4dilWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b="beuriP7/";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C11606A33B
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 07:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C11606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=beuriP7/
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso5474825c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 23:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794901123; x=1795505923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
        b=beuriP7/I8mJ5gicXCudomDAvGMJDJwTwMDx3uZWhBdM2pn1X6J7ROxeBuTe/xwYaL
         CrBKVCe4mZdEWyKMChtESwCNSxdqbsNDLRP4ly1XPAt41MFEap2KE24LON2Gn4iHYAV+
         4RgWb1iMmcsz9iNGpACz5DMGL1rDwkQAFWOgiHas27u+NVI8m+w/AdVyMpbfvRwPrOfh
         t1/QMXEDOrqyJiIbPv/nI+XUuq+qYF9tI/jB9tFbTo/Tc0T4o8TZ2atN1VPOCculLvfC
         hBtsSQcChalIAvn+BUGrlDFAqVPu0ICCp7DM/lGBVprbRYhVP/ytHK3IsbzkTc39LAa9
         lGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901123; x=1795505923;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
        b=oecmoylW86liprlXZ7FNivhwSwLXZAm+EpxPH/ztt6Zsb42LbrmI5dYx4sBZGyjGow
         QtecUra8SrSaMBZulM2DRkT8Yho/ytcS6fHfp3rJneAEdodHV6/kdXO/U+IAT+x5I+D2
         A3HL3cOWWHFz5/kXtelxWv0IyaBAV9tPsyyN9NFSlX10UFbsax3Nh0FLhlGMECq/N7wY
         nXD9plCC4Tryv6sd96Vb9Cwb28wWVVyh+PZ7CVMOZhnurW19j6wT/xFdrRTbYkLwQfAK
         aHmMi3JQCAcYaTveBIV2fRqPjFHtDGTu7rRJI4OHPfAeFO6V9iDnkMYD8jPt1N27pCBr
         lFvg==
X-Forwarded-Encrypted: i=1; AL+hErEraeANks/XurvrKdUHXmoqoLqQJ7SqLKJHZ02BvTmsphl6E9Am3cqB5kEg93+dBgZaACVIylGiFMHfbR4k9Yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NibZpXVVM/3sZLM30CY3h1CSnq/5HJuv09S0niXjFjPuk5sG3
	bD2RnJdRN5aJm5HHtzeU4RLdPJs1YnXz0eRL/Kpld0n1jDObqt9uvtifRvT0MPEIv/g=
X-Gm-Gg: AZFdTZdTaHp71p4MwOWF/l08Xg7ZQZSJbjLEDLlRRRp013JRvL9YsZKvUFcKcqKxf+f
	bdZ8+lIuJ/clcVwWo4i/k4wDLCYhfrkWN18c/Um78MeeqVqXKafeekcNCl+iqAaDXfoJnAbhcFO
	MLr9TZVeaQ9X8FVqQJB4Yj1OKdjkSAgktN7lCb+1R4gytZoyq+qWAzyAEOfiH8I7J/VJeQN5uWj
	Ihn/MVxASi6czKanGr76t+JccwLDhDBBVJMpp2SErHYUlyFWmYpa26uK6GQhJpaWSP6/NPcsr5S
	0hSSQb0qb0JrsOhMDJCGPRUo16yaVCED/0p4QRN49qiTvcxb5lT6a4MI91yMTBlYvzzwcmNr7ui
	bF8tnP9UBZ30lBy+rbOf6TQFdTqTYmTz3uGRrehpF4KwjmxBwsS6OMUYnN4KI1mpM6Gt3HC78rK
	AadCrnpsOKThkjB8y0l1809fc2MLKsKqpA36FT78Sy4gJF5wIbda7iKJ1fwJecnVZ0co7Y5mkpx
	3nDyvxEJqZmrug1hxfSsodK1eVpVEJ31vHsjR8xlWEGripANWWkaods495HPkrfeqX0IdqovKc9
	hb59zoig9n3g/MRYKutfJksrvoVphMqFi5pSWKGDOXgdHQ==
X-Received: by 2002:a05:693c:8084:b0:378:1191:43ca with SMTP id 5a478bee46e88-37966e3b292mr13877536eec.18.1794901122726;
        Mon, 16 Nov 2026 23:38:42 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm5190967eec.17.2026.11.16.23.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:38:42 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH 0/2] riscv: Add support for vector misaligned load/store
Date: Mon, 16 Nov 2026 23:38:36 -0800
Message-Id: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwE/GoC/yXMQQ6CMBBA0auQWTtJiwjoVYiLUgYcg4XMQENCu
 DtVl2/x/w5KwqTwyHYQiqw8hQR7ycC/XBgIuUuG3OSlteaOwuojRvLLJPhhdSMPgTq8FVV17Wv
 jXdlCqmehnrffuXn+rWv7Tt13B8dxAvHaodh7AAAA
X-Change-ID: 20261109-riscv-vector-misaligned-54773f80ca6b
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>, 
 Yeting Kuo <yeting.kuo@sifive.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901121; l=1475;
 i=nylon.chen@sifive.com; s=20260310; h=from:subject:message-id;
 bh=tmkoHjHMDPa3fXfBx0Bpn94ZmUkTCA76BxDrgEkQkxk=;
 b=SiEKMftKaKj2WXk40u2hgHdrIuZP1id9WexL6FBiWpYCzwKZ7E9P508IlsiIrGB8ZZ4YTwaay
 QYqbd9QQSghDsu1t++ht8dkkuaGOQ6a8UGxl8a31LHjf9RJ+2LrcOT+
X-Developer-Key: i=nylon.chen@sifive.com; a=ed25519;
 pk=+xtFLLbXfGd50d5UhR9oBzLTh+JLft7T60t3u7YMZPI=

This series adds emulation support for misaligned RISC-V vector
load/store instructions, which may currently fault/trap without being
handled on hardware that does not provide misaligned vector memory
access support.

Patch 1 implements the trap handler, with emulators for vector
load/store covering unit-stride, strided, indexed (ordered and
unordered), segment, whole-register, and fault-only-first forms, for
both user and kernel mode traps.

Patch 2 adds a kselftest exercising these code paths across the
various vector instruction forms and element widths.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
Nylon Chen (2):
      riscv: traps: Add support for vector misalignment handler
      selftests/riscv: Add vector misaligned load/store tests

 arch/riscv/include/asm/vector.h                    |   4 +
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/traps_misaligned.c               |  39 +-
 arch/riscv/kernel/traps_v_misaligned.c             | 902 +++++++++++++++++++++
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/v_misaligned.c  | 169 ++++
 .../testing/selftests/riscv/vector/v_misaligned.h  | 530 ++++++++++++
 7 files changed, 1647 insertions(+), 3 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261109-riscv-vector-misaligned-54773f80ca6b

Best regards,
--  
Nylon Chen <nylon.chen@sifive.com>

