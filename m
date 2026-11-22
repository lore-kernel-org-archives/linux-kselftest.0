Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343784;
	b=YnHsdpukj5ouEk3eQnMaqIIKxmw70PoDa14WQdDSg8m0Ev6Mn5qfODXkJ+5RhQRd3mp0
	 O0t5lHX4voSXmj484fk4ihxbzROtC4fNx7OQvWozR2B6YK/0wsu4YSDRZJY8EGdinNDxg
	 zebZ/ov1XFPz/a3HkrAkxd3jXZqg/7RD1z0Bf5gqhGWbDI6sgtQh3UXqyEeHhUqdVSPoi
	 hMIX1WCRyZOrnRISjBZ18ftiLCls5JviacAVBhGQkOS2RxlwK9SnGCac3EUHsjz1hJeW1
	 hLswd3zDvkKjR4f0qIcc1XuzmSJI168VO0JKl1mGe7a2qjfXf6BHRdCjLUVoDvbNilA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NFO8ABB2++Lb4Qniw60fNu+n6Ox71u5p1UIy7s61ddc=;
	b=v7xIiyFUVeVPboISxPvBHMRePk8YukqsAMqRPjy+LIX72aaw6AnOaGrg/ucPdqdosroB
	 ao1JKIL+xxQvVa8/AMYgFKs+AAXdJ+WL8tMnL88muuF9usqdoZCm5EdcDIrfGBrDEEm2y
	 +ze218QKIezmLCPCKlsgXdvSU5LnFvQv/AblJ4Pe5XxFT9yD+4Ozw/F2cZGcZUge21GHN
	 AAgv0FdGrim0btkQNatgjqSpIp/UTw6WugZo20aGKu6Ha4xfkjU4CsmxACIOFtuVf+kwD
	 z2F99TTtNRsNrqxlCbbAPSU1Hk8/LhqxW5INRVldvSAn8cSWlsphVm09sMKvAUr+zvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bCcPs84Q;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558BB606A336
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 10:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558BB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bCcPs84Q
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5202781eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 02:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343782; x=1795948582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFO8ABB2++Lb4Qniw60fNu+n6Ox71u5p1UIy7s61ddc=;
        b=bCcPs84Q8MYdYT0X0Bg0dhFEe41xvC4BLYFYIgvjMg22VLdC9WSL47hQ+tfl47Cc/u
         OktulD8NotuMYcw4+w0akb+FEpn+QcdMWFtGMNyhRT6wjIdzK0tiwfGuC8QDjEStM3Bi
         5UBP7f5nMjSDbmNUVycWUpwL0dJYSwg1x8V4jXy4N34AXF2lXp5tzF9vt3lVOLb3yVRS
         17oKRQN040/K49pauZHoR1u1voRXfmnOmgSIbrNFbh7JTH4Zi7pUf0i+iq8PqYRxVHXk
         xe0j0LMUw4uEZBbuFnYm9BuDXtRe6sc705osle31d37Iab39b7mc0NU3921rMfrL5BKv
         VKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343782; x=1795948582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFO8ABB2++Lb4Qniw60fNu+n6Ox71u5p1UIy7s61ddc=;
        b=nmaOjcNiLv0Nnj7RUo16ELdzICfBLN6GwIWkDaHCVJpbfe26PI7gwwdAebhcNdxsiR
         EfDi3vH9oDkvL2pDDDCxjYhLWMd98wEwuxK6UMNxIB+YMXkQ6indx6O3XYCSPl0z77dQ
         MFBCIa1bUL7wpdTFQ1PKAXPZPMam0ovLzGMBdc9pNLghLadxcVJofNRwkaaAbFGPh1Sg
         rs8gg0SBWRAyiDWbOcLdoc3aAe0CWF1CU8pTJqyeTHvPX21CvmpVZMHjUrXPCd9Emf+J
         xrFOWF/75sVpzxf3WxlH8rgILd7CHMWbPQmL4w/aCznob7yCtBXvq68DH2chD7VYkOAQ
         ZrdA==
X-Forwarded-Encrypted: i=1; AL+hErHQhybwWyWdjKlPb4ZVUU7V5ilYh7xyVaWphYnCSqh8gZATP5AaxVzXV08fjFVUoAJIrliW9gytp7XRsM2WDUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3wdOwxkFjEVjPMgAqj+1A9GtWo6oN2d6dtMsn2qpfou0VpWnE
	IJa7OL4gla5rh5oeeFfgzqN92KOyO5fyB2wBSRwhLtsEokCGiTy3rqW0
