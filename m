Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798228;
	b=PBlgbKXn0VPxnN7lxOzg0uODLZu+ndO53Y6SG3zbRlTWYnowaGkEsHeBN8Y+/v9SNXwV
	 lwhx6UC7FstwMLqkwmH2RohJZLRJVQ0bxQR2eF0JEDjrE5jybBUyTMUpIsID4wQJgy1xe
	 8IeGvJZbhQu54MGg/PrCmxB0jZR7EhMOulEWdsoe5TnMEwpj7pVbE7nb5jcNtAo+Z/hYS
	 uTnxrXaGhrQi7soO4r2mRLKaT2HfNg5TYBT3yQEdF3PQc6fcZbIYgF8E+6QhY5gPMJEOu
	 GlVPRdmjCOsLJW3gayHZ5wJ51l2/evbNuUc68zWn59LGtnSB+e9qKDFVG5x1SC3kIew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
	b=MZlkT4RLtlp+2pjp0tNQhPQxl3oY9rAqRxqkN644wuddraHhsIWVAT1PzYWBfdPe4NOE
	 yqT0iSROuQYM0qCVNVCvxB4MHI51CS9e6o+fTCsZ0ArOWtVZ2CatsjsxYKD9FNM5pJ0cv
	 Dyfs05aG4EFZ2Mz1xffO/yUV1hKue7LkobqrDQOUEmeK1TByo+HxDcf5W/XUC6t3Zw6F1
	 fqLkUbq2sPuBm4GsQFI3glWbyG+VVRerPr3c3KIhTQasatgeK1VVMintiT9wfeKLBv0yo
	 ROQ1HGuzPOamQn1Jlys7+ZhPNZcrDti6XGNJCAzHgolzwIOTRF0y3667t32AVJxdIYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbuhLi0k;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384BA606A88C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 384BA606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbuhLi0k
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3861725eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798225; x=1795403025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
        b=cbuhLi0k4gPQunm0cCmyXkobLQ+2PbqWxQNlMMwNnijYec+2l1ABQqA7z+WCEKmsxO
         zvKYa//6SGPJMW8Gnle952xsq2krkWRMJp+Lf94BVv09Wr2ZG3wZvzeZX5xTesLlFtO5
         1xGajNIVDjGJ42VXgqvefUaZiDClnCWMj8Ld4jC9YVh5maMEBZ+b+9NTq9CY7l1Lr7GJ
         6T3tDDaw1rwFNGcEI42z/f8r0Hhd/jL7/3giFsMcA3S/zb/eETdElF5AopnnxICyqLrb
         pQtyeMQZEpgYCLeStJFwIjdUkthkrXIofhMLqbPwmxrcvO3YAl8aA4tfWhzgLByVMjEA
         zRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798225; x=1795403025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
        b=LWZCUB0XqBCLo6sCR51spEFcyoRT8PU+rbSPoW35JB18/NNXIw+47Bt4HbJy/m2HJd
         SZENhSLTLTRwDg3/FNL5k7MI2+3V6/8vOsiKTj2jgCbgLtkRGZNzkpjzaELKyd1rpH8q
         4O/Uk4kptcPBxwUREFtGkqhH8buHcPvxVZs5Iu1jDLslDi6IUixa44l1qL0jGNqDxb9s
         m6tLXdDpC9j3PZSSuKR+IXuM6EdMsbpIxjNQ6DIDG68EtDuEGDw8U/75t0pp4x+O/FeH
         stL/LOLEP7RHNrNFBpsqwJzWMfGzJxegHTpI4dXlSvsYqA/lS6PvfLdud8NnJMB8pYAO
         tMag==
X-Forwarded-Encrypted: i=1; AL+hErHnUjmqb6yAPBZhU2lUUi/7bFvujNqNwVffWtPuxMGgf2UceuVREQTuV0Ix8CJPaa3wsMCPy4Ti7mwyTZdqfLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TQPfa52RcgYF1e/cgRKslgkF4+URdAGasUnp0NoRCGhEbl+Oi
	eKV2RInDOBlxj/9MdckPkspfjAkG8OWHoPJO3My5CrO2JMJj4UoOhd4r
X-Gm-Gg: AYBFou2NZ/hG/fCsa9wZpmxh8N1Sb7wHT3KSygqt6D16vbQYrp4uiX5mmd0K4tnw3uP
	NCPBEK5e/jQVS3IE2DG2gpNBVI37IUNYNUU1CypKcpGixz8OgiWWQyTfdBd/eBYVA2dcig5Mrar
	CZT4Zz+Mwcy01H6QDsPfuoRrMSA9mBcA/8F7OemV94QzwTH7okllOseyBKO4VNzspDM/YdjM0/b
	MvNRizZoqdUuGrdWDWjiwBjt4VJLOZAP6EexzE+p95WjeBVRyCM+Sb3QIqO/QUqJqjj+99qG8w0
	aMWkaZM4wDeMIWJKyuQ0wCH9aik3EYKTAaf5B/Q6yv1yKpXGXCb5pqAssGLzkzsQvhNeWmoNKwT
	X3nHZEYr9jAwEO0vd0+JWPx4az8IF5mn0nKGxKvSh05SQ/uFLO+3FOgfHwZzUVdaJBhgiUq1Old
	1m4SouEU6DBQcP5RTZAs7hVftYgqpa/AF6pn+NfRDT+AYjBB6vgIW9A7Y0k8UwOds0Y2kob81hy
	GfsNcfRnup5UyOXMknP4j0QwISrqLdMZ9pkOuuJwMn2StKuanuDg6GN2zck7n/sMl6DSiiOAJS3
	Fls/f1PoJdJC1pfGX9YvOpp72Keu/3DKAbpV85OKpVintiU5Dap35ncCGOr3iqwL/0IMDCJvDg0
	Sk9ds1Ea+qVTH7haEvDycRoz8vI1X12j/GberMnlR
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr10269605eec.11.1794798225248;
        Sun, 15 Nov 2026 19:03:45 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/4] ALSA: seq: ump: Fix Note On/Off and key pressure conversion
Date: Mon, 16 Nov 2026 12:03:33 +0900
Message-ID: <20261116030338.422671-1-sammiee5311@gmail.com>
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

Hello Takashi,

While extending seq-ump-test, I found three conversion bugs in
seq_ump_convert.c. In each case the UMP core or the other sequencer
path already does the right thing, and the fix follows it.

Patches 1-3 are the fixes. They also apply to for-linus. Patch 4 adds
the tests on top of seq-ump-test.c in for-next.

Without patches 1-3, the new tests midi1_key_pressure,
ump_midi1_to_midi2_note and ump_midi2_to_midi1_note fail and the other
25 pass. With them, all 28 pass.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under
qemu, on sound/for-next.

Best regards,
HyeongJun An

HyeongJun An (4):
  ALSA: seq: ump: Don't turn a zero key pressure into a Note Off
  ALSA: seq: ump: Convert a zero-velocity Note On to Note Off for MIDI
    2.0
  ALSA: seq: ump: Keep a soft MIDI 2.0 Note On from becoming a Note Off
  selftests/alsa: Test the sequencer UMP Note On/Off conversion

 sound/core/seq/seq_ump_convert.c            |  10 +-
 tools/testing/selftests/alsa/seq-ump-test.c | 187 +++++++++++++++++++-
 2 files changed, 188 insertions(+), 9 deletions(-)

-- 
2.43.0