X-Gm-Gg: AZFdTZeK+TrXOiA1PgNZMLM6I9bA789QSNOPAFK/UdFsZ97OzeA9knhzDeq3Ylj5vVx
	q+wacCW37TzHQiyneZGI44pLQzvfz7OEdipj3PJCJOcnJTmBJFVlUi4RhThwZxBDWYQaRQE5Y2t
	caafgd60/wNEK6uBjEhN/pBcjBoep1irqaGyJguysUmENFEvJHgolRtNWTIw1IGxaf4B9IcTycB
	wyQWMmxlt6ckRiUofa3LBw2Jo2Q7D7761uUJQIb5/nr6Mg6+YHdTOtl6vWOjWBzqcaQAs4RNSEH
	oql1eMMRgAJ2VA6yoMsqjDR7aiERjTUVbO2iVzhKnQaYnn01kTN0iDyS1xr/IDe5MBHnflkA7Vn
	tIyDFZZi1fYZfly4HL85JMhsETbt9BP925lMmx4ug+jVXHMaMoXYcgAUKmecucaZXIeBzVfF+e2
	FP0+kBrgST3AUYEWXWGHVnAzted49okVPXjaVIrorPjaCjkjobStz6LPtu2t/g4RH19M3f8aEqI
	Kv8LeHmfOvekQbxtbuDwkUGmh96R3GbZt6wqAgBbbnJJCGN7ufF4GncbwB1gWzxsNbccixXlmIb
	Lq0RGacgjmkpSie/7K2zjr1ekbO6PFAqK9wZY5qv1vRLrVIzHHJ+XJy7DQcHGvc/EKk6kunMN3w
	WUhPfwYaK425aQQYBORglyXVxH1Fvtocz8ZLTX5WR
X-Received: by 2002:a05:7300:f68e:b0:369:f291:49da with SMTP id 5a478bee46e88-38571814b1dmr8880157eec.40.1795343782479;
        Sun, 22 Nov 2026 02:36:22 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm26176803eec.9.2026.11.22.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:36:21 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ALSA: seq: ump: Don't drop MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
Date: Sun, 22 Nov 2026 19:36:10 +0900
Message-ID: <20261122103611.3264343-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122103611.3264343-1-sammiee5311@gmail.com>
References: <20261122103611.3264343-1-sammiee5311@gmail.com>
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

The cvt_ump_midi2_to_midi1() converts MIDI 2.0 channel voice messages
for a UMP MIDI 1.0 client. It has no case for the RPN and NRPN
messages, so they fall into the default case and are dropped. A pitch
bend range or a tuning set by a MIDI 2.0 client never reaches a MIDI 1.0
client.

The core converter, cvt_ump_midi2_to_legacy(), turns the same messages
into CC 101 and 100 (99 and 98 for NRPN) followed by CC 6 and 38. The
program change case here already sends the bank select CCs ahead of the
program in the same way.

To fix this, deliver the four CCs that cvt_ump_midi2_to_legacy()
produces.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index b42a7ffbf31e..e76fdb54df17 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -432,6 +432,38 @@ static int cvt_ump_midi1_to_midi2(struct snd_seq_client *dest,
 					      atomic, hop);
 }
 
+/* send a MIDI 2.0 RPN/NRPN as the four MIDI 1.0 CCs that select and set it */
+static int cvt_ump_midi2_rpn_to_midi1(struct snd_seq_client *dest,
+				      struct snd_seq_client_port *dest_port,
+				      struct snd_seq_ump_event *ev_cvt,
+				      const union snd_ump_midi2_msg *midi2,
+				      int atomic, int hop)
+{
+	union snd_ump_midi1_msg *midi1 = (union snd_ump_midi1_msg *)ev_cvt->ump;
+	bool rpn = midi2->rpn.status == UMP_MSG_STATUS_RPN;
+	u16 v = downscale_32_to_14bit(midi2->rpn.data);
+	const unsigned char cc[4][2] = {
+		{ rpn ? UMP_CC_RPN_MSB : UMP_CC_NRPN_MSB, midi2->rpn.bank },
+		{ rpn ? UMP_CC_RPN_LSB : UMP_CC_NRPN_LSB, midi2->rpn.index },
+		{ UMP_CC_DATA, v >> 7 },
+		{ UMP_CC_DATA_LSB, v & 0x7f },
+	};
+	int i, err = 0;
+
+	midi1->cc.status = UMP_MSG_STATUS_CC;
+	for (i = 0; i < ARRAY_SIZE(cc); i++) {
+		midi1->cc.index = cc[i][0];
+		midi1->cc.data = cc[i][1];
+		err = __snd_seq_deliver_single_event(dest, dest_port,
+						     (struct snd_seq_event *)ev_cvt,
+						     atomic, hop);
+		if (err < 0)
+			return err;
+	}
+
+	return err;
+}
+
 /* convert UMP packet from MIDI 2.0 to MIDI 1.0 and deliver it */
 static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 				  struct snd_seq_client_port *dest_port,
@@ -499,6 +531,10 @@ static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 		midi1->pb.data_msb = v >> 7;
 		midi1->pb.data_lsb = v & 0x7f;
 		break;
+	case UMP_MSG_STATUS_RPN:
+	case UMP_MSG_STATUS_NRPN:
+		return cvt_ump_midi2_rpn_to_midi1(dest, dest_port, &ev_cvt,
+						  midi2, atomic, hop);
 	default:
 		return 0;
 	}
-- 
2.43.0

